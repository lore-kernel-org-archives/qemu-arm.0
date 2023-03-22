Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5714658ejb;
        Wed, 22 Mar 2023 13:26:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set8o6FCl0sDTmH3A5Rdm0VEyvxqC5BFSb7xz1vIK1hvSXT3mDytSW6Mh5VMjQxPSjmAmi7hA
X-Received: by 2002:a17:906:f92:b0:8ec:4334:fe with SMTP id q18-20020a1709060f9200b008ec433400femr8833400ejj.26.1679516782213;
        Wed, 22 Mar 2023 13:26:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679516782; cv=pass;
        d=google.com; s=arc-20160816;
        b=qiqglE6k2AFVVXxXQ71edoSGU1rc5lyLbfJcczQC4+l/LTqtqceZ35rAix159jPXnM
         RII7qsk7O15FjCOM43iW8OXB7V3aOTL1BMv3L5nGP/uHP6L1/hOL8fT194JJ+7FJucgR
         pJhckhr3eDsm1S2Fs0DT+G/CRp1wnFUd7EKI7X3xTRzfAcYAZULXf0n1+xjepiD8CNcy
         ZM7/rVY6gnzb7vaoM8PaloAOMVCJrKusnbn3gcJE6t2dNp02crLMBbofgAWlc9iTbdFk
         2O0IUFmINy5i5hwbCuUkbomA0bz+H7pKwlA+HU3UY6hr490y03Zz2YaWfNQ+hxEO5Ngz
         0E8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=19pSyUl9Kzc3k/BE9fHxbqrjW3rbzjji+u6bUWw7fzE=;
        b=KvPA1FPaXcAIW1Eycd+cktttqEBzE8Y5lcQR4tNWRHyz6ZcX73st74pUB5Gl346T4Q
         UvzeDFedSu6GB2sB3pn6BoP0mrRAZkiWueAbhninccM/g1NcWPQJzbOGFYWAsYALnqgH
         2ytr7lGpOVOsnp4An5BVcYTQNBqto2x+8TibUBLeD3xJFnQ6K6V2hKOiieq5WTUjDKhp
         xKabGQqpksX9IDP2aaCYCq+PpPDV9p6UC5bPKgWevDpCaMOjkc8bCB/d/FQ6wzSXGo9l
         X/Z59PWCmlXpSgeRka0l0iZDb4ROITzucq/cPxf4zm2JjpyO9UrX7NLEj0fwBA2PDVDm
         Lk3w==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=gNq5G6G5;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70e as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070e.outbound.protection.outlook.com. [2a01:111:f400:7e8c::70e])
        by mx.google.com with ESMTPS id w26-20020aa7da5a000000b004fb8210a7cfsi8722233eds.471.2023.03.22.13.26.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Mar 2023 13:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70e as permitted sender) client-ip=2a01:111:f400:7e8c::70e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=gNq5G6G5;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::70e as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNWakDTxO6HmpwJx6Qd5iyZxc3S8IQEqRbziCLLUwUsWZikiEkyAvf43boCOyEgnpNpTdYwXDcbvwsPEa3kwpN5Yg6+SerlAtVS/TfiQQbTIMQCQzSdXwkJcY2/JzhQoLKNN/k+defgj3lk8P37Ag5eyY1Wg4xCUSwH2fA0xCNUWnxIuAd4ZAXR4EhZPnf0GnlnL+NZIFJJqmsy1tsBembz3twEGJPC6z/yiTtnhPFdnxcmMNpnCamz28GcdqkpQPeN+jqCdo4ihEyUSUsPE4DMm6qo8V3DiaqsvdEIzjfwJZDMBwVZbW8GbJxVdpQnmTdmGwaz8PTrEYjGAAr+Cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19pSyUl9Kzc3k/BE9fHxbqrjW3rbzjji+u6bUWw7fzE=;
 b=cIs5WpMpfze2jpgUdiBoFnvFCz7/jFv7POaNJMFOSc/QPxsCYU8qeDWZD3EXFfgVhXh2bc2N2BlRzpEGZKGQtNwdewpFfdRUkjwi+9ZQSyk5SfVkNQIxbuirn+KcsVtxLvBFM4sM2SfJBQf9RcUNTei0/b0s0q+N+JphoeH/SV4dnSKvqpsVj7KUKt5ZKcqWiobTuiveNBdk8im+I9tYN1QM7SvqPbwPXZC/vMiRdgQY8MgFTLrvLsGlMoHhH0Q7iKZNbA7Yx764xmdutkDOjZTzktKOocme9XTqzBPJiEsan3rlrrtyLpxXtAqP7s11ZAPVNRWLAukYbAhlgj45SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19pSyUl9Kzc3k/BE9fHxbqrjW3rbzjji+u6bUWw7fzE=;
 b=gNq5G6G5qO2b2TAHkp9DRIvKcF4XHn3hoB6Cx28XPLcAmcp9oHach2q8kMfc5VX4tP+z6LsLBqbzCm9VxLUbvsOIUxE63btXhtlhG/BF8GJriYir4ApfM4p0czMjH+zF5+SsAtCr9kwlziAZoljrgs3D+2V/EsL3gsDoj7lzoKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:19 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:19 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 6/8] targer/arm: Inform helpers whether a PAC instruction is 'combined'
