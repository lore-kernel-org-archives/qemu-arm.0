Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1198561lfh;
        Fri, 27 May 2022 11:07:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAn3UHDebdBT0BO9WM469v4xAUrCY27nKjd0+gF48hMY1tE4ayMNzCJ+Ctg2nhIqiA0Mpf
X-Received: by 2002:ac8:5a10:0:b0:2f3:dd26:d138 with SMTP id n16-20020ac85a10000000b002f3dd26d138mr34419906qta.405.1653674871561;
        Fri, 27 May 2022 11:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653674871; cv=none;
        d=google.com; s=arc-20160816;
        b=ioftOZYmqS+E2bK6sKbBefnQ/PgSre6MILozJXhkK84/OOiXfyg9BYQ4EgWRkyNrlg
         TVW017ilitDjFFS/3qkmIz+j5AVIO6lVO4VAVo0uj+urh8FIicD/pGSnYRCvZn6e+BCI
         4mPIGDY+LfEbrySHcZvh6MbdxeCm7pN0obYcFI0OjuMo7Sgw3i8NrDH5+Vyx7z0c0oAP
         ZLP1lI7wMzLkWEavWaDX2I32P+9nGYdgMOkM+eJvKOIscR0E3OwaklpKf4zTWQfyTVWa
         +/BE+C6AwPcZVnQPpzTmsdeHyOwpvO1xobONmKMu7hkZsl4A/VD2xtD1VE/1+1Nsrx7a
         /tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gvNRQC8KhINJ3YSuAmDpp0PT7w00RoWpHA0CJJcyrMM=;
        b=xSaowUPJxii+FyWYZFfKnwzxtNZIj9CeyIfVcrrjp1MX2UahC65STjIu4lErcgZ6u7
         6Gg71YsSiReb5ydqhIpG6xhST0MUPZLUs23rco2vBsGqJTfpVOlmsLxmEZkJI2unFp8R
         Gk9kUi0Y3AyyDvwYcjScmSsD9yDBNO0Jm4ndjn6It/10/YLbGWqiNh6ZbN5scdE9Y0+f
         Zny8ytwSgoXq/Qty2f2am/bljW/kajrvO3sNXRULZW/6u16gclG4dreThrY17ted3pzP
         NTi2WI+G43L4u4BzpeCATNIGh4wVASUVeI0xlJZZtmNM8wm+COzt2O+OT8ow4T0PypNw
         SpaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKgYIXTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05622a120d00b002f937504a4csi3105319qtx.130.2022.05.27.11.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKgYIXTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueNK-0004qg-Tm
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM5-00033G-LQ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM2-0001dm-Ju
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q18so4761727pln.12
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvNRQC8KhINJ3YSuAmDpp0PT7w00RoWpHA0CJJcyrMM=;
 b=kKgYIXTDt8ctekqLOIrD+/dyaNvgL+9EKD0JMTaAWWpN2aMLN7Fyh0oz0rO2pYrMel
 r3PDt6kIBdhozzrGieDAZOuVmUuwGWQMUwGmTqVUawfsSxHx2hO3ck28Rnk3wwT0seZr
 gKTfJanW4s5nX1j7WeGS4uoYB3TNOTkjuHzZetytH4r/hovcsv7dXMX97ye7cZ4O1xIk
 9w/hUljZ2acnqz1s+jmyFqUUa9rZTJrY3ORn+/VTktqf2gFI4pZpKN6kwuvTAsoYhix8
 GM3QI+RUf5Jim+FioIz6QB5ey6d1LUmXo+e8DKOscE628/epSgKUo+EYLep3dhS0PxjF
 +QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvNRQC8KhINJ3YSuAmDpp0PT7w00RoWpHA0CJJcyrMM=;
 b=MYxCF6mxoSVfEhTxJvl41jARiND7IxcAAKqztqy0VeHbEgyQd6lw5SsUVH/MFDwjrk
 MOJnYjBN8ISqnDg5sbndUdT/SxpS4ShWW3nGqu4Qtqdbmmy1Sz44/wCEOO1bxfK1/kNu
 d4WxaqgolcrnUaC/1e/14zGTN4962bZyysgTXJ6aJxWLswJ1lEpmF5kHVCpO8WjfuW35
 M7fCKxZW7fcZSThP/7dDNBFy53sMmDzMyDFqaAn7kpdiwO8JsKSbRe1iAxM4+b9dZ05R
 ZWmGhpc4bpcFHjneU+xXxps4JwWnQd8vxvwcXQ+cMVSnd6YswHZafXU6TmII64sWAzai
 NHPw==
