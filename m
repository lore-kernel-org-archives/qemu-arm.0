Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4751978wrg;
        Thu, 6 Jun 2019 10:51:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFKgdIvfnECXRP8zwH3OLhVzCeqPCUXCxByKMcZVBfTrLMh9Sv9XAbqfNMOH13q69CrglG
X-Received: by 2002:ac8:f96:: with SMTP id b22mr41540434qtk.280.1559843488020;
        Thu, 06 Jun 2019 10:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843488; cv=none;
        d=google.com; s=arc-20160816;
        b=beEKO6hN6vviYKn8bnmPzQRJ5WZcTY7Zfh02TPVamtseJI30dwZq6mLd/NmqTjdT54
         spXlmqJkh3EGOtLG4LeZNeAq97TW0Ozf/bZ1txJWOx49iAfvXci8yZ22rkcsqc3ZJrTu
         TNidoLl+ufkvpTjX8nfcq133zczxFpffw7mPpdVOqQOWarFU7tjbLgV03xNv6Tc5MQjw
         06W0qSP+gwzzlkgLerme6YQuJuEhj2rwJku7VgsqylyH66FnHKMZSFlHK9PDrAhymj3N
         Nv7NIoe1Q4BMMy2foga2bOHWX4rZ+AHebNQe0ryMvSVP+eBwMO4v5IP4qMpfOr2Eyq9e
         +AQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NNiCFMrjCFikPCgvnRabtH7il5+OhUKvQr2Zj2YGfq0=;
        b=S5equ8+SLAfoi9cjPoZrbqmz0JDaNCFy4K2LW1E7gCwMNYpxYIS1+5gCaUPZ7MUQdh
         OKYTEBlcVO1CXB7f52G1X5quu4fSfVMGEUBBaPFPDlppGRAe6gH4O3cGKlzAxPoQ4FSM
         UnmJzt5Wq9ZjzIVnhTHKLLrEgu62QoDFEFe3b5gcHBXy0I86RGyvbFO9K1DPXjlxdxWZ
         Sj+4iXOQAsLFGlE03tUi9ZQNULHP8PNbayeww4ZfiMRMRzKCC6477BbCLcDPKS5uYIpu
         4sTkUqxEVOrB5+3RRFCxXTbjmw8Fm6g6Vm3NdbnoGlEdUvCGBhhl7vmo+l07JhB3wWbd
         DYyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PNsPErVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si392457qve.74.2019.06.06.10.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PNsPErVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwXv-0007iE-DU
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:51:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTf-0003zo-BL
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTb-0003RW-KS
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:01 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTa-0002vM-CF
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:46:58 -0400
Received: by mail-wr1-x443.google.com with SMTP id x4so3331700wrt.6
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NNiCFMrjCFikPCgvnRabtH7il5+OhUKvQr2Zj2YGfq0=;
	b=PNsPErVK1U1A9GzU6jPuzYMf02QpyUrpNpXL2vyTTuPdbbKffpBEPFjWUxTIJr4+Wx
	oVIwqvoe/F4tGCbHeehvKB+MfyfSvJEcNsswpuMABbsPvPBSJq0jLgUpnoGyppI7bDvy
	QSjY5hlpeH027ByqE2fjNp85WrKE6Dn36n6n6oNk4h2ljZRyoeHS1VnRyUJV+vOxZmoU
	oWEzw4zvc9tabmo6zCq64A6Dyvy9USVohcWIVoHFT3KT0vkUt/E0moe2GPb2jN7nRbvi
	sLQQrkb4LRPZmWl0yT5hnbg5giUidIKr1YUodpx/wIKxosfozH7F5Id7GMwKGVELYXNp
	MiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NNiCFMrjCFikPCgvnRabtH7il5+OhUKvQr2Zj2YGfq0=;
	b=PiRl2FfnAeFgCZwntSAZ5VCIqyytQYpf1SoDjl46DCk/ryxU46HIBUq+ZgcgQRZzrX
	TFn/mRQZBl75Cj6nsqD4DpQcBvBbxF3dRUklGPz09JIumpirwhwnI/g/zXSTLrSJhKm8
	DloJGRyXYkCCrp9+i1pb/GCofDAOka1b9/2rBU4JxSc5PAnzZwNKJzJuwd7UG5jgmaj+
	Nlq4rh9qsQLZtYpYK205aIcNwvbkNgkMoMPHD4vaEPhoJeB2ANSjSYiTm/4Wl2O0NyUp
	C8s+FXIeb5QDT0nkq6iqjfZhUY0rbnbtej1cGmC6AgmkVBmuDWmj07ROEmV1WjNGV8pO
	z5ng==
X-Gm-Message-State: APjAAAVM4111vaJ+m+dcM2iMPSWCjsAQ/BcT/EjU9/Tfb3/b3hROXfIl
	rO+QIITS9NOo6lYodqF/TMjS9sY2vUziKA==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr2086212wro.262.1559843183868; 
	Thu, 06 Jun 2019 10:46:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:38 +0100
Message-Id: <20190606174609.20487-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 11/42] target/arm: Add helpers for VFP register
 loads and stores
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JNz0Ctc0B+pC

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
index dc22b2aa7ff..fd2abd87202 100644
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

