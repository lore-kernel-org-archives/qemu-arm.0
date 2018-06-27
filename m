Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5785031wrq;
        Tue, 26 Jun 2018 21:58:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdlAYlZfPVKhMzwLByGHs0SakRn2zL0DLlfQjHz9sHF1b0eSsXprLSdioijhoUJ65cX6VNe
X-Received: by 2002:a37:b943:: with SMTP id j64-v6mr3789993qkf.291.1530075509372;
        Tue, 26 Jun 2018 21:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075509; cv=none;
        d=google.com; s=arc-20160816;
        b=ymnnCyJt5HeyIpKPj8OpTGrNcdlkyZdVEBILV//wRbMKXmNwkR/NV9VYLV1WXl/wzp
         YQbVoZlll527cJW3n92mj5liL0nF9EP6Ibog0e00c1Fyx7HcPeTS1KjS/u695GCtux1K
         skRrt1SBtZSxMQ3+g7GqbDYNyLdXATaMFFZEJAVfvTbiTEQp+Bc2H5MPlR7TBaI9g/0M
         R/BjgH6mheRNyKK69j2OzRopAYz9fxBnFySz3nOKPiNio6hrPkiyj6cG8Y5SMwYrqkkp
         ertHtBIXF3+hf1qqfESdpgMRtOVSc5WxokDK0rpk2STUyMSVMUboBUWH1RsXvWuF1Qqk
         irog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=4Em03dcLzUXKwfE4k626bcy0xT4sCsg9jJV+yGM77rM=;
        b=pTODCi23AmXujzPRNFXe1b5jJSI6NC/5uuXTVE7qbuoICR5csi1Wu+lJ4uPwR6B0Qi
         F/er99vuZJN5izU7wkHFqMFSwkn04xbWNntQMkwZeipAtk/vkPvjqnQK2OdIzrcdmv4t
         xh2BG76F3T3S8ugdc1tWR5t93NrPKsr0nY0KyTSo5aOs6PYobpjQSBdBIzUipN5aW8P0
         t5aRd1fccH2Z73oBCrPMzoByxBFtjk/2NfdqWjoo5LGqVde04YQ3mBXnD5p3wXfETzc8
         AfnTKGu7BakE4lp7CWMh03F05ZoVlZxzvnvHXAxdBFFI/CpGjnhpo/f9RHrP49a8xj14
         GQTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dLFrUTTJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7-v6si3262118qtt.114.2018.06.26.21.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dLFrUTTJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2XE-0007bV-Pm
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:58:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29v-0004lI-1D
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29t-0001Co-DC
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:23 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:45697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29t-0001Bf-51
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:21 -0400
Received: by mail-pf0-x243.google.com with SMTP id a22-v6so380977pfo.12
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4Em03dcLzUXKwfE4k626bcy0xT4sCsg9jJV+yGM77rM=;
	b=dLFrUTTJ+xMOaKAInXYw5LtP/QmqIKJcCT2H3IyslkhuGYFZ1qet3YCApuWTxiC98y
	xXxCPuxHmljMsJ40N4getwaWoodKx4fdN+NuhCdX/FAcGec8B0MzOeThE4Uf1CaLoTQl
	ECsAtFy11xQdwX6jiDCzmFdrt6QzQSb9Di/SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4Em03dcLzUXKwfE4k626bcy0xT4sCsg9jJV+yGM77rM=;
	b=rLyTx7RWzH30apiJyBw6cK+TYevBYkjjgMrzso3hnZOmGyMJwDXCgiFZCBjH0KZKYN
	t2wiQpt28DEgZFnjqSZHa2bR86KdbdP6vulCnt19ar2aY6cIC2Y9FCnKUFP0le0/DCCQ
	Q+Am/0rTYuasTOY159giDldGAAO3If83V1ClKHIZTfeVYb7HdMdCkGqjNLT/KOEdPUqs
	bBaXqqKGoCbo2xKWI0bE8eZq+yoAK5NfAPNt8gUFMH3pV1ra1bEQzJrthad/kIR9fsAi
	uIjR1zFdqokXOsG+PR/RAoQFW5b5YZXmkf17XVdrSmm1xiCPExuKk5U6u+eHO9y8dgfU
	qm7g==
X-Gm-Message-State: APt69E3OI3ZrklUQlqXzUw5QZT18EKxKlMk/LxoQhew+kBJH9FHCbwSi
	Xqh2l3Nydpcdoskxr51H/DBAbxQycVM=
