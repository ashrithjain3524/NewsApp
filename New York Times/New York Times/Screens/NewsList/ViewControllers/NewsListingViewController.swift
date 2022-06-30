//
//  NewsListingViewController.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import UIKit

class NewsListingViewController: UIViewController {
    var viewModel:NewsListingViewModel!
    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseView()
        
    }
    func initialiseView(){
        bindViews()
        setUpView()
        
    }
    
    
}

extension NewsListingViewController{
    
    func setUpView(){
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        articlesTableView.register(UINib(nibName: "NewsArticleCell", bundle: nil), forCellReuseIdentifier: "NewsArticleCell")
        articlesTableView.contentInsetAdjustmentBehavior = .never
        articlesTableView.rowHeight = UITableView.automaticDimension
        articlesTableView.estimatedRowHeight = UITableView.automaticDimension
        bindViews()
        viewModel.fetchPipularNews(days: .one)
    }
    
    func bindViews(){
        viewModel.showActivity.bind { (value) in
            // self.showActivityIndicator(show: value)
        }
        viewModel.reloadTable.bind { [weak self] (value) in
            if(value){
                DispatchQueue.main.async {
                    self?.articlesTableView.reloadData()
                }
            }
            
        }
        
        viewModel.newsList.bind { [weak self] (list) in
            DispatchQueue.main.async {
                self?.articlesTableView.reloadData()
            }
        }
        
        viewModel.showErrorPopUp.bind(listener: { (value) in
            
        })
    }
    
}

extension NewsListingViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsArticleCell") as! NewsArticleCell
        let article = self.viewModel.newsList.value[indexPath.row]
        cell.setUpView(article: article)
        
        return cell
    }
    
}

extension NewsListingViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = self.viewModel.newsList.value[indexPath.row]
        let controller = ArticleDetailViewController.getInstance(article: article)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}

extension NewsListingViewController{
    static func getInstance()->UIViewController{
        let controller = UIStoryboard.getMainStoryBoard().instantiateViewController(forClass: NewsListingViewController.self)
        controller.viewModel = NewsListingViewModel()
        return controller
    }
}
