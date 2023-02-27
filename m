Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4397664ejc;
        Mon, 27 Feb 2023 00:12:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+OozpC/Rq+FNoeN8zKT1CLhQZ3BljzKzBKg9WM+z4Y96LwJhpyl/hCCO3Wm3FWh6R3CI9o
X-Received: by 2002:a05:6214:29e4:b0:572:5a3a:f55 with SMTP id jv4-20020a05621429e400b005725a3a0f55mr22768977qvb.33.1677485577253;
        Mon, 27 Feb 2023 00:12:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485577; cv=none;
        d=google.com; s=arc-20160816;
        b=hRN4oEbuwsUnH/IlLc4B5pCh03HF4tpyQO78pPdgwmUS//8vcCmcGPbUzyAFdX5HQY
         +dHQ1QwD8WZIomL9w1rOA9VKajWraPjWdMUT8XOWJj6yU+4xOupHVrINuQnq+nY2uy9j
         pkc0zMv5XQauXQtKpc3COPKm/o+I/I67SOWn9wEqmsKHd/rAOXY18DDfXaMgjyIRsbqo
         OMqqgdmSdOR0nDgULIXS289bgeKrHpF9AAR+H6IuZ36oFZrlbXuzy2COaWUHNAR0ZLNb
         HI6+Py4Ay0NA8CrWA3+m78JKYmVjTaqa8CVn6c+NErb3jgKz8Ba45SC5tBb5Cch9+oxn
         rNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iYaMJQN3FS2hLRKLRxWbPb4i2fPMZWZUTwMSKfyflhs=;
        b=j/F0S2Cy9Y0kJZ6SI2MjqG49Thmr7ubkbZBzrhSkyZ5R8qH8yHJQMgDB7AdYz14pZz
         62se629ZqA1YxAq2frHnav4hCOabqHR0ngzmfHQMUn/cqUGi0Gmbdj8UfiJ8Bohc5RtR
         qq+NDr0vaab+CAPrbCAj1rfTTu9Lm21GxhMTBf7z54m6+3Rw4J8/EwLKspwPCY48LCh5
         qhnDZRUTviOA8q47VfceGCcq/vGSdD+cKWwDooCibP3ZMrU2FKCLdNEy1fNAAijLfPL/
         BjugLamdVUbRlL/VaqFn0OLk9OolNzeZq/zLgxNEWnGKbfpxT8xV30fODRJgMGYD92V9
         02Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9Pfe4pS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r137-20020a37a88f000000b0071e0d3ae973si5284484qke.275.2023.02.27.00.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:12:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9Pfe4pS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOP-00019v-QI; Mon, 27 Feb 2023 00:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNZ-00058r-10
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:54 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0007hw-Oo
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:52 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4403671pjg.4
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYaMJQN3FS2hLRKLRxWbPb4i2fPMZWZUTwMSKfyflhs=;
 b=i9Pfe4pS521rDBdpM+FVZq3a4cMLQFE83RrVP6TzWUipoEBlQds9bWgaLquzrRI3VE
 J3fF6D4WIuJ4/u0icN+2iYJ1HHQ/KNfM5RJM98wxAkMwUpvsXcTULWCwZZT3eM50E0Ty
 x7/ajGa/jzS+ALBMFq3whd8KIlqw42EQeg3ks+rBBe13xroCv6uga0mYUSyOMnbh1E1i
 U0VOVBvaU54yqsjr48618muhN/GIg1xeMXfxJiuPEOxaxHyQ68OFSkwedbxIHmmE9r4W
 xWxJ+DzfzrMyBVvHrE3kdi59kEcdR0mUVT80yFG33YjzqIedlr9TZCB1+HERPHmop0Zd
 lvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYaMJQN3FS2hLRKLRxWbPb4i2fPMZWZUTwMSKfyflhs=;
 b=up21kyDVNlKqwo+CPjJrDTzH7pmAvx4/0DglNxMqqDlzkDLG7mFee08U1EJfIYpeLm
 xz+UBL/N1ds+Kmu8jAIWRV50NJtHo/a1nZ9cHtRn+RfHYdD6ljSV+XalsWOnyd6s0LHW
 444Qd+S0xPnu6sbA65t3bF4mrSfq2AYOcxgyXOqSe9gx+a9VeJYapI3qgeVXA4Zj/c7P
 7jZO/CTY6aFgauapECVOqPXFyvHPtRhggco6ioZ74jHUhK6t5QozlJzpiMJeubzube5X
 v9m5BOfUXJLPAcaLEr2nAFwbWjKotLS4e7VrVVcKp8yqF6lvYZKEAgUQfIv7BTKz+G9J
 kpkg==
