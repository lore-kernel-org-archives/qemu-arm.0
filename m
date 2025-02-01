Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1144350njb;
        Sat, 1 Feb 2025 08:46:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLq8E5QtUfFn9TPugAwGQ0oy1P4+4VJzuTLU1il0SNp+SFr0TPSqIA6S8z1KIOF/wPffTtJu1tyeOAVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBk5GBi3XQ5yvZt2BjHMMvxQonR1g4Cn+fljYxNFWqWKjO7l7XGG5223z5djvyXqu9o7A/
X-Received: by 2002:ac8:5a95:0:b0:466:9a61:273a with SMTP id d75a77b69052e-46fd0bbae27mr261266721cf.52.1738428359928;
        Sat, 01 Feb 2025 08:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428359; cv=none;
        d=google.com; s=arc-20240605;
        b=KhcuZZ6v0d7P/Rov8wzhDlI1Dey44XrJNY5+IM0+wdOsyyV6oPxnUYRa0mGsWHvWKn
         OKSgAO2QxvP48sX+xX8sj4yPvG1Ou3ralmqAVfl5rA8yCcav0LRWFwILs4aG/rdvZKs+
         1m6rfwE631hQ/JaW4kIdDtuA7aFbmoBQlVKh550VpYk8O8qv64eSMz1eOnlEdDRDRWHE
         UC0RV9ucL4AaqR0ZTnEHafurJnFyEbdm2+9gNQLJK3d/O8JDDhc4OFZXRGm04rzPWAAw
         t5suJoAUKxIEHqDR0+JsvDDSxZxznH9h1ngJlkaIfrKd10GbjGKLXvzkIyOsN/aGITQ4
         YsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0fctEsT+vD+ZzpjBa9cl09j7OER8dNmtu6EgkXkTcP0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=fRowJh/Ep8nhTrMRpzvwZfBJVZsTpHYyzX/daWNYGigOQpE9jUQ5bNzzeAkC5qHEq8
         5mbkbF+8pfVM4QnxrNMeY88wK5ISFU3vYzWTYm5Tggy4/HUHLUBE0i5TrlW0vYqVL9Xy
         zCCkzJ2MTlB4JrIFGVK5vulSBQRmSufPivJPWR4NpEYpUZosiWf+p8BYgFDTQ8G1EL8Q
         UXEOl+QGytfrwRtwbYfaG1tsbxi+Z/X/Z4w3k24c12fZX3Jzno7oV9ij00EKO2cduFCP
         BXfZ/o7dzJr3CJFeUeNryfkN8I5cdjT2i0NLuMMeXqrR8R7rR0aE/WnbgwCDnI3YirmW
         7f6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sllqfa7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1f3e69si60709691cf.652.2025.02.01.08.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sllqfa7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYa-00079A-Rm; Sat, 01 Feb 2025 11:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYY-00074h-RB
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:18 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYW-0001I9-Vb
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso30165315e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428075; x=1739032875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0fctEsT+vD+ZzpjBa9cl09j7OER8dNmtu6EgkXkTcP0=;
 b=sllqfa7gJMTXak/gocAKxae4e3/+KmIFCuDhUA+cfxShNOej0fCl9sItT8F091tpZm
 kxsgDkQPVkg2xxSubhOdKku8fhk7163eIFuW9XlCBxif3ecXzYYOUNTYbLFAse37K8kR
 rJxOXD8XuRpA8umXPTEes+jh6FxMpTiJJQRqGXouP2VBGFb//7TFSbBjTRB2yFpssk3X
 cvSIXFHtaHQHkl+GKxesmYJTDMiYFE3nFyL8e2EbL4skD1bJ9+iAxFM5jkDoH+0JIm9b
 Z03HptwbWHcBp8pnyuJZlDLAu5LiSg4WLg7XELFda0P7ksHBJJwuNhR033j6T2mIbLoh
 TrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428075; x=1739032875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fctEsT+vD+ZzpjBa9cl09j7OER8dNmtu6EgkXkTcP0=;
 b=QBHx7h6Q2tdSDFxsD8DMPkyvhTTUvTCIj+cJAwklurcmC0D/ErUCl8W+BUsv9fTtRo
 XkCPUYcdrbmY0hPN9R2w3YsakM0+BKjOtzhAFi0aFqagPwC0Q5trZkh9iRUc2bvoKkOB
 sYyAP8mB0xf+KMsHdGHNeEOBLrQbIx7OFBR1HjjrlzY4S7IJfmGleXOw/+cXAx4yvGYz
 nvLHwapythyKjhjX74BpmbR5ziW1+rFhk6suz+DYwRP4Adcimyf5HbilrBSLqLKlbXA3
 9sUil58xMH+fueyAMD/6KAQlNAKJEkCX7LcFIveyzHvaznlIry+a9pNejXvSo2oLmzKT
 n3bQ==
