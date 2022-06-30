//
//  NewsArticleCell.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation
import UIKit

class NewsArticleCell:UITableViewCell {
    
    @IBOutlet weak var widthContant: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleAbstract: UILabel!
    
    func setUpView(article:ArticleResult?) {
        self.articleTitle.text = article?.title ?? ""
        self.articleAbstract.text = article?.abstract ?? ""
        self.articleAbstract.sizeToFit()
        self.authorName.text = article?.byline ?? ""
        self.dateLabel.text = article?.published_date ?? ""
        if let media = article?.media,media.count > 0{
            let mediaIndex = media.count - 1
            if let metaData = media[mediaIndex].metadata,metaData.count > 0{
                let index = metaData.count - 1
                let url = metaData[index].url ?? ""
                self.articleImageView.addImage(url, UIImage())
                self.imageHeightConstant.constant = CGFloat(metaData[index].height ?? 0)
                self.widthContant.constant = CGFloat(metaData[index].width ?? 0)
                
            }
        }else{
            articleImageView.image = nil
        }
    }
    
}
