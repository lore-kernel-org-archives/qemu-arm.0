Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2156549njk;
        Sun, 1 Dec 2024 07:20:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAJb1JDkuVa6BMsfhqEj7PfRc9tVGZDJzZQ3w3eI9jQeYaMbZaqH5OHpFIUFM0qPVnjjhdNWZnnMrwXg==@linaro.org
X-Google-Smtp-Source: AGHT+IHDCurNPmacDL9rQ8L9NqR2zeDiOp2DqQLsRMjvSGFA5wP56K3FPRGWIs4lxlD3G+CgjRP7
X-Received: by 2002:a05:6214:500d:b0:6d4:1a42:8efa with SMTP id 6a1803df08f44-6d864bf0cc7mr298138386d6.0.1733066418573;
        Sun, 01 Dec 2024 07:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066418; cv=none;
        d=google.com; s=arc-20240605;
        b=d9+CIu5BV+NEcFHydbriKX0yURBhwtp5O5pEe3+CbEI/ffFaKGqrFZb0ifZIwmrcZV
         Cez4f1O1csBd/ysIEK51FfFHBtliM0tjPC+4TcZSG2Hpz0DvojQ7Wne7mXx2K++MbWEe
         Kpx/SVlOeuPnQfg7Y9KBKDe6cNdlOX6NsL+ozcWSizxTzg2EoECYHfJOgMpb0DPMXx8X
         LfH3DU6/WdyuWZbGLjuFFsAITXvC6I7ezwD5+nkw665Xta13P4oXI1K4Pyu/6TxH8fIn
         xBitbQkMOo5BvI1+2PvBex61yCtxbKl5+jOWBJa2yKHxSoif9DegoW/zKyH+FZiRU+zM
         SrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c+x7qH1wlW8BOpAaX7AAnNN7RkGDjAie14gyzY0f9rA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=klAFhRnQYzeEhBCxfQJagzpwP9W990qFkdR4WJwmeO5k2eqGjLpBJw8V+z8Bcmlcxl
         jgysRL992gzprpizq5rpV2n97Vtnkyf+Zs0CUb7NCxmPR7HvnhL6k0QokllRZWflQxQC
         P2I2+kv8E2uuPOhp3QDR5G6cGSDQNLjFyXWXATKXdSmE7lHoZ8T0IkmvFZFNwOsyEx/E
         N6UHyjWQncPZ0IBPURcYA2Un3blSkGTQZwTjRxPLG23NsYlx8nEZXP9Hi8dsCC5qfO2B
         7quRCVusebs2Pth92Z2q2aWINkSYKPWGhUxAP5uBpV70xk6MJ3NmFwgCGSYetQAcTOig
         H8IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hKX/GMKF";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d87fa63b0dsi78119706d6.453.2024.12.01.07.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hKX/GMKF";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlaV-0008CZ-Le; Sun, 01 Dec 2024 10:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaF-0007u5-RL
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:10:04 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaB-00057M-5E
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:10:01 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5f1ecd0d9ecso1457177eaf.1
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065798; x=1733670598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+x7qH1wlW8BOpAaX7AAnNN7RkGDjAie14gyzY0f9rA=;
 b=hKX/GMKF+F1+GUmA6T87KjmzdZM23vwdHVlfwWfALcKwEJj+eRwK9XnxYEk4Ku8pnj
 q0D2wMbeGEhCYUp3IK15f1PBGC72x3a13hCzi7TAfBR/um2oBfhva1UQaeP85w/bEqSj
 qcOAEEj4DZpSREudr+Sz7wR0pa2QKBWKH+Uk3uypZG2KNXh5jbAv4G+0txheDYCLgaDI
 KZdayxfe45A55a9hY5XudWbtq+sQ9MkxgPrUdrBDe2Ns21X1s0WQyOT3WI5Rfd0oc2Uk
 PBH0GYG9TJTMk3nTZqD6cw4y62vwCkPieXLN7ADNQ1e4P7X23ofXEEdMwQ5dRSkEzUlD
 gF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065798; x=1733670598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+x7qH1wlW8BOpAaX7AAnNN7RkGDjAie14gyzY0f9rA=;
 b=RgGHYqOAhAU+KE6mb0L/gQomKA/u2IAf6/mdNFTYCd5oNZ/H1Qi0SkeByFGwvJXhG5
 52LhkrXk3blVKSd8oK3yMfQVJ0GEiuoxqLzxgfepqRYwq1xfaIGI/yJtg9/Es2ei2IH/
 VLwhf4X44nKZ8t3xvbGJTbPFAc50yN/WwHh6eU3zHZagZmM+tuGiH+zvNDBE072FuTUo
 e4ii9E2AP6LnljNVKlJ3nFkusDmFSovc/smMHIa1WtxLNureMIP2LzaMXR9KTH8+GcY8
 ufFnmFOz4y5FAHkJ5qVwf44T8v+ks3JLmKKO/lk8WvfYKkOjhKP7x6IjKHneEQMsWqj7
 b1YQ==
