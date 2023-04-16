//
//  NoteDetail.swift
//  Organote
//
//  Created by Vladimir Rogozhkin on 2023/04/16.
//

import SwiftUI

struct NoteDetail: View {
    
    let note: Note
    
    var body: some View {
            VStack(alignment: .leading, spacing: 30) {
                Text(note.createDate.formatted(date: .numeric, time: .shortened))
                    .font(.caption2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(note.text)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .padding(.horizontal)
            .navigationTitle(note.title)
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note: .forPreview())
    }
}
