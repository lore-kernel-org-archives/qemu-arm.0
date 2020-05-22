Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2650721lfb;
        Fri, 22 May 2020 07:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9/JSYc98UdOdg1sBetbN1wUzFHMdJw2UuWiMb7ZHl1lMwZCYW7BBUN9Wxt5nG2ise9iEG
X-Received: by 2002:a0c:a955:: with SMTP id z21mr4227998qva.87.1590159483590;
        Fri, 22 May 2020 07:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590159483; cv=none;
        d=google.com; s=arc-20160816;
        b=JIlW313qpGPa798fhJmz5bmUGy012LJvR7CpnNyvXTgP5KVFS1VRyeJZgBQarYZwh9
         lL7SayzJcrSXp3UkE/wAiVVvuOLCb+rG+QEmPbQSghwF/03Ji01/K1J27iqFaax81/0Z
         /vq+Yv6gayK+Bge0Nl2YZd70vMDH7YijtomxOK1k0QU3oOzTauwc9fdJ4Q6qKUqxDOjb
         iAoMgL9KxyFo/1fbDBngOR0x+MtBjzxJfUunt3+h6P2AGP5L0gTrvetQPufTB0OTzPHW
         HA9gIEZUbkXrWYzH5pIiafov5KNTNFylki0a5z7IUeq5WxM9IBdeERKMb7bcKE5Gv8LU
         uqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lPAwSc45qlxB/TZuoMmLjNjab6Fr/WrHf/LvzT8lOcU=;
        b=F7XIZNQhoO9gDbtuexEX/TtncHbmaYryN/JcuoGOWyYzJ7JsFV5mLf7M9vs9rg3ueL
         Ejowy7eiXr+ksZB8SuRAAzNvsPQD9yob/cV3+F50AEmnF3f3zAxUUfxwgdkE1tC33twV
         Nhi3KZdiacjrDIukdca7BbezwpLeQLz1442ii/SufxO/EHuAcviJ+PX6CriqHiM5A/z+
         N2AWRBmig76De2/h436ASHk1wJglEzb7wGy1GcAMgdLcV9EIwVO/3V1JpVRKSs/xFg0z
         0kbVxFfRPHN/9cAtOhvAC28ZFhdGfudOLHAbM6QVm5riGj03UpPztm9Hj4GrTDt2hqDL
         xYAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmy7GoGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si5042685qts.145.2020.05.22.07.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 07:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmy7GoGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc97b-0007fg-0l
	for alex.bennee@linaro.org; Fri, 22 May 2020 10:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc95E-0002M2-G0
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:36 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc95D-0006UO-Bp
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:36 -0400
Received: by mail-wr1-x441.google.com with SMTP id i15so10414793wrx.10
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPAwSc45qlxB/TZuoMmLjNjab6Fr/WrHf/LvzT8lOcU=;
 b=mmy7GoGJd3UdSMd0cwt5IgHP+aOnPdH1g2r0+KaAhEsDeo4Q5Hmuqv9SGze+tG38aM
 AJM6p6VvGR6BLSsim97m3yYzqXRRd6Gh6L2bq6+Th+yv3r5OxmLMZKr4yn8qMXCXxMbX
 dXeWr1NgJbRXeyCZyyBCvPby/zdFx6bd7omKpwnMoeQWd5xd7sdIsO4NWQZl+UcTe97X
 dmr/gKdnbzcjQNr/CYi1XkPRofcwDN6Hrq3ORxTcqRSXTdMYgapL6TR/ANLVyGpbdwvo
 EJho45x9qD9COsirBEXMsfLfWg7zGjEln/T/lSPVC8goeiWxlb+xIW9tGSEpYNpJF7VO
 TxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPAwSc45qlxB/TZuoMmLjNjab6Fr/WrHf/LvzT8lOcU=;
 b=g+yb8XM9vP8Qf1IKZf6/9mM3i7MfLG69pHp1k+tmpZVMbWdeJjz0oSatdFQgDx3FAm
 yMTeEgPuIX6tw5N7QHou2MD8SPBm53mbQ2a2KatdmXMPVshtTVxHCWSkPN2xSJH4Seus
 6NTGVYavQUXyca5D3mfsxWdc/o5rIucYzC/TauI81VJXnY2Uj5BzA+fRVMg7Dka6wpKI
 gkiI7HmLc68pno4KnN2B1UiJJAVE7svM/kq8MxHFjlZU7JE0MSqSEpCCL9lzagKyWHHM
 Zyl4j4xVCiD8dmjVeDvnFgDM0HHvGhMRZxUoBfFBmOTstEuwE0aMRqJlDpuhK34VldsN
 6Rig==
X-Gm-Message-State: AOAM531z9WG7wlAkkkkdcutEGZvDgDUHhf7+erW6EY84hMKtrVdQgsy+
 w9Sfzlzr3t8P7ja6tFOLT5IEZ/3wQHsHMA==
