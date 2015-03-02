//
//  ViewController.swift
//  004-Facebook
//
//  Created by Jakub Burkot on 2/28/15.
//  Copyright (c) 2015 Jakub Burkot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedImageView: UIImageView!
    
    var endTransition: CGRect!
    
    var imageTransition: ImageTransition!

    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var photo1Image: UIImageView!
    @IBOutlet weak var photo2Image: UIImageView!
    @IBOutlet weak var photo3Image: UIImageView!
    @IBOutlet weak var photo4Image: UIImageView!
    @IBOutlet weak var photo5Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImage.frame.size
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        
        destinationViewController.detailImage = selectedImageView.image
        
        var height = (selectedImageView.image!.size.height*320)/selectedImageView.image!.size.width
        
        endTransition = CGRect(x: 0, y: (self.view.frame.size.height - height)/2, width: 320, height: height)
        
        imageTransition = ImageTransition()
        imageTransition.duration = 0.2
        imageTransition.endTransition = endTransition
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = imageTransition
        destinationViewController.endTransition = endTransition
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func photoóTap(sender: UITapGestureRecognizer) {
        var imageView = sender.view as UIImageView
        selectedImageView = imageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
}

