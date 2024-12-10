Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3439754njb;
        Tue, 10 Dec 2024 08:21:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUU3YghgSpCvJSvwgw+HVbUTVMicf/i77PG9RpzISTBd3crtwttmsHIp+50GgaUSfVpbSjfT+RZx4fVxw==@linaro.org
X-Google-Smtp-Source: AGHT+IFhimiHvt7YK+LFG7n7dMhoTxHi7gJWwlPhHOK4BKqZA0eYZMFIXkbdNoaeGvTsJ2XPA1z5
X-Received: by 2002:a05:620a:24d2:b0:7b6:7257:1359 with SMTP id af79cd13be357-7b6bcac06c4mr2799925985a.13.1733847688262;
        Tue, 10 Dec 2024 08:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847688; cv=none;
        d=google.com; s=arc-20240605;
        b=WSZ74zXkcQKlSTYpJGwiO/OzXDbVOu6z4Y2rzhxbsLZzKVZ/oNpeAr7cWR/I4KkKkl
         QcY67azb95Jska6yVtlqerxyyINQsnv7bkl7h44iKB5Y17MzoRJKE1Lpo04QZxnMIgk+
         wHKx4fKGk3jHOzu0uTphpfGWQjYVbX7fJIK3hGB1H2U/wmJbkSQkUUPocZL8asjM1uWy
         1v7hGshFMJQ8ryhhFTJh9a5pcI0EM/9Q287UspfPfwoRUeFs7e2sObLoJ+9lM+sv8FlC
         DOQ2Xprwlk5UtKRrt14AvrpF++KWukOIsOVHWczCZu6MYuHACyJA2mpnUCYscKQVlDVd
         2z7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OlPqq3SkO/OL532CbnGb++BEeuAMvtHyeW45jNWCD1U=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Zy0fRx+ADd20TI01vElcllfpMnemjSYvyNMDLoMUZ/Xh1LMagLc6zZqok6HL0Pd30A
         Eh0kPGXbrwjNqeVV399G3xyh/j6CGgZz1OMr6571B82gZrixNb8ga1JaYjDYH4MzvOIp
         aukO4+wdJ5R2it8tds0PdJNl+XdoJub2zN88EjVvvi6o3Yqf27Q9+qRyKqXxR2qgXVXC
         sat9ujyoDmwh3F7i2QTW8IR4xc7BgtQ/bw85w/4LNp+nkrb5APMDuwQXKcHFgif0OedM
         zen6AeT94yz1PdV+ZpoVeTvvltEvgDs1harGCsSXmdct/LCWmYDiFxBktMK8uf/hOhqX
         PkdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCT55eQI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d0768486si677514485a.411.2024.12.10.08.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCT55eQI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tL2xP-0003jx-EA; Tue, 10 Dec 2024 11:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2x4-0002wX-1E
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 11:19:15 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2x0-0006Sc-WC
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 11:19:09 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so2796412e87.2
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2024 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847545; x=1734452345; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlPqq3SkO/OL532CbnGb++BEeuAMvtHyeW45jNWCD1U=;
 b=QCT55eQI0UFAJyji6xCXvpCz+H+ckjpX1dQVpiV8GYjlw9Ze8p5E9Py96LNSCQAhlX
 RZ5PHFbCR6LejoSoPEqE0BI8HeuREZdlS2zinUQkd0Wjzh6JM1NwX6O/sjyOnhGoVNU7
 FlPtemdmWUCUUtJV9wXRuq8rfyEqpv9GRObiJDFJXSUqGKSpLMpUII+bdxW7LEM8J44k
 rVtDI3gVeuZibAjfdTCk5JMTKGUqMjC+lG4yY7m40akORhMkXEvendHPsYV3DlF2Fx9V
 gLfmmfOgDzTNSP9pFN5llnzJNP6aDzT3rvC+yRlB+YtCyN2lGtZHrBhamib5yOVPwMH3
 4U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847545; x=1734452345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlPqq3SkO/OL532CbnGb++BEeuAMvtHyeW45jNWCD1U=;
 b=cIvW1A4FKEjFoQ/VEoo/0IGdkvUIvN3pGS6qRHPKQJBGoPBOgRRtqAEBXHL9E+7nfZ
 JoSs/oaP5Po6j1d8KI91HbXnWCJUGTIyGHsrppMNVCsNxcN5BdWCXaHWAakc2suVp9Ba
 ZGhnKHWo/cNgrYRrobt7W97uI+d/vl5YTn2x0pnEq/jYWuX3LiGMm542FrT0ZX9DlNuj
 28EkJQstC6e2m7lB2VXIC5d+FKpP3NQdEqC2Zv+sPU6NrfCAQELRbkdO7dJ6mRR1CviZ
 Gl4hrJ3Nh8lzAg5iI2ZPRtsp9CX5Wc4K6w1xndpZoR0Ihmym87WQIxRodlNuDq5ulYzL
 jJ2Q==
X-Gm-Message-State: AOJu0Yy4APRY5dL7fwL2aTCRppyRtpob6GgoJnDwrwrhmrEDpJN/7tsx
 UHldbmzNohKUUO5L0PZWY2fezpqr54MPAcDBJHhhCNCRNS6MflnjwwMWGZoMC4eF9ixCcbGoS6/
 fnjCUpS5H