X-Gm-Message-State: AO0yUKUNcjGFSQwGTYL9eXj3YS0hQM3ouFkr8DQT6x8rpaILAK1f/R0N
 bILIJH3zdmzWKumupgdggXaNcSDZHBM2hqTScAo=
X-Received: by 2002:a17:902:f988:b0:19c:eb50:88b9 with SMTP id
 ky8-20020a170902f98800b0019ceb5088b9mr6494626plb.29.1677476927275; 
 Sun, 26 Feb 2023 21:48:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 69/70] tcg: Drop tcg_const_*_vec
Date: Sun, 26 Feb 2023 19:42:32 -1000
Message-Id: <20230227054233.390271-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: t/bWTpLO9uGn

Replace with tcg_constant_vec*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  4 ----
 tcg/tcg-op-vec.c          | 34 ++--------------------------------
 tcg/i386/tcg-target.c.inc |  9 ++++-----
 3 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 43ce4bfa7d..80a2597293 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -992,10 +992,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_vec tcg_const_zeros_vec(TCGType);
-TCGv_vec tcg_const_ones_vec(TCGType);
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
 /*
  * Locate or create a read-only temporary that is a constant.
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 0f023f42c6..aeeb2435cb 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -229,32 +229,6 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-TCGv_vec tcg_const_zeros_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, 0);
-    return ret;
-}
-
-TCGv_vec tcg_const_ones_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, -1);
-    return ret;
-}
-
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_zeros_vec(t->base_type);
-}
-
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_ones_vec(t->base_type);
-}
-
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
@@ -431,9 +405,7 @@ void tcg_gen_not_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_not_vec || !do_op2(vece, r, a, INDEX_op_not_vec)) {
-        TCGv_vec t = tcg_const_ones_vec_matching(r);
-        tcg_gen_xor_vec(0, r, a, t);
-        tcg_temp_free_vec(t);
+        tcg_gen_xor_vec(0, r, a, tcg_constant_vec_matching(r, 0, -1));
     }
     tcg_swap_vecop_list(hold_list);
 }
@@ -446,9 +418,7 @@ void tcg_gen_neg_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_neg_vec || !do_op2(vece, r, a, INDEX_op_neg_vec)) {
-        TCGv_vec t = tcg_const_zeros_vec_matching(r);
-        tcg_gen_sub_vec(vece, r, t, a);
-        tcg_temp_free_vec(t);
+        tcg_gen_sub_vec(vece, r, tcg_constant_vec_matching(r, vece, 0), a);
     }
     tcg_swap_vecop_list(hold_list);
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 883ced8168..e8e2a31658 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3651,6 +3651,7 @@ static void expand_vec_sari(TCGType type, unsigned vece,
         break;
 
     case MO_64:
+        t1 = tcg_temp_new_vec(type);
         if (imm <= 32) {
             /*
              * We can emulate a small sign extend by performing an arithmetic
@@ -3659,24 +3660,22 @@ static void expand_vec_sari(TCGType type, unsigned vece,
              * does not, so we have to bound the smaller shift -- we get the
              * same result in the high half either way.
              */
-            t1 = tcg_temp_new_vec(type);
             tcg_gen_sari_vec(MO_32, t1, v1, MIN(imm, 31));
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             vec_gen_4(INDEX_op_x86_blend_vec, type, MO_32,
                       tcgv_vec_arg(v0), tcgv_vec_arg(v0),
                       tcgv_vec_arg(t1), 0xaa);
-            tcg_temp_free_vec(t1);
         } else {
             /* Otherwise we will need to use a compare vs 0 to produce
              * the sign-extend, shift and merge.
              */
-            t1 = tcg_const_zeros_vec(type);
-            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1, t1, v1);
+            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1,
+                            tcg_constant_vec(type, MO_64, 0), v1);
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             tcg_gen_shli_vec(MO_64, t1, t1, 64 - imm);
             tcg_gen_or_vec(MO_64, v0, v0, t1);
-            tcg_temp_free_vec(t1);
         }
+        tcg_temp_free_vec(t1);
         break;
 
     default:
-- 
2.34.1

