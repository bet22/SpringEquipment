package ru.bet.sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.bet.sweater.domain.Message;
import ru.bet.sweater.domain.User;
import ru.bet.sweater.repos.MessageRepo;
import ru.bet.sweater.repos.UserRepo;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "redirect:/main";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filterEquip,
            @RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepo.findAll();

        //Формируем элементы выподающего списка
        ArrayList<Message> messagesList = new ArrayList<>();
        for(Message str: messages) {
            messagesList.add(str);
        }

        ArrayList<String> arrCompany = new ArrayList<>();
        ArrayList<String> arrType = new ArrayList<>();

        for (int i = 0; i < messagesList.size(); i++){
            if (!arrCompany.contains(messagesList.get(i).getCompany())){
                arrCompany.add(messagesList.get(i).getCompany());
            }
            if (!arrType.contains(messagesList.get(i).getTypeOfEquipment())){
                arrType.add(messagesList.get(i).getTypeOfEquipment());
            }
        }

        if (filterEquip !=null && !filterEquip.isEmpty() && filter != null && !filter.isEmpty()){
            messages = messageRepo.findByCompanyAndTypeOfEquipment(filter, filterEquip);
        }else{
            if (filter != null && !filter.isEmpty()) {
                messages = messageRepo.findByCompany(filter);
            }else{
                if (filterEquip != null && !filterEquip.isEmpty()) {
                    messages = messageRepo.findByTypeOfEquipment(filterEquip);
                }else{
                    messages = messageRepo.findAll();
                }
            }
        }



        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        model.addAttribute("company",arrCompany);
        model.addAttribute("types", arrType);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User addUser,
            @RequestParam String title,
            @RequestParam String company,
            @RequestParam String typeOfEquipment,
            @RequestParam String ip,
            @RequestParam String mac,
            @RequestParam String login,
            @RequestParam String password,
            @RequestParam String location,
            @RequestParam  Map<String, Object> model
    ) {
        Message message = new Message(title, company, typeOfEquipment, ip, mac, login, password, location, addUser);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "main";
    }

    @GetMapping("/index")
    public String indedx(){
        return "/index";
    }

}