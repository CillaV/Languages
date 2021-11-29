package com.pv.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pv.languages.models.Language;
import com.pv.languages.repositories.LanguageRepository;

@Service
public class LanguageService {

	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	// note - make use of this.languageRepository instead of w/o this.
	
// returns all languages
	public List<Language> allLanguages() {
		return languageRepository.findAll();
	}
	
// create a language
	public Language createLanguage(Language c) {
		return languageRepository.save(c);
	}
	
// returns one language
	public Language showLanguage(Long id) {
		Optional<Language> optlang = languageRepository.findById(id);
		if (optlang.isPresent()) {
			return optlang.get();
		}
		else {
			return null;
		}
	}
	
// variation of find one language
//	public Language showLanguage(Long id) {
//		return this.languageRepository.findById(id).orElse(null);
//	}	
	
// update a language
	public Language updateLanguage(Language u) {
		return languageRepository.save(u);
	}
	
// delete a language
	public void deleteLanguage(Long id) {
		languageRepository.deleteById(id);
	}
}
