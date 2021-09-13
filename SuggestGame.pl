/* KNOWLEDGE BASE */ 
game(cod, specifications(fps, multiplayer, console)).
game(modernwar, specifications(fps, multiplayer, console)).
game(gta, specifications(adventure, multiplayer, console)).
game(minecraft, specifications(sandbox, multiplayer, console)).


game(battlefield, specifications(fps, multiplayer, pc)).
game(hunter, specifications(adventure, multiplayer, pc)).
game(runstars, specifications(sandbox, multiplayer, pc)).


game(contra, specifications(fps, singleplayer, console)).
game(spacestar, specifications(adventure, singleplayer, pc)).
game(blaston, specifications(sandbox, singleplayer, console)).


game(apexlegends, specifications(fps, singleplayer, pc)).
game(zelda, specifications(adventure, multiplayer, pc)).
game(Spider-man, specifications(adventure, singleplayer, console)).
game(blink, specifications(sandbox, singleplayer, console)).


/* Reason why a game fits for that user BACKWARD CHAINING */ 
check_game_preferences(Game) :- 
    game(Game, specifications(Genre, SingleOrMultiplayer, Console)),
    format('Do you like ~w games? (yes/n)', Genre),
    read(Answer),
    Answer == yes,
    format('Do you like to play ~w mode? (yes/n)', SingleOrMultiplayer),
    read(Answer),
    Answer == yes,
    format('Do you like ~w games? (yes/n)', Console),
    read(Answer),
    Answer == yes,
    format('The game ~w suits your preferences', Game).


/* Suggests a game after being asked several questions FORWARD CHAINING */ 
suggest_game(G) :- 
    write('What game genre do you like? (fps/adventure/sandbox):  '),
    read(Genre),
    write('Do you prefer singleplayer or multiplayer games? (singleplayer/multiplayer): '),
    read(SingleOrMultiplayer), 
    write('Do you prefer console or pc games? (console/pc): '),
    read(ConsoleOrPc),
    write('Recommended game to play:'),
    game(G,specifications(Genre, SingleOrMultiplayer, ConsoleOrPc)).


/* Check genre FORWARD CHAINING */
check_genre_preferences(Genre) :-
    game(Game, specifications(Genre, _, _)),
    format('Do you like to play ~w? (yes/no)', Game),
    read(Answer),
    Answer == yes,
    format('The genre ~w suits your preferences.', Genre).


/* Suggest genre BACKWARD CHAINING */
suggest_genre(Game) :- 
    write('What game do you like? (check knowledge base)'),
    read(Game),
    game(Game,specifications(Genre, _, _)),
    format('Recommended Genre: ~w', Genre).


/* Checks if a game in the knowledge base is multiplayer or not (true or false) */
is_multiplayer_game(Game) :-
    game(Game, specifications(_, SingleOrMultiplayer, _)),
    isMultiplayer(SingleOrMultiplayer).
