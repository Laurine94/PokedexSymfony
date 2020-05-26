<?php

namespace App\Controller;

use App\Entity\PokemonExistant;
use App\Entity\PokemonType;
use App\Entity\Lieu;
use App\Form\PokemonExistantType;
use App\Repository\PokemonExistantRepository;
use App\Repository\LieuRepository;
use App\Repository\DresseurRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\DateTime;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

/**
 * @Route("/pokemon/existant")
 */
class PokemonExistantController extends AbstractController
{
    /**
     * @Route("/", name="pokemon_existant_index", methods={"GET"})
     */
    public function index(PokemonExistantRepository $pokemonExistantRepository): Response
    {

        $error="";
        return $this->render('pokemon_existant/index.html.twig', [
            'pokemon_existants' => $pokemonExistantRepository->getPokemonByDresseur($this->getUser()->getId()),
            'error'=>$error
            ]);
        }
        
        

        /**
         * @Route("/boutique", name="pokemon_boutique", methods={"GET","POST"})
         */
        public function boutique( PokemonExistantRepository $pokemonExistantRepository): Response
        {
            
            //dd($pokemonExistantRepository->getPokemonEnVenteByDresseur($this->getUser()->getId()));
            return $this->render('pokemon_existant/boutique.html.twig', [
                
                
                'pokemonVente'=> $pokemonExistantRepository->getPokemonEnVenteByDresseur($this->getUser()->getId()),
                'pieces'=> $this->getUser()->getPieces(),
                'error'=>""
                ]);
                
                
            }
            /**
             * @Route("/capture/{idPoke}/{id}", name="pokemon_capture", methods={"GET","POST"})
             * @ParamConverter("pokemonChasseur", options={"id" = "idPoke"})
            */
           public function capturer(PokemonExistant $pokemonChasseur,Request $request,Lieu $lieu, PokemonExistantRepository $pokemonExistantRepository): Response
           {
               //
               $tab=$pokemonExistantRepository->getPokemonByLieu($lieu->getId());
               $indexTab=rand( 0, sizeof($tab)-1);
               $idNewPokemon=$tab[$indexTab]["id"];
        
               $newPokemonType = $this->getDoctrine()
               ->getRepository(PokemonType::class)
               ->find($idNewPokemon);
        //dd($pokemonChasseur);
               $newPokemonExistant = new PokemonExistant($newPokemonType,$this->getUser());
               $niveauRandom=rand(1,100);
               $newPokemonExistant->setNiveau($niveauRandom);
        
               $pokemonChasseur->setDerniereChasse(new \DateTime('now'));
        
                   $entityManager = $this->getDoctrine()->getManager();
                   $entityManager->persist($newPokemonExistant);
                   $entityManager->flush();
        
                   return $this->redirectToRoute('pokemon_existant_show', array(
                    'id' => $newPokemonExistant->getId(),
                    ));
               
        
               
           }
            /**
             * @Route("/new", name="pokemon_existant_new", methods={"GET","POST"})
             */
    public function new(Request $request): Response
    {
        $pokemonExistant = new PokemonExistant();
        $form = $this->createForm(PokemonExistantType::class, $pokemonExistant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemonExistant);
            $entityManager->flush();

            return $this->redirectToRoute('pokemon_existant_index');
        }