X-Received: by 2002:adf:e441:: with SMTP id t1mr4114328wrm.347.1590159333438; 
 Fri, 22 May 2020 07:55:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y8sm1100561wmc.37.2020.05.22.07.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] target/arm: Convert Neon one-register-and-immediate
 insns to decodetree
Date: Fri, 22 May 2020 15:55:20 +0100
Message-Id: <20200522145520.6778-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522145520.6778-1-peter.maydell@linaro.org>
References: <20200522145520.6778-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
X-TUID: oPB7ia5XO7ne

Convert the insns in the one-register-and-immediate group to decodetree.

In the new decode, our asimd_imm_const() function returns a 64-bit value
rather than a 32-bit one, which means we don't need to treat cmode=14 op=1
as a special case in the decoder (it is the only encoding where the two
halves of the 64-bit value are different).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  22 ++++++
 target/arm/translate-neon.inc.c | 118 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 101 +--------------------------
 3 files changed, 142 insertions(+), 99 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index e217d51670d..1643d84e9c2 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -373,3 +373,25 @@ VCVT_SF_2sh      1111 001 0 1 . ...... .... 1110 0 . . 1 .... @2reg_vcvt
 VCVT_UF_2sh      1111 001 1 1 . ...... .... 1110 0 . . 1 .... @2reg_vcvt
 VCVT_FS_2sh      1111 001 0 1 . ...... .... 1111 0 . . 1 .... @2reg_vcvt
 VCVT_FU_2sh      1111 001 1 1 . ...... .... 1111 0 . . 1 .... @2reg_vcvt
+
+######################################################################
+# 1-reg-and-modified-immediate grouping:
+# 1111 001 i 1 D 000 imm:3 Vd:4 cmode:4 0 Q op 1 Vm:4
+######################################################################
+
+&1reg_imm        vd q imm cmode op
+
+%asimd_imm_value 24:1 16:3 0:4
+
+@1reg_imm        .... ... . . . ... ... .... .... . q:1 . . .... \
+                 &1reg_imm imm=%asimd_imm_value vd=%vd_dp
+
+# The cmode/op bits here decode VORR/VBIC/VMOV/VMNV, but
+# not in a way we can conveniently represent in decodetree without
+# a lot of repetition:
+# VORR: op=0, (cmode & 1) && cmode < 12
+# VBIC: op=1, (cmode & 1) && cmode < 12
+# VMOV: everything else
+# So we have a single decode line and check the cmode/op in the
+# trans function.
+Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 8d1c58eddc2..39c7e70373a 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1817,3 +1817,121 @@ DO_FP_2SH(VCVT_SF, gen_helper_vfp_sltos)
 DO_FP_2SH(VCVT_UF, gen_helper_vfp_ultos)
 DO_FP_2SH(VCVT_FS, gen_helper_vfp_tosls_round_to_zero)
 DO_FP_2SH(VCVT_FU, gen_helper_vfp_touls_round_to_zero)
