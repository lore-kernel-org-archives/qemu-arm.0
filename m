Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66C9CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:45:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY4M-0000pU-HB; Tue, 13 Oct 2026 04:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3b-0007Ui-Bl
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:23 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3W-0007uE-QG
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso18657755e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880817; x=1792485617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Hrch6mWn18Vsni9ZYGMXpYD4co+MVRjdvkjQZHLk8Lc=;
 b=d2e+aPxgNxvYeNKooL417/DX2KuMKT2T7P3JQlVVciYfYTaxk4EncoJ+U4mr1qyHIo
 0yGYkkCG6FLsiOdWTblj6bryp6lc4qCJJI7D21Z0AOp+jngDMaPqKo7FlFfiuhbb541f
 ymLPS41mwGHXsWXdtOfZ9qJsFYz782Dj9LtUaihWb9u7jdZZC4Xjukl9hrBOpjsqPtzC
 bosW3k7okVAIpYC8qP0pyuvs67ZqZuX2IjIR4rZ+qcUz9qr/lP9aUYpoxeTzgEoOarq2
 JCZft58VeVCS6DsNvyk5//AImbfdLguvrm1whNeLmzI5UjraTJE41oedG7gETp36ucI7
 Nxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880817; x=1792485617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Hrch6mWn18Vsni9ZYGMXpYD4co+MVRjdvkjQZHLk8Lc=;
 b=QzVI5LKdACakAbwONb26dKk3VOGllMJfZCaL/NylwsVaN8EdkgImSnnu8cepQApbjt
 Xo+MSf8qeNEv4iiQfKwN27XhDXC3tpAtWThJmoZIX38/PbnP24fnh5YC9e4bi6FhoRg0
 GQzef9m1y6QJmMqgJ8j3SLIHbnFOFdDtKkpuQfCyt9Ahr4cCY0xmnJerEgFrGbKHpGSZ
 5t5D2yZuAmMDqOQUAgORYh98Voaodx3pweXBLiXGWhrpacljxg1lK5OeonWb2ZaY8BjE
 W4zpLIN/I+y+jCl3cocYuR0umsS6iGqsWTCGRSvNON1VWA18O+oalRFciZvD6p5ExgGV
 XjDw==
X-Gm-Message-State: AFq9FYJEJly4bWvmrTVY+iwuh/NqmPS5TF7I0uZu2Ah0jQmy/z1yGpST
 AXJSKXLgqsNvsUAx9MKZVPuJc5DsFPuCmExSGWyEv0AYc+xyk/TtPlQXF6VvaunaPbMGAd2PWz1
 5Yulp168=
X-Gm-Gg: AYBFou2JyzumiWciMILN5Zg0AGR1H1yUzaLZ0A8b78SQdp8wGlWFnoKGTpMBxZ7/l8H
 f4B/RKNqH0ekBwUqIVXcQQlBradh03PCBGI8iTdDgWFAPRJKdUZnWZ4O/AU2QZaLMbgkpWSIL4k
 Fq7hOkcPNaecOFkR7tmnVJ7TLEmvGWutdLy5dhI2Rz9MtW5W86jZ84+3DHcN/NBFxcQfFWFFFAS
 ASPhiCNsqY/YFB9it38uEUKNkiL+Nx6YbOdAG+Vi/LurmLXGe8wVmkkbQHhPnbukjcXLNjYOKKP
 nGPEbbkJvd5PQEcOOPomgm+RxtTng8SXupjFsGWLbuCQlCUdu6HbXNbvBkh4PpZC2MSHKy4bUjp
 gmXyju4hlGorz/yzdhhitlwLv79ilId3sp0OAtfqR10MyokojRIpR9xoKUeQR+J491bvyt0DjYx
 MErPRCH5yCIgdLw+O3zR1C46Utlae9GgIV6RP5SlVwXdti2bkMaXVJeSHQ4Jw9pFCAU0d3dcig3
 irPqikOZWjX9/ExdU/BasU3NSGtf274knqanDUIPzTtrkLS64lcTNMw0u79YMbc/32hHCrC74Er
 63c=
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id
 5b1f17b1804b1-4a1ac666396mr23901165e9.15.1791880816785; 
 Tue, 13 Oct 2026 01:40:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/86] target/arm: GICv5 cpuif: Implement
 ICV_PPI_CPENDR<n>_EL1, ICV_PPI_SPENDR<n>_EL1
Date: Tue, 13 Oct 2026 09:38:37 +0100
Message-ID: <20261013083933.1024405-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement the redirection of ICC_PPI_CPENDR<n>_EL1 and
ICC_PPI_SPENDoR<n>_EL1 to the virtual ICV_ versions of these
registers.  The underlying state here is held in
ICH_PPI_PENDR<n>_EL2, but the inner-guest facing view has set/clear
semantics.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 40 ++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 876f5813d5a..96384c58726 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -480,26 +480,50 @@ static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static uint64_t gic_ppi_pend_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    if (gicv5_icv_access(env)) {
+        uint64_t value = env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1];
+
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        return value;
+    } else {
+        return raw_read(env, ri);
+    }
+}
+
 static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                 uint64_t value)
 {
-    uint64_t old = raw_read(env, ri);
     /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
     uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
     value &= ~hm;
-    raw_write(env, ri, old & ~value);
-    gic_recalc_ppi_hppi(env);
+
+    if (gicv5_icv_access(env)) {
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1] &= ~value;
+    } else {
+        uint64_t old = raw_read(env, ri);
+        raw_write(env, ri, old & ~value);
+        gic_recalc_ppi_hppi(env);
+    }
 }
 
 static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                 uint64_t value)
 {
-    uint64_t old = raw_read(env, ri);
     /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
     uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
     value &= ~hm;
-    raw_write(env, ri, old | value);
-    gic_recalc_ppi_hppi(env);
+
+    if (gicv5_icv_access(env)) {
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1] |= value;
+    } else {
+        uint64_t old = raw_read(env, ri);
+        raw_write(env, ri, old | value);
+        gic_recalc_ppi_hppi(env);
+    }
 }
 
 static uint64_t gic_ppi_enable_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -1134,6 +1158,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_PENDRN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[0]),
+        .readfn = gic_ppi_pend_read,
         .writefn = gic_ppi_cpend_write,
     },
     {   .name = "ICC_PPI_CPENDR1_EL1", .state = ARM_CP_STATE_AA64,
@@ -1141,6 +1166,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_PENDRN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[1]),
+        .readfn = gic_ppi_pend_read,
         .writefn = gic_ppi_cpend_write,
     },
     {   .name = "ICC_PPI_SPENDR0_EL1", .state = ARM_CP_STATE_AA64,
@@ -1148,6 +1174,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_PENDRN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[0]),
+        .readfn = gic_ppi_pend_read,
         .writefn = gic_ppi_spend_write,
     },
     {   .name = "ICC_PPI_SPENDR0_EL1", .state = ARM_CP_STATE_AA64,
@@ -1155,6 +1182,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_PENDRN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[1]),
+        .readfn = gic_ppi_pend_read,
         .writefn = gic_ppi_spend_write,
     },
     {   .name = "ICC_APR_EL1", .state = ARM_CP_STATE_AA64,
-- 
2.43.0


