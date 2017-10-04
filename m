Received: by 10.223.197.9 with SMTP id q9csp5932964wrf;
        Wed, 4 Oct 2017 11:45:46 -0700 (PDT)
X-Received: by 10.237.35.244 with SMTP id k49mr31278722qtc.44.1507142746398;
        Wed, 04 Oct 2017 11:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142746; cv=none;
        d=google.com; s=arc-20160816;
        b=nCAp044kGBJHVMmaCTaxAIq0bj7AmILf5koSO2ylTABbACYVtH57HEP0VHH/ytaAy3
         HL6hNMe7f/oGznFEfd8L7e55fUgbVoEcVwTjFpuYfcLJSBDpsORIUZdQmgdxHd91Fr01
         z7XjtICytWf/gPzkTJhGVNVNordtDz1TT0Y81d+ax2KygSocp2JKbnfd9oD+4OvB2Kd/
         exmcGA3fy+v/yCby7ZApHRcdKAjoAMP07fYlYpkjyl8wNCu4BAhR1RTYjOqIt5Avitxu
         2OhyCFdN9Ui0ctL1TjOJ8LDn7yQv510qsMxCdKRXgwKfVMC+93bvVpX69YGVKZW7Db4A
         PeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cQOUBaL8w3dJdOUvtpUs7iuCm57GpBDP9Dt+8anjwCE=;
        b=tsm0s9DA3HGHxhcPrKiz/uOWHCH0OvWirv95DepWyQuoHzih0fOE9QIe/ZMdbi2yHN
         gq070uUdNgW0qi5NlNTroeZkT4aS+YWSpm9cXs3CBaK6hoW2pGvdWDa74AmCA6kMvlqQ
         afKt2SbijFsxMMCsDiqKk48HAaXxly2oD8Uus3ibyEGkejoHFJhfZ7oK1W4cas9KVHYm
         tDhsge6dyzpLkjzcK4PzMRLz71qPSHWLebt/7szzjtrAnZFlHCYZaKOt6SnNqPpNy1BB
         Nf3G0ZivDOq1WZY+Y6nEwbc4lGrmSyBAwW4xlZwgKKUQ9zoVRLYeeDCR0N6v6LtakZWn
         v44Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IUop+dfe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l22si2020126qtk.180.2017.10.04.11.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IUop+dfe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzofx-0001AH-S0
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:45:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe1-0008JB-SX
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe0-0002pg-EC
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:45 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:48045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzoe0-0002p6-A0
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:44 -0400
Received: by mail-qt0-x22d.google.com with SMTP id z50so16036173qtj.4
	for <qemu-devel@nongnu.org>; Wed, 04 Oct 2017 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cQOUBaL8w3dJdOUvtpUs7iuCm57GpBDP9Dt+8anjwCE=;
	b=IUop+dfeSbmxIcFbsvStsgnEs1S5I4m4KPWVECEAh3/URWUKeD+BdY+CTGnovVMlm0
	P/KJBEctuB1QP8Exay+cF/tub1+gHimplUWYCo5p73uWWzIgdwB/Dhg0VAMCSETnZO17
	F5/gNHB2K2x+Uy+hrjtWs5d7kIEOpLz3t3acA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cQOUBaL8w3dJdOUvtpUs7iuCm57GpBDP9Dt+8anjwCE=;
	b=NvKtbrxiJPNz4Uusmz5mNKi0TKcAfiHubke5ykg9A+FNUi+jQmfTPyV+9Uz8V3l8UE
	i9a6Kfi4uN38N0L9qz8oK9Obyli1Ypg8XpogpkmEdGgSFgmOyndJw+G1af60alFz4vM/
	br5LFSrsRKJgww16W5ueqm1lgmYy4DQBryVq2DrBwkd4nVol7D+9yOsvjlW644zoqR68
	Y5oL/Va3AmJDIP94CoEc6UWk6hW9wosQoN40MekspApS1L3WWUSYjVbiOcinEfr8Q9va
	PBL9Y5fNae6+yojAGHF/DkzOvlp6YI34ayXd5Jbxxu9mANk0sfnHRQdLhH66o9cwEewf
	3wVA==
X-Gm-Message-State: AMCzsaVvXczQyfuIJ3CAkIi9haNNbkW6/OVInSJwVsjZ47oMIgSmMTo5
	4vGdBM8w6Cr1P5AYCo5+3LXe43PK9xw=
X-Google-Smtp-Source: AOwi7QCVBjvbIFVy6H3dNU4p6XLgIkeVcoiMvi3lbfjJcg7WzVri/8wdPfWgdcnU+txNHUy35JUdFg==
X-Received: by 10.37.163.71 with SMTP id d65mr4516952ybi.314.1507142623371;
	Wed, 04 Oct 2017 11:43:43 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:23 -0400
Message-Id: <20171004184325.24157-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: [Qemu-devel] [PATCH v1 10/12] target/arm: Decode aa64 armv8.3 fcmla
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
X-TUID: C9oIjaoDyvYd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         |   8 +++
 target/arm/advsimd_helper.c |  86 ++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c  | 119 ++++++++++++++++++++++++++++++--------------
 3 files changed, 176 insertions(+), 37 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 350e2fa0e1..de3cc43a7a 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -556,6 +556,14 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fcmlas, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
