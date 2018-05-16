Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp203931wme;
        Wed, 16 May 2018 15:34:52 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZof7hLjxmNhAPDfvKSK8+L5KCV0jooE6Svu2kBqiyhmAJn+BIfyTscu659gtj6PdtJAGfXR
X-Received: by 2002:a0c:f3d0:: with SMTP id f16-v6mr2912798qvm.113.1526510092252;
        Wed, 16 May 2018 15:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510092; cv=none;
        d=google.com; s=arc-20160816;
        b=uGUTtD87mGgHilOIyf92kp5CTXfww/mTlA9cXvjXGaw3AyU/F5c3Fnc1PzZ+ArUHrG
         AvCI5txFFpy76VXimgAjxjZesStlac5IYPX1K4UabnPT1cy1EtXFqVEiorBUJmlJAD9D
         C4Dfc3WeNTVuMI5F9ekPSoBRbp5VPw8KKoz6t6WFAEYRpB7i/BBpbifTdK8BbQ149b7o
         ewdYQw76dATgSDlPhdYMQTHJHgXOSgNv8H5IVra2wGGhw+e2+j0B8RuT3wUoyvJxUV7N
         Sw6AXaBb0rRaU9Xap2bK08TayO3Ty6N7mQPVek/b6aTUHQA6yIV2iEl0UXeJPe7BqryV
         Elbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=L3S3cpaCBhjw05YBkRNan4r2OCrZvuVbBhO9LP27XAI=;
        b=OIlt61vTFCOqtmDlka7asy0wMJeXyniCwglqecnyySeZ6Vg8ogTUrGy1tgx/qi7TBB
         fmG7GJAxxDKeoJBIrp2M9z09eDPoCTYcthqAMlJKZHLpn6bitWnYSfeI8cr9kK7tadkB
         IFVhUk5utmwBRr+B1MRc6QYOAu5uthDIzoztwoLFmHquWiP+bjGqMJEwCW+BRFKWbZ1f
         s3U+5BymiBZ0VS72Tnmy1WRYZ8VjjqMt3LtARHSy3O85LaqHuMDYqQ5uGzo4kK9I3gqu
         b+xrD7f++cwNOHt0aNT6Fc5EHvpIE1RF7rqJner5hU7Jvou4w92/l7hXvT915mub6w5u
         /iGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ifKYQF4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si2532185qve.259.2018.05.16.15.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:34:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ifKYQF4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ50V-0002Mi-Lj
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:34:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wC-0007a4-2s
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w9-0007PU-Rz
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:24 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4w9-0007PB-IL
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:21 -0400
Received: by mail-pf0-x243.google.com with SMTP id w129-v6so1055560pfd.3
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L3S3cpaCBhjw05YBkRNan4r2OCrZvuVbBhO9LP27XAI=;
	b=ifKYQF4YLTO18TJ4qe5569iZ40/Qi8zPn3USnHr/wdTKHLjN75XCGLLjts5jK+v60F
	ITYjfwQeInSqPIQVcpiFgR4bMJvn048PuguemyQ0JRXXN9/lUrH+aGG1ZaB5ln+HMglb
	IWI2UBMEEfOROS4/lXc3REe4BcgzfZs3FvcE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L3S3cpaCBhjw05YBkRNan4r2OCrZvuVbBhO9LP27XAI=;
	b=ppYORcg1Z0FO+o5BR9hqUjZQmUAqwIMIpuqhKp/I7DrgOI69ocyIlEM9S4LCO+Ktxf
	IwJLRIDhnOKgBBotwggdIL6DO3+81HfJjEhGAUM2o9ujg/aN42RMw4oZo8O7qN7+WWst
	TjVcyNlH0ALwDihPLnjD+sBrV1MEYkOJsKNF5elyjrTMi2zQz/epLkdj0/sY8qr3IfR3
	Ki3LDLs3oZSWENjuaeIWOIrrfnU7FxG3WEnke+zBwCWG9si4iBUPAMpetZC55rNNApxW
	ZH0nSkJTGgYULRkqY/Gy3d2sIB5bRt4oUonhtwdVSrHkD336QtAXb5UkmROc7CygMT+d
	S+Ew==
X-Gm-Message-State: ALKqPwfyHKvUyD3KBWFADhNTzQByRi+kfsHHR97B+e1bmLSrqfX24sg1
	BjGhvmBtYSgCmR8dniyWVh4LmQ==
X-Received: by 2002:a63:3286:: with SMTP id
	y128-v6mr2178528pgy.419.1526509820413; 
	Wed, 16 May 2018 15:30:20 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:47 -0700
