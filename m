Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D010ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:21:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CB-00070F-R5; Fri, 27 Mar 2026 07:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CA-0006yy-HM
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C8-0008DG-L5
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so1482280f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610258; x=1775215058; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62e2nWfA5UikkCDTdbvEyXi6vb3nI0AfG+OjttEGIxs=;
 b=maJExtiXHHPD2dnugJGFKFyTEEdfvf7qtHCKFRYiBe1gM2MltJt74HYutGAswTiNkz
 lgSGKYG/6Q9Vij+xtjz6leS15nhfzEBIUOIFLOgu0zBtYCsC5FW4WShhPiefMxUJwCSB
 KojC/g9sfUQbnyxWFH7B1KdnzRr65hxPvTxN5aEomJkIX4HMk4fAWWY8Z9pX/zJbWntg
 EaFTNjq2w4UC74pZLEtD30NATJEGmCTKcxZs89FHeo73AcxJimDTP/7PnyR2YPaoHjDM
 D1fRL1ibmONj7hKfR7TLqYaYCQ2ngSVTBaNX/pXSeouhTE6njYrDttmrX5JtpAlL5X0D
 tpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610258; x=1775215058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=62e2nWfA5UikkCDTdbvEyXi6vb3nI0AfG+OjttEGIxs=;
 b=SLD2qrvocrLHl6wMxGBL53ThXmRgV5hjHi4B70B78rywYzzNgibNeSC5SLm1vASWwe
 f3CXjqZATYg6Gxc8srBdp6jHouuurA47rDqZ9ly3ZpZ4dhRGXn9n2C9QBJDKRIgmQgri
 MGQuGpusWyVss7hnjzvMRiTtAtOI4kH9E6VXswFbq2hiDTug7zyjApKAvU2lIE8QVuvO
 NJ8GxwnOgKiJcF5O6qNKWKuFfLWvGyMs70gqNML3UQU8OMQji6aGVRUh8s34plh5Edg9
 MLGhpIjApk/lL/oaN5dVzM/pbUb7i5cI5h+C+Sz6cpeCzxk1YaFEHR2EtqKRMYGt5xub
 +s8A==
X-Gm-Message-State: AOJu0YznC2bxnmAnKZc1RF/A/o85i6fEi8JkYFmmg+G8MkedeZTVy+Ee
 5ePtpy8D0TvlzQP32i+r4A7Ge7OnBqc8bJGqYbGQlBm+vDtGeNs6ApRN9+dYKys3Z2ytJjmbjpp
 6PsaOaGw=
X-Gm-Gg: ATEYQzzEFmMtmEfH0majp/lIUXXjPL31w7xN+24iXCOa7xmcVIBCwH0MlE3f5WdBuwL
 ztVekCrrbASl1XUHtoQuAFwveEPszylmxRqxxEfR5qB9L3AVSlYRKrMtyF95Ms+GWVMQM3m7Vvl
 psGIAT6YEbO7m9aruzgi3MVidM1AVeqQ71VbmbdZJJ+eP3sY/rVf1DK7hvdalcGakXDxWjxdtYV
 QCp453O4fDlCE/6UcKAAEhWTLLCQpOzmpkXwGQiyJHEN75RzEvyg2D6D6Pun+4EzDY4UhaRGOLl
 7Y69w8pYOxU/6QiRE3f6KYCZI0rwvvOZ+IJ1ZyVn1XHOTiI99hNMnyuJalDuClv3eUPP9msAjL1
 Ug2dwLHwu+1F3v72CWhrU12TnyFUlvVDjNSQk002kr+b7l1E6j3PAbRWaVQI/hdHiDRHbfU6hdO
 0/tByn+CIdKEYHoJJHGrMJTsgeh+SgPgmeUtAECw69jPAenov3jOqXPQbjygz2fR7QOQ0EY3fgY
 yCAG+QGAxfLdJBeMR8kTY8kUQPxLJw=
X-Received: by 2002:a05:6000:2409:b0:43b:4ef0:e13 with SMTP id
 ffacd0b85a97d-43b9e9e8225mr3079631f8f.12.1774610258405; 
 Fri, 27 Mar 2026 04:17:38 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 38/65] target/arm: GICv5 cpuif: Implement PPI pending
 status registers
Date: Fri, 27 Mar 2026 11:16:33 +0000
Message-ID: <20260327111700.795099-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The GICv5 PPI pending status is handled by two registers, one of
which is write-1-to-set and one of which is write-1-to-clear.  The
pending state is read-only for PPIs where the handling mode is Edge.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 44 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4574f7005d..980abda3ca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -606,6 +606,7 @@ typedef struct CPUArchState {
         /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
         uint64_t ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
+        uint64_t ppi_pend[GICV5_NUM_PPIS / 64];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index e65bd56b3d..ee97d98d7e 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -199,6 +199,26 @@ static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, old | value);
 }
 
+static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
+    uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
+    value &= ~hm;
+    raw_write(env, ri, old & ~value);
+}
+
+static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
+    uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
+    value &= ~hm;
+    raw_write(env, ri, old | value);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -314,6 +334,30 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_hm[1]),
         .resetvalue = PPI_HMR1_RESET,
     },
+    {   .name = "ICC_PPI_CPENDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 4,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[0]),
+        .writefn = gic_ppi_cpend_write,
+    },
+    {   .name = "ICC_PPI_CPENDR1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 5,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[1]),
+        .writefn = gic_ppi_cpend_write,
+    },
+    {   .name = "ICC_PPI_SPENDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 6,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[0]),
+        .writefn = gic_ppi_spend_write,
+    },
+    {   .name = "ICC_PPI_SPENDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 7,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[1]),
+        .writefn = gic_ppi_spend_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


