package crmapp.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import crmapp.app.entities.ClientAgreement;

public interface ClientAgreementRepository extends JpaRepository<ClientAgreement, Integer>{

}