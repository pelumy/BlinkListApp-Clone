//
//  bookCellControl.swift
//  bookApp
//
//  Created by mac on 01/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

var jsonFile: BookContent?
class BookCellController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        if let filePath = Bundle.main.path(forResource: "BookLibrary", ofType: "json"){
            if let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)){
                jsonFile = try? JSONDecoder().decode(BookContent.self, from: data)
                }
        }    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCells", for: indexPath) as? BookCell {
            if let indexBook = jsonFile?.books[indexPath.row]{
                cell.bookAuthor.text = indexBook.bookAuthor
                cell.bookTitle.text = indexBook.bookTitle
                cell.bookType.text = indexBook.bookType
                cell.bookDuration.text = "\(indexBook.bookDuration) hrs"
                cell.bookImage.image = UIImage(named: indexBook.bookImage)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonFile?.books.count ?? 0
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CellSection", for: indexPath) as? CellSection
        if let cellSection = jsonFile?.title {
            sectionHeader?.title.text = cellSection
        }
        if let cellSection = jsonFile?.description {
            sectionHeader?.bookDescription.text = cellSection
        }
        if let cellSection = jsonFile?.access {
            sectionHeader?.access.text = cellSection
        }
        
        return sectionHeader!
    }
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexBook = jsonFile?.books[indexPath.row]
        performSegue(withIdentifier: "BookDetailsScreen", sender: indexBook)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let book = sender as? Book{
            if let destinationViewController = segue.destination as? SecondScreenController{
                destinationViewController.books = book
            }
        }
    }
    
}


