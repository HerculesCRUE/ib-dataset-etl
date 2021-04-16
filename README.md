![](./images/logos_feder.png)



| Entregable     | Proyecto ETL                                                 |
| -------------- | ------------------------------------------------------------ |
| Fecha          | 23/04/2021                                                   |
| Proyecto       | [ASIO](https://www.um.es/web/hercules/proyectos/asio) (Arquitectura Semántica e Infraestructura Ontológica) en el marco de la iniciativa [Hércules](https://www.um.es/web/hercules/) para la Semántica de Datos de Investigación de Universidades que forma parte de [CRUE-TIC](https://www.crue.org/proyecto/hercules/) |
| Módulo         | Proyecto ETL                                                 |
| Tipo           | Software                                                     |
| Objetivo       | Una vez se hayan cargado todos los datos de una de las fuentes, el módulo ETL será el encargado de leer los datos de la base de datos intermedia y transformarlos en la estructura de datos definida por la ontología (POJOs). |
| Estado         | **100%**                                                     |
| Próximos pasos | Desarrollar la ETL hasta transformarlos en los POJOs definidos por la ontologia |
| Documentación  | [Manual de despliegue](https://github.com/HerculesCRUE/ib-dataset-etl/blob/master/manual_despliegue.md)<br/>[Documentación técnica](https://github.com/HerculesCRUE/ib-dataset-etl/blob/master/documentacion_tecnica.md)<br/>[Validaciones](https://github.com/HerculesCRUE/ib-dataset-etl/blob/master/validaciones.md) |

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

- Articulo
- Factura
- Libro
- Patente
- Persona
- GrupoInvestigacion
- Proyecto
- Universidad
- Rel_AutorArticulo
- Rel_AutorLibro
- Rel_DatosEquipoInvestigacion
- Rel_EquipoProyecto
- Rel_InventorPatente
- Rel_RelacionOrigenProyecto


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
| `DatabaseTarget` | Database de la base de datos Target. | asio_etl                                                     |
| `PortTarget`         | Puerto de la base de datos Target.   | 3306                                                         |
| `UserTarget`         | Usuario de la base de datos Target.  | root                                                         |
| `PwdTarget`          | Password de la base de datos Target. | root                                                         |
| `HostnameKafka`      | Hostname del servicio Kafka.         | kafka                                                        |
| `PortKafka`          | Puerto del servicio Kafka.           | 9092                                                         |
| `TopicKafkaErrores`  | Topic del kafka de errores.          | general-errores                                              |
| `TopicKafkaPojos`    | Topic de los pojos de kafka.         | general-data|
| `TopicKafkaPojos`    | Topic de los pojos de kafka con relaciones.        | general-link-data                                                 |
| `KeyKafka`           | Identificador del topic de kafka.    | general-data-pojo-client-0 |
| `EndPointUrl`           | EndPoint de control de cargas.    | http://management-system:8080/etl-notifications                                   |

## Ejecución

Una vez configurados los pasos anteriores. Se realizará la llamada en cada importación de datos, dicha llamada tendrá¡ el formato

    http://localhost:8080/kettle/runJob/?job=main&version=[Identificador de la versión]

El Identificador de la versión serÃ­a variable, con formato integer. Este identifica la versión que ha cargado la información en la base de datos Source.

