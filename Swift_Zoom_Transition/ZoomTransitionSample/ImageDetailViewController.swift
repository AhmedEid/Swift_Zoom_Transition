//
//  ImageDetailViewController.swift
//  Transitions
//
//  Created by Ahmed Eid on 11/21/14.
//  Copyright (c) 2014 Ahmed Eid. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, ZoomTransitionProtocol {

    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.userInteractionEnabled = true
        imageView.image = image?
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    func handleTapGesture(gesture: UITapGestureRecognizer){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func viewForTransition() -> UIView {
        return imageView
    }
}
