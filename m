Received: by 10.28.91.67 with SMTP id p64csp991887wmb;
        Wed, 28 Feb 2018 11:40:56 -0800 (PST)
X-Google-Smtp-Source: AG47ELupizutOSwvp6VNckB8Pj8Y+AdTrnx1EhJUMcodUSRH9qEDfWa2Iw5umV1Y/fZ82+/YNf7w
X-Received: by 2002:a25:9781:: with SMTP id i1-v6mr8313762ybo.481.1519846856277;
        Wed, 28 Feb 2018 11:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846856; cv=none;
        d=google.com; s=arc-20160816;
        b=DOAoJZKy9cCjy8l29DI9DDzxFZ/sZD6Ak38GbdCnyampgedIPLPXNffEVhAKuyf3db
         +iHragDud30El/uhI8m89KH0CMEWzYgIq56orLMuebHWjWtcT9XdtqXVn7tzhTqhuak7
         y3rkGyHvlCFTdngQOnwmubR8cnVKjHT8KvLvRQyv/zN99tKPrKRurmkHxMLinMt/SDjX
         RHnm9+Sk5I9DLZORuQ6HZ7qgdoxatotZ/uR03utaZqp7A+ubDWBT5PkGwSqcuwJykJrh
         fkWHYu2XSuSM+qLeLEWTnycMA9TI9XfqLuCzuwQ6h0wf4ldv5EaJZ0y+bCG7sNpDA3uJ
         x+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aSpF96u2CSfUUihzafVfUMnqhjpwzDmtcHyLE2hc3Q0=;
        b=yMseJzKZkHcl9hRkSF2yjTjd2dMZERnLUOPA2XgvxMRbRgWxNqIDog3Xh7OxhLQCDp
         XqxI3Ualvgf1DuGmKFn6Uln+Z5PVSQmtJk+/xovGKlA5mRlAkMS2zNiuIbaF4/vc07pP
         kReCn4pAq/lCxKg3h6hALddUApQ2/5L5EiQ5yBpk1IxK4CjIyV6TMz9wbRdOooHuOCPp
         unyk0UeBmbQr/AUzcBhkfbWhrBsrFq1ZNE0LJHGfLiU4xaZ5SvxQ90+Bl8nNyqIYWG4R
         i3ZTNaEbsXfE5zft+iZCcpVZ3yf1f7rnnqDPaam5jAdzITHf02i6PPbEUlR3/fTZ2hEv
         S04Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SkGudz4G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k63si67598ywb.181.2018.02.28.11.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:40:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SkGudz4G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7ax-0002ej-NX
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:40:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S8-0003V7-B4
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S6-0006S5-Lz
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:48 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:46445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S6-0006RO-Eh
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:46 -0500
Received: by mail-pg0-x243.google.com with SMTP id r26so1321600pgv.13
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aSpF96u2CSfUUihzafVfUMnqhjpwzDmtcHyLE2hc3Q0=;
	b=SkGudz4Gf1o9lr6u0OwbdmhS28TNpIkQVRJjWTK4avlb4M/gEvlau10HFpgzzmzwx/
	W0iH3mFUnIEsU/SS0cT1Kf9MEWL6/o6p6+d4KwgPPsn3BGRibH+RHITs4Z2PXFBWMzPA
	ltCksd2Tlc1KLgNsPANfL/yX2yMcSUJsySz/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aSpF96u2CSfUUihzafVfUMnqhjpwzDmtcHyLE2hc3Q0=;
	b=m0Y9Gr7n28RneBcILaS5yOg2dXqICIvZsspWfiTpbk6HMF5UYwGXqF5VyyoKss38mk
	i+sEKCTXhQ9v2Fi9NpRUNfYjYIjn8pH3TOgyEJtTP8FDtEr3Gm7y68Lg0vXoCzEyQs7e
	B8NnyQdkK1UojXlC0fJtiH37p4YEtvcYCgks8xWNKjD7L6S3jfIWFa758PHYGTF0pCjn
	khf8ZitlJ/zgSseVu0fepkctxIykFo2FA2VDVHG10ih0qLoW6ezcS7qLiNfpTdbx2d5k
	pYlnyi9lYMml1qYDNeqywydsHpCwg7TurzQmz7qMXrmNVCsL1Ycau9YKDyj9RkvaZR+6
	9AlA==
