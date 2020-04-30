Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2198048lfm;
        Thu, 30 Apr 2020 11:15:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypKhiBhqB1IHKYS8Scid1dgNhRIqCip66rgAtESD5kZulq5J64b9o0AnJF7mMxbGGvw8dQok
X-Received: by 2002:aed:3f30:: with SMTP id p45mr5245695qtf.49.1588270516758;
        Thu, 30 Apr 2020 11:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270516; cv=none;
        d=google.com; s=arc-20160816;
        b=fsWmU8Wm5OYNrksxmpTr536xTXqD6C3tH7z2zTRO/l/dNk55y7wmU6G/PPfvZaFmX7
         egW3VmTdfwhGxo245uW8xcajUn69k585AYiLe0uBGJTGrf4l7jxbX7AnDk7M/nv5277S
         nF4rGw/oCIF8FWBl7I4s46XkaHKJ15Hpr5R7+AVUMeiH95cchF0QXbwDAqVjrpVow3Gq
         awlTSINvURji5Jg9JyyLdhvOxZU3o8qqs4NK5LrCC+lmsL3l0BSpWl11YM23klXJDb/v
         MqAIwDPSa9UDJHCPvJs9wMnD4tLlnRnB+s+vFGC23BFwhCNgFtmj71MY273YbuWP6D7p
         KOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NNmnhN83w+zM9TIM95PNTu3ZONyjP5dUXcnOEc1nHQI=;
        b=VK7QD8t/3dQQBDPgyTY04yD86lGk49kafXvFixjLu0p7sk6Vbksm6ftxtyZHCu+itd
         7uEelCs+yznPaSQG19JKNWX9eTsI0AzhBU5hqz0nIB2+/1EqqSSLBjaJejZnBRsZjP5E
         Ej7ssQTLtDHg9Erio0qLy7JA2lGbOwEsJjW99cqCZpnd+ykL+TWdEuxbsQh29z1scY0r
         qiCpixeN2UNMZYNawxGwcrN4zeWCoDPOmlrR12Di7nb08M616EgM0TnILYzhSD1FGe+l
         7UQlAf48+A7g1Kz2WYlRgutCpXuCq/w72PvDeyDhbH34BDT3JPrIxKN8cR8M6AqOfTaz
         B/gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJF+mIxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id t18si195902qke.187.2020.04.30.11.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJF+mIxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDiO-0008KS-02
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDe9-0001al-Ul
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdd-0000rb-Nk
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdd-0000nG-B8
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id v4so8061360wme.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNmnhN83w+zM9TIM95PNTu3ZONyjP5dUXcnOEc1nHQI=;
 b=JJF+mIxgUralwEO2dejxlfDyVjmhSgBDTcTrEid0D4j+b4W9E0WUc7WdFFoklbKb2L
 L9AOK+Sr65yrCtak+GQqyZzY/x+i5Qpb+FDuD8NWpcey2RyWjYYasaQsTYezc34LcJhW
 Vj2Q1PBjm+gcNepKzjy2r9hRgtI8twXLJDO3YgF+cS7/lySuJmLBaigay/YgE6N9Hcvm
 7DJUBBMDbLZs+1zoVI4IopbxTXbdW9pCMHN6dGJ2ZKNUQf1Au45I9X1PIBfVRTetu5jZ
 ephq1RDSKni2gyeyBQwfFGp54s0pN2QxuMX+GmZ6dQC+m6pKoeQaAtZ8UMO7D7Yr+TBj
 YFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNmnhN83w+zM9TIM95PNTu3ZONyjP5dUXcnOEc1nHQI=;
 b=MMSt95EBxr6UjvjyQ+zxlZ9+o8NihuTPmVj0rKW+VcpnSUoomyFhqt3lgAqEOCzjTT
 fP03aLVHAxGz6wfQdKKvnk/wNsQorigb9ar1dslIo4jdwpt+wnkgRZm8ttYKYoF4DUhq
 ZP7+v3T5mpQyT/o9Tc5NexkziZcPZ/pl0I/jMMgT0/fIHVbu1DSzxPrJ2c+h8EgelAwJ
 YVFIh05XBhr+iJmhHBsQ4KKau2+psffGQ0st0vz6wdgaBWF66YQRrAkPDQ0LtnJGHyHo
 rSoUr4w6cNGnfqJujC4cFA+EKYnVlMHFjgCoacl0gARpMRlmt534P0MV+xl4wdmSz1Wz
 QsAA==
