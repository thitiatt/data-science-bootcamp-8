# Data Pizza
pizzas <- data.frame(
  id = 1:5,
  menu = c("Seafood Deluxe", "Hawaiian", "Ham&Crab Sticks",
           "Chicken Trio", "Double Cheese"),
  price = c(439, 339, 379, 359, 299)
)

# Data Size
pizza_size <- data.frame(
  id = 1:3,
  size = c("Small", "Medium", "Large"),
  price = c("+0", "+40", "+90")
)

# Data Crust
pizza_crust <- data.frame(
  id = 1:3,
  type_crust = c("Thin", "Medium", "Cheese"),
  price = c("+0", "+20", "+50")
)

# Choose Pizza
choose_pizza <- function() {
  pizza_name <- c()
  pizza_price <- c()
  size_price <- c()
  crust_price <- c()

  # number of order
  print("What's your name?")
  your_name <- readLines("stdin", n=1)
  print(paste("Hello", your_name, "How many pizza you want to order?"))
  num <- readLines("stdin", n=1)

  for ( i in 1:num) {
  # select pizza menu
  print(pizzas)
    while (TRUE) {
      print(paste("Select Pizza id for order", i))
      pz_name <- readLines("stdin", n=1)
        if (pz_name %in% pizzas$id) {
          pizza_price <- c(pizza_price,pizzas$price[pizzas$id == pz_name])
          pizza_name <- c(pizza_name,pizzas$menu[pizzas$id == pz_name])
          break
        } else {
          print("Try Again correct Pizza id!!")
        }
    }
  # select pizza size
  print(pizza_size)
    while (TRUE) {
      print(paste("Select Size id for order", i))
      pz_size <- readLines("stdin", n=1)
        if (pz_size %in% pizza_size$id) {
          size_price <- c(size_price,as.numeric(pizza_size$price
                        [pizza_size$id == pz_size]))
          break
        } else {
          print("Try Again correct Pizza id!!")
        }
    }
  # select pizza crust
  print(pizza_crust)
    while (TRUE) {
      print(paste("Select Type Crust id for order", i))
      pz_crust <- readLines("stdin", n=1)
        if (pz_crust %in% pizza_crust$id) {
          crust_price <-c(crust_price,as.numeric
                        (pizza_crust$price[pizza_crust$id == pz_crust]))
          break
        } else {
          print("Try Again correct Pizza id!!")
        }
    }  
  total_price <- sum(pizza_price) + sum(size_price) + sum(crust_price)
  }
  # show order
  total <- data.frame(
    name = pizza_name,
    price = pizza_price,
    size = size_price,
    crust = crust_price
  )
    print(total)
  # comfirm order
  while (TRUE) {
    print("Are you comfirm order? [Y/N]")
    confirm <- readLines("stdin", n=1)
    if (confirm == "Y" | confirm == "y") {
      print("Thanks You")
      print(paste("Total Price = ",total_price))
      break
    } else if (confirm == "N" | confirm == "n") {
      print("Please New Order Again")
      choose_pizza()
      break
    } else {
      print("Try Again [Y/N]")
    }
  }
  # Add condition to add another order pizza
  if (confirm == "Y" | confirm == "y") {
    while (TRUE) {
      print("Would you like to add another order? [Y/N]")
      another_order <- readLines("stdin", n=1)
      if (another_order == "Y" | another_order == "y") {
        choose_pizza()
        break
      } else if (another_order == "N" | another_order == "n") {
        print("Thanks you, Please Come Back Again")
        break
      } else {
      print("Try Again [Y/N]")
      }
    }
  }
}

# Call the function
choose_pizza()
