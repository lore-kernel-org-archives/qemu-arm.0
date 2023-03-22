Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5714618ejb;
        Wed, 22 Mar 2023 13:26:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set8NQLenr/1h23ijXSDLHmYYuvdMqZip2oM6j0fAA4Ep8acBsd+EkAqL713B04S3dp0htWQ/
X-Received: by 2002:a17:906:2412:b0:931:1567:f84f with SMTP id z18-20020a170906241200b009311567f84fmr3355489eja.4.1679516779328;
        Wed, 22 Mar 2023 13:26:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679516779; cv=pass;
        d=google.com; s=arc-20160816;
        b=nlGgU1/dsm00gCw8hWhkLou5zdRmKr7nK7p7y5gBgY4aOTNYQrJymiVST0ijwRwZA4
         KY5FNgi4oN1y5GVrIn9Er9VlnoQiGoFKl+7urTQ5txUpgY99axtinFzf14PNFeVCrgPi
         UkJ6M1AeG5l3DORWMhWA2BDLiOfdt9/FHjsy6C8tNXBlwg0rHkUi1ve6WhTkbMcinYoy
         OqXq6LZYUWE//PLgCwNuV2UvZB7RqTswbAAjEm6VDnBlitzw0BQro2jp33XhpnyBYWdP
         1RYL555Hv27VlkVuClx41Omavk7SkcWfp/bj2cwSB0QghHUmDZHaXN9PYOIeFujSjL0I
         eSyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2oydfMauGhlnnMmxDhw9rIOlP5mOwX8uAtTjkbj35pc=;
        b=z+8AsEw9m+cLm5G8jHG2pApIFnBwCh7B2Y+sfYEgousBsoyollnmic+JCxas+5q2Au
         2LIGZSD1oTLZk458klixRRbGqSmY332RNPZmU9Q8eC35GxDRWqbOlbBbat+lBy+MGrnN
         iDLC2oAq1Le1CoV7B0yXdAhs+1a106P6MPpWuMGQHLPOZPb918/p6tHQ/mDhNjoy6cgv
         Yr2BX7gFnNgIqlU68XpiUq2RkqhPU3lf/tjzM9CQ90WCaEcphkEzP8NNbGy5EBuT+UsL
         wya5nyDrhpoJavI/biK7r7aHkEIDrbWnimb4WidZ4Gc4+waXXrtDlcMjlYuTAT3VBS2e
         YVlQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=fru7Iy9K;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::71d as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071d.outbound.protection.outlook.com. [2a01:111:f400:7e8c::71d])
        by mx.google.com with ESMTPS id o23-20020a1709061b1700b0092f78869bbbsi16297959ejg.645.2023.03.22.13.26.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Mar 2023 13:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::71d as permitted sender) client-ip=2a01:111:f400:7e8c::71d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=fru7Iy9K;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::71d as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U42rI2ID/qB2g32RX7BS2F3a3g4uNBKdi8iVrXq6bu5pl710WaufsE83VFdHccjbyBzswjK8JrvylJODJRdjKqD3R0od33geisgE71D4wU0oUiAwPmFFoD8YLBuBu3iRxz1KgYbljSrPHovcgHg7Q8FlZDIGFjxnk/0SeRP0BtpyHk3htTysmHDc83YvC536gpox3AHex0hlnfk4MPtWxpokQpoZeNVWVoa6sAPeX78d4Ty5qq7MNBEy4LaOykObqTytEy2oEPs+XAOOkBxhfl2tF7F6YMeQ48anSmA8M2KjUPSraZRqS8jk4YwlOuLkLplbF5MTM12IeIwlo3I5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oydfMauGhlnnMmxDhw9rIOlP5mOwX8uAtTjkbj35pc=;
 b=W/yuXbKf39SjDWFeC/3cLSw/ASS5VIQIiDa4rY5R+enMrJfafqFeh3SUt4AUsrz77JXzvdKVHEZgsqoTBISMcOjPEB8mB3WSEFldpNN8vikOIexvCD3U0KaYc6htPxM6uADXJGdFl9dHdcgorOY+Fg6f9sRujqJ8a5C2MyZ/gpZPxdEy2c3ZwgGYugg7TWnxS9xI5i+9JP4hNmzqVv3u3ybfHNZRjiSE3cZZ1D3dF87MJzJDr7MsIcSgqk/ukFC4l2UCPxKy5MHCUOcMDKgE+e4Nwxblzhua99VAlTxEVE5yVXWOSeKSzWz09czv6y9/ETAQpdUK+IIr1IwcKh3Pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oydfMauGhlnnMmxDhw9rIOlP5mOwX8uAtTjkbj35pc=;
 b=fru7Iy9KKXD7TK2W1utYMcweN1sTvpFYFOSDnxidHqj0korhsn6aYedNdgRx2DB1ylm7v7w0AigFo//CGjlrl+777lmJIIlNhX5cUedurXn5fFKr7kxAHHfQ+W/97Q9UpE6AIAPHXOtaNI4XxJAxMyzESDaz145pLaDQH8pw7Ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:17 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:16 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 4/8] target/arm: Implement v8.3 EnhancedPAC
