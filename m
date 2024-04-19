Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2603862ejd;
        Fri, 19 Apr 2024 11:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTrG/gVCW2mfp8wI9B3WanNsJvFBKmdRcEJj1ODMzF/i3MT01FiGnpnw9SURYxxk6+LY+AK5+JW/D1pifvRrTB/vndcSar
X-Google-Smtp-Source: AGHT+IGFmh/kThdY18NmvKNmehhmyrP1cFBWOs64uCbyJcV/lqOkZYZkkLv4LvyEizWhTYlcYCEH
X-Received: by 2002:a05:622a:c:b0:435:bda5:9c4 with SMTP id x12-20020a05622a000c00b00435bda509c4mr3377039qtw.56.1713552415990;
        Fri, 19 Apr 2024 11:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713552415; cv=none;
        d=google.com; s=arc-20160816;
        b=c4vL/zf7AIZjox03YSHFN5XOeJZvzqb607xm8abAG14DXonBW75g6jYnJf2Qo/tC12
         Of5EiaJ75dF6sX5dFmzT1SeBPzFxPtL0SWVX0QWrozyFIKnLdCQwQi/x12wpvzHcDXSF
         NBkTT0brZax1jND20ydfIQqQUnOpVr0u2RsBp6J2gRhmzjA/R/GwRMNMZuyFQXNQ+dlz
         EkGL1oKw1Qn/jtcQFfODVTumtsjfuXjzZNNMzdx+jBKilp0A1nIiXy4unH/UiIcOIOhr
         BY3IY/VLxqqSRnwqg1vyLs4YK65eCy4pyMmjg7ddeYcsnQiTkHpi3jsvs1YpJ2msrany
         vsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nQaBx9r5N0v1ewmC8t+fla4PMGkNo0kCNDVTJv0sKQ0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=kuqq6RXenJQ3ICB+AC687mBlqlLKrxP5XS3lvJty8WiucdhodQicYVOOCuVTOHZQlP
         X5YNu6vdYrfbjtRtKgfKzn+WbglPtOLWCGf7LP7lbY2TCxC7q3zUJTzaKw/gvfWVPCox
         mQUP6yQEUwHsSlLRqaNHO9BOQ+0Z+XdT0jV4B7FW3BaR8ZPd2CEm495m2VVfRpHUODkw
         dwKY4Ewh12dmPuAiyLrhZNFtbvPN6l+IpAgnp3iah2vfjc230zqD1yPyYzTsQqhTE5xb
         Z/K8kXtZjjimo28p8YfE0f478Gc6EVQW3w/+cHvvsoLLA0d4cXV66MJEza59mgTohd9X
         Y7yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqcT31vi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac87f15000000b00437c7c0d074si2105141qtk.346.2024.04.19.11.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 11:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqcT31vi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxtFd-00087n-Fc; Fri, 19 Apr 2024 14:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxtFZ-00086X-O7
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 14:46:17 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxtFV-00012H-GK
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 14:46:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so1586123f8f.3
 for <qemu-arm@nongnu.org>; Fri, 19 Apr 2024 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713552372; x=1714157172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nQaBx9r5N0v1ewmC8t+fla4PMGkNo0kCNDVTJv0sKQ0=;
 b=GqcT31viqtYC+yK9thvU76igP6tEqLmk1edT1DvuRj81+SU/yRwHzMLtumkYBzGB6D
 Yhiyl/sCHiygN/uBm/hYisuxfTB9SBrZHMBgvPvNPfvFU5s9vZSNNJfHI1wX4YlUhTS8
 td1/svA6t8hs7HPjxXJnEBeVdo3fr/+4bn/Maxkw/IVSjyQTs2hedczvskKqkXhw7CXv
 6HW/S5bzRw01y2n5ZORi/NG3/wJhmqYxfPREZzEzfYRPoqoB1T3eS9TB5RAEwM31Go8Y
 E9Lnlne/0CbBWHwFbEFup1vZDY5yi3fy/NtUs/2ezrDfSIAsrn1vuT0p9FlomFLTErPs
 kdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713552372; x=1714157172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nQaBx9r5N0v1ewmC8t+fla4PMGkNo0kCNDVTJv0sKQ0=;
 b=fFN7tAxQ0sP+DucgWASEqu/aOc/3RJYPx0MgGp5RHU5sU/MB8csx37TO47IhLLiE7O
 wF74p9hgX83Vh0bNW4YHVo//GcArPFOVv+G12bB/BxR/+FZF4HqSCAAb6Hde5KvXY8ic
 nkna25MIZLL5R2L7EAXU8STFUt2RwRYoRGfSsXknBLE8P66FtpBlGBmgIYaqeUmzBTxA
 YCnBA8DmLQiXBTBSZJVvekJaJZ/DloqwEj4PVlVXC1EEyD4lcdq13NAGl5Qc9zbVGV02
 yz0ZDHEqEGDC4uEjGmOxtXIv93IvqxvKzTDdj6EmDU7iTITMOAgSS+TGfk43ApzejuWH
 VU2Q==
