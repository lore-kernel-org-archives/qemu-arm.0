Received: by 10.28.4.212 with SMTP id 203csp168464wme;
        Thu, 26 Apr 2018 17:29:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoGw/TDd4C6XIrUH5b0BcUR4GnRTkzFCVcPphMtpZOu/xoISsw7uSSMEwKWrPel3Yh/AeCz
X-Received: by 10.55.0.129 with SMTP id t1mr166120qkg.31.1524788983723;
        Thu, 26 Apr 2018 17:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524788983; cv=none;
        d=google.com; s=arc-20160816;
        b=cWCKfXFOh+KUa6W/pUe3AjXnM0C89MwtCWq9j8ZWr5/ynEldMNpGr4j9T5nkZdmajZ
         3ZfDbewBjtShk8XMtHk3LnsMBjlAdYXXdvTanPh224b1IF+IZVNh/PSntM9YqQKV89P7
         d3m0lZpLhKDAjvUG5rCtSAjAVVBZYHpi5mPR3deoG3Veuc+W+p4rooS2DOQ7Pinv5JWU
         oUuKBGy8uuaymomdW9gbmp8LbY1zGHts3CuPgJeDDKIHROsivME+1g1nMJZ3+B5zynGS
         0HB08AMYqfXZ3LBSKkhfyyJYQCvD4fNPYiR6j4wD1p7nO7VBkjm/V7lfsQXzOllNjUL6
         YrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=/OKQUbApuVUtLjo2vK1xvxA0ICytFh53I028FicEKSU=;
        b=J0k3ubbpz1TyLidCfCS7UkuoxaL1EImG+7f0DbHVg0ZmJinJwS6FbQEfneB01dDA1q
         okCJi/nrzLaxHMVxFXBUmTi2eJDszJ5jnb4aPN2C+ccgqEJpjuQZ9PVQotK5trA9JYuP
         zImyYEBrPF1Kn3Zdcj/DeryA2iAsTcf46gXM8IpLHmIwp+28c8PzDPg0ZwXQBUdxbwbG
         lky1gmEZm4U7QHkRmFe3jm6JmthDvH0EnqN9LOi7sWrNgsydtnzS8B97do5b2gKqiY0O
         OWu6pOsEtXNQZGI0AMEdAqeZ/9RwhRCARnfKkKORZThFkcQTAUxs70KegoMNFNvz0DsH
         9HXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fzApzNUT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3-v6si101126qvj.69.2018.04.26.17.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fzApzNUT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrGh-0003e5-5L
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:29:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEI-000291-5M
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEG-0004Yo-LQ
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:14 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:33871)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrEG-0004XI-DE
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:12 -0400
Received: by mail-pf0-x242.google.com with SMTP id a14so142478pfi.1
	for <qemu-devel@nongnu.org>; Thu, 26 Apr 2018 17:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/OKQUbApuVUtLjo2vK1xvxA0ICytFh53I028FicEKSU=;
	b=fzApzNUTfn5otIM2RgqTI757SUJiQVemakMS1Rhm8pEcQyQD/numKYdxcjTo4kEVgX
	VBSb4rjFvLSt2e3R0rbs44fdUVTVM4mBWq/21zVfXVDQUoABVm/JYKHycUEqEwOJRP/2
	OUwbaJ+dK1w7efd6hKIuIKrBQOJ4IFM1uuLGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/OKQUbApuVUtLjo2vK1xvxA0ICytFh53I028FicEKSU=;
	b=c2b+K0vWj7BEqur9XEJVBregR4REtvsgR3iWXogtXBWowrOdmZzLNWr8+mhczzGfo0
	p4gFE8Ije9AJ3ohWIs+hHP89Xv9kBJ9nl6oczi3SEeSaE0RM3p24J/ZSqHG8ji+Wb22W
	4vcqbANmaNuj6Ts6TiJpq+rPxjciikbhpPPbmX18Kcr+MOyUJ/OoL5HjlbzM3gAGZKAK
	AFRYXdOpBpXyczZNImCAJ0sNQvEMmTPz3DlMyyD+Kds77Y7HtLzUaX0+w1lJRg6g/YpQ
	V8LwMxFQWoA1/zihxdAtGmSwB4wcw/Y88I76XawQWzSmZiZfeuweGV8pIKgYXZo4Fbyu
	DBxg==
X-Gm-Message-State: ALQs6tApMHNEu9BdIsHrGH5UuyoTeElNQ2szo2BuxUlIfbgRVS6iKBWs
	yJAW9JpxPYhpDk7Ok5aOzmcwrh0kBts=
X-Received: by 2002:a63:6110:: with SMTP id
	v16-v6mr172686pgb.292.1524788830951; 
	Thu, 26 Apr 2018 17:27:10 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:48 -1000
