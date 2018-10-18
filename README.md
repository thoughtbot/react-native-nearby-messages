
# react-native-nearby-messages

## Getting started

`$ npm install react-native-nearby-messages --save`

### Mostly automatic installation

`$ react-native link react-native-nearby-messages`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-nearby-messages` and add `RNNearbyMessages.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNNearbyMessages.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNNearbyMessagesPackage;` to the imports at the top of the file
  - Add `new RNNearbyMessagesPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-nearby-messages'
  	project(':react-native-nearby-messages').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-nearby-messages/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-nearby-messages')
  	```


## Usage
```javascript
import RNNearbyMessages from 'react-native-nearby-messages';

// TODO: What to do with the module?
RNNearbyMessages;
```
  