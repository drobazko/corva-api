## Installation
```
bundle install
```

## Launching
```
cd corva-api/
rackup
```

## Test
```
rspec .
```

## Concerns
The solution is sensitive to a size of input json.
The bigger json is, the more memory the app is consumed. 
In order to solve the issue, app should have been re-written with use of stream approach.       