X-Gm-Message-State: AGi0Pua5u84QNZ52vorYOejTLgu0+0a/8GTXm6MD1Cv9rYKEis3PI+ay
 GUdnOluRN+K5suVMVaFLUuPNBl7mQ2OiPQ==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr4110975wmc.132.1588270219359; 
 Thu, 30 Apr 2020 11:10:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/36] target/arm: Convert VFM[AS]L (scalar) to decodetree
Date: Thu, 30 Apr 2020 19:09:37 +0100
Message-Id: <20200430181003.21682-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::32e
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
X-TUID: vPNJVcG9Hw99

Convert the VFM[AS]L (scalar) insns in the 2reg-scalar-ext group
to decodetree. These are the last ones in the group so we can remove
all the legacy decode for the group.

Note that in disas_thumb2_insn() the parts of this encoding space
where the decodetree decoder returns false will correctly be directed
to illegal_op by the "(insn & (1 << 28))" check so they won't fall
into disas_coproc_insn() by mistake.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c |  32 ++++++++++
 target/arm/translate.c          | 107 +-------------------------------
 target/arm/neon-shared.decode   |   7 +++
 3 files changed, 40 insertions(+), 106 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 7cc6ccb0697..b06542b8b83 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -242,3 +242,35 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
+{
+    int opr_sz;
+
+    if (!dc_isar_feature(aa32_fhm, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd & 0x10) || (a->q && (a->vn & 0x10)))) {
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
+    opr_sz = (1 + a->q) * 8;
+    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
+                       vfp_reg_offset(a->q, a->vn),
+                       vfp_reg_offset(a->q, a->rm),
+                       cpu_env, opr_sz, opr_sz,
+                       (a->index << 2) | a->s, /* is_2 == 0 */
+                       gen_helper_gvec_fmlal_idx_a32);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index af2714292ea..90f2f37908b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2610,8 +2610,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
 }
 
 #define VFP_REG_SHR(x, n) (((n) > 0) ? (x) >> (n) : (x) << -(n))
-#define VFP_SREG(insn, bigbit, smallbit) \
-  ((VFP_REG_SHR(insn, bigbit - 1) & 0x1e) | (((insn) >> (smallbit)) & 1))
 #define VFP_DREG(reg, insn, bigbit, smallbit) do { \
     if (dc_isar_feature(aa32_simd_r32, s)) { \
         reg = (((insn) >> (bigbit)) & 0x0f) \
@@ -2622,11 +2620,8 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
         reg = ((insn) >> (bigbit)) & 0x0f; \
     }} while (0)
 
-#define VFP_SREG_D(insn) VFP_SREG(insn, 12, 22)
 #define VFP_DREG_D(reg, insn) VFP_DREG(reg, insn, 12, 22)
-#define VFP_SREG_N(insn) VFP_SREG(insn, 16,  7)
 #define VFP_DREG_N(reg, insn) VFP_DREG(reg, insn, 16,  7)
-#define VFP_SREG_M(insn) VFP_SREG(insn,  0,  5)
 #define VFP_DREG_M(reg, insn) VFP_DREG(reg, insn,  0,  5)
 
 static void gen_neon_dup_low16(TCGv_i32 var)
@@ -7032,94 +7027,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     return 0;
 }
 
