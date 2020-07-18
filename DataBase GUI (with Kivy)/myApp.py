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
from kivy.uix.popup import Popup
from kivy.uix.gridlayout import GridLayout
from kivy.uix.boxlayout import BoxLayout
from kivy.lang import Builder
from kivy.uix.screenmanager import ScreenManager, Screen

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


class MyGrid(GridLayout,Screen):
    Cost = 0.0
    Counter = dict()
    AllItems = []
    ProductID = []
    productQuantity =[]
    InsertToSQLServer = ""

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

        self.btn = Button(text="NextPage",background_color =(.3, .6, .7, 1),halign="left")
        self.btn.bind(on_press=self.pressedNextPage)
        self.add_widget(self.btn)

    def pressedNextPage(self, instance):
        self.manager.current = 'nextScreen'

    def pressedItem(self, instance):
        listOfItems = instance.text.split()
        self.AllItems.append(listOfItems[0])
        self.Cost += float(listOfItems[len(listOfItems)-1])
        self.lbl.text = "Total cost = " + str(self.Cost)

    def pressedAccept(self, instance):
        if self.BranchID.text == "":
            layout = GridLayout(cols = 1, padding = 40)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Branch Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        elif self.EmployeeID.text == "":
            layout = GridLayout(cols = 1, padding = 40)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Employee Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        elif self.CustomerID.text == "":
            layout = GridLayout(cols = 1, padding = 40)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Customer Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        elif self.BirthDayServiceID.text == "":
            layout = GridLayout(cols = 1, padding = 40)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="BirthDayService Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        else:
            BranchID = self.BranchID.text
            EmployeeID = self.EmployeeID.text
            CustomerID = self.CustomerID.text
            BirthDayServiceID = self.BirthDayServiceID.text


            self.lbl.text = "Total cost = 0"
            self.Cost = 0.0
            #print self.AllItems
            for itemNumber in self.AllItems:
                if itemNumber in self.Counter:
                    self.Counter[itemNumber] += 1
                else:
                    self.Counter[itemNumber] = 1

            #print self.Counter

            for this in self.Counter:
                self.ProductID.append(int(this))
                self.productQuantity.append(self.Counter[this])

            #print self.ProductID
            #print self.productQuantity

            self.InsertToSQLServer = "insert into InvoiceHeader VALUES (" + CustomerID +","+ BranchID +",NULL," + BirthDayServiceID+",NULL,GETDATE()," +EmployeeID+")"
            cursor.execute(self.InsertToSQLServer)
            connection.commit()

            #print self.InsertToSQLServer

            cursor.execute("select MAX(InvoiceHeaderID) from InvoiceHeader")
            for row in cursor:
                MAXinvoiceHeaderID = row[0]

            for i in range (0,len(self.ProductID)):
                self.InsertToSQLServer = "insert into InvoiceDetail VALUES (" + str(MAXinvoiceHeaderID) + ","+ str(self.ProductID[i]) + "," + str(self.productQuantity[i]) + ",NULL,NULL)"
                cursor.execute(self.InsertToSQLServer)
                connection.commit()


            self.ProductID = []
            self.productQuantity = []
            self.AllItems = []
            self.Counter = dict()

            self.BranchID.text = ""
            self.EmployeeID.text = ""
            self.CustomerID.text = ""
            self.BirthDayServiceID.text = ""


class nextScreen(Screen):  #For later function navigation
    def __init__(self, **kwargs): #constructor method
        super(nextScreen, self).__init__(**kwargs) #init parent
        self.btn = Button(text="back",background_color =(.3, .6, .7, 1),halign="left")
        self.btn.bind(on_press=self.pressedbackPage)
        self.add_widget(self.btn)

    def pressedbackPage(self, instance):
        self.manager.current = 'MyGrid'





class MyApp(App):
    def build(self):
        sm = ScreenManager()
        sm.add_widget(MyGrid(name='MyGrid'))
        sm.add_widget(nextScreen(name='nextScreen'))
        return sm
        return MyGrid()


if __name__ == "__main__":
    MyApp().run()
