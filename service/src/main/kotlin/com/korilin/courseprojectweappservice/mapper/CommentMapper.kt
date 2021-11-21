package com.korilin.courseprojectweappservice.mapper

import com.korilin.courseprojectweappservice.model.Comment
import org.apache.ibatis.annotations.Delete
import org.apache.ibatis.annotations.Insert
import org.apache.ibatis.annotations.Select
import org.springframework.stereotype.Repository

@Repository
interface CommentMapper {

    @Insert("insert into comments (nickName, avatarUrl, content, timestamp) values (#{nickName}, #{avatarUrl}, #{content}, #{timestamp})")
    fun insertComment(comment: Comment) : Boolean

    @Select("select * from comments;")
    fun getComments() : List<Comment>

    @Select("select count(*) from `like` where commentId=#{commentId}")
    fun getLike(commentId: Int) : Int

    @Insert("insert into `like` (commentId, nickName) values (#{commentId}, #{nickName})")
    fun toLike(commentId : Int, nickName: String)

    @Delete("delete from `like` where commentId=#{commentId} and nickName=#{nickName}")
    fun unLike(commentId : Int, nickName: String)

    @Select("select commentId from `like` where nickName=#{nickName}")
    fun myLikes(nickName: String) : List<Int>
}