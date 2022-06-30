//
//  ArticleDetailViewController.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {
    var viewModel:ArticleDetailViewModel!
    @IBOutlet weak var webKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
        // Do any additional setup after loading the view.
    }
    
    func initialise(){
        bindView()
        setUpView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }


}

extension ArticleDetailViewController {
    
    func setUpView(){
        let url = viewModel.article.url ?? ""
        if let request = viewModel.getRequestFromUrl(url: url) {
            webKit.load(request)
        }
        self.webKit.navigationDelegate = self
        
    }
    
    func bindView(){
        viewModel.showActivity.bind {[weak self] (value) in
            self?.showActivityIndicator(show: value)
        }
    }
}
 
extension ArticleDetailViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        viewModel.showActivity.value = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        viewModel.showActivity.value = false
    }
}

extension ArticleDetailViewController{
    static func getInstance(article:ArticleResult)->UIViewController{
        let controller = UIStoryboard.getMainStoryBoard().instantiateViewController(forClass: ArticleDetailViewController.self)
        controller.viewModel = ArticleDetailViewModel(article: article)
        return controller
    }
}
