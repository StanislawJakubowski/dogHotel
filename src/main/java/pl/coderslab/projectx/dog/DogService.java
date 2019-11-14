package pl.coderslab.projectx.dog;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class DogService {
    public final DogRepository dogRepository;

    public DogService(DogRepository dogRepository) {
        this.dogRepository = dogRepository;
    }

    public void save(Dog dog){
        dogRepository.save(dog);
    }
    public void update(Dog dog){
        dogRepository.save(dog);
    }
    public void delete(long id) {
        dogRepository.deleteById(id);
    }

    public Dog findById(long id) {
        return dogRepository.findById(id).orElse(null);
    }

    public List<Dog> finaAll(){
        return dogRepository.findAll();
    }

    public List<Dog> finaAllByUserEmail(String email){
        return dogRepository.findDogsByUser_Email(email);
    }

}
