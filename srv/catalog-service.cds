using {com.logali as logali} from '../db/schema';

service CatalogService {

    entity Products as projection on logali.Products;
    entity SalesData as projection on logali.SalesData;


}
