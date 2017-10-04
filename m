Received: by 10.223.197.9 with SMTP id q9csp5933277wrf;
        Wed, 4 Oct 2017 11:46:12 -0700 (PDT)
X-Received: by 10.237.34.118 with SMTP id o51mr28711125qtc.36.1507142772567;
        Wed, 04 Oct 2017 11:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142772; cv=none;
        d=google.com; s=arc-20160816;
        b=InUAzJkcWQPB/PQlGu3hOoHHAbhM+sVFToqI1BniXEOYgoNj502Omh80CNuG2li4Kq
         SrlhvupDs3b0uxHFCqDBmfYBoHqt6Ns5Yh2PyJ9iI2AigKgTGtSSAMQkvL2iP5lIPcPw
         2UU937PAJ4QYt4dwqFZy/cTP/TfkDjcegn9kKT1wlM3JhCl6HBqaWJ7nnoO8FdQ5nwdG
         /qH/HthfFxvHASRztUzufhmgyh1LwySPLQUCQaKlyHau9YaPKuOps+kBYpvTqfV+nab9
         9tcVbpYD2OUVEIQFm0UPcae1s9RFTvlwMHT5kROpZ6QquuTEJypQgwRmaP04RpCqIwDo
         Xtrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rTBIj+/bd3YyDdUia6Hc1AMTsTs2q/KGDT6531norRo=;
        b=ZDpmCBRb+mnlnKtnTqvjP8JVmKof1LtJTO8c1X0k5pr09MOEm+EipfbmfsL0gZIhZg
         tI+4TuzSGzO7PJTIfdCgIy2HcU/4AqfIU6hcXqrxcc0y2E5tzpCV/RpLJJP15st8Fhh8
         ZScvKZ6JaamDkOxYAiXkwcf5GbhSIptLQ4AdDImAkvsPlkzH/EaHoiuf3JJZ/r5Nn9WF
         n+NerkJuhJFbv2ZYHw3M1j/ELIh1cwJLYZG4rFmGYFVGPaSop/SpQ60OwCoR6j6UAi7H
         sQWjz0A5KcQThtosW3UY4gDHtcWPOidSXRH9MFEgvfRg5p/Qi4g1H/phF4ilFiHj3S2t
         n1NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4Imgzh+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l4si224997qta.168.2017.10.04.11.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4Imgzh+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzogO-0001ci-11
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodt-0008Cm-LY
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzods-0002fN-D4
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:37 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:43757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzods-0002ew-8K
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:36 -0400
Received: by mail-qt0-x230.google.com with SMTP id a43so15131148qta.0
	for <qemu-devel@nongnu.org>; Wed, 04 Oct 2017 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rTBIj+/bd3YyDdUia6Hc1AMTsTs2q/KGDT6531norRo=;
	b=j4Imgzh+q2BZHLjkGTZUbgS3uyA6ZRnjoSjkVrRZMNe7vXf23mQMNV5YCShQObAZZe
	UKFqVgcbhPU26PqSMXISfqCmwwS8a+imvOWorpV7xnrPhHM8is82qH+MpWhOadjCKvUj
	P8OZ3KQ4bve1QW39JG/cWMwauai8EnbQGyxGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rTBIj+/bd3YyDdUia6Hc1AMTsTs2q/KGDT6531norRo=;
	b=r8cxzMqA36jJcyXzwmLVwwmzVf7LA/GFxLl80RC09ubfRTVidqJouR2G8bL7fTnKd4
	wEAFYxDaIQS0M/ZGBlCyuCd52eqr/JJc1AOzMpHin8StBfxCI/73L83FAfnTSr/G9s2X
	cmpQVPAcOJUhenam//1mzhfxjlxrKQV9BmnrqShZVT3VHPhjfQVP6HZqj7oKAkPsssDx
	N69UAQcvIx6NZMgV4lxk3J954Oy5zwefQwQngb0sV8cQhCLRfjbfwQ6bNlV8Fql4cY0q
	bCEOTee7fdKhCKJK5RT17eyaX00q0vl+qlOX/6QaC7RW4unzA29thCLYvIW6SlFuJ3wf
	z2bA==
X-Gm-Message-State: AMCzsaUiXEDe5T3IvSXKOqmOGc8mNJE4fpdZ+SXASPapBL6NCVeW3Zta
	Me9vsY9yNbwcqZKR0rvrz57tTa/SaXo=
