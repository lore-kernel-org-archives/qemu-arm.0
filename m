Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp756256ejb;
        Thu, 2 Feb 2023 13:11:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8JCJHcwHZtMOFA59u5xVGBgom08DEVoFhHjdO+ySpJwFclbA/zJjvmr58owgYQD9nf8ieG
X-Received: by 2002:a17:906:b154:b0:889:a774:58f8 with SMTP id bt20-20020a170906b15400b00889a77458f8mr8320097ejb.40.1675372306474;
        Thu, 02 Feb 2023 13:11:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675372306; cv=pass;
        d=google.com; s=arc-20160816;
        b=kukfMw5x8x5uT6i8H082USyQ0GdUVfbawbdJDPLYPsFji+IcRIwK4BLA1cKaEQER29
         X8FlJtLlAiS3JOMQ7Ip6eOTfCqWnKOZApgmLY6ZWn7uMPplti0yrRcBBVhlxOVWJaDJ6
         tT8DenRg71POSLmQEcDWkDP136j1ZmKcAt0LFayIhTvRvpYcMzWvbZFEA2C2iIB+kW1N
         4daRzY5Eih4wW5DydEpR0jrzjIdLZQbme8mf+3hp1QgAlWvLT50bZRd5u6whQG1x+qpu
         NWnKp0I1SVqL3BJEwpfzDK6V2IoHTZJSLCi7earDuY+j08Bt9dNHO/L/Yex9rqoQhtJh
         r1fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ggVSG398l48Y0MR9RvG3WggSRZvJsguuq5RUbquXF8=;
        b=gnPuv4Eksa65pKd7E66PzaZSjuuek3CacjRiToSEWzMIdwIg8+G6QAmYUi5GRODNNP
         ce7G8W6FGzg4rQkemsIBY1RYBMwCWvzCGux+FwVqnOUhyTTmK75LtbS7IqwfF0JxDiTN
         briw4X7HeuE9swgcJQq9DTWHc7KTEX86o6zmpgD5ug8VGDyqZ7E5Mmn8YuD4ogha3wTq
         IlSutpCm4cUy3dGmLYuAGtFMI4erwzVH5xLSzYC8j8T0FPSdOVIgrVOmqJypUePpi4WS
         lPoG9cQRJ6rBXO/3yI4JOMvIj5pDHPCD3+7IYTmT27aCbn1XbWstsrKSXi7b+gqCs9Nj
         Mo8g==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=di+Od1Ia;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::708 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20708.outbound.protection.outlook.com. [2a01:111:f400:7e8a::708])
        by mx.google.com with ESMTPS id kb21-20020a170907925500b008834ce399casi645794ejb.36.2023.02.02.13.11.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2023 13:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::708 as permitted sender) client-ip=2a01:111:f400:7e8a::708;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=di+Od1Ia;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::708 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgjPNaEgF6aDfTGAwSRaP1YFq8MH4E9/lEHYEBf2UnxI+MAnUEIsaatS+m5TCJtuenxmR4Wk0FdJLva4IfhnPmMmMGKIDvp+9AUOxkcc8xOgaNpsZ12AyTiZMZDeoiFi30bSlSyjnRRYFwllqjpvPeVzbMcnl+tt8CjdL8QcHeZXq05mlmH0n3xzF4uRGNgOueMo7LF885FQIwwbgb2beMSpGr7NAyVq7XRfvshAYUIteJR1p11i2TMT8rdNBUvHab89PyH7F8h/x7++UUS7rgQx6cdFrut9TU0iuBgPput8UjrdY2IUiTVjdasxucLLHCcRaqOVP7vhyysDgD3bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ggVSG398l48Y0MR9RvG3WggSRZvJsguuq5RUbquXF8=;
 b=AAK9rgGg9OeUYCE17umsHEp55FtOVQawv0fqUAQP3QaVxfa5GdEqZhmPcupE62YiebI1S23ePPiafFQDivA05Cw2Lanki2OQc5v4TBYXX6tgBWXbq8t9n8d6p8CM4/51LFcoH5RissbXAqXTEm034+SW6I0DYROCppZ+RO9o9+wyjsyWJKZF174FcVXEyKz5+NTytnLX3lmVVm1pyY9I6XcCkZKzEGiINJMS0pZSAHDflXc3Jk0GRH7XuMGAZA3nNoFtvsbhpcwepObVj1cOo88ryEovg+HBTJSotUNrCJki/tDM+Kx4YiUIrtYfv2NotNO8W3CGQqa4/mJX7bfsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ggVSG398l48Y0MR9RvG3WggSRZvJsguuq5RUbquXF8=;
 b=di+Od1Ia/FLu2QnZ7GHu6PQrYA6aZSSKLARzUmfrKPSGnDzjdChVC6+dTJwdLcvqNhatOLL/DyGrpgKSlYZ5fpESUmhta3YV+lekuvV6wATwEHlUpPu9CmRlkuY8k3GvaqzIGRL3y/O0ceQLBB17RES5FDzl+BpVV3o7/yJ9+S8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:44 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:44 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
