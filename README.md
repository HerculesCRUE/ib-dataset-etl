![](./images/logos_feder.png)



| Entregable     | Proyecto ETL                                        |
| -------------- | ------------------------------------------------------------ |
| Fecha          | 25/05/2020                                                   |
| Proyecto       | [ASIO](https://www.um.es/web/hercules/proyectos/asio) (Arquitectura Sem�ntica e Infraestructura Ontol�gica) en el marco de la iniciativa [H�rcules](https://www.um.es/web/hercules/) para la Sem�ntica de Datos de Investigaci�n de Universidades que forma parte de [CRUE-TIC](http://www.crue.org/SitePages/ProyectoHercules.aspx) |
| M�dulo         | Proyecto ETL                                            |
| Tipo           | Software                                                     |
| Objetivo       | Una vez se hayan cargado todos los datos de una de las fuentes, el m�dulo ETL ser� el encargado de leer los datos de la base de datos intermedia y transformarlos en la estructura de datos definida por la ontolog�a (POJOs). |
| Estado         | **10%** Versi�n inicial |
| Pr�ximos pasos | Desarrollar la ETL hasta transformarlos en los POJOs definidos por la ontologia |
| Documentaci�n  | [Manual de usuario](https://github.com/HerculesCRUE/ib-asio-docs-/blob/master/entregables_hito_1/12-An%C3%A1lisis/Manual%20de%20usuario/Manual%20de%20usuario.md)<br />[Manual de despliegue](https://github.com/HerculesCRUE/ib-asio-composeset/blob/master/README.md)<br />[Documentaci�n t�cnica](https://github.com/HerculesCRUE/ib-asio-docs-/blob/master/entregables_hito_1/11-Arquitectura/ASIO_Izertis_Arquitectura.md) |

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