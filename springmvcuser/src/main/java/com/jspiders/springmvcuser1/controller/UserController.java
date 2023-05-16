package com.jspiders.springmvcuser1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspiders.springmvcuser1.pojo.UserPojo;
import com.jspiders.springmvcuser1.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@GetMapping("/home")
	public String home(@SessionAttribute (name="login",required = false)UserPojo login , ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		return "Home";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request, @RequestParam String username , @RequestParam String password , ModelMap map) {
		UserPojo pojo=service.login(username, password);
		if(pojo !=null) {
			HttpSession session=request.getSession();
			session.setAttribute("login", pojo);
			session.setMaxInactiveInterval(30);
			return "Home";
		}
		map.addAttribute("msg", "Inavlid username or password");
		return "Login";
	}
	
	@GetMapping("/new")
	public String newUser() {
		
		return "Registration";
	}

	@PostMapping("/new")
	public String newUser(@RequestParam String name, @RequestParam String email, @RequestParam long contact,
			@RequestParam String city, @RequestParam String username, @RequestParam String password, ModelMap map) {
		
		UserPojo user = service.add(name, email, contact, city, username, password);
		if (user != null) {
			map.addAttribute("user", user);
			map.addAttribute("msg", "new user inserted plz proceed to login....");
		} else {
			map.addAttribute("msg", "data not inserted....");
		}
		return "Login";

	}
	@GetMapping("/add")
	public String add(@SessionAttribute (name="login",required = false)UserPojo login , ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		return "AddUser";
	}

	@PostMapping("/add")
	public String adduser(@SessionAttribute (name="login",required = false)UserPojo login ,@RequestParam String name, @RequestParam String email, @RequestParam long contact,
			@RequestParam String city, @RequestParam String username, @RequestParam String password, ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		UserPojo user = service.add(name, email, contact, city, username, password);
		if (user != null) {
			map.addAttribute("user", user);
			map.addAttribute("msg", "user data inserted ....");
		} else {
			map.addAttribute("msg", "data not inserted....");
		}
		return "AddUser";

	}

	@GetMapping("/search")
	public String search(@SessionAttribute (name="login",required = false)UserPojo login , ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		return "SearchUser";
	}

	@PostMapping("/search")
	public String searchData(@SessionAttribute (name="login",required = false)UserPojo login ,@RequestParam int id, ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		UserPojo pojo = service.search(id);
		if (pojo != null) {
			map.addAttribute("pojo", pojo);
		} else {
			map.addAttribute("msg", "User details not found");
		}
		return "SearchUser";
	}

	@GetMapping("/remove")
	public String remove(@SessionAttribute (name="login",required = false)UserPojo login , ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		List<UserPojo> pojos = service.searchAll();
		map.addAttribute("pojos", pojos);
		return "RemoveUser";
	}

	@PostMapping("/remove")
	public String removeDetails(@SessionAttribute (name="login",required = false)UserPojo login , @RequestParam int id, ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		UserPojo pojo = service.remove(id);
		if (pojo != null) {
			map.addAttribute("msg", "User removed successfully");
			List<UserPojo> pojos = service.searchAll();
			map.addAttribute("pojos", pojos);
		}else {
		map.addAttribute("msg", "User data not found");
		}
		List<UserPojo> pojos = service.searchAll();
		map.addAttribute("pojos", pojos);
		return "RemoveUser";
	}


	@GetMapping("/update")
	public String Update(@SessionAttribute (name="login",required = false)UserPojo login , ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		List<UserPojo> pojos = service.searchAll();
		map.addAttribute("pojos", pojos);
		return "UpdateUser";
	}
	
	@PostMapping("/update")
	public String update(@SessionAttribute (name="login",required = false)UserPojo login ,@RequestParam int id,ModelMap map) {
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		UserPojo pojo = service.search(id);
		if(pojo !=null) {
			map.addAttribute("pojo", pojo);
			map.addAttribute("msg", "User details FOund...");
		}else
		{
			map.addAttribute("msg", "User data not found...");
			List<UserPojo> pojos = service.searchAll();
			map.addAttribute("pojos", pojos);
		}
		return "UpdateUser";
	}
	@PostMapping("/updateData")
	public String updateData(@SessionAttribute (name="login",required = false)UserPojo login ,@RequestParam int id , @RequestParam String name ,@RequestParam String email ,@RequestParam long contact , @RequestParam String city ,@RequestParam String username , @RequestParam String password , ModelMap map) {
		
		if(login==null) {
			map.addAttribute("msg", "Login first to proceed..");
			return "Login" ;
		}
		UserPojo pojo=service.search(id);
		if (pojo != null) {
			service.update(id, name, email, contact, city, username, password);
			map.addAttribute("msg", "User updated successfully..!!");
			List<UserPojo> pojos = service.searchAll();
			map.addAttribute("pojos", pojos);
		}		return "UpdateUser";
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session , ModelMap map) {
		session.invalidate();
		map.addAttribute("msg", "Successfully logged out.");
		return "Login";
	}
}
