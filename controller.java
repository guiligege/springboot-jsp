package com.geekerit.springbootjsp;

import com.alibaba.fastjson.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //带回传参数
    @GetMapping("/index1")
    public String index1(Model model){
        model.addAttribute("name", "dalaoyang");
        return "index";
    }

    //json请求
    @ResponseBody
    @RequestMapping(value = "/json/data", method = RequestMethod.POST, produces ="application/json;charset=UTF-8")
    public String getByJSON(@RequestBody JSONObject jsonParam) {
        // 直接将json信息打印出来
        System.out.println(jsonParam.toJSONString());

        // 将获取的json数据封装一层，然后在给返回
        JSONObject result = new JSONObject();
        result.put("msg", "ok");
        result.put("method", "json");
        result.put("data", jsonParam);

        return result.toJSONString();
    }

}
