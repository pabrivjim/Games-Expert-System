(deftemplate games
	(slot price (allowed-symbols nil free low medium high))
	(slot rating (allowed-symbols nil low medium high))
	(slot released(allowed-symbols nil old new))
	(slot rel_reg (allowed-symbols nil ww europe, asia))
	(slot popularity (allowed-symbols nil low medium high))
	(slot esrb (allowed-symbols nil child teen adult))
	(slot company (allowed-symbols nil aaa indie))
	(slot platform (allowed-symbols nil console mobile all))
	(slot type (allowed-symbols nil online offline both))
	(slot graphics (allowed-symbols nil low medium high))
	(slot sales (allowed-symbols nil low medium high))
	(slot dlc (allowed-symbols nil yes no))
	(slot split_screen (allowed-symbols nil yes no))
)

(deffacts m (games))

(defrule first ""
	(declare (salience 10))
	(games (price free)
		(esrb child)
)
=>
	(printout t "The following games fits your search: Kami 2." crlf)
	(halt))

(defrule third ""
	(declare (salience 10))
	(games (price free)
		(esrb teen)
		(sales medium)
)
=>
	(printout t "The following games fit your search: Call of Duty: Mobile." crlf)
	(halt))

(defrule fourth ""
	(declare (salience 10))
	(games (price free)
		(esrb teen)
		(sales high)
)
=>
	(printout t "The following games fit your search: Pubg Mobile." crlf)
	(halt))

(defrule fifth ""
	(declare (salience 10))
	(games (price low)
		(type offline)
)
=>
	(printout t "The following games fit your search: Geometry Dash." crlf)
	(halt))

(defrule sixth ""
	(declare (salience 10))
	(games (price low)
		(type online)
		(dlc yes)
)
=>
	(printout t "The following games fit your search: Stardew Valley." crlf)
	(halt))

(defrule seventh ""
	(declare (salience 10))
	(games (price low)
		(type online)
		(dlc no)
)
=>
	(printout t "The following games fit your search: Among Us." crlf)
	(halt))

(defrule eigth ""
	(declare (salience 10))
	(games (price medium)
		(rel_reg asia)
)
=>
	(printout t "The following games fit your search: Metal Dogs." crlf)
	(halt))

(defrule ninth ""
	(declare (salience 10))
	(games (price medium)
		(rel_reg ww)
		(split_screen yes)
)
=>
	(printout t "The following games fit your search: Madden NFL 21." crlf)
	(halt))

(defrule tenth ""
	(declare (salience 10))
	(games (price medium)
		(rel_reg ww)
		(split_screen no)
		(rating medium)
)
=>
	(printout t "The following games fit your search: Crash Bandicoot N Sane Trilogy." crlf)
	(halt))

(defrule eleventh ""
	(declare (salience 10))
	(games (price medium)
		(rel_reg ww)
		(split_screen no)
		(rating high)
		(company indie)
)
=>
	(printout t "The following games fit your search: Celeste." crlf)
	(halt))

(defrule twelfth ""
	(declare (salience 10))
	(games (price medium)
		(rel_reg ww)
		(split_screen no)
		(rating high)
		(company aaa)
		(graphics low)
)
=>
	(printout t "The following games fit your search: Minecraft." crlf)
	(halt))

(defrule thirteenth ""
	(declare (salience 10))
	(games (price medium)
		(rel_reg ww)
		(split_screen no)
		(rating high)
		(company aaa)
		(graphics medium)
)
=>
	(printout t "The following games fit your search: Grand Theft Auto V." crlf)
	(halt))

(defrule fourteenth ""
	(declare (salience 10))
	(games (price high)
		(platform console)
)
=>
	(printout t "The following games fit your search: Yo-Kai Watch 4." crlf)
	(halt))

(defrule fifteenth ""
	(declare (salience 10))
	(games (price high)
		(platform all)
		(released old)
)
=>
	(printout t "The following games fit your search: Red Dead Redemption 2." crlf)
	(halt))

(defrule sixteenth ""
	(declare (salience 10))
	(games (price high)
		(platform all)
		(released new)
		(popularity high)
)
=>
	(printout t "The following games fit your search: Cyberpunk 2077." crlf)
	(halt))

