<?php

namespace App\Entity;

use App\Repository\CaptureRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CaptureRepository::class)
 */
class Capture
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=ElementaryType::class, inversedBy="captures")
     */
    private $idTypeElementary;

    /**
     * @ORM\ManyToOne(targetEntity=Lieu::class, inversedBy="captures")
     */
    private $idLieu;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $estDansLeLieu;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIdTypeElementary(): ?ElementaryType
    {
        return $this->idTypeElementary;
    }

    public function setIdTypeElementary(?ElementaryType $idTypeElementary): self
    {
        $this->idTypeElementary = $idTypeElementary;

        return $this;
    }

    public function getIdLieu(): ?Lieu
    {
        return $this->idLieu;
    }

    public function setIdLieu(?Lieu $idLieu): self
    {
        $this->idLieu = $idLieu;

        return $this;
    }

    public function getEstDansLeLieu(): ?bool
    {
        return $this->estDansLeLieu;
    }

    public function setEstDansLeLieu(?bool $estDansLeLieu): self
    {
        $this->estDansLeLieu = $estDansLeLieu;

        return $this;
    }
}
