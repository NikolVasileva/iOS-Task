//
//  NewsDataTableViewCell.swift
//  iOSTask
//
//  Created by Nikol Vasileva on 14.04.23.
//

import UIKit

class NewsDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Border of the cells
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 35
        self.layer.masksToBounds = true
    
        
        // Gradient color of cells
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor.systemGray6.cgColor,
            UIColor.white.cgColor
        ]
//        self.layer.addSublayer(gradientLayer)
        self.contentView.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(with data: Article){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
       
        self.titleLabel.text = String(data.title)
        self.authorLabel.text = "Author: \(String(data.author))"
        self.sourceNameLabel.text = "Source: \(data.source?.name ?? "")"
//        self.publishedAtLabel.text = "Published: \(String(data.publishedAt))"
//        self.publishedAtLabel.text = "Published: \(dateFormatter.string(from: data.ePublishedAt))"
        
    }

}
