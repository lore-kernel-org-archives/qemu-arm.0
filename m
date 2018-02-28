Received: by 10.28.91.67 with SMTP id p64csp986045wmb;
        Wed, 28 Feb 2018 11:34:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELs0yWDyuAxNSAuEGpjA0azLTRDt0FOVYihezb9QzxX/QLPhlAqirfmy9jmB0qDuc4voA/Yw
X-Received: by 2002:a25:4605:: with SMTP id t5-v6mr13411063yba.184.1519846455073;
        Wed, 28 Feb 2018 11:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846455; cv=none;
        d=google.com; s=arc-20160816;
        b=lqrRkJ5wgNpQtXSPkAvVTstGSnylfEPUd0oX9nwxvkRZ8uiysEmzaiDJA/H4OyycP2
         Kx0AjNfq7aZkTFecTOnLy3yLYTOgNzheSQBWR3XY8NrMm+VhlP5shSN0ezDjxynvDk9x
         ZuLTTLedyAB1mR1qpwYBXSdVHevjQsOmAWvDb2dtgs9qk5nNx9M08uRlgKLguZi0ejyW
         /sFj7mIqyAvJWW3niOYytG8y3cghT7sh9wMs/ErHidZ8GriQrUr7bErF3bzWpcIEOHxJ
         lln4LtMsuRrY9vW4kUcumTmeuS5TToztvaYtemDQzphcAl/x2KgpA2J6ambSgWYc2lg5
         JDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ox43frcyBBsRXXtU/rzifJmIzkl03Y9N3CmA2i1brdA=;
        b=FBdtr1oUU6sT9hqAoBlHEO6xIJtARPDgdj7qj8qSaE8qDuCK/iByfPGftJ0w+XUS5X
         HCVAq8qkDkfHrttIu3HrkQHsWH2goGPN/NTyYCwJBwWv2WGCYVbxs4QSV3ayayHJIkRx
         PeThlVKZoq0qFfQ0njKgtQhKGGzDytPV09kpybJURYNgJoWWs+q3pA3ByGTLD0DC7Cii
         X9+fVF2xokMWij5717DV9qcd4LO6y1duOW6rpb3xR3NfcJwbUC1vqiGKDp5fzaVhUFFr
         5XaRlgZYjX93W1vRbrJmAHHH3PDYMtogNnTj8gbF02Q9MblfOnREWxOTVuUG3ZB3PJHJ
         zT+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AVyE6hu1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p7-v6si370593ybe.822.2018.02.28.11.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:34:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AVyE6hu1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7UU-0004nn-Ce
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:34:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rx-0003If-Fj
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rw-0006IU-6b
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:37 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:43927)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Rv-0006I5-Uk
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:36 -0500
Received: by mail-pl0-x243.google.com with SMTP id f23-v6so2113483plr.10
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ox43frcyBBsRXXtU/rzifJmIzkl03Y9N3CmA2i1brdA=;
	b=AVyE6hu1/nPZDA1YiVfbSeCZItdR0tZJ+fcTSysX1g6KC2Aae3n11VijfA/1Ye7LO+
	6+0CH77BI1oyDw88XVdCO8mo66Oo2pYs/Q8nO3EPNTp7DX10ZEfZRrq3LUAAyedpDgqi
	H9ce7qYU+4J+0ARpqpjA/uaxIZaeEawabkk8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ox43frcyBBsRXXtU/rzifJmIzkl03Y9N3CmA2i1brdA=;
	b=jzyuRX+XuFs+xJIAD07CoRWjHQmyHisjSIiw2hqiqD7+8HprudEhn2EMMpG0HuOqxM
	OFRO8DLoNWewJGGZMSe9TZbayHMLdekWACXqkzBjl3LNRcbqNE5EMa8vyNMGC8cDCUva
	06FV3QXKuz87zhyv9l17iDl1zGQockomP2AjNM3Uh6NCnf71MWzyompOTrZdgzWOytT0
	TlaEvQyL0J3C/GWUyF3R3x6sFv0wN2rgtvmeRUuLsVsvVvDNPT9TGaVUOVRQXj5pFlUq
	5uIpyRZkdHkQSoNfnmNKetnnlByh6KrJVigT+qyRu/Rrhiqzmo5pxBZp32WKc4N+TV1q
	y8mw==
X-Gm-Message-State: APf1xPABZBfckzQx2gBJ24d6vO4378nPqtbH/mxxXLkqeI8n51mJdnUP
	3ZgKW3AkhYIjIKmA33f5+v+xn1cuaK8=
X-Received: by 2002:a17:902:a512:: with SMTP id
	s18-v6mr18972338plq.296.1519846294596; 
	Wed, 28 Feb 2018 11:31:34 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:14 -0800
Message-Id: <20180228193125.20577-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v3 05/16] target/arm: Decode aa64 armv8.1 three
 same extra
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLhQaa+WEbeq

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  9 +++++
 target/arm/translate-a64.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 74 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2075c143d7..7f0d3b2d84 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -569,6 +569,15 @@ DEF_HELPER_2(dc_zva, void, env, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 
+DEF_HELPER_FLAGS_5(gvec_qrdmlah_s16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 746ab0e63a..ae16313eb0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -701,6 +701,18 @@ static void gen_gvec_op3(DisasContext *s, bool is_q, int rd,
                    vec_full_reg_size(s), gvec_op);
 }
 
+/* Expand a 3-operand + env pointer operation using
+ * an out-of-line helper.
+ */
+static void gen_gvec_op3_env(DisasContext *s, bool is_q, int rd,
+                             int rn, int rm, gen_helper_gvec_3_ptr *fn)
+{
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm), cpu_env,
+                       is_q ? 16 : 8, vec_full_reg_size(s), 0, fn);
+}
+
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
  * than the 32 bit equivalent.
  */
