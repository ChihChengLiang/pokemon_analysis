library(data.table)
library(magrittr)

gist_url <- "https://gist.githubusercontent.com/noxwyll/8c821408b1d943c3e500d91d77266368/raw/f264e42f2e83bbe845841717f74b276c9801ba7d/GAME_MASTER_POKEMON_v0_2.tsv"
pokemon_df <- fread(gist_url, sep = "\t") 

# The table use comma as decimal mark
to_number <- function(vector) vector %>% gsub(",", ".", .) %>% as.numeric()
pokemon_df_clean <- pokemon_df %>% 
  mutate_each(
    funs(to_number), 
    BaseCaptureRate,
    BaseFleeRate, 
    CollisionRadiusM, CollisionHeightM, CollisionHeadRadiusM,
    MovementTimerS, JumpTimeS, AttackTimerS, 
    PokemonClass, 
    PokedexHeightM, PokedexWeightKg, 
    HeightStdDev, WeightStdDev
  ) 

pokemon_df_clean %>% write.csv("data/pokemons.csv", row.names = F)
