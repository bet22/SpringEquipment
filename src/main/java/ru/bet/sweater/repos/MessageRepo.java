package ru.bet.sweater.repos;

import org.springframework.data.repository.CrudRepository;
import ru.bet.sweater.domain.Message;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {
    List<Message> findByCompany(String company);
    List<Message> findByTypeOfEquipment(String type);
    List<Message> findByCompanyAndTypeOfEquipment(String company, String type);
}
