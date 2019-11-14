package pl.coderslab.projectx.dog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DogRepository extends JpaRepository<Dog,Long> {

    List<Dog> findDogsByUser_Email(String email);


}
