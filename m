Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2421598lfb;
        Tue, 7 Jun 2022 14:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPxnLHJu2WjOgLzgT5I9zSM6wwNJ7YmFRADwaddohiVIuwLVxBoVmtpJaSqqJfh28IL2Uu
X-Received: by 2002:a05:6214:f02:b0:46a:6b5d:1a93 with SMTP id gw2-20020a0562140f0200b0046a6b5d1a93mr15120682qvb.75.1654636639465;
        Tue, 07 Jun 2022 14:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636639; cv=none;
        d=google.com; s=arc-20160816;
        b=UGuBZgvoGkt1O9rxTfpED/c5M8Xt/n8+PEQb/0Wd0cs8Ls+c83qZBDn0uWGXEnQPr6
         bxG7PwmRM+XHOOmwFJO78fDEZ9VmZ20Op+Fi5LXCp2Bu6vx2zLtRlYORk4I4Yj8yKi6o
         0wwRh9Ke7IYUpuUNRLBuncSCCVRi9ffr8bGrXbwJ+AjqRAGNhRqxXg0XViZCx1Mc+vjQ
         ii4T5MgLvOvmGWUwNzQBBCrbT8OVAQ+6fQKqZIdLjoqgHAqvgklc1Oe7kG2WAY8XXUQh
         f9QT+DzArVeakW0L8eL6q+H9vPUpWh+w3LKEbp3YcEgGMaymnYp2jTVJqG3DU4XOLmkQ
         ACRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d0wqTPEvX0ysSyrnbJpTcraL6n1BQisJ52WpRbhHsec=;
        b=Yt3LQa5OB+NYaBkqGRXHtscZoUY9Aj1q0abD95tvZZ57BsjB1o/UO7u5TiUHd7tQvO
         YEcmQOzyWLJSvXfh69Wslh5iOdK50KyhjGq2UPZKx5KK3A8phhZPxFJeLI0B66tOLlU3
         QtKCdHzCliSM6wtHQ19nyAGW3xjvjFNgmXZvQvvwO26eGWO8lyP3A2VS8B/lZJJ6TaAZ
         nCmCdZm8QpoYOBHS9Uh0C9lx1Iovir29wpu614OS76/nJRrRnfRtFdzIe64iJVPTavwo
         orMla2EOFxwBhZqJuqqRa7YIMUyU/ZfibTaz9woIqYn/1K6QnQCwii2LA85PVxr065r7
         i+DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B40VK5bk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t68-20020a37aa47000000b006a68eb4d970si7657615qke.570.2022.06.07.14.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:17:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B40VK5bk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygZi-0007d5-S8
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfti-0000ce-Dr
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftY-0007Tz-00
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id e66so16931919pgc.8
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0wqTPEvX0ysSyrnbJpTcraL6n1BQisJ52WpRbhHsec=;
 b=B40VK5bkqr0Ay1CTdRdtLLnTlao52fVejvRaP+WLvEiDJynNUSijrt4pCd+MbuYUdz
 o/FgjUYKpcCe9iHhLEG/FsddP3AxgQ9RYrNv8rOrpbT1iZtyZWbiY//bw3AZd1GR44Dw
 6XeQbQnz8KYkL/WyQ2+WKsbyVxn6uiFEf8SgtP2vxj9VH1IEDfNKI4bh9zU6m2joPC9y
 AtW96K8/AA/8RPvzB7SPjxxiLuZKzGjAuE2vO5FOkdUy4tdrcb+wSHMOToP6pRcXh0HG
 ygqKkdD9A16Kszo6og7XNvB0QuntSBryvzYSAi31NePvi5PoIXCxXMmpVZV9i9ui2zIA
 SwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0wqTPEvX0ysSyrnbJpTcraL6n1BQisJ52WpRbhHsec=;
 b=KCStqHKXb57VFRzfN25XnH4zKP/clcF0SWY2+JcabtSgGJO9zEyjeu64FKMfMZ//fI
 3LISTy92CdV3P5XHFxXa3u945GtlbXWxrFNAHHiXqzFyiNG7LhceB+P9yJU/h/XHd8W+
 u/Rwo+X3FAkFiD8zWpYeWE0IYQqVbMSZBK2JaHbcXCWun/trucbMs9eFzBramAapLNUI
 3UW1xBUmjSBiH3+MHNOpuidoRAaawnyr/NWi97L+Tf/IFUhWkXD8Ya/CE9MjUVDENkkQ
 T+cXSiTGrlJvMFGpvoMmcURy+SIkMg6/7ZfMbsDgkP5Nr5KXhFblapw8hx8poPLmTxjz
 fnDA==
