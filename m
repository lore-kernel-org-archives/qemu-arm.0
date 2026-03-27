Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12E10ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:18:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CA-0006zV-PD; Fri, 27 Mar 2026 07:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C9-0006vk-0L
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C6-0008Av-IX
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43b98652f05so862319f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610257; x=1775215057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxB5i187u8Un3u8aoHnxELkuuEe7fJmA9lYGeZQAHAk=;
 b=le5DwtnMqzYDUxIYbjEV2+OvgDRb/7CvlgritHF3Y9EcjOog66VmxmlfEsd9Qmnh8M
 bd4kat4PApTm+nPVOJZuFhpWoResn5+cXWBvu9hjNgZQxhCuEdZNWsLS0/K1BI54FeAb
 OHQGVL5f3+Pdmls4XwKKcyQVFTRzC+qZ4PvPSNnEnyjtBB944N3GODqEUTwxXpREuaHI
 VNVLLnQgRyQbHDbIV5Q6L4LtoLLeE8WC3vwrgQUNS7rs/cWm8tRZvSibv4wI5rLHMcpO
 ESJTYg0gT2Zx7fHQbADoquZcnnB6FwhA/AxbvLU9tR+JTshKSnzEuwpNuMiws2sKxxiC
 jKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610257; x=1775215057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kxB5i187u8Un3u8aoHnxELkuuEe7fJmA9lYGeZQAHAk=;
 b=pwRhLtxmdqvPddAOk9DtvycCn7xaXNrYYfBzYAMzC7dpE3ulqjE/CETzP/9zw+m8Qr
 64tQAZeNdRu38msRYKZjHIvEiYGzUhfYcElXhOOIKn8BHj1vJpAztcEt3u2ZQIJdwX6T
 XJjs+VX2fX7FVvg6HocosrYDXjZTp1eLhKz+HDbAqG+GqnSvFa97W+0lkozmTrZOLMLt
 DCeKArPOV6whHAf/IMzXORgurEgP7DhFjdckZ6a4CsGSGq64UjKkZQOXNbYNZU57tkeV
 ATljfdytLbKfuams6VMUXkV+SVWovIRpcmcIUL56FC+ea/4rYbNf72vDYmmaEAoyzwDf
 O8rg==
X-Gm-Message-State: AOJu0Yx5PIZOwImNfdVzZkULYFfe4Hne1L+ntyjihjXKRSz3BCo7hb9p
 zFWH1MGTgKOdcnh7iLKPFA89hVx2z1kVBuAXZvoP4ygv7NiOUkhMdVx9im8T4BGEAMG032+pUIq
 kAtLXmqQ=
X-Gm-Gg: ATEYQzwS1Oqrwh0eM6tgunD5WXr5sa2v8Yxt/vr/wj7SuV/SK6jiniXLBgDLLHn6oGB
 pWjwlrdCdfXsjNbDdzIkCzJrNQTcR8G/3LdDrSNHoIq6s4RmpPuHXVyWlnxobOjgL2u1mc7IuI2
 MANZ1FXLiIPp+to7zWLEoH/BOLgBqN2AJMzYjGWJ5E6NpHqdnEFPxotX1/nPSHBYnWnUjgi236F
 g3rNuUtPJFzdFx4DEAWiTUgm9K/8GiZ7UZUn7J2i0vrpP9aSz400M3G4vVGowDRTBsfDclOfIM0
 2N2AsubwX7GNU+tKuDOJYvhV+ljkhrnVS/doWis4J8xPrhdzgXz3wC3B3OMEu5x3pDVk8pt02Cw
 S1vhrHWdyYC59TwCSHVEZECxvfb/y/4fOiASDfeplUynxyALGr0DGR0IxU9EPTGknapIejbKj8C
 FNxSee66Y6oMVcrxBWB7j+FH9xeTe1Jv25J0JfZZF65Z9D1c9AwrNgU4b3gMjSQdV+N3+AHrAvq
 xDntjpk3JxwwIVfBHPx/dVUS1X6TOU=
X-Received: by 2002:a05:6000:4013:b0:43b:60f7:2283 with SMTP id
 ffacd0b85a97d-43b9e9f6ae1mr2931812f8f.22.1774610256701; 
 Fri, 27 Mar 2026 04:17:36 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 36/65] target/arm: GICv5 cpuif: Implement GICv5 PPI active
 set/clear registers
Date: Fri, 27 Mar 2026 11:16:31 +0000
Message-ID: <20260327111700.795099-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

In the GICv5 PPI state and control lives in the CPU interface; this
is different from the GICv3 where this was all in the redistributor.

Implement the access system registers for the PPI active state; this
is a pair of registers, one of which has "write 1 to clear" behaviour
and the other of which has "write 1 to set".  In both cases, reads
return the current state.

We start here by implementing the accessors for the underlying state;
we don't yet attempt to do anything (e.g.  recalculating the highest
priority pending PPI) when the state changes.  That will come in
subsequent commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/cpu.h             |  5 +++++
 target/arm/tcg/gicv5-cpuif.c | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a32c5f3ab1..dd4dc12feb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -257,6 +257,9 @@ typedef enum ARMFPStatusFlavour {
 } ARMFPStatusFlavour;
 #define FPST_COUNT  10
 
+/* Architecturally there are 128 PPIs in a GICv5 */
+#define GICV5_NUM_PPIS 128
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -600,6 +603,8 @@ typedef struct CPUArchState {
     struct {
         /* GICv5 CPU interface data */
         uint64_t icc_icsr_el1;
+        /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
+        uint64_t ppi_active[GICV5_NUM_PPIS / 64];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 497c09474b..6672cda37f 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -175,6 +175,20 @@ static void gic_cdhm_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv5_set_handling(gic, id, hm, domain, type, virtual);
 }
 
+static void gic_ppi_cactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    raw_write(env, ri, old & ~value);
+}
+
+static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    raw_write(env, ri, old | value);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -254,6 +268,30 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
          */
         .resetfn = arm_cp_reset_ignore,
     },
+    {   .name = "ICC_PPI_CACTIVER0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 0,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[0]),
+        .writefn = gic_ppi_cactive_write,
+    },
+    {   .name = "ICC_PPI_CACTIVER1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 1,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[1]),
+        .writefn = gic_ppi_cactive_write,
+    },
+    {   .name = "ICC_PPI_SACTIVER0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 2,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[0]),
+        .writefn = gic_ppi_sactive_write,
+    },
+    {   .name = "ICC_PPI_SACTIVER1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 3,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[1]),
+        .writefn = gic_ppi_sactive_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


