package com.korilin.courseprojectweappservice

import com.korilin.courseprojectweappservice.mapper.DataMapper
import com.korilin.courseprojectweappservice.model.InfoItem
import com.korilin.courseprojectweappservice.model.PhotoRecordItem
import com.korilin.courseprojectweappservice.model.Seminar
import com.korilin.courseprojectweappservice.model.TagItem
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/kori")
class MainController(
    val dataMapper: DataMapper
) {

    @GetMapping("/info")
    fun info(): List<InfoItem> {
        return dataMapper.getInfos();
    }

    @GetMapping("/tags")
    fun tags(): List<TagItem> {
        return dataMapper.getTags()
    }

    @GetMapping("/photos")
    fun phones(): List<PhotoRecordItem> {
        return dataMapper.getPhotoRecords()
    }

    @GetMapping("/seminars")
    fun seminars(): List<Seminar> {
        return dataMapper.getSeminars().sortedBy { -it.sort }
    }
}