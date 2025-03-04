# temp-new-arch-issue

![Build](https://github.com/Bruno125/temp-new-arch-issue/workflows/Pre%20Merge%20Checks/badge.svg)


Showcases that `extraModules:for:` is not being called.

|When not called|Patching `RCTReactNativeFactory` *|
|-|-|
|<img src="https://github.com/user-attachments/assets/a7299d4f-3c85-43f2-9a88-a5a7b15eb660" width=250>|<img src="https://github.com/user-attachments/assets/53d715eb-d9b0-42a8-baff-5d031204a994" width=250>|


*The patched version is when I manually add this to `RCTReactNativeFactory`:

```objc
- (NSArray<id<RCTBridgeModule>> *)extraModulesForBridge:(RCTBridge *)bridge {
	if ([_delegate respondsToSelector:@selector(extraModulesForBridge:)]) {
		return [_delegate extraModulesForBridge:bridge];
	} else {
		return @[];
	}
}
```


# Reproducer TODO list

- [x] 1. Create a new reproducer project.
- [X] 2. Git clone your repository locally.
- [X] 3. Edit the project to reproduce the failure you're seeing.
- [X] 4. Push your changes, so that Github Actions can run the CI.
- [X] 5. Make sure the repository is public and share the link with the issue you reported.

# How to use this Reproducer

This project has been created with `npx @react-native-community/cli init` and is a vanilla React Native app.

> [!IMPORTANT]  
> Make sure you have completed the [React Native - Environment Setup](https://reactnative.dev/docs/set-up-your-environment) so that you have a working environment locally.

## Step 1: Start the Metro Server

First, you will need to start **Metro**, the JavaScript _bundler_ that ships _with_ React Native.

To start Metro, run the following command from the _root_ of your React Native project:

```bash
# using npm
npm start

# OR using Yarn
yarn start
```

## Step 2: Start your Application

Let Metro Bundler run in its _own_ terminal. Open a _new_ terminal from the _root_ of your React Native project. Run the following command to start your _Android_ or _iOS_ app:

### For Android

```bash
# using npm
npm run android

# OR using Yarn
yarn android
```

### For iOS

First, make sure you install dependencies with:

```bash
cd ios && bundle install && bundle exec pod install
```

Then you can run the iOS app with:

```bash
# using npm
npm run ios

# OR using Yarn
yarn ios
```

If everything is set up _correctly_, you should see your new app running in your _Android Emulator_ or _iOS Simulator_ shortly provided you have set up your emulator/simulator correctly.

This is one way to run your app — you can also run it directly from within Android Studio and Xcode respectively.

## Step 3: Modifying your App

Now that you have successfully run the app, let's modify it.

1. Open `App.tsx` in your text editor of choice and edit some lines.
2. For **Android**: Press the <kbd>R</kbd> key twice or select **"Reload"** from the **Developer Menu** (<kbd>Ctrl</kbd> + <kbd>M</kbd> (on Window and Linux) or <kbd>Cmd ⌘</kbd> + <kbd>M</kbd> (on macOS)) to see your changes!

   For **iOS**: Hit <kbd>Cmd ⌘</kbd> + <kbd>R</kbd> in your iOS Simulator to reload the app and see your changes!
