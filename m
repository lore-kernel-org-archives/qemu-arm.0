Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775232njk;
        Mon, 27 Jan 2025 15:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEqqRQM5dxK/Pq8r07LeKAfeRwVti7/SpTHaJNaSc9OTYSgNFA801ROp6cRhm8URrs3zhpEM3ZuRaAXg==@linaro.org
X-Google-Smtp-Source: AGHT+IEOhjKU6QHsQeOUSRaXUNdGv/YgJZskhGl3F9JfNKyH9l1sfbTpUNxtd1Y4eT5eZ1Uq1/ms
X-Received: by 2002:a0c:c403:0:b0:6e1:fe68:11c0 with SMTP id 6a1803df08f44-6e1fe68139emr169487456d6.12.1738020508645;
        Mon, 27 Jan 2025 15:28:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020508; cv=none;
        d=google.com; s=arc-20240605;
        b=HohrSLdjjck4ua/d2qrI6ZGp4IuRKXuFxtzr/8p0i+4XqP7BdG//Dn26+7/yTNcSHw
         rl3OgwGJZ5HHzQwwFvNfXfb3yW+YCzIp2wfAbgkNBZv3m0EgU/f/3Jr7D2SuZa2Hz1qO
         u9EjyrKUToF+mIdDhldaVFfsJP+O9OMSRuEBaGErJstBXSufjmP7lxSj2uUmKGWbV7M0
         Tv01Np6RetQSppJKNj5j469wr217pzBW6oFYNgJToCIccSl5OVuqm4aCJ/msLWb9CImy
         YXxunyh55+F/rSMkORX5Ls23gr4wBEU8uqVG+cFhvzZRvaM1ROU5nv7FqPHcE/3ox3oT
         QXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2GDxHDUfDEHJ5sXsQfC9s6zGTEGY5YOTfZmfjmgVvKc=;
        fh=MAdf/z0g2Uf/SC2mDVUbZ3n2rhSNVTU3pqJtFnvtX94=;
        b=fUlRQw8+u+FdU7eEk6HzzGYPSBTRzGUVJpFWgRbCDp3uccg2cS/fhFTiwyk32WnWJp
         X6Hv3tiJhQknrB0fPhqTNXB48ep3bf/hngUNTfukTKHVa9oBaN/WKqmGv96NJk/Jh16e
         szLKe1tle7GgwQ6Iy3Jm43mQ+hfq6ZJT7UqNNkTvNZotGt7rDenrkPv7piLBdIqH5hf0
         f4IuUYPr7u5kNOHn61rIe7ZHSR5rzUDR2uxsuH/b4pOmkNjb4Wj99xQIlRD5TqkCkm5r
         qqIQPytdh95cleKFoVpSWmmXIZDhDLa1G0qUYZfUzqRoygYofpOpc57rEFeuUB9VsGb5
         lruA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prK1VNR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205364b11si109694506d6.160.2025.01.27.15.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:28:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prK1VNR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYUz-0006Xh-Ha; Mon, 27 Jan 2025 18:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUs-0006SY-Ib
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:27 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUq-0005f9-9z
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:26 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ef760a1001so8564298a91.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020383; x=1738625183; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GDxHDUfDEHJ5sXsQfC9s6zGTEGY5YOTfZmfjmgVvKc=;
 b=prK1VNR1Bor4WZCUyYx9DU4xyvR00YL0GnhicrBUeY4R1TCa0sgMP1bw+IesUr/4vx
 KxkmrzOBPCh/XxI1niKFGBgZY7/i03mfaTAKaF/U7xED0mHhC/VGAK+dIerMyjhADH8p
 ciA431Kb+JEYGxqoQw0tD0HWFw3K2TpA7o2YKNLlaFnpWhUx1lXTpfuOOdh7KytqkW60
 4fwl2m/zfEdwvOlnABf66gJ7mQYIwAAfDOYt1tgmfU1S0t/ex+Ia1g+kBfgL3TcDYfm1
 ax2oiSH/3fxHeUGDcuzj1dtVZ8OzjwsSTtJxbyPIVD+/l47i+1wKCqGFDb/TUUwcxgUZ
 bHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020383; x=1738625183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GDxHDUfDEHJ5sXsQfC9s6zGTEGY5YOTfZmfjmgVvKc=;
 b=kUkHFEa7zKdZbqmSzA4UnjpRGHt/U13nU/uG50BBEcn7ylITirHWMl5LbsYV6Le/cC
 TmS6wDJ+8+cf6ODjTrNJbz4rUfzQdCGdn9DPJPCaz4sx+uUw4I9KjUs6pqhnUg/YruTe
 a9kWMqKktytzml6WKsLvdzDRI+SWjx/JWpdQI6npz93P8jw2KA9aW78fJ2lUtX/r7k1V
 rIYvoobRTegNV+5SbxAff7GFOFD7XsOxP/ZImDG5nKLZnCrvM7lFbt1xRPzNfddsukdq
 Vfncgr0qsiWyD0lL+eamtIOi/lb0H3GlLcoNMsSw2rJ6e+uyIHwcrqSUSDCXrzWDHZAN
 MR/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJzU+EMyCNAWUoify7y5m0oCZz6lgf1z+xHlHgc/E1AeYiarVHawHN6LJ0E07obEcBB7CbZ2Xiyg==@nongnu.org
