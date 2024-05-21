# Load tidyverse

library(tidyverse)

# Check which datasets are built in

data()

# Look up help for mpg dataset

?mpg

mileage <- mpg

# dplyr

## slice_head(), slice_tail()

mileage |> 
  slice_head()

mileage |> 
  slice_head(n = 5)

mileage |>
  group_by(manufacturer) |>
  summarise(best = max(hwy))

mileage |>
  group_by(manufacturer) |>
  summarise(best = max(hwy)) |> 
  arrange(desc(best)) |> 
  slice_head(n = 10)

## case_when()

top_10 <- mileage |> 
  arrange(desc(hwy)) |> 
  slice_head(n = 10)

unique(top_10$year)

top_10 <- top_10 |> 
  mutate(
    decade = case_when(year < 2000 ~ "1990s",
                       .default = "2000s")
  )

top_10 |> 
  filter(decade == "1990s")

top_10 <- top_10 |> 
  mutate(
    buy = case_when(str_detect(trans, "auto") & fl == "r" ~ "yes",
                    .default = "no")
  )

## left_join()

manufacturers <- data.frame(manufacturer = unique(top_10$manufacturer),
                   hq = c("Germany", "Japan", "Japan"))

combined <- top_10 |> 
  left_join(manufacturers)

combined <- top_10 |> 
  left_join(manufacturers) |> 
  relocate(hq, .before = model)

?left_join
# https://rpubs.com/williamsurles/293454
