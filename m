Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp934367njk;
        Fri, 24 Jan 2025 08:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX208hbLEF+aSF65SJrjqNAliaGRTceCQWSzrJdfpznRCSWsLtJDt61B6TBejaEtkjBl3lKDGtPB904sQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGN5ORVRVAX4WAyXUB0rhueLzKrcYMzT9GnRR+GSVnLUZHNyfK5PfNwCU0ceEqFIj70ItBw
X-Received: by 2002:a05:620a:249:b0:7be:6f05:1b2a with SMTP id af79cd13be357-7be6f051d26mr3333900085a.56.1737736915788;
        Fri, 24 Jan 2025 08:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736915; cv=none;
        d=google.com; s=arc-20240605;
        b=GyWRtBsNwIjKOIdDxCNJb2GF5XhM4k8haVCZrX1EGS6V22acQ0BeCzpSRBmiKnEr1g
         jhOOeZ54xI+Ga2S1NYc+ygO64w/+//43CZGQcZ8Tz20NP/9IHhv05yhVwPQJVJn5QoYZ
         mhfx6WmHQVS/4Ze/1fVV10q/ZVwJOK7gQFVkOrRIG2fLPHgN8EsuCEQdaXL8J5MdnAN+
         y5jlQ5PynR9JADB3ge/sjK3OoGxLQRHYNiGa6LjJpGuDM3UR5bisoziWV2kffWXqThOs
         JR6+UTfq8zKWWlkkLaPcK2x+rNDDA4UQlUJHExfxPNNgv9ZrsB0F5+wWCemI85ZiWo1q
         Vmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5fO4yVTzlDdDstDxzaIvCaMWSZoc0FFpHe7FAcMg52A=;
        fh=W0b1NpU6Y6eAX1U4HqSus2P3rfkSNCNQYapJHL/D4xE=;
        b=gQLc3K6HqvICuE+HlLy0lpterjCEEaOcfBAumPpKxrO+yYgMynfNjgdeZW23UUz9CJ
         BdZ6mH8ZoXJmi0YOpCJWF4CZlDEc9vvBa8ESCiFq4ZbrfVGx+jaLNJ5e4QmNV7jLaT3v
         kdPGT2HHAUAlGUA4jlUQO8mAQdaCaeluc53wiUjVzKZcj/kXU81S52qWNmMvH40o/Vmd
         At2tc6wiMnx292p3OOw/NO8+YV4Co4JHyj51+Isa0aU6XQS5tzvDODfndme/RxS4+iU+
         QSkzRWT4/3JmOMJwxXsD7R55iHJn4g5rpHtZG9GyRQBBQutyE/nSug3wVnkbuCzKbTwA
         s5kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEveJLec;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae84582si257909085a.112.2025.01.24.08.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEveJLec;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMe0-0001TW-Kz; Fri, 24 Jan 2025 11:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZE-0005sJ-SJ
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:30:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZB-0005nE-8z
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:30:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso23850535e9.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736195; x=1738340995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5fO4yVTzlDdDstDxzaIvCaMWSZoc0FFpHe7FAcMg52A=;
 b=oEveJLecqsRmkLLdHfBS3JjNMYfkxL19rdvZI47ZbIHz/2cXGqEiUZ0vIGp0e8ToJB
 qu5Z+X2rCf+Wr6+LTLbHKHMv6R5BmFqklqNFVOQEWDoX/RM9JfH8yOl1HVt6ajqexNgK
 PwoIqQSTuJuy9Ex42oQJx5lY/ZDed0VGsgjFol+svxknDeYiPpHLagRnQPF3z3KVtkQd
 Eba7FOFEftH3Yzxrz1a8HaTV4ztyUOfqUd18tWKTLdW0LheJZDrhrkdgU+xpQ8Kn/Xs0
 2Caieio8mxpTw0WaRY9W5fBu53eTXXXK4HBXmnId6FJTCKTcK4R/KJBjSRTrZRLvlJ+3
 tUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736195; x=1738340995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fO4yVTzlDdDstDxzaIvCaMWSZoc0FFpHe7FAcMg52A=;
 b=S1jnb7C9KrnMF0cxiA60FMHMR0tQk3hxi9McuToeNpb2q2O8pOo53nuBxCnsn2/gup
 85osf5BABiN30FHIC5uWnmHR1dhr6m9Fq3L+qDBkfuzKxKyjMqOYabv9QAkQGc3GHpRc
 VbXQwN+jiqPiTnXUx4imHW6PN/uW/7K6pe4mNUJlyq4vFnFbyvPusl5fGlAPnE8FvInk
 dQxCNGXvKGwohVIgtGN9RTOq97ROsDOtO3b267ix0Lb2l6CG9zYMukEgl4alkoUBKVyd
 Z61zLyXTt/O6bUbQjphSud9JHWKjEns7HY5KfB8oGUFTDP0db74cX01IJqNWSOeMvrGY
 FHGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJKYksnucj8hPcQ8qBJs5m9JDSkYmqMEzBT9X3cwGabrGF7AcxNx1iidUxECsSwuDuuBKqS8bKOHae@nongnu.org
