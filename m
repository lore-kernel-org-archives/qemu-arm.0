Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp149884ejj;
        Wed, 22 Nov 2023 20:44:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgFkBg+JgignjZo2oaxYnYWEqFQaZaH+vaQBpZgO6Ex27ZaL/CRv0VUyYsJMMVzquPRz0k
X-Received: by 2002:ac8:59ce:0:b0:423:89b4:b798 with SMTP id f14-20020ac859ce000000b0042389b4b798mr1800069qtf.14.1700714643714;
        Wed, 22 Nov 2023 20:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714643; cv=none;
        d=google.com; s=arc-20160816;
        b=FeHG832MKTTziM3fEwJeRvVpGmTbjIVH9Q0KgRb/lefba//l8DlpmZ1GVTYpQW6cVn
         4kIpGOwJ9OCuFyyzNyYPdc+0ju5+4CYE87uVjDHCkJI36vOrSrHXUWx9+TWuWmBW6S1h
         MYZf7x/n30gQEKr4KRW1HwwDZgh84OKecXwyybd5UeQ121DTXUYYGdVbtXHsdE6hHrM3
         vDHLMplh4m3boCrN52JqvpiKLayKL9uJEFhA9BHsBzjdnkLIkErg3c2qCYspdlfzMZT8
         2IHdUV8orCuW6yWkPcw6qS7sO6R30nhvVMHZdYTyxJSfXxGw0EUPiOuP44dXTV5wLKM3
         0QqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8/6ksiykELH/hcOH+krPWpRgFNiSAn7ynh/hNK0cevI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=wRLfSPjPTKSVV/SvrKSqJV8o5KyFyhBjaHl7T64ieuhKzbe5aY4D0524tBePn+MHam
         WfUXqqmdfhVJhJeBq52DOlwbIr357CYAxPAR3a2r0rScu3s9/HbsaTWR10AFLGZzL10X
         j5M3G3DzX9f+is7pDD4TTHYVfFzf4eaUqIX9YJ3GdfVmepRruhEQrQoFjO1RU2Bw5wVZ
         mp/tzLQ6mHdU0L7/WyUOBhKQLVuqXtCIOf4WuxVpFWK1SAfj9IuwY87ZiAa5FrOWj9Be
         gowKwpLVAl+F3zNqv1ri78zDIgRdYxFvDmp0sYwWj9ZqMdwXfbitFnn79Ga18f/TZASi
         qb1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dc1FQQM2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac8574d000000b0041eaac3a655si440920qtx.311.2023.11.22.20.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:44:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dc1FQQM2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r61YJ-0006au-Fs; Wed, 22 Nov 2023 23:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xw-0006Nr-VR
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 23:42:38 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xs-00066V-RX
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 23:42:35 -0500
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b6ccaf0516so723419b6e.0
 for <qemu-devel@nongnu.org>; Wed, 22 Nov 2023 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714548; x=1701319348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/6ksiykELH/hcOH+krPWpRgFNiSAn7ynh/hNK0cevI=;
 b=Dc1FQQM29alHSrd5Zb3bbmrIC9fNywqRFWztTjh3W+9wmcH5R4n+ogVgNlJzMUEtUU
 hhKI9+xrxIswBpiZxL3qxp+pSPrImBKcqCbeChw9q3m7BXysNuN+/6OZD7ZqcaY3kZ5g
 h2OKZ9nH8Y9ARv+7wC00oNhU4Fsn5tYSqW7oO0zQktL58Gr8UbnSX8tzc/hZc4y6zKPm
 nIcRTNfe4X6oRJJ0r4QmQDoEB2nyVwyprJYqVPzjoOs3ffFn2S6dlu9ncK6RsGSgIbd6
 aPfgIYcytkROnQP/Qw9WMo5bwjlFFlQfbURxkAjgA+IsU+0XMDuI+rqyKe0lNYKHld85
 D7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714548; x=1701319348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/6ksiykELH/hcOH+krPWpRgFNiSAn7ynh/hNK0cevI=;
 b=uR/bSDqEcBWOSLWY6RQlvZmOXsINBR+SqLexCRZxfqzyB76ssHBpYxfEScREkfcZg4
 8msNSMUBAomMAeNNef4Uo184+9WWK1JrBDpltb8c5BYRCmqCtHRuAYAhRNrhVGs81Ko0
 Aw6r2AnlYUXJ6Y6fcHJJfroRD+3xAut3DJBRYA+145582zkhe9pWkwVZZI5yyOZ1kp8A
 KLD2f3WcAFrRXa+QfccUPfH9s2iD0PYBvHd6KKiJv1qVR92LB6eVOSW7NikLYCubFU6i
 3NdSvtk6JM0gHY7/M835xDGn/ize/uMlAkjMllyISu3l/5/0L08Ys0N0xDoWegxuW6Vs
 ySCA==
X-Gm-Message-State: AOJu0Ywqz7f1ZH4+hr3FGKH486VvpMBXs/o0FyG5uKsVo5Iu9fmLo9IM
 5FEZLEeowHUlYatiho8lODhrhjl3DMwV2ewICmUe3iWs
X-Received: by 2002:a05:6808:f92:b0:3b8:33d1:806d with SMTP id
 o18-20020a0568080f9200b003b833d1806dmr736953oiw.22.1700714548562; 
 Wed, 22 Nov 2023 20:42:28 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/21] target/arm/kvm: Move kvm_arm_handle_debug and unexport