index fe2e0cbcef..acb452df1b 100644
--- a/target/arm/advsimd_helper.c
+++ b/target/arm/advsimd_helper.c
@@ -243,3 +243,89 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
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
+    neg_real <<= 31;
+    neg_imag <<= 31;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e0 = n[H4(i + flip)];
+        float32 e1 = m[H4(i + flip)] ^ neg_real;
+        float32 e2 = e0;
+        float32 e3 = m[H4(i + 1 - flip)] ^ neg_imag;
+
+        d[H4(i)] = float32_muladd(e0, e1, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e2, e3, d[H4(i + 1)], 0, fpst);
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
+    float32 e1 = m[H4(flip)];
+    float32 e3 = m[H4(1 - flip)];
+
+    neg_real <<= 31;
+    neg_imag <<= 31;
+    e1 ^= neg_real;
+    e3 ^= neg_imag;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e0 = n[H4(i + flip)];
+        float32 e2 = e0;
+
+        d[H4(i)] = float32_muladd(e0, e1, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e2, e3, d[H4(i + 1)], 0, fpst);
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
+    neg_real <<= 63;
+    neg_imag <<= 63;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        float64 e0 = n[i + flip];
+        float64 e1 = m[i + flip] ^ neg_real;
+        float64 e2 = e0;
+        float64 e3 = m[i + 1 - flip] ^ neg_imag;
+
+        d[i] = float64_muladd(e0, e1, d[i], 0, fpst);
+        d[i + 1] = float64_muladd(e2, e3, d[i + 1], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f13a945c43..b572122227 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9907,6 +9907,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = ARM_FEATURE_V8_1_SIMD;
         break;
+    case 0x8: /* FCMLA, #0 */
+    case 0x9: /* FCMLA, #90 */
+    case 0xa: /* FCMLA, #180 */
+    case 0xb: /* FCMLA, #270 */
     case 0xc: /* FCADD, #90 */
     case 0xe: /* FCADD, #270 */
         if (size != 2 && (size != 3 || !is_q)) { /* FIXME: fp16 support */
@@ -9961,6 +9965,24 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                            0, fn_gvec_ptr);
         break;
 
+    case 0x8: /* FCMLA, #0 */
+    case 0x9: /* FCMLA, #90 */
+    case 0xa: /* FCMLA, #180 */
+    case 0xb: /* FCMLA, #270 */
+        switch (size) {
+        case 2:
+            fn_gvec_ptr = gen_helper_gvec_fcmlas;
+            break;
+        case 3:
+            fn_gvec_ptr = gen_helper_gvec_fcmlad;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        data = extract32(opcode, 0, 2);
+        goto do_fpst;
+        break;
+
     case 0xc: /* FCADD, #90 */
     case 0xe: /* FCADD, #270 */
         switch (size) {
@@ -9974,6 +9996,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
             g_assert_not_reached();
         }
         data = extract32(opcode, 1, 1);
+    do_fpst:
         fpst = get_fpstatus_ptr();
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
                            vec_full_reg_offset(s, rn),
@@ -10753,76 +10776,75 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     bool is_long = false;
-    bool is_fp = false;
+    int is_fp = 0;
     int index;
     TCGv_ptr fpst;
 
-    switch (opcode) {
-    case 0x0: /* MLA */
-    case 0x4: /* MLS */
-        if (!u || is_scalar) {
+    switch (16 * u + opcode) {
+    case 0x00: /* MLA */
+    case 0x04: /* MLS */
+    case 0x08: /* MUL */
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
-        if (u) {
-            unallocated_encoding(s);
-            return;
-        }
         break;
-    case 0xd: /* SQRDMULH / SQRDMLAH */
-        if (u && !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
-            unallocated_encoding(s);
-            return;
-        }
+    case 0x0c: /* SQDMULH */
+    case 0x0d: /* SQRDMULH */
         break;
-    case 0xf: /* SQRDMLSH */
-        if (!u || !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+    case 0x1d: /* SQRDMLAH */
+    case 0x1f: /* SQRDMLSH */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
             unallocated_encoding(s);
             return;
         }
         break;
-    case 0x8: /* MUL */
-        if (u || is_scalar) {
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
+        if (size != 2 /* FIXME fp16 */
+            || (l || !is_q)
+            || !arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
             unallocated_encoding(s);
             return;
         }
+        is_fp = 2;
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
         if (!extract32(size, 1, 1)) {
             unallocated_encoding(s);
             return;
         }
-        is_fp = true;
+        is_fp = 1;
         break;
     default:
         unallocated_encoding(s);
         return;
     }
 
-    if (is_fp) {
+    switch (is_fp) {
+    case 1: /* normal fp */
         /* low bit of size indicates single/double */
         size = extract32(size, 0, 1) ? 3 : 2;
         if (size == 2) {
@@ -10835,7 +10857,15 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             index = h;
         }
         rm |= (m << 4);
-    } else {
+        break;
+
+    case 2: /* complex fp */
+        /* FIXME fp16 */
+        index = h;
+        rm |= (m << 4);
+        break;
+
+    default: /* integer */
         switch (size) {
         case 1:
             index = h << 2 | l << 1 | m;
@@ -10860,6 +10890,21 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         TCGV_UNUSED_PTR(fpst);
     }
 
+    switch (16 * u + opcode) {
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_reg_offset(s, rm, index, MO_64), fpst,
+                           is_q ? 16 : 8, vec_full_reg_size(s),
+                           extract32(insn, 13, 2), /* rot */
+                           gen_helper_gvec_fcmlas_idx);
+        tcg_temp_free_ptr(fpst);
+        return;
+    }
+
     if (size == 3) {
         TCGv_i64 tcg_idx = tcg_temp_new_i64();
         int pass;
-- 
2.13.6

