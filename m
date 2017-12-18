Received: by 10.223.159.74 with SMTP id f10csp2993683wrg;
        Mon, 18 Dec 2017 10:47:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBosqcT3GuFIXBlUn/DKCtL9WC0jkLIyXzfgccdKEnNZfB/l7tcQ/hqr2wVRSxAsOj0MbWFnB
X-Received: by 10.37.129.143 with SMTP id p15mr606175ybk.428.1513622820879;
        Mon, 18 Dec 2017 10:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513622820; cv=none;
        d=google.com; s=arc-20160816;
        b=aYd6jiYfrrpczySZQ5G9K6sLOxO4mxVytQxOoluTuU0ZKnQz/ZI8leNTInn6TOhvu+
         HGUBuSezVGFV8Ay7ZtI2B5n5GGYSel3O7Ag7FUTeoennGPJBKw1EBz4oKxBl/UvApVrC
         aaKqzG+ptUtmhYiMJnr9KLKKcf8lE3Q+REnK/f6CSPS2CB/m2udfoShGxkpnknvv4Vr6
         igAnRBFQabYsDcHuLEw+E5fNLPxdpLfZqTKaAj7rKBvSRWF9rQEUUi6dplKphcBwOhJz
         ksChJJoVKyaRs2WmmjWpf9KHtmVvc02RcN150F1ewZsE/Tx6SYj6xGa7gV8cBPTBVG+A
         +VBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ac6B4fIbk1rKjOWjF4fPb2HPxUZ3ZPd87nYhLxcCz84=;
        b=mEqzP6Jnxx+6Px3NvqcaURaoNQeRT5zzqaiFq3NPUshwRA00cSJ5U5OIsVGBfE8OmP
         fo1EnmsBghlDmKNSSYheVJ4mGEfjy8CNXF9vj88W6C/YoNpMYi8nmNBZTA9orVB3tDyE
         Uzv/pmZWRmnAUp7F0DpbEm0ti8xFOJss3BDQn7U0vWqicZec5mqjxtbWQs+Jsp4QU+wM
         A2thSCIptWOgKnRQYJWJG1WXITV0WSmWLawxWowo5PdtLF3m0TL3WXtaqpaikac/eSDF
         6FIhqwWAyF3jd08a2AeFkrAScQuMBTbl9gnz7kGyrA3m+OEPqYOFrw7wq1jULai2ndZm
         XLWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jdxcqv0g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x7si2515270ywe.550.2017.12.18.10.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jdxcqv0g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0RI-0002dU-97
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:47:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUi-0008TN-1k
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUg-0002Hi-VZ
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:28 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:43367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUg-0002H3-Nb
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:26 -0500
Received: by mail-pg0-x241.google.com with SMTP id b18so9423314pgv.10
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ac6B4fIbk1rKjOWjF4fPb2HPxUZ3ZPd87nYhLxcCz84=;
	b=jdxcqv0gdfDRioz0IuhcUEbGXvN7sMaOlGt5J5U6PwEZhtDV9TM1ERdLldEvgf3Be2
	PKUnGaQuZAfEiXrK3X3nnSODFDy9v13WblLyS+NuBAJ8H/ATu0j7CnfT9j1NPKW1kTwK
	AAzPYVbzEXo9lF13ZoMeNDXbAmpOZY+9JlmXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ac6B4fIbk1rKjOWjF4fPb2HPxUZ3ZPd87nYhLxcCz84=;
	b=tt3Iyaj5u85087ck+LCtFjNDAW6QhhqamBND5x2phTxmBwT/NlD7PWMvMh+M0EtpSS
	240a2HFZo76tvwBYIAiuoTbJZmRF54VyDoUobTTvvzMPOX+nlzPC1qYI10rSXEqbZ8pZ
	KS664NSnzud9OcT2qmINoJGB+P2pJUex9UR2QG7JtfCOhd4y61ryWA2vRUt8DFSLz/EY
	XYHftH0lRbY85mtfUqI8JsNA87sDuMPpow+nEoZtg8yj9CVcuhPt8EjAtRdHb/K8/P69
	25E9xnf79LhvAuMmHnmJhnnC38NzpU9EHqqrz2hj3+QtT6utaF1OvOImrCxn7lfNYEyW
	UX/g==