X-Gm-Message-State: AOJu0YyNtoKSQaRbslVC0F8DjCFsh0twZ0d8TsEHjPZSNVpZ7DAO8AaZ
 lmwCA3fiMVUIebdkv6tPelAowClythT8XOQzj5QYJlyh6DmWozo0YmCFDWQFXpip06t59o2VtPf
 F
X-Gm-Gg: ASbGncu1Oz7K4OJv+BIQbmTBnTX8IXBZp5qD7Pz331qzxln65Dt2By0TnlS2HkWsOmm
 x4klftEYogL2vEMNPsCE09h/RdWq4b6hHWEm0YDvwtgvs7AcklnTQvKDT+ioG9vlOx/ozv7n3NM
 DK9NDHgDg38GEMT34z4pjhkx6HlzetC5KAuZBkQtKKIvZ5VntfDCO6l29MfeCRJTglmmCq2ZwOX
 nQgPaxvspNirb1NcNRTtv36cVdJO3pOhdfjvr2clROGPpbNyVtyE2YRGRK1PlKKbd80nNRlAbtB
 zc4pEgwJniYRYfOUHsn0
X-Received: by 2002:a5d:6c65:0:b0:38a:4b8a:e477 with SMTP id
 ffacd0b85a97d-38c51969b28mr11948655f8f.22.1738428075553; 
 Sat, 01 Feb 2025 08:41:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 46/69] target/arm: Handle FPCR.AH in vector FCMLA
Date: Sat,  1 Feb 2025 16:39:49 +0000
Message-Id: <20250201164012.1660228-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: Kb+tX/8APSMp

From: Richard Henderson <richard.henderson@linaro.org>

The negation step in FCMLA mustn't negate a NaN when FPCR.AH
is set. Handle this by passing FPCR.AH to the helper via the
SIMD data field, and use this to select whether to do the
negation via XOR or via the muladd negate_product flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20250129013857.135256-26-richard.henderson@linaro.org
[PMM: Expanded commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/vec_helper.c    | 66 ++++++++++++++++++++--------------
 2 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c209ac84228..c45a9822281 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6175,7 +6175,7 @@ static bool trans_FCMLA_v(DisasContext *s, arg_FCMLA_v *a)
 
     gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
                       a->esz == MO_16 ? FPST_A64_F16 : FPST_A64,
-                      a->rot, fn[a->esz]);
+                      a->rot | (s->fpcr_ah << 2), fn[a->esz]);
     return true;
 }
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index fc3e6587b81..630513f00b2 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -965,22 +965,26 @@ void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm, void *va,
     uintptr_t opr_sz = simd_oprsz(desc);
     float16 *d = vd, *n = vn, *m = vm, *a = va;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
-    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
-    uint32_t neg_real = flip ^ neg_imag;
+    uint32_t fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    uint32_t negf_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t negf_real = flip ^ negf_imag;
+    float16 negx_imag, negx_real;
     uintptr_t i;
 
