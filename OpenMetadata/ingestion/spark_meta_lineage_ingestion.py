from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.master("local")
    .appName("localTestApp")
    .config(
        "spark.jars",
        "path/to/openmetadata-spark-agent.jar,path/to/mysql-connector-java-8.0.30.jar",
    )
    .config(
        "spark.extraListeners",
        "org.openmetadata.spark.agent.OpenMetadataSparkListener",
    )
    .config("spark.openmetadata.transport.hostPort", "http://localhost:8585")
    .config("spark.openmetadata.transport.type", "openmetadata")
    .config("spark.openmetadata.transport.jwtToken", "<openmetadata-jwt-token>")
    .config(
        "spark.openmetadata.transport.pipelineServiceName", "my_pipeline_service"
    )
    .config("spark.openmetadata.transport.pipelineName", "my_pipeline_name")
    .config(
        "spark.openmetadata.transport.pipelineSourceUrl",
        "http://your.org/path/to/pipeline",
    )
    .config(
        "spark.openmetadata.transport.pipelineDescription", "My ETL Pipeline"
    )
    .config(
        "spark.openmetadata.transport.databaseServiceNames",
        "random,local_mysql",
    )
    .config("spark.openmetadata.transport.timeout", "30")
    .getOrCreate()
)

# Read table using jdbc()

# Read from MySQL Table
employee_df = (
    spark.read.format("jdbc")
    .option("url", "jdbc:mysql://localhost:3306/openmetadata_db")
    .option("driver", "com.mysql.cj.jdbc.Driver")
    .option("dbtable", "employee")
    .option("user", "openmetadata_user")
    .option("password", "openmetadata_password")
    .load()
)

# Write data to the new employee_new table
(
    employee_df.write.format("jdbc")
    .option("url", "jdbc:mysql://localhost:3306/openmetadata_db")
    .option("driver", "com.mysql.cj.jdbc.Driver")
    .option("dbtable", "employee_new")
    .option("user", "openmetadata_user")
    .option("password", "openmetadata_password")
    .mode("overwrite")
    .save()
)

# Stop the Spark session
spark.stop()