-/* Advanced SIMD two registers and a scalar extension.
- *  31             24   23  22   20   16   12  11   10   9    8        3     0
- * +-----------------+----+---+----+----+----+---+----+---+----+---------+----+
- * | 1 1 1 1 1 1 1 0 | o1 | D | o2 | Vn | Vd | 1 | o3 | 0 | o4 | N Q M U | Vm |
- * +-----------------+----+---+----+----+----+---+----+---+----+---------+----+
- *
- */
-
-static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
-{
-    gen_helper_gvec_3 *fn_gvec = NULL;
-    gen_helper_gvec_3_ptr *fn_gvec_ptr = NULL;
-    int rd, rn, rm, opr_sz, data;
-    int off_rn, off_rm;
-    bool is_long = false, q = extract32(insn, 6, 1);
-    bool ptr_is_env = false;
-
-    if ((insn & 0xffa00f10) == 0xfe000810) {
-        /* VFM[AS]L -- 1111 1110 0.0S .... .... 1000 .Q.1 .... */
-        int is_s = extract32(insn, 20, 1);
-        int vm20 = extract32(insn, 0, 3);
-        int vm3 = extract32(insn, 3, 1);
-        int m = extract32(insn, 5, 1);
-        int index;
-
-        if (!dc_isar_feature(aa32_fhm, s)) {
-            return 1;
-        }
-        if (q) {
-            rm = vm20;
-            index = m * 2 + vm3;
-        } else {
-            rm = vm20 * 2 + m;
-            index = vm3;
-        }
-        is_long = true;
-        data = (index << 2) | is_s; /* is_2 == 0 */
-        fn_gvec_ptr = gen_helper_gvec_fmlal_idx_a32;
-        ptr_is_env = true;
-    } else {
-        return 1;
-    }
-
-    VFP_DREG_D(rd, insn);
-    if (rd & q) {
-        return 1;
-    }
-    if (q || !is_long) {
-        VFP_DREG_N(rn, insn);
-        if (rn & q & !is_long) {
-            return 1;
-        }
-        off_rn = vfp_reg_offset(1, rn);
-        off_rm = vfp_reg_offset(1, rm);
-    } else {
-        rn = VFP_SREG_N(insn);
-        off_rn = vfp_reg_offset(0, rn);
-        off_rm = vfp_reg_offset(0, rm);
-    }
-    if (s->fp_excp_el) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
-        return 0;
-    }
-    if (!s->vfp_enabled) {
-        return 1;
-    }
-
-    opr_sz = (1 + q) * 8;
-    if (fn_gvec_ptr) {
-        TCGv_ptr ptr;
-        if (ptr_is_env) {
-            ptr = cpu_env;
-        } else {
-            ptr = get_fpstatus_ptr(1);
-        }
-        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd), off_rn, off_rm, ptr,
-                           opr_sz, opr_sz, data, fn_gvec_ptr);
-        if (!ptr_is_env) {
-            tcg_temp_free_ptr(ptr);
-        }
-    } else {
-        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd), off_rn, off_rm,
-                           opr_sz, opr_sz, data, fn_gvec);
-    }
-    return 0;
-}
-
 static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 {
     int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
@@ -10843,12 +10750,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     }
                 }
             }
-        } else if ((insn & 0x0f000a00) == 0x0e000800
-                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
-            if (disas_neon_insn_2reg_scalar_ext(s, insn)) {
-                goto illegal_op;
-            }
-            return;
         }
         goto illegal_op;
     }
@@ -11026,13 +10927,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
             break;
         }
-        if ((insn & 0xff000a00) == 0xfe000800
-            && arm_dc_feature(s, ARM_FEATURE_V8)) {
-            /* The Thumb2 and ARM encodings are identical.  */
-            if (disas_neon_insn_2reg_scalar_ext(s, insn)) {
-                goto illegal_op;
-            }
-        } else if (((insn >> 24) & 3) == 3) {
+        if (((insn >> 24) & 3) == 3) {
             /* Translate into the equivalent ARM encoding.  */
             insn = (insn & 0xe2ffffff) | ((insn & (1 << 28)) >> 4) | (1 << 28);
             if (disas_neon_data_insn(s, insn)) {
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 63a46c63c07..f297ba8cdfc 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -57,3 +57,10 @@ VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
 
 VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+%vfml_scalar_q0_rm 0:3 5:1
+%vfml_scalar_q1_index 5:1 3:1
+VFML_scalar    1111 1110 0 . 0 s:1 .... .... 1000 . 0 . 1 index:1 ... \
+               rm=%vfml_scalar_q0_rm vn=%vn_sp vd=%vd_dp q=0
+VFML_scalar    1111 1110 0 . 0 s:1 .... .... 1000 . 1 . 1 . rm:3 \
+               index=%vfml_scalar_q1_index vn=%vn_dp vd=%vd_dp q=1
-- 
2.20.1

