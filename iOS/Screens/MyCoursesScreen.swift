//
//  MisCursosScreen.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

struct MyCoursesScreen: View {
    private let padding: CGFloat = 20
    private let widthForHeader = UIScreen.main.bounds.width - (16 * 2)
    @ObservedObject private var coursesViewModel = CoursesViewModel()
    
    init() {
        coursesViewModel.getCourses()
        UITableView.appearance().backgroundColor = UIColor(Colors.darkBackground)
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(alignment: .leading){
                    Text(Strings.mycourses).foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: abs(geometry.size.width - (padding * 2)),
                               alignment: .leading)
                    
                    List {
                        ForEach(coursesViewModel.courses, id:\.self) { course in
                            VStack(alignment: .leading, spacing: 0) {
                                CourseCell(title: course.title,
                                           subTitle: course.professorFullName,
                                           imageUrl: course.promoImage)
                                
                                NavigationLink(destination: PlayerScreen()) {
                                    EmptyView().frame(height: 0)
                                }
                            }
                        }.listRowBackground(Colors.darkBackground)
                    }
                }.frame(height: geometry.size.height, alignment: .top)
                .background(Colors.darkBackground)
            }
        }.background(Colors.darkBackground)
    }
}

struct MyCoursesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyCoursesScreen()
    }
}
