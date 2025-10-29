# Beyond Earth – Earth Observation Product Generation Platform (EOPGP)

## Overview
The **Beyond Earth – Earth Observation Product Generation Platform (EOPGP)** delivers a **scalable, end-to-end pipeline** for processing and analyzing Earth Observation (EO) data.  
It implements the architecture proposed in *“Scalable, End-to-End Big EO Data Management in Public Cloud Provider”* (DHR Call-off Order), turning it into a fully functional **Product-as-a-Service (PaaS)** on **CloudFerro/CREODIAS** environment.

The platform automates the ingestion, preprocessing, analysis and publication of EO data products—allowing scientists, decision-makers and end-users to **focus on insights, not infrastructure**.



## Objectives
- **Automate** the full EO data lifecycle, from search and download to Level-3 product generation.  
- **Scale dynamically** using Kubernetes orchestration on CloudFerro.  
- **Leverage cloud-native storage**, with S3 and Zarr for big-data analytics.  
- **Integrate ML analytics**, including change-detection mapping.  
- **Provide modular services** as reusable Docker-based processors.  
- **Expose data and metadata** through a STAC API for interoperability and discoverability.  
- **Enable interactive analysis** and visualization through JupyterHub and a web gateway.



## Infrastructure & DevOps
The deployment is **cloud-native**, built around:
- **Kubernetes clusters** on **CloudFerro/Creodias** for elastic scaling.  
- **Terraform** for automated infrastructure provisioning.  
- **GitHub Actions** for CI/CD and deployment automation.  
- **S3-compatible Object Storage** for EO data and derived Zarr assets.  
- **PostGIS + pgSTAC** for catalog indexing and querying.  
- **Apache Kafka** for inter-service messaging and event orchestration.
- **Flask** for the lightweight, modular web UI that interfaces with the backend services and user workflows.


## Core Components

| Component | Description |
|------------|-------------|
| **Gateway** | Routes requests between UI, processors and storage endpoints. |
| **Hub Manager** | Orchestrates JupyterHub sessions for interactive analysis. |
| **UI** | Front-end for task submission, status monitoring and visualization. |
| **Kafka Messaging** | Decoupled communication layer between services. |
| **Docker Services** | Containerized processors enabling modular scalability. |



## Implemented Processors

1. **Search & Download Processor**  
   Automates Sentinel-2 data retrieval from Copernicus DataSpace.  

2. **Sentinel-2 Preprocess Processor**  
   Reprojects, clips and prepares data for analysis (ARD generation).  

3. **Change Detection ML Processor** 
   Utilizes ML models to detect temporal changes in land-surface conditions.  

4. **Zarr Format Integration**  
   Enables parallel, memory-efficient processing with `xarray` and `dask`.  

5. **STAC Catalogue Generation**  
   Indexes products into pgSTAC, ensuring FAIR data access via standard APIs.  

## Data Format Evaluation: Zarr vs COG vs GeoTIFF

We export the processed results also in **Zarr** format and conducted a comparative analysis of GeoTIFF, COG and Zarr, evaluating their performance, scalability and suitability for cloud-native EO data workflows.

## Workflow Summary

1. User defines **area and time of interest** → submitted via UI/Gateway.  
2. **Kafka** triggers Search & Download from Copernicus DataSpace.  
3. **Preprocessing** generates cloud-free ARD data (COG + Zarr).  
4. **ML-based change detection** and **index generation** produce Level-3 outputs.  
5. **STAC Catalog** indexes results and exposes them via APIs.  
6. Users access data interactively via the **UI**.

The entire flow is **automated, reproducible and extensible**.


## Outcome
EOPGP delivers a **production-ready EO data ecosystem** that:
- Runs on **public cloud infrastructure** with elastic scalability.  
- Implements **State of the art DevOps and CI/CD** practices.  
- Supports **AI-ready, FAIR-compliant, and interoperable** workflows.  
- Provides a **foundation for continuous evolution** of EO services.

## Added Value
- **Unified EO PaaS:** A managed, integrated environment for EO data workflows.  
- **FAIR by Design:** Data and metadata comply with the **FAIR principles** — *Findable, Accessible, Interoperable, Reusable.*  
- **Extensibility:** New processors, ML models, or analytical modules can be added through simple container integration and Kafka topic registration.  
- **Bridging Research and Operations:** Facilitates seamless transition from prototype algorithms to operational services.  
- **Cost Efficiency:** Combines multi-tier storage with autoscaling to optimize resource usage.  


## Extensibility & Future Work
The architecture is **open, modular, and extensible**.  
New services can be introduced by:
1. Building a new Dockerized processor.  
2. Registering its Kafka topic and endpoint in the Gateway.  
3. Publishing results through pgSTAC.  

**Planned extensions include:**
- Deep learning–based cloud-gap filling.  
- Multi-mission data fusion and Level-4 products.  
- Interactive dashboards for near-real-time monitoring.  


## FAIR Data Compliance

EOPGP adheres to the **FAIR data principles**:

| Principle | Implementation |
|------------|----------------|
| **Findable** | STAC/pgSTAC metadata indexing and search endpoints. |
| **Accessible** | Open APIs and S3-compatible object storage. |
| **Interoperable** | Open formats (COG, Zarr, GeoJSON) and OGC-compliant standards. |
| **Reusable** | Modular, versioned products with transparent provenance. |


## Use Scenario

### Researcher Perspective
A **climate researcher** defines a study area in Thessaly and selects a time range covering 2023–2025 through the web UI.  
The pipeline automatically:
1. Searches and downloads Sentinel-2 data.  
2. Preprocesses and harmonizes them into Zarr and COG formats.  
3. Runs the **change detection ML** processors.  
4. Publishes results in the **STAC catalog**, accessible via Jupyter notebooks. 

The researcher loads directly the zarr via S3 and visualizes change trends in **QGIS**, exports the results to a CSV and integrates them into a scientific publication.

### Decision-Maker Perspective
A **regional authority** uses the same platform for post-fire monitoring.  
Without infrastructure technical expertise, the user selects an AOI and triggers a **change analysis** workflow.  
As a resulting outcome, they receive:
- A **change timeline**, and  
- A **link to the STAC catalog** for downloading results.  

This enables **evidence-based decision-making** on resource allocation, reforestation planning and risk assessment.


## Summary
The **EOPGP** is not just a pipeline—it is an **extensible, FAIR-compliant EO service ecosystem**.  
It bridges the gap between **research, operations, and policy**, providing a sustainable foundation for future geospatial innovation.