X-Gm-Message-State: AOJu0YxkNczzsbXoT+ydjFVyXbPHizGqITUnohseqUCnS6ZoxloyJnej
 7AB75Rqp0nLuEHVzmODWE8ijpK7hqy4bjUHkZd2/qhui/sZPyBbhZ8Y6O1nvYuAVUPXeovvd8ji
 CIEg=
X-Gm-Gg: ASbGncso38/6qfVN449/03bnLvfbijTdgjDbvggNOOdVeMna5+UdQwyfO9sTBIQh8rv
 QGyto2BhNt/+Mfcmt7MsVdtFmpQwt1v8DAhu7nKbQ1Bq3DxiDOpxAu/zDRf9aCrKkIJBIRjTHen
 ZvJRCCiwIZiKy4rI/SskgDRoL25FHsAC14lvc0598fKm/YQgm4/5E+OgfDZQ3eZlmJJ6njRKfXs
 W/2RNcChSzh6GFNnulLXam90SlhGby3HbfFTTy0X+aKlZptBBbZQbbt2uLLZHUIxraXsP2UuRW3
 XvwyuSi9hr4SwPlHhNQpWQuDyujHP1G83aMR
X-Received: by 2002:a05:6820:169e:b0:5ee:e899:3654 with SMTP id
 006d021491bc7-5f20a12dfd6mr12209900eaf.2.1733065798052; 
 Sun, 01 Dec 2024 07:09:58 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:09:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 43/67] target/arm: Move helper_neon_addlp_{s8,
 s16} to neon_helper.c
Date: Sun,  1 Dec 2024 09:05:42 -0600
Message-ID: <20241201150607.12812-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +UZbAa2cq0+c

Move from helper-a64.c to neon_helper.c so that these
functions are available for arm32 code as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h          |  2 ++
 target/arm/tcg/helper-a64.h  |  2 --
 target/arm/tcg/helper-a64.c  | 43 ------------------------------------
 target/arm/tcg/neon_helper.c | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 167e331a83..57e0ce387b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -399,6 +399,8 @@ DEF_HELPER_2(neon_addl_u16, i64, i64, i64)
 DEF_HELPER_2(neon_addl_u32, i64, i64, i64)
 DEF_HELPER_2(neon_paddl_u16, i64, i64, i64)
 DEF_HELPER_2(neon_paddl_u32, i64, i64, i64)
