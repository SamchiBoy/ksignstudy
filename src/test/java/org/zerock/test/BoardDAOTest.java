package org.zerock.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardDAOTest {
	@Inject
	private BoardDAO dao;

	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	/*@Test
	public void testCreate() throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("�� ���� �� �ִ´�.");
		board.setContents("�� ���� �ִ´�");
		board.setUserId("new admin01");
		dao.create(board);
	}*/
	
	/*@Test
	public void testRead() throws Exception {
		logger.info(dao.read(1).toString());
	}*/
	
	
	public void testUpdate() throws Exception{
		BoardVO board=new BoardVO();
		board.setBno(1);
	}
	
	@Test public void testDelete() throws Exception{
		dao.delete(1);
	}
	
	
	public void testListPage() throws Exception {
		int page=1;
		
		List<BoardVO> list = dao.listPage(page);
		for(BoardVO boardVO : list) {
			//logger.info(boardVO.getBno() + " : "+ boardVO.getTitle());
		}
	}
	
	
	public void testListCritera() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<BoardVO> list = dao.listCriteria(cri);
		
		for(BoardVO boardVO : list) {
			//logger.info(boardVO.getBno()+":"+boardVO.getTitle());
		}
	}
	
	/*@Test
	public void testURI() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno",12).queryParam("perPageNum", 20).build();
		
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}*/
	
	
}