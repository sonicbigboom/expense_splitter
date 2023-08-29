package com.potrt.expenses;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.potrt.expenses.entities.Person;

public class App 
{
    public static void main( String[] args )
    {
        // Create Configuration
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");
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