X-Gm-Gg: ASbGncu1K3PhPF0HJ3BnnnaWGOzHLeqMDzsoPK1d2nDTBuchCdCRwKHqm+C1NtbzCJo
 wJU7u4GfUrlxqnym9s0U2sJ5dwTlwDCzLR0BYGg2xspYcuMrjYszdUfpGzYbniNRMko/let7TN4
 TVw4oZkhFV0+arXoxR785aacGb7ywJWkUeqCoOzGHmeiA+qy4e/MX1TSoIa+XSrx1rRw3yQs6HC
 7qIprA1QzfJMrGRZMEnjAxfA+1cF7aEnUlkXyEtKSDaOWcRC+swpmGc720=
X-Received: by 2002:a05:6512:2209:b0:53e:36ca:6578 with SMTP id
 2adb3069b0e04-53e36ca66e1mr7248318e87.43.1733847545119; 
 Tue, 10 Dec 2024 08:19:05 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:19:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 21/69] target/arm: Introduce fp_access_check_vector_hsd
Date: Tue, 10 Dec 2024 10:16:45 -0600
Message-ID: <20241210161733.1830573-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ArfGeK2Rrf34

Provide a simple way to check for float64, float32, and float16
support vs vector width, as well as the fpu enabled.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 135 +++++++++++++--------------------
 1 file changed, 54 insertions(+), 81 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4e47b8a804..4611ae4ade 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1260,6 +1260,28 @@ static int fp_access_check_scalar_hsd(DisasContext *s, MemOp esz)
     return fp_access_check(s);
 }
 
+/* Likewise, but vector MO_64 must have two elements. */
+static int fp_access_check_vector_hsd(DisasContext *s, bool is_q, MemOp esz)
+{
+    switch (esz) {
+    case MO_64:
+        if (!is_q) {
+            return -1;
+        }
+        break;
+    case MO_32:
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return -1;
+        }
+        break;
+    default:
+        return -1;
+    }
+    return fp_access_check(s);
+}
+
 /*
  * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
@@ -5420,27 +5442,14 @@ static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a, int data,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
     MemOp esz = a->esz;
+    int check = fp_access_check_vector_hsd(s, a->q, esz);
 
-    switch (esz) {
-    case MO_64:
-        if (!a->q) {
-            return false;
-        }
-        break;
-    case MO_32:
-        break;
-    case MO_16:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            return false;
-        }
-        break;
-    default:
-        return false;
-    }
-    if (fp_access_check(s)) {
-        gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
-                          esz == MO_16, data, fns[esz - 1]);
+    if (check <= 0) {
+        return check == 0;
     }
+
+    gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
+                      esz == MO_16, data, fns[esz - 1]);
     return true;
 }
 
@@ -5768,34 +5777,24 @@ TRANS_FEAT(FCADD_270, aa64_fcma, do_fp3_vector, a, 1, f_vector_fcadd)
 
 static bool trans_FCMLA_v(DisasContext *s, arg_FCMLA_v *a)
 {
-    gen_helper_gvec_4_ptr *fn;
+    static gen_helper_gvec_4_ptr * const fn[] = {
+        [MO_16] = gen_helper_gvec_fcmlah,
+        [MO_32] = gen_helper_gvec_fcmlas,
+        [MO_64] = gen_helper_gvec_fcmlad,
+    };
+    int check;
 
     if (!dc_isar_feature(aa64_fcma, s)) {
         return false;
     }
-    switch (a->esz) {
-    case MO_64:
-        if (!a->q) {
-            return false;
-        }
-        fn = gen_helper_gvec_fcmlad;
-        break;
-    case MO_32:
-        fn = gen_helper_gvec_fcmlas;
-        break;
-    case MO_16:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            return false;
-        }
-        fn = gen_helper_gvec_fcmlah;
-        break;
-    default:
-        return false;
-    }
-    if (fp_access_check(s)) {
-        gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                          a->esz == MO_16, a->rot, fn);
+
+    check = fp_access_check_vector_hsd(s, a->q, a->esz);
+    if (check <= 0) {
+        return check == 0;
     }
+
+    gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
+                      a->esz == MO_16, a->rot, fn[a->esz]);
     return true;
 }
 
@@ -6337,27 +6336,14 @@ static bool do_fp3_vector_idx(DisasContext *s, arg_qrrx_e *a,
                               gen_helper_gvec_3_ptr * const fns[3])
 {
     MemOp esz = a->esz;
+    int check = fp_access_check_vector_hsd(s, a->q, esz);
 
-    switch (esz) {
-    case MO_64:
-        if (!a->q) {
-            return false;
-        }
-        break;
-    case MO_32:
-        break;
-    case MO_16:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            return false;
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    if (fp_access_check(s)) {
-        gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
-                          esz == MO_16, a->idx, fns[esz - 1]);
+    if (check <= 0) {
+        return check == 0;
     }
+
+    gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
+                      esz == MO_16, a->idx, fns[esz - 1]);
     return true;
 }
 
@@ -6383,28 +6369,15 @@ static bool do_fmla_vector_idx(DisasContext *s, arg_qrrx_e *a, bool neg)
         gen_helper_gvec_fmla_idx_d,
     };
     MemOp esz = a->esz;
+    int check = fp_access_check_vector_hsd(s, a->q, esz);
 
-    switch (esz) {
-    case MO_64:
-        if (!a->q) {
-            return false;
-        }
-        break;
-    case MO_32:
-        break;
-    case MO_16:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            return false;
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    if (fp_access_check(s)) {
-        gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                          esz == MO_16, (a->idx << 1) | neg,
-                          fns[esz - 1]);
+    if (check <= 0) {
+        return check == 0;
     }
+
+    gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
+                      esz == MO_16, (a->idx << 1) | neg,
+                      fns[esz - 1]);
     return true;
 }
 
-- 
2.43.0

