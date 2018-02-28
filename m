Received: by 10.28.91.67 with SMTP id p64csp983802wmb;
        Wed, 28 Feb 2018 11:31:48 -0800 (PST)
X-Google-Smtp-Source: AG47ELuUBi7+pHZVx0Zgvuq7e50lMAc5gZo6LYYWjjQZCOAUgFL4NOa7OcebF7RN9RLHB9Zs8LKo
X-Received: by 10.129.70.198 with SMTP id t189mr3382814ywa.289.1519846308842;
        Wed, 28 Feb 2018 11:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846308; cv=none;
        d=google.com; s=arc-20160816;
        b=dvVs+QJGfnr25xdg5OAI/IHfmXcNtmvLRRLbytPJD0e0bBJLnGZ58nxqxhqTDROdej
         sKVemU2y+m+GHUQLGPrF+be7OAJw+bkV2QbdpqwnOFdGq+fGCDysDFrubwF9PzbjJr2c
         BAavcyOj/U+E5YlLdA4CmdnKOdMroA4SjGehs3XrmqoANc8t8o4bRbqCrhGwrbnmYE0l
         VV3A/XKG1P9xi4DssmOFNOgW1JG24w3AsXfprnGV+aX3rIF61OUXGV/uzVt/7tE4ifm2
         KfCvB1e5ZnRvWq2f3obkxxGDCuU3eZwqDZoFcoZVzS4cW+92zh3vzN2mUMI5LNlmvjVd
         jSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uMvs/o2ddqXyYFNZ707Chol3lmqK9fZj+/t+Dj/gMrw=;
        b=nE2f6sxVjHGBIC6koZDpyEMP/Q9bFBKkZWaRLwMXpKczBdj/zESclTZabNapsHeEnU
         mdDxVtN2is9uZzTR/W5VVVVtHfYLUuY4lJKA67do4D3gELIGEZcWHvvwu+3sselRubPM
         YCJ1rekMd25ItGnGtACwZe0ZMzM/s4KGxjBmQfUlWtkV0e4ooyAR8fsLK3p4y2904DcQ
         L+HdXMDH8LLKCxGI280r8xl9Cxep9XFbEhRbgnGgMw3AP+JPf6AzaHbLuNJQF/sqIMkn
         +mgt0nwmgglCJurfJ0xHdcFsqXyLuK7wqa3GDNinmn6bxr1xBMKhVi9qZnPuY34UDk9h
         HzZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H5GQDLRG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t35-v6si377472ybt.615.2018.02.28.11.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H5GQDLRG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7S8-0003G6-5O
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:31:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rs-0003FI-V6
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rr-0006FA-QE
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:32 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:32929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Rr-0006Ej-IC
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:31 -0500
Received: by mail-pl0-x241.google.com with SMTP id c11-v6so2132132plo.0
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uMvs/o2ddqXyYFNZ707Chol3lmqK9fZj+/t+Dj/gMrw=;
	b=H5GQDLRGJSS4a0B60awV9ZA3vIY2Bp0FnFxq9opbh1Mvrza+Qq/u5ppIOz9rQtTcjd
	/RObauC2eXSyHW9XRsqGblLHuqScTyDgKl8yPPZxaI8pmqpKK1W0ahj0+i7YGA1WTWn4
	ANGVRlUaPscEmSPAsEEUPDFddhMAPLyfuAfYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uMvs/o2ddqXyYFNZ707Chol3lmqK9fZj+/t+Dj/gMrw=;
	b=Es90d0zdY2vOnxEZ8T+pZiX0rNASEk0CkYNXK24vqBKHaTGUnUCnYq7Mrebal+DHQv
	ImfYW7+8VANrHj7qH36ht3zMsY8/wjQuWXCvo4csqQdltTCUT+509Gvbd5ZC5RJtLwvl
	e8vSNhq+/cgXImVFom26KrpE8mUrAZ5aGSHfS/XNWJmY88r1bo09r5wjPFhrBhTHOJes
	orr8PQvsYrtKz30N91XBr8IOzp5MLdDmA+rKw2J0CPIqjd5Wni+XvPooc8WZ92y/xWLE
	O0MY5BRthrzrzBUeajUKJmVioAky1G1JAgPot5VWPZb5JfnYtoHxOq3x37sEZkCg7sss
	RrMw==