Message-Id: <20180516223007.10256-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3-a 07/27] target/arm: Implement SVE Predicate
 Misc Group
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
X-TUID: kV3wG+5zVNjW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |   4 +
 target/arm/helper-sve.h    |   3 +
 target/arm/sve_helper.c    |  84 +++++++++++++++
 target/arm/translate-sve.c | 209 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  31 ++++++
 5 files changed, 331 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f9a163ebdd..d131ced435 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -527,6 +527,7 @@ typedef struct CPUARMState {
 
 #ifdef TARGET_AARCH64
         /* Store FFR as pregs[16] to make it easier to treat as any other.  */
+#define FFR_PRED_NUM 16
         ARMPredicateReg pregs[17];
         /* Scratch space for aa64 sve predicate temporary.  */
         ARMPredicateReg preg_tmp;
@@ -2948,4 +2949,7 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
     return &env->vfp.zregs[regno].d[0];
 }
 
+/* Shared between translate-sve.c and sve_helper.c.  */
+extern const uint64_t pred_esz_masks[4];
+
 #endif
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 57adc4d912..0c04afff8c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -20,6 +20,9 @@
 DEF_HELPER_FLAGS_2(sve_predtest1, TCG_CALL_NO_WG, i32, i64, i64)
 DEF_HELPER_FLAGS_3(sve_predtest, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_pfirst, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_pnext, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2eda6f2ef1..cc164edfe8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -115,3 +115,87 @@ LOGICAL_PPPP(sve_nand_pppp, DO_NAND)
 #undef DO_NAND
 #undef DO_SEL
 #undef LOGICAL_PPPP
+
+/* Similar to the ARM LastActiveElement pseudocode function, except the
+   result is multiplied by the element size.  This includes the not found
+   indication; e.g. not found for esz=3 is -8.  */
+static intptr_t last_active_element(uint64_t *g, intptr_t words, intptr_t esz)
+{
+    uint64_t mask = pred_esz_masks[esz];
+    intptr_t i = words;
+
+    do {
+        uint64_t this_g = g[--i] & mask;
+        if (this_g) {
+            return i * 64 + (63 - clz64(this_g));
+        }
+    } while (i > 0);
+    return (intptr_t)-1 << esz;
+}
+
+uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
+{
+    uint32_t flags = PREDTEST_INIT;
+    uint64_t *d = vd, *g = vg;
+    intptr_t i = 0;
+
+    do {
+        uint64_t this_d = d[i];
+        uint64_t this_g = g[i];
+
+        if (this_g) {
+            if (!(flags & 4)) {
+                /* Set in D the first bit of G.  */
+                this_d |= this_g & -this_g;
+                d[i] = this_d;
+            }
+            flags = iter_predtest_fwd(this_d, this_g, flags);
+        }
+    } while (++i < words);
+
+    return flags;
+}
+
+uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
+{
+    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
+    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    uint32_t flags = PREDTEST_INIT;
+    uint64_t *d = vd, *g = vg, esz_mask;
+    intptr_t i, next;
+
+    next = last_active_element(vd, words, esz) + (1 << esz);
+    esz_mask = pred_esz_masks[esz];
+
+    /* Similar to the pseudocode for pnext, but scaled by ESZ
+       so that we find the correct bit.  */
+    if (next < words * 64) {
+        uint64_t mask = -1;
+
+        if (next & 63) {
+            mask = ~((1ull << (next & 63)) - 1);
+            next &= -64;
+        }
+        do {
+            uint64_t this_g = g[next / 64] & esz_mask & mask;
+            if (this_g != 0) {
+                next = (next & -64) + ctz64(this_g);
+                break;
+            }
+            next += 64;
+            mask = -1;
+        } while (next < words * 64);
+    }
+
+    i = 0;
+    do {
+        uint64_t this_d = 0;
+        if (i == next / 64) {
+            this_d = 1ull << (next & 63);
+        }
+        d[i] = this_d;
+        flags = iter_predtest_fwd(this_d, g[i] & esz_mask, flags);
+    } while (++i < words);
+
+    return flags;
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67fb3091ac..4bb40da119 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "tcg-op.h"
 #include "tcg-op-gvec.h"
+#include "tcg-gvec-desc.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "translate.h"
@@ -192,6 +193,12 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
     tcg_temp_free_i32(t);
 }
 
+/* For each element size, the bits within a predicate word that are active.  */
+const uint64_t pred_esz_masks[4] = {
+    0xffffffffffffffffull, 0x5555555555555555ull,
+    0x1111111111111111ull, 0x0101010101010101ull
+};
+
 /*
  *** SVE Logical - Unpredicated Group
  */
@@ -541,6 +548,208 @@ static bool trans_PTEST(DisasContext *s, arg_PTEST *a, uint32_t insn)
     return true;
 }
 
