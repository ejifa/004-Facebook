//
//  ImageTransition.swift
//  004-Facebook
//
//  Created by Jakub Burkot on 2/28/15.
//  Copyright (c) 2015 Jakub Burkot. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var viewController = fromViewController as ViewController
        viewController.selectedImageView.hidden = true
        
        var photoViewController = toViewController as PhotoViewController
        photoViewController.imageView.hidden = true
        
        var movingImageView = UIImageView(image: viewController.selectedImageView.image)

        movingImageView.contentMode = viewController.selectedImageView.contentMode
        movingImageView.clipsToBounds = viewController.selectedImageView.clipsToBounds
        containerView.addSubview(movingImageView)
        
        var frame = containerView.convertRect(viewController.selectedImageView.frame, fromView: viewController.scrollView)
        
        movingImageView.frame = frame
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            movingImageView.frame = self.endTransition
            
        }) { (finished: Bool) -> Void in
            self.finish()
            photoViewController.imageView.hidden = false
            movingImageView.removeFromSuperview()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var viewController = toViewController as ViewController
        viewController.selectedImageView.hidden = false
        
        var photoViewController = fromViewController as PhotoViewController
        photoViewController.imageView.hidden = false
        
        var movingImageView = UIImageView(image: photoViewController.imageView.image)
        movingImageView.frame = endTransition
        
        movingImageView.contentMode = viewController.selectedImageView.contentMode
        movingImageView.clipsToBounds = viewController.selectedImageView.clipsToBounds
        containerView.addSubview(movingImageView)
        
        
        var frame = containerView.convertRect(viewController.selectedImageView.frame, fromView: viewController.scrollView)
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            movingImageView.frame = frame
            fromViewController.view.alpha = 0
            
        }) { (finished: Bool) -> Void in
            self.finish()
            
        }
    }
}
