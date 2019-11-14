package pl.coderslab.projectx.dog;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.projectx.user.User;
import pl.coderslab.projectx.user.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/users/dogs")
public class DogController {

    private final DogService dogService;
    private final UserService userService;

    public DogController(DogService dogService, UserService userService) {
        this.dogService = dogService;
        this.userService = userService;
    }

    @ModelAttribute("gender")
    public List<String> gender() {

        return Arrays.asList("suczka", "pies");
    }

    @ModelAttribute("users")
    public List<User> users() {

        return userService.finaAll();
    }

    @GetMapping("/add")
    public String addDog(Model model,HttpSession session){
        String email = session.getAttribute("email").toString();
        model.addAttribute("dog", new Dog());
        model.addAttribute("user", userService.findFirstByEmail(email));
        return "users/dog";
    }

    @PostMapping("/add")
    public String addDog(@Valid @ModelAttribute Dog dog, BindingResult result,HttpSession session){
        if (result.hasErrors()) {
            return "users/dog";
        }
        User userLoged = (User)session.getAttribute("userLoged");
        dog.setUser(userLoged);
        dogService.save(dog);
        return "redirect:list" ;
    }
    @GetMapping("/list")
    public String getDogs (Model model, HttpSession session){
        String email = session.getAttribute("email").toString();
        model.addAttribute("dogs", dogService.finaAllByUserEmail(email));
        model.addAttribute("user", userService.findFirstByEmail(email));
        return "users/dogList";
    }
    @GetMapping("/edit/{id}")
    public String editDog(Model model,@PathVariable long id, HttpSession session){
        String email = session.getAttribute("email").toString();
        Dog dog = dogService.findById(id);
        model.addAttribute("dog", dog);
        model.addAttribute("user", userService.findFirstByEmail(email));
        return "users/dog";
    }

    @PostMapping("/edit/{id}")
    public String editDog(@Valid @ModelAttribute Dog dog,HttpSession session){
        User userLoged = (User)session.getAttribute("userLoged");
        dog.setUser(userLoged);
        dogService.update(dog);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id){
        dogService.delete(id);
        return "redirect:../list";
    }

}
