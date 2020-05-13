//
//  ViewController.swift
//  newscollect
//
//  Created by dennys Plettlinger on 12.05.20.
//  Copyright © 2020 dennysplettlinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      
    // MARK: - Outlets
    @IBOutlet weak var articleTableView: UITableView!
    
    var articles = [Article]()

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTableView.dataSource = self
        articleTableView.delegate = self
        
        fetchData()
    }
    
    // MARK: - Data fetching from API
    func fetchData(){
        let jsonUrlString = "https://newsapi.org/v2/top-headlines?sources=techCrunch&apiKey=\(Constants.API_KEY)"
               let url = URL(string: jsonUrlString)!
                      
               let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                   guard let data = data else{
                       return
                   }
                          
                   let responseJsonObject = try! JSONDecoder().decode(ArticleResponse.self, from: data)
                   self.articles = responseJsonObject.articles
                   
                   OperationQueue.main.addOperation {
                       self.articleTableView.reloadData()
                   }
                   
               }
               
               task.resume()
    }
    
    // MARK: - TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
            
        let article = articles[indexPath.row]
        print("Title: \(article.title)")
        
        articleCell.articleTitleLabel.text = article.title
        articleCell.articleTextLabel.text = article.description
        
        
        if let imageUrl = URL(string: article.urlToImage){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageUrl)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        articleCell.articleImageView.image = image
                    }
                }
            }
        }
        
        return articleCell
      }
    
    
}

