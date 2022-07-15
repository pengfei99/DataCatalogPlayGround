# En este repositorio, probaremos algunas soluciones de catálogo de datos.

Una lista completa de las soluciones existentes se puede encontrar aquí.

1.  https://www.notion.so/atlanhq/The-Ultimate-Repository-of-Data-Discovery-Solutions-149b0ea2a2ed401d84f2b71681c5a369
2.  https://medium.com/work-bench/work-bench-snapshot-the-evolution-of-data-discovery-catalog-2f6c0425616b

Como solo podemos utilizar la solución de código abierto. Así que nuestros posibles candidatos son:

*   Atlas
*   Amundsen
*   Centro de datos
*   Márquez (Aún no probado)

Si no está familiarizado con la terminología, como el gobierno de datos, la gestión de datos y la gestión de metadatos. Por favor, vaya
a esto [página](https://github.com/johnfelipe/DataGovernance/blob/main/README-es.md)

## 1. Soluciones existentes

A continuación se muestra una clasificación de las soluciones existentes

![Metadata_management_tools_classification](https://raw.githubusercontent.com/pengfei99/DataCatalogPlayGround/master/img/Metadata_management_tools_classification.png)

### 1.1 Las cuatro edades de la evolución de la solución existente

*   Edad de piedra: No hay software, la gente usa pdf, excel u otros documentos para describir los datos. Todo se hace manualmente.
*   Edad de Bronce: Software básico con una base de datos relacional, similar a Excel, pero proporciona una interfaz web que le permite
    para ingerir/actualizar metadatos.
*   Iron age: software diseñado para ayudar a los profesionales de datos a recopilar metadatos automáticamente y gestionarlos.
*   Edad de oro: permitir que todos los usuarios (por ejemplo, usuarios empresariales, profesionales de datos) contribuyan a la ingesta de metadatos en un
    de manera colaborativa e indolora. Los profesionales de datos pueden auditar fácilmente la modificación de metadatos (por ejemplo, aceptar o rechazar).
    Los usuarios empresariales pueden requerir nuevas características de metadatos de los datos (por ejemplo, nuevos criterios de calidad de datos, más atributos de una descripción de datos)

## 2. ¿Cómo elegir la herramienta adecuada?

Para elegir la herramienta/solución adecuada para su organización, debe seguir los siguientes pasos:

### 2.1 Reducir el alcance

Lo primero que debe hacer es comprender su necesidad exacta y reducir su alcance. No hay herramienta mágica que pueda
resuelve todos tus requerimientos.

*   ¿Necesito una herramienta de gobierno de datos que me ayude a definir las políticas y métricas?

*   ¿Necesito una herramienta de validación de datos para realizar el control de calidad de los datos?

*   ¿Necesito una herramienta de administración de metadatos para catalogar datos y hacer descubrimiento de datos, linaje de datos?

### 2.2 Identificar los principales puntos débiles

Una vez que haya definido su alcance, debe identificar los principales puntos débiles que afectan la productividad de sus datos.
Para cada punto de dolor, debe agregar una gravedad (por ejemplo, 1-10).

Por ejemplo, si su científico de datos o analista dedica gran parte de su tiempo a encontrar los datos de interés, debe poner
este punto de dolor **encontrar datos de interés con una gravedad 10**.

### 2.3 Definir los requisitos de la solución

Después de identificar los puntos de dolor, debemos proporcionar una solución para cada punto de dolor. Entonces necesitamos definir detalles
requisitos para cada solución. En función de la gravedad de los puntos débiles, debemos asociar una prioridad a la solución.
implementación.

Por ejemplo, para encontrar los datos de interés, debemos proporcionar un **catálogo de datos/servicio de detección**. Este catálogo de datos
el servicio debe:

*   contener un almacén de metadatos para almacenar todos los tipos de metadatos (por ejemplo, intra, inter, global)
*   proporcionar un motor de búsqueda para encontrar datos fácilmente mediante el uso de
    *   descripción de los datos (por ejemplo, formato, propietario, fecha de creación, etc.),
    *   descripción semántica (por ejemplo, taxonomía, tesauro, etc.)
    *   relación de datos (por ejemplo, linaje, agrupación)

### 2.4 Definir la métrica de referencia

En la sección anterior, hemos definido todos **requisitos funcionales**. Para evaluar una herramienta, también necesitamos definir **no funcional
Requisitos** como costo de implementación, mantenimiento, seguridad (de la herramienta). Debe hablar con los profesionales de datos para
definir estos requisitos no funcionales.

Ahora necesitamos definir la métrica de referencia en función de todos los requisitos (por ejemplo, funcional y no funcional).

### 2.5 evaluar herramientas

Ahora necesitamos evaluar las herramientas existentes utilizando las métricas que hemos definido. Basado en la puntuación
de cada herramienta, debemos saber qué herramienta es la mejor solución para su organización.

## 3. Ejemplo para nuestra evaluación de la solución de gestión de metadatos.

### 3.1 Nuestro alcance

Reducimos nuestro alcance a **gestión de metadatos**. Por lo tanto, no abordaremos problemas como la validación de datos, la seguridad, etc. Si usted
no están familiarizados con los cinco dominios de la gestión de datos, visite este [página](https://github.com/pengfei99/DataGovernance/blob/main/README.md)

### 3.2 Identificar los puntos débiles

| Id | pain_point | gravedad (0 ~10) |
| --- | --------------------------- | ---- |
|1| Difícil encontrar los datos de interés|10|
|2| ¿No conoce el nombre del proveedor de datos |10|
|3| Desconocer la procedencia de los datos|8|
|4| ¿No conoces el esquema de datos|9|
|5| No saber quién y cuándo de la modificación de datos|7|
|6| No saber que los datos están duplicados o no |5|

### 3.3. Definir los requisitos de la solución

Basándonos en los puntos débiles identificados, propondremos dos soluciones

#### 3.3.1 El servicio de descripción de datos

El servicio de descripción de datos debe proporcionar un **almacén de metadatos** que puede almacenar:

*   descripción de datos personalizable (intra-metadatos), como el nombre del proveedor de datos, el esquema de datos, el formato de los datos, el tamaño de los datos, etc.
    Para el punto de dolor 2, 4, 5
*   relaciones entre datos (inter metadatos) como linaje, etiquetado y agrupación. Para el punto de dolor 3,6
*   metadatos semánticos (metadatos globales) como tesauro, taxonomía, etc. Para el punto de dolor 1

También debe proporcionar una interfaz fácil de usar para permitir que el usuario **visualizar la descripción de los datos**
También debe proporcionar una interfaz fácil de usar para permitir que el usuario **asociar datos con metadatos semánticos**

#### 3.3.2 El servicio de descubrimiento de datos

El servicio de detección de datos debe proporcionar un **motor de búsqueda** que pueden encontrar datos:

*   mediante el uso de la descripción de datos, como el nombre del proveedor de datos, el esquema de datos, el formato de los datos, el tamaño de los datos, etc.
*   mediante el uso de metadatos semánticos

También debe proporcionar una interfaz fácil de usar para permitir que el usuario **visualizar el linaje de datos**

### 3.4 Definir las métricas de referencia

Podemos resumir los requisitos funcionales en las siguientes métricas:

*   customizable_data_description (booleano): si permite a los usuarios personalizar atributos para describir datos
*   data_description_visu (booleano): si permite a los usuarios visualizar fácilmente los atributos de un dato.
*   grouping_metadata (booleano): Si permite a los usuarios definir grupos (por ejemplo, organización, año, security_level, etc.) y asociar cualquier dato a cualquier grupo.
*   semantic_metadata (booleano): Si permite a los usuarios definir metadatos semánticos (por ejemplo, tesauro, taxonomía, etc.) y asociar cualquier dato a ellos
*   lineage_metadata (booleano): si permite a los usuarios definir metadatos de linaje (por ejemplo, fuente de una tabla de unión, tabla de resultados de una transformación, etc.) y visualizarlos.
*   search_by_description (booleano): si permite a los usuarios buscar datos utilizando la descripción de los datos (por ejemplo, propietario, formato, creation_data, etc.)
*   search_by_semantic (booleano): si permite a los usuarios buscar datos utilizando los metadatos semánticos
*   search_by_lineage (booleano): si permite a los usuarios buscar datos utilizando su linaje

También necesitamos definir requisitos no funcionales:

*   ease_of_deployment(Cat:easy->1, mediana->0, hard->-1): Si es difícil de implementar y mantener.

*   capacidad (Cat:small->0, mediana->1, large->2): ¿cuántas entidades de datos puede manejar la herramienta (por ejemplo, almacenar y buscar)? pequeño: 0-500k,
    mediana: 500k-1 millón, grande: > 1 millón.

*   metadata_ingestion_method(String) : enumere el método de ingesta de metadatos admitido

*   data_access (booleano): si permite a los usuarios acceder a los datos directamente.

*   catalog_external_data (booleano): si permite a los usuarios catalogar datos públicos o de terceros que se almacenan fuera de la organización.

*   supported_data_type(String): enumere todos los tipos de datos que la herramienta puede catalogar.

*   lineage_granularity_level(String): Enumere el nivel de granularidad que puede hacer un linaje.

*   colaboración (booleana): si permite que los usuarios empresariales y los profesionales de datos trabajen juntos para enriquecer los metadatos.

*   metadata_audit_log: Si tiene registro de auditoría (creación, modificación, eliminación) para metadatos.

*   usage_metrics: Si proporciona métricas de actividad de la plataforma (por ejemplo, ID de usuario, consulta de búsqueda, etc.)

*   access_control(Cat:basic->0, median->1, advance->2): Si permite el control de acceso a metadatos de lectura y escritura. medios básicos
    otorgar derechos o no, sin soporte RBAC. La mediana significa que tiene soporte RBAC, pero la regla RBAC no tiene la granularidad para
    entidad individual de control. Advance means tiene RBAC y control de acceso granular.

*   authentication_method(String): enumere todos los métodos de autenticación admitidos.

## 3.5 Evaluar herramientas

|tool_name|customizable_data_description| data_description_visu|grouping_metadata| lineage_metadata| semantic_metadata| puntuación |
| --- |----- |--- |--- |--- |--- | ---|
| Amundsen| No| Sí| Sí| No| No| 2 |
| Atlas| Sí| Sí| Sí| Sí| Sí| 5|
| Datahub| Sí| Sí| Sí| Sí\*| Sí| 5|

|tool_name|search_by_description|search_by_semantic|search_by_lineage|ease_of_deployment|capacidad| puntuación |
| --- |----- |--- |--- |--- |--- | ---|
| Amundsen| Sí\*| No| No|median|median|1.5|
| Atlas| Sí| Sí| Sí|hard|large|4|
| Datahub| No| Sí| Sí\*|hard|large|2.5|

|tool_name|metadata_ingestion_method|data_access|catalog_external_data|supported_data_type|colaboración|puntuación |
| --- |----- |--- |--- |--- |--- |---|
| Amundsen| API de Python| No| Sí| DB, tabla, columna| No|3|
| Atlas| API python/Java/Rest, interfaz de usuario web, | de gancho automatizado No| Sí| Todos| No|5|
| Datahub| Cliente de Python (configuración de YAML), API de rest| No| Sí| Todos| No|4.5|

|tool_name|metadata_audit_log| usage_metrics |access_control| authentication_method| puntuación |
| --- |----- |--- |--- |--- |---|
| Amundsen| No| No|básica| OIDC|1|
| Atlas| Sí| No|median| OIDC,archivo,Kerberos,ldap,PAM|4|
| Datahub| No| Sí|advance| OIDC,JAAS(file,db,ldap)|5|

|tool_name| Total_score|
| --- |----- |
| Amundsen|7,5|
| Atlas|18|
| Datahub|17|

Nota:

1.  Amundsen proporciona búsqueda por descripción, pero solo permite cinco tipos de descripción: tipo de fuente (tipo de datos), column_name,
    etc. A diferencia de Atlas, el usuario puede usar toda la descripción para filtrar datos.
2.  Datahub proporciona metadatos de linaje, pero recopilan los metadatos de linaje solo para el linaje de tareas. Así que no tenemos
    toda la información sobre los datos producidos. Como resultado, realmente no podemos buscar datos por linaje.