X-Gm-Message-State: AKGB3mIuPkp1Vj88LvadJ1pSWGFwaVYtZZi+pCt6EFNpk7jkZcZT9SRl
	C0quOcCorRNj0hVGn/zsXjiEcwaS3bg=
X-Received: by 10.98.224.200 with SMTP id d69mr497613pfm.100.1513619185256;
	Mon, 18 Dec 2017 09:46:25 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:49 -0800
Message-Id: <20171218174552.18871-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH 20/23] target/arm: Implement SVE Compute Vector
 Address Group
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JKSf5RCh0aG+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 29 +++++++++++++++++++++++++++++
 target/arm/sve.def         | 12 ++++++++++++
 4 files changed, 86 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c0e23e7a83..a9fcf25b95 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -374,6 +374,11 @@ DEF_HELPER_FLAGS_4(sve_lsl_zzw_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_lsl_zzw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_lsl_zzw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_adr_p32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_adr_p64, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_adr_s32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_adr_u32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b6aca18d22..33b3c3432d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -983,6 +983,46 @@ void HELPER(sve_index_d)(void *vd, uint64_t start,
     }
 }
 
+void HELPER(sve_adr_p32)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t sh = simd_data(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + (m[i] << sh);
+    }
+}
+
+void HELPER(sve_adr_p64)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t sh = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + (m[i] << sh);
+    }
+}
+
+void HELPER(sve_adr_s32)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t sh = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + ((uint64_t)(int32_t)m[i] << sh);
+    }
+}
+
+void HELPER(sve_adr_u32)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t sh = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = n[i] + ((uint64_t)(uint32_t)m[i] << sh);
+    }
+}
+
 void HELPER(sve_ldr)(CPUARMState *env, void *d, target_ulong addr, uint32_t len)
 {
     intptr_t i, len_align = QEMU_ALIGN_DOWN(len, 8);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d8e7cc7570..fcb5c4929e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -710,6 +710,35 @@ DO_ZZW(LSL, lsl)
 
 #undef DO_ZZW
 
+static void do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
+{
+    unsigned vsz = size_for_gvec(vec_full_reg_size(s));
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vsz, vsz, a->imm, fn);
+}
+
+void trans_ADR_p32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_p32);
+}
+
+void trans_ADR_p64(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_p64);
+}
+
+void trans_ADR_s32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_s32);
+}
+
+void trans_ADR_u32(DisasContext *s, arg_rrri *a, uint32_t insn)
+{
+    do_adr(s, a, gen_helper_sve_adr_u32);
+}
+
 static uint64_t pred_esz_mask[4] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
     0x1111111111111111ull, 0x0101010101010101ull
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 9caed8fc66..66a88f59bc 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -47,6 +47,7 @@
 # instruction patterns.
 
 &rri			rd rn imm
+&rrri			rd rn rm imm
 &rri_esz		rd rn imm esz
 &rrr_esz		rd rn rm esz
 &rpr_esz		rd pg rn esz
@@ -65,6 +66,9 @@
 # Three operand with unused vector element size
 @rd_rn_rm		........ ... rm:5  ... ...  rn:5 rd:5		&rrr_esz esz=0
 
+# Three operand with "memory" size, aka immediate left shift
+@rd_rn_msz_rm		........ ... rm:5 .... imm:2 rn:5 rd:5		&rrri
+
 # Three prediate operand, with governing predicate, unused vector element size
 @pd_pg_pn_pm		........ .... rm:4 .. pg:4 . rn:4 . rd:4	&rprr_esz esz=0
 
@@ -251,6 +255,14 @@ ASR_zzw			00000100 .. 1 ..... 1000 00 ..... .....		@rd_rn_rm_esz # Note size !=
 LSR_zzw			00000100 .. 1 ..... 1000 01 ..... .....		@rd_rn_rm_esz # Note size != 3
 LSL_zzw			00000100 .. 1 ..... 1000 11 ..... .....		@rd_rn_rm_esz # Note size != 3
 
+### SVE Compute Vector Address Group
+
+# SVE vector address generation
+ADR_s32			00000100 00 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+ADR_u32			00000100 01 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+ADR_p32			00000100 10 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+ADR_p64			00000100 11 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
+
 ### SVE Predicate Generation Group
 
 # SVE initialize predicate (PTRUE, PTRUES)
-- 
2.14.3

