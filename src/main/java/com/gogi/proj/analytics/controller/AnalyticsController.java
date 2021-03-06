package com.gogi.proj.analytics.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gogi.proj.analytics.model.AnalyticsService;
import com.gogi.proj.analytics.vo.LocalAreaVO;
import com.gogi.proj.another.vo.DatesVO;
import com.gogi.proj.configurations.model.ConfigurationService;
import com.gogi.proj.configurations.vo.StoreSectionVO;
import com.gogi.proj.orders.vo.OrdersVO;
import com.gogi.proj.paging.OrderSearchVO;
import com.gogi.proj.product.products.vo.ProductOptionVO;

@Controller
@RequestMapping(value = "/analytics")
public class AnalyticsController {

	@Autowired
	private AnalyticsService analyService;

	@Autowired
	private ConfigurationService configService;

	@RequestMapping(value = "/sevenday_total_sales_without_commsion.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> sevendaysTotalSalesWithoutCommisionMainPage() {
		OrderSearchVO osVO = new OrderSearchVO();

		return analyService.sevendaysTotalSalesWithoutCommision(osVO);
	}

	@RequestMapping(value = "/sevenday_total_sales.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> sevendaysTotalSalesMainPage() {
		OrderSearchVO osVO = new OrderSearchVO();

		return analyService.sevendaysTotalSales(osVO);
	}

	@RequestMapping(value = "/sevenday_sending_out.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> sevendaysSendingOutMainPage() {
		OrderSearchVO osVO = new OrderSearchVO();

		return analyService.sevendaysSendingOut(osVO);
	}

	@RequestMapping(value = "/six_month_total_sales.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> sixMonthTotalSalesMainPage() {
		OrderSearchVO osVO = new OrderSearchVO();

		return analyService.sixMonthTotalSales(osVO);
	}

	/**
	 * 
	 * @MethodName : selectSevenDaysOutPutProductQtyMainPage
	 * @date : 2020. 3. 6.
	 * @author : Jeon KiChan
	 * @return
	 * @??????????????? : 7?????? ????????? ?????? ??????
	 */
	@RequestMapping(value = "/seven_days_pro_qty.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> selectSevenDaysOutPutProductQtyMainPage() {

		return analyService.selectSevenDaysOutPutProductQty();
	}

	/**
	 * 
	 * @MethodName : analySearchListGet
	 * @date : 2020. 8. 5.
	 * @author : Jeon KiChan
	 * @param osVO
	 * @param model
	 * @return
	 * @??????????????? : ?????? ?????? ????????? ????????????
	 */
	@RequestMapping(value = "/analy_search_list.do", method = RequestMethod.GET)
	public String analySearchListGet(@ModelAttribute OrderSearchVO osVO, Model model) {

		if (osVO.getDateType() == null) {
			osVO.setDateType("or_regdate");
		}

		if (osVO.getDateStart() == null) {

			Calendar calendar = Calendar.getInstance();
			Calendar cal = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, -7);
			Date sevenDays = calendar.getTime();
			Date today = cal.getTime();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			osVO.setDateStart(sdf.format(sevenDays));
			osVO.setDateEnd(sdf.format(today));

		}

		// ????????? ??? ????????????
		List<StoreSectionVO> ssList = configService.selectStoreSectionList();

		model.addAttribute("ssList", ssList);
		model.addAttribute("osVO", osVO);

