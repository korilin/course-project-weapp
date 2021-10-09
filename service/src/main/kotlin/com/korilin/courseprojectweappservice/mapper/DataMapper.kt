package com.korilin.courseprojectweappservice.mapper

import com.korilin.courseprojectweappservice.model.InfoItem
import com.korilin.courseprojectweappservice.model.PhotoRecordItem
import com.korilin.courseprojectweappservice.model.Seminar
import com.korilin.courseprojectweappservice.model.TagItem
import org.apache.ibatis.annotations.Select
import org.springframework.stereotype.Repository

@Repository
interface DataMapper {

    @Select("select * from info_list;")
    fun getInfos(): List<InfoItem>

    @Select("select * from tags;")
    fun getTags(): List<TagItem>

    @Select("select * from photo_record;")
    fun getPhotoRecords(): List<PhotoRecordItem>

    @Select("select * from seminars;")
    fun getSeminars(): List<Seminar>
}