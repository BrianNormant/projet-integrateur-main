/* Script d'initialisation de la DB */
/* Author: Daphnée Boutet */

START TRANSACTION;

Create table EQ06_Company(
    name varchar(50) primary key not null,
    balance decimal(5,1)
);

Create table EQ06_Account( 
    userName varchar(50) not null primary key ,
    password varchar(50) not null,
    mail varchar(50) not null,
    Company_id varchar(50) not null,
    CompanyType varchar(15) not null CHECK (companyType IN ('admin', 'maintenance', 'company')),
    FOREIGN KEY(Company_id) REFERENCES EQ06_Company(name) on delete cascade on update cascade
);

Create table EQ06_Station(
    id int AUTO_INCREMENT primary key,
    nameStation varChar(50) not null,
    posX decimal(5) not null,
    posY decimal(5) not null
);

create table EQ06_Token(
    token varchar(100) not null primary key,
    userUsed varchar(50) not null,
    dateExpiration date not null,
    FOREIGN key (userUsed) references EQ06_Account(userName) on delete cascade on update cascade
);

Create table EQ06_Rail(
    id int AUTO_INCREMENT primary key,
    conn1_station int not null,
    conn2_station int not null CHECK (conn1_station != conn2_station),
    longueur decimal(6,1) not null,
    FOREIGN KEY(conn1_station) REFERENCES EQ06_Station(id) on delete cascade,
    FOREIGN KEY(conn2_station) REFERENCES EQ06_Station(id) on delete cascade
);

Create table EQ06_Route(
    id int AUTO_INCREMENT primary key,
    origin_station int not null,
    destination_station int not null CHECK (origin_station != destination_station),
    FOREIGN KEY(origin_station) REFERENCES EQ06_Station(id) on delete cascade,
    FOREIGN KEY(destination_station) REFERENCES EQ06_Station(id) on delete cascade
);

Create table EQ06_RailRoute(
    rail_id int not null,
    route_id int not null,
    FOREIGN KEY(rail_id) REFERENCES EQ06_Rail(id) on delete cascade,
    FOREIGN KEY(route_id) REFERENCES EQ06_Route(id) on delete cascade
);

Create table EQ06_Reservation(
    id int AUTO_INCREMENT primary key,
    company_id varchar(50) not null,
    route_id int not null,
    fare decimal(5) not null,
    dateReserv date not null,
    timeSlot varchar(10) not null CHECK (timeSlot IN ('morning', 'evening', 'night')),
    FOREIGN KEY(company_id) REFERENCES EQ06_Company(name) on delete cascade on update cascade,
    FOREIGN KEY(route_id) REFERENCES EQ06_Route(id) on delete cascade  
);

Create table EQ06_Train(
    id int AUTO_INCREMENT primary key,
    charge decimal(5,3) not null,
    puissance decimal(5,3) not null,
    company_id varchar(50) not null,
    route_id int not null,
    currentRail int,
    lastStation int,
    nextStation int CHECK (lastStation != nextStation),
    FOREIGN KEY(company_id) REFERENCES EQ06_Company(name) on delete cascade on update cascade,
    FOREIGN KEY(route_id) REFERENCES EQ06_Route(id) on delete cascade,
    FOREIGN KEY(currentRail) REFERENCES EQ06_Rail(id) on delete cascade,
    FOREIGN KEY(lastStation) REFERENCES EQ06_Station(id) on delete cascade,
    FOREIGN KEY(nextStation) REFERENCES EQ06_Station(id) on delete cascade
)

COMMIT;
