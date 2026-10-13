Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC69CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:47:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6C-0003j9-Bw; Tue, 13 Oct 2026 04:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3w-0008Qc-Ks
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3t-00080n-ST
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so16619545e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880840; x=1792485640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=46TFe67yKvbFfVh4QDME6NqlGkn+SwL4WUrd3hyiWf0=;
 b=T1cX1RqBhFwyU9CbIkfY4Yc6EYKZfoA5rsLDWZzq2i4akah+hLPs95yhtDlb25OUm+
 FptEnZKtPrnCYMXdepZGCUXWae6Wvdsh7mM+dl3pDFyOkeH6AfUsUj7lqLUPyKCk/c0k
 ixKIfW7PUZsCiNrWRLlXgfsEaf3yTnWTj0eT2i6zlU6dk/eHvZiAldsWpDSgYytWG3rx
 ySJD8Q4VIgaPjkNYuNFSEcPL6jR6HBftV4K1arO/VM7C0awuZfKRKqy4r8Ap5EFccMNQ
 V1IPbpmjlEqSYV2XVTUgZfljEWaTzrp+8OHAIY8+ZHW0oKGxYzdoumn2fXicDzwxZm2Q
 8Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880840; x=1792485640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=46TFe67yKvbFfVh4QDME6NqlGkn+SwL4WUrd3hyiWf0=;
 b=jk0srmJ9Plfw4FzM3dtWlxBKh5JQQ09O7Ukg2qSxaQPy24WIYIf7D5zj/nFqv2ebzV
 RzmxBprB2s9yEokMXBOTP5Fdk7pJ6/k1s5bOW4vRhdkL/GwFWTxg/bTeUEw7xVGua54Z
 0dkoG122gEvS7Sg+ftn55JQL3t2hVtW7TVxt6l+O5GxabkjMMLqT2+w8SqIUOf696s6b
 kaJHcrGVObYPNZ/WXjE3vKQ8/kLVCmdixP61KokIXIT7N+BQG/oVQxh9tQZKNtnLOkWq
 p8Vz2lghx2C0UmZ6h89DWBZ0pmeWMQF5hwccBfcUFYCDMcxv/MqaLF1SKr+vWnQp1yhU
 dc5A==
X-Gm-Message-State: AFq9FYLDX9L+yI9Wi8gZlZ242dOg9E0JG/ytaoRtIW+mCbnTSe8jIRvL
 QZIjM2O5sAy2iRvhYMNJLPdTJdMG7ASgHUpqTHW73kCEchXf/edQycIxb22OwpE7slzZHJ88mfB
 vqUM7z4Y=
X-Gm-Gg: AYBFou1RZ7+Io82Qn645ywBvcU0I7egVs3h7RpYj7wzy8uk7O5YQy9E4gbh4fflQKgS
 uFi3n2/qQpfaiXE0Z1tYXRO4ig+l/TtIho5064OcJJiqbUiQNV/pnVFM47gxSesz2xy5M09oeNT
 9H04VtbW7+U5jdyhE/ihNnVYTr0CeP/moEDjBBCq6hZAFd6BqQHK/k3x8GVQ9RBQWsbWA/Ck+TY
 zxd5o5ei7Kzn+rEYdOFWo2i9eJ2ibZtJu5dP0iAztF5bw/OCgT0Zh7fYe/a2uYWGXdwVoeU+FYO
 FJEVXRNBW9xg/PymbqCyWYNr6fqhsy4MEygKcGgJC1aOo41xvYyWyuR7f1Xa9Vcj15rRqiB1WG5
 64ZoYVrrZeqYEc397usDI093GdW3BLSPFhIE2eOC4y1dp+T3+irgdGNJogG9h3NZhucTro2hjzE
 C1+5AVDWCbOx6I1FNL3Nd0FYnGvkMo30T2LWPxVcwrh0+Z83Y894jreMMpaKoHBSfv1/wnh+N90
 HfpxuDn3Mkgut70lKyIypJRciyhbzBRUJcZ3DGhI1qD8UouGaviCyce0qybfPOGRqxXEeV/UTYc
 qZacsbLj6Q36RA==
X-Received: by 2002:a05:600c:64c7:b0:4a1:8399:b74a with SMTP id
 5b1f17b1804b1-4a18e4e5c7cmr216368425e9.31.1791880840264; 
 Tue, 13 Oct 2026 01:40:40 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 47/86] target/arm: GICv5 cpuif: Update on HCR_EL2.{NV,
 NV1} and SCR_EL3.NS changes
Date: Tue, 13 Oct 2026 09:38:54 +0100
Message-ID: <20261013083933.1024405-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

