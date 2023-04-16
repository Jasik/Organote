//
//  Note.swift
//  Organote
//
//  Created by Vladimir Rogozhkin on 2023/04/15.
//

import Foundation

struct Note: Identifiable, Equatable {
    let id: UUID
    let createDate: Date
    let title: String
    let text: String
}

extension Note {
    static func forPreview() -> Self {
        .init(
            id: .init(),
            createDate: .init(),
            title: "Title",
            text: "Note text"
        )
    }
}
