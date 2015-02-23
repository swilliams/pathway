# pathway
Sorta like a state machine for navigating through different View Controllers on iOS.

Sometimes you have a set of ViewControllers that are re-used in various workflows through your app. You really shouldn't store all that state in your ViewControllers because that's gonna get messy. This little library was created to keep that logic out into something else. Take a look at what's in the `Source` folder for the base classes, and then at `PersonStateMachine.swift` in the example app for how it's used.

## Setup
Create a list of states for your app. 
```swift
  let firstnameState = NavigationState(identifier: HomeViewController.self) {
      return HomeViewController(nibName: "HomeViewController", bundle: nil)
  }
  let lastnameState = NavigationState(identifier: LastNameViewController.self) {
      return LastNameViewController(nibName: "LastNameViewController", bundle: nil)
  }
  let finalState = NavigationState(identifier: EndViewController.self) {
      return EndViewController(nibName: "EndViewController", bundle: nil)
  }
```

 Instantiate a `ViewControllerStateMachine` instance and provide it a `UINavigationViewController` and those list of states.
```swift
  let stateMachine = ViewControllerStateMachine(navController: nav, states: [firstnameState, lastnameState, finalState])
```

Call `gotoNext` when you want to move to the ViewController.
```swift
  stateMachine.gotoNext(fromController: self)
```

## Installation
For now, just clone or copy the files in `Source` into your project. As this moves along I'll create a [Cocoapod](http://cocoapods.org/), but for now it's still a little premature for that.

## Future

 * Make a version that works with Storyboards. (This wouldn't be rough, create a new implementation of `State` that stores a segue identifier, then subclass `navigateToNextState` in `ViewControllerStateMachine` to perform that segue.)
 * Make a version that performs some logic to determine which State is next, not just an array that is iterated.
