package ru.bet.Repos;

import org.springframework.data.repository.CrudRepository;
import ru.bet.domain.Message;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message,Long> {
    List<Message> findByIp(String ip);
}
