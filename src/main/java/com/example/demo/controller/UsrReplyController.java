package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Rq;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;

@Controller
public class UsrReplyController {
	
	private ReplyService replyService;
	private Rq rq;

	
	public UsrReplyController(ReplyService replyService, Rq rq) {
		this.replyService = replyService;
		this.rq = rq;
	
	}
	
	@PostMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(int relId, String relTypeCode, String body) {
		
		replyService.replyWrite(rq.getLoginedMemberId(), relId, relTypeCode, body);
		
		int id = replyService.getLastInsertId();
		
		return Util.jsReturn(String.format("%d번 댓글을 작성했습니다", id), String.format("../article/detail?id=%d", relId));			
	}	
}