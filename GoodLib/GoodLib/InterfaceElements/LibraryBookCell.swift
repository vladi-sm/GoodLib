//
//  LibraryBookCell.swift
//  GoodLib
//
//  Created by Vladislav Smetanin on 14.05.2022.
//

import UIKit

final class LibraryBookCell: UITableViewCell {

    // MARK: IBOutlets and Properties
    
    @IBOutlet weak var libraryBookNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var totalPagesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    static let identifier = String(describing: LibraryBookCell.self)
    
    // MARK: Methods
    
    public func configureCellData(bookData: BookProtocol){
        let stringTotalPages = String(bookData.totalPages)
        self.libraryBookNameLabel?.text = bookData.title
        self.authorNameLabel?.text = bookData.author
        self.statusLabel?.text = bookData.status
        self.totalPagesLabel?.text = stringTotalPages
    }
    
    private func cellDesignConfiguration(){
        self.bubbleView.layer.cornerRadius = 12
        self.bubbleView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.bubbleView.layer.shadowRadius = 5
        self.bubbleView.layer.shadowOpacity = 0.2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellDesignConfiguration()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
