//
//  NibTableViewCell.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 13/05/2025.
//

import UIKit

class NibTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var rightLable: UILabel!
    @IBOutlet weak var leftLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override func layoutSubviews() {
         super.layoutSubviews()

         imgView.layer.cornerRadius = imgView.frame.size.width / 2
         imgView.clipsToBounds = true
        print("Width: \(imgView.frame.size.width), Height: \(imgView.frame.size.height)")
        print("Width: \(imgView.frame.size.width), Height: \(imgView.frame.size.height)")
     }

}
