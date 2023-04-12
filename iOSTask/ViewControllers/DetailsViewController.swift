//
//  DetailsViewController.swift
//  iOSTask
//
//  Created by Nikol Vasileva on 12.04.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var newsArticles: Article? = nil

    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBAction func readMoreButton(_ sender: UIButton) {
    
        if let articleURL = URL(string: newsArticles?.url ?? "") {
               UIApplication.shared.open(articleURL)
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleTitle.text = newsArticles?.title
        
        print(NewsDataManager.getNewsData)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    func reloadDataOnScreen(){
        self.articleTitle.text = newsArticles?.title
    }
    
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: newsArticles?.urlToImage ?? "") else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.articleImage.image = image
            }
        }
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



