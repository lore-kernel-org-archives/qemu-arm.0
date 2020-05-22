Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2648799lfb;
        Fri, 22 May 2020 07:55:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrdNkAwG6+2iuoAcPOnlBCcb6NBL1lN9uhRU1ZygYDZXeBcDu4LmNZB1igTi3Y0Ke/J8Xj
X-Received: by 2002:ae9:de43:: with SMTP id s64mr15438791qkf.451.1590159343937;
        Fri, 22 May 2020 07:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590159343; cv=none;
        d=google.com; s=arc-20160816;
        b=NnRskQd8DU9iLtqAm/5ddu9DmC7td04/218r9XlZb3IHzMyHuA2vJxDvOwwD5MP/CD
         vQiro+ECBM5cRym9zVVwqqB5UOXZ44E/vKV9bPNG62+OQZME3m1HWP+9TwDN/eIxUxVg
         arfSRsMUwZKcxhk05dH/t5OlPH575L5QAM6Qak8vRF4Lde15YmCIJ0dnEM8U7CLZvEc1
         8Mcgzwk3ymHf7n4p6R0qxcer+m8lM/2D5ONCDDHtUD0ovyApg9VZHX86z8vfuUb4kKGE
         5uhuq7sE88TsY7nQDDkoyPpkmbRlFC0HqalLtlrs2HGrxugUfkiTssHHwkuT3mtSi4Tc
         oFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h8C+sirQq0LQGA2KO8QQ/JH+LvpC1dkrtfwj+w2/EgY=;
        b=00OcrQgys11xN2S8sMc1tUIRvcPHISgk9QlccFsg+fIyp9SQWc+TlCeyfdC53xcVWg
         mackJf7FMW2QjaeE/zN9qZDQmpDeHAEaPHhkQGFk1dCUWMrGKkzo1kHo4ZIC13mQzv6I
         JI61Jv+tfXAi95n0igoqcDtxMz/qV2n07TiJA9sSUtwmNEElq5JTrNN3oQHlufgqK6Wv
         7c9qaEi8MaK+UwX0hEyVs+avF0aEfCQrr9s/2A0q6MRgAAk2Bu7Ap5dC21+imsoSyxUK
         1XM0K9DyzxUok10ajHP7lpJZ6SCQRRd38DxmeE+nNWaT8wvwbrDEbTqJWBthrR7WFd9E
         Dfug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BMxNxv7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b74si5488422qkg.133.2020.05.22.07.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 07:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BMxNxv7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc95L-0002Jw-7z
	for alex.bennee@linaro.org; Fri, 22 May 2020 10:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc954-0001rr-8W
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:26 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc953-0006Qk-G0
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:25 -0400
Received: by mail-wm1-x342.google.com with SMTP id u1so8907350wmn.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8C+sirQq0LQGA2KO8QQ/JH+LvpC1dkrtfwj+w2/EgY=;
 b=BMxNxv7A9Vy7Urv6dZp/woQVK04umX7oDDjfeYhqcy67rZ++ALmevlO5+6JJP+5kZT
 beqoF2xNbJP4sbrlvx9jNVHFzoRhtkE098KOnNytmV7cEoG7HIdbME0aiite15o7PRB9
 dth4pZeAbgR9OZA7WtIhDx6fbBBdIRLzo+8nMekIi9E25MUIyR0vkTOkS1GWUGASb/0M
 RtHkJPPip2cv1hHlASCKxsthMVjKhcWK01YvaKErKPl4yyuNZrnS1/Sb2hSboQqGixX2
 lQGIRSdKs3Txq6UQICSWKSrK6OrPTnBQljoeAx5QKMv+zy+jSkqih9pmEvXEqJjT6O6j
 EJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8C+sirQq0LQGA2KO8QQ/JH+LvpC1dkrtfwj+w2/EgY=;
 b=Lf4CReQEcDxuoH9DSLiGkmdS02vnkomzhPgD3sbYwhRCdebFMCTO899lAlIbqLvtzi
 yffP6CdXCMdBg0fIQlvG/WHL/I1xqEnsgDkXw+Ha6Wbev8t0pOIpRM7ZfBvvXO/vp6Nr
 fzpm8UwDjTBLUEcYcCX5Bi69EwZWEGseyA8V5sAYOXtdfFOeBSkw6J5t4lAhiPkN80QN
 EV1KnuTebXltxJ3qkJsrtqytn8JlZBYpPkIx8Dk5wNvaHKiMPqbeHP8FBMDmKnO3ylPz
 rvdqYgRuzv19UJqOM9fyElVMHB6NYhucNjpdK8s3xMZ/hmluPQoP8Vjr/cmaHt6DgsMc
 BfDw==
X-Gm-Message-State: AOAM530OtgjphLV78u8AtdvfF9NWN8IM/EDKdkydpawX+JkzdLsVcgVt
 uHqJKBIIN+WyEBMSBZE+b+0Tvb8jB9MmRg==
