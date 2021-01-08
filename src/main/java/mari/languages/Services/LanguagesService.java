package mari.languages.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import mari.languages.Models.Languages;
import mari.languages.Repositories.LanguagesRepository;

@Service
public class LanguagesService {
	private final LanguagesRepository langRepository;
	
	public LanguagesService(LanguagesRepository langRepository) {
		this.langRepository = langRepository;
	}
	
	public List<Languages> allLanguages(){
		return langRepository.findAll();
	}
	
	public Languages createLanguage(Languages lang) {
		return langRepository.save(lang);
	}
	
    public Languages findOne(Long id) {
        Optional<Languages> lang = langRepository.findById(id);
        if(lang.isPresent()) {
            return lang.get();
        } else {
            return null;
        }
    }
    
	public Languages update(Long id, String name, String creator, double version) {
		Languages lang2 = langRepository.findById(id).get();
            lang2.setName(name);
            lang2.setCreator(creator);
            lang2.setCurrentVersion(version);
            return langRepository.save(lang2);
	}
	
    public Languages delete(Long id) {
        langRepository.deleteById(id);
        return null;
    }

}
