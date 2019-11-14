package pl.coderslab.projectx.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.projectx.Calendar.Booking;
import pl.coderslab.projectx.Calendar.BookingService;
import pl.coderslab.projectx.dog.DogService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admins")
public class userAdminController {

    private final UserService userService;
    private final DogService dogService;
    private final BookingService bookingService;

    public userAdminController(UserService userService, DogService dogService, BookingService bookingService) {
        this.userService = userService;
        this.dogService = dogService;
        this.bookingService = bookingService;
    }

    @GetMapping("/home")
    public String start(Model model, HttpSession session) {

        model.addAttribute("user", session.getAttribute("userLoged"));
        return "admins/home";
    }

    @GetMapping("/list")
    public String getUsers (Model model,HttpSession session){
        model.addAttribute("user", session.getAttribute("userLoged"));
        model.addAttribute("users", userService.findAllByCheckadminFalse());
        return "admins/userList";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable long id){
        userService.delete(id);
        return "redirect:../list";
    }

    @GetMapping("/dogs/list")
    public String getDogs (Model model,HttpSession session){
        model.addAttribute("user", session.getAttribute("userLoged"));
        model.addAttribute("dogs", dogService.finaAll());

        return "admins/dogList";
    }

    @GetMapping("/dogs/delete/{id}")
    public String deleteDog(@PathVariable long id){
        dogService.delete(id);
        return "redirect:../list";
    }


    @GetMapping("/bookings/list")
    public String getBookings (Model model,HttpSession session){
        model.addAttribute("user", session.getAttribute("userLoged"));
        model.addAttribute("bookings", bookingService.findAllSorted());
        return "admins/bookingList";
    }

    @GetMapping("/bookings/list/{id}")
    public String getBookingsByDog (Model model, @PathVariable long id,HttpSession session){
        model.addAttribute("user", session.getAttribute("userLoged"));
        model.addAttribute("bookings", bookingService.findBookingsByDogId(id));
        return "admins/bookingList";
    }

    @GetMapping("/bookings/delete/{id}")
    public String deleteBooking(@PathVariable long id){
        bookingService.delete(id);
        return "redirect:../list";
    }

    @GetMapping("/bookings/edit/{id}")
    public String editBooking(Model model,@PathVariable long id){
        Booking booking = bookingService.findById(id);
        if (booking.getConfirmByAdmin()){
            booking.setConfirmByAdmin(false);
        }
        else {
            booking.setConfirmByAdmin(true);
        }
        bookingService.save(booking);

        return "redirect:../list";
    }

//    @PostMapping("/bookings/edit/{id}")
//    public String editBooking(@ModelAttribute Booking booking){
//
//        bookingService.update(booking);
//        return "redirect:../../dogs/list";
//    }





}
