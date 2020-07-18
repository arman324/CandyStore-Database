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
from kivy.uix.scrollview import ScrollView

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

class HScrollableLabel(ScrollView):
    text = StringProperty('')
    pass

class ScrollableLabel(ScrollView):
    text = StringProperty('')
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
            layout = GridLayout(cols = 1, padding = 50)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Branch Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        elif self.EmployeeID.text == "":
            layout = GridLayout(cols = 1, padding = 50)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Employee Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        elif self.CustomerID.text == "":
            layout = GridLayout(cols = 1, padding = 50)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Customer Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        elif self.BirthDayServiceID.text == "":
            layout = GridLayout(cols = 1, padding = 50)
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

            layout = GridLayout(cols = 1, padding = 50)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="InvoiceHeaderId "+str(MAXinvoiceHeaderID)+" is made.",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)

            self.ProductID = []
            self.productQuantity = []
            self.AllItems = []
            self.Counter = dict()

            self.BranchID.text = ""
            self.EmployeeID.text = ""
            self.CustomerID.text = ""
            self.BirthDayServiceID.text = ""

class nextScreen(GridLayout,Screen):  #For later function navigation
    def __init__(self, **kwargs): #constructor method
        super(nextScreen, self).__init__(**kwargs) #init parent

        self.cols = 2
        self.inside = GridLayout()
        self.inside.cols = 1

        self.add_widget(Label(text='To print an invoice, enter the invoice eader ID',color =(.0, .6, .9, 1)))
        self.PrintingInvoice = TextInput(multiline=False,background_color=(.3, .6, .5, 1),halign="center")
        self.add_widget(self.PrintingInvoice)

        self.btn = Button(text="Printing Invoice",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedPrintingInvoice)
        self.add_widget(self.btn)

        self.lbl2 = HScrollableLabel(text='Invoice:\n',color =(.0, .6, .9, 1))
        self.add_widget(self.lbl2)


        self.add_widget(Label(text='Enter the customer ID to get all phone numbers.',color =(.0, .6, .9, 1)))
        self.GetPhoneNumbers = TextInput(multiline=False,background_color=(.3, .6, .5, 1),halign="center")
        self.add_widget(self.GetPhoneNumbers)

        self.btn = Button(text="Get Phone Numbers",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedGetPhoneNumbers)
        self.add_widget(self.btn)

        self.lbl = ScrollableLabel(text='Phone Numbers:\n')
        self.add_widget(self.lbl)


        self.btn = Button(text="back",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedbackPage)
        self.add_widget(self.btn)

        self.btn = Button(text="Next Page",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedNextPage)
        self.add_widget(self.btn)


        #self.lbl3 = ScrollableLabel(text='Phone Numbers:\n')
        #self.add_widget(self.lbl3)


    def pressedbackPage(self, instance):
        self.manager.current = 'MyGrid'
        self.lbl2.text = "Total Cost:"
        self.lbl.text = "Phone Numbers:"

    def pressedNextPage(self, instance):
        self.manager.current = 'nextScreenPage3'
        self.lbl2.text = "Total Cost:"
        self.lbl.text = "Phone Numbers:"


    def pressedPrintingInvoice(self, instance):
        if self.PrintingInvoice.text == "":
            layout = GridLayout(cols = 1, padding = 50)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Printing Invoice Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        else:
            PriInvoice = self.PrintingInvoice.text

            self.ExecuteProcedureForCalculateTotalCost = "EXECUTE ComputeTotalCostForInvoiceHeader "+str(PriInvoice)
            cursor.execute(self.ExecuteProcedureForCalculateTotalCost)
            connection.commit()

            self.GetTotalCost = '''select CustomerId,BranchId,BirthdayServiceStatus,TotalCost,OrderDate,EmployeeID
                                from InvoiceHeader
                                where InvoiceHeaderId = '''+str(PriInvoice)
            cursor.execute(self.GetTotalCost)

            Invoice = "CustomerID   BranchID    BirthdayServiceStatus   TotalCost   OrderDate   EmployeeID\n"
            for row in cursor:
                Invoice += (str(row[0]).ljust(30-len(str(row[0])))+str(row[1]).ljust(30-len(str(row[1])))+str(row[2]).ljust(30-len(str(row[2])))+str(row[3]).ljust(20-len(str(row[3])))+str(row[4]).ljust(30-len(str(row[4])))+str(row[5])+'\n')


            self.lbl2.text = "Invoice:\n\n" + Invoice

            self.PrintingInvoice.text = ""

    def pressedGetPhoneNumbers(self, instance):
        if self.GetPhoneNumbers.text == "":
            layout = GridLayout(cols = 1, padding = 50)
            closeButton = Button(text = "Close")
            layout.add_widget(closeButton)
            popup = Popup(title ="Get Phone Numbers Field is empty",content = layout,size_hint =(None, None), size =(500, 500))
            popup.open()
            closeButton.bind(on_press = popup.dismiss)
        else:
            CustomerID = self.GetPhoneNumbers.text

            self.RunFunctionOfGetPhoneNumbers = "select * from ID_phoneNumbers("+str(CustomerID)+")"
            cursor.execute(self.RunFunctionOfGetPhoneNumbers)

            PhoneNumbers = ""

            for row in cursor:
                PhoneNumbers += ("      "+str(row[0]).ljust(10)+row[1].ljust(10)+row[2].ljust(10)+str(row[3])+'\n')

            self.lbl.text = "Phone Numbers:\n" + PhoneNumbers

            self.GetPhoneNumbers.text = ""

