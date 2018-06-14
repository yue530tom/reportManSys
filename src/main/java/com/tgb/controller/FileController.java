package com.tgb.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tgb.model.DocCategory;
import com.tgb.model.DocumentObject;
import com.tgb.service.DocumentService;

@Controller
public class FileController {

	@Autowired
	private DocumentService documentService;

	/*
	 * @Resource private DocCategoryService docCategoryService;
	 */
	private final int pageSize = 5;

	@RequestMapping(value = "/about")
	public String aboutMe(HttpServletRequest request) {
		return "/about";
	}

	@RequestMapping(value = "/uploadlink")
	public String viewCate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mo = new ModelAndView("success");
		List<DocCategory> list = new ArrayList<DocCategory>();
		try {
			JSONObject jsonObject = new JSONObject();
			list = documentService.getCategory();
			JSONArray jsonArray = new JSONArray();
			for (DocCategory docCategory : list) {
				JSONObject tem_jo = new JSONObject();
				tem_jo.put("id", docCategory.getId());
				tem_jo.put("cate_name", docCategory.getCate_name());
				jsonArray.put(tem_jo);
			}
			jsonObject.put("list", jsonArray);
			jsonObject.put("listSize", jsonArray.length());
			// response.setCharacterEncoding("UTF-8");
			// response.getWriter().write(jsonObject.toString());
			mo.addObject("category", jsonObject);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		// return mo;
		if (request.getSession().getAttribute("userName") == null) {
			return "/login";
		} else {
			return "/upload";
		}
	}

	@RequestMapping("/upload")
	public String upload(@RequestParam("myfiles") MultipartFile file, HttpServletRequest request,HttpServletResponse response,Model model)
			throws IOException, JSONException {
		DocumentObject documentObject = new DocumentObject();
		JSONObject jObj = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		if (file.isEmpty()) {
			System.out.println("文件未上传");
			jObj.put("errInfo", "noFile");
		} else {
			documentObject.setFileSize(file.getSize());
			documentObject.setFileType(file.getContentType());
			documentObject.setFileName(file.getOriginalFilename());
			documentObject.setSecondName(createtFileName(".pdf"));
			// documentObject.setFileCategory(Integer.valueOf(request.getParameter("select_filetype")));
			documentObject.setFileCategory(1);
			documentObject.setFilePath("WEB-INF/report/pdf");
			documentObject.setFileAuthor("admin");
			documentObject.setFileMark("mark");
			documentObject.setFileCreateDate(sdf.format(now));

			/*
			 * 判断文件是否存在
			 */
			Map<String, Object> filterMap = new HashMap<String, Object>();
			filterMap.put("fileName", file.getOriginalFilename());
			if (documentService.countByName(filterMap) != 0) {
				jObj.put("errInfo", "exist");
			} else {
				if (file.getContentType().toLowerCase().indexOf("pdf") == -1) {
					jObj.put("errInfo", "TpyeErr");
					System.out.println(file.getContentType());
				} else {
					jObj.put("errInfo", "notExist");
					String realPath = request.getSession().getServletContext().getRealPath("/report/pdf");
					System.out.println("文件上传路径: " + realPath);

					FileUtils.copyInputStreamToFile(file.getInputStream(),
							new File(realPath, documentObject.getSecondName()));

					documentService.save(documentObject);
				}
			}

		}
		jObj.put("filename", documentObject.getFileName());
		//response.setCharacterEncoding("UTF-8");
		//response.getWriter().write(jObj.toString());
		//ModelAndView mo = new ModelAndView("upload");
		model.addAttribute("fileobject", jObj);
		return "/upload";
	}

	@RequestMapping(value = "/reportList", method = RequestMethod.GET)
	public ModelAndView showSamples(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mo = new ModelAndView("report_list");
		return mo;
	}

