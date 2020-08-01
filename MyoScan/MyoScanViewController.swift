//
//  MyoScanViewController.swift
//  MyoScan
//
//  Created by Aditya Sharma on 7/26/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit

class MyoScanViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    @IBOutlet weak var walkThroughCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        walkThroughCollectionView.register(UINib.init(nibName: "WalkthroughCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "walk")
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: walkThroughCollectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        walkThroughCollectionView.collectionViewLayout = flowLayout
        
        walkThroughCollectionView.delegate = self
        walkThroughCollectionView.dataSource = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = walkThroughCollectionView.dequeueReusableCell(withReuseIdentifier: "walk", for: indexPath) as! WalkthroughCollectionViewCell
        cell.lblTitle.text = "Title - \(indexPath.row + 1)"
        cell.lblSubTitle.text = "Sub Title - \(indexPath.row + 1)"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("itm selected == \(indexPath.row)")
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
