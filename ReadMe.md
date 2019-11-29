# Rank Hospital
R scripts that analyze and rank hospitals based on mortality rates from the Hospital Compare data run by the U.S. Department of Health and Human Services.
The data comes from the Hospital Compare (website)[http://hospitalcompare.hhs.gov] run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX for some background on this particular topic).

    * outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
    * hospital-data.csv: Contains information about each hospital.
    * Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).
# BestHospitals
Returns a character vector with the name of the hospitals that have the best (i.e. lowest) 30-day mortality for the specified outcome in that state.

# RankAllHospitals
Returns a data frame containing the names of the hospitals that are the best in their respective states for 30-day mortality for the specified outcome. Returns a value for every state (some may be NA).
