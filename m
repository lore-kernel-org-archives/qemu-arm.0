Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp534632ejb;
        Fri, 9 Jun 2023 10:23:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dVeq5OG+X+Cm8CtE6PzNaTGF42DAKN5B0/7Jrrd5EZv5OzzxerMNylBfgeKD8WzUMmk+D
X-Received: by 2002:a05:6358:f56:b0:129:c477:289c with SMTP id c22-20020a0563580f5600b00129c477289cmr1694827rwj.26.1686331439413;
        Fri, 09 Jun 2023 10:23:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686331439; cv=pass;
        d=google.com; s=arc-20160816;
        b=0nXfWEPO1M9mDncANGZdFfpWR6Zkml3ECBmNeN/+wBIvZIKOEzMYj/4ApWHkpPUUUD
         hMZFkt9oo73+mYizlBcjxFZfvntE6hPqMN+1lcmiLB/sLXLKMcfiYXaMltCtataoFgb0
         OA27b7/6QaI2lEBgbN+lnJTvD7m9+KmT/CIORlD7Ux6Cg9W0X8TzOi7tNEUqD24qWfOq
         CFSx7znXyOb6ynCGovXvnK/CI538hMUsZoSQymKCK4yWdxQd+LknMUgt8pOFcb4dyhVx
         2HwyID2aSHIUChmND0+NnCyJvCagJJ2V5faZbMa+hCRlcu3MMUvlHHGk1XsEGW5ulF3P
         qs4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4LbFKRhLM4tFTF6ZnSWYo2OCpwOarLmHtm8rjno3vpw=;
        b=jiEjSreWg0VwLsex9KJOhHZ2H05/aZAp+N8Icsg27FOkBQawfzig9xZ0PyDCdCjQ8K
         fLQzak78PViZ2STICCfavCkBBM8/IxStRvjoDVSPfSkV81PZhIGCr5LNx+ZBil0IuWgN
         sIBORIrP4/PS1sHOvTEu+lHvKQ0sUolj0q5NLhaQWwFbwwaHhe5pWYgOIt/FU9UTHAwL
         m9EOFuKzYMYayIFDE18lYbb6L27DERdyo6qrlCgf0b+HXYNmd1grWykxjhF7kmRxHdwr
         OrOfxLwJijJ8yqe//T1B/Nrd+VGcaST6SLcj+fREsH5s7TbGl4c9RXXxl74uqodFZa/V
         AytQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=JFnvaWjY;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e88::729 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20729.outbound.protection.outlook.com. [2a01:111:f400:7e88::729])
        by mx.google.com with ESMTPS id f10-20020a63de0a000000b0053fbb36fc65si3017740pgg.382.2023.06.09.10.23.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2023 10:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e88::729 as permitted sender) client-ip=2a01:111:f400:7e88::729;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=JFnvaWjY;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e88::729 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0NoIfrKyYiICiom2PNukXNEFBSQlFP8Ywopd3e1FQZRYHiZLbbVpkq6uy1HmQrqXbutQs6v4SfbaGQ+po9fYfIdyQG8TkMYjCBYZy40Kjd1VsJYq++dbR4RkfLZ4mT67DGfWdMQeXVi8hs9PGi+PCNvmjYofXYCHP5H0RkBbVOVCGM1WYrxce88wUpqzBJzJH2WkU4sb6VsRJCYrvHzZnwoBVBlAclMlAuVXbV9nMdEi32usw89DmKoBHBUvcWlJPo/ahX2GInhUeU3yaANQMEgekAUXJ2emr+rO074D34RE0kjfp3jBzxwXFvU5CEwTUENSlF2ceeoR1N68dh1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LbFKRhLM4tFTF6ZnSWYo2OCpwOarLmHtm8rjno3vpw=;
 b=CH57Xdgip/SjFnGFT3DjcF8Q0mX+ZC5XfhqUN01n3fybMQpIWPBMjhEC/DqViMnqo0l1CNFKRdZpQNe97IB8vpKbm0Y2WOvHZEAukvCfqlqGIg/0xrlAf/UMM5oDa931kWWc2+DbEHhWe0sseODeg1A/Z8xk2wQiURasHdvigNUCGvZCcGTsu7wz5kDsbwLfkphJu/JfXkX3A+twd+bdTVmFfwjAG/zZN+FAUMUun5bH2UG31rxSELy/Jgh6r8fuSiCQqZAirI/FrKsptplyX7k8YZdEb9tzaUXvzYE8uT6zS76oky6fsEcfNnH6mk0XpM4NeHZ1f5cV+2vj6uedcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LbFKRhLM4tFTF6ZnSWYo2OCpwOarLmHtm8rjno3vpw=;
 b=JFnvaWjY/l4SUxuSpnE87D4xL2QDSd3dA8ZFoin3Zl6iwjRdxBMwD/r5E7HX8w3ssrRVS3HR7cN1qlCDi1sHeVgITSWRZjqQsr+EOP8Mu6hQV7pBzWEL5Bl/dhgGzeHirVOj0DcR4lyTn4sP0JcNLiW1OYaRpI7tp3SgeYefRDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ2PR01MB8126.prod.exchangelabs.com (2603:10b6:a03:4fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Fri, 9 Jun 2023 17:23:53 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 17:23:53 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 5/8] target/arm: Implement v8.3 Pauth2
