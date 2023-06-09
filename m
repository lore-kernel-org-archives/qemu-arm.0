Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp534663ejb;
        Fri, 9 Jun 2023 10:24:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XgFRZlQ8qjh2k6Ty48rx+zqQ94N+apIyPO9ZUYElVDPspMTy59wp3Z3GIhyWAD2rxeeCW
X-Received: by 2002:a05:6a00:c89:b0:643:857d:87a3 with SMTP id a9-20020a056a000c8900b00643857d87a3mr2004600pfv.11.1686331443542;
        Fri, 09 Jun 2023 10:24:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686331443; cv=pass;
        d=google.com; s=arc-20160816;
        b=usvU9mJA5Jv+/g4rDioFf9zImqQE35KEpcUfdfuqCn1aEYjX2RqXIbq6RBBdoNcw1u
         MfYz7tMpWZT6xT/ASJRku17kI4pC574GPaKr/hyVacv/9LZstFqIZX4o5poYdqlkQTq0
         TDS8z/R/lcV4XTxwtZtXCWVu4GD5EboiZxe+OYswbOnb3r7o2ZJYev01gyTm158LMvCp
         Al464o4uOY68pHiYY3f9XjqGG3WJHPb5ZJWQ0VqfEYnp6/cY8op5kxl9OOIzbgn8IpXR
         9W3MXNgt2TJB5XZ/z0UFqaMjlznrCsXQx5N7mPEABAzpDx8t0LY5UKNPUYiePHGWzU1n
         inLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rG0MjqHOncKe64g/eFBXwRCtLf0aeWOUoKS30sy8Jh0=;
        b=Vs+CHmffsXHChuR7Ra0pz2NLMnO+hOmFv+ncofgycase6xfZT0kIYFdzL9k9SlwI6U
         NZMWbwgzRmmmw0cccZpS4SnxTa0ok+tAK7beuKBYNQDcMR5qpmPY7q/tUG0JNH2hNiOs
         Ja6JefZTNMScy6UcK5RuCYTb0EuG9W1F/Qnz19KwEmosYOMQM8rCF+VS5zcjn18U/tFD
         Z7S3AZIEGnC5RiV7k99lu7DJV+tXwzPK1HnSIAFpLI9rcVwv9Hp53J5UbVRUabxjnXXK
         l6rWPQcxiWtQWYu11yzGrVcJ8b1ULi/JZHMK1Pm821jOwcHbh48gBZWHOhet3OV17ZBF
         as0Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=SuiXD2qf;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8d::700 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20700.outbound.protection.outlook.com. [2a01:111:f400:7e8d::700])
        by mx.google.com with ESMTPS id a184-20020a624dc1000000b006519ca72dc6si2716520pfb.161.2023.06.09.10.24.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2023 10:24:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8d::700 as permitted sender) client-ip=2a01:111:f400:7e8d::700;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=SuiXD2qf;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8d::700 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCEZJc5QzqW0PlJKxHOd6Vrfn+OYaX0N94vtO/dotrMi56n/hmyt4k/aVq+sKwScnqr9v652hHj6f/8oVjP/SloPH4XCtEpRjUvh5uOd2pigCOr4QS3K1X8wG84p9IBFGwnYZBd0ZoLG1Ztd/nLgwWMnaDBjxNkKvByq/nGJ96rYzXpHEkJ1Xl3K+xV4YlrzH9QmMf6w5jofc9/pWu72SowEI41wAfawFIz+Omb9ohoAQBQ8Il2r3FIOySJ2Ah20iE5p1uVxoK5+01npQoxp14gE24Tl8EDM7oW/lBJhRsuky3TXCFoYS7s9BRXjYomRmEGuGJr21XUSLIY0ilp7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG0MjqHOncKe64g/eFBXwRCtLf0aeWOUoKS30sy8Jh0=;
 b=aOAJq20ObVR6SUruCmbwpT/eiqOxJ2SviEU0DvWB40c+yHjwfLcMWQV7oECj2j8rRdbWe6VKc0eYRlcwuqA5TwQYqeIZLgvfcnnxgHgk+N+yd3Q1KrV3wiQfb4G0oW9mg/4IgAs1AtVZNClZmBrRo17epxDdQz3m/VzxcozX4WP0Ha8YwE9fZctSV9eS1eiJN7S7l/5V1CF0OM2dvSt5PGgW79AT4Ab7u+EeoCVzy1qByNdxYEBgycUa1jE3PI2+Q78+nvcDUZT1BoFZtUhAmThIR/YC3yI+ZT0FPwoevpZkAkQXmVOh38XMeAWaN/FDtH2vq3YbzPz5tmoSt1S8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG0MjqHOncKe64g/eFBXwRCtLf0aeWOUoKS30sy8Jh0=;
 b=SuiXD2qf8f2lZkM8oxCjDzjGczthPYb9fPEQ14f/NT01BzgaKBg4EhDKPWCXeMX+CUiSdKF2ejQAZ0erRzDlpL58fzezSdDNoXwzlRnYa2axvZFnpkFlYWqYrdttr7R/2ojkcKSWgF6POad5cIB2jys5o9dam+I6SloKFpHtbnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ2PR01MB8126.prod.exchangelabs.com (2603:10b6:a03:4fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Fri, 9 Jun 2023 17:23:55 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 17:23:55 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 8/8] target/arm: Add CPU property for QARMA3, enable FPACCombined by default
