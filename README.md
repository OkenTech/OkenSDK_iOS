# OkenSDK_iOS

***To get access key, please visit https://oken.tech or contact us via email info@oken.tech!***

## How to import Oken SDK to your iOS Project

To install OkenSDK, please, use cocoapods

```
use_frameworks!

platform :ios, '13.0'

target 'testsdk' do

 pod 'OkenSDK', :git => 'https://github.com/OkenTech/OkenSDK_iOS.git'
end
```

Don't forget to import OkenSDK

```
import OkenSDK
```

## Usage
### Startup
Before you start reading, launch SDK with correct access_key. We recommend launching the SDK inside the didFinishLaunchingWithOptions method.
Launch function is asyncronous, so be careful about calling other OkenSDK methods after receiving a successful response.
Pass the userId to get analytics for a specific user.

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    do {
        try OkenSDK.shared.launch(accessKey: "#your_access_key", userId: "#user_id") { success, error in
            //if success is true, you are ready to go
        }
    } catch {
        print(error)
    }
    
    return true
}
```

### Reading analysis

To create new reading session, pass id of the document and reading area dimensions for portrait and landscape orientations.
DocumentId is needed for agregating sessions by document for your app.
Orientations are needed to present reading analysis results.
```
let dimensions = OkenReadingViewDimensions(portraitContentFrame: portraitContentFrame, landscapeContentFrame: landscapeContentFrame)

do {
    try OkenSDK.shared.startReading(documentId:"#documentId", parentView: self.view, dimensions: dimensions)
} catch {
    print(error)
}
```

To track OkenSDK events, such as analysis results, tracking or connection updates, use these methods to add or remove observers. You can add multiple observers simultaneously.
```
OkenSDK.shared.addRealTimeObserver(self)
```
```
OkenSDK.shared.removeRealTimeObserver(self)
```

### Recording controls

After you start new reading session, you can pause, resume or cancel recording of data.
```
OkenSDK.shared.pauseReading()
```
```
OkenSDK.shared.resumeReading()
```
If you cancel the session, all temporary data will be erased and it will be necessary to create a new reading session.
```
OkenSDK.shared.cancelReading()
```
Current recording state can be received
```
OkenSDK.shared.recordingState

public enum OkenAnalyticsRecordingState {
    /**
     No any data recording
     */
    case disabled
    /**
     Writing "empty" data. Usually used in secondary views, like table of contents on settings
     */
    case paused
    /**
     Writing data
     */
    case running
    
    /**
     Indicates if recording was started. True, if the current state is .paused or .running.
     */
    public var isEnabled: Bool {
        return self == .running || self == .paused
    }
}
```

When reading session is over, don't forget to finish the session. It will create a session object.

```
do {
    try OkenSDK.shared.finishReading(completion: { session, error in
        //save results
    })
} catch {
    print(error)
}
```

**Important!**
If there was no internet connection during reading or finishing the session, the error returned will contain local representation of reading session. 
```

do {
    try OkenSDK.shared.finishReading(completion: { session, error in
        //save results
        switch error {
            case .sessionUpload(_, let model):
                //save model to send it later
            }
    })
} catch {
    print(error)
}

```


Readme to be done...