+
+static uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
+{
+    /*
+     * Expand the encoded constant.
+     * Note that cmode = 2,3,4,5,6,7,10,11,12,13 imm=0 is UNPREDICTABLE.
+     * We choose to not special-case this and will behave as if a
+     * valid constant encoding of 0 had been given.
+     * cmode = 15 op = 1 must UNDEF; we assume decode has handled that.
+     */
+    switch (cmode) {
+    case 0: case 1:
+        /* no-op */
+        break;
+    case 2: case 3:
+        imm <<= 8;
+        break;
+    case 4: case 5:
+        imm <<= 16;
+        break;
+    case 6: case 7:
+        imm <<= 24;
+        break;
+    case 8: case 9:
+        imm |= imm << 16;
+        break;
+    case 10: case 11:
+        imm = (imm << 8) | (imm << 24);
+        break;
+    case 12:
+        imm = (imm << 8) | 0xff;
+        break;
+    case 13:
+        imm = (imm << 16) | 0xffff;
+        break;
+    case 14:
+        if (op) {
+            /*
+             * This is the only case where the top and bottom 32 bits
+             * of the encoded constant differ.
+             */
+            uint64_t imm64 = 0;
+            int n;
+
+            for (n = 0; n < 8; n++) {
+                if (imm & (1 << n)) {
+                    imm64 |= (0xffULL << (n * 8));
+                }
+            }
+            return imm64;
+        }
+        imm |= (imm << 8) | (imm << 16) | (imm << 24);
+        break;
+    case 15:
+        imm = ((imm & 0x80) << 24) | ((imm & 0x3f) << 19)
+            | ((imm & 0x40) ? (0x1f << 25) : (1 << 30));
+        break;
+    }
+    if (op) {
+        imm = ~imm;
+    }
+    return dup_const(MO_32, imm);
+}
+
+static bool do_1reg_imm(DisasContext *s, arg_1reg_imm *a,
+                        GVecGen2iFn *fn)
+{
+    uint64_t imm;
+    int reg_ofs, vec_size;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    if (a->vd & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    reg_ofs = neon_reg_offset(a->vd, 0);
+    vec_size = a->q ? 16 : 8;
+    imm = asimd_imm_const(a->imm, a->cmode, a->op);
+
+    fn(MO_64, reg_ofs, reg_ofs, imm, vec_size, vec_size);
+    return true;
+}
+
+static void gen_VMOV_1r(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        int64_t c, uint32_t oprsz, uint32_t maxsz)
+{
+    tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, c);
+}
+
+static bool trans_Vimm_1r(DisasContext *s, arg_1reg_imm *a)
+{
+    /* Handle decode of cmode/op here between VORR/VBIC/VMOV */
+    GVecGen2iFn *fn;
+
+    if ((a->cmode & 1) && a->cmode < 12) {
+        /* for op=1, the imm will be inverted, so BIC becomes AND. */
+        fn = a->op ? tcg_gen_gvec_andi : tcg_gen_gvec_ori;
+    } else {
+        /* There is one unallocated cmode/op combination in this space */
+        if (a->cmode == 15 && a->op == 1) {
+            return false;
+        }
+        fn = gen_VMOV_1r;
+    }
+    return do_1reg_imm(s, a, fn);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9cc44e6258e..20d07e99053 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5232,105 +5232,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         /* Three register same length: handled by decodetree */
         return 1;
     } else if (insn & (1 << 4)) {
-        if ((insn & 0x00380080) != 0) {
-            /* Two registers and shift: handled by decodetree */
-            return 1;
-        } else { /* (insn & 0x00380080) == 0 */
-            int invert, reg_ofs, vec_size;
-
-            if (q && (rd & 1)) {
-                return 1;
-            }
-
-            op = (insn >> 8) & 0xf;
-            /* One register and immediate.  */
-            imm = (u << 7) | ((insn >> 12) & 0x70) | (insn & 0xf);
-            invert = (insn & (1 << 5)) != 0;
-            /* Note that op = 2,3,4,5,6,7,10,11,12,13 imm=0 is UNPREDICTABLE.
-             * We choose to not special-case this and will behave as if a
-             * valid constant encoding of 0 had been given.
-             */
-            switch (op) {
-            case 0: case 1:
-                /* no-op */
-                break;
-            case 2: case 3:
-                imm <<= 8;
-                break;
-            case 4: case 5:
-                imm <<= 16;
-                break;
-            case 6: case 7:
-                imm <<= 24;
-                break;
-            case 8: case 9:
-                imm |= imm << 16;
-                break;
-            case 10: case 11:
-                imm = (imm << 8) | (imm << 24);
-                break;
-            case 12:
-                imm = (imm << 8) | 0xff;
-                break;
-            case 13:
-                imm = (imm << 16) | 0xffff;
-                break;
-            case 14:
-                imm |= (imm << 8) | (imm << 16) | (imm << 24);
-                if (invert) {
-                    imm = ~imm;
-                }
-                break;
-            case 15:
-                if (invert) {
-                    return 1;
-                }
-                imm = ((imm & 0x80) << 24) | ((imm & 0x3f) << 19)
-                      | ((imm & 0x40) ? (0x1f << 25) : (1 << 30));
-                break;
-            }
-            if (invert) {
-                imm = ~imm;
-            }
-
-            reg_ofs = neon_reg_offset(rd, 0);
-            vec_size = q ? 16 : 8;
-
-            if (op & 1 && op < 12) {
-                if (invert) {
-                    /* The immediate value has already been inverted,
-                     * so BIC becomes AND.
-                     */
-                    tcg_gen_gvec_andi(MO_32, reg_ofs, reg_ofs, imm,
-                                      vec_size, vec_size);
-                } else {
-                    tcg_gen_gvec_ori(MO_32, reg_ofs, reg_ofs, imm,
-                                     vec_size, vec_size);
-                }
-            } else {
-                /* VMOV, VMVN.  */
-                if (op == 14 && invert) {
-                    TCGv_i64 t64 = tcg_temp_new_i64();
-
-                    for (pass = 0; pass <= q; ++pass) {
-                        uint64_t val = 0;
-                        int n;
-
-                        for (n = 0; n < 8; n++) {
-                            if (imm & (1 << (n + pass * 8))) {
-                                val |= 0xffull << (n * 8);
-                            }
-                        }
-                        tcg_gen_movi_i64(t64, val);
-                        neon_store_reg64(t64, rd + pass);
-                    }
-                    tcg_temp_free_i64(t64);
-                } else {
-                    tcg_gen_gvec_dup_imm(MO_32, reg_ofs, vec_size,
-                                         vec_size, imm);
-                }
-            }
-        }
+        /* Two registers and shift or reg and imm: handled by decodetree */
+        return 1;
     } else { /* (insn & 0x00800010 == 0x00800000) */
         if (size != 3) {
             op = (insn >> 8) & 0xf;
-- 
2.20.1

