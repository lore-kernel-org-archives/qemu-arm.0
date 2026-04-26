Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8CEFF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:48:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzkJ-0000Vr-7D; Sun, 26 Apr 2026 09:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjp-0008Nf-5N
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:34 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjn-0000FR-73
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c76bde70ec9so3669840a12.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210890; x=1777815690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVbA8u7xaM52Ozcb/NCd3ngtR9jQDG2r+JFNdlIlX4Y=;
 b=Kf2WVgWnDknlk+EuTQPl14r+k8luLcC5M2GZPb1jZB/3sZIyfrNip1I+ywI6Sz4X45
 Fv3xwGJ1AfYyo8QhBJlcTwAqoYtNWUx2jEzWR9b+hT6H6VDw93t4gXAv+qJKwqD+YzxP
 lxqHg4TPZha3e1jZ+gpIob5/L80SyL3QHJW7ryPu7BO/S4uSzNClWGeWhvEE04IBr1R1
 i6vzLjEizXXcItkepFNXcF7IiWWHbIuGAiLiWNqdBUa75afZWkiU8jCQCr/CKgqT/iGS
 OrLQNkEATnRk8KChKfn6ci2kz/o1SZZe65o1mHek+l5yswapPaHSTTTcyD+b327geRCD
 4rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210890; x=1777815690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iVbA8u7xaM52Ozcb/NCd3ngtR9jQDG2r+JFNdlIlX4Y=;
 b=YXpUBUXTNIo/q9CH9zXG/koFV7gJaIclzeZm1aBj66JzykY51WHqPySy9zE1OnRvTj
 1EejUIuzWUuMrwXaF3NyPgX4sRBFW2jMtzcIBnDMUCCXOY4pzUqT52A1fc1gPns4qrvl
 giTE0Ncm/9yDte2wkDFIt9S/mAVZ0jcBtTrFu/xsbb6qugYCKiJJ5dymHRw0tSy8t6Zz
 f4LZdQmXJbI3eeuWFMUiCBOGZSKKN6erNGy4QqppT/BHQO5IiB3G6g92VED9YWtXjb+s
 uIAvLCfifcFCz+HfKY7Gj1Nyc5Yt/xHkzTaC0+GlMEUETdb8TUC1lRHw8f7Tf9XgleM4
 DOcg==
X-Gm-Message-State: AOJu0YyhfUMkBoOTwInMQt3dHSTxyK3pNDvGQBKbraozvFfuCnIcwNHl
 raJ7ZpknIFyq9L02Bt2wTadAHP5RfdwbtIJ6m8RJGB+99SrJNFHf1e54zJG+g1iHTs0=
X-Gm-Gg: AeBDievUgi89sLTu/jUObHgA3eN6g0S4YkoFUEvSD6BDIk98OkYTTeeGAN70mstWyT4
 7pNPR9e1DtOCIEqrrdUp77YrSi4+Lh6KXV+9N4lZlV8jeCsizYQ4wqvRxHsz4Tne1aXXk+XoGHJ
 hyyW8jyfEpSYaQcyQR8o/Uz+IqdzA6abtkQKAYcDX+CmLY4qghqd6Ehv90PWvrzytNU0QynyoAZ
 4+WcvVYjyPNBeMxYYDs+3DcZyLMvafLBbyUxB9LBcf5hGYMP2ofDO0znAK4BqFBlJkwibviiSCt
 9EFY4gMFEaq8VSP/SD1OmxSLrvoJ31GvVDQxdApFGw44jfwq5ocvG4YPswwG/mskt8Y4Rk58O2D
 s41pemEMu+QH76J4EKRgEWUqyQnNpKjNlEaiGeDoF96CM6nM9S0jtuF2RmtJ9EPGqUE8sTRL141
 fF6ROwphU1Q2VfrO4FQicnNJJHGXZQpIJobGiFSv8k
X-Received: by 2002:a17:903:390b:b0:2b7:ab49:3c8c with SMTP id
 d9443c01a7336-2b7ab493dffmr141444635ad.7.1777210889771; 
 Sun, 26 Apr 2026 06:41:29 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 31/84] fpu: Constify frac{64,128,256}_* inputs
