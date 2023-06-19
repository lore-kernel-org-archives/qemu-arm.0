Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2878637ejt;
        Mon, 19 Jun 2023 08:45:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UYTMXrH894VzU4nz0UCfB6/tDjRy0ukKLSbqj6X0Wic1EgdRTzfg11mAwAmRmvjV0bkTN
X-Received: by 2002:a5d:4b07:0:b0:30a:eda0:71c5 with SMTP id v7-20020a5d4b07000000b0030aeda071c5mr6934893wrq.16.1687189504278;
        Mon, 19 Jun 2023 08:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189504; cv=none;
        d=google.com; s=arc-20160816;
        b=d6XhMovlYctcaaC4zctL+dHWUa/+o2KWpjdnbUGL2y4vqbtEhijQI9DoVIF89egKfm
         wdFZk9pHBRn/Rg5S1bcKiepCyw+wKrsMghh6U3rDdEzVLVObr+curjifJYheFmAITTWs
         wDv8tNziyYuJMdCNqMXp64OCna8EYEvx4fgEV3HYjc1l872qE5/0uY35BQhJEJHGofOB
         jVj+bXXx0JyFHqR9VRHe8woVVyFbfhmhIQ5dIWXWZhn+ATwZ/Kqmri5foJcr7IORLCqe
         ZgROgnRO3kE1HkPmxNXhJuTHbV5M1JgmcuCbc9PeZXXPYKtZKTRj7PZPabsP1aWewh4f
         qDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KQ57k58/TJU7GczCU1n00BAj0iap+eCTdOYHiHp6abQ=;
        b=Hu6XwIt4rYc/amdouQbq9O8NQXl9Yxh/iDTfXhai+FW31qDzJS8apZZQHmVjlEUkLC
         XxAK9p2V+h5vbT5S0+1cDmOHvsMUuKVdxcd4BbuXLitEc7zjn0frCuQ4waSiBUSs87L2
         2MJvxM9jN3AC01555hKJwbnoZW9iL4ak3se4OajGeAgnUlkS1S2P7gVZCb50boDaMrZr
         cPpUDMje52Jv/rfPN90/tGdnjd2cAj6qL58lugEP3v3ixnP5N8+Gr6vtUVAo4DuETO4C
         otlKjgraAQCThHGW6gwF7ezWsQCy3VrbAZHuTtxd8yaxR+A5avAyrsMqEZOwVTybdpWc
         YkzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HXDMIWix;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020adfe0c8000000b002de1d9804a9si13093840wri.941.2023.06.19.08.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HXDMIWix;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBH3e-0005lh-JS; Mon, 19 Jun 2023 11:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH3c-0005Nr-8h
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:44:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH3Y-0001Fd-EO
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:44:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30e3caa6aa7so3605590f8f.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687189471; x=1689781471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQ57k58/TJU7GczCU1n00BAj0iap+eCTdOYHiHp6abQ=;
 b=HXDMIWixtD+Vy1ScFBpvBJiIENlQa9X1WAdA8AwSRsHy0W7JlgDHUTQqRPqprDkDcA
 9Ihpot+aOEjP94PYXmoVz2S9eoC2xWTtlWrl4E4pAiKWbIUT7HZUnQ42ueZiyzJpulD+
 ObngMWXaO7AEDqDxO89T5JLlSAly7nycgbmauw+Y6OiL6gWY5nHED08e+ehMVyMydGJL
 NKjBoJEU5NiLFn3SvE/7hi/4DxH29w3MWm7p8VF3vWlPXOQogJtPP0hhNyM3wcDDHiSN
 rGC6Ol/emrliyj0nNDssxBXy5gy5mIwqDcuTtyxsmPd3rDi6XdWaV0pGINkFG54f1k8O
 NrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687189471; x=1689781471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQ57k58/TJU7GczCU1n00BAj0iap+eCTdOYHiHp6abQ=;
 b=gfDnM6+sR4oN/J0HTdIJrHFk78qAL9U5abkhWbJ6brcP6kl627kbddWbDITTPJBsYk
 XvsTgY5cvdu33Q4p+8+RPyrlm5x90W8qhjPfxf3YfRHjpRZrJoJwJpsfOMcgt3rEJXgJ
 Y2P5aLxoZmnABwe+MnmrhMrryHewMj6snnV9wwT2zZstVE53AuEolqyMmnIq/NOwuQqo
 rovvoElV9k4NoM1QqcPsIEzwZ1/0rQlrUlGSj1Xq0KGVhed1tqoUrMs6v5vFORI8HuSP
 Ml1ldwd4KFGi4cUoXQ0atUVMiP7VovpBQVp8cSU6PjdOQhjb0Yh3hpJIl+75O0qWERrN
 m/CQ==
