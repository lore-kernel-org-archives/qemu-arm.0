Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706562ejb;
        Mon, 20 Feb 2023 15:27:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/mcaTTair6RlgPN/LnFDSSrXVe5luJ0D0ySG/y20VHT21xMYV97U0/8eNzsafOW9Qj+2D6
X-Received: by 2002:ac8:5783:0:b0:3bd:de7:6163 with SMTP id v3-20020ac85783000000b003bd0de76163mr4326630qta.16.1676935640009;
        Mon, 20 Feb 2023 15:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935639; cv=none;
        d=google.com; s=arc-20160816;
        b=lizFiTKeNaDCDffnbmxXvfNxRi6jjkMgvhsqQEIcsQ1A53DBQp2mwA1r7E21BNmYgN
         IVvEVsG0WTfRzOsIwEu4M0NSeWtbw70A6ZpgZGPu0nKfAlZpF4SAgysMLAgWhZIE8JhO
         DyxeDDKbrmdgi4ZFksYmgtmOdNao3B5Hc+m/QoMS+G1jJEiPdOd7vr3jrRH2BLbkwE/Y
         kIecqOq4dMzTz2ilzQ8EyyEFx3mMQo2OYraI4zxg9osJHGCQ8/8tQLobrgenEeaUw8oP
         udye3djZY4FfAzomagffEFPjy8dWPcJRAcM7UuvZnDfPiadpf6HebjP6nuRKsAfe5dKj
         5B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HJ0eXW5VRS0QeP2fz4cJY2IGgEGJA0/xJ9DiQojdrZw=;
        b=V1jD9bV8+8kRr2OUYbNgUrU+UuVMKuLB9/pxiMSHvk53Nd97YAyBwhOedwWBgrOvHq
         y60ybFWZAZHVjYtGZAbNTBfoVGV+p36ls4DqlZqgSSpQ9lhW91Tizuoi+TvrWqlMHIz7
         +UoEB40fXsx1XHEnO1i76QG5N94xmX75ztJ1ItIw+VYFK7d0LC/Vm/6oDyCJIns5DfOh
         /EEanOjOZUzZtmb2W6bislx4eCT65tM37QpL2xkN5+2sfnIp2D27W9ekEZGYNS0Q0yaY
         LA+QKB1l61shx4WUE4u+Cnu4X5ruNB3Bi9dWfyseCgkqQTUAQ9UyT3E2TYNB6TCHTpkY
         kszA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRDIFZ1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a37b806000000b0073bb006c64fsi7371436qkf.514.2023.02.20.15.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRDIFZ1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYT-0003pH-LU; Mon, 20 Feb 2023 18:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYR-0003mm-UP
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:43 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYQ-0000KW-1p
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id h14so3270509plf.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ0eXW5VRS0QeP2fz4cJY2IGgEGJA0/xJ9DiQojdrZw=;
 b=yRDIFZ1hKKh+Ou/BE6Reih1mFOWMoebCVm+cMDPqZ5c2cxlG3tAA0RHtzgEN72RHpX
 YpuG5AhWzbkZssamR3klbLOas5k8adeIG2NNdcNUpVymjT+fRiVg/HAo9yqYy0iDWKzb
 LntjVnqTsUNdlcLbWaeXFAilncY2iqyD2PQPAkiSUX3N21wO/OmZbx4tHFFYP3GdBo5o
 rTN9ZDlg0QbxYMxXGrbC1/lhBkQgP7cCdDSWFtx90hePJ5booLmPRYe0x4NIuvzT04FY
 +arhbBeWhjZmWcVxIcPUsgYOUtLReCKO5g4t/A2BgZJEdA5zUxlqHUAYp8X7jPXOUm3b
 f19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJ0eXW5VRS0QeP2fz4cJY2IGgEGJA0/xJ9DiQojdrZw=;
 b=bqqiS4r/ELYwWF9qrkzcQTBUIFGKUEkYDNnDpl8EXjodKszq4pGh3BRfTvr8H/Gsr1
 hBBEZGTNSUHD3YbgOsxJFLj3eFnwxESeNZSDRYOrF7IttMBwEmc1//AX5rC1kJ+Ellgb
 RHscDC/HtCE5WGFVzAUQFESNjIc7KwmGqB6gcRAsP8GDUtpi10pYbjKwxLS946uBb5lE
 YbeSFYwT3dGpBaj7StDYIO+/VzZDrXAuqseEDwO1th+QLheD65rnIQtcMIJftV7aQmID
 Vwwdu8OBaI8cr8NZLSBsYzizQFYY/+eQslaEehvK6By9y3ExknZZYYUHdwBSn4SjAjmM
 sp5g==
X-Gm-Message-State: AO0yUKW2vrDcXD60fAe1Ws/1d0VQD9U5DUKe3RyBf2kvirdXI2MhxyTM
 IoPDyBvksfyp7yNQ1LaXI7X1OQ==
X-Received: by 2002:a17:902:e84b:b0:19a:ba6f:b179 with SMTP id
 t11-20020a170902e84b00b0019aba6fb179mr5320893plg.29.1676935600266; 
 Mon, 20 Feb 2023 15:26:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/21] target/arm: Introduce ARMSecuritySpace
Date: Mon, 20 Feb 2023 13:26:11 -1000
Message-Id: <20230220232626.429947-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: /KwcU74TehJL

