import turtle

def drawFractalLine(t, distance, angle, level):
    if level == 0:
        t.setheading(angle)
        t.forward(distance)
    else:
        distance /= 3.0
        drawFractalLine(t, distance, angle, level - 1)
        angle += 60
        drawFractalLine(t, distance, angle, level - 1)
        angle -= 120
        drawFractalLine(t, distance, angle, level - 1)
        angle += 60
        drawFractalLine(t, distance, angle, level - 1)

def drawKochSnowflake(t, distance, level):
    angles = [0, -120, 120]
    for angle in angles:
        drawFractalLine(t, distance, angle, level)

def main():
    screen = turtle.Screen()
    screen.setup(width=800, height=600)
    
    t = turtle.Turtle()
    t.speed(0)
    t.penup()
    t.goto(-200, 100)
    t.pendown()
    
    distance = 400  
    level = 3       

    drawKochSnowflake(t, distance, level)
    
    t.hideturtle()
    screen.mainloop()

if __name__ == "__main__":
    main()
