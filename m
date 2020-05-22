Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2652610lfb;
        Fri, 22 May 2020 08:00:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLT6CvEAqBn+GFyD6QtvNxyLTaCnNJVRowQmqKIi3X3Heu0iTv1mbugKi+WIUu7l6Orb1u
X-Received: by 2002:a0c:f486:: with SMTP id i6mr4007364qvm.190.1590159621334;
        Fri, 22 May 2020 08:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590159621; cv=none;
        d=google.com; s=arc-20160816;
        b=Zk9Pwbb24eC1EUw05jeDaqK9TLUV50k8PZ/wFFzZ6Exp8h0DJUqzmgnCEMxo2D03uG
         sZbD2ZKkPbKaqLzrlK/2juPjFX13mp9q923EA3sw1YVHIl1nvoIDPZ1CuieFdjt19uje
         dfEduhn6zFhbSFf5+b/nnM3258UJpASkG0FR1mGA2RjOopx3HSjslXUpi4ehNE9ozTTW
         3nofuOMXG3nfQJ1j7xOlMA8YJ14Hl6rCkkg4mV93A4ernBFrfpAdFQZKRXfHS3QMs170
         2ihIwDYunPtBUfY2pD/g6INDixPxcmS9K2ocEDuo4iTwYtwL3D5wxdacTUkLYw3HIgeH
         6tww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7F+sswe7SvuqFs2BClGz5tu0K+Z++5uc+IUWnsx/Fmk=;
        b=G/zypiEHh4mVuYrulVYp9y84p87fch/NR0DBAR6y0ayptLYb89N2Cv5p5hnGsLVE0l
         tK4jwmnPiGBkz1O0Tvm4aJph2WEdU1bkLudfm5smjPF5khtQvhtk4sZQmFkjgBSauk2F
         F6VFtpwSWd+EiBS9o+mgOrNBMuq4TjotA00QPlGBDRqZ9a+xnAtLtr/HhcWxAYVqQ5h9
         cDmCpP6Fbt1WhbY/accARvmum9IkbewjDgbzm6+OAYPvwialm/vi8TzvtvAUiHGM2fo2
         SSRY3cGnAuiOjycdnlrHtaSMifFkVJ/aV7S8V31lltT/VnIX+SHfvYQ9ecAikC6cLN64
         TOrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zF/Qnzb4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si4748932qvm.105.2020.05.22.08.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 08:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zF/Qnzb4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc99o-0003Wi-OX
	for alex.bennee@linaro.org; Fri, 22 May 2020 11:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc95F-0002OF-03
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:37 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc95D-0006UZ-NP
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:36 -0400
Received: by mail-wm1-x344.google.com with SMTP id n5so10106773wmd.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7F+sswe7SvuqFs2BClGz5tu0K+Z++5uc+IUWnsx/Fmk=;
 b=zF/Qnzb4ORgmfksauAoCAGu5wN26hUM2uR7Iq4b6WYHI9/94BNfohbwdfes69NyM+9
 SizyfBUaEmY3hn1oxPtITW1mjJzuzc/xTeuu0e1C81Yc40pM/OG7Pywnu3j0LqWTpZRG
 7971K+Yi5mVMxCsNWr6p1YVGAXneX73IEnWng36VdSYCkKlZuS64SqEBwAJVUPHuLzMR
 tjy7KeAi/3r9ixYN3pMwYcZDA6NzIcCZZatWdhTOKWrDffD19R4wiY3JloVNEcLSgOxi
 0fRxXvifp0G8tLiGoRfncgOUSkIT5a5pdirFQUruyzjDaqsGmHdRNXYg9QOxnyRLUKmw
 qIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7F+sswe7SvuqFs2BClGz5tu0K+Z++5uc+IUWnsx/Fmk=;
 b=XxTV/5yWLjRa9I3uZMLbmAAbOJ2UmqSzT5qDMw0KjuFzIE+aUzsAABuYbXmv+ic7Ei
 gD6UowR5ELke1a4dTdUjOLephM+53Ns3yyS3HL3RhLUoxDH1sMIAXtn1PxDA8RbDU4Aq
 X0RV6CqjFS/eHWx4mOGoEvNSuQ/3D3NdKPb3OQozE4Jt8Vq4qlb/ZJy704M5D9mivGhY
 a65lFP0tlMTTBse97X65Z0gfJMHIBnra8eScsuQ3+8O1XgnRK3UkoSSBEMXCS1RLX09h
 ezNZTS2l47SDnlVAeV2rka6AT0xQwL3i0GQAEBntvCU023esEFEjQelkd0+lYwUz/coL
 Ur6Q==
