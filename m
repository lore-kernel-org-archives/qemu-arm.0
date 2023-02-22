Received: by 2002:a17:906:3a98:b0:8ec:972f:f46a with SMTP id y24csp57481ejd;
        Wed, 22 Feb 2023 11:36:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+VvgK8cBofrCqIen6Q1si8EV+y21nCnqqczlWoa2znoGQV4XM5vaJM4peONgkj3b3lWrkg
X-Received: by 2002:a17:906:90ce:b0:889:7781:f62e with SMTP id v14-20020a17090690ce00b008897781f62emr16221106ejw.22.1677094572136;
        Wed, 22 Feb 2023 11:36:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677094572; cv=pass;
        d=google.com; s=arc-20160816;
        b=tdu5n0CZ4KJBBXue65OnepnCdyLg1n6oYBSRZYSvT+NPt7PG3ERDb5R8/QZDwdjXMs
         QE96Bzm/DEXCEmY8a+iFwLjBeFFBPtlIp2GiBFrgm2kGG4A7drcVOvXBo8TtLDQZVHbB
         pJBEURf5x2KZD8abhDVnApNvrGH/1wEoChgICD9fPOxepH8vxMyhTqy7vVLzCSOgsVCs
         UCZRKVcAAQ67azom9lCXJjtX8EnafgABdbbCC5wJ1ASbGVpJkibM0GUJelCM/2v1B5mS
         5G475nh4VLI2TACkf6+0JzUMAcq9igwNhle1DfgfgbXdWMsvjThVriE1/DO50RAgqhEx
         XKZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BNl2m2yxSmcW/NtX5w1OuBKkkjtYq5GNQWvhXBddzNs=;
        b=GYYX4mSmtjK1S5iPTe1z5mhFTGKvW9Hh6dsseSaK9PSr9s/z7vLrmgFPK2jQmLR6vz
         ipIXfGdn4RuTJPz6v/DPRAAZL3A8PiXoUPXR/PxDT80Qlx/qMhpumEDy2+JbRFw2fDY9
         B9PfbutRRrcEcif/r95wSRP92QwfIaNxydjAuyi88paORannIZG9q2yZtcltizY2mhXD
         w1oOcDoSBajSMdznF8SsJM95tu57wv+0p8BybuR3EX53c0dWgN/MZgClNgBB3kIGJaz8
         HE2j9BTA7Nw8LIYf+FAirFpEvv6UuPwfvItTPOQgxImO6UzAOPNUWWhRHao7brBij0Rb
         eslw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=P55z7f44;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70c as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070c.outbound.protection.outlook.com. [2a01:111:f400:7e8c::70c])
        by mx.google.com with ESMTPS id wi6-20020a170906fd4600b008df5a5088e4si6029467ejb.631.2023.02.22.11.36.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Feb 2023 11:36:12 -0800 (PST)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70c as permitted sender) client-ip=2a01:111:f400:7e8c::70c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=P55z7f44;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70c as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYQTCVUxacn+TBiN0zOqojmIhf5MQ+bcOLaTRWulxt1iPW5Eht+vttEwdLCogjqz5NTDBG/5OCuxhsuaiePiZwsvA3c4kF5ggMGUXWpISmE6KMvfo3ziJIfBmUHi2htRo4PsR7viBu01akMjibf2Lr3fgfhPiUN70q2/gk4bdpETdTEbjGTu1K1xbH28LAa6u3V10Vh2KcnhPqioDKPalC4WWthQWLyQLERW2v99IZi+XWQ5stlCQNIHnWO4JcL2VU+sHNI0l9BTdX2QvsqOC94gwbUvcoutzJrXZ50Spz49FtGQza+OJkV3Uks2G80BNE9WM4SAtN8D9omr8i8dUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNl2m2yxSmcW/NtX5w1OuBKkkjtYq5GNQWvhXBddzNs=;
 b=GOykHSng6TbBC0XrH25iZov29LzhSu1mejVJ4PTNqCGVWmBdcDUl0vlSPn8QPQIKffM2ZtUYGbY9IswyTStYpcVYv0sdN6VWfTi62NMMRvgxERry6P8OhlgBA7dBq4WRVMxbF7cuHNd5yRgasYDl1Fgq93sRcpGxS0Fu5GijTRgzEHlnrf/tjiSx6Racz6nIMJbMCN3ynoBInEILrkIRhs+DiTHZjW5yG42IDVJ+kwRdmx7DeyoTtcCvJBHC0UgwafSclBU99RnX6Gruo+VuuJ4l6oIkrOFkIBPxh8+1M7jsjBeBqZTsWGDgmjmvmi6RP8+1S3fFy4TkUPf6iTToDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNl2m2yxSmcW/NtX5w1OuBKkkjtYq5GNQWvhXBddzNs=;
 b=P55z7f44o7ho57pG0LVwiL/H2sXTIMZfiiFi8vsoNSHg4S1tsM6gG308+1dUn9e/FlLHVSBc7AUqG2ZIUbZypN60upibxZG9r+8XEAtpe6bArIIYF07ZMzK6BMTr8b/0+TtJx1w1YmDrrQdEjWql5ueMWfhwDkWMPVEiN0ah25U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ0PR01MB6448.prod.exchangelabs.com (2603:10b6:a03:29a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:06 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:06 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
Date: Wed, 22 Feb 2023 14:35:38 -0500
Message-Id: <20230222193544.3392713-2-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:610:5a::26) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ0PR01MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: da977e2f-915f-4925-a6bf-08db150c0a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+56BWbiyODXBG4a08ogYBQK0AGBP3v2UyTooa96Ayrud8Ol7rv3GqC8IRYt3u4dytyUOzD/c5UKSn80xHMV81FiW2pVepG2qS0yyfx8Ag4mPS4uGbhNJBUlkkEh7Nk358eNknt0Rb/UV3ddHckf6HuAEvpCjFpWlFURbV8qhsOAUvsHI+679m7eDT5GgsNph/GphbIOyNR/ASXoo3TNAFaJ4w+HVDbKNckWy1qmWX/OB+BWtY4HVtFmctG+3rcTP3pJ50EPWdoIRM2vBC/P3bocrb8jX4z5vNylIWWyJxtuiFbP7VZwcPQQwuVrxddjlB2ydChM36YVSNTeDNNp6tGHkl7Ogh0su2FarlFEOcuZD9WX4b8sRiLJJaLub8EnSRbInS0Xk5P9N4cFM6udpFlxLCZsbFbgpaK+U26MYOKuXlw0VguAh10K/3t6lvPyxHOROkIbwDrd1V0I8MgOg1HEx7EjDY5KILNOxQpECzjEXAlMcQEeGJF6hHbGES6iA9RIPW2drhGsru+HOy8NdKDPb42SP9o++Hhuifc7D1WoF2ZYRUpuyyPQp9Of6Nf8KPuIdoQWKSccW/jZ33axAu6Q0JFHxXsSqMzoKz6m7YxChc/2CWypofeezGa5Wq45bu5NUvZTVYuTFXU6CHh8Lz5QPONaCOfsxteSaV/4YF+Q13pQzgg4Txv6+gb6qQlGHma7O28ZwieUfnju7BVwkPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199018)(8676002)(66556008)(66946007)(66476007)(5660300002)(316002)(4326008)(41300700001)(86362001)(107886003)(2616005)(83380400001)(26005)(38350700002)(6506007)(6486002)(186003)(6512007)(1076003)(6666004)(52116002)(110136005)(2906002)(38100700002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7zG3Bvt+g1ESr5iRma8/LwBUuHSro5nPyRyIX3Fzy63GrFbOUPBZMFBK7r0y?=
 =?us-ascii?Q?dT+z/gOefPIeEJMfvAN/HJAiq78s8dYG4L4pJw6ZJHmlpF5Lb+c0bvtBAT+H?=
 =?us-ascii?Q?RAX2J7SBC+lTTytHq5DI9jQA90XutVxANOEq97wy5uhCrk44IlOQVC3ILIWz?=
 =?us-ascii?Q?bTGx0a63EN3dRkJnw+7pCZLyrBiVAZYMFmcGB7iDto6YN9utqsunny0TncGD?=
 =?us-ascii?Q?DtN+ODuydKsDbNaBNVO2ztmyQ8Jb8T4H57XAm0eLvtjLDRh/Nqv49vEg6QVQ?=
 =?us-ascii?Q?cn9nzQ8nLNxJyADv/zkxc99bII4rhMHmAsDOG4tpPFuqvuusu5qXYAkuaIzZ?=
 =?us-ascii?Q?Xg8TP2dTEIG6I5l9otKONK3GdVINJP5ZeWfFx5z3Z43HurCpyisWbGTu7rNP?=
 =?us-ascii?Q?2VvEEJEXtvZGykXldNCNCbl4CohKMxYAM00SXfcFzXwK1rPTQbCqsAEcEc21?=
 =?us-ascii?Q?dUixWuwCHiwQfYVd2HcrT+99NmmxJmbxxs4GzVjg5sXNQ/L6WiORiCIaEh5f?=
 =?us-ascii?Q?ScATyjtCmPdCXVN8vl3FrPEnhfc9MUP4TFozBLIiOSzFtkYcej4/K5rH4AD4?=
 =?us-ascii?Q?1KuS8JI9V+3z1VflNdZtTG2880avp0ad4Cearlr0w5EeVocT8jDnGNoECTk2?=
 =?us-ascii?Q?JswOEDMfhcPLQtZTO80V1fykAxZscmicls0PjyXjptjNSOLZmOl+QlmxACfi?=
 =?us-ascii?Q?a+1VUNjePLGArAXdyo6U0iMjEMy68bcAvzxgAvWdO3gOqTd2jkAZUudA7YC/?=
 =?us-ascii?Q?Oa3h2G5A37cA+mzywDO8MMcz3ueRNvVlAdOh8GdPd9P3gyA9htDRC+BMuvZn?=
 =?us-ascii?Q?ZW6/N+od3jyEND79c464iiWIS3Wd2WCa7V83GAHFA7a49GjxYjwM5iC6BIOj?=
 =?us-ascii?Q?Cod/+aDc8/uGrkzX9epB6nBLOUrzrGgAMO1ZJKyywl9gd5EFXEqSDIX4V2Xc?=
 =?us-ascii?Q?HLnEQahhELgt3ahDSRPHVnhoVZZGSM2NXW5iSrbg9JlSHwJfyxJKzDaJJLjG?=
 =?us-ascii?Q?hHkjv7Bkiw7TxlyofLag6dydfn6ziOCFJO8XW5tTjYoiukj5cAdK+/bzfwtq?=
 =?us-ascii?Q?3QgP7k20nrY9JCLSN7ny398o52Cbxtv6Sia4SI97WGDmPrLQaET4riRTC+Y8?=
 =?us-ascii?Q?ndWzDu6de42twmyBxINqPmuxCXUCUk0RmEBP7Z+Os3OW0laLWhiG1HFwze44?=
 =?us-ascii?Q?7/PTzKuvHYjzjOypUl6jgJf6v/thzEOjxWhRgERqKtkSPY8xsg2EyUHkYeDd?=
 =?us-ascii?Q?ZhWFoy/AdHtVFSA2V+7XSl4QkOi62/B15Pvx2zAL2j1/CPV4vX2dadzEMFUh?=
 =?us-ascii?Q?cXe4x/YglaIRVfYZqr18GtqL2Ed+Q1Lsb9gnvUi6b8XqOO6s6QMSBgJAE94v?=
 =?us-ascii?Q?5leX8kpl5NFq8EjZr4OmO0ooTxuq3qNAcPdqi9QICDtwPZqDSBveyZiaTOlm?=
 =?us-ascii?Q?hPI7llaIRvgMTnhRH9qiLvnK6+wa8aHIO7M7/3/BhXwAngKQwoln+6rbSb6v?=
 =?us-ascii?Q?ibP4550tSxLF5wvvM3pVRu5CWLituxU1r6StTdif3km2Bex3xnXo9k/KRUss?=
 =?us-ascii?Q?aqbKBr5ufH66xGhvDO/i/BykF+1t+7Xr3mdfaJ4TngcTSawjIGG8NEVp5wPv?=
 =?us-ascii?Q?dGcDotQmoIsl+88NpUdX/Hw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da977e2f-915f-4925-a6bf-08db150c0a55
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:06.1795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XV4oCv4QbHiGuq3oARCQVHRfrkED+r63Y8PHeDpPBMgSPjjaVo+g3SOwoPsk69dpGjqeiwMTj+FFN8RlR0c3/BXx7nHF8C57r7Xp+lJ/pkl6WR5clNl4pcxfeBu+emE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6448
X-TUID: BJhwhMcFzo1z

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h          | 61 +++++++++++++++++++++++++++++++++++++--
 target/arm/helper.c       |  4 +--
 target/arm/pauth_helper.c |  2 +-
 3 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8cf70693be..9c3cbc9a29 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1001,6 +1001,7 @@ struct ArchCPU {
         uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
+        uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
@@ -3902,18 +3903,72 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
             (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
              FIELD_DP64(0, ID_AA64ISAR1, API, 0xf) |
              FIELD_DP64(0, ID_AA64ISAR1, GPA, 0xf) |
-             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
+             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0 ||
+           (id->id_aa64isar2 &
+            (FIELD_DP64(0, ID_AA64ISAR2, APA3, 0xf) |
+             FIELD_DP64(0, ID_AA64ISAR2, GPA3, 0xf))) != 0;
 }
 
-static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pauth_arch_qarma5(const ARMISARegisters *id)
 {
     /*
-     * Return true if pauth is enabled with the architected QARMA algorithm.
+     * Return true if pauth is enabled with the architected QARMA5 algorithm.
      * QEMU will always set APA+GPA to the same value.
      */
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
 }
 
+static inline bool isar_feature_aa64_pauth_arch_qarma3(const ARMISARegisters *id)
+{
+    /*
+     * Return true if pauth is enabled with the architected QARMA3 algorithm.
+     * QEMU will always set APA3+GPA3 to the same value.
+     */
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
+}
+
+static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_pauth_arch_qarma5(id) ||
+        isar_feature_aa64_pauth_arch_qarma3(id);
+}
+
+static inline uint8_t isar_feature_pauth_get_features(const ARMISARegisters *id)
+{
+    if (isar_feature_aa64_pauth_arch_qarma5(id))
+        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
+    else if (isar_feature_aa64_pauth_arch_qarma3(id))
+        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
+    else
+        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
+}
+
+static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
+{
+    /*
+     * Note that unlike most AArch64 features, EPAC is treated (in the ARM
+     * psedocode, at least) as not being implemented by larger values of this
+     * field. Our usage of '>=' rather than '==' here causes our implementation
+     * of PAC logic to diverge slightly from ARM pseudocode.
+     */
+    return isar_feature_pauth_get_features(id) >= 0b0010;
+}
+
+static inline bool isar_feature_aa64_pauth2(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) >= 0b0011;
+}
+
+static inline bool isar_feature_aa64_fpac(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) >= 0b0100;
+}
+
+static inline bool isar_feature_aa64_fpac_combine(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) >= 0b0101;
+}
+
 static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf1..448ebf8301 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8028,11 +8028,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64isar1 },
-            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64isar2 },
             { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index d0483bf051..e5206453f6 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -282,7 +282,7 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
 static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
 {
-    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
         return pauth_computepac_architected(data, modifier, key);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
-- 
2.25.1
