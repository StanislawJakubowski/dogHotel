package pl.coderslab.projectx.Calendar;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.projectx.dog.Dog;

import java.util.List;

public interface BookingRepository extends JpaRepository<Booking,Long> {
    List<Booking> findBookingsByDogId (long id);

    @Query(value = "select * from bookings order by checkin_date ASC", nativeQuery = true)
    List<Booking> findAllSorted();
}
