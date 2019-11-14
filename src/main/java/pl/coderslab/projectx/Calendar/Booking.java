package pl.coderslab.projectx.Calendar;


import pl.coderslab.projectx.dog.Dog;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Date;



@Entity
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Dog dog;

    private java.sql.Date checkinDate;

    private java.sql.Date checkoutDate;

    @NotNull
    private Boolean confirmByAdmin = false;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Dog getDog() {
        return dog;
    }

    public void setDog(Dog dog) {
        this.dog = dog;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public Boolean getConfirmByAdmin() {
        return confirmByAdmin;
    }

    public void setConfirmByAdmin(Boolean confirmByAdmin) {
        this.confirmByAdmin = confirmByAdmin;
    }
}