X-Received: by 2002:a62:449b:: with SMTP id
	m27-v6mr4298284pfi.130.1530074060128; 
	Tue, 26 Jun 2018 21:34:20 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:28 -0700
Message-Id: <20180627043328.11531-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v6 35/35] target/arm: Implement ARMv8.2-DotProd
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EEgbNEZ4Psvm

We've already added the helpers with an SVE patch, all that remains
is to wire up the aa64 and aa32 translators.  Enable the feature
within -cpu max for CONFIG_USER_ONLY.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Fix aa32 index form.
---
 target/arm/cpu.h           |  1 +
 linux-user/elfload.c       |  1 +
 target/arm/cpu.c           |  1 +
 target/arm/cpu64.c         |  1 +
 target/arm/translate-a64.c | 36 +++++++++++++++++++
 target/arm/translate.c     | 74 +++++++++++++++++++++++++++-----------
 6 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a4507a2d6f..6a8441c2dd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1480,6 +1480,7 @@ enum arm_features {
     ARM_FEATURE_V8_SM4, /* implements SM4 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_ATOMICS, /* ARMv8.1-Atomics feature */
     ARM_FEATURE_V8_RDM, /* implements v8.1 simd round multiply */
+    ARM_FEATURE_V8_DOTPROD, /* implements v8.2 simd dot product */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
     ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d1231ad07a..942a1b661f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -583,6 +583,7 @@ static uint32_t get_elf_hwcap(void)
                 ARM_HWCAP_A64_FPHP | ARM_HWCAP_A64_ASIMDHP);
     GET_FEATURE(ARM_FEATURE_V8_ATOMICS, ARM_HWCAP_A64_ATOMICS);
     GET_FEATURE(ARM_FEATURE_V8_RDM, ARM_HWCAP_A64_ASIMDRDM);
+    GET_FEATURE(ARM_FEATURE_V8_DOTPROD, ARM_HWCAP_A64_ASIMDDP);
     GET_FEATURE(ARM_FEATURE_V8_FCMA, ARM_HWCAP_A64_FCMA);
     GET_FEATURE(ARM_FEATURE_SVE, ARM_HWCAP_A64_SVE);
 #undef GET_FEATURE
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6dcc552e14..aa62315cea 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1805,6 +1805,7 @@ static void arm_max_initfn(Object *obj)
         set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
         set_feature(&cpu->env, ARM_FEATURE_CRC);
         set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
+        set_feature(&cpu->env, ARM_FEATURE_V8_DOTPROD);
         set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
 #endif
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0360d7efc5..3b4bc73ffa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -250,6 +250,7 @@ static void aarch64_max_initfn(Object *obj)
         set_feature(&cpu->env, ARM_FEATURE_CRC);
         set_feature(&cpu->env, ARM_FEATURE_V8_ATOMICS);
         set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
+        set_feature(&cpu->env, ARM_FEATURE_V8_DOTPROD);
         set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
         set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
         set_feature(&cpu->env, ARM_FEATURE_SVE);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index eb3a4ab2f0..f986340832 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -640,6 +640,16 @@ static void gen_gvec_op3(DisasContext *s, bool is_q, int rd,
                    vec_full_reg_size(s), gvec_op);
 }
 
+/* Expand a 3-operand operation using an out-of-line helper.  */
+static void gen_gvec_op3_ool(DisasContext *s, bool is_q, int rd,
+                             int rn, int rm, int data, gen_helper_gvec_3 *fn)
+{
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
+}
+
 /* Expand a 3-operand + env pointer operation using
  * an out-of-line helper.
  */
@@ -11336,6 +11346,14 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = ARM_FEATURE_V8_RDM;
         break;
