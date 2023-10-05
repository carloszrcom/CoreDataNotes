//
//  AddViewController.swift
//  CoreDataNotas
//
//  Created by Bluumi on 3/10/23.
//

import UIKit

class AddViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var notesTableView: UITableView! {
        didSet {
            // delegates
            notesTableView.delegate = self
            notesTableView.dataSource = self
            // Regist cell
            let noteCell = UINib(nibName: NoteCell.nibName, bundle: nil)
            notesTableView.register(noteCell, forCellReuseIdentifier: NoteCell.reuseIdentifier)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func addNoteButtonTapped(_ sender: Any) {
        // present view
        let addNoteViewController = AddNoteViewController(nibName: "AddNoteViewController", bundle: nil)
        present(addNoteViewController, animated: true)
    }
}

// MARK: - Table
extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let noteCell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath) as? NoteCell else { fatalError(">> Notes Cell not found!!")}
        return noteCell
    }
}
