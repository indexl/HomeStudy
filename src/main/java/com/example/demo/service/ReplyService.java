package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;

@Service
public class ReplyService {

	private ReplyDao replyDao;

	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	public void replyWrite(int loginedMemberId, int relId, String relTypeCode, String body) {
		this.replyDao.replyWrite(loginedMemberId, relId, relTypeCode, body);
	}

	public int getLastInsertId() {
		return this.replyDao.getLastInsertId();
	}
}