Date: Sun, 26 Apr 2026 23:39:08 +1000
Message-ID: <20260426134002.865628-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 53 +++++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e462fb7d74..6cca31af30 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -774,12 +774,14 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
 
-static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
+static bool frac64_add(FloatParts64 *r,
+                       const FloatParts64 *a, const FloatParts64 *b)
 {
     return uadd64_overflow(a->frac, b->frac, &r->frac);
 }
 
-static bool frac128_add(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
+static bool frac128_add(FloatParts128 *r,
+                        const FloatParts128 *a, const FloatParts128 *b)
 {
     bool c = 0;
     r->frac_lo = uadd64_carry(a->frac_lo, b->frac_lo, &c);
@@ -787,7 +789,8 @@ static bool frac128_add(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
     return c;
 }
 
-static bool frac256_add(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
+static bool frac256_add(FloatParts256 *r,
+                        const FloatParts256 *a, const FloatParts256 *b)
 {
     bool c = 0;
     r->frac_lo = uadd64_carry(a->frac_lo, b->frac_lo, &c);
@@ -797,12 +800,12 @@ static bool frac256_add(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
     return c;
 }
 
-static bool frac64_addi(FloatParts64 *r, FloatParts64 *a, uint64_t c)
+static bool frac64_addi(FloatParts64 *r, const FloatParts64 *a, uint64_t c)
 {
     return uadd64_overflow(a->frac, c, &r->frac);
 }
 
-static bool frac128_addi(FloatParts128 *r, FloatParts128 *a, uint64_t c)
+static bool frac128_addi(FloatParts128 *r, const FloatParts128 *a, uint64_t c)
 {
     c = uadd64_overflow(a->frac_lo, c, &r->frac_lo);
     return uadd64_overflow(a->frac_hi, c, &r->frac_hi);
@@ -818,14 +821,14 @@ static void frac128_allones(FloatParts128 *a)
     a->frac_hi = a->frac_lo = -1;
 }
 
-static FloatRelation frac64_cmp(FloatParts64 *a, FloatParts64 *b)
+static FloatRelation frac64_cmp(const FloatParts64 *a, const FloatParts64 *b)
 {
     return (a->frac == b->frac ? float_relation_equal
             : a->frac < b->frac ? float_relation_less
             : float_relation_greater);
 }
 
-static FloatRelation frac128_cmp(FloatParts128 *a, FloatParts128 *b)
+static FloatRelation frac128_cmp(const FloatParts128 *a, const FloatParts128 *b)
 {
     uint64_t ta = a->frac_hi, tb = b->frac_hi;
     if (ta == tb) {
@@ -847,7 +850,7 @@ static void frac128_clear(FloatParts128 *a)
     a->frac_hi = a->frac_lo = 0;
 }
 
-static bool frac64_div(FloatParts64 *a, FloatParts64 *b)
+static bool frac64_div(FloatParts64 *a, const FloatParts64 *b)
 {
     uint64_t n1, n0, r, q;
     bool ret;
@@ -879,7 +882,7 @@ static bool frac64_div(FloatParts64 *a, FloatParts64 *b)
     return ret;
 }
 
-static bool frac128_div(FloatParts128 *a, FloatParts128 *b)
+static bool frac128_div(FloatParts128 *a, const FloatParts128 *b)
 {
     uint64_t q0, q1, a0, a1, b0, b1;
     uint64_t r0, r1, r2, r3, t0, t1, t2, t3;
@@ -926,22 +929,24 @@ static bool frac128_div(FloatParts128 *a, FloatParts128 *b)
     return ret;
 }
 
-static bool frac64_eqz(FloatParts64 *a)
+static bool frac64_eqz(const FloatParts64 *a)
 {
     return a->frac == 0;
 }
 
-static bool frac128_eqz(FloatParts128 *a)
+static bool frac128_eqz(const FloatParts128 *a)
 {
     return (a->frac_hi | a->frac_lo) == 0;
 }
 
-static void frac64_mulw(FloatParts128 *r, FloatParts64 *a, FloatParts64 *b)
+static void frac64_mulw(FloatParts128 *r,
+                        const FloatParts64 *a, const FloatParts64 *b)
 {
     mulu64(&r->frac_lo, &r->frac_hi, a->frac, b->frac);
 }
 
-static void frac128_mulw(FloatParts256 *r, FloatParts128 *a, FloatParts128 *b)
+static void frac128_mulw(FloatParts256 *r,
+                         const FloatParts128 *a, const FloatParts128 *b)
 {
     mul128To256(a->frac_hi, a->frac_lo, b->frac_hi, b->frac_lo,
                 &r->frac_hi, &r->frac_hm, &r->frac_lm, &r->frac_lo);
@@ -1041,7 +1046,8 @@ static int frac256_normalize(FloatParts256 *a)
     return ret;
 }
 
-static void frac64_modrem(FloatParts64 *a, FloatParts64 *b, uint64_t *mod_quot)
+static void frac64_modrem(FloatParts64 *a, const FloatParts64 *b,
+                          uint64_t *mod_quot)
 {
     uint64_t a0, a1, b0, t0, t1, q, quot;
     int exp_diff = a->exp - b->exp;
@@ -1124,7 +1130,7 @@ static void frac64_modrem(FloatParts64 *a, FloatParts64 *b, uint64_t *mod_quot)
     a->frac = a0 | (a1 != 0);
 }
 
-static void frac128_modrem(FloatParts128 *a, FloatParts128 *b,
+static void frac128_modrem(FloatParts128 *a, const FloatParts128 *b,
                            uint64_t *mod_quot)
 {
     uint64_t a0, a1, a2, b0, b1, t0, t1, t2, q, quot;
@@ -1353,12 +1359,14 @@ static void frac256_shrjam(FloatParts256 *a, int c)
     a->frac_hi = a0;
 }
 
-static bool frac64_sub(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
+static bool frac64_sub(FloatParts64 *r,
+                       const FloatParts64 *a, const FloatParts64 *b)
 {
     return usub64_overflow(a->frac, b->frac, &r->frac);
 }
 
-static bool frac128_sub(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
+static bool frac128_sub(FloatParts128 *r,
+                        const FloatParts128 *a, const FloatParts128 *b)
 {
     bool c = 0;
     r->frac_lo = usub64_borrow(a->frac_lo, b->frac_lo, &c);
@@ -1366,7 +1374,8 @@ static bool frac128_sub(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
     return c;
 }
 
-static bool frac256_sub(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
+static bool frac256_sub(FloatParts256 *r,
+                        const FloatParts256 *a, const FloatParts256 *b)
 {
     bool c = 0;
     r->frac_lo = usub64_borrow(a->frac_lo, b->frac_lo, &c);
@@ -1376,24 +1385,24 @@ static bool frac256_sub(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
     return c;
 }
 
-static void frac64_truncjam(FloatParts64 *r, FloatParts128 *a)
+static void frac64_truncjam(FloatParts64 *r, const FloatParts128 *a)
 {
     r->frac = a->frac_hi | (a->frac_lo != 0);
 }
 
-static void frac128_truncjam(FloatParts128 *r, FloatParts256 *a)
+static void frac128_truncjam(FloatParts128 *r, const FloatParts256 *a)
 {
     r->frac_hi = a->frac_hi;
     r->frac_lo = a->frac_hm | ((a->frac_lm | a->frac_lo) != 0);
 }
 
-static void frac64_widen(FloatParts128 *r, FloatParts64 *a)
+static void frac64_widen(FloatParts128 *r, const FloatParts64 *a)
 {
     r->frac_hi = a->frac;
     r->frac_lo = 0;
 }
 
-static void frac128_widen(FloatParts256 *r, FloatParts128 *a)
+static void frac128_widen(FloatParts256 *r, const FloatParts128 *a)
 {
     r->frac_hi = a->frac_hi;
     r->frac_hm = a->frac_lo;
-- 
2.43.0


