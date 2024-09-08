## Goal
# 1. Game of Rock-Paper-Scissors
# 2. Play for 10 rounds
# 3. Sum scores and announce a winner at the end


# ------------------------------------------------------


## Steps
# 1. Create a function to judge and score in each round
# 2. Create a function to announce a winner at the end
# 3. Create a function to run a 10-round game


# ------------------------------------------------------


## Step 1 - function to judge and score
score <- function(user_hand, bot_hand, user_score, bot_score) {
  
  ## case = tie
  if (user_hand == bot_hand) {
    print("👔 Tie.")
  } 
  
  ## case = user won
  else if (user_hand == "rock" && bot_hand == "scissors") {
    print("🎉 You won this round.")
    user_score <- user_score + 1
  } else if (user_hand == "scissors" && bot_hand == "paper") {
    print("🎉 You won this round.")
    user_score <- user_score + 1
  } else if (user_hand == "paper" && bot_hand == "rock") {
    print("🎉 You won this round.")
    user_score <- user_score + 
  }
  
  ## case = bot won
  else {
    print("🙈 You lose this round.")
    bot_score <- bot_score + 1
  }
  
  ## print scores
  print(paste0("Your score: ", user_score))
  print(paste0("Bot's score: ", bot_score))
  
  ## return scores
  return(list(user_score = user_score, bot_score = bot_score))
}

## test the function
score("rock", "rock", 0, 0) # tie
score("rock", "scissors", 0, 0) # user won
score("rock", "paper", 0, 0) # user lose


# ------------------------------------------------------


## Step 2 - Function to announce a winner
winner <- function(user_score, bot_score) {
  
  ## winner = none
  if (user_score == bot_score) {
    print("🤔 Draw. You are a worthy opponent.")
  }
  
  ## winner = user
  else if (user_score > bot_score) {
    print("🥳 Congratulations! You won the game") 
  }
  
  ## winner = bot
  else {
    print("🤪 You lose. Better luck next time.")
  }
}

## test the function
winner(0, 0) # draw
winner(1, 0) # winner = user
winner(0, 1) # winner = bot


# ------------------------------------------------------


## Step 3 - Function to run the game

game <- function() {
  
  ## welcome message
  print("Welcome to a Game of Rock-Paper-Scissors")
  
  ## instruction
  print("We will play for 10 rounds. The one with the highest score wins.")
  print("Let's begin.")
  print("#-------------------------------------------------------")
  
  ## set hands and score
  hands <- c("rock", "paper", "scissors")
  user_score <- 0
  bot_score <- 0
  
  ## rounds
  for (round in 1:10) {
   
   ## print round number
   print(paste0("Round #", round))
   
   ## clear console buffer
   flush.console()
    
   ## get user's input
   user_hand <- tolower(trimws(readline("Choose rock, paper, or scissors: ")))
  
   ## validate input
   while (!(user_hand %in% hands)) {
     print(paste0("There's no such hand in this game. Choose rock, paper, or scissors."))
     user_hand <- tolower(trimws(readline("Try again: ")))
    }
   
   ## print user's hand
   print(paste0("Your choice: ", user_hand))
   
   ## get bot's hand
   bot_hand <- sample(hands, 1)
   print(paste0("Bot's choice: ", bot_hand))
   
   ## get scores
   print(">>>")
   scores <- score(user_hand, bot_hand, user_score, bot_score)
   
   ## update scores
   user_score <- scores$user_score
   bot_score <- scores$bot_score
   
   print("#-------------------------------------------------------")
   ## Pause between rounds to avoid issues with input
   Sys.sleep(0.1)
  }
  
  ## announce the winner
  print("MATCH")
  winner(user_score, bot_score)
  print(paste0("Your final score: ", user_score))
  print(paste0("Bot's final score: ", bot_score))
}


# ------------------------------------------------------


## start the game
game()