	/**
	 * 
	 * @throws UnsupportedEncodingException
	 * @Title: filteSample @Description: 鏍锋湰绛涢�夈�傝繑鍥炴牱鏈垪琛ㄩ〉闈� @param @param
	 *         request @param @param response 璁惧畾鏂囦欢 @return void 杩斿洖绫诲瀷 @throws
	 */
	@RequestMapping(value = "/report_filter", method = RequestMethod.GET)
	public void filteSample(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, JSONException {
		request.setCharacterEncoding("utf-8");
		String filter = request.getParameter("filter");
		List<DocumentObject> list = new ArrayList<DocumentObject>();
		Map<String, Object> filterMap = new HashMap<String, Object>();
		try {
			if (filter != null) {
				JSONObject filterJson = new JSONObject(filter);
				if (filterJson.has("file_name")) {
					/*
					 * System.out.println(new
					 * String(filterJson.get("file_name").toString().getBytes(
					 * "iso8859-1"), "utf-8"));
					 * System.out.println(filterJson.get("file_name"));
					 */
					filterMap.put("file_name", filterJson.get("file_name"));
				}
				if (filterJson.has("editor")) {
					filterMap.put("editor", filterJson.get("editor"));
				}
				if (filterJson.has("edit_time")) {
					filterMap.put("edit_time", filterJson.get("edit_time").toString());
				}
				if (filterJson.has("status")) {
					filterMap.put("status", filterJson.get("status"));
				}
			}
			String page = request.getParameter("page");

			int start = 0;
			if (page != null) {
				JSONObject pageJo = new JSONObject(page);
				int curPage = Integer.parseInt(pageJo.get("cur_page").toString());
				start = (curPage + 1) * (int) pageSize;
			}

			JSONObject js = new JSONObject();
			int count = documentService.findAll(filterMap).size();// 获取总数
			int size = (int) Math.ceil((float) count / pageSize);
			if (size == 0) {
				size = 1;
			}
			js.put("page", size);
			// System.out.println("=======" + size);
			filterMap.put("start", start);
			filterMap.put("size", (int) pageSize);
			list = documentService.findAll(filterMap);
			JSONArray ja = new JSONArray();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (DocumentObject documentObjec : list) {
				JSONObject tem_jo = new JSONObject();
				tem_jo.put("file_name", formatStr(documentObjec.getFileName(), 50));
				tem_jo.put("file_id", documentObjec.getId());
				tem_jo.put("file_secondName", documentObjec.getSecondName());
				// tem_jo.put("edit_time", "xx");
				tem_jo.put("edit_time", documentObjec.getFileCreateDate());
				tem_jo.put("editor", documentObjec.getFileAuthor());
				tem_jo.put("file_type", formatStr(documentObjec.getFileType(), 30));
				tem_jo.put("file_category", documentObjec.getFileCategory());
				ja.put(tem_jo);
			}
			js.put("list", ja);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(js.toString());
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/reportLast", method = RequestMethod.GET)
	public ModelAndView showSamplesLast(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mo = new ModelAndView("newest");
		return mo;
	}
	
	@RequestMapping(value = "/reportLastRefresh", method = RequestMethod.GET)
	public void reportNewest(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		List<DocumentObject> list = new ArrayList<DocumentObject>();
		try {
			JSONObject js = new JSONObject();
			list = documentService.findLast();
			JSONArray ja = new JSONArray();
			for (DocumentObject documentObjec : list) {
				JSONObject tem_jo = new JSONObject();
				tem_jo.put("file_name", formatStr(documentObjec.getFileName(), 50));
				tem_jo.put("file_id", documentObjec.getId());
				tem_jo.put("file_secondName", documentObjec.getSecondName());
				// tem_jo.put("edit_time", "xx");
				tem_jo.put("edit_time", documentObjec.getFileCreateDate());
				tem_jo.put("editor", documentObjec.getFileAuthor());
				tem_jo.put("file_type", formatStr(documentObjec.getFileType(), 30));
				tem_jo.put("file_category", documentObjec.getFileCategory());
				ja.put(tem_jo);
			}
			js.put("list", ja);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(js.toString());
		} catch (

		JSONException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping(value = "/report/{file_id}")
	public String linkedABEvaPage(@PathVariable String file_id, HttpServletRequest request,
			HttpServletResponse response, Model model) throws JSONException {
		DocumentObject documentObject = documentService.findById(Integer.valueOf(file_id));
		JSONObject jObj = new JSONObject();
		if (documentObject == null) {
			jObj.put("filename", "");
		} else {
			jObj.put("filename", documentObject.getSecondName());
			System.out.println("fileName:" + documentObject.getFileName() + "\t" + documentObject.getSecondName());
		}
		//
		model.addAttribute("fileobject", jObj);
		return "viewreport";

	}

	public synchronized String createtFileName(String fileFix) {
		java.util.Date dt = new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String fileName = fmt.format(dt) + fileFix;
		return fileName;
	}

	public String formatStr(String srcStr, int len) {
		if (srcStr.length() <= len) {
			return srcStr;
		} else {
			return srcStr.substring(0, len - 3) + "...";
		}
	}

	@RequestMapping("/download/{file_id}")
	public ModelAndView download(@PathVariable String file_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DocumentObject documentObject = documentService.findById(Integer.valueOf(file_id));
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;

		String ctxPath = request.getSession().getServletContext().getRealPath("/report/pdf/");
		// 根据file_id获取file存储name
		String fileName = documentObject.getSecondName();
		// windows路径
		// String downLoadPath = ctxPath + "\\"+fileName;
		// linux路径
		String downLoadPath = ctxPath + "/" + fileName;
		System.out.println(downLoadPath);
		try {
			long fileLength = new File(downLoadPath).length();
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(documentObject.getFileName().getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
		return null;
	}
}
