//
//  NewTaskItemView.swift
//  Devote
//
//  Created by bui khac lam on 27/08/2023.
//

import SwiftUI

struct NewTaskItemView: View {
    
    //MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task : String = ""
    @Binding var isShowing: Bool

    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    //MARK: - FUCTION
    
    private func addItem() {
      withAnimation {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        newItem.task = task
        newItem.completion = false
        newItem.id = UUID()
        
        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        task = ""
        hideKeyboard()
        isShowing = false
      }
    }

    
    //MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()

                VStack(spacing: 16, content: {
                    TextField("New Task",text: $task)
                        .foregroundColor(.pink)
                        .font(.system(size: 24,weight: .bold,design: .rounded))
                        .padding()
                        .background(
                            isDarkMode ?
                            Color(UIColor.tertiarySystemBackground) :
                                Color(UIColor.secondarySystemBackground)
                        )
                        .cornerRadius(20)
                    
                    Button(action: {
                        addItem()
                        playSound(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)
                    }, label: {
                        Spacer()
                        Text("SAVE")
                            .font(.system(size: 24,weight: .bold,design: .rounded))
                        Spacer()
                    })
                    .disabled(isButtonDisabled)
                    .onTapGesture {
                        if isButtonDisabled {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }
                    .padding()
                    .foregroundColor(isDarkMode ? Color(UIColor.secondarySystemBackground): .white)
                    .background(isButtonDisabled ? Color.blue : Color.pink)
                    .cornerRadius(10)
                    
                })//:VSTACK
                .padding(.horizontal)
                .padding(.vertical,20)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.65), radius: 24)
                .frame(maxWidth: 640)
            
        }//:VSTACK
        .padding()
    }
    
    //MARK: - PREVIEW
    
    struct NewTaskItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewTaskItemView(isShowing: .constant(true))
                .previewDevice("iPhone 12 Pro")
                .background(Color.gray.ignoresSafeArea(.all))
        }
    }
}