Message-Id: <20180427002651.28356-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH 6/9] target/arm: Introduce
 ARM_FEATURE_V8_ATOMICS and initial decode
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
X-TUID: 9KjO9uoAVehH

The insns in the ARMv8.1-Atomics are added to the existing
load/store exclusive and load/store reg opcode spaces.
Rearrange the top-level decoders for these to accomodate.
The Atomics insns themselves still generate Unallocated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |   1 +
 linux-user/elfload.c       |   1 +
 target/arm/translate-a64.c | 182 +++++++++++++++++++++++++++++++++------------
 3 files changed, 138 insertions(+), 46 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 44e6b77151..013f785306 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1449,6 +1449,7 @@ enum arm_features {
     ARM_FEATURE_V8_SHA3, /* implements SHA3 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_SM3, /* implements SM3 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_SM4, /* implements SM4 part of v8 Crypto Extensions */
+    ARM_FEATURE_V8_ATOMICS, /* implements v8.1 Atomic Memory Extensions */
     ARM_FEATURE_V8_RDM, /* implements v8.1 simd round multiply */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
     ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c77ed1bb01..a12b7b9d8c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -557,6 +557,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SHA512, ARM_HWCAP_A64_SHA512);
     GET_FEATURE(ARM_FEATURE_V8_FP16,
                 ARM_HWCAP_A64_FPHP | ARM_HWCAP_A64_ASIMDHP);
+    GET_FEATURE(ARM_FEATURE_V8_ATOMICS, ARM_HWCAP_A64_ATOMICS);
     GET_FEATURE(ARM_FEATURE_V8_RDM, ARM_HWCAP_A64_ASIMDRDM);
     GET_FEATURE(ARM_FEATURE_V8_FCMA, ARM_HWCAP_A64_FCMA);
 #undef GET_FEATURE
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d916fea3a3..0706c8c394 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2147,62 +2147,98 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     int rt = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
     int rt2 = extract32(insn, 10, 5);
-    int is_lasr = extract32(insn, 15, 1);
     int rs = extract32(insn, 16, 5);
-    int is_pair = extract32(insn, 21, 1);
-    int is_store = !extract32(insn, 22, 1);
-    int is_excl = !extract32(insn, 23, 1);
+    int is_lasr = extract32(insn, 15, 1);
+    int o2_L_o1_o0 = extract32(insn, 21, 3) * 2 | is_lasr;
     int size = extract32(insn, 30, 2);
     TCGv_i64 tcg_addr;
 
-    if ((!is_excl && !is_pair && !is_lasr) ||
-        (!is_excl && is_pair) ||
-        (is_pair && size < 2)) {
-        unallocated_encoding(s);
+    switch (o2_L_o1_o0) {
+    case 0x0: /* STXR */
+    case 0x1: /* STLXR */
+        if (rn == 31) {
+            gen_check_sp_alignment(s);
+        }
+        if (is_lasr) {
+            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+        }
+        tcg_addr = read_cpu_reg_sp(s, rn, 1);
+        gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, false);
         return;
-    }
 
