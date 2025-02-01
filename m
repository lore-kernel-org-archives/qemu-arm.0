Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143754njb;
        Sat, 1 Feb 2025 08:44:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8Somq+ngGkC4VqCJCHNUBcuA5wo+D0x6WXoq9psAS+EwVBEeQVCz97Zy3du4J/b/ZEfnbj7fR56EyJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZ+Z4kkMYuVImr+BAgxsLMrMErG3kDfjn6+AppAj26pbUHZyJ6PYcsi0dAE9aUmWlTCLXt
X-Received: by 2002:a05:6214:dcf:b0:6d9:2f70:2dab with SMTP id 6a1803df08f44-6e25b08a1a9mr100746146d6.16.1738428280114;
        Sat, 01 Feb 2025 08:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428280; cv=none;
        d=google.com; s=arc-20240605;
        b=ROoRMNrGRJwIKMLki0fz2z7FDNNfReyEunMHP5uk6gY4os7tM1RKKW1w5sDMaI26Vf
         rOLxvQhDd7gBpVp/VaLfMhYGFlYKkT06U98AnNEzQuWbteaRp4fgoKz/RP9nHnhz2MFh
         vDK85rFvsxioStNGqitKnBWtTRum6qrKSibIEOvLuyp+2PP1YAmtOUPMRlBuzbXM6hSF
         X40MsKDYGAZ0cc1zXzFV5QJiAybZ2SVAzNVW9l3IJh+vmUIsOKyvn4S7h9Y8jh9e/lVr
         KztE+zhM7ti0VTiZWNfIdeDG2An/5DudW//aaE1XiE9Ep4Bn5rU38SYiI0pYTf83DYS8
         NuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kx1dXlR2BEB9cLV8DknkSNZdxULxeneGoMVDz4ondQ8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=LYD43KsXBcVsjPUhjQrwkSjLEvUQ7Kw/UETGmE2xC9/3GijiqJCJ2ED/L6z+tLkW5Z
         kEtabU1djhW3LvSIJr58XoX3q2dwZmfhhloVXb29o3w9cO8HZRjJULJFbVE56XSc+jK1
         kh5qt9k7sMdEXZGpnZxAim4rMEqo0W2SCsl62Iz07dJwERy0sf540ar/impd0GMGYyFo
         erYdA6V/Im9V1NtdVqrABkqdk5eEL6jvcdkIx3rcuvW0GPvs6eaY3WF/WvssD/b1Bm5U
         YrVaLz/mdCor8zZBk/JJtn8thxbgjE7Te+xYc5yujzn1s6DaG5UViBj0nXRYdZAcEU1I
         nDJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X8h46/jV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2548141c2si61460776d6.79.2025.02.01.08.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X8h46/jV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY0-00067r-88; Sat, 01 Feb 2025 11:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXv-00064s-O7
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXs-000162-V0
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:39 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso20891445e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428035; x=1739032835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kx1dXlR2BEB9cLV8DknkSNZdxULxeneGoMVDz4ondQ8=;
 b=X8h46/jVSSyBaEOnQJbs95+uhs5c6HKmJqX7/3GEVr2UJquotjZ5KJbnilBtM0prq9
 swCulroyz4AI7ffd7kgkrHwpgn/rYg3XeoQHYOu16yHJPhNn3eVFNmYV7L4X6tP+rQWO
 bXrlGh20abBgTS/p+XXkO6pVUMTiyvJsCresbaJz3DlOjPP16BZXjnOJkZIioDJmV7nW
 rKW+u7JVJd8Ys/03esnnYRb8mjNxqF4Y7OdzpdvT+o0SKPjIWPWTObKadf/71q83NyyV
 Wentc4o7S5G4pJrRartDpz4yhP1fkx5ys7R6rQmbPNtnOPMzdYfXLxAE5lSlL4ZUhun6
 zKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428035; x=1739032835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kx1dXlR2BEB9cLV8DknkSNZdxULxeneGoMVDz4ondQ8=;
 b=Gx09Ys+rAO7Drf2T4sWw7yT+OGPvjWI+brVmRzHzX2FYbUELOGUgG355NzTZxRM+7E
 4Lryg68OPcq/E76ABVFDL/6IjMfYskWZwCYrgUDT4EGoexyA2e2bIfDjUNHx05W4Kal0
 cpJMwIV8SYy0s6oQbYhOb3i2B8J+MBf2JgR/GxYuNgocK9xnsQn8uqDw1FT21NC5RHkh
 aHFwk0lO5Vd6vLFB7uFRq8Mjho1b7Z1Z3ZcV0zeLeoAx7Ko3n1Lh/hAQA147krc8ImPr
 Fr6uS8ykXRLuJnTWN25d4+zwKe2MydTNGn2rdxDdB65p3sXbwBBIhuxEkDe+CjB1fZat
 oQqw==
X-Gm-Message-State: AOJu0YzOqKSiyviE6uKkrt9K49HkaLUAQ0G+HKErajugEjGZhEqzfk6x
 M1/deptPdPyfjvIlq+UYvjfr68GIDahafgLOkdJkIZM3l0y/CPcMjxnSdVZVxI3iZhHgFvu27PT
 l
X-Gm-Gg: ASbGnct3zLE9Qu3grQi+A76x9yS2Kh1FiUVY7S8PkqOJT4CV6jL0UojgWm1pB6nWi0D
 0RyaTDMckOv1IoTi/FP14RJvHwYkLcXn62om7boTonVOq2VxjLtC5jd9LduM2WdXwvTuVe1iQNv
 B56mAGaYCQRXiOpuOMbJ5iUB7qL0v/D11gKQyG8qcJG4ffQS6ri+NoAt8aVGPE9f6Rkmvs5b8Nf
 1sGgf0YRWFMK60HajFInRD+Q6Jv3HVU9XzgdgBKdkcWal0fdOVXLU4bKFg5xn1UDpvtz+ruGAgm
 W403mTctr2gfgRxMNwhl
