# Real-time chat with Firebase and SwiftUI

## Table of Contents
* [Introducion](#introducion)
* [Technologies](#technologies)
* [Screenshots](#screenshots)
* [Sources](#sources)

## Introduction
A mobile application that allows logged-in users to chat with each other in real time by sending text messages. 

## Technologies
- SwiftUI
- Firebase: Firestore, Authentication, Storage

## Screenshots
### Sign in Page
Logged-in users can chat with each other in real time by sending text messages. If the user is not logged in, the application opens to the login page, otherwise it opens the home page of the logged-in user. 

![image](https://user-images.githubusercontent.com/76847632/232449472-51744876-fd08-40e6-b64f-84367059da01.png)

### Sign up page
The app allows users to create an account with a profile picture and name, as well as an email address and password necessary for authorization. 

![image](https://user-images.githubusercontent.com/76847632/232449477-e49c409a-0115-4045-823d-c026adfb082f.png)

### Homepage
Messages on the homepage are sorted so that the latest ones are at the top.  By clicking on a selected chat, it is possible to go to a conversation with that user. If we want to send a new message to a person with whom we have not yet started a conversation via New message we open a new chat.

![image](https://user-images.githubusercontent.com/76847632/232449486-a0e08d1c-bd6e-4fde-88ce-cca293eb4374.png)

### New Message View
![image](https://user-images.githubusercontent.com/76847632/232449484-1be80971-0fc6-43ca-922e-1ed8c3708bf4.png)

### Chat page
The application allows sending text messages, in the future it is planned to develop this solution with the possibility of sending image files.

![image](https://user-images.githubusercontent.com/76847632/232449480-eb5a6cbc-994f-40e0-a936-55ec46ce58cc.png)

### Sign out
![image](https://user-images.githubusercontent.com/76847632/232450877-94e234d3-51f6-41a2-8ce8-a116a6698da0.png)

## Sources
This app is inspired app tutorial by Brian Voong (https://www.letsbuildthatapp.com/courses/SwiftUI%20Firebase%20Chat)
