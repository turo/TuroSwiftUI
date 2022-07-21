//
//  Instances.swift
//  SwiftUIExample
//
//  Created by Luke Solomon on 7/20/22.
//

import SwiftUI

let bmwURL = "https://www.bmw-m.com/content/dam/bmw/marketBMW_M/common/topics/magazine-article-pool/2021/e46-gtr-street/bmw-m3-gtr-street-stage-teaser.jpg/jcr:content/renditions/cq5dam.resized.img.1680.large.time1629987440698.jpg"

struct Instances {
    let dataManager: DataManager

    static let shared = Instances(dataManager: DataManager())
}