(defrule seventeenth ""
	(declare (salience 10))
	(games (price high)
		(platform all)
		(released new)
		(popularity low)
)
=>
	(printout t "The following games fit your search: Scourge Bringer." crlf)
	(halt))

(defrule induction1 ""
	(declare (salience 5))
	?m <- (games (price free)
		(released nil)
		(popularity nil)
		(platform nil)
		(dlc nil)
		(split_screen nil))
=>
	(modify ?m (released old)
		(popularity low)
		(platform mobile)
		(dlc no)
		(split_screen no)
	)
)

(defrule induction2 ""
	(declare (salience 5))
	?m <- (games (price low)
		(rating nil)
		(released nil)
		(rel_reg nil)
		(company nil)
		(platform nil)
		(graphics nil)
		(split_screen nil))
=>
	(modify ?m (rating high)
		(released old)
		(rel_reg ww)
		(company indie)
		(platform all)
		(graphics low)
		(split_screen no)
	)
)

(defrule induction3 ""
	(declare (salience 5))
	?m <- (games (price medium)
		(dlc nil))
=>
	(modify ?m (dlc yes)
	)
)

(defrule induction4 ""
	(declare (salience 5))
	?m <- (games (price high)
		(company nil)
		(split_screen nil))
=>
	(modify ?m (company aaa)
		(split_screen no)
	)
)


(defrule question-1 ""
        ?m <- (games (price nil))
=>
	(printout t "What price range are you looking for? " crlf)
	(printout t "   free/low/medium/high " crlf)
	(modify ?m (price (read))))

(defrule question-2 ""
        ?m <- (games (rating nil))
=>
	(printout t "What rating range are you looking for? " crlf)
	(printout t "   low/medium/high " crlf)
	(modify ?m (rating (read))))

(defrule question-3 ""
        ?m <- (games (released nil))
=>
	(printout t "Are you looking for a new or for an old game? " crlf)
	(printout t "   old/new " crlf)
	(modify ?m (released (read))))
	
(defrule question-4 ""
        ?m <- (games (rel_reg nil))
=>
	(printout t "Where the game you are looking for could be played? " crlf)
	(printout t "   ww/asia/europe " crlf)
	(modify ?m (rel_reg (read))))

(defrule question-5 ""
        ?m <- (games (popularity nil))
=>
	(printout t "What popularity range are you looking for? " crlf)
	(printout t "   low/medium/high " crlf)
	(modify ?m (popularity (read))))
	
(defrule question-6 ""
        ?m <- (games (esrb nil))
=>
	(printout t "What age range are you looking for? " crlf)
	(printout t "   child/teen/adult " crlf)
	(modify ?m (esrb (read))))

(defrule question-7 ""
        ?m <- (games (company nil))
=>
	(printout t "What type of company has developed the game? " crlf)
	(printout t "   indie/aaa " crlf)
	(modify ?m (company (read))))

(defrule question-8 ""
        ?m <- (games (platform nil))
=>
	(printout t "In what platform can you play the game? " crlf)
	(printout t "   console/mobile/all " crlf)
	(modify ?m (platform (read))))


(defrule question-9 ""
        ?m <- (games (type nil))
=>
	(printout t "What type of game are you looking for? " crlf)
	(printout t "   online/offline/both " crlf)
	(modify ?m (type (read))))


(defrule question-10 ""
        ?m <- (games (graphics nil))
=>
	(printout t "What graphics range are you looking for? " crlf)
	(printout t "   low/medium/high " crlf)
	(modify ?m (graphics (read))))

(defrule question-11 ""
        ?m <- (games (sales nil))
=>
	(printout t "What sales range are you looking for? " crlf)
	(printout t "   low/medium/high " crlf)
	(modify ?m (sales (read))))

(defrule question-12 ""
        ?m <- (games (dlc nil))
=>
	(printout t "DLC? " crlf)
	(printout t "   yes/no " crlf)
	(modify ?m (dlc (read))))


(defrule question-13 ""
        ?m <- (games (split_screen nil))
=>
	(printout t "Split Screen? " crlf)
	(printout t "   yes/no " crlf)
	(modify ?m (split_screen (read))))


(defrule noresp ""
                (not (item $?))
=>
         (printout t "There's no game to be suggested with these parameters!" crlf)
         (halt)
    )