X-Gm-Message-State: AOAM533RIxV6LrRVRHplpGOOc3rGpx/f7pZ43RKkTWyEZAj2MZ0jl4DK
 aFdYBT+sOeBCGmNE2EiP5KnRPA==
X-Received: by 2002:a17:90a:6b41:b0:1e0:e082:14c7 with SMTP id
 x1-20020a17090a6b4100b001e0e08214c7mr9422100pjl.92.1653674789119; 
 Fri, 27 May 2022 11:06:29 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/15] target/arm: Use uint32_t instead of bitmap for sve
 vq's
Date: Fri, 27 May 2022 11:06:13 -0700
Message-Id: <20220527180623.185261-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /VHPnGME3T6t

The bitmap need only hold 15 bits; bitmap is over-complicated.
We can simplify operations quite a bit with plain logical ops.

The introduction of SVE_VQ_POW2_MAP eliminates the need for
looping in order to search for powers of two.  Simply perform
the logical ops and use count leading or trailing zeros as
required to find the result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   6 +--
 target/arm/internals.h |   5 ++
 target/arm/kvm_arm.h   |   7 ++-
 target/arm/cpu64.c     | 117 ++++++++++++++++++++---------------------
 target/arm/helper.c    |   9 +---
 target/arm/kvm64.c     |  36 +++----------
 6 files changed, 75 insertions(+), 105 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 69e71fdcec..a86e8d6548 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1041,9 +1041,9 @@ struct ArchCPU {
      * Bits set in sve_vq_supported represent valid vector lengths for
      * the CPU type.
      */
-    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
-    DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
-    DECLARE_BITMAP(sve_vq_supported, ARM_MAX_VQ);
+    uint32_t sve_vq_map;
+    uint32_t sve_vq_init;
+    uint32_t sve_vq_supported;
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 199d1bf630..b587901be1 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1299,4 +1299,9 @@ void aa32_max_features(ARMCPU *cpu);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env, int cur_el);
 
+/* Powers of 2 for sve_vq_map et al. */
+#define SVE_VQ_POW2_MAP                                 \
+    ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
+     (1 << (4 - 1)) | (1 << (8 - 1)) | (1 << (16 - 1)))
+
 #endif
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b7f78b5215..99017b635c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -239,13 +239,12 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
 /**
  * kvm_arm_sve_get_vls:
  * @cs: CPUState
- * @map: bitmap to fill in
  *
  * Get all the SVE vector lengths supported by the KVM host, setting
  * the bits corresponding to their length in quadwords minus one
- * (vq - 1) in @map up to ARM_MAX_VQ.
+ * (vq - 1) up to ARM_MAX_VQ.  Return the resulting map.
  */
-void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map);
+uint32_t kvm_arm_sve_get_vls(CPUState *cs);
 
 /**
  * kvm_arm_set_cpu_features_from_host:
@@ -439,7 +438,7 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
     g_assert_not_reached();
 }
 
-static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3ff9219ca3..51c5d8d4bc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -355,8 +355,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * any of the above.  Finally, if SVE is not disabled, then at least one
      * vector length must be enabled.
      */
-    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
-    uint32_t vq, max_vq = 0;
+    uint32_t vq_map = cpu->sve_vq_map;
+    uint32_t vq_init = cpu->sve_vq_init;
+    uint32_t vq_supported;
+    uint32_t vq_mask = 0;
+    uint32_t tmp, vq, max_vq = 0;
 
     /*
      * CPU models specify a set of supported vector lengths which are
@@ -364,10 +367,16 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * in the supported bitmap results in an error.  When KVM is enabled we
      * fetch the supported bitmap from the host.
      */
