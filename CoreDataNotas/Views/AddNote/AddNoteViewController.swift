//
//  AddNoteViewController.swift
//  CoreDataNotas
//
//  Created by Bluumi on 5/10/23.
//

import UIKit

class AddNoteViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        Model.shared.saveData(title: titleTextField.text ?? "", description: descriptionTextView.text, date: datePicker.date)
        dismiss(animated: true)
    }
}
