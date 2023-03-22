Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5714668ejb;
        Wed, 22 Mar 2023 13:26:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set/2Q95xSUmBV8l954RaYxI08kOCBcppG6vdl2JKrkV+ALm7KQ7Gaop2dW1Xz3halOKI3Zny
X-Received: by 2002:a05:6402:1b0e:b0:4bd:94b9:b8a8 with SMTP id by14-20020a0564021b0e00b004bd94b9b8a8mr7418722edb.26.1679516782864;
        Wed, 22 Mar 2023 13:26:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679516782; cv=pass;
        d=google.com; s=arc-20160816;
        b=r6+NsuSY7tW4VVU+RYPEUDBeVUh3yChBwfMtlUdWoLSStLXTkbMWsVA2J7Lemwsbs0
         lUf1IE9AUOZp1MbJXmyh+Erqg7bQCOmSqSzwhcTb8ojmtbI2TMAPCatGlFwkY4LnOpV/
         0AqR5ncvuVE4f9X6G5Rz1+Qh53xtIpHSQSP40dc6ANK14zKOjE8uXDMCagm4pNXkUP9D
         LTtJFB4rfbTO0n8dIIYfI9wIO99k8mluq3FS8GoKB9SuUcxCeeynt+4N7vuX8qmhn5b4
         KNx0xjlNraYKGcpto7KYK4pg/N52QB+cdvcN96tjGaepHTTDfGrr2SJjrd3oWhfAIjWJ
         we/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=U2ZfgdN8+zYvoOSje9XTIhRJCOB6L8pzpI0E8ObLWmQ=;
        b=zeijwlVMiniZnXDTphi2n/Jg3d1qvtPgdotff24n6GMzA/Iw8s2VdUHCUwWC5f2syW
         m9fZJNeRl+ubLK6DePROJrglGN+G051X+wElS0rNda6PvM/QH+dnS61fmWkIaYN4vwgp
         QEo5D17Hp7QqnypC3hsE+P5isF6fpt6qB2am2lKIeuS+184N7YLKap1t1qy3H8b9lDDP
         CEi7FyyzlI3r9zA6KL0KoSdc5DR+j3TH2kMaUg69rKyp7L+5LdAVyIxkuw/OaLp0XQ40
         505Ge5ILR6z49QWhQyNHIttmu/WheNk9sVEwTjCxx0AA7te2xn3xgNa5VoR0LZPTIP6h
         RmfA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=EaDlm3bD;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70e as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070e.outbound.protection.outlook.com. [2a01:111:f400:7e8c::70e])
        by mx.google.com with ESMTPS id w26-20020aa7da5a000000b004fb8210a7cfsi8722233eds.471.2023.03.22.13.26.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Mar 2023 13:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70e as permitted sender) client-ip=2a01:111:f400:7e8c::70e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=EaDlm3bD;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70e as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhSnxoK0HTi1+RaPFwtoXWaVgn/A6gzWydAYIt55IfD1xFome+pjQ5knjfhfGEZLi1XSVF9GDoEpVU6BpX8QD68HZjW0Mp/qNMiLS4WlxIJwtMfvtWKgGw7j4oFrbVN0vBLh5qs9QjM9V/9sLDhTZ0zp37wPGro6k0zHmn56hqug4CXz1c4LWhfF7O+gi8AexOOqxEoQGkBiAMVStbH3oG56dVYBINVUE76HGd/AlEFQFXEim1lxXL8VYC0emXmMNIT38VSniJHpMK3sLq96Az7ehzEtXNTZYUJcnY0doIdtsEMMWw3Kvxxm3S9YKc4//pkLzLjNYFQS3B+JORtpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2ZfgdN8+zYvoOSje9XTIhRJCOB6L8pzpI0E8ObLWmQ=;
 b=O3Ig1uTSy5eq9rz1B5G16YzNP3QR7o7P2layUxCZnLI+wZvp2/IqBDQ/ZSXhWDBdbqu3cG2Ct3mz15S41XeOWalmHlRUMwm4vQaMD2YvGxsV888/2cHY3Hb+k3CMAyUK7ahImC2ePRPZRu61LUn9o2Iv5wyjK8cm6vyoz5Lg5nPfEf8ok4lx18m4a0HhKQzFDJYv+f48cuHVUyO6mavmG9o68TLm3xC68SXrFHaLYf8h7PKpwNEWbXxGxtOTiXq7xoXv51kML7tX8T0JBXkPKymnPP2pv7fcRPF5BIgaZ0X12kDP5mSv2t+lpHQc1qNR209M5+JAV23vJkZ7prLIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2ZfgdN8+zYvoOSje9XTIhRJCOB6L8pzpI0E8ObLWmQ=;
 b=EaDlm3bDrHESjm/rDFdIkABdAlgruVap3y/QkhbQ9hYE1t6iOKbCgBTXoZEZ0MCc4M0uax6JQHVIECXgKAuC/gg+Q20LDykBy6lGMIHPDFTSy/98GoLjPRWaf/p4QKc5/UndH7eh15yyJxNizOSyRJmtCf8nM8L+ev5p60CbgXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:20 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:20 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 7/8] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Date: Wed, 22 Mar 2023 16:25:40 -0400
