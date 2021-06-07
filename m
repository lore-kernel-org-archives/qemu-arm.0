Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3677661lfa;
        Mon, 7 Jun 2021 10:03:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXB5ESfNwfDYslixkvNncDpwnnMVcefMjtYOd1cP7i2xP3ri1uTPMyMDCaGqVfEK+U4xJe
X-Received: by 2002:a17:906:9455:: with SMTP id z21mr18430428ejx.491.1623085438138;
        Mon, 07 Jun 2021 10:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085438; cv=none;
        d=google.com; s=arc-20160816;
        b=iKi2wfjpZ6V/LKJqBMHy/AeuhqtpmOhx2gWcgZ3QMJlGpo7g+9AgdICenRpB7ngqm3
         Qsx7mFkF431QhrF2sd+vqGRqgMHShY6xlg23w504S7tj7EkJaiABb2qxp5kAE5hOWpHS
         RUFGxsRZjUt9qAjNhbjCSfKHTeJ2j0RR+LCFKtb214jwXj7+b/f8DLvhtogkkiJuBv3e
         LttPe4pPJ5eHfoj74X/fiQXqf7OfuaYt0nuyXX4mjJakEsY2kZjIdbYEb+UzTRdq+JK6
         fxov+B7xAUsagHD5wgqRs2MNmNiuhCbw6/ag3bB61+nJnIpFp1v5sddPwknWu1/otOMc
         oeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CIujDDcNE7g7Qj8fbS4YkgLm8m2I7lwGWPWf6+KDpnk=;
        b=TN2kaRbpfE30D3hdP9zKH/mDtfBhxawK2ojT7vPP9Ma8sB0S8i3I3dcsmCxkzqjvZ4
         ERc+4O/BaQB+I7Ogx9HdpWAhGGQYz2TrelBznQOrV3CZjad95O3xp33m9vOGXQGpb/H6
         aFvpShv40nwhhBWBSGB+5uIp5fVQq7QxG+l1g73xnY41DxkP9WZIy/hVRjfe9nD7DfCm
         KONWK0c9vmC+tRL333ndqxj8ynAvNLcbP1EaluxLa3XPypg71qH4AnFHulMxzajDZGX2
         hadI29Lb/3DWO6QlcqW4qY446KiCpFkC3N3r8+2ChnyOr05/xkIA1jKG64fY/hBLAUq8
         ZGGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8Qc1BMw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si15673641ejx.637.2021.06.07.10.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8Qc1BMw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIfM-00050w-Gx
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa5-0006vi-11
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa3-0007qd-6W
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id a11so16558082wrt.13
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIujDDcNE7g7Qj8fbS4YkgLm8m2I7lwGWPWf6+KDpnk=;
 b=x8Qc1BMwrOmydxqbBntBqF2ycgQMPCSpfI2fmXOOit4XEzc0qYIykTOjKCM8jWwWap
 UJ2g4bjYQRJ95TXN1BBsY4HFAKQ1X+Z5IobV77bZKoiJ61bAmxHhSwPI1Xi/REWeaRzd
 XNYG4xqZXso+SehdVME1Rx+tf4alc6rbfMfnwLSe0Wpnff5qPt+kIONJW6u8ruLq4D5+
 USYlbx9Mgc9LhEVb3wn9I6hCNelyrWl/DqKheSeh1aAGsOlN8CyqK0UQNptZRbvL3uLS
 bpw4R/8Ap0VNDTcTeCK8r5ZhUCKdT0LowWPbzw2ueo8xXP7QUThE3boOYD/ngx3Htahw
 vdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIujDDcNE7g7Qj8fbS4YkgLm8m2I7lwGWPWf6+KDpnk=;
 b=fiENV67dd4qm2LRMZ5Hg0Tv1pR82G+L6QdO/mMiOVweDFV18vpkpfvKppjD4kX3zbj
 n32FGIj6Xya7vqFPwzyzjiXl77/I57Aj+CHUp/Ag6KlF5PXsGvL0uzmwnWcqRvKokvBB
 +oNuFEynC9SY9A9vKjEv1E7q7LtM5aA/hdjFtDq2SiINUsGvtYO8vSwI/h8Zdu4vAvRa
 hO/+R63w5N8BgDnNoyShj7oehA4+ks+jkcpFNQMICcWD6hpc8T9sjpk8By3UDiYazumT
 k9w472wjktxfTya/nKdHZ7qB81dVVBFvTZeUkBx3pgCZL8whFL89h0oUDNwgW8moKAjp
 552A==