Date: Wed, 22 Nov 2023 22:42:05 -0600
Message-Id: <20231123044219.896776-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YUXkaag3xn0g

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h |  9 ------
 target/arm/kvm.c     | 77 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c   | 70 ----------------------------------------
 3 files changed, 77 insertions(+), 79 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index ac4856cb46..9fa9cb7f76 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -445,13 +445,4 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 
 #endif
 
-/**
- * kvm_arm_handle_debug:
- * @cs: CPUState
- * @debug_exit: debug part of the KVM exit structure
- *
- * Returns: TRUE if the debug exception was handled.
- */
-bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit);
-
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4608bea7df..55e1b4f26e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -988,6 +988,83 @@ static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
     return -1;
 }
 
+/**
+ * kvm_arm_handle_debug:
+ * @cs: CPUState
+ * @debug_exit: debug part of the KVM exit structure
+ *
+ * Returns: TRUE if the debug exception was handled.
+ *
+ * See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
+ *
+ * To minimise translating between kernel and user-space the kernel
+ * ABI just provides user-space with the full exception syndrome
+ * register value to be decoded in QEMU.
+ */
+static bool kvm_arm_handle_debug(CPUState *cs,
+                                 struct kvm_debug_exit_arch *debug_exit)
+{
+    int hsr_ec = syn_get_ec(debug_exit->hsr);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /* Ensure PC is synchronised */
+    kvm_cpu_synchronize_state(cs);
+
+    switch (hsr_ec) {
+    case EC_SOFTWARESTEP:
+        if (cs->singlestep_enabled) {
+            return true;
+        } else {
+            /*
+             * The kernel should have suppressed the guest's ability to
+             * single step at this point so something has gone wrong.
+             */
+            error_report("%s: guest single-step while debugging unsupported"
+                         " (%"PRIx64", %"PRIx32")",
+                         __func__, env->pc, debug_exit->hsr);
+            return false;
+        }
+        break;
+    case EC_AA64_BKPT:
+        if (kvm_find_sw_breakpoint(cs, env->pc)) {
+            return true;
+        }
+        break;
+    case EC_BREAKPOINT:
+        if (find_hw_breakpoint(cs, env->pc)) {
+            return true;
+        }
+        break;
+    case EC_WATCHPOINT:
+    {
+        CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
+        if (wp) {
+            cs->watchpoint_hit = wp;
+            return true;
+        }
+        break;
+    }
+    default:
+        error_report("%s: unhandled debug exit (%"PRIx32", %"PRIx64")",
+                     __func__, debug_exit->hsr, env->pc);
+    }
+
+    /* If we are not handling the debug exception it must belong to
+     * the guest. Let's re-use the existing TCG interrupt code to set
+     * everything up properly.
+     */
+    cs->exception_index = EXCP_BKPT;
+    env->exception.syndrome = debug_exit->hsr;
+    env->exception.vaddress = debug_exit->far;
+    env->exception.target_el = 1;
+    qemu_mutex_lock_iothread();
+    arm_cpu_do_interrupt(cs);
+    qemu_mutex_unlock_iothread();
+
+    return false;
+}
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     int ret = 0;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 352643e066..6b6db9374c 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1121,73 +1121,3 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     }
     return 0;
 }
-
-/* See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
- *
- * To minimise translating between kernel and user-space the kernel
- * ABI just provides user-space with the full exception syndrome
- * register value to be decoded in QEMU.
- */
-
-bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
-{
-    int hsr_ec = syn_get_ec(debug_exit->hsr);
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /* Ensure PC is synchronised */
-    kvm_cpu_synchronize_state(cs);
-
-    switch (hsr_ec) {
-    case EC_SOFTWARESTEP:
-        if (cs->singlestep_enabled) {
-            return true;
-        } else {
-            /*
-             * The kernel should have suppressed the guest's ability to
-             * single step at this point so something has gone wrong.
-             */
-            error_report("%s: guest single-step while debugging unsupported"
-                         " (%"PRIx64", %"PRIx32")",
-                         __func__, env->pc, debug_exit->hsr);
-            return false;
-        }
-        break;
-    case EC_AA64_BKPT:
-        if (kvm_find_sw_breakpoint(cs, env->pc)) {
-            return true;
-        }
-        break;
-    case EC_BREAKPOINT:
-        if (find_hw_breakpoint(cs, env->pc)) {
-            return true;
-        }
-        break;
-    case EC_WATCHPOINT:
-    {
-        CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
-        if (wp) {
-            cs->watchpoint_hit = wp;
-            return true;
-        }
-        break;
-    }
-    default:
-        error_report("%s: unhandled debug exit (%"PRIx32", %"PRIx64")",
-                     __func__, debug_exit->hsr, env->pc);
-    }
-
-    /* If we are not handling the debug exception it must belong to
-     * the guest. Let's re-use the existing TCG interrupt code to set
-     * everything up properly.
-     */
-    cs->exception_index = EXCP_BKPT;
-    env->exception.syndrome = debug_exit->hsr;
-    env->exception.vaddress = debug_exit->far;
-    env->exception.target_el = 1;
-    qemu_mutex_lock_iothread();
-    arm_cpu_do_interrupt(cs);
-    qemu_mutex_unlock_iothread();
-
-    return false;
-}
-- 
2.34.1

