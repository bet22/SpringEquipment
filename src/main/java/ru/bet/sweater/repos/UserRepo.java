package ru.bet.sweater.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.bet.sweater.domain.User;

public interface UserRepo extends JpaRepository<User,Long> {
    User findByUsername(String username);
}