+DEF_HELPER_FLAGS_1(neon_addlp_s8, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_1(neon_addlp_s16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_2(neon_subl_u16, i64, i64, i64)
 DEF_HELPER_2(neon_subl_u32, i64, i64, i64)
 DEF_HELPER_3(neon_addl_saturate_s32, i64, env, i64, i64)
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 203b7b7ac8..f811bb85dc 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -41,9 +41,7 @@ DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_1(neon_addlp_s8, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(neon_addlp_u8, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(neon_addlp_s16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(neon_addlp_u16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 3f4d7b9aba..9b3c407be3 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -306,39 +306,6 @@ float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, void *fpstp)
     return float64_muladd(a, b, float64_three, float_muladd_halve_result, fpst);
 }
 
-/* Pairwise long add: add pairs of adjacent elements into
- * double-width elements in the result (eg _s8 is an 8x8->16 op)
- */
-uint64_t HELPER(neon_addlp_s8)(uint64_t a)
-{
-    uint64_t nsignmask = 0x0080008000800080ULL;
-    uint64_t wsignmask = 0x8000800080008000ULL;
-    uint64_t elementmask = 0x00ff00ff00ff00ffULL;
-    uint64_t tmp1, tmp2;
-    uint64_t res, signres;
-
-    /* Extract odd elements, sign extend each to a 16 bit field */
-    tmp1 = a & elementmask;
-    tmp1 ^= nsignmask;
-    tmp1 |= wsignmask;
-    tmp1 = (tmp1 - nsignmask) ^ wsignmask;
-    /* Ditto for the even elements */
-    tmp2 = (a >> 8) & elementmask;
-    tmp2 ^= nsignmask;
-    tmp2 |= wsignmask;
-    tmp2 = (tmp2 - nsignmask) ^ wsignmask;
-
-    /* calculate the result by summing bits 0..14, 16..22, etc,
-     * and then adjusting the sign bits 15, 23, etc manually.
-     * This ensures the addition can't overflow the 16 bit field.
-     */
-    signres = (tmp1 ^ tmp2) & wsignmask;
-    res = (tmp1 & ~wsignmask) + (tmp2 & ~wsignmask);
-    res ^= signres;
-
-    return res;
-}
-
 uint64_t HELPER(neon_addlp_u8)(uint64_t a)
 {
     uint64_t tmp;
@@ -348,16 +315,6 @@ uint64_t HELPER(neon_addlp_u8)(uint64_t a)
     return tmp;
 }
 
-uint64_t HELPER(neon_addlp_s16)(uint64_t a)
-{
-    int32_t reslo, reshi;
-
-    reslo = (int32_t)(int16_t)a + (int32_t)(int16_t)(a >> 16);
-    reshi = (int32_t)(int16_t)(a >> 32) + (int32_t)(int16_t)(a >> 48);
-
-    return (uint32_t)reslo | (((uint64_t)reshi) << 32);
-}
-
 uint64_t HELPER(neon_addlp_u16)(uint64_t a)
 {
     uint64_t tmp;
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 4e501925de..b92ddd4914 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -866,6 +866,49 @@ uint64_t HELPER(neon_paddl_u32)(uint64_t a, uint64_t b)
     return low + ((uint64_t)high << 32);
 }
 
+/* Pairwise long add: add pairs of adjacent elements into
+ * double-width elements in the result (eg _s8 is an 8x8->16 op)
+ */
+uint64_t HELPER(neon_addlp_s8)(uint64_t a)
+{
+    uint64_t nsignmask = 0x0080008000800080ULL;
+    uint64_t wsignmask = 0x8000800080008000ULL;
+    uint64_t elementmask = 0x00ff00ff00ff00ffULL;
+    uint64_t tmp1, tmp2;
+    uint64_t res, signres;
+
+    /* Extract odd elements, sign extend each to a 16 bit field */
+    tmp1 = a & elementmask;
+    tmp1 ^= nsignmask;
+    tmp1 |= wsignmask;
+    tmp1 = (tmp1 - nsignmask) ^ wsignmask;
+    /* Ditto for the even elements */
+    tmp2 = (a >> 8) & elementmask;
+    tmp2 ^= nsignmask;
+    tmp2 |= wsignmask;
+    tmp2 = (tmp2 - nsignmask) ^ wsignmask;
+
+    /* calculate the result by summing bits 0..14, 16..22, etc,
+     * and then adjusting the sign bits 15, 23, etc manually.
+     * This ensures the addition can't overflow the 16 bit field.
+     */
+    signres = (tmp1 ^ tmp2) & wsignmask;
+    res = (tmp1 & ~wsignmask) + (tmp2 & ~wsignmask);
+    res ^= signres;
+
+    return res;
+}
+
+uint64_t HELPER(neon_addlp_s16)(uint64_t a)
+{
+    int32_t reslo, reshi;
+
+    reslo = (int32_t)(int16_t)a + (int32_t)(int16_t)(a >> 16);
+    reshi = (int32_t)(int16_t)(a >> 32) + (int32_t)(int16_t)(a >> 48);
+
+    return (uint32_t)reslo | (((uint64_t)reshi) << 32);
+}
+
 uint64_t HELPER(neon_subl_u16)(uint64_t a, uint64_t b)
 {
     uint64_t mask;
-- 
2.43.0

