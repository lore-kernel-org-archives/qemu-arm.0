Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142576njb;
        Sat, 1 Feb 2025 08:42:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+39Fdn8GCh738tiM2E606nP115UZYjSf2aUg5K4vPKYYO/R+NklWYrZeW0A2RXxR1cgmbXRsG0yhkcg==@linaro.org
X-Google-Smtp-Source: AGHT+IGVlmAfatJech0gTxgR13YPAorcblxxqSsZ/Nd+a/Q66uzK9A+f7EUluHzNM5eKwCA+Cg+Y
X-Received: by 2002:a05:622a:581a:b0:46c:82dd:9a64 with SMTP id d75a77b69052e-46fdd407c03mr185456241cf.22.1738428131330;
        Sat, 01 Feb 2025 08:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428131; cv=none;
        d=google.com; s=arc-20240605;
        b=iq6Pnje/G8gn8e1tXrm7sz3+bltgLZIVU8Vj28thuWCh1td5fB8g844lLragT/gP8K
         +f2tKOcXbY3CUnlXpz1mm6z7IDDgGcXjweAu8JXeSmIKfzVeFFSisWimw8UvtSsKDxVH
         AIzmo3mLrZjgb7RJ7ZZRobyqMFG/tGvq/ExRKVB6yHouf1o9qOfBY4ipaGpGBy8dcJU2
         FFdFn25J26YM0DtQxgU2mFAfjeocvDPrnrBuqbcssqQwbnpsAtGq9wz+WxBGWY0SMI/+
         xeqDPsZlakKGdYY5LLiUYj6TbkaqSlcc9LLLcOSuvGQckvJx+wvx8ItswtwNbvW9aQwz
         V/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Gc/WKGJaQOfEqTZHfevAkr0JFxIIMAK6obndN8mIWus=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=I8KUPI4VAHfdgDOebEW+BMIcRYkLbIxww6lSpyqnDyP3ZqSg1/ZRu9hJly56fP1So6
         PPYnqZ1NUILlck33olndPXAP8BSeres5b1XsdotnAow4jFMcXqQsGqp4WniOdrE/t562
         ULHaonI8nqF1oBchbndiXuk9s+PFYDFrBIJIe0ahuov6t80imVqiHzaj/nGBOe3sqG8g
         QjJpHSE4mS6tEiAB6YZ9GydK+tzCNQRXG5BDzotyrc7xDTm/fgRjtweWZhPDwJh4oysY
         c2zflgY4U1Ii+Dh11wtjWOIouvBTeBl/CiTdOqwB6Eak1uih5Ib4mbNEnhn6NVyItH/7
         1vkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agY4vQMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e350fsi61713631cf.558.2025.02.01.08.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agY4vQMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYb-00079y-F8; Sat, 01 Feb 2025 11:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYX-0006xj-5C
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:17 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYV-0001Hm-Er
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436341f575fso35242015e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428074; x=1739032874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Gc/WKGJaQOfEqTZHfevAkr0JFxIIMAK6obndN8mIWus=;
 b=agY4vQMe1AxsGel79PTMxKaWsTiGRMf7YYLw7E0czqlYO/N2RhpGcWD7HCyt6Czhc+
 qx3P4hP5+sQHonY8BSHeIr//FF9TP9v3wkc4rUOsX5Y//Gvlt4pq9ybp4Qz5x1Xg8nks
 4CkgGwGPWpjdC/pXSNzeyv4MrtZfglXi9wxxNhwrZwrn0tIM9ixoHHzTYUVp0RAD/V03
 SQUriMDFlVN14s77KMi7qLnQUcTxt4bq2ACNllTqMOpvsgFfaE5Ex+oIuodN//mvM8wq
 1GcpZGnUx8/Vg0yu1VGVm1Gij0Fp2RA5vwmxCcsAKrgRDIZF6haf/Q8QaTZrgve5W0Em
 JTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428074; x=1739032874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gc/WKGJaQOfEqTZHfevAkr0JFxIIMAK6obndN8mIWus=;
 b=mvUH5h8K/LZ4l+r0D6PKpetK6a5jn0ahH70FDC25YkmiUIuWOnzsvxGQOcuuXoOA6D
 kiJ2fk4Vb9BtY1uJg5FS2Pn+yHZWSS5eST0fgT6SGVm2CmHuvQYUv8tzujfhjWVRshs4
 K5SomqBOwAjNgiDL8GlfCmF2kRAwRQM0WdpyIGxizieoNqowQ3Pq761tBJ3UsuaIPecf
 Rx6UuzIFkcerE257oupiH5WwuhiewJHn6qEbfwCe0xAH+mn/7eTdQneeRMBO9hetuskH
 p+pdo8tcCbUFjt8pZfgOgPYL26riylSjWqUu2vWenQItPlp0s7g1N4ha5+SQ/lwpzwPS
 ChoA==
X-Gm-Message-State: AOJu0Yw/LLq37QMBnKSQWxChqALL3UPNFspqcK+X2neohj/XspZzn2Rq
 3+zXAMPnAIViJH1afJ2198/g23clilW8kzTb0BJRw8S5oFPmfldZ3AfOKczQ9toXvHE6+LpQhEL
 a
