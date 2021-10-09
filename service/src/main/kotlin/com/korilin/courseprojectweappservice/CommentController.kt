package com.korilin.courseprojectweappservice

import com.korilin.courseprojectweappservice.mapper.CommentMapper
import com.korilin.courseprojectweappservice.model.Comment
import com.korilin.courseprojectweappservice.model.NewComment
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
    fun allComments() = commentMapper.getComments()
}