X-Gm-Message-State: AOAM530TLStU9lRGom0Ddbu589+k1s+/zNjXFaw2UHpNkGEWXSvegz4k
 Y7mcg47706v6xlDjmwz6GVZ8YWgWHBQLvg==
X-Received: by 2002:a05:6a00:164c:b0:50a:472a:6b0a with SMTP id
 m12-20020a056a00164c00b0050a472a6b0amr31234667pfc.77.1654634021655; 
 Tue, 07 Jun 2022 13:33:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 37/71] target/arm: Add cpu properties for SME
Date: Tue,  7 Jun 2022 13:32:32 -0700
Message-Id: <20220607203306.657998-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XrLgZugBRhiX

Mirror the properties for SVE.  The main difference is
that any arbitrary set of powers of 2 may be supported,
and not the stricter constraints that apply to SVE.

Include a property to control FEAT_SME_FA64, as failing
to restrict the runtime to the proper subset of insns
could be a major point for bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   2 +
 target/arm/internals.h |   1 +
 target/arm/cpu.c       |  14 +++--
 target/arm/cpu64.c     | 114 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 124 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8a89548cb9..d81d1bedf9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1046,9 +1046,11 @@ struct ArchCPU {
 #ifdef CONFIG_USER_ONLY
     /* Used to set the default vector length at process start. */
     uint32_t sve_default_vq;
+    uint32_t sme_default_vq;
 #endif
 
     ARMVQMap sve_vq;
+    ARMVQMap sme_vq;
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 756301b536..7e160d1349 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1310,6 +1310,7 @@ int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b5276fa944..75295a14a3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1122,11 +1122,13 @@ static void arm_cpu_initfn(Object *obj)
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
     /*
-     * The linux kernel defaults to 512-bit vectors, when sve is supported.
-     * See documentation for /proc/sys/abi/sve_default_vector_length, and
-     * our corresponding sve-default-vector-length cpu property.
+     * The linux kernel defaults to 512-bit for SVE, and 256-bit for SME.
+     * These values were chosen to fit within the default signal frame.
+     * See documentation for /proc/sys/abi/{sve,sme}_default_vector_length,
+     * and our corresponding cpu property.
      */
     cpu->sve_default_vq = 4;
+    cpu->sme_default_vq = 2;
 # endif
 #else
     /* Our inbound IRQ and FIQ lines */
@@ -1429,6 +1431,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
 
+        arm_cpu_sme_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
         arm_cpu_pauth_finalize(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9ae9be6698..aaf2c243d6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -589,10 +589,13 @@ static void cpu_arm_get_vq(Object *obj, Visitor *v, const char *name,
     ARMCPU *cpu = ARM_CPU(obj);
     ARMVQMap *vq_map = opaque;
     uint32_t vq = atoi(&name[3]) / 128;
+    bool sve = vq_map == &cpu->sve_vq;
     bool value;
 
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
+    /* All vector lengths are disabled when feature is off. */
+    if (sve
+        ? !cpu_isar_feature(aa64_sve, cpu)
+        : !cpu_isar_feature(aa64_sme, cpu)) {
         value = false;
     } else {
         value = extract32(vq_map->map, vq - 1, 1);
@@ -636,8 +639,80 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     cpu->isar.id_aa64pfr0 = t;
 }
 
+void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint32_t vq_map = cpu->sme_vq.map;
+    uint32_t vq_init = cpu->sme_vq.init;
+    uint32_t vq_supported = cpu->sme_vq.supported;
+    uint32_t vq;
+
+    if (vq_map == 0) {
+        if (!cpu_isar_feature(aa64_sme, cpu)) {
+            cpu->isar.id_aa64smfr0 = 0;
+            return;
+        }
+
+        /* TODO: KVM will require limitations via SMCR_EL2. */
+        vq_map = vq_supported & ~vq_init;
+
+        if (vq_map == 0) {
+            vq = ctz32(vq_supported) + 1;
+            error_setg(errp, "cannot disable sme%d", vq * 128);
+            error_append_hint(errp, "All SME vector lengths are disabled.\n");
+            error_append_hint(errp, "With SME enabled, at least one "
+                              "vector length must be enabled.\n");
+            return;
+        }
+    } else {
+        if (!cpu_isar_feature(aa64_sme, cpu)) {
+            vq = 32 - clz32(vq_map);
+            error_setg(errp, "cannot enable sme%d", vq * 128);
+            error_append_hint(errp, "SME must be enabled to enable "
+                              "vector lengths.\n");
+            error_append_hint(errp, "Add sme=on to the CPU property list.\n");
+            return;
+        }
+        /* TODO: KVM will require limitations via SMCR_EL2. */
+    }
+
+    cpu->sme_vq.map = vq_map;
+}
+
+static bool cpu_arm_get_sme(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_sme, cpu);
+}
+
+static void cpu_arm_set_sme(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    t = cpu->isar.id_aa64pfr1;
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, value);
+    cpu->isar.id_aa64pfr1 = t;
+}
+
+static bool cpu_arm_get_sme_fa64(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_sme, cpu) &&
+           cpu_isar_feature(aa64_sme_fa64, cpu);
+}
+
+static void cpu_arm_set_sme_fa64(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, value);
+    cpu->isar.id_aa64smfr0 = t;
+}
+
 #ifdef CONFIG_USER_ONLY