-    if (kvm_enabled() && kvm_arm_sve_supported()) {
-        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
-    } else if (kvm_enabled()) {
-        assert(!cpu_isar_feature(aa64_sve, cpu));
+    if (kvm_enabled()) {
+        if (kvm_arm_sve_supported()) {
+            cpu->sve_vq_supported = kvm_arm_sve_get_vls(CPU(cpu));
+            vq_supported = cpu->sve_vq_supported;
+        } else {
+            assert(!cpu_isar_feature(aa64_sve, cpu));
+            vq_supported = 0;
+        }
+    } else {
+        vq_supported = cpu->sve_vq_supported;
     }
 
     /*
@@ -375,8 +384,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
      * Check first for any sve<N> enabled.
      */
-    if (!bitmap_empty(cpu->sve_vq_map, ARM_MAX_VQ)) {
-        max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+    if (vq_map != 0) {
+        max_vq = 32 - clz32(vq_map);
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
 
         if (cpu->sve_max_vq && max_vq > cpu->sve_max_vq) {
             error_setg(errp, "cannot enable sve%d", max_vq * 128);
@@ -392,15 +402,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              * For KVM we have to automatically enable all supported unitialized
              * lengths, even when the smaller lengths are not all powers-of-two.
              */
-            bitmap_andnot(tmp, cpu->sve_vq_supported, cpu->sve_vq_init, max_vq);
-            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+            vq_map |= vq_supported & ~vq_init & vq_mask;
         } else {
             /* Propagate enabled bits down through required powers-of-two. */
-            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
-                    set_bit(vq - 1, cpu->sve_vq_map);
-                }
-            }
+            vq_map |= SVE_VQ_POW2_MAP & ~vq_init & vq_mask;
         }
     } else if (cpu->sve_max_vq == 0) {
         /*
@@ -413,25 +418,18 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
         if (kvm_enabled()) {
             /* Disabling a supported length disables all larger lengths. */
-            for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-                if (test_bit(vq - 1, cpu->sve_vq_init) &&
-                    test_bit(vq - 1, cpu->sve_vq_supported)) {
-                    break;
-                }
-            }
+            tmp = vq_init & vq_supported;
         } else {
             /* Disabling a power-of-two disables all larger lengths. */
-            for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
-                if (test_bit(vq - 1, cpu->sve_vq_init)) {
-                    break;
-                }
-            }
+            tmp = vq_init & SVE_VQ_POW2_MAP;
         }
+        vq = ctz32(tmp) + 1;
 
         max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-        bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
-                      cpu->sve_vq_init, max_vq);
-        if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
+        vq_map = vq_supported & ~vq_init & vq_mask;
+
+        if (max_vq == 0 || vq_map == 0) {
             error_setg(errp, "cannot disable sve%d", vq * 128);
             error_append_hint(errp, "Disabling sve%d results in all "
                               "vector lengths being disabled.\n",
@@ -441,7 +439,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             return;
         }
 
-        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
+        max_vq = 32 - clz32(vq_map);
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
     }
 
     /*
@@ -451,9 +450,9 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      */
     if (cpu->sve_max_vq != 0) {
         max_vq = cpu->sve_max_vq;
+        vq_mask = MAKE_64BIT_MASK(0, max_vq);
 
-        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
-            test_bit(max_vq - 1, cpu->sve_vq_init)) {
+        if (vq_init & ~vq_map & (1 << (max_vq - 1))) {
             error_setg(errp, "cannot disable sve%d", max_vq * 128);
             error_append_hint(errp, "The maximum vector length must be "
                               "enabled, sve-max-vq=%d (%d bits)\n",
@@ -462,8 +461,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
         }
 
         /* Set all bits not explicitly set within sve-max-vq. */
-        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
-        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+        vq_map |= ~vq_init & vq_mask;
     }
 
     /*
@@ -472,13 +470,14 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * are clear, just in case anybody looks.
      */
     assert(max_vq != 0);
-    bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
+    assert(vq_mask != 0);
+    vq_map &= vq_mask;
 
     /* Ensure the set of lengths matches what is supported. */
-    bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
-    if (!bitmap_empty(tmp, max_vq)) {
-        vq = find_last_bit(tmp, max_vq) + 1;
-        if (test_bit(vq - 1, cpu->sve_vq_map)) {
+    tmp = vq_map ^ (vq_supported & vq_mask);
+    if (tmp) {
+        vq = 32 - clz32(tmp);
+        if (vq_map & (1 << (vq - 1))) {
             if (cpu->sve_max_vq) {
                 error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);
                 error_append_hint(errp, "This CPU does not support "
@@ -502,15 +501,15 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                 return;
             } else {
                 /* Ensure all required powers-of-two are enabled. */
-                for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                    if (!test_bit(vq - 1, cpu->sve_vq_map)) {
-                        error_setg(errp, "cannot disable sve%d", vq * 128);
-                        error_append_hint(errp, "sve%d is required as it "
-                                          "is a power-of-two length smaller "
-                                          "than the maximum, sve%d\n",
-                                          vq * 128, max_vq * 128);
-                        return;
-                    }
+                tmp = SVE_VQ_POW2_MAP & vq_mask & ~vq_map;
+                if (tmp) {
+                    vq = 32 - clz32(tmp);
+                    error_setg(errp, "cannot disable sve%d", vq * 128);
+                    error_append_hint(errp, "sve%d is required as it "
+                                      "is a power-of-two length smaller "
+                                      "than the maximum, sve%d\n",
+                                      vq * 128, max_vq * 128);
+                    return;
                 }
             }
         }
@@ -530,6 +529,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
+    cpu->sve_vq_map = vq_map;
 }
 
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
@@ -590,7 +590,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = test_bit(vq - 1, cpu->sve_vq_map);
+        value = extract32(cpu->sve_vq_map, vq - 1, 1);
     }
     visit_type_bool(v, name, &value, errp);
 }
@@ -612,12 +612,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value) {
-        set_bit(vq - 1, cpu->sve_vq_map);
-    } else {
-        clear_bit(vq - 1, cpu->sve_vq_map);
-    }
-    set_bit(vq - 1, cpu->sve_vq_init);
+    cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
+    cpu->sve_vq_init |= 1 << (vq - 1);
 }
 
 static bool cpu_arm_get_sve(Object *obj, Error **errp)
