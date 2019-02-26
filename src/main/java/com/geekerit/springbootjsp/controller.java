package com.geekerit.springbootjsp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Aaryn [wr@fordearme.com]
 * @version 1.0
 * @date 2019/02/26
 */
@Controller
public class controller {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "index";
    }
}