Date: Wed, 22 Mar 2023 16:25:39 -0400
Message-Id: <20230322202541.1404058-7-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: faf27ef5-c230-4737-bf9b-08db2b13b1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QCTydHcpu/RKLUOhKCXct8ro6igRRLt8xzuPw0OQrzwq6FIGf3zafIrDijQNUklewNlAZVNhRB9HMjxrvW73qnXOPCdIwFTGwv2p7iM3iDSPEFziFXn2dVHAxTX/BdrOXhSu2xA9u9e+rwD1f+lJJZIiXJi2pyminGPY6ulU2JDbfi5ZlCh0CvL6vACl37igniEc51LRSXonB1D0vQpqSEYDNsXftzxm3+bYf6TrvVsc9yWb+TGGSejJnugFah9eTkSvhrVWhGOVpNhH7T9O9xrjabN7/YytFqwINt1pOef/1AmA/lgKHoXke48AxpSBmqJLkwAf9jzSRuPmbKReOM82IH+VX/bI9dU1VFJ/XAJNYWKfOFUTWJJtbcFT7lmSomiDBUb0NABBuPygHIQw1T/Tcxw+pO/pyERl96PQl0/lfgcmrIX6s8LSArflod2h92YofXRBDCzFYAI2trWOwdzYTbYFoDk1zTvz7+3WnsKkg1n7sQ+0bJ3iYY6s7DoJOp1NHjWGEvAR3QqMPkqcVUtD7jIiBkstXUW1CmYGEO/GhGksKJnC6fZgSelHmRvpeIzqrfaKSwgjjWfeGPwaYUQqtbx2XwXqCadaDUa02rEJVbolm83rP6PWkaVwWo8dNZFV0hotgYETbkJIoghGUPyQ2OUBWPAuJH7tzuETOFeFG6HPHyOyG3YAR4Zo0Ia/uBznyp4NyS5HYHWKcTlwvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RYQUUlhy4oT4akmeroDOm8/4WqwEbFL6tyI1qp6n6L1OSDOH0kDSTdTQC6ZD?=
 =?us-ascii?Q?4W44FAZdTqyWQGyyP5TJzJtdHld9bdPoqH/wn3siF/jRzoFAXshQuwsMuc8N?=
 =?us-ascii?Q?UFzdKWnw0Q+PNmtLxuz8BTaOthqg+qLf50vH3TRtSCF9aGtee26N1Z1WWXd5?=
 =?us-ascii?Q?TgqPYqlaSoq5mJuNILBR5qWseqzhQA2gjkH7fbjsDBPOUlyenm5qO7P/eBlc?=
 =?us-ascii?Q?S0YwjM6U6GxhRTdyK8cOpEntFHWQsNgf8pQB37MXEx7LRqibSVp0LZPW+0Dx?=
 =?us-ascii?Q?ybrGsaRIXbEic4CrrHOqy1RPjT8iNt7bFTX/0Ps3uptiwUTEEaCV+jDFAEWf?=
 =?us-ascii?Q?i4Yuwc6jJq3aQGN7WOWF1ABzMFkqSRt99VVBO+shWUgKAyZL6tugxdMOK/El?=
 =?us-ascii?Q?8XqMLfD27FZXTEfwp4ArK21nW12GOeja6sWjFL+6jdrOrNamOiKarT9FJKQ9?=
 =?us-ascii?Q?B/3/N1a/IltSe3O5XYik9UqlYaiJJGWULjF2fiONDT8/dNAly1CJz6B4HqkE?=
 =?us-ascii?Q?+rjbMF+Sk6cLU6jZGHtbvTN3UXMzzhaZKl77GxFPpF80Q4jiw9ESyWip1OG5?=
 =?us-ascii?Q?6dEbZkXReh9yc2jMMgKIMiHQdn9jUQ/R4s68f1DDZwJEOx6x4kYxUoLB8EqV?=
 =?us-ascii?Q?/XxboTm9+C9Rd+LyAn6T0RCmZ1FnZGF3vLUDT8dqW0ZRv/SV4u+PYFOyzJiv?=
 =?us-ascii?Q?IwinA3MwXW1Vw/waHxc4p9ZdZ5vbscmSO9m5qKYib4bY2oYeqxd9uer99rzU?=
 =?us-ascii?Q?saWiL0ppjIx0tsh/bqErmpoPapVxph/4ifBSkHk1ezUnyEFBOvq2m8bC4zNV?=
 =?us-ascii?Q?HYWqe2UkulTKznyi78+1+mbRlrgjkkPvpG52DM9LjPw7tLGazS4XIIlb4JS2?=
 =?us-ascii?Q?ybNHqomRbppkbWDMmbej1LBUzRgvgUF4UwopVLUIoeh2PunYR37JanpSIa45?=
 =?us-ascii?Q?tLqwY+oIuek9MgR0QV3DsT0UwnC3MhoT4pG7S2dBsLcRUat2edhBwsLf6HK+?=
 =?us-ascii?Q?8oAebTVg8xzjJVFVaiNvhF8XX4VyUdxwYLYf3Laq35sfMKC8/UbYwKPS9gyi?=
 =?us-ascii?Q?LadVLBXhgwtG2Odz9TyWRVp3JMNOs4YO8t2k3Djl+mTsx1FUzZ1vhZAH2fv7?=
 =?us-ascii?Q?6bktXdZSZNN7uNFHhjpbpMXGvuwel+nTGmpcdDeuoBS5Qnz+ocZ9N9F4vm7w?=
 =?us-ascii?Q?EqTt/cNeCPU2hla9dR5pVvck/iwDvCn0FClTp3jyHputnGyX00Br3RKB6jNh?=
 =?us-ascii?Q?FYpUMO0laFiGRcFe7HyNpFEYT3ctsaL6IXzha/EoP7t7XSR4NHZGR83w3tcn?=
 =?us-ascii?Q?xLv7da8gfvLo1zIXbdgtPVvY4RXBVoY3ewO6Eo3/tb9K4OyJBtLhbQcFo1WJ?=
 =?us-ascii?Q?M8WRCX4XgFIndFzCh7qzN2DsudMJGuKULnpovjwahOAUZ+8Rswauq2oO7JVl?=
 =?us-ascii?Q?gVCdiukeNUMn0aRtOmQXMXUdmEAJivpkmTILk+Bofl5hHYrTgmwAgo4mOZL7?=
 =?us-ascii?Q?Cm3x6jly5aFBnSPHWD2elNB/0YeI/fXOW0GQdbqPDE8pHfAPgtpBcLIKNK43?=
 =?us-ascii?Q?dyazPHB0aMXiPYHAJoOIR6YMwdbvzbHSbK76pnNf96pG4W/KBLiT7olUxR0l?=
 =?us-ascii?Q?x9vuR87z9PBOw/Gu4CBiZOs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf27ef5-c230-4737-bf9b-08db2b13b1ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:19.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojKDjPcWHrX8IrNEaoQnn8i7ZZZemVSddLrAfXfm1IjQNMS55ppWt9BZEXnnpFdjXEHPiKt4RmxH244RKjh541n+0V2XSeM72Mb04qex0m5dXEHh2yA9xrcbm9gzNki5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7342
