Received: by 10.28.91.67 with SMTP id p64csp989653wmb;
        Wed, 28 Feb 2018 11:38:17 -0800 (PST)
X-Google-Smtp-Source: AG47ELuElqP8up+TlqP4ipHVinO8igxeQXsNHnUD2OQ11oEz/LtvDnY5ekTyM2yg41yHfPbfxN/Z
X-Received: by 10.129.135.135 with SMTP id x129mr6247796ywf.495.1519846697324;
        Wed, 28 Feb 2018 11:38:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846697; cv=none;
        d=google.com; s=arc-20160816;
        b=wFj3/a83ibi8+utPP7ZIIvHJXh1Q8pYj5d/t878yEdvEh02YS0QznEJLZmS5luuqRq
         18GfoNum3SPhHV1LSjpjPiCU8gzHdlf2fN8qOMbsys9GN0VP8v3xmmqBOr1O+uHIf2MQ
         yM1nVBCck8QLYID8FW3gOpUzJw/vrH3LYcIM9oqKYc7UViA5IS0wdNWqph6UBIjgeor8
         TeG9hbdVIPpawsyRM0JruT9DHUvDHgeWX4vn7kKbgH6MVXnGaWGCRlUhMf1xkON9h56B
         rSC+BGeswvXfiSp6fT9vb5BhdD7HofQ9hMoNm/39SlSx+IMMkn3KEwHApM4HjT8mr8ql
         wCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qFjrf0fj3fYEerkSuVByoHWTY8OEKjQxncc02aLcsbE=;
        b=DO3SKitW1POpNMD0HxmoB/2Xyl7yW8idE00C0oxEI0RiBZzyHFNf9rgaUZzi1C04mY
         EapdtqDeF572Hc0+TTFwLvpGEQkEGxiD3dieqimUS208a+56FLn3FblCQcrnzgadniWl
         mUCG4fZHIkdzysP2R5lY2dtAz6oj6m40vnRS9HOrys2q8pysKUJIK85LtM/aXWP/Vfh+
         TDWaQ3Y6OlriGthRTxtBzSrNe+yTlg5KztY+s7rbbVleq+JM+M/9j0M5ejb9jAHjV5TW
         6KVUALD8wSZxkPiOZ2H9xcebbWEPHsyBUMrpQ9kqtvuUDMl1nbinmqqX5sGdE0CJnkM2
         eImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e7yJ5CRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si377867ywd.122.2018.02.28.11.38.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:38:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e7yJ5CRH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7YO-0000SU-LU
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:38:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S1-0003No-TY
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Ry-0006Kc-SV
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:41 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:43929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Ry-0006K9-KP
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:38 -0500
Received: by mail-pl0-x244.google.com with SMTP id f23-v6so2113546plr.10
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qFjrf0fj3fYEerkSuVByoHWTY8OEKjQxncc02aLcsbE=;
	b=e7yJ5CRHGkn6VssS+eif8PDIyQxkRrTM+2BI1ml4gReneX8thFBZf5H4bbMcmuyj0K
	TuJcF/PdgRLsfn9mKpwRDWu0pkVLYduQmr1dshEAnuhSBzyihhbFQXtY65VJvH9IwHNd
	VRMA9rqqpZ1R/xgxYO92Ss81Hupzpd7Ch4ciw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qFjrf0fj3fYEerkSuVByoHWTY8OEKjQxncc02aLcsbE=;
	b=o1BpsuIdxSVOzJ53DfEvGpiL2u1cTfXrFQ4WaMidIoVHwN7UufTRkVZWOFgdMa44Fa
	SHDE1wn2hLieM5I1lthmHqF5ixsczLE8qZw6Jtx4XNJV2GKXmKsKPl10qNA9KGbb+kU6
	DpD5qiDrDirtWmJqs8NiN5AePISICzjD0bEuBZF9b1qgaOGLHCmfUs6Qozuo0e4TNFNi
	0tfWP30+apvQA9uQTnBzVgagnNINe54hMvs9w7OsS/MQk2WeEcbtHUpwqxL6a+8zCR23
	wr+ku/JJ67sxEEf9BcgHcsM/2ick+a57O8knmaiMvGWEBytBxWCSIJqdr9tLCkrzciQM
	K7yA==
X-Gm-Message-State: APf1xPB11OOd45yqw3rnYYj66ItLZV/X+WlEWEzKZJwZaCzmpiJvQ4Xz
	KsBnfS/aS5egaIRBRb9SuNWGp6YfTX0=
X-Received: by 2002:a17:902:5327:: with SMTP id
	b36-v6mr6126877pli.332.1519846297714; 
	Wed, 28 Feb 2018 11:31:37 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:16 -0800
