//
//  WalkthroughCollectionViewCell.swift
//  MyoScan
//
//  Created by Aditya Sharma on 8/1/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit

class WalkthroughCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.view.layer.cornerRadius = 13.0
            self.view.layer.shadowColor = UIColor.lightGray.cgColor
            self.view.layer.shadowOpacity = 0.5
            self.view.layer.shadowOffset = .zero
            self.view.layer.shadowPath = UIBezierPath(rect: self.view.bounds).cgPath
            self.view.layer.shouldRasterize = true
        }
    }

}
