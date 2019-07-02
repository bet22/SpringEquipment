package ru.bet.Repos;


import org.springframework.data.jpa.repository.JpaRepository;
import ru.bet.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
