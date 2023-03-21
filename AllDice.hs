import System.Random (randomRIO)
import Text.Read (readMaybe)

main :: IO ()
main = do
  putStrLn "How many sides does your dice have?"
  input <- getLine
  let maybeSides = readMaybe input :: Maybe Int
  case maybeSides of
    Just sides | sides > 0 -> do
      roll <- randomRIO (1, sides)
      putStrLn $ "You rolled a " ++ show roll
      putStrLn "Roll again? (y/n)"
      againInput <- getLine
      case againInput of
        "y" -> main
        _ -> putStrLn "Goodbye!"
    _ -> putStrLn "Invalid input. Please enter a positive integer."
      >> main