-    /* Shift boolean to the sign bit so we can xor to negate.  */
-    neg_real <<= 15;
-    neg_imag <<= 15;
+    /* With AH=0, use negx; with AH=1 use negf. */
+    negx_real = (negf_real & ~fpcr_ah) << 15;
+    negx_imag = (negf_imag & ~fpcr_ah) << 15;
+    negf_real = (negf_real & fpcr_ah ? float_muladd_negate_product : 0);
+    negf_imag = (negf_imag & fpcr_ah ? float_muladd_negate_product : 0);
 
     for (i = 0; i < opr_sz / 2; i += 2) {
         float16 e2 = n[H2(i + flip)];
-        float16 e1 = m[H2(i + flip)] ^ neg_real;
+        float16 e1 = m[H2(i + flip)] ^ negx_real;
         float16 e4 = e2;
-        float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;
+        float16 e3 = m[H2(i + 1 - flip)] ^ negx_imag;
 
-        d[H2(i)] = float16_muladd(e2, e1, a[H2(i)], 0, fpst);
-        d[H2(i + 1)] = float16_muladd(e4, e3, a[H2(i + 1)], 0, fpst);
+        d[H2(i)] = float16_muladd(e2, e1, a[H2(i)], negf_real, fpst);
+        d[H2(i + 1)] = float16_muladd(e4, e3, a[H2(i + 1)], negf_imag, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -1025,22 +1029,26 @@ void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm, void *va,
     uintptr_t opr_sz = simd_oprsz(desc);
     float32 *d = vd, *n = vn, *m = vm, *a = va;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
-    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
-    uint32_t neg_real = flip ^ neg_imag;
+    uint32_t fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    uint32_t negf_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t negf_real = flip ^ negf_imag;
+    float32 negx_imag, negx_real;
     uintptr_t i;
 
-    /* Shift boolean to the sign bit so we can xor to negate.  */
-    neg_real <<= 31;
-    neg_imag <<= 31;
+    /* With AH=0, use negx; with AH=1 use negf. */
+    negx_real = (negf_real & ~fpcr_ah) << 31;
+    negx_imag = (negf_imag & ~fpcr_ah) << 31;
+    negf_real = (negf_real & fpcr_ah ? float_muladd_negate_product : 0);
+    negf_imag = (negf_imag & fpcr_ah ? float_muladd_negate_product : 0);
 
     for (i = 0; i < opr_sz / 4; i += 2) {
         float32 e2 = n[H4(i + flip)];
-        float32 e1 = m[H4(i + flip)] ^ neg_real;
+        float32 e1 = m[H4(i + flip)] ^ negx_real;
         float32 e4 = e2;
-        float32 e3 = m[H4(i + 1 - flip)] ^ neg_imag;
+        float32 e3 = m[H4(i + 1 - flip)] ^ negx_imag;
 
-        d[H4(i)] = float32_muladd(e2, e1, a[H4(i)], 0, fpst);
-        d[H4(i + 1)] = float32_muladd(e4, e3, a[H4(i + 1)], 0, fpst);
+        d[H4(i)] = float32_muladd(e2, e1, a[H4(i)], negf_real, fpst);
+        d[H4(i + 1)] = float32_muladd(e4, e3, a[H4(i + 1)], negf_imag, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -1085,22 +1093,26 @@ void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm, void *va,
     uintptr_t opr_sz = simd_oprsz(desc);
     float64 *d = vd, *n = vn, *m = vm, *a = va;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
-    uint64_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
-    uint64_t neg_real = flip ^ neg_imag;
+    uint32_t fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    uint32_t negf_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t negf_real = flip ^ negf_imag;
+    float64 negx_real, negx_imag;
     uintptr_t i;
 
-    /* Shift boolean to the sign bit so we can xor to negate.  */
-    neg_real <<= 63;
-    neg_imag <<= 63;
+    /* With AH=0, use negx; with AH=1 use negf. */
+    negx_real = (uint64_t)(negf_real & ~fpcr_ah) << 63;
+    negx_imag = (uint64_t)(negf_imag & ~fpcr_ah) << 63;
+    negf_real = (negf_real & fpcr_ah ? float_muladd_negate_product : 0);
+    negf_imag = (negf_imag & fpcr_ah ? float_muladd_negate_product : 0);
 
     for (i = 0; i < opr_sz / 8; i += 2) {
         float64 e2 = n[i + flip];
-        float64 e1 = m[i + flip] ^ neg_real;
+        float64 e1 = m[i + flip] ^ negx_real;
         float64 e4 = e2;
-        float64 e3 = m[i + 1 - flip] ^ neg_imag;
+        float64 e3 = m[i + 1 - flip] ^ negx_imag;
 
-        d[i] = float64_muladd(e2, e1, a[i], 0, fpst);
-        d[i + 1] = float64_muladd(e4, e3, a[i + 1], 0, fpst);
+        d[i] = float64_muladd(e2, e1, a[i], negf_real, fpst);
+        d[i + 1] = float64_muladd(e4, e3, a[i + 1], negf_imag, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

