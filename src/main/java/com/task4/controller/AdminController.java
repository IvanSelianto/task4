package com.task4.controller;

import com.task4.entity.Role;
import com.task4.entity.User;
import com.task4.repository.UserRepository;
import com.task4.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


@Controller
public class AdminController {
    private User user;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;

    private final String BLOCK = "block";
    private final String DELETE = "delete";
    private final String UNBLOCK = "unblock";
    private final String UNLOCKED_USER = "ROLE_UNLOCKED";
    private final String BLOCKED_USER = "ROLE_BLOCKED";


    @GetMapping("/admin")
    public String userList(Model model) {
        user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        user.setStatus("online");

        user.setLastLogin(String.valueOf(new java.sql.Timestamp(new Date().getTime())).replaceAll("\\.\\d+", ""));
        userRepository.save(user);
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }

    @PostMapping("/admin")
    public String deleteUser(HttpServletRequest request, @RequestParam(required = true, defaultValue = "") String action,
                             Model model) {
        String[] checkboxIds = request.getParameterValues("checkboxId");

        if (checkboxIds == null) {
            return "redirect:/admin";
        }
        replaceUserToEnd(checkboxIds);
        if (action.equals(BLOCK)) {
            return blockUser(checkboxIds);
        }
        if (action.equals(BLOCK)) {
            return blockUser(checkboxIds);
        }
        if (action.equals(BLOCK)) {
            return blockUser(checkboxIds);
        }
        switch (action) {
            case BLOCK:
                return blockUser(checkboxIds);
            case DELETE:
                return deleteUser(checkboxIds);
            case UNBLOCK:
                return unblockUser(checkboxIds);
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/gt/{userId}")
    public String gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }

    private void replaceUserToEnd(String[] checkboxNames) {
        if (Arrays.asList(checkboxNames).contains(Long.toString(user.getId()))) {
            int indexUser = Arrays.asList(checkboxNames).indexOf(String.valueOf(user.getId()));
            Collections.swap(Arrays.asList(checkboxNames), indexUser, checkboxNames.length - 1);
        }
    }

    private String deleteUser(String[] checkboxNames) {
        for (String checkboxName : checkboxNames) {
            if (user.getId() == Long.parseLong(checkboxName)) {
                userService.deleteUser(Long.parseLong(checkboxName));
                return "redirect:/logout";
            }
            userService.deleteUser(Long.parseLong(checkboxName));
        }
        return "redirect:/admin";
    }

    private String blockUser(String[] checkboxNames) {
        for (String checkboxName : checkboxNames) {
            User userById = userService.findUserById(Long.parseLong(checkboxName));
            if (user.getId() == Long.parseLong(checkboxName)) {
                userById.getRoles().clear();
                userById.getRoles().add(new Role(2L, BLOCKED_USER));
                userRepository.save(userById);
                return "redirect:/logout";
            }
            userById.getRoles().clear();
            userById.getRoles().add(new Role(2L, BLOCKED_USER));
            userRepository.save(userById);

        }
        return "redirect:/admin";
    }

    private String unblockUser(String[] checkboxNames) {

        for (String checkboxName : checkboxNames) {
            User userById = userService.findUserById(Long.parseLong(checkboxName));
            userById.getRoles().clear();
            userById.getRoles().add(new Role(1L, UNLOCKED_USER));
            userRepository.save(userById);
        }
        return "redirect:/admin";
    }
}