X-Gm-Message-State: AOAM533E6trpm3ZeFVy6xL7geRC7FOhRIOc0gZyAKr/HpsRqQMAAVHJ7
 qyWRItYVCFCU24XSntOmqLkvEljVUg6mcw==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr13727092wma.95.1590159331041; 
 Fri, 22 May 2020 07:55:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y8sm1100561wmc.37.2020.05.22.07.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] target/arm: Convert Neon VSHLL, VMOVL to decodetree
Date: Fri, 22 May 2020 15:55:18 +0100
Message-Id: <20200522145520.6778-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522145520.6778-1-peter.maydell@linaro.org>
References: <20200522145520.6778-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
X-TUID: 6HHZf2Pllgi/

Convert the VSHLL and VMOVL insns from the 2-reg-shift group
to decodetree. Since the loop always has two passes, we unroll
it to avoid the awkward reassignment of one TCGv to another.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       | 16 +++++++
 target/arm/translate-neon.inc.c | 81 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 46 +------------------
 3 files changed, 99 insertions(+), 44 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 43db393cf76..9dd13d13254 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -241,6 +241,14 @@ VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
                  &2reg_shift vm=%vm_dp vd=%vd_dp size=1 q=0 \
                  shift=%neon_rshift_i3
 
+# Long left shifts: again Q is part of opcode decode
+@2reg_shll_s     .... ... . . . 1 shift:5    .... .... 0 . . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=2 q=0
+@2reg_shll_h     .... ... . . . 01 shift:4   .... .... 0 . . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=1 q=0
+@2reg_shll_b     .... ... . . . 001 shift:3  .... .... 0 . . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=0 q=0
+
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_d
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_s
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_h
@@ -346,3 +354,11 @@ VQSHRN_U16_2sh   1111 001 1 1 . ...... .... 1001 . 0 . 1 .... @2reg_shrn_h
 VQRSHRN_U64_2sh  1111 001 1 1 . ...... .... 1001 . 1 . 1 .... @2reg_shrn_d
 VQRSHRN_U32_2sh  1111 001 1 1 . ...... .... 1001 . 1 . 1 .... @2reg_shrn_s
 VQRSHRN_U16_2sh  1111 001 1 1 . ...... .... 1001 . 1 . 1 .... @2reg_shrn_h
+
+VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_s
+VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_h
+VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_b
+
+VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_s
+VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_h
+VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_b
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 9a75a69a4f5..5678bfd0d4d 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1687,3 +1687,84 @@ DO_2SN_32(VQSHRN_U16, gen_helper_neon_shl_u16, gen_helper_neon_narrow_sat_u8)
 DO_2SN_64(VQRSHRN_U64, gen_helper_neon_rshl_u64, gen_helper_neon_narrow_sat_u32)
 DO_2SN_32(VQRSHRN_U32, gen_helper_neon_rshl_u32, gen_helper_neon_narrow_sat_u16)
 DO_2SN_32(VQRSHRN_U16, gen_helper_neon_rshl_u16, gen_helper_neon_narrow_sat_u8)
