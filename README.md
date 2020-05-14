# Proyecto ETL

Para la incorporación del proyecto ETL se precisa realizar la siguiente serie de acciones.

## Base de datos

Se precisa importar el database de la ETL contenido en el Git con el nombre dump_etl. Se deberá importar en el mismo servidor dónde se encuentra alojado el database de los importadores. 

Este nuevo database creará las tablas de control utilizadas por la ETL.

- ControlEjecucion
- ControlEjecucionEstado
- ControlErrores
- ControlCarga
- ControlTipoError
- ControlVersion



También creará en el mismo data base, las tablas del DWH. 

- GrupoInvestigacion
- Proyecto
- Universidad



## Fichero kettle.properties

Se modificará fichero de parámetros kettle.properties, ubicado en la ruta del docker, se configurarán los parámetros del proyecto utilizados en la ETL. 

Se especificará el nombre de la variable y el valor, estructurándose de la siguiente forma:

[Nombre variable]=[Valor variable]

En el ejemplo se utilizarán las siguientes variables.



| Variable             | Descripción                          | Valor por defecto                                            |
| -------------------- | ------------------------------------ | ------------------------------------------------------------ |
| `param_path`         | Directorio base del repositorio.     | /pentaho-di/repositories/asio-um/project                     |
| `Version`            | Versión del proyecto.                | 1.0                                                          |
| `VersionDescripcion` | Descripción del proyecto.            | Proyecto ETL Version 1.0. Aplicacion ETL: Pentaho Data Integration. Version de la aplicacion:9.0 |
| `HostnameSource`     | Hostname de la base de datos Source. | mariadb                                                      |
| `DatabaseSource`     | Database de la base de datos Source. | asio_jobs                                                    |
| `PortSource`         | Puerto de la base de datos Source.   | 3306                                                         |
| `UserSource`         | Usuario de la base de datos Source.  | root                                                         |
| `PwdSource`          | Password de la base de datos Source. | root                                                         |
| `HostnameTarget`     | Hostname de la base de datos Target. | mariadb                                                      |
| `DatabaseTarget`     | Database de la base de datos Target. | asio_etl                                                     |
| `PortTarget`         | Puerto de la base de datos Target.   | 3306                                                         |
| `UserTarget`         | Usuario de la base de datos Target.  | root                                                         |
| `PwdTarget`          | Password de la base de datos Target. | root                                                         |
| `HostnameKafka`      | Hostname del servicio Kafka.         | kafka                                                        |
| `PortKafka`          | Puerto del servicio Kafka.           | 9092                                                         |
| `TopicKafkaErrores`  | Topic del kafka de errores.          | general-errores                                              |
| `TopicKafkaPojos`    | Topic de los pojos de kafka.         | general-data                                                 |
| `KeyKafka`           | Identificador del topic de kafka.    | general-data-pojo-client-0                                   |

## Ejecución

Una vez configurados los pasos anteriores. Se realizará la llamada en cada importación de datos, dicha llamada tendrá el formato

    http://localhost:8080/kettle/runJob/?job=main&version=[Identificador de la versión]

El Identificador de la versión sería variable, con formato integer. Este identifica la versión que ha cargado la información en la base de datos Source.