X-Gm-Gg: ASbGncu8M/94Ywlt6HiMxZOKNudE6pfdxhH4Y/uKTPl94DeRbFBc/DEb/4Sj7mES+kk
 kXMREIE18yBiu2hYdpoZW61HR1BiwVqR89X8PL+t0qvy4YXoiklegkQEogwVga6K3+suYzbnkGT
 jDz2wS+QFreu4FHrKiA7U8uq/eAj4Wmwq7a9JdhQ2rJxBKSUUBJlwBHxPpMUNx4NanJGj7QDGgw
 vWV5i3kLGXyPBzsOBGQ24zrrPF3oieXjidySjFk8vHKL952KT2QfQzmXSh8ImbFj9KY9YeqM+ln
 e3/fxeSUS0WrEM4mfMkg
X-Received: by 2002:a05:600c:4692:b0:434:fec5:4ed1 with SMTP id
 5b1f17b1804b1-438dc4223a3mr141818195e9.26.1738428073967; 
 Sat, 01 Feb 2025 08:41:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 45/69] target/arm: Handle FPCR.AH in SVE FTMAD
Date: Sat,  1 Feb 2025 16:39:48 +0000
Message-Id: <20250201164012.1660228-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: Vk214hCYSWY9

The negation step in the SVE FTMAD insn mustn't negate a NaN when
FPCR.AH is set.  Pass FPCR.AH to the helper via the SIMD data field,
so we can select the correct behaviour.

Because the operand is known to be negative, negating the operand
is the same as taking the absolute value.  Defer this to the muladd
operation via flags, so that it happens after NaN detection, which
is correct for FPCR.AH.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Squsahed in RTH's patch to use muladd flags
---
 target/arm/tcg/sve_helper.c    | 42 ++++++++++++++++++++++++++--------
 target/arm/tcg/translate-sve.c |  3 ++-
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index bf88bde8a31..c12b2600bd7 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5134,16 +5134,24 @@ void HELPER(sve_ftmad_h)(void *vd, void *vn, void *vm,
         0x3c00, 0xb800, 0x293a, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
     };
     intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(float16);
-    intptr_t x = simd_data(desc);
+    intptr_t x = extract32(desc, SIMD_DATA_SHIFT, 3);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 3, 1);
     float16 *d = vd, *n = vn, *m = vm;
+
     for (i = 0; i < opr_sz; i++) {
         float16 mm = m[i];
         intptr_t xx = x;
+        int flags = 0;
+
         if (float16_is_neg(mm)) {
-            mm = float16_abs(mm);
+            if (fpcr_ah) {
+                flags = float_muladd_negate_product;
+            } else {
+                mm = float16_abs(mm);
+            }
             xx += 8;
         }
-        d[i] = float16_muladd(n[i], mm, coeff[xx], 0, s);
+        d[i] = float16_muladd(n[i], mm, coeff[xx], flags, s);
     }
 }
 
@@ -5157,16 +5165,24 @@ void HELPER(sve_ftmad_s)(void *vd, void *vn, void *vm,
         0x37cd37cc, 0x00000000, 0x00000000, 0x00000000,
     };
     intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(float32);
-    intptr_t x = simd_data(desc);
+    intptr_t x = extract32(desc, SIMD_DATA_SHIFT, 3);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 3, 1);
     float32 *d = vd, *n = vn, *m = vm;
+
     for (i = 0; i < opr_sz; i++) {
         float32 mm = m[i];
         intptr_t xx = x;
+        int flags = 0;
+
         if (float32_is_neg(mm)) {
-            mm = float32_abs(mm);
+            if (fpcr_ah) {
+                flags = float_muladd_negate_product;
+            } else {
+                mm = float32_abs(mm);
+            }
             xx += 8;
         }
-        d[i] = float32_muladd(n[i], mm, coeff[xx], 0, s);
+        d[i] = float32_muladd(n[i], mm, coeff[xx], flags, s);
     }
 }
 
@@ -5184,16 +5200,24 @@ void HELPER(sve_ftmad_d)(void *vd, void *vn, void *vm,
         0x3e21ee96d2641b13ull, 0xbda8f76380fbb401ull,
     };
     intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(float64);
-    intptr_t x = simd_data(desc);
+    intptr_t x = extract32(desc, SIMD_DATA_SHIFT, 3);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 3, 1);
     float64 *d = vd, *n = vn, *m = vm;
+
     for (i = 0; i < opr_sz; i++) {
         float64 mm = m[i];
         intptr_t xx = x;
+        int flags = 0;
+
         if (float64_is_neg(mm)) {
-            mm = float64_abs(mm);
+            if (fpcr_ah) {
+                flags = float_muladd_negate_product;
+            } else {
+                mm = float64_abs(mm);
+            }
             xx += 8;
         }
-        d[i] = float64_muladd(n[i], mm, coeff[xx], 0, s);
+        d[i] = float64_muladd(n[i], mm, coeff[xx], flags, s);
     }
 }
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 2dd4605bb2f..410087c3fbd 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3685,7 +3685,8 @@ static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
     gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
 };
 TRANS_FEAT_NONSTREAMING(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
-                        ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+                        ftmad_fns[a->esz], a->rd, a->rn, a->rm,
+                        a->imm | (s->fpcr_ah << 3),
                         a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 /*
-- 
2.34.1

