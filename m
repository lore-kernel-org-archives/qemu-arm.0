Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4751628wrg;
        Thu, 6 Jun 2019 10:50:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2wtLyTQkOFtcwLcqd0XKRKGnm0nG6Ue7dbx3m/WpvgsbGbE7LRBNWgxDuA9fcxp4gWXNN
X-Received: by 2002:ac8:124c:: with SMTP id g12mr13213111qtj.57.1559843459658;
        Thu, 06 Jun 2019 10:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843459; cv=none;
        d=google.com; s=arc-20160816;
        b=jE8stvCIrE+pwUYnmIryoxu6OmRt+hvKGMonoAuxGw+gAIwCBpIso9bLZ6Q8nz4CD3
         ITYbfVGlGeyKFJxNz9WUI4ecJPaydpY/MuGwpa39zPH0DqWF8P0IAQ7+hLg5njvChluI
         mV8tWe5C/Ap9vDY57/b4YxPoEvZNDHaAbHcaWcoNwYKOtVTIzXM0U26J9OK39O3VSYXP
         cX2xNFqr/zmIdJOfJ6759onYiVgaETFp2jO907QevsXlxa4ehxbxwcraIffTRA8vYqfX
         +LniG2708bxfMpRqhlNQY2X8NunsW0oejQPooGIkKbt0V8a3ncEIi1zFCvjSplL3Cgnw
         vaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=UGVcH6sTteiHDcjJBr1jYE8bG2UG4UEyZfFmVaer4Is=;
        b=I09EQ4W69VA/4dp4iYamhbcPlDNNSQraeVAolTPbUzp3B6COtFQx2YxYeOke7XOkhE
         Gie7RpI3xIcQj7pZFTeCOat/UuhwZZFJcMdYGxycnyrmDKs9fIgHCOwDfr34j36lRO9p
         kstpu2LAkRZH8/gVJclQeGJWjDDAyDCSUncRGLe5EiZa65Yt3/hq2dyouJgAgpBsM+qs
         Q3yjkx3tFFX9p0/iAiQ6DwXZFJxKYeBo+h5wrE4YzrfMbR8HTGuYWakujSYE+2tJzGzE
         revSizHsHCsBQdcVQDq0L/cJJj/FH9Uymv3mKs5mUu6QlkiY6xf+KpnllfHhc7ka43YU
         0MUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zj0gt/M5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si2268955qvf.77.2019.06.06.10.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zj0gt/M5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwXT-0007RR-2k
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:50:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTV-0003oa-38
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTO-0003Ek-DO
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:50 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37585)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTK-0002uN-Al
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:43 -0400
Received: by mail-wm1-x341.google.com with SMTP id 22so828507wmg.2
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UGVcH6sTteiHDcjJBr1jYE8bG2UG4UEyZfFmVaer4Is=;
	b=zj0gt/M5Yh8lPRCCaoEmD4iNVjGV5/YDdjOuUO0kytFgfZo2sH/VlFV028cXWaLz/k
	lecknrakCfEPBQPeT09BXaA+XSpnaJxCyy8dJTVnkVIasjUP8lzdF3wK6RAwbEh+2Evv
	qIjt8PF+gecKg9sg7DZSAOnSP4B85LyJxGyD57InQk4fUkwlTfse6pCcIOd9lDt1I1Jl
	gcDEUboB5f/IMKkE3zv09eRPKYXt4Cem8CfiGJ//iuHnBUKlTghIrjilpYriOGFAVAtk
	PrKXLzRTlG3AEA/duvs1S7k4F5q/3mCj+HzkltUO8ldUMm/qxPGxwyHxGo4t/CIoiHk9
	zFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UGVcH6sTteiHDcjJBr1jYE8bG2UG4UEyZfFmVaer4Is=;
	b=WTF7uehreRXKek8cBfA/5CAKEDy40Vr2QVgVpRzkcyhMhcfNt8YQB167YkbU6ebtBK
	EfRNYQ2Rm7vtvCusmgOpQvIacp3OIOzvVeSoiP6EUeJogUOlK3ktxgmEOBFQhbLNcFYg
	mcDPzfENBLajA/vCpUnGywd4Z6WH4nuobfNVTaZJZpUTEOKnT3D9d5gB+t9WZfy8Doix
	tgTnMbn10+c7xqNd96p0kAw4MisNHjsY7S55LJkp3ADmFn6BtxdAH2Wg3dZsITJsruQ8
	HBO0YfzEdMEdk/86pLCDSQsW8L7Sq3AuA/fiIU+3wUhgk9uyRjrymMgukJqRUYuw1so3
	f0fw==
