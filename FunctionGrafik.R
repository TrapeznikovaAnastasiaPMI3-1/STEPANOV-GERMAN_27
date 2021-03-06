library(Cairo)#библиотека
FunctionGrafik <- function(rt, N){#задаем имя и параметры функции
  # функция, выполняющая упражнение 5
  # Параметр args:
  # rt: вектор, содержащий распределение переменной x
  # N: вектор, содержащий распределение переменной e
  # Результат:
  # Функция рисует график и сохраняет его
  # Функция не возвращает значения
  #константы 
  n <- 27 #-номер варианта 
  
  #5.1. Создать связанные случайные векторы x,y по 300 наблюдений в каждом по таблице.
  set.seed(n)
  x <- rt(300, 4, 4) #Закон распределения х
  e <- rnorm(300, 0, 3) #закон распределения е
  y <- 12 + 4*x + e #модель связи х и у
  
  #5.2.Средствами базовой графики R создать совмещенный график разброса с коробчатыми диаграммами вдоль осей. На центральный график пунктиром нанести медианы х и у.
  #5.3. Сохранить график в файл "plot-ex05.png"
  CairoPNG('plot-ex05.png', 600, 600) # открыть поток вывода в файл "plot-ex05.png"
  
  layout(matrix(c(2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 4, 3, 3, 3), 4, 4, byrow = T))
  plot(x, y) # первый точечный график.
  abline(v = median(x), h = median(y), col = "lightgray", lty = 2)# вертикальная и горизонтальная линии медиан, светло-серого цвета, пунктиром
  boxplot(y, cex.axis = 1.5)# коробчатая диаграмма под номером 2
  boxplot(x, horizontal = T, cex.axis = 1.5)# коробчатая диаграмма под номером 3, повернутая горизонтально
  
  dev.off() #закрыть поток вывода в файл
}
