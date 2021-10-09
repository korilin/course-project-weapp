package com.korilin.courseprojectweappservice.mapper

import com.korilin.courseprojectweappservice.model.Comment
import org.apache.ibatis.annotations.Insert
import org.apache.ibatis.annotations.Select
import org.springframework.stereotype.Repository

@Repository
interface CommentMapper {

    @Insert("insert into comments (nickName, avatarUrl, content, timestamp) values (#{nickName}, #{avatarUrl}, #{content}, #{timestamp})")
    fun insertComment(comment: Comment) : Boolean

    @Select("select * from comments;")
    fun getComments() : List<Comment>
}