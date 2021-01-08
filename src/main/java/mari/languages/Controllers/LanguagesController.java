package mari.languages.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mari.languages.Models.Languages;
import mari.languages.Services.LanguagesService;

@Controller

public class LanguagesController {
	private final LanguagesService langService;
	
	public LanguagesController(LanguagesService langService) {
		this.langService = langService;
	}
	
	@RequestMapping("/")
	  public String home() {
	     return "redirect:/languages";
	}
	@RequestMapping("/languages")
	  public String index(Model model, @ModelAttribute("languages") Languages languages) {
	      List<Languages> allLanguages = langService.allLanguages();
	      model.addAttribute("lang", allLanguages);
	      return "index.jsp";
	}

    @RequestMapping(value="/languages", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("languages") Languages languages, BindingResult result) {
        if (result.hasErrors()) {
            return "index.jsp";
        } else {
            langService.createLanguage(languages);
            return "redirect:/languages";
        }
    }
    
    @RequestMapping("/languages/{id}")
    public String showOne(@PathVariable("id") Long id, HttpServletRequest request, Model model) {
    	Languages oneLang = langService.findOne(id);
        model.addAttribute("lang", oneLang);
        return "show.jsp";
    }
    
    @RequestMapping("/languages/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
    	Languages editLang = langService.findOne(id);
        model.addAttribute("languages", editLang);
        return "edit.jsp";
    }
    
	@RequestMapping("/delete/{id}")
		public String deleteThis(@PathVariable("id") Long id) {
			langService.delete(id);
	        return "redirect:/languages";
	    }
    
    
    @RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
    	public String update(@Valid @ModelAttribute("languages") Languages languages, BindingResult result, @PathVariable("id") Long id, @RequestParam(value="name") String name, @RequestParam(value="creator") String creator, @RequestParam(value="currentVersion") double currentVersion) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            langService.update(id, name, creator, currentVersion);
            return "redirect:/languages";
        }
    }
}