X-Gm-Message-State: AOJu0YzN1xPfgfE0e8MKW318lqGGMnafXk0W8Y0zhnkUISFpu1mhd0g2
 q0Pm10P1tb4PrkHqiUqCrcJDbI6aeM/LxwsDlig4MFdOA/ZBqMTh6aOtVUShM3I=
X-Gm-Gg: ASbGnctK9vBc5wOfnbsEfB+PGwGqdkIsc7tkMhMSdaqi7f2HbnmQGEyEMLZ5ukkFflk
 PAaT5qrjMOhj4PL+WAk2YDb5mvin0q3bVk3y/K0Ao4weWdUpDZGrvpr+Ty+PqHQ2r4FKZXcfS4+
 wSebAXUPwo18NYWWDwN1Rz1vVKNmUfcWfQKex8yn8BReIf/K/SmAnhDpsLizp3XYggJDolWOEyX
 ZodluDUVqk4d2IT2KGUbwrJdPdqdCqRF4xXEL2W/vh/jE+YAHqc9ZoBco+ribtn1AjKlRpVtqYM
 1nTq5GphfKtcGdA3qpO1c+gJi98fsCl2GVq6Jvw=
X-Received: by 2002:a17:90b:2dc2:b0:2ee:6db1:21d3 with SMTP id
 98e67ed59e1d1-2f782d323a6mr59729663a91.25.1738020382797; 
 Mon, 27 Jan 2025 15:26:22 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 22/22] target/arm: Use flags for AH negation in do_fmla_zpzzz_*
Date: Mon, 27 Jan 2025 15:26:04 -0800
Message-ID: <20250127232604.20386-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: 35budp0QFESJ

The float*_muladd functions have a flags argument that can
perform optional negation of various operand.  We don't use
that for "normal" arm fmla, because the muladd flags are not
applied when an input is a NaN.  But since FEAT_AFP does not
negate NaNs, this behaviour is exactly what we need.

Since we have separate helper entry points for the various
fmla, fmls, fnmla, fnmls instructions, it's easy to just
pass down the exact values required so that no conditional
branch is required within the inner loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 93 +++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 6a5bfa0e59..4fdc98cd98 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4814,7 +4814,7 @@ DO_ZPZ_FP(flogb_d, float64, H1_8, do_float64_logb_as_int)
 
 static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint16_t neg1, uint16_t neg3, bool fpcr_ah)
+                            uint16_t neg1, uint16_t neg3, int flags)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4826,16 +4826,10 @@ static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
             if (likely((pg >> (i & 63)) & 1)) {
                 float16 e1, e2, e3, r;
 
-                e1 = *(uint16_t *)(vn + H1_2(i));
+                e1 = *(uint16_t *)(vn + H1_2(i)) ^ neg1;
                 e2 = *(uint16_t *)(vm + H1_2(i));
-                e3 = *(uint16_t *)(va + H1_2(i));
-                if (neg1 && !(fpcr_ah && float16_is_any_nan(e1))) {
-                    e1 ^= neg1;
-                }
-                if (neg3 && !(fpcr_ah && float16_is_any_nan(e3))) {
-                    e3 ^= neg3;
-                }
-                r = float16_muladd(e1, e2, e3, 0, status);
+                e3 = *(uint16_t *)(va + H1_2(i)) ^ neg3;
+                r = float16_muladd(e1, e2, e3, flags, status);
                 *(uint16_t *)(vd + H1_2(i)) = r;
             }
         } while (i & 63);
