Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1145456njb;
        Sat, 1 Feb 2025 08:48:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvtoUWbNoYNgM5zP4xMC0J6Qb7evkKJc7Wqg2AkpI2kyoU0Zqh3f02cJGajwlY30PkhnrO2vQGrAqJ8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF70E1OLIJKut4aO553vcS3WJrtx9+ZXST7HXrzi4eDNAencnRLRdYQ/pF2NFtZPkWhRFNn
X-Received: by 2002:a05:622a:1e8a:b0:46d:faa2:b6d1 with SMTP id d75a77b69052e-46fd0a9dc93mr282129691cf.16.1738428498110;
        Sat, 01 Feb 2025 08:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428498; cv=none;
        d=google.com; s=arc-20240605;
        b=UBrsJLTrSGasnW9pgBQE8Im4H+zO1Mviz2lI2Njm1pNZ+53G4zPuPSJvSKu5NTJLNM
         lPi8rTR8MWA+H/w+noUWXuPb9fsdaDbOZoEMlPvdCoLd2SRyrC1r1ve892+6EGWlOPyB
         Q0l5UGi0ea7dWY+OcpChjRmVYY8zKTIh8eQ2FiOiGC438pDGHRiin/ePuBZvcBdRKx8e
         8wG1ATvh8iIm7+zLDbOKl0eBmG9I6iVcwPLUtchuuffdO/BZgvMFg5zu0iG0xawJTKE4
         wt7MGZ5rUm4Od2T0LnU6uY0EgW4WXvA5l8I5WQKzWqyxZxQlOPvhROOEQY9ULJSXP/lH
         HHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LvouebXgAmh9MnCCB4e/qopj9nP+KT21pPolqZOZc0o=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eoTcZxH627NoL0ehllFpOuIPfDR/SqucA4Spx3xUo3eUmzvHlTHzBgiXIjUIQSOQiY
         GFd7TIgoTlmvi9q1T9T2LgiTidnsvJflqbnCD7nFwgqnc148FlgwKsSv8mkDfINxcCv2
         ocj8RMPEGpHS++3HRpfKS0VXEZahjbeK9+FrGon9QhSHEe+3I2wWJI4/+qIEuCJMPabl
         Z6AJEaXkgKqLtB7u+uxcTUMZzlEM7eTUICrs9GHWKIcxb4BfuvSS+e/O1o6YGZ64IiB+
         hhdP8X040uVbRbduxStAI61siX3tpv2tRkCOOhDAbB0Ri2zLKR5yJwjxANcbPIatibO+
         Ct9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eJXG5D3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0aba19si59623861cf.64.2025.02.01.08.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:48:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eJXG5D3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYR-0006lP-Ve; Sat, 01 Feb 2025 11:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYN-0006cw-Nu
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:07 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYL-0001EH-Rw
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4368a293339so34935555e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428064; x=1739032864; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LvouebXgAmh9MnCCB4e/qopj9nP+KT21pPolqZOZc0o=;
 b=eJXG5D3cu4x53i5kFWV5wPmJOHDaljjVLy1/Q5KqJt9CnT1DgFfOU8ICpo4f/2bNwX
 Ij5x6G48y89IC0uIYLddBiTw1ReqWq+Op6MtxjhBkcymy+9M5AdualvxC9W+KbAUin2t
 dwkeancKyjFtn8ZrZZiLuhrYZ5po7Ggc2lx97LrU7AbHkYCamTsKqbIZuko2JFxNVDk6
 IhJaMt1Z/tW27J3opRW6rf3g/uLuQT8dvX+CLy6VbM2rfXMcegLtDUHBzifkaXLCZSex
 4jm2W7mzPr4qQN1ZH3PygvJyZAqqBOOlFT93sY7yh+6pKsrevkm0tbLzh1POcO7kGfIG
 LTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428064; x=1739032864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvouebXgAmh9MnCCB4e/qopj9nP+KT21pPolqZOZc0o=;
 b=SY6I/ALOeoiJE8eeJtQyibJOhmpG+oZq/Lc71TpnUvASg7OR+JnLGFvsRvoGp00qMw
 oLkfg/3F9mCd/L/mvKIojGGLXnUyMHoK+iNaSZNS6mWOyUjF3m4Y9tLk2QcJSnz9ji4+
 kob16UQm6DK0WDeng/Gf0dQBeM6t/bEzlS/jKq0yd62cG7ctDQU6kA+CnySpTJikPGjU
 OLPOCD/PaEER5zvoMcPk/YJ36b5cr5t7jc+Ed0YgGPA/bw0/77naYHI2umNmvnAge49f
 BuagwrdEi+BIKJn4gqyZzCUgzeSQ0RwYvsfCRlo98s1nZMBnBfYBG36D5UeCy5g/KAKs
 MUCg==
