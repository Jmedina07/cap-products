namespace com.logali;

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

// type EmailAddresses_01 : many {
//     kind  : String;
//     email : String;
// }

// type EmailAddresses_02 {
//     kind  : String;
//     email : String;
// }

// entity Emails {
//     email_01  :      EmailAddresses_01;
//     email_02  : many EmailAddresses_02;
//     email_03  : many {
//         kind  :      String;
//         email :      String;
//     }
// }

// type Gender : String enum {
//     male;
//     female;
// }

// entity Order {
//     ClientGender : Gender;
//     status       : Integer enum {
//         submited  = 1;
//         fulfiller = 2;
//         shipped   = 3;
//         cancel    = 4;
//     };
//     priority     : String @assert.range enum {
//             high;
//             medium;
//             low;
//         }
// }
// entity Car {
//     key ID : UUID;
//     name : String;
//     virtual dicount_1 : Decimal;
//     @Core.Computed : false
//     virtual dicount_2 : Decimal;
// }

entity Products {
    key ID               : UUID;
        Name             : String not null;
        Descripction     : String;
        ImageURL         : String;
        ReleaseData      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
}

entity Suppliers {
    key ID      : UUID;
        name    : String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
}

entity Categories {
    key ID   : String(1);
        name : String;
}

entity StockAvailability {
    key ID          : Integer;
        Description : String;
}

entity Currencies {
    key ID          : String(3);
        Description : String;
}

entity UnitofMeasures {
    key ID          : String(2);
        Description : String;
}

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
}

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String;
}

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
}

entity SalesData {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}

entity SelProducts   as select from Products;

entity SelProducts3  as
    select from Products
    left join ProductReview
        on Products.Name = ProductReview.Name
    {
        Rating,
        Products.Name,
        sum(Price) as TotalPrice,
    }
    group by
        Rating,
        Products.Name
    order by
        Rating;

entity ProjProducts  as projection on Products;

entity ProjProducts2 as projection on Products {
    *
};

entity ProjProducts3 as projection on Products {
    ReleaseData,
    Name
};
// entity  ParamProducts( pName : String ) as
//     select
//         Name, Price, Quantity
//     from Products
//     where Name = :pName;
    
