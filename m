Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F772CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkYw-0001Kw-VX; Wed, 20 May 2026 13:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYu-0001Jg-Cl
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:28 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYr-0001sc-Gw
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-36931e4f5e8so4454660a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297504; x=1779902304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9rWSaQvjbDXBnfVxCErc01A7AXki6hbY0KLzGZpXR4=;
 b=TKJ47Yk1/Ww8QRVh9DY0+JVI320hVwTYS6XvvfeSA2zjCtAPCTsWbsD4YKTqIZ5Dj2
 Bubr9Sa+F/mvz7tlEIuhmK3ryoWzTJ+Qh0Drik8UM1Xnz5Sw8en0vZjFOoojJg9qE7dp
 jzZhrWG4zdbEu21vtPtmx5OVbtP29s/CV+eo7xYcSaTBsxKW9i76e1RuVZs3U/SK6Tvl
 YIuRMxS02nTZWMGw8rpnJrKXDNjHKRyqF2IijPoT+PKUTFFtuE8NeAGtXu11PBYTo42F
 KCBULrxo07ec/XzIkytvx3vhendiOucfJlsTMTxAgkeHXPvG6phrdfXWvkLG5iSuwP8g
 gK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297504; x=1779902304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x9rWSaQvjbDXBnfVxCErc01A7AXki6hbY0KLzGZpXR4=;
 b=b9SEWCFyZWwOmhzJIAs1PCMeuzeiLjdQEspM5I4tbU3lKHavRfLZGGQ35AjN9tqMFL
 38dOvDiK27xVuBds3vsOQiX8bmYaYTzaTXs4+AXEW2XKZqnqDFKcvRmnNw3OeaUW0En3
 voNFhUzezhmGtncWDrlQbZIKR7WYBaNE059conwMfnmlx5YZFUp7R8bdEzjhg31xAMNS
 qk09DrHlWWEBJLtKx99fMDYwQd6bfdhZtKpkPpnKpMUDiZ5jmXtCPCYClo1ZmSYXjLZc
 HjqSsfXS+g7wuprqhNRW6a/y98ct7c15RvEpkB78tTHM7Q4tUImHTq8aCp1G2CDZxr+E
 7c+A==
X-Gm-Message-State: AOJu0YzIZPm8jSmdwYeU6HuRuRK3nvjeM/a2QJK4axlxQlu000ZeABa8
 dOAnUdObngVFiem+A6TgbaLjC+OPx7r1tRkY2MPFE7qQ/BNsRVEtJBL2FgUXhFlRzcU=
X-Gm-Gg: Acq92OFjxDqP8AU19szP4DyMatZQlpFtqM8WAyPRQEdaNTq4fEjFQKXVb2ruNy2hKdc
 zkSpnOrov0ccrdrt7FQB2ZL43SEUW1YkmUSHwfEgrjx8tTRpe7nvUGp6KWT8l2uBNQs8uMQyIrL
 SrXgPoqPqIPxFp99NMEKmrNKXnSQUCfhEPVevCE1ctvJ08aGZunZBg14f7u9z0+77sd8E15RmHU
 c/Qw1TfJTn5tBH/L6+cVDXmoHrAmVVnzWj73O8mO6a5EwGMcNaaOcBwnyADjIa3kbjC5BLh400z
 QWCoOKjHuppMXl0HE3X5lL0bJmvVMj/Quvz7lhxLpgL4r14UnsuGUWg/lrP6C/Nekl25MVCL+Ut
 0xePvh1oEMbMO1ld04zKfy/E0NoFuRN7foPeEN4F8M837/bsWHK0eEHHkuDYnEcYzIh9krhSqPA
 KUpnGZVe5fsLwf8VOJjUgeKS0PsPvy
X-Received: by 2002:a17:90b:33c4:b0:367:f9f1:af78 with SMTP id
 98e67ed59e1d1-369519decbcmr25196137a91.7.1779297503441; 
 Wed, 20 May 2026 10:18:23 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 02/30] fpu: Reorganize partsN(muladd)
Date: Wed, 20 May 2026 10:17:52 -0700
Message-ID: <20260520171820.848839-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Check the likely case of normal product and normal or
zero addend first; shift NaN and infinity detection down;
end with zero product + addend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 156 +++++++++++++++++---------------------
 1 file changed, 71 insertions(+), 85 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 3a9c2748cd..ca2d7a15c9 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -681,11 +681,47 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
                                    FloatPartsN *c,
                                    int flags, float_status *s)
 {
-    int ab_mask, abc_mask;
-    FloatPartsW p_widen, c_widen;
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+    int c_mask = float_cmask(c->cls);
+    int abc_mask = ab_mask | c_mask;
+    bool c_sign = c->sign ^ !!(flags & float_muladd_negate_c);
+    bool p_sign = a->sign ^ b->sign ^ !!(flags & float_muladd_negate_product);
 
-    ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
-    abc_mask = float_cmask(c->cls) | ab_mask;
+    /*
+     * The "likely" case is A and B normal, so that the product is normal,
+     * and C normal or zero so that the result is normal.
+     */
+    int likely_mask = ab_mask | (c_mask & ~float_cmask_zero);
+    if (likely(cmask_is_only_normals(likely_mask))) {
+        record_denormals_used(abc_mask, s);
+
+        /* Perform the multiplication step. */
+        FloatPartsW p_widen = { .sign = p_sign, .exp = a->exp + b->exp + 1 };
+        fracN(mulw)(&p_widen, a, b);
+        if (!(p_widen.frac_hi & DECOMPOSED_IMPLICIT_BIT)) {
+            fracW(add)(&p_widen, &p_widen, &p_widen);
+            p_widen.exp -= 1;
+        }
+
+        /* Perform the addition step. */
+        if (!(c_mask & float_cmask_zero)) {
+            /* Zero-extend C to less significant bits. */
+            FloatPartsW c_widen = { .sign = c_sign, .exp = c->exp };
+            fracN(widen)(&c_widen, c);
+
+            if (p_sign == c_sign) {
+                partsW(add_normal)(&p_widen, &c_widen);
+            } else if (!partsW(sub_normal)(&p_widen, &c_widen)) {
+                goto return_sub_zero;
+            }
+        }
+
+        /* Narrow with sticky bit, for proper rounding later. */
+        fracN(truncjam)(a, &p_widen);
+        a->sign = p_widen.sign;
+        a->exp = p_widen.exp;
+        return a;
+    }
 
     /*
      * It is implementation-defined whether the cases of (0,inf,qnan)
@@ -698,97 +734,47 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
         return a;
     }
 
-    if (flags & float_muladd_negate_c) {
-        c->sign ^= 1;
+    if (unlikely(ab_mask == float_cmask_infzero)) {
+        /* Inf * Zero == NaN */
+        float_raise(float_flag_invalid | float_flag_invalid_imz, s);
+        goto d_nan;
     }
 
