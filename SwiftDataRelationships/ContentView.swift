import SwiftUI
import SwiftData


struct ContentView: View {
    
    @Environment(\ .modelContext) private var context
    
    @Query private var teachers: [TeacherModel]
    
    private func createInitData() {
        
        guard teachers.isEmpty else {return}
        
        let teacher = TeacherModel(name: "Sir")
        
        //create Students Data
        let student1 = StudentModel(name: "Rahul", age: 29)
        let student2 = StudentModel(name: "Titli", age: 24)
        let student3 = StudentModel(name: "Raj", age: 31)
        
        // Establish Relationship
        teacher.students.append(student1)
        teacher.students.append(student2)
        teacher.students.append(student3)
        
        // Insert Into SwiftData
        context.insert(teacher)
        
        do{
            try context.save()
        }catch {
            print("Error saving Data: \(error)")
        }
    }
    var body: some View {
       
        VStack(alignment: .leading,  spacing: 20) {
            
            //We ferch the first Teacher from @Query
            if let teacher = teachers.first {
                
                VStack(alignment: .leading, spacing: 8){
                    Text("TEACHER PROFILE")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text(teacher.name)
                        .font(.title2.bold())
                    
                    Text("Teacher")
                        .font(.caption)
                        .foregroundStyle(.green)
                }
                
                Divider()
                
                //Student List
                VStack(alignment: .leading, spacing: 15){
                    
                    //Dynamic student count
                    Text("Students (\(teacher.students.count))")
                        .font(.headline)
                    
                    //We loop through the teacher's students and display their names.
                    ForEach(teacher.students){student in
                        HStack() {
                            Image(systemName: "person.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.secondary)
                            
                            Text(student.name)
                                .font(.headline)
                            Spacer()
                            
                            Text("\(student.age) years")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                Spacer()
                
            } else {
                Text("No teacher found")
            }
        }
        .padding()
        .task {
            createInitData()
        }
        
    }
}

#Preview {
    ContentView()
}


