# MKWKWebView
WKWebView for JS Call back iOS

##Example:

Register the method in you iOS project 
```
self.configuration.userContentController.add(self, name:"HelloMKWKWebView0")
```
You can call iOS method like this 
```
/*
 function_name:the function you register in MKWKWebView like 'HelloMKWKWebView0'
 os:iOS/Mac
 parameters:the parameters
 */
function js_CallSwift(function_name,os,parameters){
    if (os.toLowerCase() == "ios"){
        window["webkit"]["messageHandlers"][function_name]["postMessage"]({'parameters': parameters});
    }
}
```
