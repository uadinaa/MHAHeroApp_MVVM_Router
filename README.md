# MHAHeroApp_MVVM_Router (My Hero Academia Hero App)

## Project Overview

HeroApp is an iOS application that fetches and displays heroes from the My Hero Academia universe using the MVVM architecture. It provides a visually appealing and smooth user experience with animated transitions, search functionality, and a detailed hero information view.

### Demo Video

https://drive.google.com/drive/folders/1S6SwK18PMAvKTLX6m1iA6b4qTvoD2rE2?usp=sharing


## Features

Hero List Display

  -  Displays hero images, full names, nickname, and status.

  - Includes a search bar for filtering heroes by name.

Hero Detail View

  - Shows full hero details, including biography, stats, appearance, and connections.

  - Displays large hero images.

Navigation & Routing

  - Uses a Router pattern with UINavigationController to manage navigation.

  - Integrates SwiftUI views inside UIKit navigation.

Animations

  - Smooth transitions between list and detail views.

  - Animated hero cards when loading.

  - Interactive search bar animations.

Error Handling & Loading States

  - Shows loading indicators while fetching data.

  - Displays error messages when network requests fail.

Technologies Used

  - Swift + SwiftUI for UI implementation

  - MVVM Architecture to ensure a structured and maintainable codebase

  - Router Pattern for managing navigation

  - URLSession for network requests

  - AsyncImage for image loading with placeholders

  - CoreAnimation for smooth UI transitions

API Integration

Base JSON Data Source: All Heroes JSON

Endpoints:

/all.json - Fetches all heroes

/id/{id}.json - Fetches a specific hero's details

Code Structure

HeroApp/
│── Models/       # Codable models for heroes
│── ViewModels/   # MVVM architecture ViewModel layer
│── Views/        # SwiftUI Views for UI
│── Services/     # Network request handling
│── Router/       # Navigation handling
│── Resources/    # Assets & UI-related files

