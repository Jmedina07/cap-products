using {com.logali as logali} from '../db/schema';
using {com.training as training} from '../db/training';

service CatalogService {

    entity Products as projection on logali.materials.Products;
    entity Suppliers as projection on logali.Suppliers;    
    // entity Car as projection on logali.Car;


}