X-TUID: y/NRXZ/4K5gp

An instruction is a 'combined' Pointer Authentication instruction if it
does something in addition to PAC - for instance, branching to or
loading an address from the authenticated pointer. Knowing whether a PAC
operation is 'combined' is needed to implement the FPACCOMBINE feature
for ARMv8.3.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h        |  4 ++
 target/arm/tcg/pauth_helper.c  | 71 +++++++++++++++++++++++++++-------
 target/arm/tcg/translate-a64.c | 20 +++++-----
 3 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ff56807247..79d06e820a 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -90,9 +90,13 @@ DEF_HELPER_FLAGS_3(pacda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacga, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autia, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autia_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autib, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autib_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autda_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autdb_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 1148a21ce6..90ad6453e5 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -412,7 +412,8 @@ uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-                           ARMPACKey *key, bool data, int keynumber)
+                           ARMPACKey *key, bool data, int keynumber,
+                           uintptr_t ra, bool is_combined)
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
@@ -534,44 +535,88 @@ uint64_t HELPER(pacga)(CPUARMState *env, uint64_t x, uint64_t y)
     return pac & 0xffffffff00000000ull;
 }
 
-uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIA)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apia, false, 0);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apia, false, 0, ra, is_combined);
 }
 
-uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autia_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autib(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIB)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apib, false, 1);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apib, false, 1, ra, is_combined);
 }
 
-uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autib_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autda(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDA)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apda, true, 0);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apda, true, 0, ra, is_combined);
 }
 
-uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autda_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autdb(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDB)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apdb, true, 1);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apdb, true, 1, ra, is_combined);
+}
+
+uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autdb_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, GETPC(), true);
 }
 
 uint64_t HELPER(xpaci)(CPUARMState *env, uint64_t a)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index dff391bfe2..8da83664a7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2232,9 +2232,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             if (s->pauth_active) {
                 dst = tcg_temp_new_i64();
                 if (op3 == 2) {
-                    gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
+                    gen_helper_autia_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
                 } else {
-                    gen_helper_autib(dst, cpu_env, cpu_reg(s, rn), modifier);
+                    gen_helper_autib_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
                 }
             } else {
                 dst = cpu_reg(s, rn);
@@ -2270,9 +2270,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             dst = tcg_temp_new_i64();
             modifier = cpu_reg_sp(s, op4);
             if (op3 == 2) {
-                gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
+                gen_helper_autia_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
             } else {
-                gen_helper_autib(dst, cpu_env, cpu_reg(s, rn), modifier);
+                gen_helper_autib_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
             }
         } else {
             dst = cpu_reg(s, rn);
@@ -2327,9 +2327,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             if (s->pauth_active) {
                 modifier = cpu_X[31];
                 if (op3 == 2) {
-                    gen_helper_autia(dst, cpu_env, dst, modifier);
+                    gen_helper_autia_combined(dst, cpu_env, dst, modifier);
                 } else {
-                    gen_helper_autib(dst, cpu_env, dst, modifier);
+                    gen_helper_autib_combined(dst, cpu_env, dst, modifier);
                 }
             }
             break;
@@ -3479,11 +3479,11 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
 
     if (s->pauth_active) {
         if (use_key_a) {
-            gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
-                             tcg_constant_i64(0));
+            gen_helper_autda_combined(dirty_addr, cpu_env, dirty_addr,
+                                      tcg_constant_i64(0));
         } else {
-            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
-                             tcg_constant_i64(0));
+            gen_helper_autdb_combined(dirty_addr, cpu_env, dirty_addr,
+                                      tcg_constant_i64(0));
         }
     }
 
-- 
2.25.1