class nextScreenPage3(GridLayout,Screen):
    def __init__(self, **kwargs): #constructor method
        super(nextScreenPage3, self).__init__(**kwargs) #init parent

        self.cols = 2
        self.inside = GridLayout()
        self.inside.cols = 1

        self.btn = Button(text="Get Customer's Information",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedCustomerInformation)
        self.add_widget(self.btn)
        self.lbl3 = ScrollableLabel(text="Customer's Information:\n",halign= 'left')
        self.add_widget(self.lbl3)

        self.btn = Button(text="Get Total Sales of Each Coutnry",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedTotalSalesofEachCoutnry)
        self.add_widget(self.btn)
        self.lbl4 = ScrollableLabel(text="Total Sales of Each Coutnry:\n",halign= 'left')
        self.add_widget(self.lbl4)

        self.btn = Button(text="Get the best-selling goods",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedBestSellingGoods)
        self.add_widget(self.btn)
        self.lbl5 = ScrollableLabel(text="The best-selling goods\n",halign= 'left')
        self.add_widget(self.lbl5)

        self.btn = Button(text="Main Information of Total Cost in \neach Country and each Continent",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedMainInformation)
        self.add_widget(self.btn)
        self.lbl6 = ScrollableLabel(text="Main Information of TotalCost:\n",halign= 'left')
        self.add_widget(self.lbl6)


        self.btn = Button(text="Back",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedBack)
        self.add_widget(self.btn)

        self.btn = Button(text="First Page",background_color =(.3, .6, .8, 1),halign="left")
        self.btn.bind(on_press=self.pressedFirstPage)
        self.add_widget(self.btn)


    def pressedFirstPage(self, instance):
        self.manager.current = 'MyGrid'
        self.lbl3.text = "Customer's Information:\n"
        self.lbl4.text = "Total Sales of Each Coutnry:\n"
        self.lbl5.text = "The best-selling goods\n"
        self.lbl6.text = "Main Information of TotalCost:\n"

    def pressedBack(self, instance):
        self.manager.current = 'nextScreen'
        self.lbl3.text = "Customer's Information:\n"
        self.lbl4.text = "Total Sales of Each Coutnry:\n"
        self.lbl5.text = "The best-selling goods\n"
        self.lbl6.text = "Main Information of TotalCost:\n"

    def pressedMainInformation(self, instance):
        MainInformation = ""

        self.RunQueryMainInformation = '''
                WITH newTabel1(CountryName, ContinentName) as
                    (select Country.CountryName, ContinentName
                    from Country)

                select case GROUPING(Country.CountryName)
                        when 0 then Country.CountryName
                        when 1 then 'ALL Countries'
                        END AS Country,
                        case GROUPING(Country.ContinentName)
                        when 0 then Country.ContinentName
                        when 1 then case GROUPING(Country.CountryName)
                                        when 0 then (select ContinentName from newTabel1 where Country.CountryName = newTabel1.CountryName)
                                        when 1 then 'All Continents'
                                        end
                        END AS Continent,
                        SUM(InvoiceHeader.TotalCost) as TotalCost,
                        COUNT(InvoiceHeader.InvoiceHeaderId) as SalesCount

                from InvoiceHeader
                     inner join Branch
                         ON (InvoiceHeader.BranchId = Branch.BranchId)
                     inner join City
                         ON (Branch.CityId = City.CityId)
                     inner join Country
                          ON (City.CountryId = Country.CountryId)
                GROUP BY GROUPING SETS(
                    (),
                    (Country.CountryName),
                    (Country.ContinentName)
                )
                order by TotalCost DESC
        '''
        cursor.execute(self.RunQueryMainInformation)

        for row in cursor:
            MainInformation += ("      "+row[0].ljust(30-len(row[0]))+row[1].ljust(40-len(row[1]))+str(row[2])+'$\n')

        self.lbl6.text = "Main Information of TotalCost:\n" + MainInformation


    def pressedBestSellingGoods(self, instance):
        BestSellingGoods = ""

        self.RunQueryBestSellingGoods = '''
            with newTable (ProductID, Name, SumOfQuantity) AS
                (select *
                from LovelyProduct)

            select Product.ProductId, Product.Name, ISNULL(SumOfQuantity, 0) as TotalSale
            from newTable right join Product
             ON (newTable.ProductID = Product.ProductId)
             order by SumOfQuantity desc
        '''
        cursor.execute(self.RunQueryBestSellingGoods)

        for row in cursor:
            BestSellingGoods += ("      "+str(row[0]).ljust(10-len(str(row[0])))+row[1].ljust(70-len(row[1]))+str(row[2])+'\n')

        self.lbl5.text = "The best-selling goods\n" + BestSellingGoods


    def pressedCustomerInformation(self, instance):
        CustomerInformation = ""

        self.RunQueryCustomerInformation = '''
                select Customer.CustomerName + ' ' + Customer.CustomerLastName as Name, Country.CountryName, Country.ContinentName
                from Customer
                 inner join City
                  ON (Customer.CityId = City.CityId)
                 inner join Country
                   ON (City.CountryId = Country.CountryId)
        '''
        cursor.execute(self.RunQueryCustomerInformation)

        for row in cursor:
            CustomerInformation += ("      "+row[0].ljust(40-len(row[0]))+row[1].ljust(20-len(row[1]))+row[2]+'\n')

        self.lbl3.text = "Customer's Information:\n" + CustomerInformation

    def pressedTotalSalesofEachCoutnry(self, instance):
        TotalSales = ""

        self.RunQueryTotalSales = '''
                with newTable1 (CountryName, TotalSales) as
                    (select Country.CountryName ,SUM(InvoiceHeader.TotalCost)
                    from InvoiceHeader
                     inner join Branch
                         ON (InvoiceHeader.BranchId = Branch.BranchId)
                     inner join City
                         ON (Branch.CityId = City.CityId)
                     inner join Country
                          ON (City.CountryId = Country.CountryId)
                    GROUP BY CountryName)

                select Country.CountryName, ISNULL(TotalSales, 0) as TotalSales
                from Country left join newTable1
                on (Country.CountryName = newTable1.CountryName)
                ORDER BY TotalSales DESC
        '''
        cursor.execute(self.RunQueryTotalSales)

        for row in cursor:
            TotalSales += ("      "+row[0].ljust(40-len(row[0]))+str(row[1])+'\n')

        self.lbl4.text = "Total Sales of Each Coutnry:\n" + TotalSales


class MyApp(App):
    def build(self):
        sm = ScreenManager()
        sm.add_widget(MyGrid(name='MyGrid'))
        sm.add_widget(nextScreen(name='nextScreen'))
        sm.add_widget(nextScreenPage3(name='nextScreenPage3'))
        return sm
        return MyGrid()


if __name__ == "__main__":
    MyApp().run()
