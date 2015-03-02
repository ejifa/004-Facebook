//
//  PhotoViewController.swift
//  004-Facebook
//
//  Created by Jakub Burkot on 2/28/15.
//  Copyright (c) 2015 Jakub Burkot. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var modalScrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet weak var blackView: UIView!
    
    var detailImage: UIImage!
    var endTransition: CGRect!
    
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalScrollView.delegate = self
        
        imageView.image = detailImage
        imageView.frame = endTransition

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func dismissButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        offset = abs(modalScrollView.contentOffset.y)
        blackView.alpha = 1 - offset/100
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        doneButton.alpha = 0
        photoActions.alpha = 0
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
        doneButton.alpha = 1
        photoActions.alpha = 1
            
            if (offset > 75){
                dismissViewControllerAnimated(true, completion: nil)
            }
            
    }

}
