//
//  AddViewController.swift
//  CoreDataNotas
//
//  Created by Bluumi on 3/10/23.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    // MARK: - Outlets
    
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
    
    // MARK: - Properties
    
    var notes = [Note]()
    var fetchResultController: NSFetchedResultsController<Note>!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNotes()
    }
    
    // MARK: - Actions
    
    @IBAction func addNoteButtonTapped(_ sender: Any) {
        // present view
        let addNoteViewController = AddNoteViewController(nibName: "AddNoteViewController", bundle: nil)
        present(addNoteViewController, animated: true)
    }
    
    // MARK: - Functions
    
    func showNotes(){
        let context = Model.shared.context()
        let fetchRequest :NSFetchRequest<Note> = Note.fetchRequest()
        let order = NSSortDescriptor(key: "noteTitle", ascending: true)
        fetchRequest.sortDescriptors = [order]
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        do {
            try fetchResultController.performFetch()
            notes = fetchResultController.fetchedObjects!
        } catch let error as NSError {
            print(">> Error, not found: ", error.localizedDescription)
        }
    }
}

// MARK: - Table

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // note
        let note = notes[indexPath.row]
        
        // format
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.current
        
        // cell
        guard let noteCell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier,
                                                           for: indexPath) as? NoteCell else { fatalError(">> Notes Cell not found!!")}
        noteCell.noteTitle.text = note.noteTitle
//        noteCell.textLabel?.text = note.noteTitle
        noteCell.noteDate.text = dateFormatter.string(from: note.noteDate ?? Date())
//        noteCell.detailTextLabel?.text = dateFormatter.string(from: note.noteDate ?? Date())
        noteCell.noteDescription.text = note.noteDescription
        return noteCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

// MARK: - NSFetchedResultsControllerDelegate

extension AddViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        notesTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        notesTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            self.notesTableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            self.notesTableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            self.notesTableView.reloadRows(at: [indexPath!], with: .fade)
        default:
            self.notesTableView.reloadData()
        }
        
        notes = controller.fetchedObjects as! [Note]
    }
}
