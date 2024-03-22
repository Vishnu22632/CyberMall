//
//package com.learn.mycart.dao;
//
//import com.learn.mycart.entities.Category;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//
//public class CategoryDao {
//    private SessionFactory factory;
//
//    public CategoryDao(SessionFactory factory) {
//        this.factory = factory;
//    }
//        
//
////        saves the category to database
//            public int saveCategory(Category cat){
//            Session session =  this.factory.openSession();
//            Transaction tx = session.beginTransacton();
//            int catId = (int) session.save(cat);
//            tx.commit();
//            session.close();
//            
//            return catId;
//        } 
//}


//--------------------------------------------------------------------------------
package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    // saves the category to database
    public int saveCategory(Category cat){
        Session session = this.factory.openSession();
        Transaction tx = null;
        int catId = -1;
        try {
            tx = session.beginTransaction();
            catId = (int) session.save(cat);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return catId;
    }
    
    
    //getting dynamic category from db
    public List<Category> getCategories(){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }   
    
    public Category getCategoryById(int cid){
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
    
    
    
    
    
    
}
