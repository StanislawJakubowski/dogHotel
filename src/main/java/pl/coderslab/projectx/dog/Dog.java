package pl.coderslab.projectx.dog;

import pl.coderslab.projectx.Calendar.Booking;
import pl.coderslab.projectx.user.User;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "dogs")
public class Dog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String name;

    @Enumerated(EnumType.STRING)
    private GenderType gender;

    private String race;

    @NotBlank
    private String weight;

    @NotNull
    private Boolean checkallergy = false;

    private String allergies;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "dog", cascade = CascadeType.REMOVE)
    private List<Booking> bookings = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public Boolean getCheckallergy() {
        return checkallergy;
    }

    public void setCheckallergy(Boolean checkallergy) {
        this.checkallergy = checkallergy;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