X-Gm-Message-State: APf1xPD98Ohj9beVGBsqg5xyyprfA9wNMRhVHoa5sQ1YZOINfyHYtuLe
	zIxUkChJxRheCh2hM3suu3uola9aZKg=
X-Received: by 10.167.131.199 with SMTP id j7mr18458918pfn.99.1519846305018;
	Wed, 28 Feb 2018 11:31:45 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:21 -0800
Message-Id: <20180228193125.20577-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v3 12/16] target/arm: Decode aa64 armv8.3 fcmla
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
X-TUID: rzBerouWdvuM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  11 ++++
 target/arm/translate-a64.c |  94 +++++++++++++++++++++++++---
 target/arm/vec_helper.c    | 149 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 246 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1e2d7025de..0d2094f2be 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -585,6 +585,17 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fcmlah, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlah_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlas, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index efed4fd9d2..31ff0479e6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10842,6 +10842,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = ARM_FEATURE_V8_RDM;
         break;
+    case 0x8: /* FCMLA, #0 */
+    case 0x9: /* FCMLA, #90 */
+    case 0xa: /* FCMLA, #180 */
+    case 0xb: /* FCMLA, #270 */
     case 0xc: /* FCADD, #90 */
     case 0xe: /* FCADD, #270 */
         if (size == 0
@@ -10891,6 +10895,29 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0x8: /* FCMLA, #0 */
+    case 0x9: /* FCMLA, #90 */
+    case 0xa: /* FCMLA, #180 */
+    case 0xb: /* FCMLA, #270 */
+        rot = extract32(opcode, 0, 2);
+        switch (size) {
+        case 1:
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, true, rot,
+                              gen_helper_gvec_fcmlah);
+            break;
+        case 2:
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
+                              gen_helper_gvec_fcmlas);
+            break;
+        case 3:
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
+                              gen_helper_gvec_fcmlad);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return;
+
     case 0xc: /* FCADD, #90 */
     case 0xe: /* FCADD, #270 */
         rot = extract32(opcode, 1, 1);
@@ -11993,7 +12020,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     bool is_long = false;
-    bool is_fp = false;
+    int is_fp = 0;
     bool is_fp16 = false;
     int index;
     TCGv_ptr fpst;
@@ -12031,7 +12058,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x05: /* FMLS */
     case 0x09: /* FMUL */
     case 0x19: /* FMULX */
-        is_fp = true;
+        is_fp = 1;
         break;
     case 0x1d: /* SQRDMLAH */
     case 0x1f: /* SQRDMLSH */
@@ -12040,20 +12067,28 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
+            unallocated_encoding(s);
+            return;
+        }
+        is_fp = 2;
+        break;
     default:
         unallocated_encoding(s);
         return;
     }
 
-    if (is_fp) {
+    switch (is_fp) {
+    case 1: /* normal fp */
         /* convert insn encoded size to TCGMemOp size */
         switch (size) {
         case 0: /* half-precision */
-            if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
-                unallocated_encoding(s);
-                return;
-            }
             size = MO_16;
+            is_fp16 = true;
             break;
         case MO_32: /* single precision */
         case MO_64: /* double precision */
@@ -12062,13 +12097,39 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-    } else {
+        break;
+
+    case 2: /* complex fp */
+        /* Each indexable element is a complex pair.  */
+        size <<= 1;
+        switch (size) {
+        case MO_32:
+            if (h && !is_q) {
+                unallocated_encoding(s);
+                return;
+            }
+            is_fp16 = true;
+            break;
+        case MO_64:
+            break;
+        default:
+            unallocated_encoding(s);
+            return;
+        }
+        break;
+
+    default: /* integer */
         switch (size) {
         case MO_8:
         case MO_64:
             unallocated_encoding(s);
             return;
         }
+        break;
+    }
+    if (is_fp16 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+        unallocated_encoding(s);
+        return;
     }
 
     /* Given TCGMemOp size, adjust register and indexing.  */
@@ -12102,6 +12163,23 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         fpst = NULL;
     }
 
