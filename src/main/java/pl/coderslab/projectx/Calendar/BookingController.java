package pl.coderslab.projectx.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.projectx.dog.DogService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/users/bookings")
public class BookingController {

    private final BookingService bookingService;
    private final DogService dogService;

    public BookingController(BookingService bookingService, DogService dogService) {
        this.bookingService = bookingService;
        this.dogService = dogService;
    }

//    @ModelAttribute("dogs")
//    public List<Dog> dogs() {
//
//        return dogService.finaAll();
//    }

    @GetMapping("/add")
    public String addBooking(Model model, HttpSession session){

        String email = session.getAttribute("email").toString();
        model.addAttribute("dogs", dogService.finaAllByUserEmail(email));
        model.addAttribute("booking", new Booking());
        model.addAttribute("user", session.getAttribute("userLoged"));
        return "users/bookingAdd";
    }

    @PostMapping("/add")
    public String addBooking(@Valid @ModelAttribute Booking booking, BindingResult result){
        if (result.hasErrors()) {
            return "users/bookingAdd";
        }
        bookingService.save(booking);
        return "redirect:../home" ;
    }
    @GetMapping("/list/{id}")
    public String getBookings (Model model,@PathVariable long id, HttpSession session){
        model.addAttribute("user", session.getAttribute("userLoged"));
        model.addAttribute("bookings", bookingService.findBookingsByDogId(id));
        return "users/bookingList";
    }
    @GetMapping("/edit/{id}")
    public String editBooking(Model model,@PathVariable long id, HttpSession session){
        model.addAttribute("user", session.getAttribute("userLoged"));
        Booking booking = bookingService.findById(id);
        model.addAttribute("booking", booking);
        return "users/bookingEdit";
    }

    @PostMapping("/edit/{id}")
    public String editBooking(@ModelAttribute Booking booking){

        bookingService.update(booking);
        return "redirect:../../dogs/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id){
        bookingService.delete(id);
        return "redirect:../../dogs/list";
    }

}