Date: Fri,  9 Jun 2023 13:23:24 -0400
Message-Id: <20230609172324.982888-9-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609172324.982888-1-aaron@os.amperecomputing.com>
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:610:b0::14) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ2PR01MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 8697f11a-876e-4dbb-5161-08db690e4d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RkEuCOfBWDE3Mwd/SULuvS2Sxnpk6sSwnaLWOtoCXwdYe8xuOeFTZFtFvPY5XY7HJd47J6KgzqYINFqHPviCI8LoXjAroPQb3mwBcFA4LTC6uKVsvquzBliNWh207cdbOk7jh7t9sEsAMUtO4RhafOzCcpJp5y5J/u6wUazt+bepHOwMHlPOsLGE0bb5N4FRKNsOwWEmcrOfwdKdfbvqCyP6zDUXfC43WsG2a4Yvrwu/q/bc5e/poGogPuHyv6i/g2VnbhCfFi4NhFOzkC95RYvWTaPXvq2hkWc/jtxksdpc8hu3DLly9cDwD3wqB9TBuaJZ6yuzZiLgm0fVjzUvbIisiPd4bl775yPDke+VFSXUjQl1S2jxFRtVbdzPwVvtCmIRbqhj6dHV5OO2y99v+soJImznrN0UMFDngd/EMHJU2gUC6hgciCfjAmqsq/CuIavKf0BDHRAcKX8YBEtqcIU/FMe/bYVbo61haIy3wKBs/tq0lX11Kw+BlzG+RvDU0LKvh5SCXySM3WzAYRyjSmPryofpPsYEW+GWkANL7aOsOCysDOvCSC+yJ7X9r0n49/+qsuB9/K/qOgnSmComwf0C9+iXIhFjXQ4Wl6zOzqwE6HlzdoHtX49rekGpVl4J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(451199021)(8676002)(316002)(5660300002)(66946007)(66476007)(66556008)(4326008)(2906002)(8936002)(41300700001)(110136005)(52116002)(6666004)(6486002)(6512007)(26005)(1076003)(186003)(107886003)(2616005)(6506007)(83380400001)(478600001)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jz/BZoxnJILxNvG0PYjgZPzO7LlohNRMR7b0OSK133mAM8hJhrfd6ADLYggZ?=
 =?us-ascii?Q?OMCOwdKvXcqfH2Cvjn/V1L8RS8QvDg1BcHXPQjjvyCwrsXTsdLVxddceblPX?=
 =?us-ascii?Q?hcD+TQllMRMAeVvltUeQv2ttAVsa4W8x0eI5wSPbb1OGvd/sqOb8Qa2i6Ojy?=
 =?us-ascii?Q?zNVNzD1uQCSMbOq0YnVZi7rZvHYt2AzpHOJuB+QUSrA03OcBBk9A6oHCfDFZ?=
 =?us-ascii?Q?/TXY1K0SHUU0GymOexsMWj0ry1WBfo2KgHMz+U6DAAzOTmgX3AxqKYytt1u3?=
 =?us-ascii?Q?2LfqM2pO1QqlwUlhBstWydFY5XDBXBUrMuTAI3LczvUwlEvOHPlxTo5T4zMI?=
 =?us-ascii?Q?1PaBTtKdukEnPMXy6wWkpeRbq5A+DYRPjoyBO04LYgN1BsK4iqqkxyuga7rf?=
 =?us-ascii?Q?HrRYUsv+ABh7qblgUPK3O90goeabUQ4Z5AO59jhf8rPSJUei+kRPoWgwhaZx?=
 =?us-ascii?Q?KKBqLwBLFtwUQuFE/EkmQLU4Obk48qQOuouf7iW8g+A3dQg3/uKAps9Wgo/E?=
 =?us-ascii?Q?yqQrE2PrW6+Gm9eQHWDv+2sOoaIqU8u7IVqWHXZcfXRBj5ZlFMYFlc/e+OhS?=
 =?us-ascii?Q?alOoz30ole/ZlJozI6XEFTotnvTyIXplJFQu5XjJKYzjnfpNiXQtsmIsF6jt?=
 =?us-ascii?Q?llqlh1rWHOK4UvvBBMz5uPYgxmRk7VNKjZjExzo5TvPg47TvzdRmLPFm3Hzb?=
 =?us-ascii?Q?Um91P4sQVbHLgscHFsClqrCdhddPffgA6PfixeKSei33hnihwUYJ7FyL1x6e?=
 =?us-ascii?Q?pher46Wtsmq7CpNRpg/YUFyvIyaD7AnyxmYzK6cL25jajm8up2aKicQw+ToS?=
 =?us-ascii?Q?pM5KX1+vcqXs6ZozDpvT8367tzlMjPXCm1GE13iyUqhNfQ64g02NMBgvEEKb?=
 =?us-ascii?Q?I8Cja+EBct4Wm83lDi9B6I51LCMpttKLMLyhZm8VRH0J1h6H0nOuL6cW6AFW?=
 =?us-ascii?Q?eacPiephFC+MZi/1p2YMkpgx4rcaNWJbPzpUobHDjAcpLWK3mwEsLc8hGdq+?=
 =?us-ascii?Q?58SVJDqDOT5JxBUzVyGn8Fm1nIK6LjCivQYWer1F/OwtOqscXfMp8XiWHbp3?=
 =?us-ascii?Q?GjuCx/5TL5Nxj8vL58CBHJw+Wt3c8Tz2it3iRLh2qWrm5WmE4rVTXakNElbI?=
 =?us-ascii?Q?rdCCjAVBNKRX7XhIJOcI/JEe05RD0ahrEqWiErUb8VhOPlFEMDbxFlxEPwOC?=
 =?us-ascii?Q?0ZwphAa+RRr1x85+k2qpGLOfKm7vaTK04YXo2XrSKSD7EpAK9qJ//fSF6Awa?=
 =?us-ascii?Q?iTf3d197p0UUNoUS42ubVzv53aS0VM7Ml9ilvC09v920zrNeSbv6ojPQQZYi?=
 =?us-ascii?Q?16tScO3ivN0Ci45089URwQR4SiwA3MzSdpYp1wlZD0TMDIVF/F6pSci/6Hl6?=
 =?us-ascii?Q?nbev786ZkknZ+jdpcmqCGOMxRwqjp12fDEdQEzEy7hLHepfCLO4DezX8zw56?=
 =?us-ascii?Q?gqnZeeczE+KYtKRz45P3qz/l5zhgKeQVJXgyzu4Bt5SGRLka3REldaGYWDZW?=
 =?us-ascii?Q?+HSX75GA+ZfNaC2sb05NnTfY56zqaMOtzRiiGBFBGwfxdMM74LSG8ltGBCq/?=
 =?us-ascii?Q?5OAjrEFqAr2iEveVVsxh1NlRBLn44YfCUKW3+hDHyTCh2ZBqkiEozt1D/oT6?=
 =?us-ascii?Q?HDswJTFFftkItoTatujLHSk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8697f11a-876e-4dbb-5161-08db690e4d82
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:23:55.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLOiemtIf8paoBvXvd/kyiXJIl4gz2++dVuFiegF3m9hRoTHzeEcY+7Xps1p4IORMwLmvyuNFzhGXt6RgDAdqljzG7zslpPwkDRx3ql0LpZql3hg0vTfi/H9Nf1DQoau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8126
X-TUID: WSGPmOgyVuhN

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h   |  1 +
 target/arm/cpu64.c | 48 +++++++++++++++++++++++++++++++---------------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 22dd898577..0c4c6c9c82 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1061,6 +1061,7 @@ struct ArchCPU {
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_pauth_qarma3;
     bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6eaf8e32cf..b0a5af7a31 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -473,9 +473,6 @@ void aarch64_add_sme_properties(Object *obj)
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
-
     /* Exit early if PAuth is enabled, and fall through to disable it */
     if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
         if (!cpu_isar_feature(aa64_pauth, cpu)) {
@@ -486,30 +483,50 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
         return;
     }
 
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    /* Write the features into the correct field for the algorithm in use */
     if (cpu->prop_pauth) {
+        uint64_t t;
+
+        if (cpu->prop_pauth_impdef && cpu->prop_pauth_qarma3) {
+            error_setg(errp, "Cannot set both qarma3 ('pauth-qarma3') and "
+                    "impdef ('pauth-impdef') pointer authentication ciphers");
+            return;
+        }
+
+        /* Implement FEAT_FPACCOMBINE for address authentication and enable
+         * generic authentication for the chosen cipher.
+         */
+        int address_auth = 0b0101;
+        int generic_auth = 0b0001;
+
         if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
+            t = cpu->isar.id_aa64isar1;
+            t = FIELD_DP64(t, ID_AA64ISAR1, API, address_auth);
+            t = FIELD_DP64(t, ID_AA64ISAR1, GPI, generic_auth);
+            cpu->isar.id_aa64isar1 = t;
+        } else if (cpu->prop_pauth_qarma3) {
+            t = cpu->isar.id_aa64isar2;
+            t = FIELD_DP64(t, ID_AA64ISAR2, APA3, address_auth);
+            t = FIELD_DP64(t, ID_AA64ISAR2, GPA3, generic_auth);
+            cpu->isar.id_aa64isar2 = t;
         } else {
-            arch_val = 1;
+            t = cpu->isar.id_aa64isar1;
+            t = FIELD_DP64(t, ID_AA64ISAR1, APA, address_auth);
+            t = FIELD_DP64(t, ID_AA64ISAR1, GPA, generic_auth);
+            cpu->isar.id_aa64isar1 = t;
         }
-    } else if (cpu->prop_pauth_impdef) {
-        error_setg(errp, "cannot enable pauth-impdef without pauth");
+    } else if (cpu->prop_pauth_impdef || cpu->prop_pauth_qarma3) {
+        error_setg(errp, "cannot enable pauth-impdef or pauth-qarma3 without pauth");
         error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
     }
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
-    cpu->isar.id_aa64isar1 = t;
 }
 
 static Property arm_cpu_pauth_property =
     DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
+static Property arm_cpu_pauth_qarma3_property =
+    DEFINE_PROP_BOOL("pauth-qarma3", ARMCPU, prop_pauth_qarma3, false);
 
 void aarch64_add_pauth_properties(Object *obj)
 {
@@ -529,6 +546,7 @@ void aarch64_add_pauth_properties(Object *obj)
         cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
     } else {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
     }
 }
 
-- 
2.25.1
