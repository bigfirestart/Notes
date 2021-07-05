//
//  INoteService.swift
//  TestTodoTask
//
//  Created by 19330635 on 04.07.2021.
//

import CoreData

protocol ICoreDataNoteService {
    func getAllNotes() -> [Note]
    func filterNotes(key: String) -> [Note]
    func createNote(name: String)
    func updateNote(note: Note, name: String?, desc: String?)
}

class CoreDataNoteService: ICoreDataNoteService {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getAllNotes() -> [Note] {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "lastUpdate", ascending: false)]
        do {
            return try context.fetch(request)
        }
        catch {
            // error
        }
        return []
    }
    
    func filterNotes(key: String) -> [Note] {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        let namePred = NSPredicate(format: "name contains[cd] %@", key)
        let descPred = NSPredicate(format: "desc contains[cd] %@", key)
        request.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: [namePred, descPred])
        request.sortDescriptors = [NSSortDescriptor(key: "lastUpdate", ascending: false)]
        do {
            return try context.fetch(request)
        }
        catch {
            // error
        }
        return []
    }
    
    func createNote(name: String) {
        let newItem = Note(context: context)
        newItem.name = name
        newItem.desc = "No description"
        newItem.lastUpdate = Date()
        
        do {
            try context.save()
        }
        catch {
            
        }
    }
    
    func updateNote(note: Note, name: String?, desc: String?){
        if let name = name {
            note.name = name
        }
        if let desc = desc {
            note.desc = desc
        }
        note.lastUpdate = Date()
        do {
            try context.save()
        }
        catch {
            
        }
    }
}

