//
//  NoteCell.swift
//  CoreDataNotas
//
//  Created by Bluumi on 3/10/23.
//

import UIKit

class NoteCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var noteDate: UILabel!
    @IBOutlet weak var noteDescription: UITextView!
    
    // MARK: - Properties
    
    class var reuseIdentifier: String {
        return String(describing: NoteCell.self)
    }
    
    class var nibName: String {
        return String(describing: NoteCell.self)
    }

    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
