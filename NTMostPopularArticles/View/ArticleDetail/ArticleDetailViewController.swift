//
//  ArticleDetailViewController.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {
    
    var article: Article!
    @IBOutlet weak var webKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }
    
    
    func loadData(){
        
        self.title = article.title
        
        let url = URL(string: article.url)
        let urlRequest = URLRequest(url: url!)
        webKitView.load(urlRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
