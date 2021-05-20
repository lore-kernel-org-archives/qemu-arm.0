Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp277984lfm;
        Thu, 20 May 2021 08:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiM4+8WEfhXSBf5BiChWkeVp9MNf4dypLGWp0nNDfTjShiSbKRxpMbxjJtZ4+kWapFoC9J
X-Received: by 2002:a05:6638:14ce:: with SMTP id l14mr6596570jak.90.1621525006597;
        Thu, 20 May 2021 08:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621525006; cv=none;
        d=google.com; s=arc-20160816;
        b=duep3WnZB7MGAAW/ZQY8jTsJnCuIKlLzzfDcMBSfOMgCujXvUKLONQhtC/YyQzaVjZ
         OxvXRd6Ri8BnCcVKxjDnKB4YTgTmTd3CYzQTJM/jmvKlYkVYIFD2CMWfZgLx38kh4pRG
         CnpVRqGqlCc38c6SoZ4lxTQotrLaKnAFGEBhCy8uPmWti3LvMRIPMNq1x3vkL0bPoUtR
         e5gZT6r9sVMoSDPkSWteATznZFAdDy3llcTkN1mwxxTPSR02d226eeE4Vo/o55ZOQ48N
         bIKarSyQq1/gQfGunYFaQ9L6Tm1c67iTO2WSg/m8rPGoxoWbmbSqjQwkSl9tjJfnIfWk
         nj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iTEJUgdnofezBKJEQUNY/AOGiONLkshkAXK+NJ4lu5o=;
        b=sp7hzx9XUj7ZocUv2wqBI7Mc6urFcdedDPB7d0DtsNiZyVuE7vN9lXJjabQF2nk3LG
         mCWWv2UMLtS2qOi75eQkAiicpbUW981w9EmllHibD7Xg8dbXzJ59P7mX2QuRvY/4MrXr
         /QODgMBOcwLvCnybxRH7FtqZfK3p7F7NdXUwNwPS67um90u2mfLxo1kuIURWuwClO/Sp
         wyiSasWEijxT5QtykqJ53d/h5M649gywoHpQxqniubBftxjSRyNAQ8gLyz/zWYi1aSzI
         rCijSRZurBswhfsU+Vc6iX0kD+5VqjiL+QMTEMNnlF5sGAlNbLElyvELWnbgAjSHtDpw
         7vrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rA9L1IWE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si2822214ilv.32.2021.05.20.08.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rA9L1IWE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljkj7-0002Cm-TN
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbP-0007q6-TG
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbN-0000eI-RL
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id z17so18089277wrq.7
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iTEJUgdnofezBKJEQUNY/AOGiONLkshkAXK+NJ4lu5o=;
 b=rA9L1IWEdQz6kRbbzmoSooSzA92L02WPC9zEgHfrLfaVYd0vQSH60iccARN20e8n+p
 tnb04dfNU9jMPc0cJ3rK4oNKQX6W2+TtU7ZxfsIIbXJ9pmDaEBnDvmX6kxwir1ZKHBfX
 eFZ2PuAfOTA0SINxFfefiCYJvU57w4Ht7jZioaZBF7bcY19rLrvfQGHksxmwKy853o1j
 pKDNnqr8A+5lZOVYz7JkFFgXmRIPXEyMxf+7oaQatDAnUScHCO2e++RsL9kui8hpr6yY
 Yi7AyqYVVKh8JDKWDQIAtTlLQV4tvaHh/WwPD+yI4RVsPOtsEUJ3F1yOGVLCnKqAivi3
 2emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iTEJUgdnofezBKJEQUNY/AOGiONLkshkAXK+NJ4lu5o=;
 b=dbUCCUuATeoDWa/mhP10UCFO59URa5umlEC2OZWNivHJkbezLBtp3DyXrsZQKwrK8U
 pUK1nGgmZZkqCHHftSX+HDJV2pBpdWuCFH8JLjQTmt2g7rYBxeMbcu3+WPRukExdOm64
 3Lo83R0xRPAfBI3kgpBg4DCLEAnWRs/Uzzt5lDhcqzMbpF3LelMkMLxAechWznG4EM6Q
 ViZOtMT7dcoJ3HxanGIVz/P7k7hPl/CUgev3RWV2mrYyX4wK9SpjNom/ZWez8FCl8wtI
 p9OnXpMtceWo04M0TLZPMnMN7gb2KNKlaCyUbblStgN3usXnHcdWaoeBd7EJa/XThX8U
 otXg==
