Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3F1CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3y-0008UD-V2; Tue, 13 Oct 2026 04:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3X-0007QF-FD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:20 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3V-0007te-CS
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso34525265e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880816; x=1792485616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Y8q71JbmtGZDvZaAdzWnKGUCtm5nx9NvXNrI90s4PFM=;
 b=DvzvNN8jECCQDSRyUL5rjWrPIMoK2ILMonvragJQuVPJew20Ojo7eptN/DUd0q3s4z
 iQJFWyDbWfO+aoQwL2Bi599cX36Qenk42QZzhEyUPrD5utsVRUDEWXEKcMvD4kJTiYz+
 mUcxVQ2rd2mWDDU+lwQqpX6XFLzgZNyF6phudzNGD9ByKWwtDUVq6L4WlemH5OW2zidj
 PtHFGDDtRSPt6emuz3BowIQKJJSPxPkWjEg35Lt59wa36aRlWrstcthaEndSlAJCl1Ib
 gkmz9KvIQ3AZC0f1K0mWEmth7SNfJ/MSciqZxlkl+VyOVYJsoQWXVeXRVb+gey7+I0i0
 Zcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880816; x=1792485616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Y8q71JbmtGZDvZaAdzWnKGUCtm5nx9NvXNrI90s4PFM=;
 b=Z0d+qRLejz32cWEP9wKK9N1qHWINBQ6r2f9KoiAlJml5VoxjiF8hbt/1FjqACaT0CI
 gBW8kXD23aZjr3Tr/4/SR53GcNh3j5FjG8rbC25T5Aw9RTNcnwiS/G7dVhZFDWeGKC/m
 Zg+cEPToSAxYwLizG2/31XlWI064bV49NLIFD0V3nUHlwBjHeREqwsPI23fF+ZPdXfiq
 2qkfUQcymizn5pWpZNM9IwEXDbbLSTP03AkwsKyol8uq8C2zPY8UjbhLXkqiYaJH7Qdu
 dlF7ezbMXE4CrOSqsEPRWTP5rbVAQwov/D6y7AuDVb6PXYryqluxs9MpJOKOvYJXRTDz
 ulVQ==
X-Gm-Message-State: AFq9FYIL6BgXixxum2YHdCxf65sfkOItFBTh5kGromp3/1v0l+Nb98tr
 RgPi1teRgV0isGNQQ3x+xDHRqgelCXlRmuz3IsHagf9Xn7hi6uNFz5EwQurnYf0DUqrIa9pNaed
 oRf0W260=
X-Gm-Gg: AYBFou1N8+Nrl3xJtzLKRIrtfvBiJSHDTmyodNtudUfBAwUeQWi95v10BU3BmRgCasP
 Z4QbmAYEOq+xLwf5g36l+bqUlCme69C+0DmbCIbp9IWfiaqOAL0D2TJlZWvzfcpYUe57TpFsbMx
 Jw2DARFIm+6+P/2a53lCs9RbCi9ceIgftA3mUjZmUhUXAzZCQfev+Ajad3iZlMK/79kiVTbu23d
 ujW5ZQvcbgzZOY8Qt+GShmIhiSjyiLEakGGYW4yCfHDSb5J4gw5aS2BfW/IHFeeSe08GOy3Y/2E
 gLEv+4xW1Px+4FwJ8ZaZ81+0wU0tXjx7K4448R5l2jyQUwDChx80g4olkGgFtX0v1cuFuCcqLYU
 DMfXLClkX9ONZhs+Vs8JOLbhULHZqR/waSQtiSj4y+RjON1+zYn/IONxlfFMBvcP0h5JpLHywUJ
 Kpw/CHQ6XEWB2BJYRN/1mtDLC5ZCqXyWBzNAY/0Gk1AYEuuCo2YgWyTjOsDaPmOhw+/NeN4FrXt
 ghOr5/gEsh9FKeRgeUvl24ngVu96Puq4Wl/eoSG69ZttnCaF/f0QLk+G/Ax5QKf1LNcSgx0HUG+
 BTY=
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id
 5b1f17b1804b1-4a18e4913c3mr198777055e9.8.1791880815822; 
 Tue, 13 Oct 2026 01:40:15 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 29/86] target/arm: GICv5 cpuif: Implement
 ICV_PPI_CACTIVER<n>_EL1, ICV_PPI_SACTIVER<n>_EL1
Date: Tue, 13 Oct 2026 09:38:36 +0100
Message-ID: <20261013083933.1024405-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implement the redirection of ICC_PPI_CACTIVER<n>_EL1 and
ICC_PPI_SACTIVER<n>_EL1 to the virtual ICV_ versions of these
registers.  The underlying state here is held in
ICH_PPI_ACTIVER<n>_EL2, but the inner-guest facing view has set/clear
semantics.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 38 ++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index b55fe4991ba..876f5813d5a 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -442,20 +442,42 @@ static uint64_t gic_ppi_hmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return value;
 }
 
+static uint64_t gic_ppi_active_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    if (gicv5_icv_access(env)) {
+        uint64_t value = env->gicv5_cpuif.ich_ppi_active[ri->opc2 & 1];
+
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        return value;
+    } else {
+        return raw_read(env, ri);
+    }
+}
+
 static void gic_ppi_cactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    uint64_t old = raw_read(env, ri);
-    raw_write(env, ri, old & ~value);
-    gic_recalc_ppi_hppi(env);
+    if (gicv5_icv_access(env)) {
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        env->gicv5_cpuif.ich_ppi_active[ri->opc2 & 1] &= ~value;
+    } else {
+        uint64_t old = raw_read(env, ri);
+        raw_write(env, ri, old & ~value);
+        gic_recalc_ppi_hppi(env);
+    }
 }
 
 static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    uint64_t old = raw_read(env, ri);
-    raw_write(env, ri, old | value);
-    gic_recalc_ppi_hppi(env);
+    if (gicv5_icv_access(env)) {
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
+        env->gicv5_cpuif.ich_ppi_active[ri->opc2 & 1] |= value;
+    } else {
+        uint64_t old = raw_read(env, ri);
+        raw_write(env, ri, old | value);
+        gic_recalc_ppi_hppi(env);
+    }
 }
 
 static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1043,6 +1065,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_ACTIVERN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[0]),
+        .readfn = gic_ppi_active_read,
         .writefn = gic_ppi_cactive_write,
     },
     {   .name = "ICC_PPI_CACTIVER1_EL1", .state = ARM_CP_STATE_AA64,
@@ -1050,6 +1073,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_ACTIVERN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[1]),
+        .readfn = gic_ppi_active_read,
         .writefn = gic_ppi_cactive_write,
     },
     {   .name = "ICC_PPI_SACTIVER0_EL1", .state = ARM_CP_STATE_AA64,
@@ -1057,6 +1081,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_ACTIVERN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[0]),
+        .readfn = gic_ppi_active_read,
         .writefn = gic_ppi_sactive_write,
     },
     {   .name = "ICC_PPI_SACTIVER1_EL1", .state = ARM_CP_STATE_AA64,
@@ -1064,6 +1089,7 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .fgt = FGT_ICC_PPI_ACTIVERN_EL1,
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[1]),
+        .readfn = gic_ppi_active_read,
         .writefn = gic_ppi_sactive_write,
     },
     {   .name = "ICC_PPI_HMR0_EL1", .state = ARM_CP_STATE_AA64,
-- 
2.43.0