Date: Fri,  9 Jun 2023 13:23:21 -0400
Message-Id: <20230609172324.982888-6-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 571b5fef-4212-4c8d-8045-08db690e4c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U2pQryYlmIqfxsPa/Nhf+DeeSLbbCXZmOjDdfmjwEj2PUFgSNq6eozTHky6wXx3YdG9tU/1zVP+UJAP2Ny32IK0xmfueOCY0focjiiFJfQfjgdkP7JPOBXvEi7agl8XvVVoq407WSM24dlUD09s+PW08gOrOAFoLU4Jxo/92wtgeBkxB75hJRJV8QDZYR/4Xu1uzYZmCu358tFDADvPfEYn5rRUamtflAu1Kd8yvfzBDxOkVz0zlGkP2TwhmyEbNCKIXTrrDm/BJjzUW74672+fYY05GHFVwWgLqIcTo3tBPbdL8QznH+ILr4lASxkYd5ATQowlTOQwUOysef7LRMvuPciPCpEa3A4PIebzijScxLF0kIZ5BufEXwbQn63f8OLD+PBwG606ca+AUlewoa3Ke2yJziuLW4pZuupCuWsgTFGwzcsZ3/d+cEr0lrNWDpEhv3Hl0wvEISoOqpfwWse8XkXVhXm4UYmy8ZhCPKVgS5oGJslELx/ig2BVQyotgTU42NsBrbJSamG8vMUAEUxHnkfmnMcDOosX55q6oYEQmuiLc+K+qY5/kD5GICMC6j4Ag8oGenUUX4c2rqmgLBCzpeTGnCbUk/CQAfQS46DiyXLqvllJXCJxImRT4yh8d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(451199021)(8676002)(316002)(5660300002)(66946007)(66476007)(66556008)(4326008)(2906002)(8936002)(41300700001)(110136005)(52116002)(6666004)(6486002)(6512007)(26005)(1076003)(186003)(107886003)(2616005)(6506007)(83380400001)(478600001)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sDcU1Baux2ln9SpD2DF0hbqacrp7G44A+t36cGjugvFIwZ/tfFaGDcWUr5H/?=
 =?us-ascii?Q?IJc7cpWVNST4C5IQOHLpWFbvzElrbGbVvjKHZela/66moAW3x6fxBEQtasI3?=
 =?us-ascii?Q?uu63InuX4Y8cqtFjlNtbBzfQnRRiV6OTbqshYxhNSdDOUtz2OSXbQUzmf62y?=
 =?us-ascii?Q?pVKhKq1q0GUoi4y7sVrPJej/rhyNhT7ViEHEK9DMXQ2lc+jtn2F6yMjdZzMc?=
 =?us-ascii?Q?glNXGBn9o34pMBQUHQeoUeQQ4n7uPUSAGmZ2cBj2L1Q1iV8b7kDjdEfIcphS?=
 =?us-ascii?Q?3HsdObbYGGgU18YAoxIDoBVjMmQOSY65rRha4RUeDOOod870KsvYMDXnTPj8?=
 =?us-ascii?Q?OBRBE6U2YVZeL0ZDaRnqd26Ya3gwKxVoYz3AjejehWV7QIOfu/fCNgLQdMny?=
 =?us-ascii?Q?3CltEmxnmLxoYWQd9kNn1jflHuvfJjDdVxhr9RbllUEyTJLtmeUPbAB34m4w?=
 =?us-ascii?Q?T9NG976d3Gfztm4z+kGON+VejXXNh0d4dnPD9hI5InBnlSBTsJfiuz6HWUmP?=
 =?us-ascii?Q?ja7yDGzfW/W1f4Ou5Z33UQnmOLXnVg4LMH+6esj9063sTjxFuNYSHjWScWDl?=
 =?us-ascii?Q?nb/ZpaD6Jsr7xlv+5qOaZ6t1bGqS+oMoA5gHH+kJEWCJA6/fkYUFZVMeHrRL?=
 =?us-ascii?Q?5X5wYFLTGLizjFgKrk3DGNKyFBq5/rR7ypFtf72qI01dTTC2lz7myIY4GzaT?=
 =?us-ascii?Q?zJLI11pWyAlQm7MBGRcKXZ8kWI2fnGJo1lj+gw8Y3mjYn463tBGOOIF3seHN?=
 =?us-ascii?Q?Ruj+mQ7XUOEqCM6Mz0efIHggrnIvQNRE8s3TKousWV86PgDQYhVwDa/N1uM3?=
 =?us-ascii?Q?fX3sWr74I9LnSjATAg84Iz5fpCJ/h01vJqhX+bfI7xrJLGWpryNSvn8+hDk3?=
 =?us-ascii?Q?xhdMKeigLcMwu24j8igEzSQpsdSn5dYdqmjCzRWoHDUXUHjvzXp8QiEsWL5K?=
 =?us-ascii?Q?UiFf589j24bUzJ4N6DC8d9Yme6aH7OLaLJyj4mG+XlUDnNtMa8GRLFl44H3i?=
 =?us-ascii?Q?okhQMOC+yOdr5mPZo15Nl9fRQmr4ombUy9oGxri9VFJ/Qr/jHj8EMigNRI16?=
 =?us-ascii?Q?2xL/ekYZhEQUclQPalFqceaFikUNcNNxm62MHakKCjn4+03VT+YO1ReMK7L1?=
 =?us-ascii?Q?emhWt9JLWzf4ZhbUNhRn1PlQZ3LCbwd7PX68EaGinB7WNuh4Wkza/Y1ZFxWW?=
 =?us-ascii?Q?IDvmiHONeLbR7BVMFJXmTONRw+iNCPIZhXmxH30uBO+BsE1vJFT6HCtHi8fo?=
 =?us-ascii?Q?ugYvmHcHRlAYN/31NxhSwspYiHvWFumdWVNEKvmjQuqgSuaUYi+rY/DaUTjY?=
 =?us-ascii?Q?IT3bn/ZlKuA34utnc2Eb750eN7X75brX3v1cfKO516oI2NsKJrXhGlFfeAsk?=
 =?us-ascii?Q?MLkXA3RLiOWLcBXdYMXu7Vy48tQ9wmjw4pMLka08LxP0vGO2CzehOR1WiKgE?=
 =?us-ascii?Q?pF5Y1PpDRXU8MxExWW4kOx46Et6ScuApuagbvDD2p/rm9XOWV9+RWGlQpt+r?=
 =?us-ascii?Q?1LA08mMv+GuzK3No42NEXmqh70Up7gVIb0FYZnq3XKJGMzBdmjkMU3uwaCuS?=
 =?us-ascii?Q?fvbT/Byi2QirftjXYEBCjlma2E985jEk7p1HeiVbVQtG8qzDVSvu794dbuDp?=
 =?us-ascii?Q?atLCMOWQ0O42u4ky0bUHPfc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571b5fef-4212-4c8d-8045-08db690e4c5f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:23:53.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNVrWdkEG/VG9/43U5JcDdKUx0aZEjb9/TAaGo3gIT4RbbNqEvZRc8m6riAcbkL0jlXtIjhKblcpvnbeTQhtfj7eqr+3fIzQChc1ZFtIkOuWgg7eQhUQiWUNNl0lfepr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8126
