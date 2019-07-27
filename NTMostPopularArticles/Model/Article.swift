//
//  Article.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit

struct Article: Codable {
    let url:String
    let adx_keywords:String
    let column:String?
    let section: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let published_date: String
    let source: String
    let id: Int
    let asset_id: Int
    let views: Int
   // let media: [Media] Needs to verify getting error expected array but found string/data
}

struct Media: Codable {
    let mediaData: [MediaMetadata]
    private enum CodingKeys : String, CodingKey {
        case mediaData = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url:String
    let format:String
    let height:Int
    let width:Int
}