Message-Id: <20230322202541.1404058-8-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:59::18) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA1PR01MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4de457-507e-4b0f-f24b-08db2b13b2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xfl/7RHAjFkbKP/RIIO+AbvCxlU7UT4LZeVKUMBLQp3mIMr/DJo626vDqXDhyzhlVqhqDa8j71H58kCeEyf8jJYMThZHc2RkGKQwmvjy5hUOIR8w78j7Q7p+lL6Zr54EcLyMMyCadK5esgDGuLfk5b15mSmewYv7E1u/PnKQKxao4aIc3gQo8Z7HwoYg48igqo6od4XPtF68QDRH2N12M6qtNvZLWUdPbrhAp4SSMttC50oWfn50d6AltJPElg+1kL9fzN4lC3Fn3/6tneS1z89YVblgloFlmZnOPJ11c3IklWlT4BbRXmvhuQeq7Q7LDy3D4x0ZKfZBmsueun8UMDIYHMFGJWHpb3n8LXbNisWlRMeSeqReKU+huPklQFIkSrQ3BHGwFczSoN9SfQgmaBA7/HZQeXmIe8MwasMk6YyAR0oLP9QNyFGjN2OfutiyWJUzCOozKjBASfBts5z3PWM2m0yyhV60UYR2t9HiTatrQtH+m3fVDZGBlW6FS0iD6pIr1xUD/3YRb275iU+DwkKqCBWiGdWQEbBAtvS6LUCfr79+l1qLhs6L7JS8m4yBt910xc7sCMxF1xY3N3nk4yt13lQKc9YaqxrtycOJ3cVjO3sTdh0T3Vu89wPEu7AGuGPD9I8Zbbati429CoqaBuMJmpFFbzVLjIE8tqJT5Fgyb3hYxYMfJo2Sc76v1Rb5iBJtlaT4DRXQLAQZsSdkLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f/VCFi64ewsaIGUyl9aU4qB26O3UgD7GFg+U50oWMvgVdO85bCtBDC8jpS+2?=
 =?us-ascii?Q?bt9kYKNIFh1fJelKdLqSVENnm9UW/7skgRgSAY9ORmdr6M138mlx0vvwMSHm?=
 =?us-ascii?Q?+mMyTYhJik2lU4WMK5Ep83zrihwGh/35QwtZhYOp0a9z3BA69BwhrIDPVcOr?=
 =?us-ascii?Q?8XeCWttvDV2//LZfNvfkCNoMDaG58MW7U2oNdcUz+5XDM55mHSir/m+3UGwP?=
 =?us-ascii?Q?LPPyJx368q7qVcxDQ8Z1JkvuakWWbwADj4M8NEcQXwZPZi3rvNI0ylrjCuIc?=
 =?us-ascii?Q?6qe5qSCmiUTmNNYL5vDNeNaRt3kOnrJyijZRBUO1b4rRzp8CtRr1Jho3xcSL?=
 =?us-ascii?Q?atvq4BMjAEiFfd/509Ac6AoyBlDsryxWCY8Uuxv4/NuhVmpE8dtIDI2cr/NO?=
 =?us-ascii?Q?9rZRrSAFalwwlisHfOQdbDKGu4PBRpUytKGtx58kRx9rqIudCXsT/FkAzjoK?=
 =?us-ascii?Q?1ng+wbNhnegxlwbITTdjcOcsId80jwtBX0kbQ0Jp/HMfZFXSdRFxIMgrFfMw?=
 =?us-ascii?Q?i37hoMgi+0ypD1gRXKW8mmw1LkYdQ3x0CfctIEcjuk4gn3pSbievsIpi8w4K?=
 =?us-ascii?Q?Qev2n1U1E5RoI7yVmAz75GHH8s7JelIZfsGyoSgQ3TEISRD1wLmPmOJh8j9M?=
 =?us-ascii?Q?Xgtdl/tDTlLEjTlQgR00a9+XP77Zns6bI4mDhdJUEvL1Gj5R6vrtu9VvyK1Z?=
 =?us-ascii?Q?m9hxzt6SO6wxW1tSALa6USXs7LWSpGYMQcP8Qle/rLY8MxwQDXeyS9xK1ouT?=
 =?us-ascii?Q?sUzJXtj1sCrjl6YcKurwcwp2H/F39gi60lGN2qE/iHHgUNoaW+004F3Xfzno?=
 =?us-ascii?Q?IsOQunEyB4qq0ZGahwnqHIBNOZpTQu1VKcN3qV84gNKTV3Th3Ko7QEOR1sGY?=
 =?us-ascii?Q?gQzruMKG8y/ji4EMBHTjy4uP4EJxAmuyPVPExsgmSlTyCwQvw0zWmigSklfR?=
 =?us-ascii?Q?GU2WXlICF2RYTlU0mO+iMwi/CK+JTtEFPJBTXcWGS+J9lgfIHvYG2Qc9HBg4?=
 =?us-ascii?Q?XNXsAgKLMOoaPdJW+uPa9Y2R7WRXHmx8tawCk+wdvR2/gRto4z0zYLSHSE7a?=
 =?us-ascii?Q?qXf92933PnrRDkA/bBJ+lhAUS6D6zabInDWQPtHUpnH/TyOxuZvgfrVLdZxi?=
 =?us-ascii?Q?lXGdX4qsR8NzX1skMix/xW/c+NVtT1R5ssEGlPRFhjSWILwF5WEYspm2zqEi?=
 =?us-ascii?Q?ft89JT0kQ+vMOQDBsepfH+wwmPThcBK0VyHLNCE6S7oiw8WZe7CEz/gKsID9?=
 =?us-ascii?Q?q7mLLhFcCdFGc7LDmI9DvPGvb/CyoJBAVD4ZueMCTyC59nen5cVQMOPUSh25?=
 =?us-ascii?Q?7C2OGh3RS1nGdThIkhrfKsRVXM81R6GG7UK1f/DmEY3T3kz/x6djSEjF5RnI?=
 =?us-ascii?Q?416ie9HWP2Op0Q4yId8ybkomng79uYFAPjr5OyrvCrFNdvCx4840tUVuDB68?=
 =?us-ascii?Q?NgOKgc3m/A0ln3XPRHBwdjIy25Avu8TQlrCil+s2GYnt7y5xuytP7WKi3Lxo?=
 =?us-ascii?Q?IvuKXiD1o/iCMtMAji8oZXkeiEnzTbSupAzTUHspTDLoHSbmBkDNTDsn6o8B?=
 =?us-ascii?Q?qUyPZMjlP1tIkQeiWU1sZdqsZ+UXa8DjcaH6ugSQuVw6UNizQx2Hn+uF8dAv?=
 =?us-ascii?Q?WiGQe+2QLBTcddomeyhwFqA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4de457-507e-4b0f-f24b-08db2b13b2b0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:20.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUGBxtBXpjJwg8YpPwDrfnGRClnXksdeDXB3sdqMj9BSCni4rwKnllTGpy03UD+dGtMA0K7fHnYCzSH3W+U+z8T0Q7PdTRhi9gWK7+R0qO8UBnz8JW8WtLLGcIY4HuoW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7342
