Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C3CC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3p-00088Q-FN; Tue, 13 Oct 2026 04:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3S-00077F-EH
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:15 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3L-0007pT-K3
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so23049895e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880805; x=1792485605; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iEX+WzxiZFfdpDo3ifOhYecTGAzyVyR7DGadGLTp9Rg=;
 b=IkRMtWW3tafpC+OYylMBOA54VUYCzHt8Two70H4zkbTXUuVCXGElYbsKqVsLnZlSCV
 fA5KgbABfA6bbYkbOz0az2PKXKnn3mD0WpK7kE9AqinqjeWHIYt9kbMScrDk3waezSq7
 MfWngMgo2Jm4wMI2Q3d1etpH10YYAdnzbcMHBISZUCwTBdDwvizvpZpVmZ0vxQeP4P36
 SY+CODaGxHsLkQYJqBxVXoj3kz18TmVTagCVqfFot2cQmXRGgCkG7zlt9YGsHv3SXBGh
 Wb4uDhTV7j2JgbPdHzl46c2GfM0NfHogHFVqhzqF/2ZqZzGKL2QOvH6DD/evSQlt1WIj
 fGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880805; x=1792485605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=iEX+WzxiZFfdpDo3ifOhYecTGAzyVyR7DGadGLTp9Rg=;
 b=1e1LVIiA4OuUG3AkbzYIMoY14EaRKmpXlH7uBJUEEcDKWrjxrKzEIPeKl0Pzhz9ZAc
 jWNC7WJu2d3wqb6TPDADRW4tyjJt6z+iAE8FHAckb00781sW9ekrNj51ZKfANGc8pxco
 NauOJzRv5hoSR50A8CsGCYpD24jmP3tBv4KImt2DPTIx8w0GbubToASQpYXXZXK37igU
 aoMIYgtq5wuztUKS4tQCK2rZ/3mKcEWQW8NSU2+OngSnE8EzeoFl5uRQ1Cx9CQzuJO1t
 8QFfCgPDKoFOP+GCbjkLSgg+IdNelYnXcxm8cGFq9LyjdWO3Vn7cICVbKgqfLevqDwGt
 8TFw==
X-Gm-Message-State: AFq9FYKqTeX01ExJqMV4i8C5DPbxnMqmozDzmJpJ2INIyXfSL3wAvJY/
 gNIZQUGFD3GZZbrxNScsBnzg0SBzNRq05BXQ+Hav99X2itR0apWW6hAH0/2elDsAvFTnxbxa7I3
 W+6CKhfI=
X-Gm-Gg: AYBFou1BNKL9jZ3kOXflTIi2CAChGMMW4dsPqilH/qaicQQ/BawM1zzmt/WDsHAlgKq
 g9p286yWfOOKHBPvG/ZaaIYZO2TJOwAMQ0N37t5bEXZhqNCOv01+ISivqsy0Gzg7ZW8q11/m/sb
 y8Oloj1MRHZ5RraPrhk33z1t7ov/6hDrG+QNjnUQyarZ58s6Gce81mb8ZyAK4m8RbWYZrUyDixY
 RGsIEY5fTynK6LNQBbqNJheG0aIOSizoGzc60d/8Cqlsm+hwhSl6qI+QRLYuhSQPST8VF9DZ0+x
 oalUKWYmmOVTwrSpXWGxPas8w3YrLGqNRlxPWiF8c3jGi+MmGO9p8syV8qwtCbO6DY1/n+tKyR/
 disbQTiIRGGwJW9/4wmoeqnWHO1yNCWl+g4wblFaaOCPfHcNx7sG1lV5quFt/QTkaD4a7ELcXXD
 w1vS3U1BSSkjTK9dtZ6Q5ezMtgMVmeYPqu2iO0tyfH9Anl0ZLY2pL2ic7gaDEYW9f72ySy/4+GL
 BsCK9xDLLF8VBNFAf+N/4whkEiOAAJfABMapwWtV9wz6kCPLY/AkHLEVCDe2RMru9urJo5XnaAv
 XLM=
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id
 5b1f17b1804b1-4a18e43a29fmr236742755e9.2.1791880805159; 
 Tue, 13 Oct 2026 01:40:05 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/86] target/arm: GICv5 cpuif: Implement ICH_PPI_HVIR<n>_EL2
Date: Tue, 13 Oct 2026 09:38:29 +0100
Message-ID: <20261013083933.1024405-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

The ICH_PPI_HVIR<n>_EL2 registers allow a hypervisor to hide a PPI
from the virtual interrupt domain.  When the bit is set, direct reads
and writes to ICV register fields for that PPI are RAZ/WI.

As we haven't yet implemented the ICV accesses, all we need to
implement here is the cpreg and its backing storage.  We will then be
able to test the DVI bits in the functions that add ICV read and
write handling. We give the register a writefn because eventually
it will need to trigger a recalculation of the virtual PPI HPPI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 276466d2b84..81fb68facb9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -600,6 +600,7 @@ typedef struct CPUArchState {
         uint64_t ich_apr_el2;
         uint64_t ich_vctlr_el2;
         uint64_t ich_vmcr_el2;
+        uint64_t ich_ppi_hvi[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_pend[GICV5_NUM_PPIS / 64];
         uint64_t ich_ppi_enable[GICV5_NUM_PPIS / 64];
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 8cb790204f1..93141c751e4 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -493,6 +493,12 @@ static void gic_ich_ppi_dvi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void gic_ich_ppi_hvi_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 static void gic_ich_vctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                 uint64_t value)
 {
@@ -1002,6 +1008,22 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .writefn = gic_icc_pcr_el1_write,
         .resetfn = gic_icc_pcr_el1_reset,
     },
+    {   .name = "ICH_PPI_HVIR0_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 7, .opc2 = 0,
+        .access = PL2_RW, .type =  ARM_CP_IO | ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0xc00,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_ppi_hvi[0]),
+        .writefn = gic_ich_ppi_hvi_write,
+    },
+    {   .name = "ICH_PPI_HVIR1_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 7, .opc2 = 1,
+        .access = PL2_RW, .type =  ARM_CP_IO | ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0xc00,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_ppi_hvi[1]),
+        .writefn = gic_ich_ppi_hvi_write,
+    },
     {   .name = "ICH_APR_EL2", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 8, .opc2 = 4,
         .access = PL2_RW, .type = ARM_CP_NO_RAW,
-- 
2.43.0