X-Received: by 2002:a05:600c:34c:: with SMTP id
 u12mr13543022wmd.4.1590159323776; 
 Fri, 22 May 2020 07:55:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y8sm1100561wmc.37.2020.05.22.07.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] target/arm: Convert Neon VSHL and VSLI 2-reg-shift
 insn to decodetree
Date: Fri, 22 May 2020 15:55:12 +0100
Message-Id: <20200522145520.6778-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522145520.6778-1-peter.maydell@linaro.org>
References: <20200522145520.6778-1-peter.maydell@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: 4Pynu1CaFNsq

Convert the VSHL and VSLI insns from the Neon 2-registers-and-a-shift
group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 25 ++++++++++++++++++++++
 target/arm/translate-neon.inc.c | 38 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 18 +++++++---------
 3 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 8beb1db768b..4bd305e7ea0 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -199,3 +199,28 @@ VRECPS_fp_3s     1111 001 0 0 . 0 . .... .... 1111 ... 1 .... @3same_fp
 VRSQRTS_fp_3s    1111 001 0 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
 VMAXNM_fp_3s     1111 001 1 0 . 0 . .... .... 1111 ... 1 .... @3same_fp
 VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
+
+######################################################################
+# 2-reg-and-shift grouping:
+# 1111 001 U 1 D immH:3 immL:3 Vd:4 opc:4 L Q M 1 Vm:4
+######################################################################
+&2reg_shift vm vd q shift size
+
+@2reg_shl_d      .... ... . . . shift:6      .... .... 1 q:1 . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=3
+@2reg_shl_s      .... ... . . . 1 shift:5    .... .... 0 q:1 . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=2
+@2reg_shl_h      .... ... . . . 01 shift:4   .... .... 0 q:1 . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=1
+@2reg_shl_b      .... ... . . . 001 shift:3  .... .... 0 q:1 . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=0
+
+VSHL_2sh         1111 001 0 1 . ...... .... 0101 . . . 1 .... @2reg_shl_d
+VSHL_2sh         1111 001 0 1 . ...... .... 0101 . . . 1 .... @2reg_shl_s
+VSHL_2sh         1111 001 0 1 . ...... .... 0101 . . . 1 .... @2reg_shl_h
+VSHL_2sh         1111 001 0 1 . ...... .... 0101 . . . 1 .... @2reg_shl_b
+
+VSLI_2sh         1111 001 1 1 . ...... .... 0101 . . . 1 .... @2reg_shl_d
+VSLI_2sh         1111 001 1 1 . ...... .... 0101 . . . 1 .... @2reg_shl_s
+VSLI_2sh         1111 001 1 1 . ...... .... 0101 . . . 1 .... @2reg_shl_h
+VSLI_2sh         1111 001 1 1 . ...... .... 0101 . . . 1 .... @2reg_shl_b
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 3fe65a0b080..305213fe6d9 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1310,3 +1310,41 @@ static bool do_3same_fp_pair(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn)
 DO_3S_FP_PAIR(VPADD, gen_helper_vfp_adds)
 DO_3S_FP_PAIR(VPMAX, gen_helper_vfp_maxs)
 DO_3S_FP_PAIR(VPMIN, gen_helper_vfp_mins)
+
+static bool do_vector_2sh(DisasContext *s, arg_2reg_shift *a, GVecGen2iFn *fn)
+{
+    /* Handle a 2-reg-shift insn which can be vectorized. */
+    int vec_size = a->q ? 16 : 8;
+    int rd_ofs = neon_reg_offset(a->vd, 0);
+    int rm_ofs = neon_reg_offset(a->vm, 0);
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fn(a->size, rd_ofs, rm_ofs, a->shift, vec_size, vec_size);
+    return true;
+}
+
+#define DO_2SH(INSN, FUNC)                                              \
+    static bool trans_##INSN##_2sh(DisasContext *s, arg_2reg_shift *a)  \
+    {                                                                   \
+        return do_vector_2sh(s, a, FUNC);                               \
+    }                                                                   \
+
+DO_2SH(VSHL, tcg_gen_gvec_shli)
+DO_2SH(VSLI, gen_gvec_sli)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c8296116d4b..d0a4a08f6d9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5294,6 +5294,14 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         if ((insn & 0x00380080) != 0) {
             /* Two registers and shift.  */
             op = (insn >> 8) & 0xf;
+
+            switch (op) {
+            case 5: /* VSHL, VSLI */
+                return 1; /* handled by decodetree */
+            default:
+                break;
+            }
+
             if (insn & (1 << 7)) {
                 /* 64-bit shift. */
                 if (op > 7) {
@@ -5387,16 +5395,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     gen_gvec_sri(size, rd_ofs, rm_ofs, shift,
                                  vec_size, vec_size);
                     return 0;
-
-                case 5: /* VSHL, VSLI */
-                    if (u) { /* VSLI */
-                        gen_gvec_sli(size, rd_ofs, rm_ofs, shift,
-                                     vec_size, vec_size);
-                    } else { /* VSHL */
-                        tcg_gen_gvec_shli(size, rd_ofs, rm_ofs, shift,
-                                          vec_size, vec_size);
-                    }
-                    return 0;
                 }
 
                 if (size == 3) {
-- 
2.20.1

