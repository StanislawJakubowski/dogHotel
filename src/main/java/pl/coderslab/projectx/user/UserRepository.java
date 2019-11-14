package pl.coderslab.projectx.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Book;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User findFirstByEmail(String email);

    List<User> findAllByCheckadminFalse();
}
