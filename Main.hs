module Main where

import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStrLn "Bem-vindo ao Sistema de Gestao de Estudantes!"
    loop []

loop :: [String] -> IO ()
loop estudantes = do
    putStrLn "\n===== MENU ====="
    putStrLn "1 - Inserir estudante"
    putStrLn "2 - Listar estudantes"
    putStrLn "3 - Contar estudantes"
    putStrLn "4 - Procurar estudante"
    putStrLn "5 - Sair"
    putStr "Escolha uma opcao: "
    hFlush stdout
    opcao <- getLine
    case opcao of
        "1" -> putStrLn "Insercao temporariamente indisponivel." >> loop estudantes
        "2" -> putStrLn "Listagem temporariamente indisponivel." >> loop estudantes
        "3" -> putStrLn "Contagem temporariamente indisponivel." >> loop estudantes
        "4" -> putStrLn "Procura temporariamente indisponivel." >> loop estudantes
        "5" -> putStrLn "A sair..."
        _   -> putStrLn "Opcao invalida!" >> loop estudantes
