package com.ashconversion.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Indique à Spring où trouver les fichiers statiques (css, images, js)
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("/assets/");
        
        // Aide à la résolution des ressources dans le dossier webapp
        registry.addResourceHandler("/**")
                .addResourceLocations("/");
    }
}