@@ -978,7 +974,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-    bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
+    cpu->sve_vq_supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
@@ -1025,12 +1021,11 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vprebits = 5;
     cpu->gic_pribits = 5;
 
-    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    /* The A64FX supports only 128, 256 and 512 bit vector lengths */
     aarch64_add_sve_properties(obj);
-    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
-    set_bit(0, cpu->sve_vq_supported); /* 128bit */
-    set_bit(1, cpu->sve_vq_supported); /* 256bit */
-    set_bit(3, cpu->sve_vq_supported); /* 512bit */
+    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
+                          | (1 << 1)  /* 256bit */
+                          | (1 << 3); /* 512bit */
 
     cpu->isar.reset_pmcr_el0 = 0x46014040;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66036c85d7..93784cb073 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6223,7 +6223,6 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
-    uint32_t end_len;
 
     if (el <= 1 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
@@ -6236,12 +6235,8 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    end_len = len;
-    if (!test_bit(len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, len);
-        assert(end_len < len);
-    }
-    return end_len;
+    len = 31 - clz32(cpu->sve_vq_map & MAKE_64BIT_MASK(0, len + 1));
+    return len;
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 363032da90..b3f635fc95 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -760,15 +760,13 @@ bool kvm_arm_steal_time_supported(void)
 
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
-void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 {
     /* Only call this function if kvm_arm_sve_supported() returns true. */
     static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
     static bool probed;
     uint32_t vq = 0;
-    int i, j;
-
-    bitmap_zero(map, ARM_MAX_VQ);
+    int i;
 
     /*
      * KVM ensures all host CPUs support the same set of vector lengths.
@@ -809,46 +807,24 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
         if (vq > ARM_MAX_VQ) {
             warn_report("KVM supports vector lengths larger than "
                         "QEMU can enable");
+            vls[0] &= MAKE_64BIT_MASK(0, ARM_MAX_VQ);
         }
     }
 
-    for (i = 0; i < KVM_ARM64_SVE_VLS_WORDS; ++i) {
-        if (!vls[i]) {
-            continue;
-        }
-        for (j = 1; j <= 64; ++j) {
-            vq = j + i * 64;
-            if (vq > ARM_MAX_VQ) {
-                return;
-            }
-            if (vls[i] & (1UL << (j - 1))) {
-                set_bit(vq - 1, map);
-            }
-        }
-    }
+    return vls[0];
 }
 
 static int kvm_arm_sve_set_vls(CPUState *cs)
 {
-    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = {0};
+    ARMCPU *cpu = ARM_CPU(cs);
+    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq_map };
     struct kvm_one_reg reg = {
         .id = KVM_REG_ARM64_SVE_VLS,
         .addr = (uint64_t)&vls[0],
     };
-    ARMCPU *cpu = ARM_CPU(cs);
-    uint32_t vq;
-    int i, j;
 
     assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
 
-    for (vq = 1; vq <= cpu->sve_max_vq; ++vq) {
-        if (test_bit(vq - 1, cpu->sve_vq_map)) {
-            i = (vq - 1) / 64;
-            j = (vq - 1) % 64;
-            vls[i] |= 1UL << j;
-        }
-    }
-
     return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
 }
 
-- 
2.34.1

