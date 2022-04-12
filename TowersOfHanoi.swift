//
//  TowersOfHanoi.swift
//
//  Created by Liam Csiffary
//  Created on 2022-04-12
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  The TowersOfHanoi program uses a recursive function to
//  calculate the optimal move set to solve the towersOfHanoi
//  for any number of rings, however it gets really slow past 15ish
//  code efficiency is defined by O(n^2 - 1) so it just about doubles
//  per number greater you input


// global var so I can count though recursion
var counter = 0

// the actual solver function
func hanoiSolver(n: Int, start: Int, end: Int) {
  counter += 1

  // base case, displays the only relevant move
  if (n == 1) {
    print(start, "->", end)

  } else {
    // finds the other pole
    let other = 6 - (start + end)

    // sends the future plan back to the function
    hanoiSolver(n: n - 1, start: start, end: other)
    print(start, "->", end)

    // does the same but for the final few steps to reconstruct
    // I think. 
    hanoiSolver(n: n - 1, start: other, end: end)
  }
}
 

// main function
func main() {
  // users input variable
  var userNum = 0

  // greet user, gets the users input for how many rings should be
  print("Welcome! This program finds the fastest solution to the towers of hanoi!\n")
  print("How many rings would you like to have 1->?")
  while (true) {
    userNum = Int(readLine()!) ?? 0
    if (userNum < 1) {
      print("Please input an integer >= 1")
    } else {
      break
    }
  }

  // calls the function and prints how many iterations it took
  hanoiSolver(n: userNum, start: 1, end: 3)
  print("It took", counter, "steps to solve the hanoi tower")
}

// start the program
main()
