Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142839njb;
        Sat, 1 Feb 2025 08:42:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcEhjIk9Yw4b7awvEFc3BCBj5LRunGT72gwmRUYOVqSh8GvJBlt+xcIR9GGF535IEN0i/y4qVxNhTkjw==@linaro.org
X-Google-Smtp-Source: AGHT+IHBal6lX7p4QrZFVEJHOcv5GraoU5vOI4SIvAuwiekebkmsN7pxV6xvTeM21qhgxIviSk6i
X-Received: by 2002:ac8:5990:0:b0:467:7076:37c7 with SMTP id d75a77b69052e-46fea10ace0mr109093161cf.22.1738428160452;
        Sat, 01 Feb 2025 08:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428160; cv=none;
        d=google.com; s=arc-20240605;
        b=BqOrl78oB+r3bxy25fswK3U8hz7V1VUKgBMHw6isYyjIy2aZ0++f3aSVYbEb1+ZYsH
         +3LF14yaTSepNT2whv/ReX+ZQNLxvzSbqFKWyaPG0vL5Xs5TyM2dybYUxxR8AeCtj2UP
         TuMA4PUb+fTM08sSpCm1cWwekOBC2Qq6XO3WSsuK5b/RwKCeY2Gwpe1oy7a2mvpMPK6e
         mjK99rpquq1SGgKDWLYi4CGkSjfS1iQ7xM34bLX5kD8WcTPXT2Ocw8XzSW5bZSREoItS
         +jWua0UZYtI0iD9XVKihd/q1UTsiQ5gg9sjDsJqUW8qxQBRd94DAKHCpOaYBk28qto+I
         4I9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hcrruo5RnW9YV1dz+RMkLiucYHbo488Dc1v5YzDdwzw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gC4p64BVCG6NFn2ZklsrxP2DPBsMJJHsjbgYVbXpB2nmDHJEiNJ3fK6gmoOvFXdQ2x
         zw/0L4XM925Pm4GdsAYh7RNPByI9E18pV3dJMuopKPsj1hDt257hqT5mW7zCFGy/2a2U
         GfKX/805kE5AJ1vEPg30Koi13roLoDeQ9ZFOS77+iBtdZ5QHCZU/5vA6qQUFrXMbe7vV
         BQiUaqhYuisbB0X7qZyrO8OK2K4ZKLJBLjy9a7JBWCwgE1oz1TlWyMcwD97uxd8LeTC/
         Lkcyueb0RWHf6iUKAIKj/jOyVxVcOefV8yz80WR4HxfMOP5dJDdw7jiCk+/eT1ziMpeZ
         h+xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fuPiLFs6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d1d60si60657861cf.349.2025.02.01.08.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fuPiLFs6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYw-0007Wh-8B; Sat, 01 Feb 2025 11:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYa-000762-6N
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYX-0001IO-TY
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so30064785e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428076; x=1739032876; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hcrruo5RnW9YV1dz+RMkLiucYHbo488Dc1v5YzDdwzw=;
 b=fuPiLFs6ZbqXq39NSWSGzE5OkthYIcbRlMopavzSy/NVUrhaqQrnS1aKOKNv2wd3Jw
 lnsHg5eUHZQQNln4CgDLxNRhYvzifz23SCmrrF1py9zdVabi2Mp9EB+X85Yvnlblq+By
 QKCzKpUePEqv0jnRqQl7nxB6fqa5ky3kQzKA8AOAqKoAAzKiN+eh2iKN0hH9Ks4iQzIo
 laNhmu2MvYXgZN/ho/VYaeNdVLrs2XeSaPYS5LjJdaZ0L4mdUo1nLeiqRNnQPu9vVxEu
 KM17CLRAYJipB0x5OQakIhQwF+bVI+KKiZGFoUS4LLGfkIjTH2iqqVYC5YOySJUSdnrS
 wzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428076; x=1739032876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcrruo5RnW9YV1dz+RMkLiucYHbo488Dc1v5YzDdwzw=;
 b=Bzzn8nOXfRU+4UYPu+oHtZx4SJsUJIOkXubywropYoOENMzwRXjf5ffzDug2vqKTPe
 GjicuPicXIZ7CPOfO+8skMXWYwvxjCLbM0dXXkAIK7H4Bk5SSswSLZ9A/tD0m+EbRapw
 rDRwFUuB4R5jEuWSjIBKC599njEw/viib3igZILIjP+TnsE9WYY/McPWTJKGtIz/pSRx
 r9gMFj9MgSB1h4PbALKMi3WbfFv5Oeqnxx9Rs6o9z4s1jT9xP+RKbpJCFtIzSnYTuyop
 bPovGhEI9WVsYs9HYD6h53h4h4Ia2h53GPLVraZFlWeYgABSMhh5uLYr4gRb9qmX7Ssy
 xMgQ==
