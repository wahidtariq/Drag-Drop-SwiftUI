import SwiftUI
import Algorithms
import UniformTypeIdentifiers

struct TaskItem: Codable, Hashable, Transferable {
    
    let id: UUID
    let title: String
    let owner: String
    let note: String
    
    init(
        id: UUID = UUID(),
        title: String,
        owner: String = "tanay",
        note: String = ""
    ) {
        self.id = id
        self.title = title
        self.owner = owner
        self.note = note
    }
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .taskItem)
    }
}

extension Array where Element == TaskItem {
    
    static var `default`: [TaskItem] {
        [
            TaskMockData.taskOne,
            TaskMockData.taskTwo,
            TaskMockData.taskThree,
            TaskMockData.taskFour
        ]
    }
}

extension UTType {
    static let taskItem = UTType(exportedAs: "tanay.DragandDrop")
}