Message-Id: <20180228193125.20577-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v3 07/16] target/arm: Decode aa32 armv8.1 three
 same
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
X-TUID: aMjp543ns7xV

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 86 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index aa6dcaa577..05fa6a53f9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -25,6 +25,7 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
+#include "tcg-op-gvec.h"
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
@@ -5374,9 +5375,9 @@ static void gen_neon_narrow_op(int op, int u, int size,
 #define NEON_3R_VPMAX 20
 #define NEON_3R_VPMIN 21
 #define NEON_3R_VQDMULH_VQRDMULH 22
-#define NEON_3R_VPADD 23
+#define NEON_3R_VPADD_VQRDMLAH 23
 #define NEON_3R_SHA 24 /* SHA1C,SHA1P,SHA1M,SHA1SU0,SHA256H{2},SHA256SU1 */
-#define NEON_3R_VFM 25 /* VFMA, VFMS : float fused multiply-add */
+#define NEON_3R_VFM_VQRDMLSH 25 /* VFMA, VFMS, VQRDMLSH */
 #define NEON_3R_FLOAT_ARITH 26 /* float VADD, VSUB, VPADD, VABD */
 #define NEON_3R_FLOAT_MULTIPLY 27 /* float VMLA, VMLS, VMUL */
 #define NEON_3R_FLOAT_CMP 28 /* float VCEQ, VCGE, VCGT */
@@ -5408,9 +5409,9 @@ static const uint8_t neon_3r_sizes[] = {
     [NEON_3R_VPMAX] = 0x7,
     [NEON_3R_VPMIN] = 0x7,
     [NEON_3R_VQDMULH_VQRDMULH] = 0x6,
-    [NEON_3R_VPADD] = 0x7,
+    [NEON_3R_VPADD_VQRDMLAH] = 0x7,
     [NEON_3R_SHA] = 0xf, /* size field encodes op type */
-    [NEON_3R_VFM] = 0x5, /* size bit 1 encodes op */
+    [NEON_3R_VFM_VQRDMLSH] = 0x7, /* For VFM, size bit 1 encodes op */
     [NEON_3R_FLOAT_ARITH] = 0x5, /* size bit 1 encodes op */
     [NEON_3R_FLOAT_MULTIPLY] = 0x5, /* size bit 1 encodes op */
     [NEON_3R_FLOAT_CMP] = 0x5, /* size bit 1 encodes op */
@@ -5589,6 +5590,22 @@ static const uint8_t neon_2rm_sizes[] = {
     [NEON_2RM_VCVT_UF] = 0x4,
 };
 
+
+/* Expand v8.1 simd helper.  */
+static int do_v81_helper(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                         int q, int rd, int rn, int rm)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_V8_RDM)) {
+        int opr_sz = (1 + q) * 8;
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm), cpu_env,
+                           opr_sz, opr_sz, 0, fn);
+        return 0;
+    }
+    return 1;
+}
+
 /* Translate a NEON data processing instruction.  Return nonzero if the
    instruction is invalid.
    We process data in a mixture of 32-bit and 64-bit chunks.
@@ -5641,12 +5658,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         if (q && ((rd | rn | rm) & 1)) {
             return 1;
         }
-        /*
-         * The SHA-1/SHA-256 3-register instructions require special treatment
-         * here, as their size field is overloaded as an op type selector, and
-         * they all consume their input in a single pass.
-         */
-        if (op == NEON_3R_SHA) {
+        switch (op) {
+        case NEON_3R_SHA:
+            /* The SHA-1/SHA-256 3-register instructions require special
+             * treatment here, as their size field is overloaded as an
+             * op type selector, and they all consume their input in a
+             * single pass.
+             */
             if (!q) {
                 return 1;
             }
@@ -5683,6 +5701,40 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tcg_temp_free_ptr(ptr2);
             tcg_temp_free_ptr(ptr3);
             return 0;
+
+        case NEON_3R_VPADD_VQRDMLAH:
+            if (!u) {
+                break;  /* VPADD */
+            }
+            /* VQRDMLAH */
+            switch (size) {
+            case 1:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s16,
+                                     q, rd, rn, rm);
+            case 2:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s32,
+                                     q, rd, rn, rm);
+            }
+            return 1;
+
+        case NEON_3R_VFM_VQRDMLSH:
+            if (!u) {
+                /* VFM, VFMS */
+                if (size == 1) {
+                    return 1;
+                }
+                break;
+            }
+            /* VQRDMLSH */
+            switch (size) {
+            case 1:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlsh_s16,
+                                     q, rd, rn, rm);
+            case 2:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlsh_s32,
+                                     q, rd, rn, rm);
+            }
+            return 1;
         }
         if (size == 3 && op != NEON_3R_LOGIC) {
             /* 64-bit element instructions. */
@@ -5768,11 +5820,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 rm = rtmp;
             }
             break;
-        case NEON_3R_VPADD:
-            if (u) {
-                return 1;
-            }
-            /* Fall through */
+        case NEON_3R_VPADD_VQRDMLAH:
         case NEON_3R_VPMAX:
         case NEON_3R_VPMIN:
             pairwise = 1;
@@ -5806,8 +5854,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 return 1;
             }
             break;
-        case NEON_3R_VFM:
-            if (!arm_dc_feature(s, ARM_FEATURE_VFP4) || u) {
+        case NEON_3R_VFM_VQRDMLSH:
+            if (!arm_dc_feature(s, ARM_FEATURE_VFP4)) {
                 return 1;
             }
             break;
@@ -6004,7 +6052,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
             }
             break;
-        case NEON_3R_VPADD:
+        case NEON_3R_VPADD_VQRDMLAH:
             switch (size) {
             case 0: gen_helper_neon_padd_u8(tmp, tmp, tmp2); break;
             case 1: gen_helper_neon_padd_u16(tmp, tmp, tmp2); break;
@@ -6103,7 +6151,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
               }
             }
             break;
-        case NEON_3R_VFM:
+        case NEON_3R_VFM_VQRDMLSH:
         {
             /* VFMA, VFMS: fused multiply-add */
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.14.3

