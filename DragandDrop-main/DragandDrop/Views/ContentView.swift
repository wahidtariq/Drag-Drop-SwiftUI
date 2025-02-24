

import SwiftUI
import Algorithms
import UniformTypeIdentifiers



struct TaskBoardView: View {
    @State private var toDoTasks: [TaskItem] = [TaskMockData.taskOne, TaskMockData.taskTwo, TaskMockData.taskThree, TaskMockData.taskFour]
    @State private var inProgressTasks: [TaskItem] = []
    @State private var doneTasks: [TaskItem] = []
    @State private var strTxtName : String = ""
    @State private var showPopup = false
    
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                headerSectionView
                HStack(spacing: 10) {
                    cardsSectionView
                }
            }
            customPopUpView
        }
    }
    
    private var headerSectionView: some View {
        DragAndDropHeaderSection {
            showPopup.toggle()
        }
        .padding(.top, 10)
    }
    
    private var cardsSectionView: some View {
        HStack(spacing: 10) {
            TaskColumnView(title: "To Do", tasks: toDoTasks, isTargeted: isToDoTargeted)
                .dropDestination(for: TaskItem.self) { droppedTasks, location in
                    for task in droppedTasks {
                        inProgressTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = toDoTasks + droppedTasks
                    toDoTasks = Array(totalTasks.uniqued())
                    return true
                } isTargeted: { isTargeted in
                    isToDoTargeted = isTargeted
                }
            
            TaskColumnView(title: "In Progress", tasks: inProgressTasks, isTargeted: isInProgressTargeted)
                .dropDestination(for: TaskItem.self) { droppedTasks, location in
                    for task in droppedTasks {
                        toDoTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = inProgressTasks + droppedTasks
                    inProgressTasks = Array(totalTasks.uniqued())
                    return true
                } isTargeted: { isTargeted in
                    isInProgressTargeted = isTargeted
                }
            
            TaskColumnView(title: "Done", tasks: doneTasks, isTargeted: isDoneTargeted)
                .dropDestination(for: TaskItem.self) { droppedTasks, location in
                    for task in droppedTasks {
                        toDoTasks.removeAll { $0.id == task.id }
                        inProgressTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = doneTasks + droppedTasks
                    doneTasks = Array(totalTasks.uniqued())
                    return true
                } isTargeted: { isTargeted in
                    isDoneTargeted = isTargeted
                }
        }
        .padding()
    }
    
    private var customPopUpView: some View {
        CustomPopUpView(taskName: $strTxtName, showPopup: showPopup) {
            guard !strTxtName.isEmpty else {
                showPopup = false // Validation not to allow empty ToDo's Dismiss the popup
                return
            }
            let task = TaskItem(title: strTxtName)
            toDoTasks.append(task)
            strTxtName = ""
            showPopup = false
        }
    }
}

#Preview {
    TaskBoardView()
}

