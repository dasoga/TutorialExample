//
//  ViewController.swift
//  AudibleExample
//
//  Created by Dante Solorio on 9/6/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .whiteColor()
        cv.dataSource = self
        cv.delegate = self
        cv.pagingEnabled = true
        return cv
    }()
    
    
    let cellId = "cellId"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Share a greate listen", message: "Its free to send your books to the people in your life. Every receipnts first book is on us.", imageName: "page1")
        let secondPage = Page(title: "Send from your library", message: "Tap the more menu next to any book. Choose \"Send this book\"", imageName: "page2")
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner.Choose \"Send this book\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        collectionView.registerClass(PageCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

extension UIView {
    
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraintEqualToAnchor(top, constant: topConstant).active = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraintEqualToAnchor(bottom, constant: -bottomConstant).active = true
        }
        
        if let left = left {
            leftAnchor.constraintEqualToAnchor(left, constant: leftConstant).active = true
        }
        
        if let right = right {
            rightAnchor.constraintEqualToAnchor(right, constant: -rightConstant).active = true
        }
        
    }
    
}