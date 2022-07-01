# react-native-gradient

A `<LinearGradient>` element for React Native above 0.68.

> **Warning**: This Package is only for New Architecture.

[![ci][1]][2]
[![npm version][3]][4]
[![npm downloads][5]][4]

## Table of Contents

- [Installation](#installation)
- [Usage and Examples](#examples)
- [Props](#props)
- [Example App](#an-example-app)
- [Troubleshooting](#troubleshooting)
- [Other Platforms](#other-platforms)

## Installation

Using Yarn

```sh
yarn add react-native-gradient
```

Using npm

```sh
npm install react-native-gradient --save
```

### With React Native >= 0.60

Run `npx pod-install`

## Linking (for React Native <= 0.59 only)

Note: If you are using react-native version 0.60 or higher you don't need to link [react-native-gradient](https://github.com/FyndX/react-native-gradient).

### Automatic

```sh
react-native link react-native-gradient
```

## Examples

[react-native-login](https://github.com/brentvatne/react-native-login) is a
legacy component which showcases the use of `<LinearGradient>`.

### Simple

The following code will produce something like this:

![Example code result](https://raw.githubusercontent.com/react-native-community/react-native-linear-gradient/master/images/example.png)

```javascript
import { LinearGradient } from "react-native-gradient";

// Within your render function
<LinearGradient
  colors={["#4c669f", "#3b5998", "#192f6a"]}
  style={styles.linearGradient}
>
  <Text style={styles.buttonText}>Sign in with Facebook</Text>
</LinearGradient>;

// Later on in your styles..
var styles = StyleSheet.create({
  linearGradient: {
    flex: 1,
    paddingLeft: 15,
    paddingRight: 15,
    borderRadius: 5,
  },
  buttonText: {
    fontSize: 18,
    fontFamily: "Gill Sans",
    textAlign: "center",
    margin: 10,
    color: "#ffffff",
    backgroundColor: "transparent",
  },
});
```

### Horizontal gradient

Using the styles from above, set `start` and `end` like this to make the gradient go from left to right, instead of from top to bottom:

```javascript
<LinearGradient
  start={{ x: 0, y: 0 }}
  end={{ x: 1, y: 0 }}
  colors={["#4c669f", "#3b5998", "#192f6a"]}
  style={styles.linearGradient}
>
  <Text style={styles.buttonText}>Sign in with Facebook</Text>
</LinearGradient>
```

### Text gradient (iOS)

On iOS you can use the `MaskedViewIOS` to display text with a gradient. The trick here is to render the text twice; once for the mask, and once to let the gradient have the correct size (hence the `opacity: 0`):

```jsx
<MaskedViewIOS maskElement={<Text style={styles.text} />}>
  <LinearGradient
    colors={["#f00", "#0f0"]}
    start={{ x: 0, y: 0 }}
    end={{ x: 1, y: 0 }}
  >
    <Text style={[styles.text, { opacity: 0 }]} />
  </LinearGradient>
</MaskedViewIOS>
```

### Animated Gradient

TODO:

### Transparent Gradient

The use of `transparent` color will most likely not lead to the expected result. `transparent` is actually a transparent black color (`rgba(0, 0, 0, 0)`). If you need a gradient in which the color is "fading", you need to have the same color with changing alpha channel. Example:

```jsx
// RGBA

<LinearGradient colors={['rgba(255, 255, 255, 0)', 'rgba(255, 255, 255, 1)']} {...otherGradientProps} />

// Hex

<LinearGradient colors={['#FFFFFF00', '#FFFFFF']} {...otherGradientProps} />
```

## Props

In addition to regular `View` props, you can also provide additional props to customize your gradient look:

#### colors

An array of at least two color values that represent gradient colors. Example: `['red', 'blue']` sets gradient from red to blue.

#### start

An optional object of the following type: `{ x: number, y: number }`. Coordinates declare the position that the gradient starts at, as a fraction of the overall size of the gradient, starting from the top left corner. Example: `{ x: 0.1, y: 0.1 }` means that the gradient will start 10% from the top and 10% from the left.

#### end

Same as start, but for the end of the gradient.

#### locations

An optional array of numbers defining the location of each gradient color stop, mapping to the color with the same index in `colors` prop. Example: `[0.1, 0.75, 1]` means that first color will take 0% - 10%, second color will take 10% - 75% and finally third color will occupy 75% - 100%.

```javascript
<LinearGradient
  start={{ x: 0.0, y: 0.25 }}
  end={{ x: 0.5, y: 1.0 }}
  locations={[0, 0.5, 0.6]}
  colors={["#4c669f", "#3b5998", "#192f6a"]}
  style={styles.linearGradient}
>
  <Text style={styles.buttonText}>Sign in with Facebook</Text>
</LinearGradient>
```

![Example with extra props](https://raw.githubusercontent.com/react-native-community/react-native-linear-gradient/master/images/example-other-props.png)

#### useAngle / angle / angleCenter

You may want to achieve an angled gradient effect, similar to those in image editors like Photoshop.
One issue is that you have to calculate the angle based on the view's size, which only happens asynchronously and will cause unwanted flickr.

In order to do that correctly you can set `{ useAngle: true, angle: 45, angleCenter: { x: 0.5, y: 0.5} }`, to achieve a gradient with a 45 degrees angle, with its center positioned in the view's exact center.

`useAngle` is used to turn on/off angle based calculation (as opposed to `start`/`end`).
`angle` is the angle in degrees.
`angleCenter` is the center point of the angle (will control the weight and stretch of the gradient like it does in photoshop.

## An example app

You can see this component in action in [brentvatne/react-native-login](https://github.com/brentvatne/react-native-login/blob/master/App/Screens/LoginScreen.js#L58-L62).

## Troubleshooting

TODO:

### Invariant Violation: Element type is invalid

Ensure you import the `LinearGradient` correctly:

```javascript
// Like that:
import { LinearGradient } from "react-native-gradient";

// Not like that:
import LinearGradient from "react-native-gradient";
```

### Other

Clearing build caches and reinstalling dependencies sometimes solve some issues. Try next steps:

1. Reinstalling `node_modules` with `rm -rf node_modules && yarn`
2. Clearing Android Gradle cache with `(cd android && ./gradlew clean)`
3. Reinstalling iOS CocoaPods with `(cd ios && rm -rf ./ios/Pods/**) && npx pod-install`
4. Clearing Xcode Build cache (open Xcode and go to Product -> Clean Build Folder)

For other troubleshooting issues, go to [React Native Troubleshooting](https://reactnative.dev/docs/troubleshooting.html)

## Other platforms

- Web: [react-native-web-community/react-native-web-linear-gradient](https://github.com/react-native-web-community/react-native-web-linear-gradient)

## License

MIT

[1]: https://github.com/FyndX/react-native-gradient/workflows/ci/badge.svg
[2]: https://github.com/FyndX/react-native-gradient/actions
[3]: https://img.shields.io/npm/v/react-native-gradient.svg
[4]: https://www.npmjs.com/package/react-native-gradient
[5]: https://img.shields.io/npm/dm/react-native-gradient.svg
