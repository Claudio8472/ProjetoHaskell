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
        "1" -> do
            putStr "Introduza o nome do estudante: "
            hFlush stdout
            nome <- getLine
            let novosEstudantes = estudantes ++ [nome]
            putStrLn "Estudante adicionado com sucesso!"
            loop novosEstudantes
        "2" -> do
            if null estudantes
                then putStrLn "A lista de estudantes esta vazia."
                else do
                    putStrLn "\n--- Lista de Estudantes ---"
                    mapM_ (\(i, nome) -> putStrLn (show i ++ ". " ++ nome)) (zip [1..] estudantes)
            loop estudantes
        "3" -> do
            let total = length estudantes
            putStrLn ("Total de estudantes registados: " ++ show total)
            loop estudantes
        "4" -> do
            putStr "Introduza o nome a procurar: "
            hFlush stdout
            nome <- getLine
            if nome `elem` estudantes
                then putStrLn ("O estudante '" ++ nome ++ "' foi encontrado.")
                else putStrLn ("O estudante '" ++ nome ++ "' nao foi encontrado.")
            loop estudantes
        "5" -> putStrLn "A fechar o programa. Ate breve!"
        _   -> do
            putStrLn "Opcao invalida! Tente novamente."
            loop estudantes