+/* See the ARM pseudocode DecodePredCount.  */
+static unsigned decode_pred_count(unsigned fullsz, int pattern, int esz)
+{
+    unsigned elements = fullsz >> esz;
+    unsigned bound;
+
+    switch (pattern) {
+    case 0x0: /* POW2 */
+        return pow2floor(elements);
+    case 0x1: /* VL1 */
+    case 0x2: /* VL2 */
+    case 0x3: /* VL3 */
+    case 0x4: /* VL4 */
+    case 0x5: /* VL5 */
+    case 0x6: /* VL6 */
+    case 0x7: /* VL7 */
+    case 0x8: /* VL8 */
+        bound = pattern;
+        break;
+    case 0x9: /* VL16 */
+    case 0xa: /* VL32 */
+    case 0xb: /* VL64 */
+    case 0xc: /* VL128 */
+    case 0xd: /* VL256 */
+        bound = 16 << (pattern - 9);
+        break;
+    case 0x1d: /* MUL4 */
+        return elements - elements % 4;
+    case 0x1e: /* MUL3 */
+        return elements - elements % 3;
+    case 0x1f: /* ALL */
+        return elements;
+    default:   /* #uimm5 */
+        return 0;
+    }
+    return elements >= bound ? bound : 0;
+}
+
+/* This handles all of the predicate initialization instructions,
+ * PTRUE, PFALSE, SETFFR.  For PFALSE, we will have set PAT == 32
+ * so that decode_pred_count returns 0.  For SETFFR, we will have
+ * set RD == 16 == FFR.
+ */
+static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned ofs = pred_full_reg_offset(s, rd);
+    unsigned numelem, setsz, i;
+    uint64_t word, lastword;
+    TCGv_i64 t;
+
+    numelem = decode_pred_count(fullsz, pat, esz);
+
+    /* Determine what we must store into each bit, and how many.  */
+    if (numelem == 0) {
+        lastword = word = 0;
+        setsz = fullsz;
+    } else {
+        setsz = numelem << esz;
+        lastword = word = pred_esz_masks[esz];
+        if (setsz % 64) {
+            lastword &= ~(-1ull << (setsz % 64));
+        }
+    }
+
+    t = tcg_temp_new_i64();
+    if (fullsz <= 64) {
+        tcg_gen_movi_i64(t, lastword);
+        tcg_gen_st_i64(t, cpu_env, ofs);
+        goto done;
+    }
+
+    if (word == lastword) {
+        unsigned maxsz = size_for_gvec(fullsz / 8);
+        unsigned oprsz = size_for_gvec(setsz / 8);
+
+        if (oprsz * 8 == setsz) {
+            tcg_gen_gvec_dup64i(ofs, oprsz, maxsz, word);
+            goto done;
+        }
+        if (oprsz * 8 == setsz + 8) {
+            tcg_gen_gvec_dup64i(ofs, oprsz, maxsz, word);
+            tcg_gen_movi_i64(t, 0);
+            tcg_gen_st_i64(t, cpu_env, ofs + oprsz - 8);
+            goto done;
+        }
+    }
+
+    setsz /= 8;
+    fullsz /= 8;
+
+    tcg_gen_movi_i64(t, word);
+    for (i = 0; i < setsz; i += 8) {
+        tcg_gen_st_i64(t, cpu_env, ofs + i);
+    }
+    if (lastword != word) {
+        tcg_gen_movi_i64(t, lastword);
+        tcg_gen_st_i64(t, cpu_env, ofs + i);
+        i += 8;
+    }
+    if (i < fullsz) {
+        tcg_gen_movi_i64(t, 0);
+        for (; i < fullsz; i += 8) {
+            tcg_gen_st_i64(t, cpu_env, ofs + i);
+        }
+    }
+
+ done:
+    tcg_temp_free_i64(t);
+
+    /* PTRUES */
+    if (setflag) {
+        tcg_gen_movi_i32(cpu_NF, -(word != 0));
+        tcg_gen_movi_i32(cpu_CF, word == 0);
+        tcg_gen_movi_i32(cpu_VF, 0);
+        tcg_gen_mov_i32(cpu_ZF, cpu_NF);
+    }
+    return true;
+}
+
+static bool trans_PTRUE(DisasContext *s, arg_PTRUE *a, uint32_t insn)
+{
+    return do_predset(s, a->esz, a->rd, a->pat, a->s);
+}
+
+static bool trans_SETFFR(DisasContext *s, arg_SETFFR *a, uint32_t insn)
+{
+    /* Note pat == 31 is #all, to set all elements.  */
+    return do_predset(s, 0, FFR_PRED_NUM, 31, false);
+}
+
+static bool trans_PFALSE(DisasContext *s, arg_PFALSE *a, uint32_t insn)
+{
+    /* Note pat == 32 is #unimp, to set no elements.  */
+    return do_predset(s, 0, a->rd, 32, false);
+}
+
+static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a, uint32_t insn)
+{
+    /* The path through do_pppp_flags is complicated enough to want to avoid
+     * duplication.  Frob the arguments into the form of a predicated AND.
+     */
+    arg_rprr_s alt_a = {
+        .rd = a->rd, .pg = a->pg, .s = a->s,
+        .rn = FFR_PRED_NUM, .rm = FFR_PRED_NUM,
+    };
+    return trans_AND_pppp(s, &alt_a, insn);
+}
+
+static bool trans_RDFFR(DisasContext *s, arg_RDFFR *a, uint32_t insn)
+{
+    return do_mov_p(s, a->rd, FFR_PRED_NUM);
+}
+
+static bool trans_WRFFR(DisasContext *s, arg_WRFFR *a, uint32_t insn)
+{
+    return do_mov_p(s, FFR_PRED_NUM, a->rn);
+}
+
+static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
+                            void (*gen_fn)(TCGv_i32, TCGv_ptr,
+                                           TCGv_ptr, TCGv_i32))
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    TCGv_ptr t_pd = tcg_temp_new_ptr();
+    TCGv_ptr t_pg = tcg_temp_new_ptr();
+    TCGv_i32 t;
+    unsigned desc;
+
+    desc = DIV_ROUND_UP(pred_full_reg_size(s), 8);
+    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+
+    tcg_gen_addi_ptr(t_pd, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->rn));
+    t = tcg_const_i32(desc);
+
+    gen_fn(t, t_pd, t_pg, t);
+    tcg_temp_free_ptr(t_pd);
+    tcg_temp_free_ptr(t_pg);
+
+    do_pred_flags(t);
+    tcg_temp_free_i32(t);
+    return true;
+}
+
+static bool trans_PFIRST(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    return do_pfirst_pnext(s, a, gen_helper_sve_pfirst);
+}
+
+static bool trans_PNEXT(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    return do_pfirst_pnext(s, a, gen_helper_sve_pnext);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f695dda3b1..a390abb537 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -29,6 +29,7 @@
 # when creating helpers common to those for the individual
 # instruction patterns.
 
+&rr_esz         rd rn esz
 &rri            rd rn imm
 &rrr_esz        rd rn rm esz
 &rprr_s         rd pg rn rm s
@@ -37,6 +38,12 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+# Two operand with unused vector element size
+@pd_pn_e0       ........ ........ ....... rn:4 . rd:4           &rr_esz esz=0
+
+# Two operand
+@pd_pn          ........ esz:2 .. .... ....... rn:4 . rd:4      &rr_esz
+
 # Three operand with unused vector element size
 @rd_rn_rm_e0    ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0
 
@@ -77,6 +84,30 @@ NAND_pppp       00100101 1. 00 .... 01 .... 1 .... 1 ....       @pd_pg_pn_pm_s
 # SVE predicate test
 PTEST           00100101 01 010000 11 pg:4 0 rn:4 0 0000
 
+# SVE predicate initialize
+PTRUE           00100101 esz:2 01100 s:1 111000 pat:5 0 rd:4
+
+# SVE initialize FFR
+SETFFR          00100101 0010 1100 1001 0000 0000 0000
+
+# SVE zero predicate register
+PFALSE          00100101 0001 1000 1110 0100 0000 rd:4
+
+# SVE predicate read from FFR (predicated)
+RDFFR_p         00100101 0 s:1 0110001111000 pg:4 0 rd:4
+
+# SVE predicate read from FFR (unpredicated)
+RDFFR           00100101 0001 1001 1111 0000 0000 rd:4
+
+# SVE FFR write from predicate (WRFFR)
+WRFFR           00100101 0010 1000 1001 000 rn:4 00000
+
+# SVE predicate first active
+PFIRST          00100101 01 011 000 11000 00 .... 0 ....        @pd_pn_e0
+
+# SVE predicate next active
+PNEXT           00100101 .. 011 001 11000 10 .... 0 ....        @pd_pn
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.17.0

