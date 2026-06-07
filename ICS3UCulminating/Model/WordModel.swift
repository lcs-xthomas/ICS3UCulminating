import Foundation

struct WordModel: Identifiable, Codable {
    
    // MARK: - Stored properties
    let id: UUID
    let targetWord: String
    let scrambledWord: String
    let hint: String
    let category: String
    
    // MARK: - Initializer
    init(id: UUID = UUID(), targetWord: String, scrambledWord: String, hint: String, category: String) {
        self.id = id
        self.targetWord = targetWord
        self.scrambledWord = scrambledWord
        self.hint = hint
        self.category = category
    }
}

// MARK: - Sample Data
extension WordModel {
    static var sampleWords: [WordModel] {
        let words: [WordModel] = [
            // ANIMALS (20 Words)
            WordModel(targetWord: "CAT", scrambledWord: "ACT", hint: "A common feline pet.", category: "Animals"),
            WordModel(targetWord: "DOG", scrambledWord: "GDO", hint: "Man's best friend.", category: "Animals"),
            WordModel(targetWord: "ANT", scrambledWord: "TAN", hint: "A tiny hardworking insect.", category: "Animals"),
            WordModel(targetWord: "BEE", scrambledWord: "EEB", hint: "A yellow and black insect that makes honey.", category: "Animals"),
            WordModel(targetWord: "PIG", scrambledWord: "GPI", hint: "A pink farm animal that loves mud.", category: "Animals"),
            WordModel(targetWord: "LION", scrambledWord: "NILO", hint: "The king of the jungle.", category: "Animals"),
            WordModel(targetWord: "BEAR", scrambledWord: "RABE", hint: "A large furry mammal that hibernates.", category: "Animals"),
            WordModel(targetWord: "FROG", scrambledWord: "GORF", hint: "An amphibian that hops and croaks.", category: "Animals"),
            WordModel(targetWord: "WOLF", scrambledWord: "FLOW", hint: "A wild canine that howls at the moon.", category: "Animals"),
            WordModel(targetWord: "DEER", scrambledWord: "REED", hint: "A forest animal with antlers.", category: "Animals"),
            WordModel(targetWord: "TIGER", scrambledWord: "GRITE", hint: "A large striped cat from Asia.", category: "Animals"),
            WordModel(targetWord: "ZEBRA", scrambledWord: "RAZBE", hint: "An African animal with black and white stripes.", category: "Animals"),
            WordModel(targetWord: "HORSE", scrambledWord: "SERHO", hint: "An animal you can ride or use for racing.", category: "Animals"),
            WordModel(targetWord: "KOALA", scrambledWord: "ALOKA", hint: "A gray Australian marsupial that eats eucalyptus.", category: "Animals"),
            WordModel(targetWord: "WHALE", scrambledWord: "LEHAW", hint: "A massive mammal that lives in the ocean.", category: "Animals"),
            WordModel(targetWord: "MONKEY", scrambledWord: "KEYMON", hint: "A clever primate that likes to climb trees.", category: "Animals"),
            WordModel(targetWord: "TURTLE", scrambledWord: "ELTRUT", hint: "A reptile with a hard protective shell.", category: "Animals"),
            WordModel(targetWord: "RABBIT", scrambledWord: "BITRAB", hint: "A long-eared animal that loves carrots.", category: "Animals"),
            WordModel(targetWord: "GIRAFFE", scrambledWord: "FERAGIF", hint: "The tallest land animal with a very long neck.", category: "Animals"),
            WordModel(targetWord: "PENGUIN", scrambledWord: "NUIGPEN", hint: "A flightless bird that lives in Antarctica.", category: "Animals"),

            // COLORS (20 Words)
            WordModel(targetWord: "RED", scrambledWord: "DER", hint: "The color of a strawberry.", category: "Colors"),
            WordModel(targetWord: "BLUE", scrambledWord: "ELUB", hint: "The color of the sky on a clear day.", category: "Colors"),
            WordModel(targetWord: "PINK", scrambledWord: "NKPI", hint: "A light shade of red.", category: "Colors"),
            WordModel(targetWord: "GREY", scrambledWord: "RYEG", hint: "The color of a rainy cloud.", category: "Colors"),
            WordModel(targetWord: "GOLD", scrambledWord: "DLOG", hint: "A shiny metallic color like a trophy.", category: "Colors"),
            WordModel(targetWord: "GREEN", scrambledWord: "NEERG", hint: "The color of grass and leaves.", category: "Colors"),
            WordModel(targetWord: "BLACK", scrambledWord: "KCALB", hint: "The darkest color, like the night sky.", category: "Colors"),
            WordModel(targetWord: "WHITE", scrambledWord: "TIHEW", hint: "The color of snow or milk.", category: "Colors"),
            WordModel(targetWord: "BROWN", scrambledWord: "NWROB", hint: "The color of chocolate or tree bark.", category: "Colors"),
            WordModel(targetWord: "PURPLE", scrambledWord: "ELPRUP", hint: "A royal color made by mixing red and blue.", category: "Colors"),
            WordModel(targetWord: "ORANGE", scrambledWord: "EGARNO", hint: "A bright color named after a citrus fruit.", category: "Colors"),
            WordModel(targetWord: "YELLOW", scrambledWord: "WELOYL", hint: "The color of a lemon or the sun.", category: "Colors"),
            WordModel(targetWord: "SILVER", scrambledWord: "REVLIS", hint: "A shiny metallic color like a coin.", category: "Colors"),
            WordModel(targetWord: "MAROON", scrambledWord: "NOORAM", hint: "A dark, brownish-red color.", category: "Colors"),
            WordModel(targetWord: "VIOLET", scrambledWord: "TOLOIV", hint: "A shade of purple similar to a flower.", category: "Colors"),
            WordModel(targetWord: "INDIGO", scrambledWord: "GODINI", hint: "A deep blue color in the rainbow.", category: "Colors"),
            WordModel(targetWord: "MAGENTA", scrambledWord: "ATNEGAM", hint: "A purplish-red color.", category: "Colors"),
            WordModel(targetWord: "SCARLET", scrambledWord: "TELRACS", hint: "A very bright red color.", category: "Colors"),
            WordModel(targetWord: "CRIMSON", scrambledWord: "NOSMIRC", hint: "A deep, rich red color.", category: "Colors"),
            WordModel(targetWord: "LAVENDER", scrambledWord: "REDNEVAL", hint: "A pale, soft shade of purple.", category: "Colors"),

            // COUNTRIES (20 Words)
            WordModel(targetWord: "USA", scrambledWord: "ASU", hint: "A country with 50 states.", category: "Countries"),
            WordModel(targetWord: "PERU", scrambledWord: "UREP", hint: "A South American country home to Machu Picchu.", category: "Countries"),
            WordModel(targetWord: "CUBA", scrambledWord: "ABAC", hint: "A Caribbean island nation known for cigars.", category: "Countries"),
            WordModel(targetWord: "CHAD", scrambledWord: "DACH", hint: "A landlocked country in Central Africa.", category: "Countries"),
            WordModel(targetWord: "ITALY", scrambledWord: "YLATI", hint: "A European country shaped like a boot.", category: "Countries"),
            WordModel(targetWord: "SPAIN", scrambledWord: "NIAPS", hint: "A European country known for Flamenco.", category: "Countries"),
            WordModel(targetWord: "JAPAN", scrambledWord: "PANJA", hint: "An island nation in Asia known for sushi.", category: "Countries"),
            WordModel(targetWord: "CHINA", scrambledWord: "ANIHC", hint: "The most populous country in the world.", category: "Countries"),
            WordModel(targetWord: "INDIA", scrambledWord: "AIDNI", hint: "The second most populous country in Asia.", category: "Countries"),
            WordModel(targetWord: "CANADA", scrambledWord: "ADNACA", hint: "The second largest country by land area.", category: "Countries"),
            WordModel(targetWord: "FRANCE", scrambledWord: "ECNARF", hint: "Known for the Eiffel Tower and bread.", category: "Countries"),
            WordModel(targetWord: "BRAZIL", scrambledWord: "LIZARB", hint: "The largest country in South America.", category: "Countries"),
            WordModel(targetWord: "MEXICO", scrambledWord: "OCIXEM", hint: "Known for tacos and Aztec history.", category: "Countries"),
            WordModel(targetWord: "GERMANY", scrambledWord: "NAMYGER", hint: "A European country known for cars and bread.", category: "Countries"),
            WordModel(targetWord: "VIETNAM", scrambledWord: "MANTVIE", hint: "An Asian country known for its scenery and food.", category: "Countries"),
            WordModel(targetWord: "ENGLAND", scrambledWord: "DNALGNE", hint: "Part of the UK, home to Big Ben.", category: "Countries"),
            WordModel(targetWord: "THAILAND", scrambledWord: "DNALIAHT", hint: "Known for its tropical beaches and temples.", category: "Countries"),
            WordModel(targetWord: "PORTUGAL", scrambledWord: "LAGUTROP", hint: "A European country on the Iberian Peninsula.", category: "Countries"),
            WordModel(targetWord: "ARGENTINA", scrambledWord: "ANITNEGRA", hint: "A South American country known for Tango.", category: "Countries"),
            WordModel(targetWord: "PHILIPPINES", scrambledWord: "SENIPILIHP", hint: "An archipelagic country in Southeast Asia.", category: "Countries"),

            // FOOD (20 Words)
            WordModel(targetWord: "EGG", scrambledWord: "GEG", hint: "A breakfast food laid by chickens.", category: "Food"),
            WordModel(targetWord: "HAM", scrambledWord: "MAH", hint: "A type of cured pork meat.", category: "Food"),
            WordModel(targetWord: "PIE", scrambledWord: "EPI", hint: "A baked dessert with a crust and filling.", category: "Food"),
            WordModel(targetWord: "RICE", scrambledWord: "ECIR", hint: "A staple grain eaten all over the world.", category: "Food"),
            WordModel(targetWord: "TACO", scrambledWord: "OCAT", hint: "A Mexican dish in a folded tortilla.", category: "Food"),
            WordModel(targetWord: "PIZZA", scrambledWord: "AZZIP", hint: "A cheesy Italian dish with a crust.", category: "Food"),
            WordModel(targetWord: "PASTA", scrambledWord: "ASTAP", hint: "Italian noodles like spaghetti or penne.", category: "Food"),
            WordModel(targetWord: "BREAD", scrambledWord: "DAERB", hint: "A basic food made from flour and water.", category: "Food"),
            WordModel(targetWord: "APPLE", scrambledWord: "ELPPA", hint: "A crunchy fruit that can be red or green.", category: "Food"),
            WordModel(targetWord: "STEAK", scrambledWord: "KAETS", hint: "A thick slice of high-quality beef.", category: "Food"),
            WordModel(targetWord: "CHEESE", scrambledWord: "ESEEHC", hint: "A dairy product made from milk.", category: "Food"),
            WordModel(targetWord: "BURGER", scrambledWord: "GREBRU", hint: "A sandwich with a meat patty and bun.", category: "Food"),
            WordModel(targetWord: "SALAD", scrambledWord: "DALAS", hint: "A dish made of mixed greens and vegetables.", category: "Food"),
            WordModel(targetWord: "COOKIE", scrambledWord: "EIKOOC", hint: "A sweet baked treat often with chips.", category: "Food"),
            WordModel(targetWord: "BANANA", scrambledWord: "ANANAB", hint: "A long yellow fruit that monkeys love.", category: "Food"),
            WordModel(targetWord: "CHICKEN", scrambledWord: "NEKCIHC", hint: "A popular type of poultry meat.", category: "Food"),
            WordModel(targetWord: "LASAGNA", scrambledWord: "ANGASAL", hint: "A layered Italian pasta dish with meat.", category: "Food"),
            WordModel(targetWord: "PANCAKE", scrambledWord: "EKACNAP", hint: "A flat cake often eaten with syrup.", category: "Food"),
            WordModel(targetWord: "BROCCOLI", scrambledWord: "ILOCCORB", hint: "A green vegetable that looks like a tree.", category: "Food"),
            WordModel(targetWord: "CHOCOLATE", scrambledWord: "ETALOCOHC", hint: "A sweet treat made from cocoa beans.", category: "Food"),

            // SPORTS (20 Words)
            WordModel(targetWord: "GOLF", scrambledWord: "FLOG", hint: "A sport played with a club and a small ball.", category: "Sports"),
            WordModel(targetWord: "JUDO", scrambledWord: "ODUJ", hint: "A martial art and Olympic sport from Japan.", category: "Sports"),
            WordModel(targetWord: "POLO", scrambledWord: "OLOP", hint: "A sport played on horseback with mallets.", category: "Sports"),
            WordModel(targetWord: "RUGBY", scrambledWord: "YGBUR", hint: "A contact sport played with an oval ball.", category: "Sports"),
            WordModel(targetWord: "SOCCER", scrambledWord: "RECCOS", hint: "The world's most popular sport with a ball.", category: "Sports"),
            WordModel(targetWord: "TENNIS", scrambledWord: "SINNET", hint: "Played with rackets and a small yellow ball.", category: "Sports"),
            WordModel(targetWord: "HOCKEY", scrambledWord: "YEKCOH", hint: "Played on ice or field with sticks and a puck.", category: "Sports"),
            WordModel(targetWord: "BOXING", scrambledWord: "GNIXOB", hint: "A combat sport involving gloves and punches.", category: "Sports"),
            WordModel(targetWord: "KARATE", scrambledWord: "ETARAK", hint: "A martial art focused on strikes.", category: "Sports"),
            WordModel(targetWord: "SURFING", scrambledWord: "GNIFRUS", hint: "Riding waves on a board in the ocean.", category: "Sports"),
            WordModel(targetWord: "CRICKET", scrambledWord: "TEKCIRC", hint: "A bat-and-ball game popular in India.", category: "Sports"),
            WordModel(targetWord: "ARCHERY", scrambledWord: "YREHCRA", hint: "A sport using a bow and arrows to hit a target.", category: "Sports"),
            WordModel(targetWord: "CYCLING", scrambledWord: "GNILCYC", hint: "Racing or riding on a bicycle.", category: "Sports"),
            WordModel(targetWord: "BASEBALL", scrambledWord: "LLABESAB", hint: "America's pastime played with a bat and ball.", category: "Sports"),
            WordModel(targetWord: "SWIMMING", scrambledWord: "GNIMMIWS", hint: "Moving through water using your body.", category: "Sports"),
            WordModel(targetWord: "FOOTBALL", scrambledWord: "LLABTOOF", hint: "A popular American sport with a pigskin.", category: "Sports"),
            WordModel(targetWord: "BADMINTON", scrambledWord: "NOTNIMDAB", hint: "Played with rackets and a shuttlecock.", category: "Sports"),
            WordModel(targetWord: "WRESTLING", scrambledWord: "GNILTSERW", hint: "A combat sport involving grappling.", category: "Sports"),
            WordModel(targetWord: "BASKETBALL", scrambledWord: "LLABTEKSAB", hint: "Played by shooting a ball through a hoop.", category: "Sports"),
            WordModel(targetWord: "VOLLEYBALL", scrambledWord: "LLABYELLOV", hint: "Played by hitting a ball over a high net.", category: "Sports"),

            // TECH (20 Words)
            WordModel(targetWord: "APP", scrambledWord: "PPA", hint: "Short for application on a phone.", category: "Tech"),
            WordModel(targetWord: "WEB", scrambledWord: "BEW", hint: "The world wide network of pages.", category: "Tech"),
            WordModel(targetWord: "CODE", scrambledWord: "EDOC", hint: "Instructions written for a computer.", category: "Tech"),
            WordModel(targetWord: "CHIP", scrambledWord: "PIHC", hint: "A small electronic component in computers.", category: "Tech"),
            WordModel(targetWord: "DATA", scrambledWord: "ATAD", hint: "Information stored on a computer.", category: "Tech"),
            WordModel(targetWord: "SWIFT", scrambledWord: "TFIWS", hint: "Apple's modern programming language.", category: "Tech"),
            WordModel(targetWord: "XCODE", scrambledWord: "EDOCX", hint: "The tool used to build iOS applications.", category: "Tech"),
            WordModel(targetWord: "PHONE", scrambledWord: "ENOHP", hint: "A device used for calling and apps.", category: "Tech"),
            WordModel(targetWord: "ROUTER", scrambledWord: "RETOURU", hint: "A device that provides Wi-Fi to your home.", category: "Tech"),
            WordModel(targetWord: "TABLET", scrambledWord: "TELBAT", hint: "A portable touch-screen computer.", category: "Tech"),
            WordModel(targetWord: "LAPTOP", scrambledWord: "POTALP", hint: "A portable computer that fits on your lap.", category: "Tech"),
            WordModel(targetWord: "MOUSE", scrambledWord: "ESUOM", hint: "A device used to control the cursor on screen.", category: "Tech"),
            WordModel(targetWord: "SCREEN", scrambledWord: "NEERCS", hint: "The part of a device that displays images.", category: "Tech"),
            WordModel(targetWord: "SERVER", scrambledWord: "REVRES", hint: "A computer that provides data to others.", category: "Tech"),
            WordModel(targetWord: "MONITOR", scrambledWord: "ROTINOM", hint: "An external screen for a computer.", category: "Tech"),
            WordModel(targetWord: "SOFTWARE", scrambledWord: "ERAWTFOS", hint: "Programs and operating systems.", category: "Tech"),
            WordModel(targetWord: "KEYBOARD", scrambledWord: "DRAOBYEK", hint: "Used for typing text into a computer.", category: "Tech"),
            WordModel(targetWord: "INTERNET", scrambledWord: "TENRETNI", hint: "The global network connecting computers.", category: "Tech"),
            WordModel(targetWord: "COMPUTER", scrambledWord: "RETUPMOC", hint: "A machine for processing data.", category: "Tech"),
            WordModel(targetWord: "ALGORITHM", scrambledWord: "MHTIROGLA", hint: "A set of rules for solving a problem.", category: "Tech")
        ]
        return words
    }
}
