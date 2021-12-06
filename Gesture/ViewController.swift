//
//  ViewController.swift
//  gesture
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myv:UIView={
        let v=UIView()
        v.backgroundColor = .lightGray
        v.frame=CGRect(x: 100, y: 100, width: 200, height: 200)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myv)
        
       /* let tapgesture=UITapGestureRecognizer(target:self,action: #selector(didtapview))
        tapgesture.numberOfTapsRequired=2
        tapgesture.numberOfTouchesRequired=1
        myv.addGestureRecognizer(tapgesture)
        
        let pinchgesture=UIPinchGestureRecognizer(target:self,action: #selector(didpinchview))
        view.addGestureRecognizer(pinchgesture)
        
        let rotationgesture=UIRotationGestureRecognizer(target: self, action:#selector(didrotateview))
        view.addGestureRecognizer(rotationgesture)*/
        
        /*let lswipe=UISwipeGestureRecognizer(target: self, action:#selector(didswipeview))
        lswipe.direction = .left
        view.addGestureRecognizer(lswipe)
        
        let rswipe=UISwipeGestureRecognizer(target: self, action:#selector(didswipeview))
        lswipe.direction = .right
        view.addGestureRecognizer(rswipe)
        
        let uswipe=UISwipeGestureRecognizer(target: self, action:#selector(didswipeview))
        lswipe.direction = .up
        view.addGestureRecognizer(uswipe)
        
        let dswipe=UISwipeGestureRecognizer(target: self, action:#selector(didswipeview))
        lswipe.direction = .down
        view.addGestureRecognizer(dswipe)*/
        
        let pangesture=UIPanGestureRecognizer(target: self, action: #selector(didpanview))
        view.addGestureRecognizer(pangesture)
        
    }
    

}
extension ViewController{
    @objc private func didtapview(gesture: UITapGestureRecognizer) {
        print("tapped at location: \(gesture.location(in: myv))")
    }
    @objc private func didpinchview(gesture: UIPinchGestureRecognizer) {
        myv.transform=CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
    @objc private func didrotateview(gesture: UIRotationGestureRecognizer) {
        myv.transform=CGAffineTransform(rotationAngle: gesture.rotation)
    }
    @objc private func didswipeview(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left{
            UIView.animate(withDuration: 0.5){
            self.myv.frame = CGRect(x: self.myv.frame.origin.x-40, y: self.myv.frame.origin.y, width: 200, height: 200)
            }
        }
        else  if gesture.direction == .right{
            myv.frame = CGRect(x: myv.frame.origin.x+40, y: myv.frame.origin.y, width: 200, height: 200)
        }
        else  if gesture.direction == .up{
            myv.frame = CGRect(x: myv.frame.origin.x, y: myv.frame.origin.y-40, width: 200, height: 200)
        }
        else  if gesture.direction == .down{
            myv.frame = CGRect(x: myv.frame.origin.x, y: myv.frame.origin.y+40, width: 200, height: 200)
        }
    }
    
    @objc private func didpanview(gesture: UIPanGestureRecognizer) {
       let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        myv.center=CGPoint(x: x, y: y)
    }
    
    
}
