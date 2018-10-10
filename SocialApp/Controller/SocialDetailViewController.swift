//
//  SocialDetailViewController.swift
//  SocialApp
//
//  Created by Alexandr on 9/26/18.
//  Copyright © 2018 Alexander. All rights reserved.
//

import UIKit

class SocialDetailViewController: UIViewController {
    @IBOutlet weak var social_image: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        social_image.image = image
        
    }
    
    @IBAction func animateImage(_ sender: Any) {
        UIView.animate(withDuration: 0.5,animations: {
            self.social_image.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: { _ in UIView.animate(withDuration: 0.25) {
            self.social_image.transform = CGAffineTransform.identity
            }
        })
    }
   
}
