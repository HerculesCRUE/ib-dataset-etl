![](./images/logos_feder.png)



| Entregable     | Proyecto ETL                                                 |
| -------------- | ------------------------------------------------------------ |
| Fecha          | 15/07/2021                                                   |
| Revisado por   | Ignacio Gancedo Navarro                                      |
| Proyecto       | [ASIO](https://www.um.es/web/hercules/proyectos/asio) (Arquitectura Sem�ntica e Infraestructura Ontol�gica) en el marco de la iniciativa [H�rcules](https://www.um.es/web/hercules/) para la Sem�ntica de Datos de Investigaci�n de Universidades que forma parte de [CRUE-TIC](https://www.crue.org/proyecto/hercules/) |
| M�dulo         | Proyecto ETL                                                 |
| Tipo           | Software                                                     |
| Objetivo       | Una vez se hayan cargado todos los datos de una de las fuentes, el m�dulo ETL ser� el encargado de leer los datos de la base de datos intermedia y transformarlos en la estructura de datos definida por la ontolog�a (POJOs). |
| Estado         | **100%**                                                     |
| Pr�ximos pasos | Desarrollar la ETL hasta transformarlos en los POJO's definidos por la ontolog�a |
| Documentaci�n  | [Manual de despliegue](https://github.com/HerculesCRUE/ib-dataset-etl/blob/master/manual_despliegue.md)<br/>[Documentaci�n t�cnica](https://github.com/HerculesCRUE/ib-dataset-etl/blob/master/documentacion_tecnica.md)<br/>[Manual de usuario](https://github.com/HerculesCRUE/ib-dataset-etl/blob/master/manual_usuario.md) |

# Proyecto ETL

Para la incorporaci�n del proyecto ETL se precisa realizar la siguiente serie de acciones.

## Base de datos

Se debe importar el database de la ETL contenido en el Git con el nombre dump_etl en el mismo servidor d�nde se encuentra alojado el database de los importadores. Este nuevo database sirve para crear las tablas de control utilizadas por la ETL.

- ControlEjecucion
- ControlEjecucionEstado
- ControlErrores
- ControlCarga
- ControlTipoError
- ControlVersion

Tambi�n crea en el mismo data base, las tablas del DWH. 

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

Se debe modificar el fichero de par�metros kettle.properties, ubicado en la ruta del docker, para configurar los par�metros del proyecto utilizados en la ETL. 

En este fichero se especifica el nombre de la variable y su valor, estructur�ndose de la siguiente forma:

[Nombre variable]=[Valor variable]

En el ejemplo se utilizan las siguientes variables.



| Variable             | Descripci�n                          | Valor por defecto                                            |
| -------------------- | ------------------------------------ | ------------------------------------------------------------ |
| `param_path`         | Directorio base del repositorio.     | /pentaho-di/repositories/asio-um/project                     |
| `Version`            | Versi�n del proyecto.                | 1.0                                                          |
| `VersionDescripcion` | Descripci�n del proyecto.            | Proyecto ETL Version 1.0. Aplicacion ETL: Pentaho Data Integration. Version de la aplicacion:9.0 |
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

## Ejecuci�n

Una vez configurados los pasos anteriores. Se realiza la llamada en cada importaci�n de datos, dicha llamada tiene el formato

    http://localhost:8080/kettle/runJob/?job=main&version=[Identificador de la versi�n]

El Identificador de la versi�n es variable, con formato integer. Este identifica la versi�n que ha cargado la informaci�n en la base de datos Source.

