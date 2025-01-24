Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp936071njk;
        Fri, 24 Jan 2025 08:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7/P1hKu7Rvfgld9claan8pvkLpC2IsFMUK0ojl/1tIVkY1xhHHgpFDbLlG/rGcgx66IVC1X5t/wx36Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEsW70UhrmEU34+V9afSmSwhx120I4WZo4bJ6ukydaMqypmXxwJSvIeacf70kZrnBMaSKub
X-Received: by 2002:a05:6102:3e27:b0:4b2:5c4b:b0aa with SMTP id ada2fe7eead31-4b690c992c9mr29786232137.17.1737737099521;
        Fri, 24 Jan 2025 08:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737099; cv=none;
        d=google.com; s=arc-20240605;
        b=d2klNaMnb0atAKmZQpaZJdWvKvy7bnCP/nQ6lSlgQ5149tj96NHM4eODEFUrjDzqRn
         0S8Ar24W1vSu3/7boFqFKglPC7WFfGIPMMTukf8hjiQbXYy783ncmv/3U1kQK2sMcFwh
         6QImxscmfgIvRb5G5wONU0RyIgraUgcZ+e2iRR2nbzUG7pZo8c0qCbyHzp9Fj+/Gt98w
         f1czi/UDB3Vl2FVmC83ALYb5nNCkI86FFLJNj9JJSOvPUdZU9P/sXzir7AqmMPyAWYc5
         USXRdHduZMHSPJ0lfb6MS/gpCT2ZM7YFIP4t+qYY8kud2oDIBrkONmZlV0ToPJx0Ly99
         gQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2VLdsf7Pn6hVzCCffEPe1bVqQf+9Fb334tfF7e6kw7Y=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Sl1h1iE/5mcoUsOBuk3+KgICALn17NVnedECTSpEojUftuWDU3fe9z1PUVUfpYvuov
         eSC8d8WMtXKx7pHx/jqePeOipwInnwdqUMJ9gGRzXsQkiw3TrMku71COfz1bYA3OzxEj
         kQc8HkqByjWiX/QxJN6YHdb5lPmFr0idXKZ7SnMOlBT4xtBqcmmjgYXhSqZB7UPwG83E
         XuTlbCvjs46aOEs1s1StBtulTH+MPMKTKHhPJdTNrPyzdgZ9GkLLirPGKhfr7zm77f2K
         t11o9JKBo6PB+9dXl8S+j06NTCVCX0k7Sn7HwIk7tvvtFAFBb3VosoIIHXdTJ8y6/cux
         dMSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHMaIdcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709981c4dsi823488137.284.2025.01.24.08.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHMaIdcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMaA-0006z5-L5; Fri, 24 Jan 2025 11:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYg-0004NN-8N
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:26 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYe-0005ba-70
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436341f575fso24722505e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736162; x=1738340962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2VLdsf7Pn6hVzCCffEPe1bVqQf+9Fb334tfF7e6kw7Y=;
 b=eHMaIdcVHd+fSZeR0iCvT8uDUnM3PYM0dEwUAiucbKXfwfPRcXmiU2/Jg5H00EvWh3
 e+wIZz7whuJpbY1NPv3Ynkfis5n6RlfTYgk8T7PdjZ+Kgkrqtugo+/jppLv+FVX9BSIS
 d28Ab4x7TBelZ5yAOR407KlGTL0Fgk61Fa+yf42t8nnQFEgkj/4tqQNrpW+nPBtHDNMf
 OcOvvq3zbDWhxzKVIKK6q3SgkVzsxTLR7j3MK8om/KWW1k1wQY65mQJ5ZJlYz4Z/Dy0r
 88lh7HDQQocY6hIvxboD7r2+43HGBnYaeQNKw6S1gfFmO3dETr1saxxbAoKy0Gmi//eD
 SNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736162; x=1738340962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VLdsf7Pn6hVzCCffEPe1bVqQf+9Fb334tfF7e6kw7Y=;
 b=k7Pow6JQjP7e0qs8YgU0VO1NwtjrM+kBupZ58gDO74yNAiyqZeYJSW37q544Nb7a/Z
 nSrAi/7ryfHxTRPS3L6NZnquB5JDb1Mm2/rwJwAd2lyDT9Nlp3Eb43iPmvfFzsX8M6jd
 udgVBOIQHhfzvrWBkOXqAUxJ8zkoJGvHRlYkYOaspQuYxYLfWrw1ca7haHffss7/tiRZ
 MZAMe6PppH/NvMT0woauDq5bmokgxGn76viX8pKiq6DECyYuwKTMOmuWArE4yxsO4JSg
 tAddiG6e0cNoDb4EsbKrX4uj0QcSzJ/nzeMolJ1H2H0B81NYbGFrUvM2M7WKF/vKucO9
 ooNA==
