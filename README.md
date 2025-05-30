# Hotel-Management-System

## 🚀 Features

### Complete CRUD Operations

Add, update, delete, and view hotel data seamlessly, including:                

* Guest registrations                         
* Room allocations                                   
* Booking details                                        
* Payment records                                      

### Advanced Search                                            

Quickly search hotel records by:                                                   

* Guest ID                                                                       
* Room number                                                                           
* Booking date                                                                            

### Comprehensive Reports                                                                   

Generate detailed reports, including:                                                            
📅 Current room occupancy status                                                              
👥 Guests with upcoming check-in/check-out dates                                        
💰 Revenue generated within a specified time frame                                              
🏨 Rooms available by category (AC/Non-AC, Single/Double, etc.)                                

---

## Input Validation                                                                            

✅ **Client-side** (HTML5, JavaScript)                                                          
✅ **Server-side** (JSP/Java)                                                                  

---

## Professional UI                                                                             

* Responsive, user-friendly interface built with **Bootstrap 5**                               
* Smooth navigation and clean, modern layouts                                                    
* **Modular design** using JSP (View), Servlets (Controller), and JDBC/MySQL (Model)             

---

## Database Integration                                                                   

* **MySQL backend** with efficient JDBC connection pooling                                   
* Organized schema for guests, rooms, bookings, and payments

CREATE TABLE `reservations` (                                                            
  `reservationId` int(11) NOT NULL,                                                  
  `customerName` varchar(100) NOT NULL,                                                         
  `roomNumber` int(11) NOT NULL,                                                              
  `checkInDate` date NOT NULL,                                                                 
  `checkOutDate` date NOT NULL,                                                                
  `contact` varchar(15) DEFAULT NULL                                                           
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;                              

INSERT INTO `reservations` (`reservationId`, `customerName`, `roomNumber`, `checkInDate`, `checkOutDate`, `contact`) VALUES                                        

------------------------------------------------------------------------------------------------

Project Structure:

HotelWebApp/                                                                                     
├── WebContent/                                                                            
│ ├── index.jsp                                                                           
│ ├── reservationadd.jsp                                                                  
│ ├── reservationupdate.jsp                                                                      
│ ├── reservationdelete.jsp                                                              
│ ├── reservationdisplay.jsp                                                                   
│ ├── reports.jsp                                                                          
│ ├── report_form.jsp                                                                          
│ └── report_result.jsp                                                                      
├── src/                                                                                         
│ ├── com/                                                                               
│ ├── dao/                                                                                    
│ │ └── ReservationDAO.java                                                                   
│ ├── model/                                              
│ │ └── Reservation.java                                                             
│ └── servlet/                                                                          
│ ├── AddReservationServlet.java                                                     
│ ├── UpdateReservationServlet.java                                                  
│ ├── DeleteReservationServlet.java                                                             
│ ├── DisplayReservationsServlet.java                                                        
│ ├── ReportServlet.java                                                                     
│ └── ReportCriteriaServlet.java                                                            
└── WEB-INF/web.xml                                                                             


🖼️ Screenshots

![image alt](https://github.com/harshi-2673/Hotel-Management-System/blob/main/output_screenshot/homepage.jpeg)

![image alt](https://github.com/harshi-2673/Hotel-Management-System/blob/main/output_screenshot/login.jpeg)

![image alt](https://github.com/harshi-2673/Hotel-Management-System/blob/main/output_screenshot/reservations.jpeg)

![image alt](https://github.com/harshi-2673/Hotel-Management-System/blob/main/output_screenshot/updatereservations.jpeg)

