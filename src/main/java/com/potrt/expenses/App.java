package com.potrt.expenses;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.potrt.expenses.entities.Person;

public class App 
{
    public static void main( String[] args )
    {
        // Create Configuration
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");
        configuration.setProperty("hibernate.connection.username", System.getenv("dbUsername"));
        configuration.setProperty("hibernate.connection.password", System.getenv("dbPassword"));
        configuration.addAnnotatedClass(Person.class);
 
        // Create Session Factory
        SessionFactory sessionFactory
            = configuration.buildSessionFactory();
 
        // Initialize Session Object
        Session session = sessionFactory.openSession();
 
        session.beginTransaction();

        Person person = session.get(Person.class, 1);

        session.getTransaction().commit();
        session.close();

        sessionFactory.close();

        System.out.println(person.getFirstName());
    }
}
