<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200525210659 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE capture (id INT AUTO_INCREMENT NOT NULL, id_type_elementary_id INT DEFAULT NULL, id_lieu_id INT DEFAULT NULL, est_dans_le_lieu TINYINT(1) DEFAULT NULL, INDEX IDX_8BFEA6E5C39AA058 (id_type_elementary_id), INDEX IDX_8BFEA6E5B42FBABC (id_lieu_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE lieu (id INT AUTO_INCREMENT NOT NULL, nom_lieu VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE capture ADD CONSTRAINT FK_8BFEA6E5C39AA058 FOREIGN KEY (id_type_elementary_id) REFERENCES ref_elementary_type (id)');
        $this->addSql('ALTER TABLE capture ADD CONSTRAINT FK_8BFEA6E5B42FBABC FOREIGN KEY (id_lieu_id) REFERENCES lieu (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE capture DROP FOREIGN KEY FK_8BFEA6E5B42FBABC');
        $this->addSql('DROP TABLE capture');
        $this->addSql('DROP TABLE lieu');
    }
}