@@ -4845,48 +4839,51 @@ static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0, false);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0, 0);
 }
 
 void HELPER(sve_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0, false);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0, 0);
 }
 
 void HELPER(sve_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000, false);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000, 0);
 }
 
 void HELPER(sve_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000, false);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000, 0);
 }
 
 void HELPER(sve_ah_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0, true);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product);
 }
 
 void HELPER(sve_ah_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000, true);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product | float_muladd_negate_c);
 }
 
 void HELPER(sve_ah_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000, true);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_c);
 }
 
 static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint32_t neg1, uint32_t neg3, bool fpcr_ah)
+                            uint32_t neg1, uint32_t neg3, int flags)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4898,16 +4895,10 @@ static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
             if (likely((pg >> (i & 63)) & 1)) {
                 float32 e1, e2, e3, r;
 
-                e1 = *(uint32_t *)(vn + H1_4(i));
+                e1 = *(uint32_t *)(vn + H1_4(i)) ^ neg1;
                 e2 = *(uint32_t *)(vm + H1_4(i));
-                e3 = *(uint32_t *)(va + H1_4(i));
-                if (neg1 && !(fpcr_ah && float32_is_any_nan(e1))) {
-                    e1 ^= neg1;
-                }
-                if (neg3 && !(fpcr_ah && float32_is_any_nan(e3))) {
-                    e3 ^= neg3;
-                }
-                r = float32_muladd(e1, e2, e3, 0, status);
+                e3 = *(uint32_t *)(va + H1_4(i)) ^ neg3;
+                r = float32_muladd(e1, e2, e3, flags, status);
                 *(uint32_t *)(vd + H1_4(i)) = r;
             }
         } while (i & 63);
@@ -4917,48 +4908,51 @@ static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0, false);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0, 0);
 }
 
 void HELPER(sve_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0, false);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0, 0);
 }
 
 void HELPER(sve_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000, false);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000, 0);
 }
 
 void HELPER(sve_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000, false);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000, 0);
 }
 
 void HELPER(sve_ah_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0, true);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product);
 }
 
 void HELPER(sve_ah_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000, true);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product | float_muladd_negate_c);
 }
 
 void HELPER(sve_ah_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000, true);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_c);
 }
 
 static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
                             float_status *status, uint32_t desc,
-                            uint64_t neg1, uint64_t neg3, bool fpcr_ah)
+                            uint64_t neg1, uint64_t neg3, int flags)
 {
     intptr_t i = simd_oprsz(desc);
     uint64_t *g = vg;
@@ -4970,16 +4964,10 @@ static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
             if (likely((pg >> (i & 63)) & 1)) {
                 float64 e1, e2, e3, r;
 
-                e1 = *(uint64_t *)(vn + i);
+                e1 = *(uint64_t *)(vn + i) ^ neg1;
                 e2 = *(uint64_t *)(vm + i);
-                e3 = *(uint64_t *)(va + i);
-                if (neg1 && !(fpcr_ah && float64_is_any_nan(e1))) {
-                    e1 ^= neg1;
-                }
-                if (neg3 && !(fpcr_ah && float64_is_any_nan(e3))) {
-                    e3 ^= neg3;
-                }
-                r = float64_muladd(e1, e2, e3, 0, status);
+                e3 = *(uint64_t *)(va + i) ^ neg3;
+                r = float64_muladd(e1, e2, e3, flags, status);
                 *(uint64_t *)(vd + i) = r;
             }
         } while (i & 63);
@@ -4989,43 +4977,46 @@ static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
 void HELPER(sve_fmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0, false);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0, 0);
 }
 
 void HELPER(sve_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0, false);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0, 0);
 }
 
 void HELPER(sve_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN, false);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN, 0);
 }
 
 void HELPER(sve_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN, false);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN, 0);
 }
 
 void HELPER(sve_ah_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                               void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0, true);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product);
 }
 
 void HELPER(sve_ah_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN, true);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_product | float_muladd_negate_c);
 }
 
 void HELPER(sve_ah_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
                                void *vg, float_status *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN, true);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0,
+                    float_muladd_negate_c);
 }
 
 /* Two operand floating-point comparison controlled by a predicate.
-- 
2.43.0