X-Gm-Message-State: AOJu0YxI1Z1jXr57B2dNRcc/AC8DoZZWu1UmYnNY9xWYYxePEt7VXPji
 jzTyD1CVy3FZ4u5kySOBvWwX27Dd4N95dUrd+3GIdh410gVv8l21gtWlLkTlMpik3KvyPl8yVll
 A
X-Gm-Gg: ASbGnct9H/ZyNGFh5Zk1PBuSG6PIJIKC2z4GF9V/q97wXS/0z2EWUA5G0K7A379d00a
 UH+swzKtTTnE1edW1iFEBBbyQHwzDvPegtnHjFVnWW3TUAdIqpVAI+pmNZ9RcxlrRXZVAPDiTD2
 aBs76JxEMOTObD7IQooNfXrRbduhjf0plTNxieFWyYlKH6nIlRxdy/y3IyGLBGFz/2F0VwxG2Oj
 fVjXLgz0Mqt/xlNQoSz14mivZTnOFjkKiIL6P1U4QMuiXKIVjjM+CxPnzfp4W7FQMoKIC2r9GbU
 OIBEQALKN6l+kXUNuZMH
X-Received: by 2002:a05:600c:1f10:b0:435:192:63fb with SMTP id
 5b1f17b1804b1-438dc3ae816mr129087045e9.3.1738428064277; 
 Sat, 01 Feb 2025 08:41:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 37/69] target/arm: Handle FPCR.AH in negation steps in SVE
 FCADD
Date: Sat,  1 Feb 2025 16:39:40 +0000
Message-Id: <20250201164012.1660228-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: hNnotLvWJCyn

The negation steps in FCADD must honour FPCR.AH's "don't change the
sign of a NaN" semantics.  Implement this in the same way we did for
the base ASIMD FCADD, by encoding FPCR.AH into the SIMD data field
passed to the helper and using that to decide whether to negate the
values.

The construction of neg_imag and neg_real were done to make it easy
to apply both in parallel with two simple logical operations.  This
changed with FPCR.AH, which is more complex than that. Switch to
an approach that follows the pseudocode more closely, by extracting
the 'rot=1' parameter from the SIMD data field and changing the
sign of the appropriate input value.

Note that there was a naming issue with neg_imag and neg_real.
They were named backward, with neg_imag being non-zero for rot=1,
and vice versa.  This was combined with reversed usage within the
loop, so that the negation in the end turned out correct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2: Squashed in changes from RTH's patchset
---
 target/arm/tcg/vec_internal.h  | 17 ++++++++++++++
 target/arm/tcg/sve_helper.c    | 42 ++++++++++++++++++++++++----------
 target/arm/tcg/translate-sve.c |  2 +-
 3 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 094f5c169ca..826791523a6 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -20,6 +20,8 @@
 #ifndef TARGET_ARM_VEC_INTERNAL_H
 #define TARGET_ARM_VEC_INTERNAL_H
 
+#include "fpu/softfloat.h"
+
 /*
  * Note that vector data is stored in host-endian 64-bit chunks,
  * so addressing units smaller than that needs a host-endian fixup.
@@ -265,4 +267,19 @@ float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2,
  */
 bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp);
 
