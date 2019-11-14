package pl.coderslab.projectx.user;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.projectx.validate.LoginValidationGroup;
import pl.coderslab.projectx.validate.RegistryValidationGroup;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.print.Book;

@Controller
@RequestMapping("/login")
public class UserLoginController {

    private final UserService userService;

    public UserLoginController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "login/register";
    }

    @PostMapping("/register")
    public String saveRegistrationForm(@Validated(RegistryValidationGroup.class) User user, BindingResult result, @RequestParam String password2) {
        if (result.hasErrors()) {
            return "login/register";
        }

        User existingUser = userService.findFirstByEmail(user.getEmail());
        if (existingUser != null) {
            result.addError(new FieldError("user", "email",
                    "Email już istenje"));
            return "login/register";
        }

        else if(!password2.equals(user.getPassword())) {
            result.addError(new FieldError("user", "password",
                    "Hasła nie są takie same"));
            return "login/register";
        }
        user.setPasswordHash(user.getPassword());
        userService.save(user);
        return "redirect:login";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login/login";
    }

    @PostMapping("/login")
    public String login(@Validated(LoginValidationGroup.class)
                                    User user, BindingResult result,
                                    HttpSession session) {
        if (result.hasErrors()) {
            return "login/login";
        }

        boolean loggedIn = true;
        User existingUser = userService.findFirstByEmail(user.getEmail());
        if (existingUser == null) {
            loggedIn = false;

        }
        else if (!BCrypt.checkpw(user.getPassword(),existingUser.getPassword())) {
            loggedIn = false;
        }

        if (!loggedIn) {
            result.addError(new FieldError("user", "email",
                    "Nieprawidłowy email lub hasło"));
            return "login/login";
        }

        session.setAttribute("email", user.getEmail());
        session.setAttribute("firstName", existingUser.getFirstName());
        session.setAttribute("userLoged", existingUser);

        if(existingUser.getCheckadmin()){
            return "redirect:/admins/home";
        }
        else {
            return "redirect:/users/home";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:/";
    }


}