X-Gm-Message-State: APjAAAUcLZWmqYJwMj0t42Eb+YrBoHnUh6drjd3oAARF2t7PxQZNx23Q
	JAm0vNdiP+WPTwG69Nao1Lope1uaOkKm2Q==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr905782wmf.34.1559843182806; 
	Thu, 06 Jun 2019 10:46:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:37 +0100
Message-Id: <20190606174609.20487-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 10/42] target/arm: Move the VFP trans_* functions
 to translate-vfp.inc.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 13iYRwS5apa3

Move the trans_*() functions we've just created from translate.c
to translate-vfp.inc.c. This is pure code motion with no textual
changes (this can be checked with 'git show --color-moved').

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 337 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 337 ---------------------------------
 2 files changed, 337 insertions(+), 337 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index f7535138d0f..2f070a6e0d9 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -138,3 +138,340 @@ static bool vfp_access_check(DisasContext *s)
 {
     return full_vfp_access_check(s, false);
 }
+
+static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
+{
+    uint32_t rd, rn, rm;
+    bool dp = a->dp;
+
+    if (!dc_isar_feature(aa32_vsel, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vn | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rn = a->vn;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (dp) {
+        TCGv_i64 frn, frm, dest;
+        TCGv_i64 tmp, zero, zf, nf, vf;
+
+        zero = tcg_const_i64(0);
+
+        frn = tcg_temp_new_i64();
+        frm = tcg_temp_new_i64();
+        dest = tcg_temp_new_i64();
+
+        zf = tcg_temp_new_i64();
+        nf = tcg_temp_new_i64();
+        vf = tcg_temp_new_i64();
+
+        tcg_gen_extu_i32_i64(zf, cpu_ZF);
+        tcg_gen_ext_i32_i64(nf, cpu_NF);
+        tcg_gen_ext_i32_i64(vf, cpu_VF);
+
+        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
+        switch (a->cc) {
+        case 0: /* eq: Z */
+            tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
+                                frn, frm);
+            break;
+        case 1: /* vs: V */
+            tcg_gen_movcond_i64(TCG_COND_LT, dest, vf, zero,
+                                frn, frm);
+            break;
+        case 2: /* ge: N == V -> N ^ V == 0 */
+            tmp = tcg_temp_new_i64();
+            tcg_gen_xor_i64(tmp, vf, nf);
+            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
+                                frn, frm);
+            tcg_temp_free_i64(tmp);
+            break;
+        case 3: /* gt: !Z && N == V */
+            tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero,
+                                frn, frm);
+            tmp = tcg_temp_new_i64();
+            tcg_gen_xor_i64(tmp, vf, nf);
+            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
+                                dest, frm);
+            tcg_temp_free_i64(tmp);
+            break;
+        }
+        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i64(frn);
+        tcg_temp_free_i64(frm);
+        tcg_temp_free_i64(dest);
+
+        tcg_temp_free_i64(zf);
+        tcg_temp_free_i64(nf);
+        tcg_temp_free_i64(vf);
+
+        tcg_temp_free_i64(zero);
+    } else {
+        TCGv_i32 frn, frm, dest;
+        TCGv_i32 tmp, zero;
+
+        zero = tcg_const_i32(0);
+
+        frn = tcg_temp_new_i32();
+        frm = tcg_temp_new_i32();
+        dest = tcg_temp_new_i32();
+        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
+        switch (a->cc) {
+        case 0: /* eq: Z */
+            tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
+                                frn, frm);
+            break;
+        case 1: /* vs: V */
+            tcg_gen_movcond_i32(TCG_COND_LT, dest, cpu_VF, zero,
+                                frn, frm);
+            break;
+        case 2: /* ge: N == V -> N ^ V == 0 */
+            tmp = tcg_temp_new_i32();
+            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
+            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
+                                frn, frm);
+            tcg_temp_free_i32(tmp);
+            break;
+        case 3: /* gt: !Z && N == V */
+            tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero,
+                                frn, frm);
+            tmp = tcg_temp_new_i32();
+            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
+            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
+                                dest, frm);
+            tcg_temp_free_i32(tmp);
+            break;
+        }
+        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i32(frn);
+        tcg_temp_free_i32(frm);
+        tcg_temp_free_i32(dest);
+
+        tcg_temp_free_i32(zero);
+    }
+
+    return true;
+}
+
+static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
+{
+    uint32_t rd, rn, rm;
+    bool dp = a->dp;
+    bool vmin = a->op;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vn | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rn = a->vn;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
+
+    if (dp) {
+        TCGv_i64 frn, frm, dest;
+
+        frn = tcg_temp_new_i64();
+        frm = tcg_temp_new_i64();
+        dest = tcg_temp_new_i64();
+
+        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
+        if (vmin) {
+            gen_helper_vfp_minnumd(dest, frn, frm, fpst);
+        } else {
+            gen_helper_vfp_maxnumd(dest, frn, frm, fpst);
+        }
+        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i64(frn);
+        tcg_temp_free_i64(frm);
+        tcg_temp_free_i64(dest);
+    } else {
+        TCGv_i32 frn, frm, dest;
+
+        frn = tcg_temp_new_i32();
+        frm = tcg_temp_new_i32();
+        dest = tcg_temp_new_i32();
+
+        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
+        if (vmin) {
+            gen_helper_vfp_minnums(dest, frn, frm, fpst);
+        } else {
+            gen_helper_vfp_maxnums(dest, frn, frm, fpst);
+        }
+        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i32(frn);
+        tcg_temp_free_i32(frm);
+        tcg_temp_free_i32(dest);
+    }
+
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+/*
+ * Table for converting the most common AArch32 encoding of
+ * rounding mode to arm_fprounding order (which matches the
+ * common AArch64 order); see ARM ARM pseudocode FPDecodeRM().
+ */
+static const uint8_t fp_decode_rm[] = {
+    FPROUNDING_TIEAWAY,
+    FPROUNDING_TIEEVEN,
+    FPROUNDING_POSINF,
+    FPROUNDING_NEGINF,
+};
+
+static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
+{
+    uint32_t rd, rm;
+    bool dp = a->dp;
+    TCGv_ptr fpst;
+    TCGv_i32 tcg_rmode;
+    int rounding = fp_decode_rm[a->rm];
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
+
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+
+    if (dp) {
+        TCGv_i64 tcg_op;
+        TCGv_i64 tcg_res;
+        tcg_op = tcg_temp_new_i64();
+        tcg_res = tcg_temp_new_i64();
+        tcg_gen_ld_f64(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
+        gen_helper_rintd(tcg_res, tcg_op, fpst);
+        tcg_gen_st_f64(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i64(tcg_op);
+        tcg_temp_free_i64(tcg_res);
+    } else {
+        TCGv_i32 tcg_op;
+        TCGv_i32 tcg_res;
+        tcg_op = tcg_temp_new_i32();
+        tcg_res = tcg_temp_new_i32();
+        tcg_gen_ld_f32(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
+        gen_helper_rints(tcg_res, tcg_op, fpst);
+        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i32(tcg_op);
+        tcg_temp_free_i32(tcg_res);
+    }
+
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_temp_free_i32(tcg_rmode);
+
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
+{
+    uint32_t rd, rm;
+    bool dp = a->dp;
+    TCGv_ptr fpst;
+    TCGv_i32 tcg_rmode, tcg_shift;
+    int rounding = fp_decode_rm[a->rm];
+    bool is_signed = a->op;
+
+    if (!dc_isar_feature(aa32_vcvt_dr, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
+
+    tcg_shift = tcg_const_i32(0);
+
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+
+    if (dp) {
+        TCGv_i64 tcg_double, tcg_res;
+        TCGv_i32 tcg_tmp;
+        tcg_double = tcg_temp_new_i64();
+        tcg_res = tcg_temp_new_i64();
+        tcg_tmp = tcg_temp_new_i32();
+        tcg_gen_ld_f64(tcg_double, cpu_env, vfp_reg_offset(1, rm));
+        if (is_signed) {
+            gen_helper_vfp_tosld(tcg_res, tcg_double, tcg_shift, fpst);
+        } else {
+            gen_helper_vfp_tould(tcg_res, tcg_double, tcg_shift, fpst);
+        }
+        tcg_gen_extrl_i64_i32(tcg_tmp, tcg_res);
+        tcg_gen_st_f32(tcg_tmp, cpu_env, vfp_reg_offset(0, rd));
+        tcg_temp_free_i32(tcg_tmp);
+        tcg_temp_free_i64(tcg_res);
+        tcg_temp_free_i64(tcg_double);
+    } else {
+        TCGv_i32 tcg_single, tcg_res;
+        tcg_single = tcg_temp_new_i32();
+        tcg_res = tcg_temp_new_i32();
+        tcg_gen_ld_f32(tcg_single, cpu_env, vfp_reg_offset(0, rm));
+        if (is_signed) {
+            gen_helper_vfp_tosls(tcg_res, tcg_single, tcg_shift, fpst);
+        } else {
+            gen_helper_vfp_touls(tcg_res, tcg_single, tcg_shift, fpst);
+        }
+        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(0, rd));
+        tcg_temp_free_i32(tcg_res);
+        tcg_temp_free_i32(tcg_single);
+    }
+
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_temp_free_i32(tcg_rmode);
+
+    tcg_temp_free_i32(tcg_shift);
+
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2cf8fd99404..dc22b2aa7ff 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3076,343 +3076,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
     tcg_temp_free_i32(tmp);
 }
 
-static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
-{
-    uint32_t rd, rn, rm;
-    bool dp = a->dp;
-
-    if (!dc_isar_feature(aa32_vsel, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
-        ((a->vm | a->vn | a->vd) & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rn = a->vn;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    if (dp) {
-        TCGv_i64 frn, frm, dest;
-        TCGv_i64 tmp, zero, zf, nf, vf;
-
-        zero = tcg_const_i64(0);
-
-        frn = tcg_temp_new_i64();
-        frm = tcg_temp_new_i64();
-        dest = tcg_temp_new_i64();
-
-        zf = tcg_temp_new_i64();
-        nf = tcg_temp_new_i64();
-        vf = tcg_temp_new_i64();
-
-        tcg_gen_extu_i32_i64(zf, cpu_ZF);
-        tcg_gen_ext_i32_i64(nf, cpu_NF);
-        tcg_gen_ext_i32_i64(vf, cpu_VF);
-
-        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
-        switch (a->cc) {
-        case 0: /* eq: Z */
-            tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
-                                frn, frm);
-            break;
-        case 1: /* vs: V */
-            tcg_gen_movcond_i64(TCG_COND_LT, dest, vf, zero,
-                                frn, frm);
-            break;
-        case 2: /* ge: N == V -> N ^ V == 0 */
-            tmp = tcg_temp_new_i64();
-            tcg_gen_xor_i64(tmp, vf, nf);
-            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
-                                frn, frm);
-            tcg_temp_free_i64(tmp);
-            break;
-        case 3: /* gt: !Z && N == V */
-            tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero,
-                                frn, frm);
-            tmp = tcg_temp_new_i64();
-            tcg_gen_xor_i64(tmp, vf, nf);
-            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
-                                dest, frm);
-            tcg_temp_free_i64(tmp);
-            break;
-        }
-        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i64(frn);
-        tcg_temp_free_i64(frm);
-        tcg_temp_free_i64(dest);
-
-        tcg_temp_free_i64(zf);
-        tcg_temp_free_i64(nf);
-        tcg_temp_free_i64(vf);
-
-        tcg_temp_free_i64(zero);
-    } else {
-        TCGv_i32 frn, frm, dest;
-        TCGv_i32 tmp, zero;
-
-        zero = tcg_const_i32(0);
-
-        frn = tcg_temp_new_i32();
-        frm = tcg_temp_new_i32();
-        dest = tcg_temp_new_i32();
-        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
-        switch (a->cc) {
-        case 0: /* eq: Z */
-            tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
-                                frn, frm);
-            break;
-        case 1: /* vs: V */
-            tcg_gen_movcond_i32(TCG_COND_LT, dest, cpu_VF, zero,
-                                frn, frm);
-            break;
-        case 2: /* ge: N == V -> N ^ V == 0 */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
-            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
-                                frn, frm);
-            tcg_temp_free_i32(tmp);
-            break;
-        case 3: /* gt: !Z && N == V */
-            tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero,
-                                frn, frm);
-            tmp = tcg_temp_new_i32();
-            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
-            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
-                                dest, frm);
-            tcg_temp_free_i32(tmp);
-            break;
-        }
-        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i32(frn);
-        tcg_temp_free_i32(frm);
-        tcg_temp_free_i32(dest);
-
-        tcg_temp_free_i32(zero);
-    }
-
-    return true;
-}
-
-static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
-{
-    uint32_t rd, rn, rm;
-    bool dp = a->dp;
-    bool vmin = a->op;
-    TCGv_ptr fpst;
-
-    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
-        ((a->vm | a->vn | a->vd) & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rn = a->vn;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fpst = get_fpstatus_ptr(0);
-
-    if (dp) {
-        TCGv_i64 frn, frm, dest;
-
-        frn = tcg_temp_new_i64();
-        frm = tcg_temp_new_i64();
-        dest = tcg_temp_new_i64();
-
-        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
-        if (vmin) {
-            gen_helper_vfp_minnumd(dest, frn, frm, fpst);
-        } else {
-            gen_helper_vfp_maxnumd(dest, frn, frm, fpst);
-        }
-        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i64(frn);
-        tcg_temp_free_i64(frm);
-        tcg_temp_free_i64(dest);
-    } else {
-        TCGv_i32 frn, frm, dest;
-
-        frn = tcg_temp_new_i32();
-        frm = tcg_temp_new_i32();
-        dest = tcg_temp_new_i32();
-
-        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
-        if (vmin) {
-            gen_helper_vfp_minnums(dest, frn, frm, fpst);
-        } else {
-            gen_helper_vfp_maxnums(dest, frn, frm, fpst);
-        }
-        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i32(frn);
-        tcg_temp_free_i32(frm);
-        tcg_temp_free_i32(dest);
-    }
-
-    tcg_temp_free_ptr(fpst);
-    return true;
-}
-
-/*
- * Table for converting the most common AArch32 encoding of
- * rounding mode to arm_fprounding order (which matches the
- * common AArch64 order); see ARM ARM pseudocode FPDecodeRM().
- */
-static const uint8_t fp_decode_rm[] = {
-    FPROUNDING_TIEAWAY,
-    FPROUNDING_TIEEVEN,
-    FPROUNDING_POSINF,
-    FPROUNDING_NEGINF,
-};
-
-static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
-{
-    uint32_t rd, rm;
-    bool dp = a->dp;
-    TCGv_ptr fpst;
-    TCGv_i32 tcg_rmode;
-    int rounding = fp_decode_rm[a->rm];
-
-    if (!dc_isar_feature(aa32_vrint, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
-        ((a->vm | a->vd) & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fpst = get_fpstatus_ptr(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-
-    if (dp) {
-        TCGv_i64 tcg_op;
-        TCGv_i64 tcg_res;
-        tcg_op = tcg_temp_new_i64();
-        tcg_res = tcg_temp_new_i64();
-        tcg_gen_ld_f64(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
-        gen_helper_rintd(tcg_res, tcg_op, fpst);
-        tcg_gen_st_f64(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i64(tcg_op);
-        tcg_temp_free_i64(tcg_res);
-    } else {
-        TCGv_i32 tcg_op;
-        TCGv_i32 tcg_res;
-        tcg_op = tcg_temp_new_i32();
-        tcg_res = tcg_temp_new_i32();
-        tcg_gen_ld_f32(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
-        gen_helper_rints(tcg_res, tcg_op, fpst);
-        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i32(tcg_op);
-        tcg_temp_free_i32(tcg_res);
-    }
-
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-    tcg_temp_free_i32(tcg_rmode);
-
-    tcg_temp_free_ptr(fpst);
-    return true;
-}
-
-static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
-{
-    uint32_t rd, rm;
-    bool dp = a->dp;
-    TCGv_ptr fpst;
-    TCGv_i32 tcg_rmode, tcg_shift;
-    int rounding = fp_decode_rm[a->rm];
-    bool is_signed = a->op;
-
-    if (!dc_isar_feature(aa32_vcvt_dr, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fpst = get_fpstatus_ptr(0);
-
-    tcg_shift = tcg_const_i32(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-
-    if (dp) {
-        TCGv_i64 tcg_double, tcg_res;
-        TCGv_i32 tcg_tmp;
-        tcg_double = tcg_temp_new_i64();
-        tcg_res = tcg_temp_new_i64();
-        tcg_tmp = tcg_temp_new_i32();
-        tcg_gen_ld_f64(tcg_double, cpu_env, vfp_reg_offset(1, rm));
-        if (is_signed) {
-            gen_helper_vfp_tosld(tcg_res, tcg_double, tcg_shift, fpst);
-        } else {
-            gen_helper_vfp_tould(tcg_res, tcg_double, tcg_shift, fpst);
-        }
-        tcg_gen_extrl_i64_i32(tcg_tmp, tcg_res);
-        tcg_gen_st_f32(tcg_tmp, cpu_env, vfp_reg_offset(0, rd));
-        tcg_temp_free_i32(tcg_tmp);
-        tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_double);
-    } else {
-        TCGv_i32 tcg_single, tcg_res;
-        tcg_single = tcg_temp_new_i32();
-        tcg_res = tcg_temp_new_i32();
-        tcg_gen_ld_f32(tcg_single, cpu_env, vfp_reg_offset(0, rm));
-        if (is_signed) {
-            gen_helper_vfp_tosls(tcg_res, tcg_single, tcg_shift, fpst);
-        } else {
-            gen_helper_vfp_touls(tcg_res, tcg_single, tcg_shift, fpst);
-        }
-        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(0, rd));
-        tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_single);
-    }
-
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-    tcg_temp_free_i32(tcg_rmode);
-
-    tcg_temp_free_i32(tcg_shift);
-
-    tcg_temp_free_ptr(fpst);
-
-    return true;
-}
-
 /*
  * Disassemble a VFP instruction.  Returns nonzero if an error occurred
  * (ie. an undefined instruction).
-- 
2.20.1

