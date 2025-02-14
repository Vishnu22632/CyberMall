//package com.learn.mycart.dao;
//                      
//import com.learn.mycart.entities.User;
//import javax.persistence.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//
//public class UserDao {
//    private SessionFactory factory;
//
//    public UserDao(SessionFactory factory) {
//        this.factory = factory;
//    }
//    
//    
//    // get user by email and password
//    
//    public User getUserByEmailAndPassword(String email, String password){
//        User user = null;
//        
//        try {
//            String query = "from User where userEmail =: e and userPassword=: p";
//            try (Session session = this.factory.openSession()) {
//                Query q= session.createQuery(query);
//                q.setParameter("e", email);
//                q.setParameter("p",password);
//                user = (User) q.
//                 
//                 
//                 session.close();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        return user;
//    }
//    
//    
//}

//-------------------------------------

package com.learn.mycart.dao;

import com.learn.mycart.entities.User;
import java.io.IOException;
import org.hibernate.HibernateException;
//import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password){
        User user=null;
        
        try{
            String query="from User where userEmail =:e and userPassword =: p";
            try (Session session = this.factory.openSession()) {
                Query q = session.createQuery(query);
                q.setParameter("e",email);
                q.setParameter("p",password);
                
                user=(User) q.uniqueResult();
            }
        }catch(HibernateException e){
        }
        
        return user;
    }   
    
}

