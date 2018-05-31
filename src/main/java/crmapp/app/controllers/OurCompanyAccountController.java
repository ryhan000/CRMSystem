package crmapp.app.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import crmapp.app.entities.OurCompany;
import crmapp.app.entities.OurCompanyAccount;
import crmapp.app.repositories.OurCompanyAccountRepository;
import crmapp.app.repositories.OurCompanyRepository;

@RestController
@Transactional
@RequestMapping(value = "/api/our-companies/{companyId}/accounts")
public class OurCompanyAccountController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(OurCompanyAccountController.class);

	@Autowired
	private OurCompanyAccountRepository accountRepository;

	@Autowired
	private OurCompanyRepository companyRepository;

	@GetMapping(value = "", headers = HEADER_JSON)
	public ResponseEntity<List<OurCompanyAccount>> getAllOurCompanyAccountsByCompanyId(
			@PathVariable("companyId") int companyId) {
		logger.info(LOG_ENTER_METHOD + "getAllOurCompanyAccountsByCompanyId()" + LOG_CLOSE);
		List<OurCompanyAccount> accounts = accountRepository.findAllByOurCompanyId(companyId);
		if (accounts.size() == 0) {
			logger.info(LOG_ERROR + "OurCompanyAccounts were not found" + LOG_CLOSE);
			return new ResponseEntity<List<OurCompanyAccount>>(HttpStatus.NO_CONTENT);
		}
		logger.info(LOG_TEXT + "Count of OurCompanyAccounts: " + accounts.size() + LOG_CLOSE);
		logger.info(LOG_OUT_OF_METHOD + "getAllOurCompanyAccountsByCompanyId()" + LOG_CLOSE);
		return new ResponseEntity<List<OurCompanyAccount>>(accounts, HttpStatus.OK);
	}

	@GetMapping(value = "/{id}", headers = HEADER_JSON)
	public ResponseEntity<OurCompanyAccount> getOurCompanyAccountById(@PathVariable(PARAM_ID) int id) {
		logger.info(LOG_ENTER_METHOD + "getOurCompanyAccountById()" + LOG_CLOSE);
		OurCompanyAccount account = accountRepository.findOne(id);
		if (account == null) {
			logger.info(LOG_ERROR + "OurCompanyAccount with ID=" + id + "wasn't found" + LOG_CLOSE);
			return new ResponseEntity<OurCompanyAccount>(account, HttpStatus.NOT_FOUND);
		}
		logger.info(LOG_TEXT + "OurCompanyAccount with ID=" + id + " was found: " + account + LOG_CLOSE);
		logger.info(LOG_OUT_OF_METHOD + "getOurCompanyAccountById()" + LOG_CLOSE);
		return new ResponseEntity<OurCompanyAccount>(account, HttpStatus.OK);
	}

	@PostMapping(value = "", headers = HEADER_JSON)
	public ResponseEntity<OurCompanyAccount> addOurCompanyAccount(@PathVariable("companyId") int companyId,
			@RequestBody OurCompanyAccount account) {
		logger.info(LOG_ENTER_METHOD + "addOurCompanyAccount()" + LOG_CLOSE);
		OurCompany company = companyRepository.findOne(companyId);
		logger.info(LOG_TEXT + "Obtained OurCompany with ID = " + company.getId() + LOG_CLOSE);
		account.setOurCompany(company);
		account.setVersion(0);
		account = accountRepository.save(account);
		logger.info(LOG_TEXT + "OurCompanyAccount added with ID=" + account.getId() + LOG_CLOSE);
		HttpHeaders header = new HttpHeaders();
		logger.info(LOG_OUT_OF_METHOD + "addOurCompanyAccount()" + LOG_CLOSE);
		return new ResponseEntity<OurCompanyAccount>(account, header, HttpStatus.CREATED);
	}

	@PutMapping(value = "/{id}", headers = HEADER_JSON)
	public ResponseEntity<OurCompanyAccount> updateOurCompanyAccount(@PathVariable("companyId") int companyId,
			@RequestBody OurCompanyAccount account) {
		logger.info(LOG_ENTER_METHOD + "updateOurCompanyAccount()" + LOG_CLOSE);
		OurCompany company = companyRepository.findOne(companyId);
		account.setOurCompany(company);
		logger.info(LOG_TEXT + "OurCompany is setted to " + company + LOG_CLOSE);
		int actualVersionNumber = accountRepository.getOne(account.getId()).getVersion();
		account.setVersion(actualVersionNumber);
		account = accountRepository.save(account);
		logger.info(LOG_TEXT + "OurCompanyAccount was updated: " + account + LOG_CLOSE);
		HttpHeaders header = new HttpHeaders();
		logger.info(LOG_OUT_OF_METHOD + "updateOurCompanyAccount()" + LOG_CLOSE);
		return new ResponseEntity<OurCompanyAccount>(account, header, HttpStatus.OK);
	}

	@DeleteMapping(value = "/{id}", headers = HEADER_JSON)
	public ResponseEntity<Void> deleteOurCompanyAccount(@PathVariable(PARAM_ID) int id) {
		logger.info(LOG_ENTER_METHOD + "deleteOurCompanyAccount()" + LOG_CLOSE);
		accountRepository.delete(id);
		logger.info(LOG_TEXT + "OurCompanyAccount with ID=" + id + " was deleted" + LOG_CLOSE);
		HttpHeaders header = new HttpHeaders();
		logger.info(LOG_OUT_OF_METHOD + "deleteOurCompanyAccount()" + LOG_CLOSE);
		return new ResponseEntity<Void>(header, HttpStatus.NO_CONTENT);
	}

}