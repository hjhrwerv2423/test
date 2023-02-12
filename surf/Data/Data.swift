//
//  Data.swift
//  surf
//
//  Created by vaslobas on 11.02.2023.
//

import Foundation

var sample1 = ["IOS", "Android", "Design", "Flutter",
             "QA", "PM", "Technical writer", "System architect", "Team Lead",
             "Fuchsia"]


var sample2 = ["IOS", "QA", "Design", "Flutter",
             "Android", "PM", "Technical writer", "System architect", "Team Lead",
             "Fuchsia"]


var dataFirstCourses = sample1.map { Course(name: $0, isSelected: false) }
var dataSecondCourses = sample2.map { Course(name: $0, isSelected: false) }
