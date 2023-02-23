package com.actions.demo;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller

public class Controller {

    @GetMapping(value = "/")
    public String helloWorld(){
        return "Hello World!";
    }
}
