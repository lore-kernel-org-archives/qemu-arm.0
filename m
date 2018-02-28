Received: by 10.28.91.67 with SMTP id p64csp987608wmb;
        Wed, 28 Feb 2018 11:36:01 -0800 (PST)
X-Google-Smtp-Source: AH8x227w7a9eI3NNucXtAAbEHavp7CIBBpf/RkN/6woBc1W9pg+stisI4jkbXD7dy7vnbzTTP1X9
X-Received: by 10.129.168.134 with SMTP id f128mr12748645ywh.136.1519846560948;
        Wed, 28 Feb 2018 11:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846560; cv=none;
        d=google.com; s=arc-20160816;
        b=gSyYZ7EuW7KfmJE6MGYoUjF26q4LUcbCdgfSWEMFitrF6IKSo42vRIG9P6IJ8y9kh8
         S59lxm6wPjBCumP7srH9QzoHqE2TmkSeP1PEG+7XyhGXZ5poQ0YBU30xQBzXbEJgIRSc
         AYVUSrRoH0lHRqBS1KD9+4HMll29tD2ubKvRsa21WOgK2GbyHkKb2WYYhH52aZ6GsN3X
         ZukLXqRHCMp7o76FU8CdSbhkgajmwt3Ma5EgkQ32wnU0lTBaGHpa0XCA/x8Ou+cHLRs3
         LyfZiIJkKPOST6KCBV05nlYe8JmirbHRV8uKhZ/ss8fWxwH3KYyxX95LtWdg/nkjoWBB
         BkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QMAdSyPvdtTXN/SBmTeRs6Mr28hDgbHsVbc83bn/70I=;
        b=ohrwvE5VooH62cdYGksBYFh11muTW0+P+Nu01V/sniVZdEpxdakeGcr8w95+gGtnrN
         rBXOSAc9YUSAQ+QZjesrws9XOcgNgYKPwQEcPzyYA32ZbFeKNIFKWVTlieF8/uJdHpyn
         ahGaKdo5bD1xiyz8pPAHvNmRPc2cHO89r4f/2gc986nDV9chzZ1znIhFJ/1tGmtLMVZb
         wmahNqVLxACwfPYZqNnfC1bQ1eK87xHB3bTt34CHBY3Qo+o3RfRIj2xoNK2/26eUI2CO
         JFCjcyZVciM2DlNQECNcaBoLYfxBss+0EUWQu2HthhOMvA/9tZA6h7om981NGyuDr+WP
         d1Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b+Zrrf+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si371749ywr.549.2018.02.28.11.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b+Zrrf+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7WC-0006ur-8l
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:36:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S6-0003S5-0K
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S4-0006QN-Im
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:46 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:42083)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S4-0006PW-AA
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:44 -0500
Received: by mail-pl0-x243.google.com with SMTP id 93-v6so2111770plc.9
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QMAdSyPvdtTXN/SBmTeRs6Mr28hDgbHsVbc83bn/70I=;
	b=b+Zrrf+XQMRBtYpxU5qmpwRf7Gk/+NDPyAGCRfcaTAdFiqUpsPQoXHKaVbw+MmCXDt
	Q842X3qPyF0vzoST6zZmkjZl1tbqHD7bWY83PEB6qSL7JHtWHEG1/PgJM6W95rAsvwkE
	E5j+JzCb86AcziETwl2j+2vCMqDJFG9inf4Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QMAdSyPvdtTXN/SBmTeRs6Mr28hDgbHsVbc83bn/70I=;
	b=UI4fsWWtVwQP4YI690Pvf7bSJrqDKAIyJWSVS3JX4zQo1nDL0OSKtBXZGjqEfCHNDC
	MKNpFEhgQ3K7lp48sBzxxMfgyHD1NbxVUa3mr7yBgJ79VjBka0gyyD8YuZ31NQy3ukgc
	63ZTLFse3ekhKkmOvsT6c9SPZfjDzFVQYBDlxbv9eG2nb4Gl+KfBFpMq8dAtSx6kJDRO
	a0W7Dw/pn56whwqYnplIC14YoE2shs+Z7X5EmSA0XXO97yyi9J2NqRqLUfJIbNFg3ju/
	J+AuZiW8JyzEk1HOY82/LpG1CeByxEzJngZr8S7av3xJ2MHWS2OU0HoPN8PsEVmufq83
	XAOg==
X-Gm-Message-State: APf1xPDBowCvT1Ceyl0txz5/AhDpZmfli0TfzpxxRi2YsNivG/tgGVOH
	noxJeySJ4xAdDyMGXwSjpQBZHbNqBOI=
X-Received: by 2002:a17:902:365:: with SMTP id
	92-v6mr19264895pld.127.1519846303349; 
	Wed, 28 Feb 2018 11:31:43 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:20 -0800
