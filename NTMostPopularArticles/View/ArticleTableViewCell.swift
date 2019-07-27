//
//  ArticleTableViewCell.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var postedDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        articleImageView.layer.cornerRadius = articleImageView.frame.size.width/2
        articleImageView.backgroundColor = UIColor.darkGray
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellData(article: Article)
    {
        titleLabel.text = article.title
        postedDateLabel.text = article.published_date
        authorLabel.text = article.byline
    }

}