X-Google-Smtp-Source: AOwi7QD73TdJY593IDtoqrjFzdPOUwU593UJ7RVz9hG0yrHYmFCQSYNjqnacNfuOolcpjNurl/PRJQ==
X-Received: by 10.37.170.84 with SMTP id s78mr4665372ybi.348.1507142615323;
	Wed, 04 Oct 2017 11:43:35 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:17 -0400
Message-Id: <20171004184325.24157-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-devel] [PATCH v1 04/12] target/arm: Decode aa64 armv8.1 three
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
X-TUID: 0KEB6UsoMqCg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         |  9 +++++
 target/arm/advsimd_helper.c | 74 +++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c  | 84 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index ec098d8337..67583b3c2e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -542,6 +542,15 @@ DEF_HELPER_2(dc_zva, void, env, i64)
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
diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
index 583c2b0dce..b0f4b02a12 100644
--- a/target/arm/advsimd_helper.c
+++ b/target/arm/advsimd_helper.c
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
 static uint16_t inl_qrdmlah_s16(CPUARMState *env, int16_t src1,
                                 int16_t src2, int16_t src3)
 {
@@ -51,6 +61,22 @@ uint32_t HELPER(neon_qrdmlah_s16)(CPUARMState *env, uint32_t src1,
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
 static uint16_t inl_qrdmlsh_s16(CPUARMState *env, int16_t src1,
                                 int16_t src2, int16_t src3)
 {
@@ -76,6 +102,22 @@ uint32_t HELPER(neon_qrdmlsh_s16)(CPUARMState *env, uint32_t src1,
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
 uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
                                   int32_t src2, int32_t src3)
 {
@@ -90,6 +132,22 @@ uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
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
 uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
                                   int32_t src2, int32_t src3)
 {
@@ -103,3 +161,19 @@ uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
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
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 182853e3bb..0ea47a9dff 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9874,6 +9874,89 @@ static void disas_simd_three_reg_same(DisasContext *s, uint32_t insn)
     }
 }
 
+/* AdvSIMD three same extra
+ *  31   30  29 28       24 23  22  21 20  16  15 14    11  10 9  5 4  0
+ * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
+ * | 0 | Q | U | 0 1 1 1 0 | size | 0 |  Rm  | 1 | opcode | 1 | Rn | Rd |
+ * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
+ */
+static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
+{
+    void (*fn_gvec_ptr)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+    int rd = extract32(insn, 0, 5);
+    int rn = extract32(insn, 5, 5);
+    int opcode = extract32(insn, 11, 4);
+    int rm = extract32(insn, 16, 5);
+    int size = extract32(insn, 22, 2);
+    bool u = extract32(insn, 29, 1);
+    bool is_q = extract32(insn, 30, 1);
+    int feature;
+
+    if (!u) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (opcode) {
+    case 0x0: /* SQRDMLAH (vector) */
+    case 0x1: /* SQRDMLSH (vector) */
+        if (size != 1 && size != 2) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = ARM_FEATURE_V8_1_SIMD;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
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
+            fn_gvec_ptr = gen_helper_gvec_qrdmlah_s16;
+            break;
+        case 2:
+            fn_gvec_ptr = gen_helper_gvec_qrdmlah_s32;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        goto do_env;
+
+    case 0x1: /* SQRDMLSH (vector) */
+        switch (size) {
+        case 1:
+            fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s16;
+            break;
+        case 2:
+            fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s32;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    do_env:
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm), cpu_env,
+                           is_q ? 16 : 8, vec_full_reg_size(s),
+                           0, fn_gvec_ptr);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
                                   int size, int rn, int rd)
 {
@@ -11261,6 +11344,7 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
 static const AArch64DecodeTable data_proc_simd[] = {
     /* pattern  ,  mask     ,  fn                        */
     { 0x0e200400, 0x9f200400, disas_simd_three_reg_same },
+    { 0x0e008400, 0x9f208400, disas_simd_three_reg_same_extra },
     { 0x0e200000, 0x9f200c00, disas_simd_three_reg_diff },
     { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
     { 0x0e300800, 0x9f3e0c00, disas_simd_across_lanes },
-- 
2.13.6

