package ch18.com.model;

import java.time.LocalDateTime;

public class BoardInfo {
	private String title;
	private String content;
	private String writer;
	private String rating;
	public String getRating() {
		return rating;
	}
	public BoardInfo setRating(String rating) {
		this.rating = rating;
		return this;
	}
	private int number;
	public int getNumber() {
		return number;
	}
	public BoardInfo setNumber(int number) {
		this.number = number;
		return this;
	}
	private LocalDateTime registerDateTime;
	public LocalDateTime getRegisterDateTime() {
		return registerDateTime;
	}
	public BoardInfo setRegisterDateTime(LocalDateTime registerDateTime) {
		this.registerDateTime = registerDateTime;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public BoardInfo setTitle(String title) {
		this.title = title;
		return this;
	}
	public String getContent() {
		return content;
	}
	public BoardInfo setContent(String content) {
		this.content = content;
		return this;
	}
	public String getWriter() {
		return writer;
	}
	public BoardInfo setWriter(String writer) {
		this.writer = writer;
		return this;
	}
	
}