        return $this->render('pokemon_existant/new.html.twig', [
            'pokemon_existant' => $pokemonExistant,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="pokemon_existant_show", methods={"GET"})
     */
    public function show(PokemonExistant $pokemonExistant,PokemonExistantRepository $pokemonExistantRepository): Response
    {
        
        if($pokemonExistant->getPrix()>0){
            $error="Votre pokemon est en vente, vous ne pouvez plus l'entrainer!";
            $disabled="true";
        }
        else{
            $error="";
            $disabled="false";
        }
        return $this->render('pokemon_existant/show.html.twig', [
            'pokemon_existant' => $pokemonExistant,
            'error'=>$error,
            'disabled'=>$disabled,
            'name'=>$pokemonExistant->getPokemonType()->getNom()
        ]);
    }


    
    /**
     * @Route("/{id}/achat", name="pokemon_achat", methods={"GET"})
     */
    public function achat(PokemonExistant $pokemonExistant,PokemonExistantRepository $pokemonExistantRepository): Response
    {
        //dd($pokemonExistant->getDresseur()->getId());
        if($this->getUser()->getPieces()>=$pokemonExistant->getPrix()){
            $this->getUser()->setPieces($this->getUser()->getPieces()-$pokemonExistant->getPrix());
           
            $pokemonExistant->getDresseur()->setPieces($pokemonExistant->getPrix()+$pokemonExistant->getDresseur()->getPieces());

            $pokemonExistant->setDresseur($this->getUser());

            $pokemonExistant->setPrix(0);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($pokemonExistant);
            $entityManager->flush();
            $error="";
        }
        else{
            $error="Vous n'avez pas assez de pieces...";
        }
        return $this->render('pokemon_existant/boutique.html.twig', [
            'pokemon_existant' => $pokemonExistant,
            'error'=>$error,
            'pokemonVente'=> $pokemonExistantRepository->getPokemonEnVenteByDresseur($this->getUser()->getId()),
            'pieces'=> $this->getUser()->getPieces(),
        ]);
    }

    /**
     * @Route("/{id}/entrainer", name="pokemon_existant_entrainement", methods={"GET"})
     */
    public function entrainer(PokemonExistant $pokemonExistant, PokemonExistantRepository $pokemonExistantRepository): Response
    {
        $courbe=$pokemonExistantRepository->getCourbePokemon($this->getUser()->getId(),$pokemonExistant->getId());
        if($pokemonExistant->getDernierEntrainement()== null){
            $diff = 0;
        }else{
            $diff=$this->checkUneHeureIntervalle($pokemonExistant->getDernierEntrainement());
        }
        //dd($diff);
        if($pokemonExistant->getDernierEntrainement()== null || $diff<=0){
            
            $pokemonExistant->setXp($pokemonExistant->getXp()+random_int ( 10 , 30 ));
           
            $pokemonExistant->setDernierEntrainement(new \DateTime('now'));
            $entityManager = $this->getDoctrine()->getManager();


            $this->gainExperience($courbe,$pokemonExistant);

            $entityManager->persist($pokemonExistant);
            $entityManager->flush();
            $error="";


        }
        

       else {
            $error="Vous ne pouvez entrainer votre pokemon plus d'une fois par heure!";
          
        }
        return $this->render('pokemon_existant/show.html.twig', [
            'pokemon_existant' => $pokemonExistant,
            'error'=>$error,
            'disabled'=>"false",
            'name'=>$pokemonExistant->getPokemonType()->getNom()
        ]);
    }

    /**
     * @Route("/{id}/chasser", name="pokemon_existant_chasser", methods={"GET"})
     */
    public function chasser(PokemonExistant $pokemonExistant, LieuRepository $repo): Response
    {
        
        if($pokemonExistant->getDernierEntrainement()== null || $pokemonExistant->getDerniereChasse()== null){
            $diffEntrainement = 0;
            $diffChasse=0;
        }
        else{
            $diffEntrainement=$this->checkUneHeureIntervalle($pokemonExistant->getDernierEntrainement());
            $diffChasse=$this->checkUneHeureIntervalle($pokemonExistant->getDerniereChasse());

        }
        if( $diffEntrainement<=0 && $diffChasse<=0){
            $error="";
            
           // dd($repo->findAll());
           
        }
        
        
        else {
            $error="Ce pokemon a chassé ou s'est entrainé il y a moins d'une heure.... Laissez le se reposer !";
           // return $this->redirectToRoute('pokemon_existant_index',['error'=>$error]);
        }
                        return $this->render('pokemon_existant/lieu.html.twig', [
                            'pokemon_existant' => $pokemonExistant,
                            'lieux'=>$repo->findAll(),
                            'error'=>$error
                        ]);
    }


        /**
     * @Route("/{id}/mettreEnVente", name="pokemon_existant_vente", methods={"GET","POST"})
     */
    public function mettreEnVente(PokemonExistant $pokemonExistant,Request $request): Response
    {
       
        $form = $this->createForm(PokemonExistantType::class, $pokemonExistant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $this->getDoctrine()->getManager()->flush();


            return $this->redirectToRoute('pokemon_existant_show', array(
                'id' => $pokemonExistant->getId(),
                ));
        }

        return $this->render('pokemon_existant/_form.html.twig', [
            'pokemon_existant' => $pokemonExistant,
            'form' => $form->createView(),
        ]);
    }


      /**
     * @Route("/{id}/retirerVente", name="pokemon_existant_retirer_vente", methods={"GET","POST"})
     */
    public function retirerVente(PokemonExistant $pokemonExistant,Request $request): Response
    {
       
        $pokemonExistant->setPrix(0);

            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('pokemon_existant_show', array(
                'id' => $pokemonExistant->getId(),
                ));
    }



    /**
     * @Route("/{id}/edit", name="pokemon_existant_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, PokemonExistant $pokemonExistant): Response
    {
        $form = $this->createForm(PokemonExistantType::class, $pokemonExistant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('pokemon_existant_index');
        }

        return $this->render('pokemon_existant/edit.html.twig', [
            'pokemon_existant' => $pokemonExistant,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="pokemon_existant_delete", methods={"DELETE"})
     */
    public function delete(Request $request, PokemonExistant $pokemonExistant): Response
    {
        if ($this->isCsrfTokenValid('delete'.$pokemonExistant->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($pokemonExistant);
            $entityManager->flush();
        }

        return $this->redirectToRoute('pokemon_existant_index');
    }

    public function checkUneHeureIntervalle($heureEntrainement){
        $now = new \DateTime('now');
      
        $diff = $now->diff($heureEntrainement);
        if($diff->y > 0 || $diff->m > 0 || $diff->d > 0 || $diff->h >0){
            return 0;
        }else{
            return (60 - $diff->i);
        }
    }

    public function gainExperience($cbXp,$pokemon){
        

        if($cbXp=="R"){
            $exp=0.8*pow($pokemon->getNiveau(),3);
        }
        elseif($cbXp=="M"){
            $exp=pow($pokemon->getNiveau(),3);
        }
        
        elseif($cbXp=="P"){
            $exp=1.2*pow($pokemon->getNiveau(),3)-15*pow($pokemon->getNiveau(),2)+100*$pokemon->getNiveau()-140;
        }
        else{
            $exp=1.25*pow($pokemon->getNiveau(),3);
        }
        if($exp <= $pokemon->getXp()){
            $pokemon->setNiveau($pokemon->getNiveau()+1);
            $pokemon->setXp($pokemon->getXp()-$exp);
            $this->gainExperience($cbXp,$pokemon);
        }

    }
}
