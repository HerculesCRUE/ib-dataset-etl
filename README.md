![](./images/logos_feder.png)



| Entregable     | Proyecto ETL                                        |
| -------------- | ------------------------------------------------------------ |
| Fecha          | 25/05/2020                                                   |
| Proyecto       | [ASIO](https://www.um.es/web/hercules/proyectos/asio) (Arquitectura Sem·ntica e Infraestructura OntolÛgica) en el marco de la iniciativa [HÈrcules](https://www.um.es/web/hercules/) para la Sem·ntica de Datos de InvestigaciÛn de Universidades que forma parte de [CRUE-TIC](http://www.crue.org/SitePages/ProyectoHercules.aspx) |
| MÛdulo         | Proyecto ETL                                            |
| Tipo           | Software                                                     |
| Objetivo       | Una vez se hayan cargado todos los datos de una de las fuentes, el mÛdulo ETL ser· el encargado de leer los datos de la base de datos intermedia y transformarlos en la estructura de datos definida por la ontologÌa (POJOs). |
| Estado         | **10%** VersiÛn inicial |
| PrÛximos pasos | Desarrollar la ETL hasta transformarlos en los POJOs definidos por la ontologia |
| DocumentaciÛn  | [Manual de usuario](https://github.com/HerculesCRUE/ib-asio-docs-/blob/master/entregables_hito_1/12-An%C3%A1lisis/Manual%20de%20usuario/Manual%20de%20usuario.md)<br />[Manual de despliegue](https://github.com/HerculesCRUE/ib-asio-composeset/blob/master/README.md)<br />[DocumentaciÛn tÈcnica](https://github.com/HerculesCRUE/ib-asio-docs-/blob/master/entregables_hito_1/11-Arquitectura/ASIO_Izertis_Arquitectura.md) |

# Proyecto ETL

Para la incorporaci√≥n del proyecto ETL se precisa realizar la siguiente serie de acciones.

## Base de datos

Se precisa importar el database de la ETL contenido en el Git con el nombre dump_etl. Se deber√° importar en el mismo servidor d√≥nde se encuentra alojado el database de los importadores. 

Este nuevo database crear√° las tablas de control utilizadas por la ETL.

- ControlEjecucion
- ControlEjecucionEstado
- ControlErrores
- ControlCarga
- ControlTipoError
- ControlVersion



Tambi√©n crear√° en el mismo data base, las tablas del DWH. 

- GrupoInvestigacion
- Proyecto
- Universidad



## Fichero kettle.properties

Se modificar√° fichero de par√°metros kettle.properties, ubicado en la ruta del docker, se configurar√°n los par√°metros del proyecto utilizados en la ETL. 

Se especificar√° el nombre de la variable y el valor, estructur√°ndose de la siguiente forma:

[Nombre variable]=[Valor variable]

En el ejemplo se utilizar√°n las siguientes variables.



| Variable             | Descripci√≥n                          | Valor por defecto                                            |
| -------------------- | ------------------------------------ | ------------------------------------------------------------ |
| `param_path`         | Directorio base del repositorio.     | /pentaho-di/repositories/asio-um/project                     |
| `Version`            | Versi√≥n del proyecto.                | 1.0                                                          |
| `VersionDescripcion` | Descripci√≥n del proyecto.            | Proyecto ETL Version 1.0. Aplicacion ETL: Pentaho Data Integration. Version de la aplicacion:9.0 |
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

## Ejecuci√≥n

Una vez configurados los pasos anteriores. Se realizar√° la llamada en cada importaci√≥n de datos, dicha llamada tendr√° el formato

    http://localhost:8080/kettle/runJob/?job=main&version=[Identificador de la versi√≥n]

El Identificador de la versi√≥n ser√≠a variable, con formato integer. Este identifica la versi√≥n que ha cargado la informaci√≥n en la base de datos Source.