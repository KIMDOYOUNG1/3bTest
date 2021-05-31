package com.gogi.proj.dy;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gogi.proj.dy.vo.testVO;
import com.gogi.proj.dy.vo.testVO2;
import com.gogi.proj.dy.vo.testVO3;
import com.gogi.proj.dy.vo.testVO4;
import com.gogi.proj.dy.vo.testVO5;
import com.gogi.proj.configurations.vo.StoreSectionVO;
import com.gogi.proj.dy.model.testService;

@Controller
public class DoYoungController {
	
	@Autowired
	private testService testService;
	
	@RequestMapping(value = "/doyounglogin.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request, @ModelAttribute testVO3 test, testVO test2, Model model) {
		
		System.out.println(test2.gettestname() + " " + test2.gettestpw());
		HttpSession session = request.getSession();
		String msg = "";
		String url = "/doyoungloginform.do";
		int result = testService.insac(test);
		int result2 = testService.isMM(test2);
		
		System.out.println("result = " + result + " result2 = " + result2);
		if(result2 != 0) {
			if(result != 0) { 
		}	
	}
		else {
			msg = "아이디 또는 비밀번호가 맞지않습니다.";
			 model.addAttribute("msg",msg);			
			 model.addAttribute("url",url);
			 return "common/message";
		}
		session.setAttribute("ss", test.getAcname());
		
		
		return "redirect:/doyoungpdown.do";
	}
	
	@RequestMapping(value = "/doyoungpdown.do", method = RequestMethod.GET)
	public String pdown(HttpServletRequest request, @ModelAttribute testVO3 test, Model model) {
		
		
		

		
		return "doyoungpdown";
	}
	
	@RequestMapping(value = "/doyoungloginform.do", method = RequestMethod.GET)
	public String loginform(HttpServletRequest request, @ModelAttribute testVO3 test, Model model) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("ss");
		