Introduce both the enumeration and functions to retrieve
the current state, and state outside of EL3.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 86 +++++++++++++++++++++++++++++++++++----------
 target/arm/helper.c | 54 ++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a97c727d1..1b982dc94c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2409,23 +2409,53 @@ static inline int arm_feature(CPUARMState *env, int feature)
 
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
+/*
+ * ARM v9 security states.
+ * The ordering of the enumeration corresponds to the low 2 bits
+ * of the GPI value, and (except for Root) the concat of NSE:NS.
+ */
+
+typedef enum ARMSecuritySpace {
+    ARMSS_Secure     = 0,
+    ARMSS_NonSecure  = 1,
+    ARMSS_Root       = 2,
+    ARMSS_Realm      = 3,
+} ARMSecuritySpace;
+
+/* Return true if @space is secure, in the pre-v9 sense. */
+static inline bool arm_space_is_secure(ARMSecuritySpace space)
+{
+    return space == ARMSS_Secure || space == ARMSS_Root;
+}
+
+/* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
+static inline ARMSecuritySpace arm_secure_to_space(bool secure)
+{
+    return secure ? ARMSS_Secure : ARMSS_NonSecure;
+}
+
 #if !defined(CONFIG_USER_ONLY)
-/* Return true if exception levels below EL3 are in secure state,
- * or would be following an exception return to that level.
- * Unlike arm_is_secure() (which is always a question about the
- * _current_ state of the CPU) this doesn't care about the current
- * EL or mode.
+/**
+ * arm_security_space_below_el3:
+ * @env: cpu context
+ *
+ * Return the security space of exception levels below EL3, following
+ * an exception return to those levels.  Unlike arm_security_space,
+ * this doesn't care about the current EL.
+ */
+ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env);
+
+/**
+ * arm_is_secure_below_el3:
+ * @env: cpu context
+ *
+ * Return true if exception levels below EL3 are in secure state,
+ * or would be following an exception return to those levels.
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        return !(env->cp15.scr_el3 & SCR_NS);
-    } else {
-        /* If EL3 is not supported then the secure state is implementation
-         * defined, in which case QEMU defaults to non-secure.
-         */
-        return false;
-    }
+    ARMSecuritySpace ss = arm_security_space_below_el3(env);
+    return ss == ARMSS_Secure;
 }
 
 /* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
@@ -2444,13 +2474,23 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
     return false;
 }
 
-/* Return true if the processor is in secure state */
+/**
+ * arm_security_space:
+ * @env: cpu context
+ *
+ * Return the current security space of the cpu.
+ */
+ARMSecuritySpace arm_security_space(CPUARMState *env);
+
+/**
+ * arm_is_secure:
+ * @env: cpu context
+ *
+ * Return true if the processor is in secure state.
+ */
 static inline bool arm_is_secure(CPUARMState *env)
 {
-    if (arm_is_el3_or_mon(env)) {
-        return true;
-    }
-    return arm_is_secure_below_el3(env);
+    return arm_space_is_secure(arm_security_space(env));
 }
 
 /*
@@ -2469,11 +2509,21 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
 }
 
 #else
+static inline ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env)
+{
+    return ARMSS_NonSecure;
+}
+
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
     return false;
 }
 
+static inline ARMSecuritySpace arm_security_space(CPUARMState *env)
+{
+    return ARMSS_NonSecure;
+}
+
 static inline bool arm_is_secure(CPUARMState *env)
 {
     return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c769218763..13af812215 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12535,3 +12535,57 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
     }
 }
 #endif
+
+#ifndef CONFIG_USER_ONLY
+ARMSecuritySpace arm_security_space(CPUARMState *env)
+{
+    /*
+     * If EL3 is not supported then the secure state is implementation
+     * defined, in which case QEMU defaults to non-secure.
+     */
+    if (!arm_feature(env, ARM_FEATURE_EL3)) {
+        return ARMSS_NonSecure;
+    }
+
+    /* Check for AArch64 EL3 or AArch32 Mon. */
+    if (is_a64(env)) {
+        if (extract32(env->pstate, 2, 2) == 3) {
+            if (cpu_isar_feature(aa64_rme, env_archcpu(env))) {
+                return ARMSS_Root;
+            } else {
+                return ARMSS_Secure;
+            }
+        }
+    } else {
+        if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
+            return ARMSS_Secure;
+        }
+    }
+
+    return arm_security_space_below_el3(env);
+}
+
+ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env)
+{
+    /*
+     * If EL3 is not supported then the secure state is implementation
+     * defined, in which case QEMU defaults to non-secure.
+     */
+    if (!arm_feature(env, ARM_FEATURE_EL3)) {
+        return ARMSS_NonSecure;
+    }
+
+    /*
+     * Note NSE cannot be set without RME, and NSE & !NS is Reserved.
+     * Ignoring NSE when !NS retains consistency without having to
+     * modify other predicates.
+     */
+    if (!(env->cp15.scr_el3 & SCR_NS)) {
+        return ARMSS_Secure;
+    } else if (env->cp15.scr_el3 & SCR_NSE) {
+        return ARMSS_Realm;
+    } else {
+        return ARMSS_NonSecure;
+    }
+}
+#endif /* !CONFIG_USER_ONLY */
-- 
2.34.1