X-Gm-Message-State: AC+VfDzU5CmdkRr84ab5BV16WrDF6fVAoLM7finZoV/OjFD0M1CuxbSY
 8ErHRfuInwCsVI6CJ4wQoWmv1SeTo47f9cl2mgzPHA==
X-Received: by 2002:a5d:6505:0:b0:30f:d2af:d62b with SMTP id
 x5-20020a5d6505000000b0030fd2afd62bmr7809591wru.19.1687189471266; 
 Mon, 19 Jun 2023 08:44:31 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5711000000b003113b3bc9d7sm4281946wrv.32.2023.06.19.08.44.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:44:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/34] target/arm/tcg: Move VFP helpers from helper-a64.c
 to vfp_helper.c
Date: Mon, 19 Jun 2023 17:42:37 +0200
Message-Id: <20230619154302.80350-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: tQYsIoTXLl++

Keep the VFP helpers in the same file, guarding them with #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/helper-a64.c | 87 ----------------------------------
 target/arm/vfp_helper.c     | 93 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 92 insertions(+), 88 deletions(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 1c9370f07b..c43f22e7d4 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -93,93 +93,6 @@ void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
     arm_rebuild_hflags(env);
 }
 
-/* Convert a softfloat float_relation_ (as returned by
- * the float*_compare functions) to the correct ARM
- * NZCV flag state.
- */
-static inline uint32_t float_rel_to_flags(int res)
-{
-    uint64_t flags;
-    switch (res) {
-    case float_relation_equal:
-        flags = PSTATE_Z | PSTATE_C;
-        break;
-    case float_relation_less:
-        flags = PSTATE_N;
-        break;
-    case float_relation_greater:
-        flags = PSTATE_C;
-        break;
-    case float_relation_unordered:
-    default:
-        flags = PSTATE_C | PSTATE_V;
-        break;
-    }
-    return flags;
-}
-
-uint64_t HELPER(vfp_cmph_a64)(uint32_t x, uint32_t y, void *fp_status)
-{
-    return float_rel_to_flags(float16_compare_quiet(x, y, fp_status));
-}
-
-uint64_t HELPER(vfp_cmpeh_a64)(uint32_t x, uint32_t y, void *fp_status)
-{
-    return float_rel_to_flags(float16_compare(x, y, fp_status));
-}
-
-uint64_t HELPER(vfp_cmps_a64)(float32 x, float32 y, void *fp_status)
-{
-    return float_rel_to_flags(float32_compare_quiet(x, y, fp_status));
-}
-
-uint64_t HELPER(vfp_cmpes_a64)(float32 x, float32 y, void *fp_status)
-{
-    return float_rel_to_flags(float32_compare(x, y, fp_status));
-}
-
-uint64_t HELPER(vfp_cmpd_a64)(float64 x, float64 y, void *fp_status)
-{
-    return float_rel_to_flags(float64_compare_quiet(x, y, fp_status));
-}
-
-uint64_t HELPER(vfp_cmped_a64)(float64 x, float64 y, void *fp_status)
-{
-    return float_rel_to_flags(float64_compare(x, y, fp_status));
-}
-
-float32 HELPER(vfp_mulxs)(float32 a, float32 b, void *fpstp)
-{
-    float_status *fpst = fpstp;
-
-    a = float32_squash_input_denormal(a, fpst);
-    b = float32_squash_input_denormal(b, fpst);
-
-    if ((float32_is_zero(a) && float32_is_infinity(b)) ||
-        (float32_is_infinity(a) && float32_is_zero(b))) {
-        /* 2.0 with the sign bit set to sign(A) XOR sign(B) */
-        return make_float32((1U << 30) |
-                            ((float32_val(a) ^ float32_val(b)) & (1U << 31)));
-    }
-    return float32_mul(a, b, fpst);
-}
-
-float64 HELPER(vfp_mulxd)(float64 a, float64 b, void *fpstp)
-{
-    float_status *fpst = fpstp;
-
-    a = float64_squash_input_denormal(a, fpst);
-    b = float64_squash_input_denormal(b, fpst);
-
-    if ((float64_is_zero(a) && float64_is_infinity(b)) ||
-        (float64_is_infinity(a) && float64_is_zero(b))) {
-        /* 2.0 with the sign bit set to sign(A) XOR sign(B) */
-        return make_float64((1ULL << 62) |
-                            ((float64_val(a) ^ float64_val(b)) & (1ULL << 63)));
-    }
-    return float64_mul(a, b, fpst);
-}
-
 /* 64bit/double versions of the neon float compare functions */
 uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, void *fpstp)
 {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 36906db8e0..0a5b2993a4 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1326,4 +1326,95 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
 
-#endif
+#ifdef TARGET_AARCH64
+
+/* Convert a softfloat float_relation_ (as returned by
+ * the float*_compare functions) to the correct ARM
+ * NZCV flag state.
+ */
+static inline uint32_t float_rel_to_flags(int res)
+{
+    uint64_t flags;
+    switch (res) {
+    case float_relation_equal:
+        flags = PSTATE_Z | PSTATE_C;
+        break;
+    case float_relation_less:
+        flags = PSTATE_N;
+        break;
+    case float_relation_greater:
+        flags = PSTATE_C;
+        break;
+    case float_relation_unordered:
+    default:
+        flags = PSTATE_C | PSTATE_V;
+        break;
+    }
+    return flags;
+}
+
+uint64_t HELPER(vfp_cmph_a64)(uint32_t x, uint32_t y, void *fp_status)
+{
+    return float_rel_to_flags(float16_compare_quiet(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmpeh_a64)(uint32_t x, uint32_t y, void *fp_status)
+{
+    return float_rel_to_flags(float16_compare(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmps_a64)(float32 x, float32 y, void *fp_status)
+{
+    return float_rel_to_flags(float32_compare_quiet(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmpes_a64)(float32 x, float32 y, void *fp_status)
+{
+    return float_rel_to_flags(float32_compare(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmpd_a64)(float64 x, float64 y, void *fp_status)
+{
+    return float_rel_to_flags(float64_compare_quiet(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmped_a64)(float64 x, float64 y, void *fp_status)
+{
+    return float_rel_to_flags(float64_compare(x, y, fp_status));
+}
+
+float32 HELPER(vfp_mulxs)(float32 a, float32 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+
+    a = float32_squash_input_denormal(a, fpst);
+    b = float32_squash_input_denormal(b, fpst);
+
+    if ((float32_is_zero(a) && float32_is_infinity(b)) ||
+        (float32_is_infinity(a) && float32_is_zero(b))) {
+        /* 2.0 with the sign bit set to sign(A) XOR sign(B) */
+        return make_float32((1U << 30) |
+                            ((float32_val(a) ^ float32_val(b)) & (1U << 31)));
+    }
+    return float32_mul(a, b, fpst);
+}
+
+float64 HELPER(vfp_mulxd)(float64 a, float64 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+
+    a = float64_squash_input_denormal(a, fpst);
+    b = float64_squash_input_denormal(b, fpst);
+
+    if ((float64_is_zero(a) && float64_is_infinity(b)) ||
+        (float64_is_infinity(a) && float64_is_zero(b))) {
+        /* 2.0 with the sign bit set to sign(A) XOR sign(B) */
+        return make_float64((1ULL << 62) |
+                            ((float64_val(a) ^ float64_val(b)) & (1ULL << 63)));
+    }
+    return float64_mul(a, b, fpst);
+}
+
+#endif /* TARGET_AARCH64 */
+
+#endif /* CONFIG_TCG */
-- 
2.38.1