X-TUID: SQxu2yz7QPqJ

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/syndrome.h         |  7 +++++++
 target/arm/tcg/pauth_helper.c | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d27d1bc31f..bf79c539d9 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -49,6 +49,7 @@ enum arm_exception_class {
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
     EC_ERETTRAP               = 0x1a,
+    EC_PACFAIL                = 0x1c,
     EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
@@ -231,6 +232,12 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
         | (is_16bit ? 0 : ARM_EL_IL) | etype;
 }
 
+static inline uint32_t syn_pacfail(bool data, int keynumber)
+{
+    int error_code = (data << 1) | keynumber;
+    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | ARM_EL_IL | error_code;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 90ad6453e5..bb3dc7ff54 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -411,6 +411,13 @@ uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
     return pauth_ptr_mask_internal(param);
 }
 
+static G_NORETURN
+void pauth_fail_exception(CPUARMState *env, bool data, int keynumber, uintptr_t ra)
+{
+    int target_el = exception_target_el(env);
+    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(data, keynumber), target_el, ra);
+}
+
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber,
                            uintptr_t ra, bool is_combined)
@@ -430,6 +437,15 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
         uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
             ~MAKE_64BIT_MASK(55, 1);
         result = ptr ^ (pac & xor_mask);
+        if (cpu_isar_feature(aa64_fpac_combine, cpu)
+                || (cpu_isar_feature(aa64_fpac, cpu) && !is_combined)) {
+            int fpac_top = param.tbi ? 55 : 64;
+            uint64_t fpac_mask = MAKE_64BIT_MASK(bot_bit, fpac_top - bot_bit);
+            test = (result ^ sextract64(result, 55, 1)) & fpac_mask;
+            if (unlikely(test)) {
+                pauth_fail_exception(env, data, keynumber, ra);
+            }
+        }
     } else {
         test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
         if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
-- 
2.25.1