-    /* Compute the sign of the product into A. */
-    a->sign ^= b->sign;
-    if (flags & float_muladd_negate_product) {
-        a->sign ^= 1;
-    }
-
-    if (unlikely(!cmask_is_only_normals(ab_mask))) {
-        if (unlikely(ab_mask == float_cmask_infzero)) {
-            float_raise(float_flag_invalid | float_flag_invalid_imz, s);
+    if (unlikely(ab_mask & float_cmask_inf)) {
+        if ((c_mask & float_cmask_inf) && p_sign != c_sign) {
+            /* Inf - Inf == NaN */
+            float_raise(float_flag_invalid | float_flag_invalid_isi, s);
             goto d_nan;
         }
-
-        if (ab_mask & float_cmask_inf) {
-            if (c->cls == float_class_inf && a->sign != c->sign) {
-                float_raise(float_flag_invalid | float_flag_invalid_isi, s);
-                goto d_nan;
-            }
-            goto return_inf;
-        }
-
-        g_assert(ab_mask & float_cmask_zero);
-        if (is_anynorm(c->cls)) {
-            *a = *c;
-            goto finish_sign;
-        }
-        if (c->cls == float_class_zero) {
-            if (flags & float_muladd_suppress_add_product_zero) {
-                a->sign = c->sign;
-            } else if (a->sign != c->sign) {
-                goto return_sub_zero;
-            }
-            goto return_zero;
-        }
-        g_assert(c->cls == float_class_inf);
+        /* Inf + C == Inf */
+        record_denormals_used(abc_mask, s);
+        a->sign = p_sign;
+        a->cls = float_class_inf;
+        return a;
     }
-
-    if (unlikely(c->cls == float_class_inf)) {
-        a->sign = c->sign;
-        goto return_inf;
-    }
-
-    /* Perform the multiplication step. */
-    p_widen.sign = a->sign;
-    p_widen.exp = a->exp + b->exp + 1;
-    fracN(mulw)(&p_widen, a, b);
-    if (!(p_widen.frac_hi & DECOMPOSED_IMPLICIT_BIT)) {
-        fracW(add)(&p_widen, &p_widen, &p_widen);
-        p_widen.exp -= 1;
-    }
-
-    /* Perform the addition step. */
-    if (c->cls != float_class_zero) {
-        /* Zero-extend C to less significant bits. */
-        fracN(widen)(&c_widen, c);
-        c_widen.exp = c->exp;
-
-        if (a->sign == c->sign) {
-            partsW(add_normal)(&p_widen, &c_widen);
-        } else if (!partsW(sub_normal)(&p_widen, &c_widen)) {
-            goto return_sub_zero;
-        }
-    }
-
-    /* Narrow with sticky bit, for proper rounding later. */
-    fracN(truncjam)(a, &p_widen);
-    a->sign = p_widen.sign;
-    a->exp = p_widen.exp;
-
- finish_sign:
-    /*
-     * All result types except for "return the default NaN
-     * because this is an Invalid Operation" go through here;
-     * this matches the set of cases where we consumed a
-     * denormal input.
-     */
     record_denormals_used(abc_mask, s);
-    return a;
+
+    /* Only remaining cases are zero product or inf addend. */
+    assert((ab_mask & float_cmask_zero) | (c_mask & float_cmask_inf));
+
+    /*
+     * P + Inf == Inf, or
+     * 0 + C == C,
+     * except for 0 - 0, which needs special rounding,
+     * except for when we want to suppress this addition step.
+     */
+    if (!(c_mask & float_cmask_zero)
+        || p_sign == c_sign
+        || (flags & float_muladd_suppress_add_product_zero)) {
+        c->sign = c_sign;
+        return c;
+    }
 
  return_sub_zero:
+    /* 0 - 0 == -0 for round_down, +0 otherwise. */
     a->sign = s->float_rounding_mode == float_round_down;
- return_zero:
     a->cls = float_class_zero;
-    goto finish_sign;
-
- return_inf:
-    a->cls = float_class_inf;
-    goto finish_sign;
+    return a;
 
  d_nan:
     *a = partsN(default_nan)(s);
-- 
2.43.0


