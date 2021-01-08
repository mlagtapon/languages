package mari.languages.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import mari.languages.Models.Languages;

@Repository
public interface LanguagesRepository extends CrudRepository<Languages, Long>{
	List<Languages> findAll();
}