Date: Wed, 22 Mar 2023 16:25:37 -0400
Message-Id: <20230322202541.1404058-5-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 01a15c47-cc8f-4db6-2845-08db2b13b06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t068BVYxhdCNRLaKJWAalZ7aw/Mc1/PbwS+y6IxiwVhaN01eCLkpYOSiMGcQaCaQ/mteD7jjoD5FOu0yT8ZVwRCplMCJCgMlv/4vGXQ9NWUxQdXkYeC/joCuxzSUveGPA+1sCx5dCIuUTgUiBd0LeENr35gkJyHI4qDRBSlLk3nuP5G5PWd0IZxQIdvQ57AuSPuov88/hIBnkMFklILu+WWLesdJHnYvnBIYcioMUPCTaw8LyQzR/+Ly2VSoV+93jxXlK0haw2pFpdFo4AFt/8Xt+HhBK5EzWYDEMmSflke5YDpCpjBeXJ3veDEPvbtEA8j+gY/6j+vXND7fsieUCJMuS8G5i+9dnMbRO0r1OhHrASsoNvER43qStyXnwxckJz8RL7MvLouneHlrIg79eNXJk0Gjz1Kiq1aMKElYR6FmRKeCowl+r5l4rvCMO2F/7FQ7sjOG1dv6yH+z8P0PlAPusjCVyqyvXsaFMLZvuXb0cfeuY0nMTT7TA4UqYxiG79NJH7wY4pjo5eDpacWfBfSmHfF3gurB4OENx4o7PN6UQELtcUPG/rppoXZDKjqixTjaIkI8EfhLIPC5bdB31REAOfXYYTzfth4DtrLSmf7k71Flbt3LMhYXTwZPQoRuW39nf6+7skK3RrwzTzWkVXpY68VqRCk5loDYggnNPSoQ00ii4Tvxsjgvq++dleOKofDh8nzpkKbFIUCzSrKcCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4GV5vMOz1Uyltmwjb/sBko7UHf+dN5Vuh6iiZx2FVdkaAGH2huN+4Vl8DM78?=
 =?us-ascii?Q?7YKUskAvdBipre+daEmoYFvYart/RceHJ+cOIRROclOAKZTnHCjj5KNrI1Jr?=
 =?us-ascii?Q?1JytLv9lclD2tSRlUQjS5B1tTih/Hvjz3u6Fmw+0VK+U+f3WiHQ4BqqAX2ca?=
 =?us-ascii?Q?K0Ubtpvzf23j9mAOx1Y3hE0GuVIe1myJLsN+Yj1hhlw/3NRIteCgJ9F9NK9k?=
 =?us-ascii?Q?LWReFJL6zKRFqNsJFjG63cNXA7YRqRT7PNCg5UG4wsFN/lUrZLIE3DCPyr+j?=
 =?us-ascii?Q?IUAFmBuvbB4A//P+vjlQkiN3jIDBj6tU2D8zXrROpULywYAe5avzUqy3oDan?=
 =?us-ascii?Q?l4vPq/2v56lM7HbccJa0WhFTRf6THfT8qRhXzgEUNsWXbskwUROaPf2s/dFm?=
 =?us-ascii?Q?KlwSr5rVVAlfvOKOPnv14ezkuynary0vlseyM1HGOekepMw8TQXwiPH+xBqV?=
 =?us-ascii?Q?9G8ClWbiSu9ePND8R2gnJrmm7hrV7b7ursEtTRzJC3SuOOmQgl56VC8QIYYa?=
 =?us-ascii?Q?Lc1whqvvM7mvqTjphCbOe4IVueKGaAgJCivD0YY8XqtU7m7DHQ2UR0XgiNcV?=
 =?us-ascii?Q?kXTcjyd/A2YSOYpkWSG7gftU45npdKASDvC3dyfytpNZO10exylxPK+xM+Wy?=
 =?us-ascii?Q?Fnm2O8RsWQw+5tN306J6h0p5/W7QKf+dDRuC1sd3Ylo8jvVm6TcPIq6ffpHj?=
 =?us-ascii?Q?AhL8wUNoFfjrc9vi2potzrxjBkRQAqiYp/WL9gujB1YU15NzRk2aUhWe91Fb?=
 =?us-ascii?Q?0zfGUQ2ghVfBFDnnVHwolmgkX1pZCkKFZhMgWs/05F8d2xY9cgZTuYoE+lLP?=
 =?us-ascii?Q?lHhuaBJWf+JpPWKlPx6PJ4AW0gan4NnC7w0A3YhQ24McoZ/PKBfvhlAEEYnh?=
 =?us-ascii?Q?PCbMb/mIdcIDTWORc2HUlpKErGpFsxAyc1GM/s0utbBHTKyWy3V/TXtmjpYv?=
 =?us-ascii?Q?N3Iz0r/EKOnag3OR9aUl/EHX0+vTXTF9+waGXHoxZV+XPcIOyhQCJ/Uj5JoW?=
 =?us-ascii?Q?FNqvazUvZcOzCaPLe00CLRHWkQux1obwdXcVMI7xshRfSirIi417Edc+fI40?=
 =?us-ascii?Q?l9I3jIqKSgis6BJCrF8Dn7VaDNIjE1rg4v6xkYQxKHftWjXCiDcWb203UkB/?=
 =?us-ascii?Q?vueYQlhwHJ2Vny88M+4t4Cls8TD+sJUKTftAB/Gpf+oWdBkw2GIwj/4QhMoj?=
 =?us-ascii?Q?LGNK59cBlYgoSv5cHH4YZZhbz7Efvf7uw9Vso1VvfXMoGhx/DRPzY6BxxBzc?=
 =?us-ascii?Q?iVKeWCcH4mboBrBGOvcUVQCL44HG80tR3FIH7Q05CYN1dc7I54mRXPSX4Wq2?=
 =?us-ascii?Q?MNA9YDGVKn5buEUZFAXUNPwHTUWrRhbXupBByv9plsMcoxzafIK3gEoBdA2q?=
 =?us-ascii?Q?r37U983bdypGJC9LDYQDA3eD8kvj03T2swqz8fHBWk7dRIh/sukyxvV5pgq4?=
 =?us-ascii?Q?4ZTAnkkscLpGbMUk1ZoDa4mhDQLzmKWjPzZWEXXq+AjGTTtumYaTdXBFFeUO?=
 =?us-ascii?Q?2YLwilFmFumkmi1DtII7GHaqw1xDdAQCRnHn2fHRtHdpyjyZXroGmNxg8xQ/?=
 =?us-ascii?Q?WzGQrIOJRHsOQAKZDlE6SoZaJ3AHBdck6AdjgNZNZsTntuwipFyMkeKH3tNL?=
 =?us-ascii?Q?HLgIPcnfd2m1XaWpUj/esG4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a15c47-cc8f-4db6-2845-08db2b13b06d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:16.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PuqMmImlDR7TVwIqdfZxbBsPDTmUWAuedaoNaoLgEMEe2lbrHlv0gEsOjgFjRblEZ4Lgg2+qB368VeFy6Bx+AOjzK36FbVTKUA3lZ1k+Yh5pCrbvkEo3jPbeI42RbaM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7342
X-TUID: QHsZDNhn8whW

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/pauth_helper.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 122c208de2..7682f139ef 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -326,6 +326,7 @@ static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
 static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
+    ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
     uint64_t pac, ext_ptr, ext, test;
@@ -351,11 +352,15 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        /*
-         * Note that our top_bit is one greater than the pseudocode's
-         * version, hence "- 2" here.
-         */
-        pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        if (cpu_isar_feature(aa64_pauth_epac, cpu)) {
+            pac = 0;
+        } else {
+            /*
+             * Note that our top_bit is one greater than the pseudocode's
+             * version, hence "- 2" here.
+             */
+            pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        }
     }
 
     /*
-- 
2.25.1
