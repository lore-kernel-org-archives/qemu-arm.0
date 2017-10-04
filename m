Received: by 10.223.197.9 with SMTP id q9csp5935740wrf;
        Wed, 4 Oct 2017 11:49:22 -0700 (PDT)
X-Received: by 10.200.24.65 with SMTP id n1mr29763040qtk.323.1507142962254;
        Wed, 04 Oct 2017 11:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142962; cv=none;
        d=google.com; s=arc-20160816;
        b=krAzR2xX4qkH4AMaw/dO4zoVJZwe1vfBedT90D4RKCM+16N+xKDUDQqJRXvrB+DQRM
         zPFZIzia0WmdT+yqrSw2rFbVwYpzRH4fVWY2bjqO9fntnev8FM3tfpG/BI7rj6t4gsPn
         GSGkk/nVB4ZmVEyclAjdvel8lhf28Zm+w+7PyLLxML72Wm8Nl9QYCXEMXWT5UhgfCVAl
         xOp8DdFp/ipSjVfROfkUGz2G15an8DGqHjQ4f3IUrvlh8DAMKkShUwwLBR5FnQ6hHWxL
         6N1Lb2Opwa0L+YICNLYCVpyrOlYydwWf18bfS0N5xZtvWuDHZjxdDZrjachWs3nCV6TS
         6V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uLy8QhtDCziYI/nYjPXu3/PQS6unxv5Zdb2dNvp2c0o=;
        b=hvml2pTMIwb3dgb7vfSaZsWfdGdnUH7hOHK1kEfUqCtBNAy70FCNwrvwz+O5Wo3FlF
         CAZFt+KduWX4+V78K+GLLF6iS6wgLgZ6PKJAQNfwrpoy7oNQluQ2+ySAoD7pyG2cKMG2
         h3zBYM9PbTNekgJH1Xm/mnqEtfGt+Os6JQckvVU+GMhomkmSIYFn6DgBuvwBzqBh6USb
         Fk9HvFICmLFSNKCadQakbt1SbkBu9kvJ4oZMMK4Gncv7W+Xz4RKCcDjoU3yhs6G+aIwz
         o3M2JmU5X/lPUJs8gmeW4Lrt83Lk/RRSLa5wLaZJmRnT9PaIWNK7Zf+EYZiXh7iGN81O
         Ih4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kwtGUiA8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si1974078qtb.406.2017.10.04.11.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kwtGUiA8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzojR-0004lg-Oe
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:49:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodw-0008FD-9b
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodu-0002hS-Mf
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:40 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:50944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodu-0002gy-Hz
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:38 -0400
Received: by mail-qt0-x22d.google.com with SMTP id f15so21074149qtf.7
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uLy8QhtDCziYI/nYjPXu3/PQS6unxv5Zdb2dNvp2c0o=;
	b=kwtGUiA8j2rmES0l2qCTVqtT0+WsUG7ABW0LO7EdoPKyDxBMkOywMx8KsI8djPYtPt
	NzqCOKodywy1HtaXbbsUzSZ0YbjW5fk+REzYVzOl3fNHmSPQYSEIBCGmJF6RLKR3u0lU
	ULTQ1JBvyYgUC0oEniaN5CG6TqoDFDwd2S7Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uLy8QhtDCziYI/nYjPXu3/PQS6unxv5Zdb2dNvp2c0o=;
	b=hWCPnK+e+aTizsC1QUo7T9CSh6LmHatlkbHEQmZcJi8LySv+78g67hoKOl15RoWK+J
	unRSwtfY7W34rimj1UYLJlkshUBClQhSu8ztLGiy505WN7AbUvKf1piQcTJCgEff5PJD
	/lDNprTVCfOaWna1jdcJ8lG9l+kMQXNAdi/FN6boNFZtCRzg0ek2PlJ0PZKvx0Q72G1i
	xyL+U2TkAfPwCE2qeSOOvnqC3XLIkcDdfaFySLsCXDYt22eEgsUlipP86qjF6HSzb3jz
	4HiAKIrgfj/2tba4SEdYEJDJTal6aUnyQHPUFZ0asoDkRq8ZGiPF11YPkpgJ6FjZXhKE
	LmVg==
X-Gm-Message-State: AMCzsaUPNy6bTdzLe3bgP5JnPOAuF/+Yk7eZOJeG07wIuokZGRN5yXdA
	yTiJJeGvooiFk3lfA9xrSuna5g==
