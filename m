Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp928373njk;
        Fri, 24 Jan 2025 08:31:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGbkW+9sxNStNy9lhxcQYM4eU6J+GyuibueVqd1hEk2UO/R24es460MIuQPsduIP6Xbvv6hYUi4ZK+qw==@linaro.org
X-Google-Smtp-Source: AGHT+IGgQNXQw6AyA1YNkmUSLoeQQY1PqKJ9h4woqwNQOJ3nOWeBTqFE9pKCUVhMsUCY96bHBYad
X-Received: by 2002:a05:6102:3ec9:b0:4b1:1b24:7241 with SMTP id ada2fe7eead31-4b690c3a394mr26811811137.15.1737736312669;
        Fri, 24 Jan 2025 08:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736312; cv=none;
        d=google.com; s=arc-20240605;
        b=P65yUKhk/XMqq8FHVu0jFeSQaS7b4QSA52ZedcJrcWUsR3rx9meb86JW3ERE/rE8cP
         PUWNEI2n5V62n9Y//t3J/mN+CjR4pJ8QwZzvXyIiqhI/P2LS5Zdd02MTkBnSvBg5YRvv
         VAckPqWbHLWP+yMTQrKIu/ue7ujjkPYaihbYc889wbDBYrqdt9GetY1zpBM1/6MnjE4O
         wrQOkqeQBWd2cJGt0z/kVp3pvHjIyDD6qUqTITQ3ygwpPuBRTlfK3dByNq3pK8gEW3d5
         Q8UwBg+ii6vRIlDXCvfwYdB0e+qC5oIFgVBxvX6O2KmXMB7uf9FuV09FoErPkgis9BDW
         Bhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jN3mFnktaZqVK11S456/SP/OoMEiasYt5k58IjHmWbU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=VENvC7dz+tFGwUvK4Y8gTb1Kduco2lzJlh+IWRugFeus0W1RVt3xZCZeeiWVYqU+wX
         /0NV2IoSqzpiN7YQkqr1/m48XcAebCx35KuR+tROVB0spheAb9M0YBZht4FhKCGFEII/
         RBpqMICDdlW4XSi2YsRIf8i1d6+Hw5KFY1WjzSVErbIYpTHbtePlVOSynBWeuWP/BDPM
         feVL8QBZSenZdpektf5j0pdDOBp/pJ9l++EVIM9tG2dX8ltNFhPaR/jTIAddGDvdWcuS
         xAPCtGAE20sZ7tG71r4K+gTY8c4ytmKSvjxjm7KsYBbrFYBwMqsTNjXyWpXrYceJJ/2I
         T2Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eryf4Qoe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099fcc3fsi839134137.532.2025.01.24.08.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:31:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eryf4Qoe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMb0-0000mm-F3; Fri, 24 Jan 2025 11:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYX-00040F-To
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:20 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYW-0005ZE-2x
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436341f575fso24721155e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736154; x=1738340954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jN3mFnktaZqVK11S456/SP/OoMEiasYt5k58IjHmWbU=;
 b=eryf4QoeJnKBtq5craoip97NvTILEp5Dqy3hbwhgSDDs73DRxGHxVyWquh+oBHQACx
 dnJDki1ZsxsXfUIvXaGPmibO/KlSC12i/t/QZF570ihWUUIjjCOjQv9Tmhtf15UvGDAj
 quWogAvqqubs/jOqRzP6u2zQSV0oEuslu+/fs0Ou7OlIYMmxspe/flkFsU1IqfuW55hU
 1/R9YpjT1WnmSXLbP2Ni4RhwIIpfeIRA8thqCrMAEMAgL+ddYew8aUWM1evsfAcdBzYf
 Rn5ncMa1y5nOqR/yJPzUUmwbnfl76ubdvbVMuNLlwr7DzwxYMsm2cGasD3bJK+IEyppL
 lYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736154; x=1738340954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jN3mFnktaZqVK11S456/SP/OoMEiasYt5k58IjHmWbU=;
 b=prQZjyuqdXYvYhtjEzKB1Rq7Di34/0+SwfFX6VhyQCbPjus1tep9NaMhMXCyB5GLct
 Ilf1RJVIFV4PeIsbc6EgJlYBctRiSlMM9PiURX9PfkVU3lQiE2MVZGEswwYkS29BeBol
 /CQeEivON1Mfp+61KT0aqMMHdPl/xNukd2sfIarD1kxna/V1BLfg4XGDmPXUiMkDKZLb
 YDEMJKFl64xuF2b0du/yHfqCr5xmUA1uMOsE09uWAFuudVNn8lAa4PTan7TcGrrfe28E
 +HODieJ3L8uEWa4AmX/4DdBMfWgFMHfka+XezP7XGa1Tw13Fa57QLfLYL/NQSzKCuV/A
 wAXA==
X-Gm-Message-State: AOJu0Yyjd9yiO2Qpo+Dbx4JnFFt5Xkw+/6aRXGFct0f2rbnOLq47tB0y
 SheBv55auHyWrnITF9pCa6q+tUhPcqCPIId2J97XtL9JJE4AFPa+K08x03yu15JRULF0bXdhQ1l
 e
X-Gm-Gg: ASbGnctacpxxlrRLNEQZ0Mbags/VVhEkBsNy82pFVxMBhT/Xp1dbkBPyuR+eugLc1FM
 WxbYziOMJEdcWT2PdgEZpd4cioR2qnWbBlHARUkOclx+bZUdgMtBS2SDjeCYJj0PRKPuF2NYISL
 Oi1TUCx4ilXhDRS1ZelNKgmBeNtWP6D8+oiVTpCxLnENQXP7QBA10/4mpPzkF8EkerJqlyTuF6M
 y0BldlqA7dIdq59/x17JpVffAKRDmouB/0sy3gBCh2rp5ukjFALEAoJwJ2xOCI/379dyVucawS8
 hQORXvKMNRs=
X-Received: by 2002:a05:600c:1c1e:b0:436:6460:e67a with SMTP id
 5b1f17b1804b1-43891452899mr251172675e9.25.1737736154514; 
 Fri, 24 Jan 2025 08:29:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 29/76] target/arm: Adjust FP behaviour for FPCR.AH = 1
Date: Fri, 24 Jan 2025 16:27:49 +0000
Message-Id: <20250124162836.2332150-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fb9nKVzNsZR9

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
index 0b4cd872d27..1ba22c4c7aa 100644
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
-    set_float_detect_ftz(detect_ftz_before_rounding, s);
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
index 5a0b389f7a3..7507ff24bc0 100644
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
+    set_float_detect_ftz(detect_ftz_before_rounding, s);
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
+    set_float_detect_ftz(detect_ftz_after_rounding, s);
+    set_float_2nan_prop_rule(float_2nan_prop_ab, s);
+    set_float_3nan_prop_rule(float_3nan_prop_abc, s);
+    set_float_infzeronan_rule(float_infzeronan_dnan_never |
+                              float_infzeronan_suppress_invalid, s);
+    set_float_default_nan_pattern(0b11000000, s);
+}
+
 #ifdef CONFIG_TCG
 
 /* Convert host exception flags to vfp form.  */
@@ -171,6 +215,18 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
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