-    if (rn == 31) {
-        gen_check_sp_alignment(s);
-    }
-    tcg_addr = read_cpu_reg_sp(s, rn, 1);
-
-    /* Note that since TCG is single threaded load-acquire/store-release
-     * semantics require no extra if (is_lasr) { ... } handling.
-     */
-
-    if (is_excl) {
-        if (!is_store) {
-            s->is_ldex = true;
-            gen_load_exclusive(s, rt, rt2, tcg_addr, size, is_pair);
-            if (is_lasr) {
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-            }
-        } else {
-            if (is_lasr) {
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-            }
-            gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, is_pair);
+    case 0x4: /* LDXR */
+    case 0x5: /* LDAXR */
+        if (rn == 31) {
+            gen_check_sp_alignment(s);
         }
-    } else {
-        TCGv_i64 tcg_rt = cpu_reg(s, rt);
-        bool iss_sf = disas_ldst_compute_iss_sf(size, false, 0);
+        tcg_addr = read_cpu_reg_sp(s, rn, 1);
+        s->is_ldex = true;
+        gen_load_exclusive(s, rt, rt2, tcg_addr, size, false);
+        if (is_lasr) {
+            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+        }
+        return;
 
+    case 0x9: /* STLR */
         /* Generate ISS for non-exclusive accesses including LASR.  */
-        if (is_store) {
+        if (rn == 31) {
+            gen_check_sp_alignment(s);
+        }
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+        tcg_addr = read_cpu_reg_sp(s, rn, 1);
+        do_gpr_st(s, cpu_reg(s, rt), tcg_addr, size, true, rt,
+                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
+        return;
+
+    case 0xd: /* LDARB */
+        /* Generate ISS for non-exclusive accesses including LASR.  */
+        if (rn == 31) {
+            gen_check_sp_alignment(s);
+        }
+        tcg_addr = read_cpu_reg_sp(s, rn, 1);
+        do_gpr_ld(s, cpu_reg(s, rt), tcg_addr, size, false, false, true, rt,
+                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+        return;
+
+    case 0x2: case 0x3: /* CASP / STXP */
+        if (size & 2) { /* STXP / STLXP */
+            if (rn == 31) {
+                gen_check_sp_alignment(s);
+            }
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            do_gpr_st(s, tcg_rt, tcg_addr, size,
-                      true, rt, iss_sf, is_lasr);
-        } else {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false,
-                      true, rt, iss_sf, is_lasr);
+            tcg_addr = read_cpu_reg_sp(s, rn, 1);
+            gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, true);
+            return;
+        }
+        /* CASP / CASPL */
+        break;
+
+    case 0x6: case 0x7: /* CASP / LDXP */
+        if (size & 2) { /* LDXP / LDAXP */
+            if (rn == 31) {
+                gen_check_sp_alignment(s);
+            }
+            tcg_addr = read_cpu_reg_sp(s, rn, 1);
+            s->is_ldex = true;
+            gen_load_exclusive(s, rt, rt2, tcg_addr, size, true);
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
             }
+            return;
         }
+        /* CASPA / CASPAL */
+        break;
+
+    case 0xa: /* CAS */
+    case 0xb: /* CASL */
+    case 0xe: /* CASA */
+    case 0xf: /* CASAL */
+        break;
     }
+    unallocated_encoding(s);
 }
 
 /*
@@ -2715,6 +2751,55 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     }
 }
 
+/* Atomic memory operations
+ *
+ *  31  30      27  26    24    22  21   16   15    12    10    5     0
+ * +------+-------+---+-----+-----+---+----+----+-----+-----+----+-----+
+ * | size | 1 1 1 | V | 0 0 | A R | 1 | Rs | o3 | opc | 0 0 | Rn |  Rt |
+ * +------+-------+---+-----+-----+--------+----+-----+-----+----+-----+
+ *
+ * Rt: the result register
+ * Rn: base address or SP
+ * Rs: the source register for the operation
+ * V: vector flag (always 0 as of v8.3)
+ * A: acquire flag
+ * R: release flag
+ */
+static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
+                              int size, int rt, bool is_vector)
+{
+    int rs = extract32(insn, 16, 5);
+    int rn = extract32(insn, 5, 5);
+    int o3_opc = extract32(insn, 12, 4);
+    int feature = ARM_FEATURE_V8_ATOMICS;
+
+    if (is_vector) {
+        unallocated_encoding(s);
+        return;
+    }
+    switch (o3_opc) {
+    case 000: /* LDADD */
+    case 001: /* LDCLR */
+    case 002: /* LDEOR */
+    case 003: /* LDSET */
+    case 004: /* LDSMAX */
+    case 005: /* LDSMIN */
+    case 006: /* LDUMAX */
+    case 007: /* LDUMIN */
+    case 010: /* SWP */
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+    if (!arm_dc_feature(s, feature)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    (void)rs;
+    (void)rn;
+}
+
 /* Load/store register (all forms) */
 static void disas_ldst_reg(DisasContext *s, uint32_t insn)
 {
@@ -2725,23 +2810,28 @@ static void disas_ldst_reg(DisasContext *s, uint32_t insn)
 
     switch (extract32(insn, 24, 2)) {
     case 0:
-        if (extract32(insn, 21, 1) == 1 && extract32(insn, 10, 2) == 2) {
-            disas_ldst_reg_roffset(s, insn, opc, size, rt, is_vector);
-        } else {
+        if (extract32(insn, 21, 1) == 0) {
             /* Load/store register (unscaled immediate)
              * Load/store immediate pre/post-indexed
              * Load/store register unprivileged
              */
             disas_ldst_reg_imm9(s, insn, opc, size, rt, is_vector);
+            return;
+        }
+        switch (extract32(insn, 10, 2)) {
+        case 0:
+            disas_ldst_atomic(s, insn, size, rt, is_vector);
+            return;
+        case 2:
+            disas_ldst_reg_roffset(s, insn, opc, size, rt, is_vector);
+            return;
         }
         break;
     case 1:
         disas_ldst_reg_unsigned_imm(s, insn, opc, size, rt, is_vector);
-        break;
-    default:
-        unallocated_encoding(s);
-        break;
+        return;
     }
+    unallocated_encoding(s);
 }
 
 /* AdvSIMD load/store multiple structures
-- 
2.14.3