X-Received: by 2002:a05:600c:35d3:b0:438:d9f1:f5cc with SMTP id
 5b1f17b1804b1-438dc3c3983mr143210595e9.8.1738428034807; 
 Sat, 01 Feb 2025 08:40:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/69] target/arm: Use FPST_FPCR_AH for BFMLAL*,
 BFMLSL* insns
Date: Sat,  1 Feb 2025 16:39:17 +0000
Message-Id: <20250201164012.1660228-15-peter.maydell@linaro.org>
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
X-TUID: VT+nS1zSCb7L

When FPCR.AH is 1, use FPST_FPCR_AH for:
 * AdvSIMD BFMLALB, BFMLALT
 * SVE BFMLALB, BFMLALT, BFMLSLB, BFMLSLT

so that they get the required behaviour changes.

We do this by making gen_gvec_op4_fpst() take an ARMFPStatusFlavour
rather than a bool is_fp16; existing callsites now select
FPST_FPCR_F16_A64 vs FPST_FPCR_A64 themselves rather than passing in
the boolean.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 20 +++++++++++++-------
 target/arm/tcg/translate-sve.c |  6 ++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bb32ccabf0e..1da6e2b9456 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -765,10 +765,11 @@ static void gen_gvec_op4_env(DisasContext *s, bool is_q, int rd, int rn,
  * an out-of-line helper.
  */
 static void gen_gvec_op4_fpst(DisasContext *s, bool is_q, int rd, int rn,
-                              int rm, int ra, bool is_fp16, int data,
+                              int rm, int ra, ARMFPStatusFlavour fpsttype,
+                              int data,
                               gen_helper_gvec_4_ptr *fn)
 {
-    TCGv_ptr fpst = fpstatus_ptr(is_fp16 ? FPST_A64_F16 : FPST_A64);
+    TCGv_ptr fpst = fpstatus_ptr(fpsttype);
     tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
                        vec_full_reg_offset(s, rn),
                        vec_full_reg_offset(s, rm),
@@ -5837,7 +5838,8 @@ static bool trans_BFMLAL_v(DisasContext *s, arg_qrrr_e *a)
     }
     if (fp_access_check(s)) {
         /* Q bit selects BFMLALB vs BFMLALT. */
-        gen_gvec_op4_fpst(s, true, a->rd, a->rn, a->rm, a->rd, false, a->q,
+        gen_gvec_op4_fpst(s, true, a->rd, a->rn, a->rm, a->rd,
+                          s->fpcr_ah ? FPST_AH : FPST_A64, a->q,
                           gen_helper_gvec_bfmlal);
     }
     return true;
@@ -5870,7 +5872,8 @@ static bool trans_FCMLA_v(DisasContext *s, arg_FCMLA_v *a)
     }
 
     gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                      a->esz == MO_16, a->rot, fn[a->esz]);
+                      a->esz == MO_16 ? FPST_A64_F16 : FPST_A64,
+                      a->rot, fn[a->esz]);
     return true;
 }
 
@@ -6450,7 +6453,8 @@ static bool do_fmla_vector_idx(DisasContext *s, arg_qrrx_e *a, bool neg)
     }
 
     gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                      esz == MO_16, (a->idx << 1) | neg,
+                      esz == MO_16 ? FPST_A64_F16 : FPST_A64,
+                      (a->idx << 1) | neg,
                       fns[esz - 1]);
     return true;
 }
@@ -6585,7 +6589,8 @@ static bool trans_BFMLAL_vi(DisasContext *s, arg_qrrx_e *a)
     }
     if (fp_access_check(s)) {
         /* Q bit selects BFMLALB vs BFMLALT. */
-        gen_gvec_op4_fpst(s, true, a->rd, a->rn, a->rm, a->rd, 0,
+        gen_gvec_op4_fpst(s, true, a->rd, a->rn, a->rm, a->rd,
+                          s->fpcr_ah ? FPST_AH : FPST_A64,
                           (a->idx << 1) | a->q,
                           gen_helper_gvec_bfmlal_idx);
     }
@@ -6614,7 +6619,8 @@ static bool trans_FCMLA_vi(DisasContext *s, arg_FCMLA_vi *a)
     }
     if (fp_access_check(s)) {
         gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                          a->esz == MO_16, (a->idx << 2) | a->rot, fn);
+                          a->esz == MO_16 ? FPST_A64_F16 : FPST_A64,
+                          (a->idx << 2) | a->rot, fn);
     }
     return true;
 }
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index be2b5528ba0..e38a49dd31c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7117,7 +7117,8 @@ TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_env_arg_zzzz,
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
-                              a->rd, a->rn, a->rm, a->ra, sel, FPST_A64);
+                              a->rd, a->rn, a->rm, a->ra, sel,
+                              s->fpcr_ah ? FPST_AH : FPST_A64);
 }
 
 TRANS_FEAT(BFMLALB_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, false)
@@ -7127,7 +7128,8 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 {
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
                               a->rd, a->rn, a->rm, a->ra,
-                              (a->index << 1) | sel, FPST_A64);
+                              (a->index << 1) | sel,
+                              s->fpcr_ah ? FPST_AH : FPST_A64);
 }
 
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
-- 
2.34.1