X-Gm-Message-State: AOAM532N9jcHRFyvVL36lKBSDaPc18SUf4mZl0Wl6LhzF9H4JvCKboVV
 PJPOeVQQyMiNcK4uLheQQJY2aODvhzWhJIOW
X-Received: by 2002:adf:e384:: with SMTP id e4mr4806630wrm.347.1621524524477; 
 Thu, 20 May 2021 08:28:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/arm: Move fpsp/fpdp isar check into callers of
 do_vfp_2op_sp/dp
Date: Thu, 20 May 2021 16:28:34 +0100
Message-Id: <20210520152840.24453-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pPjIPjg+1qod

The do_vfp_2op_sp() and do_vfp_2op_dp() functions currently check
whether floating point is supported via the aa32_fpdp_v2 and
aa32_fpsp_v2 isar checks.  For v8.1M MVE support, the VMOV_reg trans
functions (but not any of the others) need to update this to also
allow the insn if MVE is implemented.  Move the check out of the do_
function and into its callsites (which are all implemented via the
DO_VFP_2OP macro), so we have a place to change the check for the
VMOV insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 2202f8985d2..89246a284aa 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -1925,9 +1925,7 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
     int veclen = s->vec_len;
     TCGv_i32 f0, fd;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
-        return false;
-    }
+    /* Note that the caller must check the aa32_fpsp_v2 feature. */
 
     if (!dc_isar_feature(aa32_fpshvec, s) &&
         (veclen != 0 || s->vec_stride != 0)) {
@@ -2002,6 +2000,8 @@ static bool do_vfp_2op_hp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
      */
     TCGv_i32 f0;
 
+    /* Note that the caller must check the aa32_fp16_arith feature */
+
     if (!dc_isar_feature(aa32_fp16_arith, s)) {
         return false;
     }
@@ -2030,9 +2030,7 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
     int veclen = s->vec_len;
     TCGv_i64 f0, fd;
 
-    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
-        return false;
-    }
+    /* Note that the caller must check the aa32_fpdp_v2 feature. */
 
     /* UNDEF accesses to D16-D31 if they don't exist */
     if (!dc_isar_feature(aa32_simd_r32, s) && ((vd | vm) & 0x10)) {
@@ -2810,23 +2808,26 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     return true;
 }
 
-#define DO_VFP_2OP(INSN, PREC, FN)                              \
+#define DO_VFP_2OP(INSN, PREC, FN, CHECK)                       \
     static bool trans_##INSN##_##PREC(DisasContext *s,          \
                                       arg_##INSN##_##PREC *a)   \
     {                                                           \
+        if (!dc_isar_feature(CHECK, s)) {                       \
+            return false;                                       \
+        }                                                       \
         return do_vfp_2op_##PREC(s, FN, a->vd, a->vm);          \
     }
 
-DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32)
-DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64)
+DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32, aa32_fpsp_v2)
+DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64, aa32_fpdp_v2)
 
-DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh)
-DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss)
-DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd)
+DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh, aa32_fp16_arith)
+DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss, aa32_fpsp_v2)
+DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd, aa32_fpdp_v2)
 
-DO_VFP_2OP(VNEG, hp, gen_helper_vfp_negh)
-DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs)
-DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd)
+DO_VFP_2OP(VNEG, hp, gen_helper_vfp_negh, aa32_fp16_arith)
+DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs, aa32_fpsp_v2)
+DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd, aa32_fpdp_v2)
 
 static void gen_VSQRT_hp(TCGv_i32 vd, TCGv_i32 vm)
 {
@@ -2843,9 +2844,9 @@ static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
     gen_helper_vfp_sqrtd(vd, vm, cpu_env);
 }
 
-DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp)
-DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
-DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
+DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp, aa32_fp16_arith)
+DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp, aa32_fpsp_v2)
+DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp, aa32_fpdp_v2)
 
 static bool trans_VCMP_hp(DisasContext *s, arg_VCMP_sp *a)
 {
-- 
2.20.1

