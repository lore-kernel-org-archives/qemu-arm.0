Received: by 10.223.159.74 with SMTP id f10csp2963860wrg;
        Mon, 18 Dec 2017 10:14:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBovNrw9DxO8PzeKwwJ0tw/rkne2o2W6UnRzrNIO9QKTLaAtxYpR1hDrH+qY56bfRzrAN+bVn
X-Received: by 10.129.153.87 with SMTP id q84mr520894ywg.350.1513620868737;
        Mon, 18 Dec 2017 10:14:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620868; cv=none;
        d=google.com; s=arc-20160816;
        b=IlxAWO7d3zQXtzaRtlYjPvQYPFuMEK7lcifswxfpV4puglTDRckAtSCu9R5aRYEfdO
         O7fHbWQhKRvUENjV6/jowbd1vKAH9mYNkdNNm7sv647yxlD54xyOHG859i6SILKlmHoR
         eaVMGLHi7Qu/NxhnFBd1nkFI+e90XEU3zyfvGGPnWhifcuvfapig+PGlKTrjGMDZx/2I
         2paMZrZzBl7VykX0Ugep7mq0fAcJB39IzSd1yAKgoVc3qdaX4pivTddgw8W8w3nDJm7J
         sWPuOVIZ5sAcySXriIpEKxWb8nT+8Owa68yoaGH0nun8Isw2dNTaM3ROW63u27PlODEb
         RhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=79qaL/sSWdRs8yI9GhQnKs5bk8BLHvgB2DUy18WjB6U=;
        b=aMyKXqfB8VsJDn+J/6FfwQsIjFzjb86AoTFIz6O8ZfRm27sSn0CZD1HCcHKyaHIExz
         C1ro+Uk46RV2vcBXoEjgZ9u3FfWlFySr3zErZfdLGy6Bq3lJCyn6jag1TAWj0lcgSq/y
         R4XBJhY/W7M4Gl90MWjvkJzQNq9vy088liuz6R2zoXi6AaHMjyDjjjlP7GpA/BMSYVy+
         sI11U8ss+wjqAYBLNOFie2ymegiQ4Aj2/HDlaid3hV2Hq0e8QgtV/R6xRh1EDJn5Tdah
         f28Sf6PAFxMZG+H1VfMG0jDQxPoMVrNkzapBsANU8qQKKAfvwwwAlrHS+OzHgUf+VR6j
         xVWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kSvDTtrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a125si2489982ywf.31.2017.12.18.10.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kSvDTtrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzvo-0001JN-2n
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:14:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUd-0008O3-Ek
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUc-0002D4-5d
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:23 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:43368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUb-0002CL-Tu
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:22 -0500
Received: by mail-pg0-x243.google.com with SMTP id b18so9423230pgv.10
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=79qaL/sSWdRs8yI9GhQnKs5bk8BLHvgB2DUy18WjB6U=;
	b=kSvDTtrFI+o8qyQfGxKP/S1D7BPPXJBSaLLHY0BOZO1klfgH41L804x2HIyRvKFoJF
	CONuczPevtr9DIHUZRv4KuuvqwBL7tVGJvUmriQwyIRJn81ZPkXNBi7jeJ1pW/u9klIX
	3KopfZDKy1c/FwvUHKw3fpG3KDKP55MKtZskg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=79qaL/sSWdRs8yI9GhQnKs5bk8BLHvgB2DUy18WjB6U=;
	b=EROdEaGxqfzYc5QAPPQCP39kryvQHfaQNPuQ8lo38fsrEwCvaOXYdfMJ7QWWbbpHXb
	FV+3fi8PFqqJ7j5qfXdEzxA36aKv2/DlWs1nW5aYEmc1fVlNPJ7xSjp2A0JHBuzE7r9E
	tbVckxrt/4JE+kKz1QFbmL+c7NatHhmaCf9L2MyzgNlt9XwvGL/fXiP0yZ6r3tQs/BiG
	qrIobT94Qz0EAGNnSwHzyhiIfSkf2+dPwACYUvZ0XhoEHJaqYEgk7HTt7s2jfCxxuFgr
	Yu7e/+B5BFwSEHkf3zc2zP+cLOrwejBLLZdq1qn5TkkBdqhTiswSd4I3/8BZR1dubYV2
	BHxw==
X-Gm-Message-State: AKGB3mInxJIpVzKYBA1a4baE8cV6fw/1cpPfje78e8Jxn/tkuGyftnw7
	JW6Zwz9egBdgiHLQztdzYaD2Qg==
X-Received: by 10.101.66.136 with SMTP id j8mr429452pgp.78.1513619180991;
	Mon, 18 Dec 2017 09:46:20 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:46 -0800