X-Google-Smtp-Source: AOwi7QDlbLKVVl294BjxL5jjIcgMX+5JZwCG+Txei/mVcPmTGF3TeLQV7qELrH2oupiG4QAZUklZnQ==
X-Received: by 10.37.97.83 with SMTP id v80mr4635171ybb.449.1507142617880;
	Wed, 04 Oct 2017 11:43:37 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:19 -0400
Message-Id: <20171004184325.24157-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: [Qemu-arm] [PATCH v1 06/12] target/arm: Decode aa32 armv8.1 three
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
X-TUID: JfvH6IIk0G7Z

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 83 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ab1a12a1b8..0cd58710b3 100644
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
@@ -5334,9 +5335,9 @@ static void gen_neon_narrow_op(int op, int u, int size,
 #define NEON_3R_VPMAX 20
 #define NEON_3R_VPMIN 21
 #define NEON_3R_VQDMULH_VQRDMULH 22
-#define NEON_3R_VPADD 23
+#define NEON_3R_VPADD_VQRDMLAH 23
 #define NEON_3R_SHA 24 /* SHA1C,SHA1P,SHA1M,SHA1SU0,SHA256H{2},SHA256SU1 */
-#define NEON_3R_VFM 25 /* VFMA, VFMS : float fused multiply-add */
+#define NEON_3R_VFM_VQRDMLSH 25 /* VFMA, VFMS : float fused multiply-add */
 #define NEON_3R_FLOAT_ARITH 26 /* float VADD, VSUB, VPADD, VABD */
 #define NEON_3R_FLOAT_MULTIPLY 27 /* float VMLA, VMLS, VMUL */
 #define NEON_3R_FLOAT_CMP 28 /* float VCEQ, VCGE, VCGT */
@@ -5368,9 +5369,9 @@ static const uint8_t neon_3r_sizes[] = {
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
@@ -5556,6 +5557,7 @@ static const uint8_t neon_2rm_sizes[] = {
 
 static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
 {
+    void (*fn_gvec_ptr)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
     int op;
     int q;
     int rd, rn, rm;
@@ -5600,12 +5602,12 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
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
+             * single pass.  */
             if (!q) {
                 return 1;
             }
@@ -5642,6 +5644,53 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tmp2);
             tcg_temp_free_i32(tmp3);
             return 0;
+
+        case NEON_3R_VPADD_VQRDMLAH:
+            if (!u) {
+                break;  /* VPADD */
+            }
+            /* VQRDMLAH */
+            switch (size) {
+            case 1:
+                fn_gvec_ptr = gen_helper_gvec_qrdmlah_s16;
+                break;
+            case 2:
+                fn_gvec_ptr = gen_helper_gvec_qrdmlah_s32;
+                break;
+            default:
+                return 1;
+            }
+        do_vqrdmlx:
+            if (arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+                int opr_sz = (1 + q) * 8;
+                tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                                   vfp_reg_offset(1, rn),
+                                   vfp_reg_offset(1, rm), cpu_env,
+                                   opr_sz, opr_sz, 0, fn_gvec_ptr);
+                return 0;
+            }
+            return 1;
+
+        case NEON_3R_VFM_VQRDMLSH:
+            if (!u) {
+                /* VFM, VFMS */
+                if ((5 & (1 << size)) == 0) {
+                    return 1;
+                }
+                break;
+            }
+            /* VQRDMLSH */
+            switch (size) {
+            case 1:
+                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s16;
+                break;
+            case 2:
+                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s32;
+                break;
+            default:
+                return 1;
+            }
+            goto do_vqrdmlx;
         }
         if (size == 3 && op != NEON_3R_LOGIC) {
             /* 64-bit element instructions. */
@@ -5727,11 +5776,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
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
@@ -5765,8 +5810,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
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
@@ -5963,7 +6008,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
             }
             break;
-        case NEON_3R_VPADD:
+        case NEON_3R_VPADD_VQRDMLAH:
             switch (size) {
             case 0: gen_helper_neon_padd_u8(tmp, tmp, tmp2); break;
             case 1: gen_helper_neon_padd_u16(tmp, tmp, tmp2); break;
@@ -6062,7 +6107,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
               }
             }
             break;
-        case NEON_3R_VFM:
+        case NEON_3R_VFM_VQRDMLSH:
         {
             /* VFMA, VFMS: fused multiply-add */
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.13.6

