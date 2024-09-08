## hw 1 - chatbot for ordering pizza

# create a pizza menu
pizzas = list("Chocolate",
              "Frango",
              "Queijo",
              "Feijao",
              "Carne")

# create a drink menu
drinks <- list("Coca-Cola",
               "Sprite",
               "Guarana",
               "no for me")

# create the bot
order <- function() {
  
  # bot greeting the user
  print("Welcome to Pizza do Igaucu!")
  
  # bot presents menu
  print("What would you like to today?")
  print(paste0("Today pizza ", 1:4, ": ", pizzas))
  print(paste0("Today drink ", 1:4, ": ",  drinks))
  
  # use selects pizza and drink
  pizza_selected <- readline("My pizza: ")
  drink_selected <- readline("My drink: ")
  
  # check onditions
  # if input = not error
  if((tolower(pizza_selected) %in% tolower(pizzas)) & (tolower(drink_selected) %in% tolower(drinks))) {
    
    # show price
    if(tolower(drink_selected) == "no drink for me") {
      print("One pizza. That would be ฿99.00")
    } else {
      print("A pizza and a drink. That would be &129.00")
    }
  } else {
    # if input = error
    print("We don't have that today. Please try again.")
  }
}

order()
