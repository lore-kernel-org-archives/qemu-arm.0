Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4202536wrg;
        Tue, 11 Jun 2019 03:59:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDVVssAs569ZBtBJXr6IizH1OhfUlcj6jJmUo9+JHI19MMnd+ePsf903c9MFc/pd4NMf0L
X-Received: by 2002:aed:3e0f:: with SMTP id l15mr65014268qtf.251.1560250797268;
        Tue, 11 Jun 2019 03:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250797; cv=none;
        d=google.com; s=arc-20160816;
        b=m0UjiV2xC/u9yCk0LrLU2MkNN2VSohUdNpVE5WYE2yGu9YwSZDyPjQBRx4kuCPJT37
         gIfHlFOvqDqBY5pneU96N5M8TmO/Ddqy/13fzMIWGDjZTXpLsLmtNX5HFH1Ypxp7Pmux
         WkIq6/IfvBsQiZzHl20GvOdNIZSPrze+KnMaI41IpeaMYCTAEy3Nd6lTfOhuIlLxFAp0
         0TcnjwQrpSVuKKw71Hsm0qzfCZ8cq3aA+T/x1ZaZ1kTxE27stl04UmCEoC3+3XOiqcWm
         57oNZahIFcx9ICXqt8iuagzlw3hdyIQEO+aoGIN84Q9Yz474GVxrD5OJR/hl9aR/jCIm
         Z4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=eNBmWZIm97TjmvwdrXNoqxnA5CbE2nGaaTGyw39+1hQ=;
        b=eFQ6D7XzZQsew4uTU1sfem1nhWslTLTrs6NmC8aWeiYAirO5NZtP8jW0Q9WyPA0Os6
         KPheyWHJPy3tqMZ3ZSwEM9Nrbp+yJsdMqbGkpTmW3lnQjPOXii0dUT8VbuY+uz2mhyK4
         vC575Y5X05UX8rlDm2A0bbYFS+m7Ks0vSpt3zDGKtl8hxH0QGjVzv3GdWXdoxQ0sYWbF
         rV8PhB9YkcKakzcjy3Es64Jga8rhNGWLwsQuJ/QLVcV9ZzuxGhO/HBsocIoi9/ONqqiK
         ZcMKQJCUzpcpEi0EuiiFu8ExByhUE13yqhm3CizM/btopFKMzlIXc+yiV4/nowhEDIZv
         gaOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GeVgCSSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o185si2661318qkd.256.2019.06.11.03.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 03:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GeVgCSSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeVQ-00051a-Pn
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 06:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39115)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007Dl-KJ
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePr-0007OR-Ab
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePp-0007Jv-92
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:09 -0400
Received: by mail-wm1-x342.google.com with SMTP id 207so2437744wma.1
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eNBmWZIm97TjmvwdrXNoqxnA5CbE2nGaaTGyw39+1hQ=;
 b=GeVgCSSrJwgGKnMbAnoCMdGxfXYsgbTA3poOHyG2jWs+p3uqLi92pWtE61FijJ+wil
 BCmYmDpnjqD+dKytPC5wy7wSUI363stV9Q9BjSf3/zyTe+7b1YaLDSDklZm/arABRWjh
 muUDRP+7d7Uq4q+9byBHFzmP21O9n68N6NDivBe7elrMrY5pHXa9XoTw/2o/Xy33IVTs
 YroBQfdXwfZBidmi7W1aGwdPCrhEE1CrxDVCONcCvYeKXx7XcZzYDZgaREtbDrr42D6f
 M/MRkZZguuJchZ8h7ao65QReIm8hJFirk2ppFIaSjZizFOymO1wYXx7LCbXwZwW9MkqX
 yxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNBmWZIm97TjmvwdrXNoqxnA5CbE2nGaaTGyw39+1hQ=;
 b=U5AHisSplySc2BgnA76SfWQmQa6V97jzx/+njcCO437pkqHsh18abomIMR37Cb2YQl
 WFsB/FmreD0gLTXU6BOvjThu0ZEyAMdcg9iRrlmGsZvwBfLdB8CUzeNoDX8Ohc2BZIzj
 3ahnJcyXE2sOsi2FDASwxX0IxXv1FMA3qve76hXn9CnHUKSFxTj3XvaM/YEzyRldtNeU
 gNdoj1efCH7zHXfATXCkkoo5NaIOfidy6QiEiW5mwVfzdRRRP0XMmnH8iOldrucqfn6M
 m0QSAr9X0iv2SFS5iVpfzfGODg5U/V7BVHptQC2SdNfDn4B6H+hllzEBFroDDHX0qCzo
 Od8w==