Date: Thu,  2 Feb 2023 16:11:23 -0500
Message-Id: <20230202211129.984060-2-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202211129.984060-1-aaron@os.amperecomputing.com>
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:610:58::37) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BL0PR01MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 71028f4b-22d2-495e-3ea0-08db056215ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	39o1oX64JqtsN0HyJ9lSFtAOF4s+h9V4xDQXS8JGCKkAvBYc34n1t6V9EwkZB2n3bL16ip/qc51aL90EarTstSO9RoHJtgJzOg3ZtScsYqGtdJUn//yAR29uAbUq8z09cmkI62UnLOow7pEnMFQKBlgn1xKSFdP/iF0QOcF/j2r3FWsXROKqaJgVIcP3WChH/Qcz3WTAdiMLhfofszj5NEs5gz6NOe2+2LUQDPQcZXNbmBCPOzsx60jsUv2sSUpofEb79Ovs0dw2e6RkiGJ2unBskWYK3geJvj8K8Pb7K3454+h8qPVKpiAIkPuXjpzU9hCiuLOhySgW1na/XwoqIl/ybfTrY8bjaUgLuoXflxrw4JhOD9HFuJiPs5W8OSTOEGpoHJjfQM+a/5EOEQuhcPrVvs7Yl32NlbSk23P04cVROtMUo86LG0Tg35f2km8aJ9jnv55JKxv/U6NJ1PH4UFNDI01gV7dUr7kBXW5RlIWX1TCnQszjno74UpH3pg1JWxGYVzdhPB5L5aTGapmI5rccU+EhJJ3k/YtLFYJcf+EZLDBWv3HlWN6peZV2Btr7lH5yAcRJWZRSJRk6FKZ5GgRx3PVY14Wxl3QjFC+ofV5U+o4b75Iw8ESPx9wwMhw5fhFnBaRStwAOUcZ8P4yr4RhaPfJmgQsLwyHsqg1mL9JnJg4rpaujhE1iTvgAycMPBVnQaUfqsYi+v7a0+7OSgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0THVEoJM4vpi6uGOtsSiS9AYd3nFYK//Yg9M/R9/lsWd/CcCHRQLpmH8gaKU?=
 =?us-ascii?Q?ZCwEgYscyLw3Db4pMgt5s0SzlMQF+t4xFsN4t4HxbPmITTlY9YHhbAmAMUDo?=
 =?us-ascii?Q?1wiPHBXVRHlPp6QLik7EzSzSAVDAyXotweH224cySD/O8BZ22Q0zUFgmT5RF?=
 =?us-ascii?Q?ofjRcvR7Z10f7ou9Zo867l2LuOqqmYjIsen8spV4LyjNxlrlvL0wnN/B+3ur?=
 =?us-ascii?Q?idnbk5VOmH8gEFQ8kXu5ikljh5eeKmhRV8j8clvE7tbzotlS/ANZ183NTE57?=
 =?us-ascii?Q?5pWCRTmYdYu+7G9FSp+T3BBpg+An/QQAAfMOQBRQUdH2eSWaJ5rAAyzpMlrB?=
 =?us-ascii?Q?Z7QMIxw5jNb7X5M2X8BGS+Xh4GAfKugrv6RZTyWx0armRqXSIGbp6/o2K2n4?=
 =?us-ascii?Q?2QRF58KWKf+QwadYEWxiYTI3xKF1Y1XEaMRbeFHuXX2FXZgm4ANkRoLeMX91?=
 =?us-ascii?Q?Fod5m70XLhGRaAbBcAoitO3dkVrZDdpWIRudhoVcpLfGb7jt9KRyyf8JCrl8?=
 =?us-ascii?Q?ttiATSdR0/l7xxc9Uj8S1RQs8tbZyibjQo2GstnzoXMeWRuJWiDAVYazmSGt?=
 =?us-ascii?Q?NxKQP32XXGFhFboLcYb0/DBCIvMvfdqdHR9QH/i+wzqvcQpqAwBJdtlQjfNZ?=
 =?us-ascii?Q?E+FlPJ9EciBR1y2RfJqcSPpVSWn8Qeye/OEXdAGKFy6D9mRX0324sPw4fjb4?=
 =?us-ascii?Q?H5O4LhsCuwkAexeYOCiW0/e9IyVYVPOO8BSqnKNQ7I0FbDJuZDUPFxY5QMLs?=
 =?us-ascii?Q?Dx89//bky0IH9QV7GJZD7ffct8oE/kvplAxRFz/gFkvtocbQzRwSmtKyPEyc?=
 =?us-ascii?Q?K4csMFEO0Thve87P3+OlqkLeCvUHHCT/vV1XHg/AS9iaixplThcjyHvLFOwe?=
 =?us-ascii?Q?gVzs1hFYcvGN0GCCiveOriAcYzzAi6t9DJH1ncctEM5HyvOY5XL2X3drVta9?=
 =?us-ascii?Q?JWg7jBGzw/ww337KV5ojIn6XFq6+yHWepYv7/sLHVAUqKweFVlTzgwtzDBzZ?=
 =?us-ascii?Q?L4Yb4Y+hZMfishR1VBypOt/SFEMMrYw9Nnp/u4FswKmJ19aoqX5Oo1aBxGoK?=
 =?us-ascii?Q?T3kaqpCoTiOiIhacJ6+vSiihnOALdkGGO9Bjept3sWimKkzGuo9vmeP4qTfM?=
 =?us-ascii?Q?mBxL8oDla8+nYFqKZQjDKkfGBuzMPeYt8RIc9N2fhkQwYb3zko1v6h93oL+G?=
 =?us-ascii?Q?IkfdIqhYSyLssVv7mdfRieU2Bclkq5Hzsuxun5NRWTPAfFrdTOVkM/9Z4340?=
 =?us-ascii?Q?VdSEbHPpACQ4BciE66aTb0IIOKspnHqU+o7paPVwC+59GFkmcsHAoardFUVS?=
 =?us-ascii?Q?F2OCWzqoymolXcPmyDiCpqTOPIF3Ecadi5tVbEFy2sm4e3rr9BWPJPVGanQn?=
 =?us-ascii?Q?EFYQ1BFEDk/myCEaeRN2YWkD6BlF6GpFOc1y3YVtGDgfbxhwIuQ8ePtK4HGK?=
 =?us-ascii?Q?TBDt2u1abribWQKy3jeN3e2TkZXAuXCA5ubHNYxHObMXf8HfRxUuskTTt4E9?=
 =?us-ascii?Q?4k9fmJ/f8XpTLMIMk+cbLQtC4Yc42/WfOll7qB1xwpz1YpE9lM5IH9qtZ/kV?=
 =?us-ascii?Q?p9qa/jWOLK8B4cEqV9yR6g+9ui9hkYXJyFM73UK/AopBTjqcQ9279R3cn1s2?=
 =?us-ascii?Q?bcBF8nhvEd3oLDTU8DPXvAg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71028f4b-22d2-495e-3ea0-08db056215ea
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:43.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCcYLm6+2o7PwSAgu3LQZBWbN07tlhdKKvt5PD3L40dAcXk38syyJ+T+L9v4yrS2v5SDTgDUTopgIsoymmRB8MyK1BbbXL/I7sxO98111rBwhcFFSKnr02wKwXeC6lQD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4801
X-TUID: QlSJMCGZdO6m

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h          | 57 ++++++++++++++++++++++++++++++++++++---
 target/arm/helper.c       |  4 +--
 target/arm/pauth_helper.c |  4 +--
 3 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8cf70693be..9be59163ff 100644
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
@@ -3902,18 +3903,68 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
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
+    return isar_feature_pauth_get_features(id) == 0b0010;
+}
+
+static inline bool isar_feature_aa64_fpac_combine(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) == 0b0101;
+}
+
+static inline bool isar_feature_aa64_fpac(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) == 0b0100 ||
+        isar_feature_aa64_fpac_combine(id);
+}
+
+static inline bool isar_feature_aa64_pauth2(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) == 0b0011 ||
+        isar_feature_aa64_fpac(id);
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
index d0483bf051..a0c9bea06b 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -282,8 +282,8 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
 static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
 {
-    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
-        return pauth_computepac_architected(data, modifier, key);
+    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
+        return pauth_computepac_architected(data, modifier, key, false);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
     }
-- 
2.25.1
