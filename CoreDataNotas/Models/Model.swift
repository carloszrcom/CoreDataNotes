//
//  Model.swift
//  CoreDataNotas
//
//  Created by Bluumi on 3/10/23.
//

import UIKit
import CoreData

class Model {
    
    // MARK: - Properties
    
    /// Singleton
    public static let shared = Model()
    
    // MARK: - Functions
    
    // context para conectar con la DB (environment en SwiftUI)
    func context() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func saveData(title: String, description: String, date: Date) {
        let context = context()
        let note = NSEntityDescription.insertNewObject(forEntityName: Constant.note, into: context) as! Note
        note.noteTitle = title
        note.noteDescription = description
        note.noteDate = date
        
        do {
            try context.save()
            print("--> saved")
        } catch let error as NSError {
            print(">> Error saving note: \(error.description)")
        }
    }
}