		return "doyounglogin";
	}
	
	@RequestMapping(value = "/doyoungspdelete.do", method = RequestMethod.GET)
	public String spdelete(@ModelAttribute testVO4 test, Model model) {
		System.out.println(test.getSpName());
		String msg;
		String url = "/doyoungview.do";
		if(test.getSpName().equals("루니")) {
			msg = "레전드 선수는 삭제하실 수 없습니다.";
			model.addAttribute("msg", msg);
	        model.addAttribute("url", url);
			return "common/message";
		}else {
		int result = testService.spdelete(test);
		if(result != 0) {
			msg = "삭제가 완료되었습니다.";
		}else {
			msg = "해당 선수가 존재하지 않습니다.";
		}
		model.addAttribute("msg", msg);
        model.addAttribute("url", url);
		return "common/message";
		}


	}
	
	@RequestMapping(value = "/doyoungupdateform.do", method = RequestMethod.GET)
	public String updateform(@ModelAttribute testVO4 test, Model model) {
						
		System.out.println(test.getSpName());
		
		String spName = test.getSpName();
		
		model.addAttribute("spName",spName);
		
		return "doyoungspupdate";
		


	}
	
	@RequestMapping(value = "/doyoungupdate.do", method = RequestMethod.GET)
	public String update(@ModelAttribute testVO4 test, Model model) {
		
		
		
		String msg;
		String url = "/doyoungspsal.do?spName="+test.getSpName2();
		
		int result = testService.spupdate(test);
		
		if(result != 0) {
			msg = "변경이 완료되었습니다.";
		}else {
			msg = "변경 실패하였습니다.";
			return "/doyoungview.do";
		}
		model.addAttribute("msg", msg);
        model.addAttribute("url", url);
		
        return "common/message";

	}
	
	
	@RequestMapping(value = "/doyounghome.do", method = RequestMethod.GET)
	public String home(HttpServletRequest request, @ModelAttribute testVO test, testVO4 test2, Model model) {
		
		
		
		List<testVO> seMM = testService.seMM();
		List<testVO4> spsal = testService.spsal(test2);
		
		List<Integer> listtest = new ArrayList<>();
		
		listtest.add(1);
		listtest.add(2);
		
		String str = "Wlecome to 3bgogi";
		
		System.out.println(str.matches("(.*)3bgo(.*)"));
		
	System.out.println(listtest);
		
		model.addAttribute("seMM",seMM);
		model.addAttribute("spsal",spsal);
		return "doyounghome";
	}
	
	
	@RequestMapping(value = "/doyoungview.do", method = RequestMethod.GET)
	public String spList(HttpServletRequest request, @ModelAttribute testVO test,testVO5 test5 ,testVO4 test2, Model model) {
		
		
		int sp = testService.totalsp(test2);
		String spName = test2.getSpName();
		List<testVO4> spsal = testService.spsal(test2);
		
		
		model.addAttribute("spsal",spsal);
		model.addAttribute("sp",sp);
		model.addAttribute("spName",spName);
		return "doyoungview";
	}
	
	@RequestMapping(value = "/doyoungnationList.do", method = RequestMethod.GET)
	public String nationList(HttpServletRequest request, @ModelAttribute testVO5 test, testVO4 test2, Model model) {
		
		
		List<testVO5> nationList = testService.nationList(test);
		
		model.addAttribute("nationList",nationList);
		
		return "doyoungnation";
	}
	
	@RequestMapping(value = "/doyoungview2.do", method = RequestMethod.GET)
	public String spList2(HttpServletRequest request, @ModelAttribute testVO test, testVO4 test2, Model model) {
		
		
		int sp = testService.totalsp(test2);
		
		List<testVO4> spsal = testService.spsal(test2);
		
		model.addAttribute("spsal",spsal);
		model.addAttribute("sp",sp);
		return "doyoungview2";
	}
	
	@RequestMapping(value = "/doyounginsnation.do", method = RequestMethod.GET)
	public String insnation(HttpServletRequest request, @ModelAttribute testVO5 test, Model model) {
		
		String msg = "";
		String url = "/doyoungnationList.do";
		
		int result = testService.insnation(test);
		
		if(result != 0) {
			msg = "등록이 완료되었습니다.";
		}else {
			msg = "등록에 실패하였습니다.";
		}
	model.addAttribute("msg", msg);
	model.addAttribute("url", url);
	return "common/message";
	}
	
	@RequestMapping(value = "/doyoungspsalinsert.do", method = RequestMethod.GET)
	public String sqsalinsert(HttpServletRequest request, @ModelAttribute testVO test, testVO4 test2, Model model) {
		
		String msg = "";
		String url = "/doyoungview.do";
		List<testVO4> spsal = testService.spsal(test2);
		
		for(int i = 0; i < spsal.size(); i ++) {
			String a = spsal.get(i).getSpName().toString();
			System.out.println(a);
			if(a.contains(test2.getSpName())) {
				msg = "이미 추가 된 선수입니다.";
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "common/message";
			}
		}
				
		if(test2.getSpName().equals("린가드") || test2.getSpName().equals("아마드")) {
			if(test2.getSpName().equals("린가드")) {
				msg = "현재 임대중이므로 스쿼드에 추가할 수 없습니다.";
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "common/message";				
			}else if(test2.getSpName().equals("아마드")) {
				msg = "현재 U23 에서 활약중입니다.";
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "common/message";				

			}
		}else if(!test2.getSpName().equals("린가드")){
			int result = testService.insspsal(test2);
			if(result != 0) {
				msg = "등록이 완료되었습니다.";
			}else {
				msg = "등록에 실패하였습니다.";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	@RequestMapping(value = "/doyoungspsal.do", method = RequestMethod.GET)
	public String spsal(HttpServletRequest request, @ModelAttribute testVO test, testVO4 test2, Model model) {
		String msg;
		String url = "/doyounghome.do";
		
		System.out.println(test2.getSpName());
		List<testVO4> spsalOne = testService.spsalOne(test2);
		String spName = test2.getSpName();
		int result = testService.spfalse(test2);
		System.out.println(result);
		
		if(test2.getSpName().equals("마샬")) {
			msg = "이 선수는 열람이 불가능합니다.";
			model.addAttribute("msg", msg);
	        model.addAttribute("url", url);
			return "common/message";
		}
		model.addAttribute("spsalOne",spsalOne);
		model.addAttribute("spName",spName);
		return "doyoungspsal";
	}
	
	@RequestMapping(value = "/doyoung.do", method = RequestMethod.GET)
	public String insert(@ModelAttribute testVO test,Model model) {

		String msg;
		String url = "/doyoungloginform.do";
		int result = testService.insMM(test);
		System.out.println(result);
		if(result != 0) {
			System.out.println("성공");
			msg = test.gettestname() + " 님 회원가입이 완료되었습니다.";
		}else {
			System.out.println("실패");
			msg = "회원 가입에 실패하였습니다.";
		}
		model.addAttribute("msg", msg);
        model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping(value = "/doyoungselect.do", method = RequestMethod.GET)
	public String select(@ModelAttribute testVO test,testVO2 test2,Model model) {
		System.out.println(test2.getTbnumber());
		
		List<testVO> seMM = testService.seMM();
		List<testVO2> boardview = testService.boardview(test2);		
		
		model.addAttribute("seMM",seMM);
		model.addAttribute("boardview",boardview);
		
		return "doyounghome2";
	}
	
	@RequestMapping(value = "/doyoungboardinsert.do", method = RequestMethod.GET)
	public String board(@ModelAttribute testVO test, Model model) {

		
			
		int result = testService.insBoard(test);
		
		if(result != 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}

		
		return "doyounghome";
	}
	
	@RequestMapping(value = "/doyoungselect2.do", method = RequestMethod.GET)
	public String select2(@ModelAttribute testVO2 test2,Model model) {
		
		System.out.println(test2.getTbnumber());
		
		if(test2.getTbnumber() == "") {
			System.out.println("실패");
			return "doyounghome2";
		}else {
		List<testVO2> boardviewOne = testService.boardviewOne(test2);		
		System.out.println(boardviewOne);
		model.addAttribute("boardviewOne",boardviewOne);
		
		
		return "doyounghome3";
		}
	}
	@RequestMapping(value= "/doyounghello.do", method = RequestMethod.GET)
	public ModelAndView index(@ModelAttribute testVO4 test){
		List<testVO4> spsal = testService.spsal(test);
		Map<String, Object> testmap = new HashMap<String, Object>();
		testmap.put("hi", spsal);
	ModelAndView mav = new ModelAndView("doyounghome", testmap);

	return mav;

	}

}