X-Gm-Message-State: AOJu0YzhxyeNkUbFEq1RYVl9rg+Oq3VFw7RFElsOF/9w+gaR37jfDuyv
 jncDInZ/B0itZuZWp5/Y0G4ApT6iw1EX3lGQkOn4Bsc5j/9EqVJuluTtpCTRf7BJ2MX2gh4v1aQ
 I
X-Gm-Gg: ASbGncvVO8607sBTVU53eUOX/6r3DPooYwkbQiBU+U52PBaw0rODcUJvP0L/f51+v7o
 e2NMuYDFl96Y9u6Ya3RjYDBnkFoAkR/fCBRo/gxnquPJcR/zsogIO3K5LMBvdBObTpa6nsiSdVl
 kABx6rnjOmbprK1pOIuu33BYf05qSpEY/1bSrfeis7GTMlTfKuJ8zazurC/jqT/4Mj+6pJIOUgj
 kweDo1cI5DJVQ/lOQtpYD+rYIqAfowDcNDGG0TAq4ednO3UyWGqodz1rGfK2nSesi2s04NrZuIe
 e826CIeH/tNQ2ddfSLDA
X-Received: by 2002:a05:600c:83ce:b0:431:5632:448b with SMTP id
 5b1f17b1804b1-438dc41d5c4mr119153835e9.25.1738428076438; 
 Sat, 01 Feb 2025 08:41:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 47/69] target/arm: Handle FPCR.AH in FCMLA by index
Date: Sat,  1 Feb 2025 16:39:50 +0000
Message-Id: <20250201164012.1660228-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 64bJSP8Tbqf2

From: Richard Henderson <richard.henderson@linaro.org>

The negation step in FCMLA by index mustn't negate a NaN when
FPCR.AH is set. Use the same approach as vector FCMLA of
passing in FPCR.AH and using it to select whether to negate
by XOR or by the muladd negate_product flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20250129013857.135256-27-richard.henderson@linaro.org
[PMM: Expanded commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/vec_helper.c    | 44 ++++++++++++++++++++--------------
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c45a9822281..e8eab1eabdc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6927,7 +6927,7 @@ static bool trans_FCMLA_vi(DisasContext *s, arg_FCMLA_vi *a)
     if (fp_access_check(s)) {
         gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
                           a->esz == MO_16 ? FPST_A64_F16 : FPST_A64,
-                          (a->idx << 2) | a->rot, fn);
+                          (s->fpcr_ah << 4) | (a->idx << 2) | a->rot, fn);
     }
     return true;
 }
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 630513f00b2..c2f98a5c67e 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -995,29 +995,33 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm, void *va,
     uintptr_t opr_sz = simd_oprsz(desc);
     float16 *d = vd, *n = vn, *m = vm, *a = va;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
-    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t negf_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
-    uint32_t neg_real = flip ^ neg_imag;
+    uint32_t fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 4, 1);
+    uint32_t negf_real = flip ^ negf_imag;
     intptr_t elements = opr_sz / sizeof(float16);
     intptr_t eltspersegment = MIN(16 / sizeof(float16), elements);
