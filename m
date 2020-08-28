Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1701603lfc;
        Fri, 28 Aug 2020 11:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpAFvdkgZ+ojtrF0t06Bw8Wpm0KanV6Wi4ucO3347jA/e/5RSYTzlklUFVdJUL3c8bXsIK
X-Received: by 2002:a25:ad15:: with SMTP id y21mr4459962ybi.295.1598640981712;
        Fri, 28 Aug 2020 11:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640981; cv=none;
        d=google.com; s=arc-20160816;
        b=Kw9cZU7batCycJ9f1Qp0dWKhHxmWpiqBDmOMNp1RmP9bmUPgcd++lgBBcpznmhyH+O
         E7OGwFBflTchEE1Zj97QnXX+4/m6zTGIDcrqSlMRcHGgcv4JlS50DYeuS0n5dO/QTuQc
         hb9YwnJ4TkntSgCn4wDADiQknWP8ovoJEDQtmO8vIMDkIcyPiqEMA0CsuGFg5OeL54pL
         Sy/VJ0gAfU4ZVokppjxDYM5EzBty5pBm6u4m9SkdhxKqbKxDrszzNicRS5xHMFlWxMDp
         SM8Y/0rf8p4viMoWbylSJHuoSIeMiE7nH/qcKHOQp3QaIOKxs9i7H5xgJjvVwGYqGi9J
         Sisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=inXY03xGdyZBdSKyNEIZuqr9D88x76DuBRO96S6LpR8=;
        b=jD2ov8dkuq6uEqa0F3J/ZIhj8bSXnKCqDVr8FCL/ahdNRQBZv931yEf2LQcUGwUqBA
         PnJcjpJBWiF4yBQF3tW5xa4R9AbL/Uf4kCqOWUPa4iU6jMtY5TzY/KtMgk3ukAWG1xeK
         EUGoIZMEodTJkd/aIhN6+c4gknvdrF+HSlJmebgsifImi8RWpTJeV8c7ORBNa2J8Z2D5
         6CakI1HXglHGZyiKOoCLJRpArbyM2OeKtlK2JNd8VhjBCr4n7wdcEgsr68tN+Kh0AvT7
         lLkQGK/zmh24mSoKSnP+/2HFwqvZm+lAeY/w+Gi/tA5GluYM+Za4Mw4d9JZaWz223oU0
         /mQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xu3s+WJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c187si103905yba.355.2020.08.28.11.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xu3s+WJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjXx-0003po-3e
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCt-0002zi-UG
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:35 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCr-00063O-BI
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:35 -0400
Received: by mail-wm1-x342.google.com with SMTP id o21so127505wmc.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=inXY03xGdyZBdSKyNEIZuqr9D88x76DuBRO96S6LpR8=;
 b=Xu3s+WJGPA/9Cdbgq8xSyEYqx0keUo1u/wuHbASUIjBwgIwkXFk+2c4HjuHKVhG+mC
 b8BDTBlL0HtQHl6bIpNaawOUBd6I/QnON9ykdnPfPR4QylcnnYRe+hvEkj6nPG5f/k0U
 1K0TjaAiqW6CxKlnDHuFTjEjhe14oyhawX452jQ7iIZZ9y8OcJx/0iCHUCiu69LiKP85
 fvMng/Yc1Js+qoOUPjXtVZzDIL0MSuSeF2lOIHPPWNj68jx6qyktSDBSp7r5vf6lIzPB
 YKsYuAUdeigQUAKDGJYKi/rIX7UnBbnR15xXe7hk+u9Mbqgjsbe42ZpPpmIAvXg49U13
 KNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inXY03xGdyZBdSKyNEIZuqr9D88x76DuBRO96S6LpR8=;
 b=Rrh/tVsoQ+O4d6wc+kuldwPPGdNs2//1dM+87Cgou5iL6pe2hnTxntFpV7natoK+7O
 1lY/Pi2gDOOwrUyjBNBLr70hr33BLppJO+b/kzc8vTQI1jnNnxm9+e9B0hWNBfhfr3bn
 Y/INe5B0zy/tuCxjxruKxr9QHkKHyFG/gTVafETosfhBp8gifb7jkIifkyC8nxQDJiXI
 dz1ERjmyVS/9RJHDtDtQflidWSzR6SeX/LMjpaPKYOz6YUAn7BhHmagxF7Dfka8dzUcm
 dsOCKKPfV2JunQgGoQPTomtFEkOT2ccgcEaLMc48OyYet5cZIics8SxwjLe75oqlUr1j
 Rwug==