Message-Id: <20180228193125.20577-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v3 11/16] target/arm: Decode aa64 armv8.3 fcadd
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
X-TUID: Qy4ygh2eO+DU

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  7 ++++
 target/arm/translate-a64.c | 48 ++++++++++++++++++++++-
 target/arm/vec_helper.c    | 97 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 7f0d3b2d84..1e2d7025de 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -578,6 +578,13 @@ DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e4d2d548ba..efed4fd9d2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -713,6 +713,21 @@ static void gen_gvec_op3_env(DisasContext *s, bool is_q, int rd,
                        is_q ? 16 : 8, vec_full_reg_size(s), 0, fn);
 }
 
+/* Expand a 3-operand + fpstatus pointer + simd data value operation using
+ * an out-of-line helper.
+ */
+static void gen_gvec_op3_fpst(DisasContext *s, bool is_q, int rd, int rn,
+                              int rm, bool is_fp16, int data,
+                              gen_helper_gvec_3_ptr *fn)
+{
+    TCGv_ptr fpst = get_fpstatus_ptr(is_fp16);
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm), fpst,
+                       is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
+    tcg_temp_free_ptr(fpst);
+}
+
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
  * than the 32 bit equivalent.
  */
@@ -10816,7 +10831,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     int size = extract32(insn, 22, 2);
     bool u = extract32(insn, 29, 1);
     bool is_q = extract32(insn, 30, 1);
-    int feature;
+    int feature, rot;
 
     switch (u * 16 + opcode) {
     case 0x10: /* SQRDMLAH (vector) */
@@ -10827,6 +10842,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = ARM_FEATURE_V8_RDM;
         break;
+    case 0xc: /* FCADD, #90 */
+    case 0xe: /* FCADD, #270 */
+        if (size == 0
+            || (size == 1 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))
+            || (size == 3 && !is_q)) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = ARM_FEATURE_V8_FCMA;
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -10866,6 +10891,27 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0xc: /* FCADD, #90 */
+    case 0xe: /* FCADD, #270 */
+        rot = extract32(opcode, 1, 1);
+        switch (size) {
+        case 1:
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, size == 1, rot,
+                              gen_helper_gvec_fcaddh);
+            break;
+        case 2:
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, size == 1, rot,
+                              gen_helper_gvec_fcadds);
+            break;
+        case 3:
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, size == 1, rot,
+                              gen_helper_gvec_fcaddd);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return;
+
     default:
         g_assert_not_reached();
     }
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 3072df4d77..a868ca6aac 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -22,8 +22,21 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
+#include "fpu/softfloat.h"
 
 
+/* Note that vector data is stored in host-endian 64-bit chunks,
+   so addressing units smaller than that needs a host-endian fixup.  */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)  ((x) ^ 7)
+#define H2(x)  ((x) ^ 3)
+#define H4(x)  ((x) ^ 1)
+#else
+#define H1(x)  (x)
+#define H2(x)  (x)
+#define H4(x)  (x)
+#endif
+
 #define SET_QC() env->vfp.xregs[ARM_VFP_FPSCR] |= CPSR_Q
 
 static void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
@@ -181,3 +194,87 @@ void HELPER(gvec_qrdmlsh_s32)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float16 *d = vd;
+    float16 *n = vn;
+    float16 *m = vm;
+    float_status *fpst = vfpst;
+    uint32_t neg_real = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = neg_real ^ 1;
+    uintptr_t i;
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 15;
+    neg_imag <<= 15;
+
+    for (i = 0; i < opr_sz / 2; i += 2) {
+        float16 e0 = n[H2(i)];
+        float16 e1 = m[H2(i + 1)] ^ neg_imag;
+        float16 e2 = n[H2(i + 1)];
+        float16 e3 = m[H2(i)] ^ neg_real;
+
+        d[H2(i)] = float16_add(e0, e1, fpst);
+        d[H2(i + 1)] = float16_add(e2, e3, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcadds)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float32 *d = vd;
+    float32 *n = vn;
+    float32 *m = vm;
+    float_status *fpst = vfpst;
+    uint32_t neg_real = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = neg_real ^ 1;
+    uintptr_t i;
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 31;
+    neg_imag <<= 31;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e0 = n[H4(i)];
+        float32 e1 = m[H4(i + 1)] ^ neg_imag;
+        float32 e2 = n[H4(i + 1)];
+        float32 e3 = m[H4(i)] ^ neg_real;
+
+        d[H4(i)] = float32_add(e0, e1, fpst);
+        d[H4(i + 1)] = float32_add(e2, e3, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float64 *d = vd;
+    float64 *n = vn;
+    float64 *m = vm;
+    float_status *fpst = vfpst;
+    uint64_t neg_real = extract64(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t neg_imag = neg_real ^ 1;
+    uintptr_t i;
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 63;
+    neg_imag <<= 63;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        float64 e0 = n[i];
+        float64 e1 = m[i + 1] ^ neg_imag;
+        float64 e2 = n[i + 1];
+        float64 e3 = m[i] ^ neg_real;
+
+        d[i] = float64_add(e0, e1, fpst);
+        d[i + 1] = float64_add(e2, e3, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.14.3

