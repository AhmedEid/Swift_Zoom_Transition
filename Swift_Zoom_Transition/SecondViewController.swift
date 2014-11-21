//
//  SecondViewController.swift
//  ZoomTransition
//
//  Created by Ahmed Eid on 11/21/14.
//  Copyright (c) 2014 Ahmed Eid. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ZoomTransitionProtocol, UINavigationControllerDelegate  {

    @IBOutlet weak var collectionView: UICollectionView!
    var animationController : ZoomTransition?;
    var tappedIndexPath:NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        if let navigationController = self.navigationController {
            animationController = ZoomTransition(navigationController: navigationController)
        }
        self.navigationController?.delegate = animationController

    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ItemCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCollectionViewCell", forIndexPath: indexPath) as ItemCollectionViewCell
        
        if (indexPath.row % 2 == 0) {
            cell.itemImageView.image = UIImage(named: "nyan.png")
        } else {
            cell.itemImageView.image = UIImage(named: "nyan2.jpg")
        }
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width - 20, height: 250)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        tappedIndexPath = indexPath
        
        //Set image from cell to image detail view controller
        let cell:ItemCollectionViewCell = collectionView.cellForItemAtIndexPath(tappedIndexPath!) as ItemCollectionViewCell
        
        let imageViewController = ImageDetailViewController(nibName: "ImageDetailViewController", bundle: nil)
        imageViewController.image = cell.itemImageView.image
        
        self.navigationController?.pushViewController(imageViewController, animated: true)
    }
    
    func viewForTransition() -> UIView {
        let cell : ItemCollectionViewCell = collectionView.cellForItemAtIndexPath(tappedIndexPath!) as ItemCollectionViewCell
        return cell.itemImageView
    }
}
