//
//  CollectionViewController.swift
//  SocialApp
//
//  Created by Alexandr on 9/26/18.
//  Copyright © 2018 Alexander. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollectionViewController: UICollectionViewController {

    var socialsArray = [Social]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSocialsJSON()
        
    }
    
    // MARK: - UICollectionView methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return socialsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.socialsLabel.text! = socialsArray[indexPath.row].name
        cell.socialsImage.image = UIImage(named: socialsArray[indexPath.row].image)

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "SocialDetailViewController") as? SocialDetailViewController {
        
            destinationVC.image =  (UIImage(named: socialsArray[indexPath.row].image))!
            self.navigationController?.pushViewController(destinationVC, animated: true)
            
        }
    }
    
    // MARK: UpdateSocialsJSON
    
  private func updateSocialsJSON() {
    guard let path = Bundle.main.path(forResource: "socials", ofType: "json") else {fatalError()}
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            var jsonObj = try JSON(data: data)
            let countOfItems = jsonObj.count
            for index in 0..<countOfItems {
                let newSocials = Social()
                newSocials.name = jsonObj[index]["name"].stringValue
                newSocials.image = jsonObj[index]["image"].stringValue
                socialsArray.append(newSocials)
            }
        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
 }
}
