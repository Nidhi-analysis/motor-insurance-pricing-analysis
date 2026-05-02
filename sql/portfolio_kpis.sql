-- 1. Total policies, total exposure, total claims, overall claim frequency
SELECT
    COUNT(*) AS total_policies,
    SUM(Exposure) AS total_exposure,
    SUM(ClaimNb) AS total_claims,
    ROUND(CAST(SUM(ClaimNb) AS REAL) / SUM(Exposure), 3) AS overall_claim_frequency
FROM policies;

-- 2. Claim frequency and average claim amount by Driver Age Band
SELECT
    CASE
        WHEN DrivAge < 25 THEN '18-24'
        WHEN DrivAge BETWEEN 25 AND 34 THEN '25-34'
        WHEN DrivAge BETWEEN 35 AND 49 THEN '35-49'
        WHEN DrivAge BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS driver_age_band,
    COUNT(*) AS policy_count,
    SUM(Exposure) AS total_exposure,
    SUM(ClaimNb) AS total_claims,
    ROUND(CAST(SUM(ClaimNb) AS REAL) / SUM(Exposure), 3) AS claim_frequency,
    ROUND(AVG(CASE WHEN ClaimNb > 0 THEN ClaimAmount END), 2) AS avg_claim_amount  -- severity
FROM policies
GROUP BY driver_age_band
ORDER BY MIN(DrivAge);

-- 3. Claim frequency and average claim amount by Vehicle Age Band
-- Bands: 0-2, 3-5, 6-10, 11+
SELECT
    CASE
        WHEN VehAge BETWEEN 0 AND 2 THEN '0-2'
        WHEN VehAge BETWEEN 3 AND 5 THEN '3-5'
        WHEN VehAge BETWEEN 6 AND 10 THEN '6-10'
        ELSE '11+'
    END AS vehicle_age_band,
    COUNT(*) AS policy_count,
    SUM(Exposure) AS total_exposure,
    SUM(ClaimNb) AS total_claims,
    ROUND(CAST(SUM(ClaimNb) AS REAL) / SUM(Exposure), 3) AS claim_frequency,
    ROUND(AVG(CASE WHEN ClaimNb > 0 THEN ClaimAmount END), 2) AS avg_claim_amount
FROM policies
GROUP BY vehicle_age_band
ORDER BY MIN(VehAge);

-- 4. Claim frequency and average claim amount by Bonus-Malus category
SELECT
    CASE
        WHEN BonusMalus = 50 THEN '50'
        WHEN BonusMalus BETWEEN 51 AND 70 THEN '51-70'
        WHEN BonusMalus BETWEEN 71 AND 100 THEN '71-100'
        WHEN BonusMalus BETWEEN 101 AND 150 THEN '101-150'
        ELSE '151+'
    END AS bonus_malus_band,
    COUNT(*) AS policy_count,
    SUM(Exposure) AS total_exposure,
    SUM(ClaimNb) AS total_claims,
    ROUND(CAST(SUM(ClaimNb) AS REAL) / SUM(Exposure), 3) AS claim_frequency,
    ROUND(AVG(CASE WHEN ClaimNb > 0 THEN ClaimAmount END), 2) AS avg_claim_amount
FROM policies
GROUP BY bonus_malus_band
ORDER BY MIN(BonusMalus);

-- 5. Top 5 regions by claim frequency (descending)
SELECT
    Region,
    COUNT(*) AS policy_count,
    SUM(Exposure) AS total_exposure,
    SUM(ClaimNb) AS total_claims,
    ROUND(CAST(SUM(ClaimNb) AS REAL) / SUM(Exposure), 3) AS claim_frequency
FROM policies
GROUP BY Region
ORDER BY claim_frequency DESC
LIMIT 5;

