package com.korilin.courseprojectweappservice

import com.korilin.courseprojectweappservice.mapper.CommentMapper
import com.korilin.courseprojectweappservice.model.Comment
import com.korilin.courseprojectweappservice.model.NewComment
import com.korilin.courseprojectweappservice.model.NewLikeStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/comment")
class CommentController(val commentMapper: CommentMapper) {

    @PostMapping("/new")
    fun newComment(@RequestBody newComment: NewComment): Boolean {
        val (nickName, avatarUrl, content) = newComment
        val comment = Comment(0, nickName, avatarUrl, content, (System.currentTimeMillis() / 1000).toInt())
        return commentMapper.insertComment(comment)
    }

    @GetMapping("/all")
    fun allComments() = commentMapper.getComments().sortedBy { -it.commentId }.onEach {
        val like = commentMapper.getLike(it.commentId)
        it.like = like
    }

    @PostMapping("/changeLike")
    fun changeLike(@RequestBody newLikeStatus: NewLikeStatus) = newLikeStatus.run {
        if (newStatus) commentMapper.toLike(commentId, nickName)
        else commentMapper.unLike(commentId, nickName)
    }

    @GetMapping("/myLikes")
    fun myLikes(nickName : String) = commentMapper.myLikes(nickName)
}