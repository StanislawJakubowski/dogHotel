package pl.coderslab.projectx.filter;

import org.springframework.stereotype.Component;
import pl.coderslab.projectx.user.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// ściężkę url którą ma filtrować ustalamy tworząc Bean
@Component
public class UserAuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        User userLoged = (User) session.getAttribute("userLoged");

        if (userLoged == null) {
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            response.sendRedirect("/");
            return;
        }

        boolean isAdminRequest = request.getServletPath().startsWith("/admins");
        if ((isAdminRequest && userLoged.getCheckadmin()) || (!isAdminRequest && !userLoged.getCheckadmin())) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            response.sendRedirect("/");
        }

    }

    @Override
    public void destroy() {

    }
}