X-Gm-Message-State: AOJu0Yz56zcTIGV0uQ+uwPEgaw49YjzM3ApSsgwidYMA6tNsnx2Akwqc
 DQ1IOnB4nS0D980lvLE/jZOy1Xtb9zZr1In4xHNVSaohq9MMAYLwPJ1rbn0xALM=
X-Gm-Gg: ASbGnctne9sKjF2NGwb6/ziLorWt1TFI79GBDakEDV6uvJO6knei2WdXjemsC3nY77F
 jZM+P5rR/or6HF4yzsdZyHU0GscXaCfGx7Rrl/Ivr4g2G2C4EEqG7qmP/PJ6pp8Am5Aoxo5lCGP
 aI/UW5tPnnB9Scnq+FqcUe5JhUjbGOgiCklwd9C4JheoQGOtVRaDeCUhQwjwmeKzfRvfytuqenQ
 AVnOWlGSynLqa64w1DkUO1UkbyALJ2XQYM183RJhSRAjwVw71wsIaYhANBQ0mSoyownguqW23EE
 4OM+fXmWqo4=
X-Received: by 2002:a05:600c:3d06:b0:435:1b:65ee with SMTP id
 5b1f17b1804b1-43891419e16mr246860185e9.24.1737736195184; 
 Fri, 24 Jan 2025 08:29:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 61/76] target/arm: Handle FPCR.AH in FRECPS and FRSQRTS scalar
 insns
Date: Fri, 24 Jan 2025 16:28:21 +0000
Message-Id: <20250124162836.2332150-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: NE6zSPbUo2kZ

Handle the FPCR.AH semantics that we do not change the sign of an
input NaN in the FRECPS and FRSQRTS scalar insns, by providing
new helper functions that do the CHS part of the operation
differently.

