package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	/*
	 * @RequestMapping(value="/register",method=RequestMethod.GET) public void
	 * registerGET(BoardVO board, Model model) throws Exception {
	 * logger.info("register get..................."); }
	 */

	@RequestMapping(value = "/register", method = { RequestMethod.POST, RequestMethod.GET })
	public String registPOST(BoardVO board) throws Exception {
		System.out.println("This is /register");
		logger.info("regist post......................");
		//logger.info(board.toString());
		// model.addAttribute("result","success");
		return "/board/register";
		// return "redirect:/board/listAll";
		// "/board/success";
	}

	@RequestMapping(value = "/registerok")
	public String regist_func(BoardVO board) throws Exception {
		System.out.println("This is /registerok");
		service.regist(board);

		return "redirect:/board/listPage";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		System.out.println("This is /listall");
		logger.info("show all list.................");
		model.addAttribute("list", service.listAll());
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(BoardVO board, Model model) throws Exception {
		System.out.println("This is /read");
		int bno = board.getBno();
		System.out.println("read : " + bno);
		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public String remove(@RequestParam("bno") int bno, Model model) throws Exception {
		System.out.println("This is /remove");
		System.out.println("remove(bno) : " + bno);

		model.addAttribute("bno", bno);
		service.remove(bno);

		return "redirect:/board/listPage";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception {
		System.out.println("This is /modifyGET");
		logger.info("a..............");
		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board) throws Exception {
		System.out.println("This is /modifyPOST");
		logger.info("mod post.............");

		service.modify(board);

		return "redirect:/board/listPage";
	}

	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {
		System.out.println("This is /listCri");
		logger.info("show list page with Criteria..................");
		model.addAttribute("list", service.listCriteria(cri));
	}

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception {
		System.out.println("This is /listPage");
		logger.info(cri.toString());
		BoardVO board;
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//cri.setPage(pageMaker.getStartPage());
		
		model.addAttribute("list", service.listCriteria(cri));

		System.out.println("hmm... this is B.Controller - listPage");
		
		//pageMaker.setTotalCount(171);
		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		model.addAttribute(service.read(bno));
	}
}
