//
//  NoteListViewModel.swift
//  Organote
//
//  Created by Vladimir Rogozhkin on 2023/04/15.
//

import Foundation

final class NoteListViewModel: ObservableObject {
    
    @Published private(set) var notes: [Note] = []
    
    func addNote(_ note: Note) {
        notes.append(note)
    }
    
    func deleteNote(indexAt: IndexSet) {
        notes.remove(atOffsets: indexAt)
    }
}
