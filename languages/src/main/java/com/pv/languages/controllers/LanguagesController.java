package com.pv.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.languages.models.Language;
import com.pv.languages.services.LanguageService;

@Controller
public class LanguagesController {
	
// inject service instance
	private final LanguageService languageService;
	
//dependency injection
	public LanguagesController(LanguageService languageService) {
		this.languageService = languageService;
	}
	
// all languages -- since create on same page model attribute needed to be added
	// use of this. still used
	@GetMapping("/languages")
	public String index(Model model, @ModelAttribute("language") Language language) {
		List<Language> lang = languageService.allLanguages();
		model.addAttribute("languages", lang);
		return "index.jsp";
	}
	
// create a language
	// variation to writing creation and find all - see notes
	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Language> lang = languageService.allLanguages();
			model.addAttribute("languages", lang);
			return "index.jsp";
		}
		else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}

// show one language
	@GetMapping("/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language lang = languageService.showLanguage(id);
		model.addAttribute("language", lang);
		return "show.jsp";
	}

// edit a language
	@GetMapping("/languages/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language lang = languageService.showLanguage(id);
		model.addAttribute("language", lang);
		return "edit.jsp";
	}

// update a language
	@PutMapping("/languages/{id}/edit")
	public String update(@Valid @ModelAttribute("language") Language language, @PathVariable("id") Long id, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Language lang = languageService.showLanguage(id);
			model.addAttribute("language", lang);
			return "edit.jsp";
		}
		else {
			languageService.updateLanguage(language);
		}
		return "redirect:/languages/{id}";
	}

// delete a language -- attempt 3
	@GetMapping("/languages/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
	
	
	
	
	
	// delete a language -- attempt 2
//	@RequestMapping(value="/languages/{id}/delete", method=RequestMethod.DELETE)
//	public String delete(@PathVariable("id") Long id) {
//		languageService.deleteLanguage(id);
//		return "redirect:/languages";
//	}
	
	
	// delete a language -- attempt 1
//	@DeleteMapping("/languages/{id}/delete")
//	public String delete(@PathVariable("id") Long id) {
//		languageService.deleteLanguage(id);
//		return "redirect:/languages";
//	}
// would require a form on the page
// noted from solution video
	// <form method="POST" action="/languages/${language.id}/delete">
	// <input type="hidden" name"_method" value="delete">
	// </form>
// questions -- does it require to be in a form and have a button for @DeleteMapping to work?
// noted -- should not use hidden inputs as a form of security
// is still visible  and can be edited using developer tools or view source functionality
	
}
