import pymssql
import kivy
from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.gridlayout import GridLayout
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.widget import Widget
from kivy.properties import StringProperty
from kivy.properties import ObjectProperty
from struct import pack

SERVER = "localhost"
USER = "sa"
PASSWORD = "YourPassword"
DATABASE = "CandyStore"

connection = pymssql.connect(server=SERVER, user=USER,
                password=PASSWORD, database=DATABASE)

cursor = connection.cursor()
cursor.execute("SELECT * FROM Product")

products = []
i = 0


for row in cursor:
    products.append("                      "+str(row[0]).ljust(35-len(str(row[0])))+row[1].ljust(100-len(row[1]))+str(row[5]))
    i += 1

class MyButt(Button):
    pass


class MyGrid(GridLayout):
    def __init__(self, **kwargs):
        super(MyGrid, self).__init__(**kwargs)

        self.add_widget(Label(text='Branch ID',color =(.0, .6, .9, 1)))
        self.BranchID = TextInput(multiline=False,background_color=(.3, .6, .5, 1),halign="center")
        self.add_widget(self.BranchID)
        self.add_widget(Label(text='Employee ID',color =(.0, .6, .9, 1)))
        self.EmployeeID = TextInput(multiline=False,background_color=(.3, .6, .5, 1),halign="center")
        self.add_widget(self.EmployeeID)
        self.add_widget(Label(text='Customer ID',color =(.0, .6, .9, 1)))
        self.CustomerID = TextInput(multiline=False,background_color=(.3, .6, .5, 1),halign="center")
        self.add_widget(self.CustomerID)
        self.add_widget(Label(text='BirthDayService ID',color =(.0, .6, .9, 1)))
        self.BirthDayServiceID = TextInput(multiline=False,background_color=(.3, .6, .5, 1),halign="center")
        self.add_widget(self.BirthDayServiceID)

        self.cols = 1


        self.inside = GridLayout()
        self.inside.cols = 1

        self.lbl = Label(text = "Click on the product you want to buy (You can click on it several times to buy more than one product.)",color =(.0, .6, .9, 1))
        self.add_widget(self.lbl)

        for i in range (0,len(products)):
            self.btn = MyButt(text=str(products[i]))
            self.btn.bind(on_press=self.pressedItem)
            self.add_widget(self.btn)

        self.btn = Button(text="Accept",background_color =(.3, .6, .7, 1),halign="left")
        self.btn.bind(on_press=self.pressedAccept)

        totalCost = "Total cost = 0"
        self.lbl = Label(text = totalCost,color =(.0, .6, .9, 1))
        self.add_widget(self.lbl)

        self.add_widget(self.btn)

    def pressedItem(self, instance):
        print "Name:",instance.text
        Cost = "12$"
        self.lbl.text = "Total cost = " + Cost

    def pressedAccept(self, instance):
        BranchID = self.BranchID.text
        EmployeeID = self.EmployeeID.text
        CustomerID = self.CustomerID.text
        BirthDayServiceID = self.BirthDayServiceID.text
        print "BranchID:",BranchID
        print "EmployeeID:",EmployeeID
        print "CustomerID:",CustomerID
        print "BirthDayServiceID:",BirthDayServiceID

        self.BranchID.text = ""
        self.EmployeeID.text = ""
        self.CustomerID.text = ""
        self.BirthDayServiceID.text = ""


class MyApp(App):
    def build(self):
        return MyGrid()


if __name__ == "__main__":
    MyApp().run()