When HCR_EL2.{NV,NV1} or SCR_EL3.NS change, this can affect how
direct injection of timer PPIs is handled, which in turn can
potentially affect what the highest priority virtual pending PPI is.
Since the virtual HPPI can be read from EL2 or EL3, we need to
arrange that changes to these bits trigger a GICv5 recalculation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gicv5-stubs.c     |  8 ++++++++
 target/arm/helper.c          | 23 ++++++++++++++++++-----
 target/arm/internals.h       |  9 +++++++++
 target/arm/tcg/gicv5-cpuif.c | 18 ++++++++++++++++++
 4 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/target/arm/gicv5-stubs.c b/target/arm/gicv5-stubs.c
index 845626d7c6b..b8c926744cb 100644
--- a/target/arm/gicv5-stubs.c
+++ b/target/arm/gicv5-stubs.c
@@ -15,3 +15,11 @@ void define_gicv5_cpuif_regs(ARMCPU *cpu)
 void gicv5_update_ppi_state(CPUARMState *env, int ppi, bool level)
 {
 }
+
+void gicv5_update_on_hcr_nv_change(CPUARMState *env)
+{
+}
+
+void gicv5_update_on_scr_ns_change(CPUARMState *env)
+{
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff0b766b73d..959f1d83a70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1012,6 +1012,12 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
                                            ARMMMUIdxBit_E2 |
                                            ARMMMUIdxBit_E2_GCS));
     }
+    /* The GICv5 cpuif needs to know if SCR_EL3.NS changes */
+#ifndef CONFIG_USER_ONLY
+    if (changed & SCR_NS) {
+        gicv5_update_on_scr_ns_change(env);
+    }
+#endif
 }
 
 static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -3881,7 +3887,7 @@ static const ARMCPRegInfo v8_aa32_el1_reginfo[] = {
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
-    bool hcr_change_timer;
+    uint64_t changed;
 
     if (arm_feature(env, ARM_FEATURE_V8)) {
         valid_mask |= MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
@@ -3960,6 +3966,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         }
     }
 
+    changed = env->cp15.hcr_el2 ^ value;
+
     /*
      * These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
@@ -3969,16 +3977,21 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * HCR_FWB changes the interpretation of stage2 descriptor bits
      * HCR_NV and HCR_NV1 affect interpretation of descriptor bits
      */
-    if ((env->cp15.hcr_el2 ^ value) &
+    if (changed &
         (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB | HCR_NV | HCR_NV1)) {
         tlb_flush(CPU(cpu));
     }
-    hcr_change_timer = (env->cp15.hcr_el2 ^ value) &
-                       (HCR_E2H | HCR_TGE);
 
     /* update */
     env->cp15.hcr_el2 = value;
 
+    /* If HCR_EL2.{NV,NV1} change we must inform the GICv5 cpuif */
+#ifndef CONFIG_USER_ONLY
+    if (changed & (HCR_NV | HCR_NV1)) {
+        gicv5_update_on_hcr_nv_change(env);
+    }
+#endif
+
     /*
      * Updates to VI and VF require us to update the status of
      * virtual interrupts, which are the logical OR of these bits
@@ -3998,7 +4011,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         arm_cpu_update_vinmi(cpu);
         arm_cpu_update_vfnmi(cpu);
     }
-    if (hcr_change_timer) {
+    if (changed & (HCR_E2H | HCR_TGE)) {
 #ifndef CONFIG_USER_ONLY
         gt_recalc_timer(cpu, GTIMER_PHYS);
 #endif
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9d817961c67..f291aee0bd8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1909,6 +1909,15 @@ void define_gicv5_cpuif_regs(ARMCPU *cpu);
  */
 void gicv5_update_ppi_state(CPUARMState *env, int ppi, bool level);
 
+/*
+ * Tell the GICv5 when HCR_EL2.{NV,NV1} change. Does nothing if GICv5 not
+ * present.
+ */
+void gicv5_update_on_hcr_nv_change(CPUARMState *env);
+
+/* Tell the GICv5 when SCR_EL3.NS changes. Does nothing if GICv5 not present */
+void gicv5_update_on_scr_ns_change(CPUARMState *env);
+
 /* Effective value of MDCR_EL2 */
 static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
 {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 1f032e39bf6..e7e3dc214d6 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -630,6 +630,24 @@ void gicv5_update_ppi_state(CPUARMState *env, int ppi, bool level)
     }
 }
 
+void gicv5_update_on_hcr_nv_change(CPUARMState *env)
+{
+    /* HCR_EL2.{NV,NV1} changed, which affects DVI timer PPI remapping */
+    if (!cpu_isar_feature(aa64_gcie, env_archcpu(env))) {
+        return;
+    }
+    gic_recalc_virt_ppi_hppi(env);
+}
+
+void gicv5_update_on_scr_ns_change(CPUARMState *env)
+{
+    /* SCR_EL3.NS changed, which affects DVI timer PPI remapping */
+    if (!cpu_isar_feature(aa64_gcie, env_archcpu(env))) {
+        return;
+    }
+    gic_recalc_virt_ppi_hppi(env);
+}
+
 static void gic_cddis_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-- 
2.43.0