+
+static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
+                         NeonGenWidenFn *widenfn, bool u)
+{
+    TCGv_i64 tmp;
+    TCGv_i32 rm0, rm1;
+    uint64_t widen_mask = 0;
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
+    if (a->vd & 1) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * This is a widen-and-shift operation. The shift is always less
+     * than the width of the source type, so after widening the input
+     * vector we can simply shift the whole 64-bit widened register,
+     * and then clear the potential overflow bits resulting from left
+     * bits of the narrow input appearing as right bits of the left
+     * neighbour narrow input. Calculate a mask of bits to clear.
+     */
+    if ((a->shift != 0) && (a->size < 2 || u)) {
+        int esize = 8 << a->size;
+        widen_mask = MAKE_64BIT_MASK(0, esize);
+        widen_mask >>= esize - a->shift;
+        widen_mask = dup_const(a->size + 1, widen_mask);
+    }
+
+    rm0 = neon_load_reg(a->vm, 0);
+    rm1 = neon_load_reg(a->vm, 1);
+    tmp = tcg_temp_new_i64();
+
+    widenfn(tmp, rm0);
+    if (a->shift != 0) {
+        tcg_gen_shli_i64(tmp, tmp, a->shift);
+        tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
+    }
+    neon_store_reg64(tmp, a->vd);
+
+    widenfn(tmp, rm1);
+    if (a->shift != 0) {
+        tcg_gen_shli_i64(tmp, tmp, a->shift);
+        tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
+    }
+    neon_store_reg64(tmp, a->vd + 1);
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
+static bool trans_VSHLL_S_2sh(DisasContext *s, arg_2reg_shift *a)
+{
+    NeonGenWidenFn *widenfn[] = {
+        gen_helper_neon_widen_s8,
+        gen_helper_neon_widen_s16,
+        tcg_gen_ext_i32_i64,
+    };
+    return do_vshll_2sh(s, a, widenfn[a->size], false);
+}
+
+static bool trans_VSHLL_U_2sh(DisasContext *s, arg_2reg_shift *a)
+{
+    NeonGenWidenFn *widenfn[] = {
+        gen_helper_neon_widen_u8,
+        gen_helper_neon_widen_u16,
+        tcg_gen_extu_i32_i64,
+    };
+    return do_vshll_2sh(s, a, widenfn[a->size], true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f728231b198..ef39c89f10a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5248,6 +5248,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             case 7: /* VQSHL */
             case 8: /* VSHRN, VRSHRN, VQSHRUN, VQRSHRUN */
             case 9: /* VQSHRN, VQRSHRN */
+            case 10: /* VSHLL, including VMOVL */
                 return 1; /* handled by decodetree */
             default:
                 break;
@@ -5265,50 +5266,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     size--;
             }
             shift = (insn >> 16) & ((1 << (3 + size)) - 1);
-            if (op == 10) {
-                /* VSHLL, VMOVL */
-                if (q || (rd & 1)) {
-                    return 1;
-                }
-                tmp = neon_load_reg(rm, 0);
-                tmp2 = neon_load_reg(rm, 1);
-                for (pass = 0; pass < 2; pass++) {
-                    if (pass == 1)
-                        tmp = tmp2;
-
-                    gen_neon_widen(cpu_V0, tmp, size, u);
-
-                    if (shift != 0) {
-                        /* The shift is less than the width of the source
-                           type, so we can just shift the whole register.  */
-                        tcg_gen_shli_i64(cpu_V0, cpu_V0, shift);
-                        /* Widen the result of shift: we need to clear
-                         * the potential overflow bits resulting from
-                         * left bits of the narrow input appearing as
-                         * right bits of left the neighbour narrow
-                         * input.  */
-                        if (size < 2 || !u) {
-                            uint64_t imm64;
-                            if (size == 0) {
-                                imm = (0xffu >> (8 - shift));
-                                imm |= imm << 16;
-                            } else if (size == 1) {
-                                imm = 0xffff >> (16 - shift);
-                            } else {
-                                /* size == 2 */
-                                imm = 0xffffffff >> (32 - shift);
-                            }
-                            if (size < 2) {
-                                imm64 = imm | (((uint64_t)imm) << 32);
-                            } else {
-                                imm64 = imm;
-                            }
-                            tcg_gen_andi_i64(cpu_V0, cpu_V0, ~imm64);
-                        }
-                    }
-                    neon_store_reg64(cpu_V0, rd + pass);
-                }
-            } else if (op >= 14) {
+            if (op >= 14) {
                 /* VCVT fixed-point.  */
                 TCGv_ptr fpst;
                 TCGv_i32 shiftv;
-- 
2.20.1

