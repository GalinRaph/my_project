from random import sample
import sys


class LotoCard:
    def __init__(self, player):
        self.name_player = player
        self.array = sample(range(1, 90), 27)
        self.array = [self.array[0:9], self.array[9:18], self.array[18:27]]
        self.place = [sample(range(0, 9), 4), sample(range(0, 9), 4), sample(range(0, 9), 4)]        
        for el_num in range(0, 3):
            self.array[el_num].sort()
        for el_num in range(0, 3):
            for i in self.place[el_num]:
                self.array[el_num][i] = ' '


class LotoGame:
    def __init__(self):
        self.barrel = sample(range(1, 91), 90)
        self.keg_number = 0
        self.h_counter = 0
        self.c_counter = 0

    def start(self, h_player, c_player):
        while True:            
            game_word = input(f'Готовы сыграть? Да - Y, Нет - N ---> ')
            if game_word.lower() == 'y' or game_word.lower() == 'да':
                while True:
                    print(f'Выпал бочонок: {self.barrel[self.keg_number]}')
                    k_numb = int(self.barrel[self.keg_number])
                    print(f'Карточка {human_player.name_player}а\n__________________________')                    
                    for x in h_player:
                        print(' '.join(map(str, x)))
                    print(f'__________________________\nКарточка {computer_player.name_player}а\n__________________________')
                    for x in c_player:
                        print(' '.join(map(str, x)))
                    print('__________________________')
                    attempt = input(f'Зачёркиваем карточку? Да - Y, Нет - N. Остановить игру - stop/стоп. ')
                    print('                          \n                          ')                    
                    if attempt.lower() == 'y' or attempt.lower() == 'да':
                        self.h_counter = self.h_counter + 1
                        free_count = []
                        for el_num in range(0, 3):
                            free_count.append(h_player[el_num].count(k_numb))
                        if sum(free_count) == 0:
                            print('Вы ошиблись. Этого значения не было!')
                            sys.exit(0)
                        else:
                            h_player[free_count.index(1)][h_player[free_count.index(1)].index(k_numb)] = '--'
                    elif attempt.lower() == 'стоп' or attempt.lower() == 'stop':
                        sys.exit(0)
                    else:
                        free_count = []
                        for el_num in range(0, 3):
                            free_count.append(h_player[el_num].count(k_numb))
                        if sum(free_count) == 1:
                            print(f'Вы ошиблись, номер был в {free_count.index(1) + 1} строке')
                            sys.exit(0)
                    for el_num in range(0, 3):
                        try:                            
                            i_elem = c_player[el_num].index(k_numb)                            
                            c_player[el_num].remove(k_numb)
                            c_player[el_num].insert(i_elem, '--')
                            self.c_counter = self.c_counter + 1
                        except ValueError:
                            pass

                    if self.c_counter == 15:
                        print(f'Победил {computer_player.name_player}')
                        sys.exit(0)
                    elif self.h_counter == 15:
                        print(f'Победил {human_player.name_player}')
                        sys.exit(0)                        
                    else:
                        pass
                    self.keg_number = self.keg_number + 1
            else:
                print('Жаль, что вы не стали играть :(')
                break


human_player = LotoCard('Игрок')
computer_player = LotoCard('Компьютер')
game = LotoGame()
game.start(human_player.array, computer_player.array)