+static inline float16 float16_maybe_ah_chs(float16 a, bool fpcr_ah)
+{
+    return fpcr_ah && float16_is_any_nan(a) ? a : float16_chs(a);
+}
+
+static inline float32 float32_maybe_ah_chs(float32 a, bool fpcr_ah)
+{
+    return fpcr_ah && float32_is_any_nan(a) ? a : float32_chs(a);
+}
+
+static inline float64 float64_maybe_ah_chs(float64 a, bool fpcr_ah)
+{
+    return fpcr_ah && float64_is_any_nan(a) ? a : float64_chs(a);
+}
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 8527a7495a6..770945a2c6a 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5131,8 +5131,8 @@ void HELPER(sve_fcadd_h)(void *vd, void *vn, void *vm, void *vg,
 {
     intptr_t j, i = simd_oprsz(desc);
     uint64_t *g = vg;
-    float16 neg_imag = float16_set_sign(0, simd_data(desc));
-    float16 neg_real = float16_chs(neg_imag);
+    bool rot = extract32(desc, SIMD_DATA_SHIFT, 1);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
 
     do {
         uint64_t pg = g[(i - 1) >> 6];
@@ -5144,9 +5144,15 @@ void HELPER(sve_fcadd_h)(void *vd, void *vn, void *vm, void *vg,
             i -= 2 * sizeof(float16);
 
             e0 = *(float16 *)(vn + H1_2(i));
-            e1 = *(float16 *)(vm + H1_2(j)) ^ neg_real;
+            e1 = *(float16 *)(vm + H1_2(j));
             e2 = *(float16 *)(vn + H1_2(j));
-            e3 = *(float16 *)(vm + H1_2(i)) ^ neg_imag;
+            e3 = *(float16 *)(vm + H1_2(i));
+
+            if (rot) {
+                e3 = float16_maybe_ah_chs(e3, fpcr_ah);
+            } else {
+                e1 = float16_maybe_ah_chs(e1, fpcr_ah);
+            }
 
             if (likely((pg >> (i & 63)) & 1)) {
                 *(float16 *)(vd + H1_2(i)) = float16_add(e0, e1, s);
@@ -5163,8 +5169,8 @@ void HELPER(sve_fcadd_s)(void *vd, void *vn, void *vm, void *vg,
 {
     intptr_t j, i = simd_oprsz(desc);
     uint64_t *g = vg;
-    float32 neg_imag = float32_set_sign(0, simd_data(desc));
-    float32 neg_real = float32_chs(neg_imag);
+    bool rot = extract32(desc, SIMD_DATA_SHIFT, 1);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
 
     do {
         uint64_t pg = g[(i - 1) >> 6];
@@ -5176,9 +5182,15 @@ void HELPER(sve_fcadd_s)(void *vd, void *vn, void *vm, void *vg,
             i -= 2 * sizeof(float32);
 
             e0 = *(float32 *)(vn + H1_2(i));
-            e1 = *(float32 *)(vm + H1_2(j)) ^ neg_real;
+            e1 = *(float32 *)(vm + H1_2(j));
             e2 = *(float32 *)(vn + H1_2(j));
-            e3 = *(float32 *)(vm + H1_2(i)) ^ neg_imag;
+            e3 = *(float32 *)(vm + H1_2(i));
+
+            if (rot) {
+                e3 = float32_maybe_ah_chs(e3, fpcr_ah);
+            } else {
+                e1 = float32_maybe_ah_chs(e1, fpcr_ah);
+            }
 
             if (likely((pg >> (i & 63)) & 1)) {
                 *(float32 *)(vd + H1_2(i)) = float32_add(e0, e1, s);
@@ -5195,8 +5207,8 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
 {
     intptr_t j, i = simd_oprsz(desc);
     uint64_t *g = vg;
-    float64 neg_imag = float64_set_sign(0, simd_data(desc));
-    float64 neg_real = float64_chs(neg_imag);
+    bool rot = extract32(desc, SIMD_DATA_SHIFT, 1);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
 
     do {
         uint64_t pg = g[(i - 1) >> 6];
@@ -5208,9 +5220,15 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
             i -= 2 * sizeof(float64);
 
             e0 = *(float64 *)(vn + H1_2(i));
-            e1 = *(float64 *)(vm + H1_2(j)) ^ neg_real;
+            e1 = *(float64 *)(vm + H1_2(j));
             e2 = *(float64 *)(vn + H1_2(j));
-            e3 = *(float64 *)(vm + H1_2(i)) ^ neg_imag;
+            e3 = *(float64 *)(vm + H1_2(i));
+
+            if (rot) {
+                e3 = float64_maybe_ah_chs(e3, fpcr_ah);
+            } else {
+                e1 = float64_maybe_ah_chs(e1, fpcr_ah);
+            }
 
             if (likely((pg >> (i & 63)) & 1)) {
                 *(float64 *)(vd + H1_2(i)) = float64_add(e0, e1, s);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 0d8bd1a49c4..7816b5801af 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3916,7 +3916,7 @@ static gen_helper_gvec_4_ptr * const fcadd_fns[] = {
     gen_helper_sve_fcadd_s, gen_helper_sve_fcadd_d,
 };
 TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
-           a->rd, a->rn, a->rm, a->pg, a->rot,
+           a->rd, a->rn, a->rm, a->pg, a->rot | (s->fpcr_ah << 1),
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 #define DO_FMLA(NAME, name) \
-- 
2.34.1

