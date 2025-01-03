package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;

    // Method to provide the singleton instance of SessionFactory
    public static SessionFactory getFactory() {
        if (factory == null) {
            try {
                // Create a Configuration instance and configure it
                Configuration cfg = new Configuration();
                cfg.configure("hibernate.cfg.xml"); // Loads configuration from hibernate.cfg.xml

                // Build the SessionFactory from the Configuration object
                factory = cfg.buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return factory;
    }

    // Method to close the SessionFactory when the application shuts down
    public static void closeFactory() {
        if (factory != null) {
            factory.close();
        }
    }
}
