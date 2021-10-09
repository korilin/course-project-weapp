package com.korilin.courseprojectweappservice

import org.mybatis.spring.annotation.MapperScan
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
@MapperScan("com.korilin.courseprojectweappservice.mapper")
class CourseProjectWeappServiceApplication

fun main(args: Array<String>) {
    runApplication<CourseProjectWeappServiceApplication>(*args)
}
