Received: by 10.223.159.74 with SMTP id f10csp2923531wrg;
        Mon, 18 Dec 2017 09:39:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBouAU2jDb8s5t3ca6dPs2AuRJQ9vXuTcSkE1xJZ0H4M3omdrtjpSDaXZSaioR/pJlefO8qUh
X-Received: by 10.129.155.215 with SMTP id s206mr429584ywg.278.1513618763020;
        Mon, 18 Dec 2017 09:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513618763; cv=none;
        d=google.com; s=arc-20160816;
        b=HN1Mf14ctl8H/AenVQPAwORUhEKTGyuYdifuqWCnxpXMXHIopCZXZJ7atGVemNWYcZ
         wup51mV5bf7O/YAiVEAQTHuJTbOin8lFEpW0vIWBsrL+zv8jl2pO3eV3UZ/LBwu6DbNi
         zIs1mlhCTbk+eJkLD/wF6MA7OhBJVWbTXxQSzGls+aAsvFbA78jGrkFzfNSQ2ba+qKYE
         rloU+iFt1CS0qDjnJXf9qnvHJt0A1rg3dMhN4EgQPR8pomoXQG1R9SXej87PSZIhkswd
         aUJBDexR18FKwsXUKQHcWFYPEs0Y31CIk8WRzmdXvdhl2ruaO9h4Zk9EHsdwfBPngl1O
         4K/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yRhD+2FT4dyrCf8U7ufjIArnPplGeg6rcTSTFejkLUk=;
        b=rN73Wl33Wpzygagp8+8MPV1vWyvZdXHk5y05Zf9PJo51k7Pbx5dAs3vpS3WB5pDRj0
         BLFsKDL2JmOWrtXVsZE41PGLnToQWpseUT/Zhe7lWuqv1cXMTeV/1cedJ+TlZUWjVvTg
         LpFlhq/xVWYouskPQ7CFYdwcoU2ObRzjNhDPM2EQnjjiNb+xMjc3K2d4k+udYe3wRP6q
         iW2q3fD/p5NAQWjrdoEMByM2IE/cJtc4S8JHmJU/bp/cLpIog/cyE9y1obnnRnJovlqD
         8HCYYX5jLbjo3B2rp3zKunUvCWZ2Gs+YkvX0FZ5RaBxyuVGFEtLCywJxI7d3rRadAZ7H
         qWmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XB+jGa6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l128si126999ybc.277.2017.12.18.09.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XB+jGa6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzNq-0001Lg-AI
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:39:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9W-0005sO-K8
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9V-00085V-5e
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:34 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:35131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9U-00084A-T3
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:33 -0500
Received: by mail-pg0-x244.google.com with SMTP id q20so9420322pgv.2
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yRhD+2FT4dyrCf8U7ufjIArnPplGeg6rcTSTFejkLUk=;
	b=XB+jGa6V8piyG4I8fH3Q57jEpqYF8pHqshsyDbbQlkRG5jETp5JsJrPx3MfxrDZUzK
	OndKdVwzK61oAwMQvXywYVvAo98KSgchzKyXub6vtAv7XVRKTygmD4tFak1OMBgn30S1
	zzfcS9Q/jVJfMRNpzwpCbjSSyI5gQYI87AOaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yRhD+2FT4dyrCf8U7ufjIArnPplGeg6rcTSTFejkLUk=;
	b=lXJrkVfZc12LleaeFJ3DFR9VNK4TlOuhIbsFIgz4ViH+mo1ecpUggFpDPG94CM1Eqv
	riI6k8sgbkSJ03s/2I2110MvAVGMvZqUX6JoU/RpHj53CvxZM7g5oTV9M5JhIyUXJ4UY
	z3avmps7o/9CAUAothccm8eem99UjmTLxk3CqekUDmjLm1D221MJC/O8n3S+9VF3ilgu
	3815f0AEUwu6nADhwUAM49dqRP+th0M+CeeSBGllWC6bDI3jHCo/x0090ZnNV4K8BYVp
	qSvPUj1/8FoEhTACrHoOvKdEM4Im2iJka8R0FwqkWS4814Hyo6I88RHwvKgurmzAmff7
	pOUA==
X-Gm-Message-State: AKGB3mIoNJ5ekJTpLAnPtHhim+q6dXf+9bIuL1oGNm5vojlzWnXQh7xv
	4AOhG/mpDnX0duhjaLkJE8S0Zg==
X-Received: by 10.98.185.8 with SMTP id z8mr427201pfe.166.1513617871936;
	Mon, 18 Dec 2017 09:24:31 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:17 -0800
Message-Id: <20171218172425.18200-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 03/11] target/arm: Decode aa64 armv8.1 three
 same extra
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
X-TUID: qiuyqNXa1ftL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         |  9 +++++
 target/arm/advsimd_helper.c | 74 ++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c  | 83 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index d103f3d8bf..06ca458614 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -558,6 +558,15 @@ DEF_HELPER_2(dc_zva, void, env, i64)
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
index b91d181741..d5185165a5 100644
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
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 static uint16_t inl_qrdmlah_s16(CPUARMState *env, int16_t src1,
                                 int16_t src2, int16_t src3)
@@ -52,6 +62,22 @@ uint32_t HELPER(neon_qrdmlah_s16)(CPUARMState *env, uint32_t src1,
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
 /* Signed saturating rounding doubling multiply-subtract high half, 16-bit */
 static uint16_t inl_qrdmlsh_s16(CPUARMState *env, int16_t src1,
                                 int16_t src2, int16_t src3)
@@ -78,6 +104,22 @@ uint32_t HELPER(neon_qrdmlsh_s16)(CPUARMState *env, uint32_t src1,
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
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
                                   int32_t src2, int32_t src3)
@@ -93,6 +135,22 @@ uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
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
 /* Signed saturating rounding doubling multiply-subtract high half, 32-bit */
 uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
                                   int32_t src2, int32_t src3)
@@ -107,3 +165,19 @@ uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
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
index 0b090fe086..3836e94135 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10678,7 +10678,89 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         /* non-quad vector op */
         clear_vec_high(s, rd);
     }
+}
+
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
 
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
@@ -12421,6 +12503,7 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
 static const AArch64DecodeTable data_proc_simd[] = {
     /* pattern  ,  mask     ,  fn                        */
     { 0x0e200400, 0x9f200400, disas_simd_three_reg_same },
+    { 0x0e008400, 0x9f208400, disas_simd_three_reg_same_extra },
     { 0x0e200000, 0x9f200c00, disas_simd_three_reg_diff },
     { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
     { 0x0e300800, 0x9f3e0c00, disas_simd_across_lanes },
-- 
2.14.3