+    case 0x02: /* SDOT (vector) */
+    case 0x12: /* UDOT (vector) */
+        if (size != MO_32) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = ARM_FEATURE_V8_DOTPROD;
+        break;
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -11389,6 +11407,11 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0x2: /* SDOT / UDOT */
+        gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0,
+                         u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -12568,6 +12591,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+    case 0x0e: /* SDOT */
+    case 0x1e: /* UDOT */
+        if (size != MO_32 || !arm_dc_feature(s, ARM_FEATURE_V8_DOTPROD)) {
+            unallocated_encoding(s);
+            return;
+        }
+        break;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
@@ -12665,6 +12695,12 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 
     switch (16 * u + opcode) {
+    case 0x0e: /* SDOT */
+    case 0x1e: /* UDOT */
+        gen_gvec_op3_ool(s, is_q, rd, rn, rm, index,
+                         u ? gen_helper_gvec_udot_idx_b
+                         : gen_helper_gvec_sdot_idx_b);
+        return;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a7a980b1f2..f845da7c63 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7762,9 +7762,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
  */
 static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
 {
-    gen_helper_gvec_3_ptr *fn_gvec_ptr;
-    int rd, rn, rm, rot, size, opr_sz;
-    TCGv_ptr fpst;
+    gen_helper_gvec_3 *fn_gvec = NULL;
+    gen_helper_gvec_3_ptr *fn_gvec_ptr = NULL;
+    int rd, rn, rm, opr_sz;
+    int data = 0;
     bool q;
 
     q = extract32(insn, 6, 1);
@@ -7777,8 +7778,8 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
 
     if ((insn & 0xfe200f10) == 0xfc200800) {
         /* VCMLA -- 1111 110R R.1S .... .... 1000 ...0 .... */
-        size = extract32(insn, 20, 1);
-        rot = extract32(insn, 23, 2);
+        int size = extract32(insn, 20, 1);
+        data = extract32(insn, 23, 2); /* rot */
         if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)
             || (!size && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
             return 1;
@@ -7786,13 +7787,20 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
         fn_gvec_ptr = size ? gen_helper_gvec_fcmlas : gen_helper_gvec_fcmlah;
     } else if ((insn & 0xfea00f10) == 0xfc800800) {
         /* VCADD -- 1111 110R 1.0S .... .... 1000 ...0 .... */
-        size = extract32(insn, 20, 1);
-        rot = extract32(insn, 24, 1);
+        int size = extract32(insn, 20, 1);
+        data = extract32(insn, 24, 1); /* rot */
         if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)
             || (!size && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
             return 1;
         }
         fn_gvec_ptr = size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
+    } else if ((insn & 0xfeb00f00) == 0xfc200d00) {
+        /* V[US]DOT -- 1111 1100 0.10 .... .... 1101 .Q.U .... */
+        bool u = extract32(insn, 4, 1);
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_DOTPROD)) {
+            return 1;
+        }
+        fn_gvec = u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
     } else {
         return 1;
     }
@@ -7807,12 +7815,19 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     }
 
     opr_sz = (1 + q) * 8;
-    fpst = get_fpstatus_ptr(1);
-    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
-                       vfp_reg_offset(1, rn),
-                       vfp_reg_offset(1, rm), fpst,
-                       opr_sz, opr_sz, rot, fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
+    if (fn_gvec_ptr) {
+        TCGv_ptr fpst = get_fpstatus_ptr(1);
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm), fpst,
+                           opr_sz, opr_sz, data, fn_gvec_ptr);
+        tcg_temp_free_ptr(fpst);
+    } else {
+        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm),
+                           opr_sz, opr_sz, data, fn_gvec);
+    }
     return 0;
 }
 
@@ -7826,9 +7841,9 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
 
 static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
 {
-    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    gen_helper_gvec_3 *fn_gvec = NULL;
+    gen_helper_gvec_3_ptr *fn_gvec_ptr = NULL;
     int rd, rn, rm, opr_sz, data;
-    TCGv_ptr fpst;
     bool q;
 
     q = extract32(insn, 6, 1);
@@ -7862,6 +7877,16 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
         data = (index << 2) | rot;
         fn_gvec_ptr = (size ? gen_helper_gvec_fcmlas_idx
                        : gen_helper_gvec_fcmlah_idx);
+    } else if ((insn & 0xffb00f00) == 0xfe200d00) {
+        /* V[US]DOT -- 1111 1110 0.10 .... .... 1101 .Q.U .... */
+        int u = extract32(insn, 4, 1);
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_DOTPROD)) {
+            return 1;
+        }
+        fn_gvec = u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
+        /* rm is just Vm, and index is M.  */
+        data = extract32(insn, 5, 1); /* index */
+        rm = extract32(insn, 0, 4);
     } else {
         return 1;
     }
@@ -7876,12 +7901,19 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
     }
 
     opr_sz = (1 + q) * 8;
-    fpst = get_fpstatus_ptr(1);
-    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
-                       vfp_reg_offset(1, rn),
-                       vfp_reg_offset(1, rm), fpst,
-                       opr_sz, opr_sz, data, fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
+    if (fn_gvec_ptr) {
+        TCGv_ptr fpst = get_fpstatus_ptr(1);
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm), fpst,
+                           opr_sz, opr_sz, data, fn_gvec_ptr);
+        tcg_temp_free_ptr(fpst);
+    } else {
+        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm),
+                           opr_sz, opr_sz, data, fn_gvec);
+    }
     return 0;
 }
 
-- 
2.17.1