X-Gm-Message-State: AOJu0Yx3ltyFAHnS1YSzP0+wv4i8jRHd5o931c7a30DXjwGPQI8eAMcy
 l25PjsF4Bwe7i55Anaa63WXfqLm6k5g/fUTjLSeeCeBV3pScy54tiXaFsrmTsqvX2i8TdNv8Vuy
 o
X-Gm-Gg: ASbGnct8ADzcVI2jkubZ5A10QuzAb5t3kdf7297Dao7R2RC1tU8lAInBaGBGH6cWzQP
 bqB5jJtcSISvEKxWPMnO1xXUezrQ+jI6t/bnl8KHmRbNjH2dxyxUridkJKQypFjrlFGAywzIaM3
 AzOs+AuXKQyzZHSj4bUoONrxtgwzdEH0SzadYHFr3qVd1lC3ldHxIQtwiXbSbBLMf9L/43jxJAr
 hVyyULzh/9b9ZQcBRKpIcxIVvgoR2pYiWxW0JFkaom5gb6iGwMNd4xxnsFgpAEE2+LIsX98gcpE
 N8nmDTdhDms=
X-Received: by 2002:a05:600c:1c1e:b0:436:6460:e67a with SMTP id
 5b1f17b1804b1-43891452899mr251176375e9.25.1737736161721; 
 Fri, 24 Jan 2025 08:29:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/76] target/arm: Use FPST_FPCR_AH for BFMLAL*, BFMLSL* insns
Date: Fri, 24 Jan 2025 16:27:55 +0000
Message-Id: <20250124162836.2332150-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1WKpEx7d19Es

When FPCR.AH is 1, use FPST_FPCR_AH for:
 * AdvSIMD BFMLALB, BFMLALT
 * SVE BFMLALB, BFMLALT, BFMLSLB, BFMLSLT

so that they get the required behaviour changes.

We do this by making gen_gvec_op4_fpst() take an ARMFPStatusFlavour
rather than a bool is_fp16; existing callsites now select
FPST_FPCR_F16_A64 vs FPST_FPCR_A64 themselves rather than passing in
the boolean.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 20 +++++++++++++-------
 target/arm/tcg/translate-sve.c |  6 ++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d53864ad794..0b3e4ec136d 100644
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
-    TCGv_ptr fpst = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
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
+                          s->fpcr_ah ? FPST_FPCR_AH : FPST_FPCR_A64, a->q,
                           gen_helper_gvec_bfmlal);
     }
     return true;
@@ -5870,7 +5872,8 @@ static bool trans_FCMLA_v(DisasContext *s, arg_FCMLA_v *a)
     }
 
     gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                      a->esz == MO_16, a->rot, fn[a->esz]);
+                      a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64,
+                      a->rot, fn[a->esz]);
     return true;
 }
 
@@ -6450,7 +6453,8 @@ static bool do_fmla_vector_idx(DisasContext *s, arg_qrrx_e *a, bool neg)
     }
 
     gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                      esz == MO_16, (a->idx << 1) | neg,
+                      esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64,
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
+                          s->fpcr_ah ? FPST_FPCR_AH : FPST_FPCR_A64,
                           (a->idx << 1) | a->q,
                           gen_helper_gvec_bfmlal_idx);
     }
@@ -6614,7 +6619,8 @@ static bool trans_FCMLA_vi(DisasContext *s, arg_FCMLA_vi *a)
     }
     if (fp_access_check(s)) {
         gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
-                          a->esz == MO_16, (a->idx << 2) | a->rot, fn);
+                          a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64,
+                          (a->idx << 2) | a->rot, fn);
     }
     return true;
 }
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 4d77b55d545..ad415c43565 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7117,7 +7117,8 @@ TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_env_arg_zzzz,
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
-                              a->rd, a->rn, a->rm, a->ra, sel, FPST_FPCR_A64);
+                              a->rd, a->rn, a->rm, a->ra, sel,
+                              s->fpcr_ah ? FPST_FPCR_AH : FPST_FPCR_A64);
 }
 
 TRANS_FEAT(BFMLALB_zzzw, aa64_sve_bf16, do_BFMLAL_zzzw, a, false)
@@ -7127,7 +7128,8 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 {
     return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
                               a->rd, a->rn, a->rm, a->ra,
-                              (a->index << 1) | sel, FPST_FPCR_A64);
+                              (a->index << 1) | sel,
+                              s->fpcr_ah ? FPST_FPCR_AH : FPST_FPCR_A64);
 }
 
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
-- 
2.34.1

