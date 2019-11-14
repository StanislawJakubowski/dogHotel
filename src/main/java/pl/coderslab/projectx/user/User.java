package pl.coderslab.projectx.user;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.projectx.dog.Dog;
import pl.coderslab.projectx.validate.LoginValidationGroup;
import pl.coderslab.projectx.validate.RegistryValidationGroup;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(groups={RegistryValidationGroup.class})
    private String firstName;

    @NotBlank(groups={RegistryValidationGroup.class})
    private String lastName;

    @Email(groups={RegistryValidationGroup.class, LoginValidationGroup.class})
    @NotBlank(groups={RegistryValidationGroup.class, LoginValidationGroup.class})
    private String email;

    @NotBlank(groups={RegistryValidationGroup.class, LoginValidationGroup.class})
    private String password;

    @Size(min = 9, max = 9)
    @NotBlank(groups={RegistryValidationGroup.class})
    private String phoneNumber;

    @NotBlank(groups={RegistryValidationGroup.class})
    private String adress;

    @OneToMany(mappedBy = "user",cascade = CascadeType.REMOVE)
    private List<Dog> dogs = new ArrayList<>();

    @NotNull
    private Boolean checkadmin = false;

    public void setPasswordHash(String password) {
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Dog> getDogs() {
        return dogs;
    }

    public void setDogs(List<Dog> dogs) {
        this.dogs = dogs;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public Boolean getCheckadmin() {
        return checkadmin;
    }

    public void setCheckadmin(Boolean checkadmin) {
        this.checkadmin = checkadmin;
    }
}
