# Flame graph exercise

## Preparation

run `npm install` in here
Don't analyze `app.js` before trying the task

## Difficulty
Open app.js and modify `HOW_OBVIOUS_THE_FLAME_GRAPH_SHOULD_BE_ON_SCALE_1_TO_100`
It will affect how hard it is to find the function you're looking for.

difficulty level | value
--- | ---
a month old baby would spot it | 100
still easy | 30
normal | 10 (default)
hard | 5
please try normal first ;) | 1

## Task 1
Run the app through perf. Make the following request:
```
curl http://localhost:8080/api/tick
```
Or just open it in the browser.

Generate a flame graph, identify the function in your code that performs the long synchronous computation.

## Task 2
Now for something more realistic.

Start the app, open http://localhost:8080/ to simulate traffic (it repeatedly makes requests to /api/tick), run a short perf on the running process and generate a flame graph. See if you would identify the function under real traffic. Try with shorter sleep and lower profiling frequency too.
