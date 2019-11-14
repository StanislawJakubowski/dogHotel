package pl.coderslab.projectx.user;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/home")
    public String start(Model model, HttpSession session) {

        model.addAttribute("user", session.getAttribute("userLoged"));
        return "users/home";
    }

//
//    @GetMapping("/add")
//    public String addUser(Model model){
//        model.addAttribute("user", new User());
//        return "user";
//    }
//
//    @PostMapping("/add")
//    public String addUser(@Valid @ModelAttribute User user, BindingResult result){
//        if (result.hasErrors()) {
//            return "user";
//        }
//        userService.save(user);
//        return "redirect:list" ;
//    }
//    @GetMapping("/list")
//    public String getUsers (Model model){
//        model.addAttribute("users", userService.finaAll());
//        return "userList";
//    }
//
//    @GetMapping("/edit/{id}")
//    public String editUser(Model model,@PathVariable long id){
//        User user = userService.findById(id);
//        model.addAttribute("user", user);
//        return "user";
//    }
//
//    @PostMapping("/edit/{id}")
//    public String editUser(@ModelAttribute User user){
//        userService.update(user);
//        return "redirect:../list";
//    }
//
//    @GetMapping("/delete/{id}")
//    public String delete(@PathVariable long id){
//        userService.delete(id);
//        return "redirect:../list";
//    }
}