+    switch (16 * u + opcode) {
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_reg_offset(s, rm, index, size), fpst,
+                           is_q ? 16 : 8, vec_full_reg_size(s),
+                           extract32(insn, 13, 2), /* rot */
+                           size == MO_64
+                           ? gen_helper_gvec_fcmlas_idx
+                           : gen_helper_gvec_fcmlah_idx);
+        tcg_temp_free_ptr(fpst);
+        return;
+    }
+
     if (size == 3) {
         TCGv_i64 tcg_idx = tcg_temp_new_i64();
         int pass;
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index a868ca6aac..d81eb7730d 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -278,3 +278,152 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float16 *d = vd;
+    float16 *n = vn;
+    float16 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 15;
+    neg_imag <<= 15;
+
+    for (i = 0; i < opr_sz / 2; i += 2) {
+        float16 e1 = n[H2(i + flip)];
+        float16 e2 = m[H2(i + flip)] ^ neg_real;
+        float16 e3 = e1;
+        float16 e4 = m[H2(i + 1 - flip)] ^ neg_imag;
+
+        d[H2(i)] = float16_muladd(e1, e2, d[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e3, e4, d[H2(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
+                             void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float16 *d = vd;
+    float16 *n = vn;
+    float16 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+    float16 e2 = m[H2(flip)];
+    float16 e4 = m[H2(1 - flip)];
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 15;
+    neg_imag <<= 15;
+    e2 ^= neg_real;
+    e4 ^= neg_imag;
+
+    for (i = 0; i < opr_sz / 2; i += 2) {
+        float16 e1 = n[H2(i + flip)];
+        float16 e3 = e1;
+
+        d[H2(i)] = float16_muladd(e1, e2, d[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e3, e4, d[H2(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float32 *d = vd;
+    float32 *n = vn;
+    float32 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 31;
+    neg_imag <<= 31;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e1 = n[H4(i + flip)];
+        float32 e2 = m[H4(i + flip)] ^ neg_real;
+        float32 e3 = e1;
+        float32 e4 = m[H4(i + 1 - flip)] ^ neg_imag;
+
+        d[H4(i)] = float32_muladd(e1, e2, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e3, e4, d[H4(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
+                             void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float32 *d = vd;
+    float32 *n = vn;
+    float32 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+    float32 e2 = m[H4(flip)];
+    float32 e4 = m[H4(1 - flip)];
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 31;
+    neg_imag <<= 31;
+    e2 ^= neg_real;
+    e4 ^= neg_imag;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e1 = n[H4(i + flip)];
+        float32 e3 = e1;
+
+        d[H4(i)] = float32_muladd(e1, e2, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e3, e4, d[H4(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float64 *d = vd;
+    float64 *n = vn;
+    float64 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint64_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+
+    /* Shift boolean to the sign bit so we can xor to negate.  */
+    neg_real <<= 63;
+    neg_imag <<= 63;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        float64 e1 = n[i + flip];
+        float64 e2 = m[i + flip] ^ neg_real;
+        float64 e3 = e1;
+        float64 e4 = m[i + 1 - flip] ^ neg_imag;
+
+        d[i] = float64_muladd(e1, e2, d[i], 0, fpst);
+        d[i + 1] = float64_muladd(e3, e4, d[i + 1], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.14.3

