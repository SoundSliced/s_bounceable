## 3.0.0
- package no longer holds the source code for it, but exports/exposes the `s_packages` package instead, which will hold this package's latest source code.
- The only future changes to this package will be made via `s_packages` package dependency upgrades, in order to bring the new fixes or changes to this package
- dependent on `s_packages`: ^1.1.2



## 2.1.0
* SBounceable widget now uses Listener with pointer events (onPointerDown, onPointerUp, onPointerCancel) instead of gesture detector's tap events, to activate the scale animation: Pointer events are lower-level and always fire regardless of tap/click pressure


## 2.0.0

* No longer relies on flutter_bounceable package, as it is faulty when wanting to have scaleFactor of 1.0 --> it now uses a combination of GestureDetector and AnimatedScale internally
* isBounceEnabled param added to override whether to show or not the bounce effect

## 1.1.0

* didUpdateWidget added to Sbounceable to rebuild it when scaleFactor parameter is updated
* Example upgraded

## 1.0.0

* Initial stable release
* Added `SBounceable` widget with single and double tap support
* Integrated with `flutter_bounceable` for smooth scale animations
* Customizable scale factor for bounce effect
* Smart tap detection with configurable double-tap threshold (300ms)
* Comprehensive test coverage
* Complete example application

## 0.0.1

* Initial development release
