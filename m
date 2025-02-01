Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142505njb;
        Sat, 1 Feb 2025 08:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6ccclNbFOavgRMjbseh8jCoS7Ned7Wh3XYRPoljHd/5bc3Vy9a0OhoduzpT3nQBMyzwsxh5C3WWJE5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFWk4D0LOuPlBT7x5VTANkCb75kU0itGzjF2zqHhv+9VGFbY1Uk4BdvgdNYwPbHwLo8FVrr
X-Received: by 2002:a05:622a:181c:b0:46d:d3c1:55e4 with SMTP id d75a77b69052e-46fd0a820camr254302921cf.3.1738428120400;
        Sat, 01 Feb 2025 08:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428120; cv=none;
        d=google.com; s=arc-20240605;
        b=XzAvQ+xVSdr2VD9HkV6w8a5xE/kGsdaFYnhLWoMYc8HAg8VwRAAsu2FVXv6lqspXbM
         XOGczrJahil9+VHeD4PF7gyxmd3AV7c+S2z6SyawyBAON9k97Xg8hMK7hD0jOmCCyB+g
         V1QsVSNdRk0t8F/W92izKw1gli2G79Xa4J06EZ6fuX6kuegUz59B50eiMcKax4pvRFaC
         mW5mAtsZuSpYgPZhsmslAkoZ+pr5vpgAbWWlbdzGK27P5xwOipOmfNuoWl+TAOqIUQLE
         FL9m2+NTtP0v09xnk4CAuNVEm3gR4EsI79SCuqtpyRpk2/2hprJxc5tk84ZYeBfLzANK
         FngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DNAe46UE3NF5ax4snCeOimPzEnqWEVPV2g/5r06GYCc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=RzoRtK8vID0wm2Vl8UPWVUuULFQqxkVkdCekdGlUyaO1WjJLewrPnt/N7s/uNSxPP9
         nghI7LXKIAhU4g3iRNgcNMV1YB82bZuBS/0nT3KPNH1wB50KinxZV4j27Fz80H/WZ6kj
         cUkY3tex5ciic87PX+u7e9VIsm1e5ze4lFKPi9x12U4wliCf2QYjWBivjwbafjVJJFbr
         WqNgZw0n2XSZrGx+C5/IEdn2fkVnFEYXjsjFDPnLPJgGtr29byArUW4ol/xxex7qV/ND
         6cmfcE8Oc4co6udHFhR5FCt/wvoXnixiJPQD5VYWPgWcq8iocmpJ0i1qilCpBYeCuCO1
         6Iwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSNYtVyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d1a5dsi65321971cf.413.2025.02.01.08.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSNYtVyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGXw-00065M-AR; Sat, 01 Feb 2025 11:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXm-00061C-HC
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:31 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXk-00014K-D9
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso20890975e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428026; x=1739032826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DNAe46UE3NF5ax4snCeOimPzEnqWEVPV2g/5r06GYCc=;
 b=aSNYtVybUENhNgHN8tQsVgBYyIn7pMKc47z3ffSgiF8Dn3L8OyNWGrOBOaPZkzVqzb
 EXPiFbo4gpCvoOgg50Hs+NgOLPHQr7qbH/NIxR6BAvD+mo0jLl8i+0cXPZARhq+3eoe0
 uNZOR5vMiL3hcwUVAoiQkiQIoMJSDNYJortBJYmxtWIAok5UtG0Y7GSH8pD9YqvhiLsY
 OTQMzQibdsA+71dhlk+0Gkuz/xzAKyjX5vzb8M9jxdtlQHasTNX4qPVbn2jWs3GmbTY4
 +1PBX+grcvRFDqOyB7L+sZHPe7fvtaZuxw5xmQlYbUeHItUD8eXR4JM4+a8FfRqax4yJ
 hJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428026; x=1739032826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNAe46UE3NF5ax4snCeOimPzEnqWEVPV2g/5r06GYCc=;
 b=C3Cw9R9lW4irxr1EjrbvRDjzs02NqVbLeh9p2rEOxnDcB9qRi6qcO1urHRroKb+aMd
 9i3nbHBohoWH8nkmce/QaWh2hQvuIo3vBv+yUurJF+bNcLhLSuNhkcxxWeyGpLQPA9eB
 jNO8s/6sOZRjrwKo2373h0OzMOobcEG0hcC7Oiv5i+MzA6o759rKdMoU4Tf4VnBYNvuD
 4tqIwuSkPNgKyau11yImMnyx5kvagK8SkBjgrJSHzF9Pzm/VCj9wGj7uPW6Zn9s0dHKt
 v7xlVu9vGv8v3NscZ9D8hQHHRzddomhbPR9GHbGH+I+Lnj7FEJ8NyQBeGpQWUQ0JBDmu
 cirA==