X-Gm-Message-State: AOAM5329iPOyAxhSZJ+EUn9KJxYenU89WBDcCXi5PhsuuGzRdBAvrKS+
 1UZZ9uNem1slHnL1lSbUD8aipxRfrOlxXS0F
X-Received: by 2002:a1c:9910:: with SMTP id b16mr17245wme.79.1598639671716;
 Fri, 28 Aug 2020 11:34:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 29/45] target/arm: Implement fp16 for Neon VMAXNM, VMINNM
Date: Fri, 28 Aug 2020 19:33:38 +0100
Message-Id: <20200828183354.27913-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oicBjYaNm602

Convert the Neon floating point VMAXNM and VMINNM insns to
using a gvec helper and use this to implement the fp16 case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  6 ++++++
 target/arm/vec_helper.c         |  6 ++++++
 target/arm/translate-neon.c.inc | 23 +++++++++++++++--------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e252f380a89..f621940e69d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -653,6 +653,12 @@ DEF_HELPER_FLAGS_5(gvec_fmax_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmin_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fmaxnum_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxnum_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fminnum_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fminnum_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9d05e1a568b..f551f86d5a5 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -823,6 +823,12 @@ DO_3OP(gvec_fmax_s, float32_max, float32)
 DO_3OP(gvec_fmin_h, float16_min, float16)
 DO_3OP(gvec_fmin_s, float32_min, float32)
 
+DO_3OP(gvec_fmaxnum_h, float16_maxnum, float16)
+DO_3OP(gvec_fmaxnum_s, float32_maxnum, float32)
+
+DO_3OP(gvec_fminnum_h, float16_minnum, float16)
+DO_3OP(gvec_fminnum_s, float32_minnum, float32)
+
 #ifdef TARGET_AARCH64
 
 DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 621d6524df1..13858aaa08b 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -1151,6 +1151,11 @@ static void gen_VMLS_fp_3s(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm,
 DO_3S_FP(VMLA, gen_VMLA_fp_3s, true)
 DO_3S_FP(VMLS, gen_VMLS_fp_3s, true)
 
+WRAP_FP_GVEC(gen_VMAXNM_fp32_3s, FPST_STD, gen_helper_gvec_fmaxnum_s)
+WRAP_FP_GVEC(gen_VMAXNM_fp16_3s, FPST_STD_F16, gen_helper_gvec_fmaxnum_h)
+WRAP_FP_GVEC(gen_VMINNM_fp32_3s, FPST_STD, gen_helper_gvec_fminnum_s)
+WRAP_FP_GVEC(gen_VMINNM_fp16_3s, FPST_STD_F16, gen_helper_gvec_fminnum_h)
+
 static bool trans_VMAXNM_fp_3s(DisasContext *s, arg_3same *a)
 {
     if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
@@ -1158,11 +1163,12 @@ static bool trans_VMAXNM_fp_3s(DisasContext *s, arg_3same *a)
     }
 
     if (a->size != 0) {
-        /* TODO fp16 support */
-        return false;
+        if (!dc_isar_feature(aa32_fp16_arith, s)) {
+            return false;
+        }
+        return do_3same(s, a, gen_VMAXNM_fp16_3s);
     }
-
-    return do_3same_fp(s, a, gen_helper_vfp_maxnums, false);
+    return do_3same(s, a, gen_VMAXNM_fp32_3s);
 }
 
 static bool trans_VMINNM_fp_3s(DisasContext *s, arg_3same *a)
@@ -1172,11 +1178,12 @@ static bool trans_VMINNM_fp_3s(DisasContext *s, arg_3same *a)
     }
 
     if (a->size != 0) {
-        /* TODO fp16 support */
-        return false;
+        if (!dc_isar_feature(aa32_fp16_arith, s)) {
+            return false;
+        }
+        return do_3same(s, a, gen_VMINNM_fp16_3s);
     }
-
-    return do_3same_fp(s, a, gen_helper_vfp_minnums, false);
+    return do_3same(s, a, gen_VMINNM_fp32_3s);
 }
 
 WRAP_ENV_FN(gen_VRECPS_tramp, gen_helper_recps_f32)
-- 
2.20.1