X-Gm-Message-State: AOJu0Yx56nDaKtxrqoFI6xg1dKl8YVqrH9wF8dwANSMIFsklnLrIRf8E
 2LTf+aZYVh7TyPl6Sc47gabqSHn7v5pyWX56KnlT6cfxV5Tq90Q531t/uFArSNOJC3BFRNYwqwz
 b
X-Received: by 2002:adf:ce08:0:b0:346:a7:4acb with SMTP id
 p8-20020adfce08000000b0034600a74acbmr1777083wrn.62.1713552371491; 
 Fri, 19 Apr 2024 11:46:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 cs18-20020a056000089200b003437799a373sm5108718wrb.83.2024.04.19.11.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 11:46:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Default to 1GHz cntfrq for 'max' and new CPUs
Date: Fri, 19 Apr 2024 19:46:08 +0100
Message-Id: <20240419184608.2675213-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419184608.2675213-1-peter.maydell@linaro.org>
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lufCHde9Isn0

In previous versions of the Arm architecture, the frequency of the
generic timers as reported in CNTFRQ_EL0 could be any IMPDEF value,
and for QEMU we picked 62.5MHz, giving a timer tick period of 16ns.
In Armv8.6, the architecture standardized this frequency to 1GHz.

Because there is no ID register feature field that indicates whether
a CPU is v8.6 or that it ought to have this counter frequency, we
implement this by changing our default CNTFRQ value for all CPUs,
with exceptions for backwards compatibility:

 * CPU types which we already implement will retain the old
   default value. None of these are v8.6 CPUs, so this is
   architecturally OK.
 * CPUs used in versioned machine types with a version of 9.0
   or earlier will retain the old default value.

The upshot is that the only CPU type that changes is 'max'; but any
new type we add in future (whether v8.6 or not) will also get the new
1GHz default.

