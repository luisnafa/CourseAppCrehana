# CourseAppCrehana
Challenge

## Description

- This App consumes WebServices and video content to simulate an E-Learning video Application that displays a list of Courses to the user, and inside each Course the user can select a video from the Course and watch the video in the top Video Player.

- The Application has 2 main screens and many classes.

- I used MVVM architecture and decided to use SwiftUI as main UI layouts instead of .xib files or Storyboards.

- I created a Networking API with separated Manager, classes, Models and Requests, the SwiftUI Views only consume the ViewModels and update the View component when data is ready from the WebServices using @Published wrapper as Reactive Programming approach (instead of RxSwift this time, since it made more sense until this point for SwiftUI and wasn't necessary for the current requirements).