X-Gm-Message-State: APjAAAUa5zs04rWBFafaWVa4XkXj5kT2mF2y/3KR3rPCTepF5EdwGtvb
 8PEqeABiezLJni6lHhra5mPQFxiOD6kOHA==
X-Received: by 2002:a1c:ed01:: with SMTP id l1mr17977485wmh.109.1560250445478; 
 Tue, 11 Jun 2019 03:54:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:20 +0100
Message-Id: <20190611105351.9871-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 11/42] target/arm: Add helpers for VFP
 register loads and stores
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQQXOPdqF2Ea

The current VFP code has two different idioms for
loading and storing from the VFP register file:
 1 using the gen_mov_F0_vreg() and similar functions,
   which load and store to a fixed set of TCG globals
   cpu_F0s, CPU_F0d, etc
 2 by direct calls to tcg_gen_ld_f64() and friends

We want to phase out idiom 1 (because the use of the
fixed globals is a relic of a much older version of TCG),
but idiom 2 is quite longwinded:
 tcg_gen_ld_f64(tmp, cpu_env, vfp_reg_offset(true, reg))
requires us to specify the 64-bitness twice, once in
the function name and once by passing 'true' to
vfp_reg_offset(). There's no guard against accidentally
passing the wrong flag.

Instead, let's move to a convention of accessing 64-bit
registers via the existing neon_load_reg64() and
neon_store_reg64(), and provide new neon_load_reg32()
and neon_store_reg32() for the 32-bit equivalents.

Implement the new functions and use them in the code in
translate-vfp.inc.c. We will convert the rest of the VFP
code as we do the decodetree conversion in subsequent
commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 40 +++++++++++++++++-----------------
 target/arm/translate.c         | 10 +++++++++
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 2f070a6e0d9..24358f3d3eb 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -179,8 +179,8 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         tcg_gen_ext_i32_i64(nf, cpu_NF);
         tcg_gen_ext_i32_i64(vf, cpu_VF);
 
-        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
+        neon_load_reg64(frn, rn);
+        neon_load_reg64(frm, rm);
         switch (a->cc) {
         case 0: /* eq: Z */
             tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
@@ -207,7 +207,7 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
             tcg_temp_free_i64(tmp);
             break;
         }
-        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
+        neon_store_reg64(dest, rd);
         tcg_temp_free_i64(frn);
         tcg_temp_free_i64(frm);
         tcg_temp_free_i64(dest);
@@ -226,8 +226,8 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         frn = tcg_temp_new_i32();
         frm = tcg_temp_new_i32();
         dest = tcg_temp_new_i32();
-        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
+        neon_load_reg32(frn, rn);
+        neon_load_reg32(frm, rm);
         switch (a->cc) {
         case 0: /* eq: Z */
             tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
@@ -254,7 +254,7 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
             tcg_temp_free_i32(tmp);
             break;
         }
-        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
+        neon_store_reg32(dest, rd);
         tcg_temp_free_i32(frn);
         tcg_temp_free_i32(frm);
         tcg_temp_free_i32(dest);
@@ -298,14 +298,14 @@ static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
         frm = tcg_temp_new_i64();
         dest = tcg_temp_new_i64();
 
