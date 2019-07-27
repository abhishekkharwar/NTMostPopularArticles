//
//  ArticleViewViewModel.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit
import Alamofire

class ArticleViewViewModel: NSObject {
    
    func fetchArtclesFor(days: Int, completion:@escaping (Result<Response, Error>)-> Void){
        
        let requestUrl = baseUrl + mostPopularArticlesPath + String(days) + ".json?api-key=" + appKey
        
        AF.request(requestUrl).responseDecodable {(dataResponse: DataResponse<Response>) in
             switch dataResponse.result {
               case .success(let result):
                   completion(.success(result))
               case .failure(let error):
                   completion(.failure(error))
               }
        }
    }
}