-/* Mirror linux /proc/sys/abi/sve_default_vector_length. */
+/* Mirror linux /proc/sys/abi/{sve,sme}_default_vector_length. */
 static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
                                         const char *name, void *opaque,
                                         Error **errp)
@@ -663,7 +738,11 @@ static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
      * and is the maximum architectural width of ZCR_ELx.LEN.
      */
     if (remainder || default_vq < 1 || default_vq > 512) {
-        error_setg(errp, "cannot set sve-default-vector-length");
+        ARMCPU *cpu = ARM_CPU(obj);
+        const char *which =
+            (ptr_default_vq == &cpu->sve_default_vq ? "sve" : "sme");
+
+        error_setg(errp, "cannot set %s-default-vector-length", which);
         if (remainder) {
             error_append_hint(errp, "Vector length not a multiple of 16\n");
         } else if (default_vq < 1) {
@@ -712,6 +791,31 @@ static void aarch64_add_sve_properties(Object *obj)
 #endif
 }
 
+static void aarch64_add_sme_properties(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq;
+
+    object_property_add_bool(obj, "sme", cpu_arm_get_sme, cpu_arm_set_sme);
+    object_property_add_bool(obj, "sme_fa64", cpu_arm_get_sme_fa64,
+                             cpu_arm_set_sme_fa64);
+
+    for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
+        char name[8];
+        sprintf(name, "sme%d", vq * 128);
+        object_property_add(obj, name, "bool", cpu_arm_get_vq,
+                            cpu_arm_set_vq, NULL, &cpu->sme_vq);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    /* Mirror linux /proc/sys/abi/sme_default_vector_length. */
+    object_property_add(obj, "sme-default-vector-length", "int32",
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sme_default_vq);
+#endif
+}
+
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
     int arch_val = 0, impdef_val = 0;
@@ -976,9 +1080,11 @@ static void aarch64_max_initfn(Object *obj)
 #endif
 
     cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+    cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
+    aarch64_add_sme_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
-- 
2.34.1