X-Gm-Message-State: AOJu0Ywqvr4ZCwt9YzoVZbq3qLBKIL/HbTkoq6sH9NFD75Kp/GzilYWS
 AN7ttR5m0Sl9hplDuHoCp51MD7Dr6Zr4gKEfLp97N9PdIpSr19xAUihO4NkW6+QifZg3w8YSisa
 b
X-Gm-Gg: ASbGncu7czHOx4Oo28w6FukfKa/Jk2N1v8rL5s4ZL5aQBEzVI5pGC3rm2oHXdinb7nj
 DG0W+Yh/TEeCqJZ3FqrZopcIgRzwTCSkoNv7zoe7LHn0VoVyXZVgOGDMqq+8uKHFCow84P9jZNB
 DMC2dmOOd+1LjyUBFvDkt8rOjLAvaU1mAGzkEKRGrA0qKpsmKi1GRpCPMH5sMIRjQ8l7I2iRBVM
 Ay7bBYxfrZw9PTxbFd93uO0zk3lgYr3yECy/WG5QyrEEaUg1SIVfKEyWMtgMls8l69KknJkMpI2
 X6vj3lSuBt9hBiLL2rJ4
X-Received: by 2002:a05:600c:4713:b0:436:488f:4f3 with SMTP id
 5b1f17b1804b1-438dc3cbfc9mr140239515e9.17.1738428026432; 
 Sat, 01 Feb 2025 08:40:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/69] target/arm: Adjust FP behaviour for FPCR.AH = 1
Date: Sat,  1 Feb 2025 16:39:11 +0000
Message-Id: <20250201164012.1660228-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: rEmSgFQTXSTW

When FPCR.AH is set, various behaviours of AArch64 floating point
operations which are controlled by softfloat config settings change:
 * tininess and ftz detection before/after rounding
 * NaN propagation order
 * result of 0 * Inf + NaN
 * default NaN value

When the guest changes the value of the AH bit, switch these config
settings on the fp_status_a64 and fp_status_f16_a64 float_status
fields.

This requires us to make the arm_set_default_fp_behaviours() function
global, since we now need to call it from cpu.c and vfp_helper.c; we
move it to vfp_helper.c so it can be next to the new
arm_set_ah_fp_behaviours().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |  4 +++
 target/arm/cpu.c        | 23 -----------------
 target/arm/vfp_helper.c | 56 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 23 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 863a84edf81..98073acc276 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1828,4 +1828,8 @@ uint64_t gt_virt_cnt_offset(CPUARMState *env);
  * all EL1" scope; this covers stage 1 and stage 2.
  */
 int alle1_tlbmask(CPUARMState *env);
+
+/* Set the float_status behaviour to match the Arm defaults */
+void arm_set_default_fp_behaviours(float_status *s);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9ea2080e519..1ba22c4c7aa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -169,29 +169,6 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
     QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
 }
 
