package com.ashconversion.controller;

import com.ashconversion.constants.RouteConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    @GetMapping("/")
    public String redirectToLogin() {
        // Redirige vers la page de connexion
        return "redirect:" + RouteConstants.LOGIN;
    }
}