+    float16 negx_imag, negx_real;
     intptr_t i, j;
 
-    /* Shift boolean to the sign bit so we can xor to negate.  */
-    neg_real <<= 15;
-    neg_imag <<= 15;
+    /* With AH=0, use negx; with AH=1 use negf. */
+    negx_real = (negf_real & ~fpcr_ah) << 15;
+    negx_imag = (negf_imag & ~fpcr_ah) << 15;
+    negf_real = (negf_real & fpcr_ah ? float_muladd_negate_product : 0);
+    negf_imag = (negf_imag & fpcr_ah ? float_muladd_negate_product : 0);
 
     for (i = 0; i < elements; i += eltspersegment) {
         float16 mr = m[H2(i + 2 * index + 0)];
         float16 mi = m[H2(i + 2 * index + 1)];
-        float16 e1 = neg_real ^ (flip ? mi : mr);
-        float16 e3 = neg_imag ^ (flip ? mr : mi);
+        float16 e1 = negx_real ^ (flip ? mi : mr);
+        float16 e3 = negx_imag ^ (flip ? mr : mi);
 
         for (j = i; j < i + eltspersegment; j += 2) {
             float16 e2 = n[H2(j + flip)];
             float16 e4 = e2;
 
-            d[H2(j)] = float16_muladd(e2, e1, a[H2(j)], 0, fpst);
-            d[H2(j + 1)] = float16_muladd(e4, e3, a[H2(j + 1)], 0, fpst);
+            d[H2(j)] = float16_muladd(e2, e1, a[H2(j)], negf_real, fpst);
+            d[H2(j + 1)] = float16_muladd(e4, e3, a[H2(j + 1)], negf_imag, fpst);
         }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
@@ -1059,29 +1063,33 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm, void *va,
     uintptr_t opr_sz = simd_oprsz(desc);
     float32 *d = vd, *n = vn, *m = vm, *a = va;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
-    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t negf_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
-    uint32_t neg_real = flip ^ neg_imag;
+    uint32_t fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 4, 1);
+    uint32_t negf_real = flip ^ negf_imag;
     intptr_t elements = opr_sz / sizeof(float32);
     intptr_t eltspersegment = MIN(16 / sizeof(float32), elements);
+    float32 negx_imag, negx_real;
     intptr_t i, j;
 
-    /* Shift boolean to the sign bit so we can xor to negate.  */
-    neg_real <<= 31;
-    neg_imag <<= 31;
+    /* With AH=0, use negx; with AH=1 use negf. */
+    negx_real = (negf_real & ~fpcr_ah) << 31;
+    negx_imag = (negf_imag & ~fpcr_ah) << 31;
+    negf_real = (negf_real & fpcr_ah ? float_muladd_negate_product : 0);
+    negf_imag = (negf_imag & fpcr_ah ? float_muladd_negate_product : 0);
 
     for (i = 0; i < elements; i += eltspersegment) {
         float32 mr = m[H4(i + 2 * index + 0)];
         float32 mi = m[H4(i + 2 * index + 1)];
-        float32 e1 = neg_real ^ (flip ? mi : mr);
-        float32 e3 = neg_imag ^ (flip ? mr : mi);
+        float32 e1 = negx_real ^ (flip ? mi : mr);
+        float32 e3 = negx_imag ^ (flip ? mr : mi);
 
         for (j = i; j < i + eltspersegment; j += 2) {
             float32 e2 = n[H4(j + flip)];
             float32 e4 = e2;
 
-            d[H4(j)] = float32_muladd(e2, e1, a[H4(j)], 0, fpst);
-            d[H4(j + 1)] = float32_muladd(e4, e3, a[H4(j + 1)], 0, fpst);
+            d[H4(j)] = float32_muladd(e2, e1, a[H4(j)], negf_real, fpst);
+            d[H4(j + 1)] = float32_muladd(e4, e3, a[H4(j + 1)], negf_imag, fpst);
         }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
-- 
2.34.1

