package mari.languages.Controllers;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mari.languages.Models.Languages;
import mari.languages.Services.LanguagesService;

@RestController

public class LanguagesAPI {
	
	private final LanguagesService langService;
	
	public LanguagesAPI(LanguagesService langService) {
		this.langService = langService;
	}
	
    @RequestMapping("/api/languages")
    public List<Languages> all() {
        return langService.allLanguages();
    }
    
    @RequestMapping(value="/api/languages", method=RequestMethod.POST)
    public Languages create(@RequestParam(value="name") String name, @RequestParam(value="creator") String creator, @RequestParam(value="currentVersion") double currentVersion) {
        Languages lang = new Languages(name, creator, currentVersion);
        return langService.createLanguage(lang);
    }
    
    @RequestMapping("/api/languages/{id}")
    public Languages show(@PathVariable("id") Long id) {
        Languages showOne = langService.findOne(id);
        return showOne;
    }
    
    @RequestMapping(value="/api/languages/{id}", method=RequestMethod.PUT)
    public Languages update(@PathVariable("id") Long id, @RequestParam(value="name") String name, @RequestParam(value="creator") String creator, @RequestParam(value="currentVersion") double currentVersion) {
        Languages langEdit = langService.update(id, name, creator, currentVersion);
        return langEdit;
    }
    
    @RequestMapping(value="/api/languages/{id}", method=RequestMethod.DELETE)
    public Languages deleteThis(@PathVariable("id") Long id) {
        Languages langDelete = langService.delete(id);
        return langDelete;
    }
	
}
