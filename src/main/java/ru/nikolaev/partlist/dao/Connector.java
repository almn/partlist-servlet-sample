/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.nikolaev.partlist.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Properties;
import org.apache.log4j.Logger;
import org.apache.log4j.Priority;

/**
 *
 * @author alexander
 */
public class Connector {

    final static Logger LOGGER = org.apache.log4j.Logger.getLogger(Connector.class);

    private Connection connection;

    Connector() {
        this.connection = null;
        CreateConnection();
    }

    /**
     * Экземпляр подключения к базе данных
     *
     * @return <code>Connection</code> или <code>null</code>, если при
     * подключении произошли ошибки
     */
    public static Connection getConnection() {
        return ConnectorSingleton.INSTANCE.connection;
    }

    /**
     * Создание подключение по данным из конфигурации
     */
    private void CreateConnection() {
        // пути и пароли прочитаем из пропертей
        String propertiesPath = Objects.requireNonNull(Thread.currentThread().getContextClassLoader().getResource("database.properties")).getPath();
        InputStream propReadStream = null;
        try {
            propReadStream = new FileInputStream(propertiesPath);
            Properties prop = new Properties();
            prop.load(propReadStream);

            // Загружаем драйвер
            Class.forName(prop.getProperty("class", "org.postgresql.Driver"));

            // Свойства из пропертей
            String dbHost = prop.getProperty("host", "localhost");
            String dbPort = prop.getProperty("port", "5432");
            String dbName = prop.getProperty("database", "partlist");
            //String dbUser = prop.getProperty("user", "postgres");
            //String dbPassword = prop.getProperty("password", "");

            StringBuilder url = new StringBuilder("jdbc:postgresql://");
            url.append(dbHost).append(":").append(dbPort).append("/").append(dbName);

            this.connection = DriverManager.getConnection(url.toString(), prop);

        } catch (FileNotFoundException ex) {
            LOGGER.log(Priority.ERROR, "database.properties file not found", ex);
        } catch (IOException ex) {
            LOGGER.log(Priority.ERROR, "database.properties file read error", ex);
        } catch (SQLException ex) {
            LOGGER.log(Priority.ERROR, "Database connection creation error", ex);
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            LOGGER.log(Priority.ERROR, "Database driver class not found", ex);
        } finally {
            if (propReadStream != null) {
                try {
                    propReadStream.close();
                } catch (IOException ex) {
                    LOGGER.log(Priority.ERROR, "database.properties file close error", ex);
                }
            }
        }
    }

    private static class ConnectorSingleton {

        /**
         * Единственный экземпляр объекта с подключением к БД
         */
        public static final Connector INSTANCE = new Connector();
    }
}