-        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
+        neon_load_reg64(frn, rn);
+        neon_load_reg64(frm, rm);
         if (vmin) {
             gen_helper_vfp_minnumd(dest, frn, frm, fpst);
         } else {
             gen_helper_vfp_maxnumd(dest, frn, frm, fpst);
         }
-        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
+        neon_store_reg64(dest, rd);
         tcg_temp_free_i64(frn);
         tcg_temp_free_i64(frm);
         tcg_temp_free_i64(dest);
@@ -316,14 +316,14 @@ static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
         frm = tcg_temp_new_i32();
         dest = tcg_temp_new_i32();
 
-        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
+        neon_load_reg32(frn, rn);
+        neon_load_reg32(frm, rm);
         if (vmin) {
             gen_helper_vfp_minnums(dest, frn, frm, fpst);
         } else {
             gen_helper_vfp_maxnums(dest, frn, frm, fpst);
         }
-        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
+        neon_store_reg32(dest, rd);
         tcg_temp_free_i32(frn);
         tcg_temp_free_i32(frm);
         tcg_temp_free_i32(dest);
@@ -379,9 +379,9 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         TCGv_i64 tcg_res;
         tcg_op = tcg_temp_new_i64();
         tcg_res = tcg_temp_new_i64();
-        tcg_gen_ld_f64(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
+        neon_load_reg64(tcg_op, rm);
         gen_helper_rintd(tcg_res, tcg_op, fpst);
-        tcg_gen_st_f64(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
+        neon_store_reg64(tcg_res, rd);
         tcg_temp_free_i64(tcg_op);
         tcg_temp_free_i64(tcg_res);
     } else {
@@ -389,9 +389,9 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         TCGv_i32 tcg_res;
         tcg_op = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
-        tcg_gen_ld_f32(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
+        neon_load_reg32(tcg_op, rm);
         gen_helper_rints(tcg_res, tcg_op, fpst);
-        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
+        neon_store_reg32(tcg_res, rd);
         tcg_temp_free_i32(tcg_op);
         tcg_temp_free_i32(tcg_res);
     }
@@ -440,14 +440,14 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         tcg_double = tcg_temp_new_i64();
         tcg_res = tcg_temp_new_i64();
         tcg_tmp = tcg_temp_new_i32();
-        tcg_gen_ld_f64(tcg_double, cpu_env, vfp_reg_offset(1, rm));
+        neon_load_reg64(tcg_double, rm);
         if (is_signed) {
             gen_helper_vfp_tosld(tcg_res, tcg_double, tcg_shift, fpst);
         } else {
             gen_helper_vfp_tould(tcg_res, tcg_double, tcg_shift, fpst);
         }
         tcg_gen_extrl_i64_i32(tcg_tmp, tcg_res);
-        tcg_gen_st_f32(tcg_tmp, cpu_env, vfp_reg_offset(0, rd));
+        neon_store_reg32(tcg_tmp, rd);
         tcg_temp_free_i32(tcg_tmp);
         tcg_temp_free_i64(tcg_res);
         tcg_temp_free_i64(tcg_double);
@@ -455,13 +455,13 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         TCGv_i32 tcg_single, tcg_res;
         tcg_single = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
-        tcg_gen_ld_f32(tcg_single, cpu_env, vfp_reg_offset(0, rm));
+        neon_load_reg32(tcg_single, rm);
         if (is_signed) {
             gen_helper_vfp_tosls(tcg_res, tcg_single, tcg_shift, fpst);
         } else {
             gen_helper_vfp_touls(tcg_res, tcg_single, tcg_shift, fpst);
         }
-        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(0, rd));
+        neon_store_reg32(tcg_res, rd);
         tcg_temp_free_i32(tcg_res);
         tcg_temp_free_i32(tcg_single);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e42a21d4aa5..3661ed57cd3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1689,6 +1689,16 @@ static inline void neon_store_reg64(TCGv_i64 var, int reg)
     tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(1, reg));
 }
 
+static inline void neon_load_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
+static inline void neon_store_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
 static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
 {
     TCGv_ptr ret = tcg_temp_new_ptr();
-- 
2.20.1

