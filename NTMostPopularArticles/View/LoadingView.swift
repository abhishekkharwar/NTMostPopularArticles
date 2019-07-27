//
//  LoadingView.swift
//  NTMostPopularArticles
//
//  Created by xeadmin on 27/07/19.
//  Copyright © 2019 xeadmin. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    static let shared = LoadingView()
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupMe()
    }
    
    func setupMe(){
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        let containerWidth:CGFloat = 100.0
        let containerHeight:CGFloat = 100.0
        let containerView = UIView(frame: CGRect(x: ((self.frame.size.width - containerWidth)/2), y: ((self.frame.size.height - containerHeight)/2), width: containerWidth, height: containerHeight))
        containerView.layer.cornerRadius = 5
        containerView.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        containerView.backgroundColor = UIColor.white
        containerView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleTopMargin]
        self.addSubview(containerView)
        
        
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.center = CGPoint(x: containerWidth/2, y: containerHeight/2)
        activityIndicatorView.startAnimating()
        containerView.addSubview(activityIndicatorView)
        
        let loadingLabel = UILabel(frame: CGRect(x: 0, y: activityIndicatorView.frame.origin.y + activityIndicatorView.frame.size.height, width: containerWidth, height: 30))
        loadingLabel.text = "Loading..."
        loadingLabel.font = UIFont(name: fontName, size: 14)
        loadingLabel.textAlignment = .center
        loadingLabel.textColor = UIColor.darkGray
        loadingLabel.backgroundColor = UIColor.clear
        containerView.addSubview(loadingLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showOnView(superView: UIView)
    {
        var frame = self.frame
        frame.size.width = superView.frame.size.width
        frame.size.height = superView.frame.size.height
        self.frame = frame
        superView.addSubview(self)
    }
    
    func remove(){
        self.removeFromSuperview()
    }

}
