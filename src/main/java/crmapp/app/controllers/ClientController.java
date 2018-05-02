package crmapp.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import crmapp.app.entities.Client;
import crmapp.app.repositories.ClientRepository;

@RestController
@Transactional
@RequestMapping(value = "/api/clients")
public class ClientController extends BaseController {

	@Autowired
	private ClientRepository clientRepository;

	@GetMapping(value = REQUEST_MAPPING_EMPTY, headers = HEADER_JSON)
	public ResponseEntity<List<Client>> getAllClients() {
		List<Client> clients = clientRepository.findAll();
		if (clients.size() == 0) {
			return new ResponseEntity<List<Client>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Client>>(clients, HttpStatus.OK);
	}

	@GetMapping(value = REQUEST_MAPPING_BY_ID, headers = HEADER_JSON)
	public ResponseEntity<Client> getClientById(@PathVariable(PARAM_ID) int id) {
		Client client = clientRepository.findOne(id);
		if (client == null) {
			return new ResponseEntity<Client>(client, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Client>(client, HttpStatus.OK);
	}

	@PostMapping(value = REQUEST_MAPPING_EMPTY, headers = HEADER_JSON)
	public ResponseEntity<Void> addClient(@RequestBody Client client) {
		client.setVersion(0);
		client = clientRepository.save(client);
		HttpHeaders header = new HttpHeaders();
		return new ResponseEntity<Void>(header, HttpStatus.CREATED);
	}

	@PutMapping(value = "/{id}", headers = HEADER_JSON)
	public ResponseEntity<Void> updateClient(@PathVariable(PARAM_ID) int id, @RequestBody Client client) {
		client.setId(id);
		client.setVersion(clientRepository.getOne(id).getVersion());
		client = clientRepository.save(client);
		HttpHeaders header = new HttpHeaders();
		return new ResponseEntity<Void>(header, HttpStatus.OK);
	}

	@DeleteMapping(value = "/{id}", headers = HEADER_JSON)
	public ResponseEntity<Void> deleteClient(@PathVariable(PARAM_ID) int id) {
		clientRepository.delete(id);
		HttpHeaders header = new HttpHeaders();
		return new ResponseEntity<Void>(header, HttpStatus.NO_CONTENT);
	}
	
}
