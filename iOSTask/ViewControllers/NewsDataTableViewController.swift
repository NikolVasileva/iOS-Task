//
//  NewsDataTableViewController.swift
//  iOSTask
//
//  Created by Nikol Vasileva on 14.04.23.
//

import UIKit

class NewsDataTableViewController: UITableViewController {
    
    var newsData = NewsDataManager.getNewsData()

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsDataManager.updateNewsData()
        print(NewsDataManager.getNewsData())
        
        NotificationCenter.default.addObserver(forName: .dataUpdatedNotification, object: nil, queue: OperationQueue.main) { [weak self] _ in
            self?.updateData()
            
        }
        
    }
    
//    override func viewDidLayoutSubviews() {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [
//            UIColor.systemGray5.cgColor,
//            UIColor.white.cgColor
//        ]
//        tableView.layer.addSublayer(gradientLayer)
//    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.newsData = NewsDataManager.getNewsData()
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.newsData.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsDataTableViewCellIndentifier", for: indexPath) as? NewsDataTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(with: self.newsData[indexPath.row])

        return cell
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier, segueId == "newsDataSegue" else {
            return
        }
        
        guard let destination = segue.destination as? DetailsViewController, let newsData = sender as? Article else {
            return
        }
        
        destination.newsArticles = newsData
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "newsDataSegue", sender: self.newsData[indexPath.row])
        
    }

}
