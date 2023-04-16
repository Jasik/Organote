//
//  CreateOrEditView.swift
//  Organote
//
//  Created by Vladimir Rogozhkin on 2023/04/15.
//

import SwiftUI

struct CreateOrEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title: String = ""
    @State private var noteText: String = ""
    
    var onNoteCreated: (Note) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                titleField
                noteField
            }
            .navigationTitle("Create note")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    cancel
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    save
                }
            }
        }
    }
}

private extension CreateOrEditView {
    var titleField: some View {
        Section(header: Text("Note title")) {
            TextField("", text: $title)
        }
    }
    
    var noteField: some View {
        Section(header: Text("Note text")) {
            TextEditor(text: $noteText)
        }
    }
    
    var cancel: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var save: some View {
        Button("save") {
            let note = Note(
                id: .init(),
                createDate: .init(),
                title: title,
                text: noteText
            )
            onNoteCreated(note)
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(title.isEmpty)
    }
}

struct CreateOrEditView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrEditView() { _ in }
    }
}