@@ -10789,6 +10801,76 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
     clear_vec_high(s, is_q, rd);
 }
 
+/* AdvSIMD three same extra
+ *  31   30  29 28       24 23  22  21 20  16  15 14    11  10 9  5 4  0
+ * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
+ * | 0 | Q | U | 0 1 1 1 0 | size | 0 |  Rm  | 1 | opcode | 1 | Rn | Rd |
+ * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
+ */
+static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
+{
+    int rd = extract32(insn, 0, 5);
+    int rn = extract32(insn, 5, 5);
+    int opcode = extract32(insn, 11, 4);
+    int rm = extract32(insn, 16, 5);
+    int size = extract32(insn, 22, 2);
+    bool u = extract32(insn, 29, 1);
+    bool is_q = extract32(insn, 30, 1);
+    int feature;
+
+    switch (u * 16 + opcode) {
+    case 0x10: /* SQRDMLAH (vector) */
+    case 0x11: /* SQRDMLSH (vector) */
+        if (size != 1 && size != 2) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = ARM_FEATURE_V8_RDM;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+    if (!arm_dc_feature(s, feature)) {
+        unallocated_encoding(s);
+        return;
+    }
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    switch (opcode) {
+    case 0x0: /* SQRDMLAH (vector) */
+        switch (size) {
+        case 1:
+            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlah_s16);
+            break;
+        case 2:
+            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlah_s32);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return;
+
+    case 0x1: /* SQRDMLSH (vector) */
+        switch (size) {
+        case 1:
+            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlsh_s16);
+            break;
+        case 2:
+            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlsh_s32);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
                                   int size, int rn, int rd)
 {
@@ -12869,6 +12951,7 @@ static void disas_crypto_three_reg_imm2(DisasContext *s, uint32_t insn)
 static const AArch64DecodeTable data_proc_simd[] = {
     /* pattern  ,  mask     ,  fn                        */
     { 0x0e200400, 0x9f200400, disas_simd_three_reg_same },
+    { 0x0e008400, 0x9f208400, disas_simd_three_reg_same_extra },
     { 0x0e200000, 0x9f200c00, disas_simd_three_reg_diff },
     { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
     { 0x0e300800, 0x9f3e0c00, disas_simd_across_lanes },
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9febdff69c..3072df4d77 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -26,6 +26,16 @@
 
 #define SET_QC() env->vfp.xregs[ARM_VFP_FPSCR] |= CPSR_Q
 
+static void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
+{
+    uint64_t *d = vd + opr_sz;
+    uintptr_t i;
+
+    for (i = opr_sz; i < max_sz; i += 8) {
+        *d++ = 0;
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 static uint16_t inl_qrdmlah_s16(CPUARMState *env, int16_t src1,
                                 int16_t src2, int16_t src3)
@@ -52,6 +62,22 @@ uint32_t HELPER(neon_qrdmlah_s16)(CPUARMState *env, uint32_t src1,
     return deposit32(e1, 16, 16, e2);
 }
 
+void HELPER(gvec_qrdmlah_s16)(void *vd, void *vn, void *vm,
+                              void *ve, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    int16_t *d = vd;
+    int16_t *n = vn;
+    int16_t *m = vm;
+    CPUARMState *env = ve;
+    uintptr_t i;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = inl_qrdmlah_s16(env, n[i], m[i], d[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 /* Signed saturating rounding doubling multiply-subtract high half, 16-bit */
 static uint16_t inl_qrdmlsh_s16(CPUARMState *env, int16_t src1,
                                 int16_t src2, int16_t src3)
@@ -78,6 +104,22 @@ uint32_t HELPER(neon_qrdmlsh_s16)(CPUARMState *env, uint32_t src1,
     return deposit32(e1, 16, 16, e2);
 }
 
+void HELPER(gvec_qrdmlsh_s16)(void *vd, void *vn, void *vm,
+                              void *ve, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    int16_t *d = vd;
+    int16_t *n = vn;
+    int16_t *m = vm;
+    CPUARMState *env = ve;
+    uintptr_t i;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = inl_qrdmlsh_s16(env, n[i], m[i], d[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
                                   int32_t src2, int32_t src3)
@@ -93,6 +135,22 @@ uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
     return ret;
 }
 
+void HELPER(gvec_qrdmlah_s32)(void *vd, void *vn, void *vm,
+                              void *ve, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    int32_t *d = vd;
+    int32_t *n = vn;
+    int32_t *m = vm;
+    CPUARMState *env = ve;
+    uintptr_t i;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = helper_neon_qrdmlah_s32(env, n[i], m[i], d[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 /* Signed saturating rounding doubling multiply-subtract high half, 32-bit */
 uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
                                   int32_t src2, int32_t src3)
@@ -107,3 +165,19 @@ uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
     }
     return ret;
 }
+
+void HELPER(gvec_qrdmlsh_s32)(void *vd, void *vn, void *vm,
+                              void *ve, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    int32_t *d = vd;
+    int32_t *n = vn;
+    int32_t *m = vm;
+    CPUARMState *env = ve;
+    uintptr_t i;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = helper_neon_qrdmlsh_s32(env, n[i], m[i], d[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.14.3