X-TUID: Ce5MmTzXKDWF

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/pauth_helper.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 1e9159c313..b0282d1a05 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -352,7 +352,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        if (cpu_isar_feature(aa64_pauth_epac, cpu)) {
+        if (cpu_isar_feature(aa64_pauth2, cpu)) {
+            /* No action required */
+        } else if (cpu_isar_feature(aa64_pauth_epac, cpu)) {
             pac = 0;
         } else {
             /*
@@ -367,6 +369,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      * Preserve the determination between upper and lower at bit 55,
      * and insert pointer authentication code.
      */
+    if (cpu_isar_feature(aa64_pauth2, cpu)) {
+        pac ^= ptr;
+    }
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
@@ -393,26 +398,34 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
+    ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
     int bot_bit, top_bit;
-    uint64_t pac, orig_ptr, test;
+    uint64_t pac, orig_ptr, test, result;
 
     orig_ptr = pauth_original_ptr(ptr, param);
     pac = pauth_computepac(env, orig_ptr, modifier, *key);
     bot_bit = 64 - param.tsz;
     top_bit = 64 - 8 * param.tbi;
 
-    test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
-    if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
-        int error_code = (keynumber << 1) | (keynumber ^ 1);
-        if (param.tbi) {
-            return deposit64(orig_ptr, 53, 2, error_code);
-        } else {
-            return deposit64(orig_ptr, 61, 2, error_code);
+    if (cpu_isar_feature(aa64_pauth2, cpu)) {
+        uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
+            ~MAKE_64BIT_MASK(55, 1);
+        result = ptr ^ (pac & xor_mask);
+    } else {
+        test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
+        if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
+            int error_code = (keynumber << 1) | (keynumber ^ 1);
+            if (param.tbi) {
+                return deposit64(orig_ptr, 53, 2, error_code);
+            } else {
+                return deposit64(orig_ptr, 61, 2, error_code);
+            }
         }
+        result = orig_ptr;
     }
-    return orig_ptr;
+    return result;
 }
 
 static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
-- 
2.25.1
