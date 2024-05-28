import turtle
import random
from turtle import Turtle, tracer, update

def cCurve(t, x1, y1, x2, y2, level):
    def drawLine(x1, y1, x2, y2):
        t.up()
        t.goto(x1, y1)
        t.down()
        t.goto(x2, y2)
        t.pencolor(random.random(), random.random(), random.random())

    if level == 0:
        drawLine(x1, y1, x2, y2)
    else:
        xm = (x1 + x2 + y1 - y2) // 2
        ym = (x2 + y1 + y2 - x2) // 2
        cCurve(t, x1, y1, xm, ym, level - 1)
        cCurve(t, xm, ym, x2, y2, level - 1)

def main():
    level = int(input("Enter the level (0 or greater): "))
    t = turtle.Turtle()
    if level > 8:
        tracer(False)
    t.hideturtle()
    cCurve(t, 50, -50, 50, 50, level)
    if level > 8:
        update()
    turtle.done()

if __name__ == "__main__":
    main()  