X-Gm-Message-State: AOAM530xHpTm0ujVT/5h3L/uB/IV9epvi+ZHz1ZL5VZGHKuPRCtZSvGn
 UjzXm9UJ3hVRimmVhxj8RTUqfmgxYKyNrg/L
X-Received: by 2002:a5d:5243:: with SMTP id k3mr18357427wrc.19.1623085105917; 
 Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/55] target/arm: Enable FPSCR.QC bit for MVE
Date: Mon,  7 Jun 2021 17:57:28 +0100
Message-Id: <20210607165821.9892-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KWml7lsom2Rr

MVE has an FPSCR.QC bit similar to the A-profile Neon one; when MVE
is implemented make the bit writeable, both in the generic "load and
store FPSCR" helper functions and in the code for handling the NZCVQC
sysreg which we had previously left as "TODO when we implement MVE".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 32 +++++++++++++++++++++++---------
 target/arm/vfp_helper.c    |  3 ++-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index d01e465821b..22a619eb2c5 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -784,10 +784,19 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     {
         TCGv_i32 fpscr;
         tmp = loadfn(s, opaque);
-        /*
-         * TODO: when we implement MVE, write the QC bit.
-         * For non-MVE, QC is RES0.
-         */
+        if (dc_isar_feature(aa32_mve, s)) {
+            /* QC is only present for MVE; otherwise RES0 */
+            TCGv_i32 qc = tcg_temp_new_i32();
+            TCGv_i32 zero;
+            tcg_gen_andi_i32(qc, tmp, FPCR_QC);
+            store_cpu_field(qc, vfp.qc[0]);
+            zero = tcg_const_i32(0);
+            store_cpu_field(zero, vfp.qc[1]);
+            zero = tcg_const_i32(0);
+            store_cpu_field(zero, vfp.qc[2]);
+            zero = tcg_const_i32(0);
+            store_cpu_field(zero, vfp.qc[3]);
+        }
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
         tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
@@ -869,6 +878,11 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         break;
     }
 
+    if (regno == ARM_VFP_FPSCR_NZCVQC && !dc_isar_feature(aa32_mve, s)) {
+        /* QC is RES0 without MVE, so NZCVQC simplifies to NZCV */
+        regno = QEMU_VFP_FPSCR_NZCV;
+    }
+
     switch (regno) {
     case ARM_VFP_FPSCR:
         tmp = tcg_temp_new_i32();
@@ -876,11 +890,11 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         storefn(s, opaque, tmp);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
-        /*
-         * TODO: MVE has a QC bit, which we probably won't store
-         * in the xregs[] field. For non-MVE, where QC is RES0,
-         * we can just fall through to the FPSCR_NZCV case.
-         */
+        tmp = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCVQC_MASK);
+        storefn(s, opaque, tmp);
+        break;
     case QEMU_VFP_FPSCR_NZCV:
         /*
          * Read just NZCV; this is a special case to avoid the
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 496f0034772..8a716600592 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -220,7 +220,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
                                      FPCR_LTPSIZE_LENGTH);
     }
 
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
+    if (arm_feature(env, ARM_FEATURE_NEON) ||
+        cpu_isar_feature(aa32_mve, cpu)) {
         /*
          * The bit we set within fpscr_q is arbitrary; the register as a
          * whole being zero/non-zero is what counts.
-- 
2.20.1