-/*
- * Set the float_status behaviour to match the Arm defaults:
- *  * tininess-before-rounding
- *  * 2-input NaN propagation prefers SNaN over QNaN, and then
- *    operand A over operand B (see FPProcessNaNs() pseudocode)
- *  * 3-input NaN propagation prefers SNaN over QNaN, and then
- *    operand C over A over B (see FPProcessNaNs3() pseudocode,
- *    but note that for QEMU muladd is a * b + c, whereas for
- *    the pseudocode function the arguments are in the order c, a, b.
- *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
- *    and the input NaN if it is signalling
- *  * Default NaN has sign bit clear, msb frac bit set
- */
-static void arm_set_default_fp_behaviours(float_status *s)
-{
-    set_float_detect_tininess(float_tininess_before_rounding, s);
-    set_float_ftz_detection(float_ftz_before_rounding, s);
-    set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
-    set_float_3nan_prop_rule(float_3nan_prop_s_cab, s);
-    set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
-    set_float_default_nan_pattern(0b01000000, s);
-}
-
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
 {
     /* Reset a single ARMCPRegInfo register */
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 30c170ecee5..62005e19524 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -31,6 +31,50 @@
    Single precision routines have a "s" suffix, double precision a
    "d" suffix.  */
 
+/*
+ * Set the float_status behaviour to match the Arm defaults:
+ *  * tininess-before-rounding
+ *  * 2-input NaN propagation prefers SNaN over QNaN, and then
+ *    operand A over operand B (see FPProcessNaNs() pseudocode)
+ *  * 3-input NaN propagation prefers SNaN over QNaN, and then
+ *    operand C over A over B (see FPProcessNaNs3() pseudocode,
+ *    but note that for QEMU muladd is a * b + c, whereas for
+ *    the pseudocode function the arguments are in the order c, a, b.
+ *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
+ *    and the input NaN if it is signalling
+ *  * Default NaN has sign bit clear, msb frac bit set
+ */
+void arm_set_default_fp_behaviours(float_status *s)
+{
+    set_float_detect_tininess(float_tininess_before_rounding, s);
+    set_float_ftz_detection(float_ftz_before_rounding, s);
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, s);
+    set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
+    set_float_default_nan_pattern(0b01000000, s);
+}
+
+/*
+ * Set the float_status behaviour to match the FEAT_AFP
+ * FPCR.AH=1 requirements:
+ *  * tininess-after-rounding
+ *  * 2-input NaN propagation prefers the first NaN
+ *  * 3-input NaN propagation prefers a over b over c
+ *  * 0 * Inf + NaN always returns the input NaN and doesn't
+ *    set Invalid for a QNaN
+ *  * default NaN has sign bit set, msb frac bit set
+ */
+static void arm_set_ah_fp_behaviours(float_status *s)
+{
+    set_float_detect_tininess(float_tininess_after_rounding, s);
+    set_float_ftz_detection(float_ftz_after_rounding, s);
+    set_float_2nan_prop_rule(float_2nan_prop_ab, s);
+    set_float_3nan_prop_rule(float_3nan_prop_abc, s);
+    set_float_infzeronan_rule(float_infzeronan_dnan_never |
+                              float_infzeronan_suppress_invalid, s);
+    set_float_default_nan_pattern(0b11000000, s);
+}
+
 #ifdef CONFIG_TCG
 
 /* Convert host exception flags to vfp form.  */
@@ -173,6 +217,18 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
     }
+    if (changed & FPCR_AH) {
+        bool ah_enabled = val & FPCR_AH;
+
+        if (ah_enabled) {
+            /* Change behaviours for A64 FP operations */
+            arm_set_ah_fp_behaviours(&env->vfp.fp_status_a64);
+            arm_set_ah_fp_behaviours(&env->vfp.fp_status_f16_a64);
+        } else {
+            arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
+            arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
+        }
+    }
     /*
      * If any bits changed that we look at in vfp_get_fpsr_from_host(),
      * we must sync the float_status flags into vfp.fpsr now (under the
-- 
2.34.1