X-Gm-Message-State: APf1xPCC+DctWS9jY2n0Mgqyzuib9M8G2JVcqbinlVGREpENsBSDnZMH
	Pjesw4ruNo3cuTNvgY2wYMCbRA==
X-Received: by 2002:a17:902:2e04:: with SMTP id
	q4-v6mr18903971plb.22.1519846290427; 
	Wed, 28 Feb 2018 11:31:30 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:11 -0800
Message-Id: <20180228193125.20577-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v3 02/16] target/arm: Refactor disas_simd_indexed
 decode
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K2CK5SIFwl5j

Include the U bit in the switches rather than testing separately.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 129 +++++++++++++++++++++------------------------
 1 file changed, 61 insertions(+), 68 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 32811dc8b0..fc928b61f6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11787,49 +11787,39 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int index;
     TCGv_ptr fpst;
 
-    switch (opcode) {
-    case 0x0: /* MLA */
-    case 0x4: /* MLS */
-        if (!u || is_scalar) {
+    switch (16 * u + opcode) {
+    case 0x08: /* MUL */
+    case 0x10: /* MLA */
+    case 0x14: /* MLS */
+        if (is_scalar) {
             unallocated_encoding(s);
             return;
         }
         break;
-    case 0x2: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
-    case 0x6: /* SMLSL, SMLSL2, UMLSL, UMLSL2 */
-    case 0xa: /* SMULL, SMULL2, UMULL, UMULL2 */
+    case 0x02: /* SMLAL, SMLAL2 */
+    case 0x12: /* UMLAL, UMLAL2 */
+    case 0x06: /* SMLSL, SMLSL2 */
+    case 0x16: /* UMLSL, UMLSL2 */
+    case 0x0a: /* SMULL, SMULL2 */
+    case 0x1a: /* UMULL, UMULL2 */
         if (is_scalar) {
             unallocated_encoding(s);
             return;
         }
         is_long = true;
         break;
-    case 0x3: /* SQDMLAL, SQDMLAL2 */
-    case 0x7: /* SQDMLSL, SQDMLSL2 */
-    case 0xb: /* SQDMULL, SQDMULL2 */
+    case 0x03: /* SQDMLAL, SQDMLAL2 */
+    case 0x07: /* SQDMLSL, SQDMLSL2 */
+    case 0x0b: /* SQDMULL, SQDMULL2 */
         is_long = true;
-        /* fall through */
-    case 0xc: /* SQDMULH */
-    case 0xd: /* SQRDMULH */
-        if (u) {
-            unallocated_encoding(s);
-            return;
-        }
         break;
-    case 0x8: /* MUL */
-        if (u || is_scalar) {
-            unallocated_encoding(s);
-            return;
-        }
+    case 0x0c: /* SQDMULH */
+    case 0x0d: /* SQRDMULH */
         break;
-    case 0x1: /* FMLA */
-    case 0x5: /* FMLS */
-        if (u) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
-    case 0x9: /* FMUL, FMULX */
+    case 0x01: /* FMLA */
+    case 0x05: /* FMLS */
+    case 0x09: /* FMUL */
+    case 0x19: /* FMULX */
         if (size == 1) {
             unallocated_encoding(s);
             return;
@@ -11909,21 +11899,20 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
             read_vec_element(s, tcg_op, rn, pass, MO_64);
 
-            switch (opcode) {
-            case 0x5: /* FMLS */
+            switch (16 * u + opcode) {
+            case 0x05: /* FMLS */
                 /* As usual for ARM, separate negation for fused multiply-add */
                 gen_helper_vfp_negd(tcg_op, tcg_op);
                 /* fall through */
-            case 0x1: /* FMLA */
+            case 0x01: /* FMLA */
                 read_vec_element(s, tcg_res, rd, pass, MO_64);
                 gen_helper_vfp_muladdd(tcg_res, tcg_op, tcg_idx, tcg_res, fpst);
                 break;
-            case 0x9: /* FMUL, FMULX */
-                if (u) {
-                    gen_helper_vfp_mulxd(tcg_res, tcg_op, tcg_idx, fpst);
-                } else {
-                    gen_helper_vfp_muld(tcg_res, tcg_op, tcg_idx, fpst);
-                }
+            case 0x09: /* FMUL */
+                gen_helper_vfp_muld(tcg_res, tcg_op, tcg_idx, fpst);
+                break;
+            case 0x19: /* FMULX */
+                gen_helper_vfp_mulxd(tcg_res, tcg_op, tcg_idx, fpst);
                 break;
             default:
                 g_assert_not_reached();
@@ -11966,10 +11955,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
             read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : MO_32);
 
-            switch (opcode) {
-            case 0x0: /* MLA */
-            case 0x4: /* MLS */
-            case 0x8: /* MUL */
+            switch (16 * u + opcode) {
+            case 0x08: /* MUL */
+            case 0x10: /* MLA */
+            case 0x14: /* MLS */
             {
                 static NeonGenTwoOpFn * const fns[2][2] = {
                     { gen_helper_neon_add_u16, gen_helper_neon_sub_u16 },
@@ -11991,8 +11980,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 genfn(tcg_res, tcg_op, tcg_res);
                 break;
             }
-            case 0x5: /* FMLS */
-            case 0x1: /* FMLA */
+            case 0x05: /* FMLS */
+            case 0x01: /* FMLA */
                 read_vec_element_i32(s, tcg_res, rd, pass,
                                      is_scalar ? size : MO_32);
                 switch (size) {
@@ -12023,39 +12012,43 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                     g_assert_not_reached();
                 }
                 break;
-            case 0x9: /* FMUL, FMULX */
+            case 0x09: /* FMUL */
                 switch (size) {
                 case 1:
-                    if (u) {
-                        if (is_scalar) {
-                            gen_helper_advsimd_mulxh(tcg_res, tcg_op,
-                                                     tcg_idx, fpst);
-                        } else {
-                            gen_helper_advsimd_mulx2h(tcg_res, tcg_op,
-                                                      tcg_idx, fpst);
-                        }
+                    if (is_scalar) {
+                        gen_helper_advsimd_mulh(tcg_res, tcg_op,
+                                                tcg_idx, fpst);
                     } else {
-                        if (is_scalar) {
-                            gen_helper_advsimd_mulh(tcg_res, tcg_op,
-                                                    tcg_idx, fpst);
-                        } else {
-                            gen_helper_advsimd_mul2h(tcg_res, tcg_op,
-                                                     tcg_idx, fpst);
-                        }
+                        gen_helper_advsimd_mul2h(tcg_res, tcg_op,
+                                                 tcg_idx, fpst);
                     }
                     break;
                 case 2:
-                    if (u) {
-                        gen_helper_vfp_mulxs(tcg_res, tcg_op, tcg_idx, fpst);
-                    } else {
-                        gen_helper_vfp_muls(tcg_res, tcg_op, tcg_idx, fpst);
-                    }
+                    gen_helper_vfp_muls(tcg_res, tcg_op, tcg_idx, fpst);
                     break;
                 default:
                     g_assert_not_reached();
                 }
                 break;
-            case 0xc: /* SQDMULH */
+            case 0x19: /* FMULX */
+                switch (size) {
+                case 1:
+                    if (is_scalar) {
+                        gen_helper_advsimd_mulxh(tcg_res, tcg_op,
+                                                 tcg_idx, fpst);
+                    } else {
+                        gen_helper_advsimd_mulx2h(tcg_res, tcg_op,
+                                                  tcg_idx, fpst);
+                    }
+                    break;
+                case 2:
+                    gen_helper_vfp_mulxs(tcg_res, tcg_op, tcg_idx, fpst);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+                break;
+            case 0x0c: /* SQDMULH */
                 if (size == 1) {
                     gen_helper_neon_qdmulh_s16(tcg_res, cpu_env,
                                                tcg_op, tcg_idx);
@@ -12064,7 +12057,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                                                tcg_op, tcg_idx);
                 }
                 break;
-            case 0xd: /* SQRDMULH */
+            case 0x0d: /* SQRDMULH */
                 if (size == 1) {
                     gen_helper_neon_qrdmulh_s16(tcg_res, cpu_env,
                                                 tcg_op, tcg_idx);
-- 
2.14.3

