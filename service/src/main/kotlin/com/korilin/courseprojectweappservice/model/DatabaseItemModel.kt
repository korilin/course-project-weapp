package com.korilin.courseprojectweappservice.model

data class InfoItem(val sort: Int, val key: String, val value: String)

data class TagItem(val sort: Int, val tag: String)

data class PhotoRecordItem(val url: String, val title: String, val description: String)

data class Seminar(
    val sort: Int,
    val title: String,
    val description: String,
    val imgUrl: String,
    val pageUrl: String,
    val source: String
)