		return "admin/analy_search/analy_search_list";
	}

	/**
	 * 
	 * @MethodName : analySearchListPost
	 * @date : 2020. 8. 5.
	 * @author : Jeon KiChan
	 * @param osVO
	 * @param model
	 * @return
	 * @??????????????? : ?????? ?????? ????????? ????????????
	 */
	@RequestMapping(value = "/analy_search_list.do", method = RequestMethod.POST)
	public String analySearchListPost(@ModelAttribute OrderSearchVO osVO, Model model) {

		String[] wordSplit = osVO.getSsList().split(",");
		List<String> wordList = new ArrayList<String>();

		for (int j = 0; j < wordSplit.length; j++) {
			wordList.add(wordSplit[j]);
		}
		osVO.setSsPkList(wordList);

		List<Map<String, Object>> analyList = analyService.selectAnalyDataList(osVO);
		// ????????? ??? ????????????
		List<StoreSectionVO> ssList = configService.selectStoreSectionList();

		model.addAttribute("ssList", ssList);
		model.addAttribute("analyList", analyList);
		model.addAttribute("osVO", osVO);

		return "admin/analy_search/analy_search_list";
	}

	@RequestMapping(value = "/analy_search_excel_down.do", method = RequestMethod.POST)
	public ModelAndView anlaySearchResultExcelDown(@ModelAttribute OrderSearchVO osVO) {
		
		String[] wordSplit = osVO.getSsList().split(",");
		List<String> wordList = new ArrayList<String>();

		for (int j = 0; j < wordSplit.length; j++) {
			wordList.add(wordSplit[j]);
		}
		osVO.setSsPkList(wordList);

		List<Map<String, Object>> analyList = analyService.selectAnalyDataList(osVO);
		
		// ????????? ??????
		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// ???????????? ??????
		SXSSFSheet sheet = (SXSSFSheet) workbook.createSheet();
		// ??? ??????
		SXSSFRow row = (SXSSFRow) sheet.createRow(0);
		row.setHeight((short) 500);
		// ??? ??????
		SXSSFCell cell;

		String[] title = osVO.getGroupList().split(",");
		
		
		
		int HeaderCounting = 0;
		// ?????? ?????? ??????
		for (HeaderCounting = 0; HeaderCounting < title.length; HeaderCounting++) {
			cell = (SXSSFCell) row.createCell(HeaderCounting);
			cell.setCellValue(title[HeaderCounting]);

		}
		
		
		if(osVO.getTotalList() != null) {
			String[] titleSum =  osVO.getTotalList().split(",");
			
			for (int i = 0; i < titleSum.length; i++) {
				cell = (SXSSFCell) row.createCell(HeaderCounting);
				cell.setCellValue(titleSum[i]);
				HeaderCounting++;

			}
		}

		// ???????????? size ?????? row??? ??????

		int rowCounting = 0;
		int cellCounting = 1;
		
		for (int i = 0; i < analyList.size(); i++) {
			
			row = (SXSSFRow) sheet.createRow(cellCounting);
			
			for(Map.Entry m : analyList.get(i).entrySet()) {
				cell = (SXSSFCell) row.createCell(rowCounting);
				cell.setCellValue(m.getValue()+"");
				rowCounting++;
			}

			rowCounting = 0;
			cellCounting++;
		}

		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String filedate = sdf.format(day);
		String fileWrite = "?????? ?????? " + filedate + ".xlsx";

		// ????????? ?????? ????????? ??????
		File file = new File( fileWrite);
		FileOutputStream fos = null;

		try {
			fos = new FileOutputStream(file);
			workbook.write(fos);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {

				if (fos != null)
					fos.close();

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Map<String, Object> fileMap = new HashMap<String, Object>();
		fileMap.put("myfile", file);
		ModelAndView mav = new ModelAndView("downloadView", fileMap);

		return mav;

	}

	/**
	 * 
	 * @MethodName : reservProductGet
	 * @date : 2020. 9. 9.
	 * @author : Jeon KiChan
	 * @return
	 * @??????????????? : ???????????? ????????? ?????? ?????? ????????????, ?????? ????????? ?????????
	 */
	@RequestMapping(value="/reserv_product_qty.do", method=RequestMethod.GET)
	public String reservProductGet() {

		return "admin/analy_search/reserv_product_qty";
	}
	
	
	@RequestMapping(value="/reserv_product_qty_month.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> reservProductQty(@ModelAttribute DatesVO datesVO) {
		
		if(datesVO.getFormatMonth() == null) {
			Date date = new Date();
			SimpleDateFormat sdfY = new SimpleDateFormat("yyyy");
			SimpleDateFormat sdfM = new SimpleDateFormat("MM");
			
			String years = sdfY.format(date);
			String month = sdfM.format(date);
			
			datesVO.setFormatYear(years);
			datesVO.setFormatMonth(month);
		}
		
		System.out.println(datesVO.toString());
		
		List<Map<String, Object>> lists = analyService.selectReservProductQtyInMonth(datesVO);
		
		System.out.println(lists.size());
		
		return lists;
	}
	
	
	/**
	 * 
	 * @MethodName : reservProductPost
	 * @date : 2020. 9. 9.
	 * @author : Jeon KiChan
	 * @param osVO
	 * @param model
	 * @return
	 * @??????????????? : ???????????? ????????? ?????? ?????? ????????????
	 */
	@RequestMapping(value="/reserv_product_qty.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> reservProductPost(@ModelAttribute OrderSearchVO osVO) {
		
		return analyService.selectReservProductQty(osVO);
	}
	
	
	/**
	 * 
	 * @MethodName : selectTotalSalesByDates
	 * @date : 2020. 10. 13.
	 * @author : Jeon KiChan
	 * @param osVO
	 * @param model
	 * @return
	 * @??????????????? :  ???????????? ?????? ????????????
	 */
	@RequestMapping(value="/total_sales.do", method=RequestMethod.GET)
	public String selectTotalSalesByDates(@ModelAttribute OrderSearchVO osVO, Model model) {
		
		if(osVO.getDateStart() == null) {
			
			Calendar calendar = Calendar.getInstance();
			Calendar cal = Calendar.getInstance();
			calendar.add(Calendar.MONTH, -1);
			Date sevenDays = calendar.getTime();
			Date today = cal.getTime();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			osVO.setDateStart(sdf.format(sevenDays));
			osVO.setDateEnd(sdf.format(today));
			
		}
		
		List<OrdersVO> salesList = analyService.selectTotalSalesByDates(osVO);
		List<OrdersVO> canlcedList = analyService.selectCancledSalesByDates(osVO);
		
		model.addAttribute("osVO", osVO);
		model.addAttribute("salesList", salesList);
		model.addAttribute("canlcedList", canlcedList);
		
		return "admin/analy_search/total_sales";
	}
	
	/**
	 * 
	 * @MethodName : localAnalyticsGet
	 * @date : 2020. 10. 28.
	 * @author : Jeon KiChan
	 * @param osVO
	 * @param model
	 * @return
	 * @??????????????? : ????????? ?????? ?????? ????????????
	 */
	@RequestMapping(value="/local.do", method=RequestMethod.GET)
	public String localAnalyticsGet(@ModelAttribute OrderSearchVO osVO, Model model) {
		
		if(osVO.getDateStart() == null) {
			
			Calendar calendar = Calendar.getInstance();
			Calendar cal = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, -30);
			Date sevenDays = calendar.getTime();
			Date today = cal.getTime();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			osVO.setDateStart(sdf.format(sevenDays));
			osVO.setDateEnd(sdf.format(today));
			
		}

		List<OrdersVO> localList = analyService.selectLocalAreaAnalytics(osVO);
		
		model.addAttribute("localList",localList );
		model.addAttribute("osVO", osVO);
		
		return "admin/analy_search/local_analytics";
	}
	
	
	/**
	 * 
	 * @MethodName : localAnalyticsDetail
	 * @date : 2020. 10. 29.
	 * @author : Jeon KiChan
	 * @param osVO
	 * @param model
	 * @return
	 * @??????????????? : ?????? ?????? ????????????
	 */
	@RequestMapping(value="/local_deteail.do", method=RequestMethod.GET)
	public String localAnalyticsDetail(@ModelAttribute OrderSearchVO osVO, Model model) {
		
		List<LocalAreaVO> topProductList = analyService.sleectLocalAreaTopProducts(osVO);
		LocalAreaVO laVO = analyService.localAreaAnlayDetail(osVO);
		List<LocalAreaVO> inflowList = analyService.selectLocalAreaInflowRoute(osVO);
		
		
		model.addAttribute("topProductList", topProductList);
		model.addAttribute("osVO", osVO);
		model.addAttribute("laVO", laVO);
		model.addAttribute("inflowList", inflowList);
		
		return "admin/analy_search/local_analytics_detail";
	}
}
