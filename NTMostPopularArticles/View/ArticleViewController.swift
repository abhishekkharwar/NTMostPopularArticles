//
//  ArticleViewController.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit
import GeometricLoaders
import Reachability

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var articleTableView: UITableView!
    var viewModel: ArticleViewViewModel = ArticleViewViewModel()
    var articles = [Article]()
    var geometricLoader = GeometricLoader()
    let reachability = Reachability()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchArticles(forDays: 1)
    }
    
    @IBAction func segmentedControlValueUpdated(segmentedControl: UISegmentedControl)
    {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            fetchArticles(forDays: 1)
        case 1:
            fetchArticles(forDays: 7)
        case 2:
            fetchArticles(forDays: 30)
        default:
            fetchArticles(forDays: 1)
        }
    }
    
    func fetchArticles(forDays:Int){
        LoadingView.shared.showOnView(superView: self.navigationController!.view)
        viewModel.fetchArtclesFor(days: forDays) { (result) in
                                                     LoadingView.shared.remove()
                                                           switch result {
                                                           case .success(let response):
                                                               self.articles = response.results
                                                               self.articleTableView.reloadData()
                                                           case .failure(let error):
                                                              print(error.localizedDescription)
                                                           }
                                                     
                                                     }
    }
    
    func showErrorMessage(message:String)
    {
        let alert = UIAlertController(title: "NTMostPopularArticles", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ArticleDetail"{
            if let cell = sender as? ArticleTableViewCell{
                if let indexPath = articleTableView.indexPath(for: cell)
                {
                    let article = articles[indexPath.row]
                    let articleDetailViewController = segue.destination as! ArticleDetailViewController
                    articleDetailViewController.article = article
                }
            }
        }
    }
    

}

extension ArticleViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let identifier = "ArticleCell"
              
              let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ArticleTableViewCell
              
              let article = articles[indexPath.row]
        
              cell.updateCellData(article: article)
              
        return cell
    }
}

extension ArticleViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return articleCellHeight
    }
}


