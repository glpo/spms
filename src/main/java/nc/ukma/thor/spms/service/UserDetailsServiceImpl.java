package nc.ukma.thor.spms.service;

import nc.ukma.thor.spms.entity.Role;
import nc.ukma.thor.spms.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
 
import java.util.HashSet;
import java.util.Set;
 
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
 
    @Autowired
    private UserService userService;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    	User user = userService.getUser(email);
        Set<GrantedAuthority> roles = new HashSet<>();
        roles.add(new SimpleGrantedAuthority(user.getRole().getName()));
      //  System.out.println(user.getRole().getName());
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(
        		user.getEmail(), user.getPassword(), roles);
 
        return userDetails;
    }
 
}