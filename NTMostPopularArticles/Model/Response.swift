//
//  Result.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit

struct Response: Codable {
    let status:String
    let copyright: String
    let num_results: Int
    let results: [Article]
}