Message-Id: <20171218174552.18871-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 17/23] target/arm: Implement SVE Index Generation
 Group
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
X-TUID: 17/LxK4TvNiD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 ++++
 target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.def         | 14 +++++++++++
 4 files changed, 121 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index abed625123..c8eae5eb62 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -357,6 +357,11 @@ DEF_HELPER_FLAGS_6(sve_mls_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_mls_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_index_b, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_4(sve_index_h, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_4(sve_index_s, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
+DEF_HELPER_FLAGS_4(sve_index_d, TCG_CALL_NO_RWG, void, ptr, i64, i64, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8235784a82..d8684b9457 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -913,6 +913,46 @@ DO_ZPZZZ_D(sve_mls_d, uint64_t, DO_MLS)
 #undef DO_ZPZZZ
 #undef DO_ZPZZZ_D
 
+void HELPER(sve_index_b)(void *vd, uint32_t start,
+                         uint32_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint8_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[H1(i)] = start + i * incr;
+    }
+}
+
+void HELPER(sve_index_h)(void *vd, uint32_t start,
+                         uint32_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    uint16_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[H2(i)] = start + i * incr;
+    }
+}
+
+void HELPER(sve_index_s)(void *vd, uint32_t start,
+                         uint32_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[H4(i)] = start + i * incr;
+    }
+}
+
+void HELPER(sve_index_d)(void *vd, uint64_t start,
+                         uint64_t incr, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = start + i * incr;
+    }
+}
+
 void HELPER(sve_ldr)(CPUARMState *env, void *d, target_ulong addr, uint32_t len)
 {
     intptr_t i, len_align = QEMU_ALIGN_DOWN(len, 8);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7edec8ba96..7e1bf7d623 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -577,6 +577,68 @@ DO_ZPZZZ(MLS, mls)
 
 #undef DO_ZPZZZ
 
+static void do_index(DisasContext *s, int esz, int rd,
+                     TCGv_i64 start, TCGv_i64 incr)
+{
+    unsigned vsz = size_for_gvec(vec_full_reg_size(s));
+    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_ptr t_zd = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
+    if (esz == 3) {
+        gen_helper_sve_index_d(t_zd, start, incr, desc);
+    } else {
+        static void (*fns[3])(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32) = {
+            gen_helper_sve_index_b,
+            gen_helper_sve_index_h,
+            gen_helper_sve_index_s,
+        };
+        TCGv_i32 s32 = tcg_temp_new_i32();
+        TCGv_i32 i32 = tcg_temp_new_i32();
+
+        tcg_gen_extrl_i64_i32(s32, start);
+        tcg_gen_extrl_i64_i32(i32, incr);
+        fns[esz](t_zd, s32, i32, desc);
+
+        tcg_temp_free_i32(s32);
+        tcg_temp_free_i32(i32);
+    }
+    tcg_temp_free_ptr(t_zd);
+    tcg_temp_free_i32(desc);
+}
+
+void trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a, uint32_t insn)
+{
+    TCGv_i64 start = tcg_const_i64(a->imm1);
+    TCGv_i64 incr = tcg_const_i64(a->imm2);
+    do_index(s, a->esz, a->rd, start, incr);
+    tcg_temp_free_i64(start);
+    tcg_temp_free_i64(incr);
+}
+
+void trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a, uint32_t insn)
+{
+    TCGv_i64 start = tcg_const_i64(a->imm);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    do_index(s, a->esz, a->rd, start, incr);
+    tcg_temp_free_i64(start);
+}
+
+void trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a, uint32_t insn)
+{
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = tcg_const_i64(a->imm);
+    do_index(s, a->esz, a->rd, start, incr);
+    tcg_temp_free_i64(incr);
+}
+
+void trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a, uint32_t insn)
+{
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    do_index(s, a->esz, a->rd, start, incr);
+}
+
 static uint64_t pred_esz_mask[4] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
     0x1111111111111111ull, 0x0101010101010101ull
diff --git a/target/arm/sve.def b/target/arm/sve.def
index a33fec4f33..0cac3a974f 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -204,6 +204,20 @@ ORR_zzz			00000100 01 1 ..... 001 100 ..... .....		@rd_rn_rm
 EOR_zzz			00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm
 BIC_zzz			00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm
 
+### SVE Index Generation Group
+
+# SVE index generation (immediate start, immediate increment)
+INDEX_ii		00000100 esz:2 1 imm2:s5 010000 imm1:s5 rd:5
+
+# SVE index generation (immediate start, register increment)
+INDEX_ir		00000100 esz:2 1 rm:5 010010 imm:s5 rd:5
+
+# SVE index generation (register start, immediate increment)
+INDEX_ri		00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
+
+# SVE index generation (register start, register increment)
+INDEX_rr		00000100 .. 1 ..... 010011 ..... .....		@rd_rn_rm_esz
+
 ### SVE Predicate Generation Group
 
 # SVE initialize predicate (PTRUE, PTRUES)
-- 
2.14.3

