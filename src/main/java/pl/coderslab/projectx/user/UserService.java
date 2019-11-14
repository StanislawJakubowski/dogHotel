package pl.coderslab.projectx.user;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
public class UserService {
    public final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void save(User user) {
        userRepository.save(user);
    }

    public void update(User user) {
        userRepository.save(user);
    }

    public void delete(long id) {
        userRepository.deleteById(id);
    }

    public User findById(long id) {
        return userRepository.findById(id).orElse(null);
    }

    public List<User> finaAll(){
        return userRepository.findAll();
    }

    public User findFirstByEmail(String email){return userRepository.findFirstByEmail(email);}

    public List<User> findAllByCheckadminFalse(){return userRepository.findAllByCheckadminFalse();}
}