It remains the case that the machine model can override the default
value via the 'cntfrq' QOM property (regardless of the CPU type).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 11 +++++++++++
 target/arm/internals.h | 12 ++++++++++--
 hw/core/machine.c      |  4 +++-
 target/arm/cpu.c       | 28 ++++++++++++++++++++++------
 target/arm/cpu64.c     |  2 ++
 target/arm/tcg/cpu32.c |  4 ++++
 target/arm/tcg/cpu64.c | 18 ++++++++++++++++++
 7 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 20d8257c853..4eeeac3fe94 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -953,6 +953,9 @@ struct ArchCPU {
      */
     bool host_cpu_probe_failed;
 
+    /* QOM property to indicate we should use the back-compat CNTFRQ default */
+    bool backcompat_cntfrq;
+
     /* Specify the number of cores in this CPU cluster. Used for the L2CTLR
      * register.
      */
@@ -2367,6 +2370,14 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    /*
+     * ARM_FEATURE_BACKCOMPAT_CNTFRQ makes the CPU default cntfrq be 62.5MHz
+     * if the board doesn't set a value, instead of 1GHz. It is for backwards
+     * compatibility and used only with CPU definitions that were already
+     * in QEMU before we changed the default. It should not be set on any
+     * CPU types added in future.
+     */
+    ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 74d4b1b0990..11d9ff0fc08 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -61,9 +61,17 @@ static inline bool excp_is_internal(int excp)
 
 /*
  * Default frequency for the generic timer, in Hz.
- * This is 62.5MHz, which gives a 16 ns tick period.
+ * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
+ * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
+ * which gives a 16ns tick period.
+ *
+ * We will use the back-compat value:
+ *  - for QEMU CPU types added before we standardized on 1GHz
+ *  - for versioned machine types with a version of 9.0 or earlier
+ * In any case, the machine model may override via the cntfrq property.
  */
-#define GTIMER_DEFAULT_HZ 62500000
+#define GTIMER_DEFAULT_HZ 1000000000
+#define GTIMER_BACKCOMPAT_HZ 62500000
 
 /* Bit definitions for the v7M CONTROL register */
 FIELD(V7M_CONTROL, NPRIV, 0, 1)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index a92bec23147..bd40483d880 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -33,7 +33,9 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_9_0[] = {};
+GlobalProperty hw_compat_9_0[] = {
+    {"arm-cpu", "backcompat-cntfrq", "true" },
+};
 const size_t hw_compat_9_0_len = G_N_ELEMENTS(hw_compat_9_0);
 
 GlobalProperty hw_compat_8_2[] = {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b248b283423..2c8160d6b74 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1388,6 +1388,11 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_gt_cntfrq_property =
             DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz, 0);
 
+/* True to default to the backwards-compatibility old CNTFRQ rather than 1Ghz */
+static Property arm_cpu_backcompat_cntfrq_property =
+            DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU,
+                             backcompat_cntfrq, false);
+
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
@@ -1709,6 +1714,8 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
 
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_backcompat_cntfrq_property);
+
     if (kvm_enabled()) {
         kvm_arm_add_vcpu_properties(cpu);
     }
@@ -1834,13 +1841,22 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     if (!cpu->gt_cntfrq_hz) {
         /*
-         * 0 means "the board didn't set a value, use the default".
-         * The default value of the generic timer frequency (as seen in
-         * CNTFRQ_EL0) is 62.5MHz, which corresponds to a period of 16ns.
-         * This is what you get (a) for a CONFIG_USER_ONLY CPU (b) if the
-         * board doesn't set it.
+         * 0 means "the board didn't set a value, use the default". (We also
+         * get here for the CONFIG_USER_ONLY case.)
+         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
+         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
+         * which gives a 16ns tick period.
+         *
+         * We will use the back-compat value:
+         *  - for QEMU CPU types added before we standardized on 1GHz
+         *  - for versioned machine types with a version of 9.0 or earlier
          */
-        cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
+        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
+            cpu->backcompat_cntfrq) {
+            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
+        } else {
+            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
+        }
     }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 985b1efe160..c15d086049f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -599,6 +599,7 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -656,6 +657,7 @@ static void aarch64_a53_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index b5a60682fa6..bdd82d912a2 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -457,6 +457,7 @@ static void cortex_a7_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -505,6 +506,7 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -696,6 +698,7 @@ static void cortex_r52_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_PMSA);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_AUXCR);
     cpu->midr = 0x411fd133; /* r1p3 */
@@ -924,6 +927,7 @@ static void arm_max_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index c3369f40824..b0eb7fbb385 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -63,6 +63,7 @@ static void aarch64_a35_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -231,6 +232,7 @@ static void aarch64_a55_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -299,6 +301,7 @@ static void aarch64_a72_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -354,6 +357,7 @@ static void aarch64_a76_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -423,6 +427,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
@@ -592,6 +597,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -663,6 +669,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -885,6 +892,7 @@ static void aarch64_a710_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -982,6 +990,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
@@ -1077,6 +1086,15 @@ void aarch64_max_tcg_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
+    /*
+     * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
+     * to because we started with aarch64_a57_initfn(). A 'max' CPU might
+     * be a v8.6-or-later one, in which case the cntfrq must be 1GHz; and
+     * because it is our "may change" CPU type we are OK with it not being
+     * backwards-compatible with how it worked in old QEMU.
+     */
+    unset_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
+
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
      * one and try to apply errata workarounds or use impdef features we
-- 
2.34.1

