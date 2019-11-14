package pl.coderslab.projectx.Calendar;

import org.springframework.stereotype.Service;
import pl.coderslab.projectx.dog.Dog;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class BookingService {
    public final BookingRepository bookingRepository;

    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public void save(Booking booking) {


        bookingRepository.save(booking);
    }

    public void update(Booking booking) {
        bookingRepository.save(booking);
    }

    public void delete(long id) {
        bookingRepository.deleteById(id);
    }

    public Booking findById(long id) {
        return bookingRepository.findById(id).orElse(null);
    }

    public List<Booking> finaAll() {
        return bookingRepository.findAll();
    }

    public List<Booking> findBookingsByDogId(long id) {
        return bookingRepository.findBookingsByDogId(id);
    }

    public List<Booking> findAllSorted() {
        return bookingRepository.findAllSorted();
    }
}