Since the extra helper functions would be very repetitive if written
out longhand, we condense them and the existing non-AH helpers into
being emitted via macros.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-a64.h    |   6 ++
 target/arm/tcg/helper-a64.c    | 128 ++++++++++++++-------------------
 target/arm/tcg/translate-a64.c |  25 +++++--
 3 files changed, 78 insertions(+), 81 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index ae0424f6de9..85023465b76 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -38,9 +38,15 @@ DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, fpst)
 DEF_HELPER_FLAGS_3(recpsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
 DEF_HELPER_FLAGS_3(recpsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
 DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
+DEF_HELPER_FLAGS_3(recpsf_ah_f16, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(recpsf_ah_f32, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
+DEF_HELPER_FLAGS_3(recpsf_ah_f64, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
 DEF_HELPER_FLAGS_3(rsqrtsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
 DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
 DEF_HELPER_FLAGS_3(rsqrtsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
+DEF_HELPER_FLAGS_3(rsqrtsf_ah_f16, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(rsqrtsf_ah_f32, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
+DEF_HELPER_FLAGS_3(rsqrtsf_ah_f64, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
 DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, fpst)
 DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, fpst)
 DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, fpst)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 406d76e1129..ba21efd0bb0 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -208,88 +208,66 @@ uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, float_status *fpst)
     return -float64_lt(b, a, fpst);
 }
 
-/* Reciprocal step and sqrt step. Note that unlike the A32/T32
+static float16 float16_ah_chs(float16 a)
+{
+    return float16_is_any_nan(a) ? a : float16_chs(a);
+}
+
+static float32 float32_ah_chs(float32 a)
+{
+    return float32_is_any_nan(a) ? a : float32_chs(a);
+}
+
+static float64 float64_ah_chs(float64 a)
+{
+    return float64_is_any_nan(a) ? a : float64_chs(a);
+}
+/*
+ * Reciprocal step and sqrt step. Note that unlike the A32/T32
  * versions, these do a fully fused multiply-add or
  * multiply-add-and-halve.
+ * The FPCR.AH == 1 versions need to avoid flipping the sign of NaN.
  */
-
-uint32_t HELPER(recpsf_f16)(uint32_t a, uint32_t b, float_status *fpst)
-{
-    a = float16_squash_input_denormal(a, fpst);
-    b = float16_squash_input_denormal(b, fpst);
-
-    a = float16_chs(a);
-    if ((float16_is_infinity(a) && float16_is_zero(b)) ||
-        (float16_is_infinity(b) && float16_is_zero(a))) {
-        return float16_two;
+#define DO_RECPS(NAME, CTYPE, FLOATTYPE, CHSFN)                         \
+    CTYPE HELPER(NAME)(CTYPE a, CTYPE b, float_status *fpst)            \
+    {                                                                   \
+        a = FLOATTYPE ## _squash_input_denormal(a, fpst);               \
+        b = FLOATTYPE ## _squash_input_denormal(b, fpst);               \
+        a = FLOATTYPE ## _ ## CHSFN(a);                                 \
+        if ((FLOATTYPE ## _is_infinity(a) && FLOATTYPE ## _is_zero(b)) || \
+            (FLOATTYPE ## _is_infinity(b) && FLOATTYPE ## _is_zero(a))) { \
+            return FLOATTYPE ## _two;                                   \
+        }                                                               \
+        return FLOATTYPE ## _muladd(a, b, FLOATTYPE ## _two, 0, fpst);  \
     }
-    return float16_muladd(a, b, float16_two, 0, fpst);
-}
 
-float32 HELPER(recpsf_f32)(float32 a, float32 b, float_status *fpst)
-{
-    a = float32_squash_input_denormal(a, fpst);
-    b = float32_squash_input_denormal(b, fpst);
+DO_RECPS(recpsf_f16, uint32_t, float16, chs)
+DO_RECPS(recpsf_f32, float32, float32, chs)
+DO_RECPS(recpsf_f64, float64, float64, chs)
+DO_RECPS(recpsf_ah_f16, uint32_t, float16, ah_chs)
+DO_RECPS(recpsf_ah_f32, float32, float32, ah_chs)
+DO_RECPS(recpsf_ah_f64, float64, float64, ah_chs)
 
-    a = float32_chs(a);
-    if ((float32_is_infinity(a) && float32_is_zero(b)) ||
-        (float32_is_infinity(b) && float32_is_zero(a))) {
-        return float32_two;
-    }
-    return float32_muladd(a, b, float32_two, 0, fpst);
-}
+#define DO_RSQRTSF(NAME, CTYPE, FLOATTYPE, CHSFN)                       \
+    CTYPE HELPER(NAME)(CTYPE a, CTYPE b, float_status *fpst)            \
+    {                                                                   \
+        a = FLOATTYPE ## _squash_input_denormal(a, fpst);               \
+        b = FLOATTYPE ## _squash_input_denormal(b, fpst);               \
+        a = FLOATTYPE ## _ ## CHSFN(a);                                 \
+        if ((FLOATTYPE ## _is_infinity(a) && FLOATTYPE ## _is_zero(b)) || \
+            (FLOATTYPE ## _is_infinity(b) && FLOATTYPE ## _is_zero(a))) { \
+            return FLOATTYPE ## _one_point_five;                        \
+        }                                                               \
+        return FLOATTYPE ## _muladd_scalbn(a, b, FLOATTYPE ## _three,   \
+                                           -1, 0, fpst);                \
+    }                                                                   \
 
-float64 HELPER(recpsf_f64)(float64 a, float64 b, float_status *fpst)
-{
-    a = float64_squash_input_denormal(a, fpst);
-    b = float64_squash_input_denormal(b, fpst);
-
-    a = float64_chs(a);
-    if ((float64_is_infinity(a) && float64_is_zero(b)) ||
-        (float64_is_infinity(b) && float64_is_zero(a))) {
-        return float64_two;
-    }
-    return float64_muladd(a, b, float64_two, 0, fpst);
-}
-
-uint32_t HELPER(rsqrtsf_f16)(uint32_t a, uint32_t b, float_status *fpst)
-{
-    a = float16_squash_input_denormal(a, fpst);
-    b = float16_squash_input_denormal(b, fpst);
-
-    a = float16_chs(a);
-    if ((float16_is_infinity(a) && float16_is_zero(b)) ||
-        (float16_is_infinity(b) && float16_is_zero(a))) {
-        return float16_one_point_five;
-    }
-    return float16_muladd_scalbn(a, b, float16_three, -1, 0, fpst);
-}
-
-float32 HELPER(rsqrtsf_f32)(float32 a, float32 b, float_status *fpst)
-{
-    a = float32_squash_input_denormal(a, fpst);
-    b = float32_squash_input_denormal(b, fpst);
-
-    a = float32_chs(a);
-    if ((float32_is_infinity(a) && float32_is_zero(b)) ||
-        (float32_is_infinity(b) && float32_is_zero(a))) {
-        return float32_one_point_five;
-    }
-    return float32_muladd_scalbn(a, b, float32_three, -1, 0, fpst);
-}
-
-float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, float_status *fpst)
-{
-    a = float64_squash_input_denormal(a, fpst);
-    b = float64_squash_input_denormal(b, fpst);
-
-    a = float64_chs(a);
-    if ((float64_is_infinity(a) && float64_is_zero(b)) ||
-        (float64_is_infinity(b) && float64_is_zero(a))) {
-        return float64_one_point_five;
-    }
-    return float64_muladd_scalbn(a, b, float64_three, -1, 0, fpst);
-}
+DO_RSQRTSF(rsqrtsf_f16, uint32_t, float16, chs)
+DO_RSQRTSF(rsqrtsf_f32, float32, float32, chs)
+DO_RSQRTSF(rsqrtsf_f64, float64, float64, chs)
+DO_RSQRTSF(rsqrtsf_ah_f16, uint32_t, float16, ah_chs)
+DO_RSQRTSF(rsqrtsf_ah_f32, float32, float32, ah_chs)
+DO_RSQRTSF(rsqrtsf_ah_f64, float64, float64, ah_chs)
 
 /* Floating-point reciprocal exponent - see FPRecpX in ARM ARM */
 uint32_t HELPER(frecpx_f16)(uint32_t a, float_status *fpst)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e22c2a148ab..977a1589e53 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5250,11 +5250,12 @@ static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f,
                                        FPST_FPCR_F16_A64 : FPST_FPCR_A64);
 }
 
-static bool do_fp3_scalar_ah(DisasContext *s, arg_rrr_e *a, const FPScalar *f,
-                             int mergereg)
+static bool do_fp3_scalar_ah_2fn(DisasContext *s, arg_rrr_e *a,
+                                 const FPScalar *fnormal, const FPScalar *fah,
+                                 int mergereg)
 {
-    return do_fp3_scalar_with_fpsttype(s, a, f, mergereg,
-                                       select_fpst(s, a->esz));
+    return do_fp3_scalar_with_fpsttype(s, a, s->fpcr_ah ? fah : fnormal,
+                                       mergereg, select_fpst(s, a->esz));
 }
 
 /* Some insns need to call different helpers when FPCR.AH == 1 */
@@ -5475,14 +5476,26 @@ static const FPScalar f_scalar_frecps = {
     gen_helper_recpsf_f32,
     gen_helper_recpsf_f64,
 };
-TRANS(FRECPS_s, do_fp3_scalar_ah, a, &f_scalar_frecps, a->rn)
+static const FPScalar f_scalar_ah_frecps = {
+    gen_helper_recpsf_ah_f16,
+    gen_helper_recpsf_ah_f32,
+    gen_helper_recpsf_ah_f64,
+};
+TRANS(FRECPS_s, do_fp3_scalar_ah_2fn, a,
+      &f_scalar_frecps, &f_scalar_ah_frecps, a->rn)
 
 static const FPScalar f_scalar_frsqrts = {
     gen_helper_rsqrtsf_f16,
     gen_helper_rsqrtsf_f32,
     gen_helper_rsqrtsf_f64,
 };
-TRANS(FRSQRTS_s, do_fp3_scalar_ah, a, &f_scalar_frsqrts, a->rn)
+static const FPScalar f_scalar_ah_frsqrts = {
+    gen_helper_rsqrtsf_ah_f16,
+    gen_helper_rsqrtsf_ah_f32,
+    gen_helper_rsqrtsf_ah_f64,
+};
+TRANS(FRSQRTS_s, do_fp3_scalar_ah_2fn, a,
+      &f_scalar_frsqrts, &f_scalar_ah_frsqrts, a->rn)
 
 static bool do_fcmp0_s(DisasContext *s, arg_rr_e *a,
                        const FPScalar *f, bool swap)
-- 
2.34.1

