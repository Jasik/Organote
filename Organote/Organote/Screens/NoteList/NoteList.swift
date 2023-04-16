//
//  NoteList.swift
//  Organote
//
//  Created by Vladimir Rogozhkin on 2023/04/15.
//

import SwiftUI

struct NoteList: View {
    
    @ObservedObject private var viewModel = NoteListViewModel()
    @State private var isShowingCreateNoteView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.notes.isEmpty {
                    Text("no notes yet")
                } else {
                    List(viewModel.notes) { note in
                        NavigationLink(value: note) {
                            noteRow(note)
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .navigationDestination(for: Note.self) { note in
                NoteDetail(note: note)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    add
                }
            }
            .sheet(isPresented: $isShowingCreateNoteView) {
                CreateOrEditView { note in
                    viewModel.addNote(note)
                }
            }
        }
    }
}

private extension NoteList {
    func noteRow(_ note: Note) -> some View {
        HStack {
            Text(note.title)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(note.createDate.formatted(date: .numeric, time: .shortened))
                .font(.footnote)
        }
    }
    
    var add: some View {
        Button {
            isShowingCreateNoteView = true
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NoteList()
    }
}
