package pl.coderslab.projectx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pl.coderslab.projectx.filter.UserAuthFilter;

@SpringBootApplication
public class ProjectxApplication implements WebMvcConfigurer {

    public static void main(String[] args) {
        SpringApplication.run(ProjectxApplication.class, args);
    }

    @Bean
    public FilterRegistrationBean userFilter() {        //nazwa beana musi się różnić od nazwy filtra (mimo małych liter nie przepuści)
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new UserAuthFilter());      // tu setujemy nasz UserAuthFilter

        // In case you want the filter to apply to specific URL patterns only
        registration.addUrlPatterns("/users/*");
        registration.addUrlPatterns("/admins/*");
        return registration;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/*").addResourceLocations("/resources/");
    }

}
