package com.korilin.courseprojectweappservice.model

data class NewComment(val nickName:String, val avatarUrl:String, val content: String)

data class NewLikeStatus(val commentId: Int, val nickName: String, val newStatus: Boolean)