package com.tgb.model;

public class DocumentObject {
	private long id;
	private String fileName;
	private String secondName;
	private String fileType;
	private long fileSize;
	private String fileCreateDate;
	private String fileAuthor;
	private String filePath;
	private int fileCategory;
	private String fileMark;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSecondName() {
		return secondName;
	}
	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileCreateDate() {
		return fileCreateDate;
	}
	public void setFileCreateDate(String fileCreateDate) {
		this.fileCreateDate = fileCreateDate;
	}
	public String getFileAuthor() {
		return fileAuthor;
	}
	public void setFileAuthor(String fileAuthor) {
		this.fileAuthor = fileAuthor;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileCategory() {
		return fileCategory;
	}
	public void setFileCategory(int fileCategory) {
		this.fileCategory = fileCategory;
	}
	public String getFileMark() {
		return fileMark;
	}
	public void setFileMark(String fileMark) {
		this.fileMark = fileMark;
	}

}
