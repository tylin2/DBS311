#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <iomanip>
#include <string>
#include <vector>
#include <occi.h>

//using namespace oracle::occi::Environment;
//using namespace oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;

int mainMenu();
int customerLogin(Connection* conn, int customerId);
double findProduct(Connection* conn, int product_id);
int addToCart(Connection* conn, struct ShoppingCart cart[]);
void displayProducts(struct ShoppingCart cart[], int productCount);
int checkout(Connection* conn, struct ShoppingCart cart[], int customerId, int productCount);

struct ShoppingCart {
  int product_id;
  double price;
  int quantity;
};

int mainMenu() {
  int option;
  int flag = 0;

  cout << "******************** Main Menu ********************" << endl;
  cout << "1)    Login" << endl;
  cout << "0)    Exit" << endl;
  cout << "Enter an option (0-1): ";

  while (flag == 0) {    
    cin >> option;
    switch (option)  {
    case 1:
      flag = 1;
      break;
    case 0:
      flag = 1;
      break;
    default:
      cout << "******************** Main Menu ********************" << endl;
      cout << "1) Login" << endl;
      cout << "0) Exit" << endl;
      cout << "You entered a wrong value. Enter an option (0-1): ";
      break;
    }
    cin.clear();				//Clear the error flag
    cin.ignore(1000, '\n');		//Skip to the newline
  }

  return option;
}

int customerLogin(Connection* conn, int customerId) { 
  Statement* stmt = conn->createStatement();
  int count;
  stmt->setSQL("BEGIN find_customer(:1, :2); END;");
  stmt->setInt(1,customerId);  
  stmt->registerOutParam(2, Type::OCCIINT, sizeof(count));
  stmt->executeUpdate();
  count = stmt->getInt(2); 
  conn->terminateStatement(stmt);
  return count;
}

double findProduct(Connection* conn, int product_id) {
  Statement* stmt = conn->createStatement();
  double count;
  stmt->setSQL("BEGIN find_product(:1, :2); END;");
  stmt->setInt(1, product_id);
  stmt->registerOutParam(2, Type::OCCIDOUBLE, sizeof(count));
  stmt->executeUpdate();
  count = stmt->getDouble(2);
  conn->terminateStatement(stmt);
  return count;  
}

int addToCart(Connection* conn, ShoppingCart cart[]) {  
  int count = 0;
  int flag = 0;
  int check = 1;
  cout << "-------------- Add Products to Cart --------------" << endl;
  while (flag == 0) {
    int p_id = 0;
    double price = 0.00;
    int quantity = 0;
    cout << "Enter the product ID: ";
    cin >> p_id;
    price = findProduct(conn, p_id);
    if (price == 0) {
      cout << "The product does not exists. Try again..." << endl;
    }
    else {
      cout << "Product Price: " << price << endl;
      cout << "Enter the product Quantity: ";
      cin >> quantity;
      cart[count].product_id = p_id;
      cart[count].price = price;
      cart[count].quantity = quantity;
      cout << "Enter 1 to add more products or 0 to checkout: ";
      cin >> check;
      switch (check) {
      case 1:
        count++;        
        break;
      case 0:
        count++;
        displayProducts(cart, count);        
        flag = 1;
        break;
      default:
        break;
      }            
    }
  }
  
  return count;
}

void displayProducts(ShoppingCart cart[], int productCount) {
  double total = 0;
  cout << "------- Ordered Products ---------" << endl;
  for (int i = 0; i < productCount; i++) {
    cout << "---Item " << i + 1 << endl;
    cout << "Product ID: " << cart[i].product_id << endl;
    cout << "Price: " << cart[i].price << endl;
    cout << "Quantity: " << cart[i].quantity << endl;
    total += cart[i].quantity * cart[i].price;
  }
  cout << "----------------------------------" << endl;
  cout << "Total: " << total << endl;
}

int checkout(Connection* conn, ShoppingCart cart[], int customerId, int productCount) {
  char checkout;
  int flag = 0;
  while (flag == 0) {
    cout << "Would you like to checkout? (Y/y or N/n) ";
    cin >> checkout;
    switch (checkout) {
    case 'Y':
    case 'y':
      cout << "The order is successfully completed." << endl;
      flag = 1;
      break;
    case 'N':
    case 'n':
      cout << "The order is cancelled." << endl;
      flag = 1;
      break;
    default:
      cout << "Wrong input. Try again..." << endl;
      break;
    }
    cin.clear();				//Clear the error flag
    cin.ignore(1000, '\n');		//Skip to the newline
  }
  
  return 0;
}

int main() {
  Environment* env = nullptr;
  Connection* conn = nullptr;
  string user = "dbs311_203c23";
  string pass = "19471523";
  string constr = "myoracle12c.senecacollege.ca:1521/oracle12c";
  int menu = 1;  
  try {
    env = Environment::createEnvironment(Environment::DEFAULT);
    conn = env->createConnection(user, pass, constr);
    //cout << "Connection is Successfull" << endl;    
    while (menu == 1) {
      menu = mainMenu();
      switch (menu) {
      case 1:
        int customerId;
        int findCusId;
        cout << "Enter the customer ID: ";
        cin >> customerId;
        findCusId = customerLogin(conn, customerId);
        switch (findCusId) {        
        case 0:
          cout << "The customer does not exist." << endl;
          break;
        default:
          ShoppingCart cart[5];
          int finish = addToCart(conn,cart);
          switch (finish) {          
          case 0:
            break;
          default:
            checkout(conn, cart, customerId, finish);
            break;
          }
          break;
        }
        break;
      case 0:        
        cout << "Good bye!..." << endl;
        env->terminateConnection(conn);
        Environment::terminateEnvironment(env);
        break;      
      }
    }
  }
  catch (SQLException& sqlExcp) {
    cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
  }
  return 0;
}


