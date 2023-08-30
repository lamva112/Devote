//
//  constant.swift
//  Devote
//
//  Created by bui khac lam on 26/08/2023.
//

import SwiftUI

//MARK: - FOTMATTER

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//MARK: - UI

var backgroundGradient : LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink,Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

//MARK: - UX

let feedback = UINotificationFeedbackGenerator()
