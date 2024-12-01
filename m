Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2151867njk;
        Sun, 1 Dec 2024 07:13:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU90IW8Op82YnbjKwwHFY+u4ClhqEHxKHYTGkf1vMGOx9FM75sKFJMvWDdDY7QjV9iRNW6hJXVBbNeusw==@linaro.org
X-Google-Smtp-Source: AGHT+IFMNI6hdA7pnDIbNRnnRJ3wUx+9YxfBXDxC7QJgbZMa8DHdkJCozpbqAk1QCw968sWOzUNX
X-Received: by 2002:a05:6214:2308:b0:6d4:1c9d:4f47 with SMTP id 6a1803df08f44-6d864d25b2cmr247330646d6.13.1733066038298;
        Sun, 01 Dec 2024 07:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066038; cv=none;
        d=google.com; s=arc-20240605;
        b=ipA8xqSnRstAhTlnKb3aXxgdoH39nX3kzq7fyDxvW/iUfgfci/AxZONFaQR82/NmP0
         ZCXGHo/J3/Lb1FYztAt8iMUi+Wzd7LmzN1yugy8Y9MYZ93iLBneLVpzUczrsNy3BbJ5G
         sjWV8sbU8Sa+N0KQA3rgCXZnqBIjTAj/ErviwsFhI7mnzxMTgj6wVN5ywpMMnepx7Y3O
         0d5pCA32OMWmtEvUMH+ekjvLZhQ3w6OyUKdF2dpk78A1FjuT6X2ijqeAEOdrrga7TPEg
         hIUxl8ctHOiTJfqiQa5bs9PAMyGM9GWKmC/z+wM4EVZectUNkeiQ1MQMAnZ+x+fhXIUW
         zM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=idkRc83+8k6kQAE/UEu1d/YkVql+qpZ6btFzhSMVuCI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=BFTGdospulqA7WTCgN9Dm+aX/udxurts2RhpqJL5Zpfdni53D7mUvw//3Wc9S9xEKb
         DzreotcA0sa/87KRGCbNK42P9YoAbkM5/tPSysKAidSaiABvd633DiOOcSHyUNFR3feh
         Gv6FHO4Zi6vUM3H189DgsjqM3T5bufEgriG3uxoC3MSTrWi4Gw3IYE20P7Hh07IT3+Yd
         bsop60IHIrnd0TqKd6aPxiqkTEqpeLZ7d3ycA/ihqRwDCjDGDMXLST7D+Ihov7YEQIjh
         En0E3NJSb9CkWXgNzwwYy3dYv7GuJ8MfIG5ekCGTozuBr0TM3B22iHeMo0u3VBmX1uw2
         1fow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S9x1/0bd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d87559dc0asi88138416d6.553.2024.12.01.07.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S9x1/0bd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWz-0001Su-8I; Sun, 01 Dec 2024 10:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWu-0001PL-Ut
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:37 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWt-0004Fl-5g
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:36 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-71d4e043dd9so1377546a34.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065594; x=1733670394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idkRc83+8k6kQAE/UEu1d/YkVql+qpZ6btFzhSMVuCI=;
 b=S9x1/0bd9mzsmKYqIM0c8vfsNC1u+S3+LlnhWgN6dEEEV4yTaY/09mRj+jXOzaniDm
 Bx+7hfNa3sK69erVbRGHVDsSoDMx7R670TXw4s01TghzBdruook6qBdY0VfvMd6VfI/U
 XXY+3mEsewQbScp3KLi3/ln8wrbkswEKXDkW2HPPLTp/DUEKb1YEdy9UXLXheZPresQd
 1E98i10lmI0VYcVL2KvnUdcmcLQXCIfGyVZw1h2SkMBIZtegtkTTJ+4hX0hn6kYUEd1H
 Qozy6PAo4sFnjO7tYMXHa1r3ICjZYcXP2Vdj06g/X2j1kh7hBatOXSzVatM3a5x+AzdU
 WaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065594; x=1733670394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idkRc83+8k6kQAE/UEu1d/YkVql+qpZ6btFzhSMVuCI=;
 b=DIuJt3vY+ubxvASRsS2SYm2ttUNrq2uOg3YxQ3ql5K1QrGMLDE9v7TxvMjcUPNNXyJ
 K+/LNVA1ZhVzpNqyjPzndmprjFC3ZgEwhiEv9c29gQyvQ2rwvTzsSHTyLpgsrm510phT
 qYjcQRO9sYALf1DTg762Za+ZqlutFPLNFAW4JfHdIPI76X33hMfl+X+RQA80LYSP3zaK
 KuKqMjy6VRtw+JyeLEPdrNZ4NeO59MMe0v09phhjO80Jant1zEiMKhM0x1Y57QGkxgA/
 uE/akk7K3TRhdrms9ji2G/bjiiC0TUCbr5ffkS6BnZhnMLMNAEPcY5PGVQ8nv57t1lPS
 QPuA==
X-Gm-Message-State: AOJu0Yw3tFihQDtAKjiu1KGceFMj7U38f0mVrW1J1rD3nLKZFNEoRZEh
 a0gX+zFsMQFLqLX8WbqbMdgmhNqWcIC9soGC3NLPoBZqzQv+tFqzvlbXleyoETyzlJcpIZ3FKQT
 /D2I=
X-Gm-Gg: ASbGncs6bBwmi7ThT5AQwQ84HnGrxc3/559DSy1bW1ZiiwYIV6ckwHygg/G+fuisu6R
 vZC3bvkZ8YIBosLGR2WuFVQEei3J+8fw7td1A8ltdG7VBQlojyuLLxzwtQHUB+yd+eyHKylD8nK
 TCxztWwvAgCmIkeSDshjFkFTeHgZ+k1NhH0BYO9okTvKxKSPIR6QH+M261VZ49PHUkil4YHwFqu
 DoEHpq46jpg+3HorolXNIySB7Xs2an4mgBU+xLEhXW5Pshbl+hs1Prd7OQEfwhPoHi1leZrVs7X
 UMZ1N37WMpS1ybEa4hxacktjTuCh2rVOJYcr
X-Received: by 2002:a05:6830:4982:b0:71d:5a8a:1a29 with SMTP id
 46e09a7af769-71d65cb2cc0mr14825248a34.14.1733065593785; 
 Sun, 01 Dec 2024 07:06:33 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/67] target/arm: Introduce fp_access_check_vector_hsd
Date: Sun,  1 Dec 2024 09:05:20 -0600
Message-ID: <20241201150607.12812-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
X-TUID: a2l7Y0il5UPi

Provide a simple way to check for float64, float32, and float16
support vs vector width, as well as the fpu enabled.

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

