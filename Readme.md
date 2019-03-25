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

## Try on Heroku
```
curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"timestamp":1493758596,"data":[{"title":"Part 1","values":[44,51,82,22,42,35,37,17,56,19,84,46,63,76,60,26,2,4,94,38,5,89,94,85,53,76,31,60,60,88,79,47,44,17,58,62,35,40,45,35,79,48,65,91,1,35,24,23,56,27,7,91,11,33,92,15,25,2,36,80,35,65,15,63,12,57,54,65,64,50,71,99,47,25,40,63,53,29,43,89,68,69,45,84,1,8,47,13,37,1,80,69,55,13,96,16,83,41,11,90]},{"title":"Part 2","values":[86,13,92,65,20,25,2,44,21,50,86,62,71,71,97,86,50,58,86,37,37,44,47,93,46,81,4,95,47,43,3,49,30,96,25,20,79,51,66,33,46,83,34,81,43,97,60,14,98,32,49,23,8,31,47,92,55,47,1,7,5,42,63,84,38,82,19,78,40,78,20,93,22,90,43,9,92,51,68,21,40,19,74,55,42,6,30,76,34,22,36,22,29,78,4,60,86,64,56,81]}]}' https://corva-api.herokuapp.com/compute/1
```

## Concerns
The solution is sensitive to a size of input json.
The bigger json is, the more memory the app is consumed. 
In order to solve the issue, app should have been re-written with use of stream approach.       
