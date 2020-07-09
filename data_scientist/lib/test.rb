questions = ['Combien y a-t-il de handle dans cette array ?',
             'Quelle est le handle le plus court de cette liste ?',
             "Combien y-a-t'il de handle contenant 5 caractères hors @",
             'Combien commencent par une majuscule (première lettre juste après le @) ?',
             'Trie la liste de handle par ordre alphabétique.',
             'Trie la liste de handle par taille des handle (croissant)',
             "Quelle est la position dans l'array de la personne @epenser ?",
             'Sors-moi une répartition des handle par taille de ces derniers']

loop do
  questions.each_with_index { |question, index| puts "[#{index + 1}] #{question}" }

  puts "\n\nChoisis une question en entrant son numéro afin d'afficher la réponse"
  print '> '
  chosenQuestion = gets.chomp.to_i

  break if chosenQuestion > 0 && chosenQuestion <= questions.length

  puts "******* ERREUR : Entrée un chiffre de 1 à #{questions.length} ******* "
  sleep(1)
  puts `clear`
end
