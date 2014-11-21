//
//  ViewController.swift
//  Transitions
//
//  Created by Ahmed Eid on 11/21/14.
//  Copyright (c) 2014 Ahmed Eid. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ZoomTransitionProtocol, UINavigationControllerDelegate {

    var animationController : ZoomTransition?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navigationController = self.navigationController {
            animationController = ZoomTransition(navigationController: navigationController)
        }
        self.navigationController?.delegate = animationController
        
        imageView.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
        imageView.addGestureRecognizer(tapGesture)
    }

    func handleTapGesture(gesture: UITapGestureRecognizer){
        let imageViewController = ImageDetailViewController(nibName: "ImageDetailViewController", bundle: nil)
        imageViewController.image = imageView.image
        self.navigationController?.pushViewController(imageViewController, animated: true)
    }
    
    func viewForTransition() -> UIView {
        return imageView
    }
}

