Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp534623ejb;
        Fri, 9 Jun 2023 10:23:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pPOOhtlKjQTS0kwNUij1vNYWF8nVc+LIQ66XntL4g1ngeSbGfBNr+hEr3FJeotCoiL/vo
X-Received: by 2002:a05:6a21:3988:b0:117:d4d:15fb with SMTP id ad8-20020a056a21398800b001170d4d15fbmr1615391pzc.10.1686331438625;
        Fri, 09 Jun 2023 10:23:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686331438; cv=pass;
        d=google.com; s=arc-20160816;
        b=qcvehFYUBbpQIgNIlHhpNTqDAsSBiFvk4vl4BCSIPPY0t3A6QTpPRUBXLbiq5Xnc6I
         XRvxfc/IpQrhEiw8WIJp1L0P/C5FaQoc1zpgIzhLlr/Wj56UV9wABEEWu0iIxu60YuVF
         t5NfPM3jUD5g1KpyNonxj7tFgIj9HcMffPcToN1RE98Zw1EWpjIoG2LLv7iLd7a+DsWp
         wZOaSYedE8lCOl5EVEq7H3x4X/jODzPMxIfNNjgSwHXUYes3zhDFAz10yDZAgFeXUziy
         bOXQE3OGCE5j4Ds4NKwKlhl5K6+axl1K84HtH+T8Xrak9tZCtGUUlTuf1XuhFw2IqCgq
         JtsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lFsA/NscXzn1m1UVysR91UL7Upk5Y9pzyb2gUJB6ATE=;
        b=xl2/cTbr8zz2iExvYyywPF/EGD64ndl7QEWjn1ubEp1iPiXIrysEEyT7XanboyzX6+
         IMxY4BHOi9sAr9BzYFKJNfUBzM+G/Jow1TjVx5Wtg7Pt33DB/oD7er6aN6C+N69KVSJ0
         B3TxBXPcOE4ou/nAri3gOiGHMzV+8v0LM3BUxkXFsKlfQ8kSwFmmLa7pFmPYnquYzNWB
         9o3MI+dCGEyuYsAVzlAIZBfJkT7NbbsnTVAlghVfkFOME8MG3Qsxp7BT+RB62RXjG0hM
         AG2xTSkIevi2Bd31iVjOz0+q3tJedeXNfirW0YmdZ9a693i17My6wzdfWTmjPtQ3wf0R
         Ci/w==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=GupRWy2J;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e88::729 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20729.outbound.protection.outlook.com. [2a01:111:f400:7e88::729])
        by mx.google.com with ESMTPS id f10-20020a63de0a000000b0053fbb36fc65si3017740pgg.382.2023.06.09.10.23.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2023 10:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e88::729 as permitted sender) client-ip=2a01:111:f400:7e88::729;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=GupRWy2J;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e88::729 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHEtUtNejARcOTdorTlSsIB1PukojolY4NghIEnx7szMC9e+FupeWP20vhlQdYxuyzC7mAkY3CHZqBc22npk4gDqaZ/s53O5YDl4mc70JP45WU6ZALFqEdWHXD9lwUbCFqUphJ6YIL2fAP97Lx5lgElda4ykt0WtPKoWCrC92fJAte9TcREJ056Q2HIpTpdJ1gsgApJJ+4pZwUK0O1XIsb6g9GKWx4cE0f0y6mJlT1MQfjfG9W0ugFDHtTsbttTclIp6vn8/VREoP498/8XW4+pRRX24xIAUWzgE0FN7J0c5ibkq63lfVr0NSeGjfYAH+Hi9xUyDOgx+/FeBNHAEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFsA/NscXzn1m1UVysR91UL7Upk5Y9pzyb2gUJB6ATE=;
 b=WuE1xQsZZJg859s9C+YedstWUJcm53mDKsAqvA/2Q5OJycrV3unSjtQ2WmY1nKIM6dAOcePieSuL83E3CCmlYiHRL75nO0OMLbSQN3LGboyAMyShh9hbTvRtNg3Xvao+oIKA4JHrVgXYBA9bmRIGtWsH+Ln/kt+oDmJRKNf8amKN6k+AvCqVE/uB9bKp+P61YATVYfJW5c9V0seLfmqFL5rkEg6o2HQ2kjKFwWr/WfY6Jysb0EI5dfQPVzNy9bDmlm42360pNjVzlbi5NuMa46JclbUYitQLHezm3xD9agKAnSkf8ecNTpuoageheR/0omIh8BvMLPrsN56QqbXpZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFsA/NscXzn1m1UVysR91UL7Upk5Y9pzyb2gUJB6ATE=;
 b=GupRWy2J0k5LCl9CZWQRSQ4z5Uut7xPvaW6KHtxaUyrrVIkuRd74eSEUDJL7oGmym1PMCcXKGgcSeIsXqejgdMiSNmYNXZDX1YshoSmxYtDFgE5mCVun1RaUX6cOxbDQTYXHtNivnDdX9mh1C2lcIfKu9gepHORIHJDus4qhyBA=
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
Subject: [PATCH v3 7/8] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Date: Fri,  9 Jun 2023 13:23:23 -0400
Message-Id: <20230609172324.982888-8-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8291e95-9fb9-4c4a-92b1-08db690e4d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFThhXFcXE9tDRRpspQk1iG+zbUTIPdacdA6Z3nrHJ4OYTlacKsyVH0NO9+515JF3hpvgkzZLSnaQi2gp3JR1wivk0eQkRXOBZshFyLEzuiE0G+2vZslU0hS+lN9Tk1s/ZhP2ubKK+k7si9BKVsJkdsxVkLq0zGGLZEEt8hx2GKb0Qcb7VKUrd/KOLHCjNwYGXVWA2TH0Jg90rKtym6lOt+C1KQte5RtG2oalG/rUkylFZqfrqwWm0D6HtINXYsjLl674UbncUO0ogSR/thUkM+iV/9qT3ju6c/sGfKgLJR1GByBo115cK3cTWXBZqhiGFMPWSC8TgMyEKmoLZs8LGekNKD4n8WMi77P7cAfpxU9iVYRDkejFEs8EKZ9e1NDX2d2QfN6vhCVHt4DYfA+lkHNTYQfB+k5pUMGCNWgEYxVBsq0OwyLQFr6eSUb/JDP3qgTofJTVZrFYpWC4HMew765pylOt1KQBnRHfdRqSAuKRiDcmBkRvtQP/E2va7dVc3Qqvmieat0VEvSfUG9UJvznFE+gyXUYVPXpp+0VcKDYnrkDVMfOgPgOOrMGXv1cOIQdRW8i8/KSQNS6INlG2mLw1rRW3A8C/c0nM+eEQYE+KlaG5/IkdVeC8QTDyRBz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(451199021)(8676002)(316002)(5660300002)(66946007)(66476007)(66556008)(4326008)(2906002)(8936002)(41300700001)(110136005)(52116002)(6666004)(6486002)(6512007)(26005)(1076003)(186003)(107886003)(2616005)(6506007)(83380400001)(478600001)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Im+KYSph2VgTG6P9gk4LYTljPCfjhgwrq+6scMB9RfkVU7Za0omgYsRbh5/e?=
 =?us-ascii?Q?WM0AAFzihsieYrry72xk0jAR+YxwR2fCkIONVA+85U9/db/jVoUQX/ggRJbC?=
 =?us-ascii?Q?Qiq4BgcoyUPaGbkqXAPz8MdMJ5wdMeFuMA21fLB7+fnZaroxdJJvudteVizR?=
 =?us-ascii?Q?kcLmyHmlJGITw6B/VnvXRkiNDHYJl/WLciUWphzOALyy9A1fdCHNhakhXwxq?=
 =?us-ascii?Q?z93PgLBFzM1ztxSmcRGXjxKA+ixdLmOwWX6ZORvh+5fUU47fP5qE32A+0jMX?=
 =?us-ascii?Q?D2FkJwv8EA6QKlJxEgjE9tCNzSXXG1jjnttNMbA8xM6UIj87jmCB9sdNI+cS?=
 =?us-ascii?Q?UOLaylMJSsCuEcrG3OZ+wLcXDumJmZma63YIEq0NThIxUEzUGsuU4rnb6SvE?=
 =?us-ascii?Q?8/x9/Ab7SKOVXwRMumAsJZWzfJUdRctr6QnBYwXnv6IMCtC08Vt4/oo6ffRw?=
 =?us-ascii?Q?0u5aK5GsrlLHNbQkDb9Ou3gCJYF7yPrPXyJlcnRrU2HvtAa0RFIawCysjb6y?=
 =?us-ascii?Q?jFAOLgJQ94Mq8xR5VbvPFM3fjLPShX955edV1rcLXWIU+l2DNND2R9wbaUrF?=
 =?us-ascii?Q?r1yiyk0Nenc9/DHiA3f7NqSZ9IJjAdl9D1q4f/DJtYm48gXg3vA/O2jt7/mg?=
 =?us-ascii?Q?kt/xYo7JqGAVaAI40pYjzNYJjdQm3Qp6JSNgkIcK/Z/OuUNb9Nv9fK2jLM35?=
 =?us-ascii?Q?zxLUxdL0jYMDEsiXyoO4dRmDUMZeS9Cf8EbK7TBQw0LjGAxC4omEqK4TpgPo?=
 =?us-ascii?Q?5DfdDTKwfSP55WPKPsjyvOvRctkKsyBbQ4PynLJz9WolUPpoPMk714npKBNR?=
 =?us-ascii?Q?0Myabo57rsIeIbsLlTe3VotLtEHR3A48zdLdMMQoyV3Hb6CsBFzerRdSwxq9?=
 =?us-ascii?Q?1HCX4U+urhNoqnqkJ7X4K81EUCJhIl0YGfupE7DnqegspoZ4MJwrJ79tZTKW?=
 =?us-ascii?Q?a1kKPLKwNb+vAkethphwDBS1g4JJ73YQRDQFJRFwEEUV9nRsR3dBDDkaHBp4?=
 =?us-ascii?Q?vom3GMFaIGf7f7ubMiMUQIucmKJcJFLXH+sg8aUe7zEDhXCaB1TTm8lfisBb?=
 =?us-ascii?Q?9N/GK4oez6M9t93bqavcFfXVN0K2ZvzqDZG/NaHsvWg5ENMK77Y16oTDK/eF?=
 =?us-ascii?Q?KI0JVnEKeRrSCMMPCaZGJ1/tZQvKis7f4ctDJ2G7h+iIqCgjc7Z9EF/8R3dU?=
 =?us-ascii?Q?Q5/pDKzMKbUly0ZYHGnrdP/nwOPVYPGVGnvhwGsKYgk8NuJWh+cKA1K+HVEO?=
 =?us-ascii?Q?pbUClI202BqfNl3aVAUbw+d+ORzcFgmJM4QJXn2wvXTaJyxmP2+qzNYmhalt?=
 =?us-ascii?Q?Yglo3IvNUvxYyzp5tgsMyL42xjl4quwQDzI+NrJyQR0kd3jO6+NRMls/uhPB?=
 =?us-ascii?Q?MCbfCAVofMgS+advntIF6G9lHkZtNhx2dfdlXOOSGb2YMLFpwdcByn6sMX9X?=
 =?us-ascii?Q?V6sZXd+x624Vq3XVSLdpWhHyOZI90EbNXFjuzWozt0PGEx3HGfSS4kIdj4Ux?=
 =?us-ascii?Q?PEJzfkU6bFhbOogFDnkQUzI4NRP/d8RS8OiJebMIMM6KQejRf2w8fdHxa761?=
 =?us-ascii?Q?yg1+6MgjmjjX1BRp+sXqPTwP7WRzXAM0d8c7/efa9sqoYATlfPz2cJTrMPz/?=
 =?us-ascii?Q?0SeebO45UTL8ruN/l9SMt/0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8291e95-9fb9-4c4a-92b1-08db690e4d3f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:23:55.0734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFtzHalMEJ2GnvGQ9GMxbOHBDcbtFKKNHpmyHUfHZLsIf6XPmHvNHj8Kt7YTFAal0v0FFdaxD1NbYbJKcFUdKuSUxuYPghoNsphK70O/yFoM+5zlEgd2Tfjfl/V5fWOW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8126
X-TUID: V7OGWZB9/v02

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
index 278d6d36bc..f42945257f 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -395,6 +395,13 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
     }
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
@@ -414,6 +421,15 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
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
