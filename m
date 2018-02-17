Received: by 10.28.71.27 with SMTP id u27csp2089612wma;
        Sat, 17 Feb 2018 10:52:13 -0800 (PST)
X-Google-Smtp-Source: AH8x226Nyp55P3GjZetPYuI/p7mBVwgP6i6oyYyoZ/uKTZJmnJM4bom+csbOahW1giur6umHM+gG
X-Received: by 10.37.185.132 with SMTP id r4mr7055474ybg.173.1518893533363;
        Sat, 17 Feb 2018 10:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893533; cv=none;
        d=google.com; s=arc-20160816;
        b=qXAHVU6CYf1vtzf6kZe8hrQtMkgccNoPI6epjNdwpzIX6dUMPgR2So7E789UsiE/d1
         ZgJvBoKn7FHMELFryknX+kwyPIHt72csWqLzS9o4sZDEQIj5EbcOUswXc9raTbL63xTa
         +9fR1fCy5nZqq18WfGVBQETyJq9piC4A/Q0awwoIXnsq4lL6vqeI0YvChPZvwcOMQNsr
         2c4XbzGZYa09Nbil24V2+bs0sseWNUxflFO/NuQF3mBFfKF+OKQOA4hnwVcWnM/c+16h
         lpI6ATz1tAYSSCjYe+vsZ+qsnreH6k3YRLO+JWKb/XtAiL54/3NtSEA7u4qQcxVav9zU
         FX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bxlL3933KZt9XyhRekE43YoYNcpubIZDGz3/aO+obpk=;
        b=OrcK0k//h8KYCwfsrASLQIGThFauf8iwrTBCnRudDwA3nowiwSH41K9F2kHCkBsreq
         kMkwkTWR6m9l5g4YZfa5to61dbLQyb9b2ROek5S7EnLQe5xCkWNglmYgCFIFL4gsdy1g
         x8kZTw4j7b8Oz3Cmu3j1VhzXARhFgoX+QAuSnyi9J7NfJtsLk7SEuRot9a/BJ4J6I3VS
         0BMRbvXX0J68Ix+rJQjBVd/JZzg4Zscf5gBzLfy97pRqkKTf2RDJn02R9V2Qp1faPk5Q
         o0J9hhki31zeKIBqjlQ7RjKvlRXoELhrxgKXGy72TFu3aRWmNkrMjdTci27ZYnJrm1le
         P1yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EWN46cE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si3489894ywp.313.2018.02.17.10.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EWN46cE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7am-0006z4-MW
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:52:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79n-0000wz-7s
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79l-0001rj-Ib
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:19 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:39666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79l-0001rL-A5
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:17 -0500
Received: by mail-pl0-x242.google.com with SMTP id s13so3437121plq.6
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bxlL3933KZt9XyhRekE43YoYNcpubIZDGz3/aO+obpk=;
	b=EWN46cE+IeEAix1Pn0dcFCdCJO2n4pJ6RDg0TpzvTjoNhdpRLiNI5Z7YAL5p2KFFcE
	T2FLvMinUBybRuUrugRiGigApi04xV5oG3Q/ZScrvVZQ0VpO0ThquhgPu0lmyJE4AKuv
	J/r/lx/BnH27IyUJpWHQI+JqDzgjQvSTKZuNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bxlL3933KZt9XyhRekE43YoYNcpubIZDGz3/aO+obpk=;
	b=uAXI9BhyplVvb6FMzi9FmCf5WixShJOjfvh1G7yuLib0AIuL1FHwaEw9u3BrKDwAel
	EijHzsYTYh6RpJlnB9DmFdGu6olNWb2eAFSCqHH1PdpJl1zkssr94AZ3E22lkKno51MD
	9mx4WmKs4YkTGAz4Y3e/upoWZWswKG8GCdMkFEklJrBVBlZm0T4bn8se4WiQsfhyWew0
	Set1RJbfgmjFVN+DpzZNLA1GBjBX+BML8ZPRejyK/rKQqKjVQDmiM19o4oTPZbOw47fv
	6MGzM0YOC0In+VKGPuNptqhWtrS7VzIx7foxD7BYojuKTqEqru6zSU3kX91AllhMU9lE
	YG+Q==
X-Gm-Message-State: APf1xPBbkwK3ZXEQEZPyzDpQPIXTxL/289PHUUZ+qwbtrGHFWDhHi5TP
	MfDfPMw2IVqKMFX0e+vD0f291A==
X-Received: by 2002:a17:902:8509:: with SMTP id
	bj9-v6mr9562808plb.386.1518891856347; 
	Sat, 17 Feb 2018 10:24:16 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:47 -0800
Message-Id: <20180217182323.25885-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 31/67] target/arm: Implement SVE conditionally
 broadcast/extract element
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
X-TUID: qRpBpxVTAAz8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   2 +
 target/arm/sve_helper.c    |  11 ++
 target/arm/translate-sve.c | 299 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  20 +++
 4 files changed, 332 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d977aea00d..a58fb4ba01 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -463,6 +463,8 @@ DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_2(sve_last_active_element, TCG_CALL_NO_RWG, s32, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 87a1a32232..ee289be642 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2050,3 +2050,14 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
         d[j] = 0;
     }
 }
+
+/* Similar to the ARM LastActiveElement pseudocode function, except the
+   result is multiplied by the element size.  This includes the not found
+   indication; e.g. not found for esz=3 is -8.  */
+int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+
+    return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 21531b259c..207a22a0bc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2123,6 +2123,305 @@ static void trans_COMPACT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     do_zpz_ool(s, a, fns[a->esz]);
 }
 
+/* Call the helper that computes the ARM LastActiveElement pseudocode
+   function, scaled by the element size.  This includes the not found
+   indication; e.g. not found for esz=3 is -8.  */
+static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
+{
+    /* Predicate sizes may be smaller and cannot use simd_desc.  We cannot
+       round up, as we do elsewhere, because we need the exact size.  */
+    TCGv_ptr t_p = tcg_temp_new_ptr();
+    TCGv_i32 t_desc;
+    unsigned vsz = pred_full_reg_size(s);
+    unsigned desc;
+
+    desc = vsz - 2;
+    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+
+    tcg_gen_addi_ptr(t_p, cpu_env, pred_full_reg_offset(s, pg));
+    t_desc = tcg_const_i32(desc);
+
+    gen_helper_sve_last_active_element(ret, t_p, t_desc);
+
+    tcg_temp_free_i32(t_desc);
+    tcg_temp_free_ptr(t_p);
+}
+
+/* Increment LAST to the offset of the next element in the vector,
+   wrapping around to 0.  */
+static void incr_last_active(DisasContext *s, TCGv_i32 last, int esz)
+{
+    unsigned vsz = vec_full_reg_size(s);
+
+    tcg_gen_addi_i32(last, last, 1 << esz);
+    if (is_power_of_2(vsz)) {
+        tcg_gen_andi_i32(last, last, vsz - 1);
+    } else {
+        TCGv_i32 max = tcg_const_i32(vsz);
+        TCGv_i32 zero = tcg_const_i32(0);
+        tcg_gen_movcond_i32(TCG_COND_GEU, last, last, max, zero, last);
+        tcg_temp_free_i32(max);
+        tcg_temp_free_i32(zero);
+    }
+}
+
+/* If LAST < 0, set LAST to the offset of the last element in the vector.  */
+static void wrap_last_active(DisasContext *s, TCGv_i32 last, int esz)
+{
+    unsigned vsz = vec_full_reg_size(s);
+
+    if (is_power_of_2(vsz)) {
+        tcg_gen_andi_i32(last, last, vsz - 1);
+    } else {
+        TCGv_i32 max = tcg_const_i32(vsz - (1 << esz));
+        TCGv_i32 zero = tcg_const_i32(0);
+        tcg_gen_movcond_i32(TCG_COND_LT, last, last, zero, max, last);
+        tcg_temp_free_i32(max);
+        tcg_temp_free_i32(zero);
+    }
+}
+
+/* Load an unsigned element of ESZ from BASE+OFS.  */
+static TCGv_i64 load_esz(TCGv_ptr base, int ofs, int esz)
+{
+    TCGv_i64 r = tcg_temp_new_i64();
+
+    switch (esz) {
+    case 0:
+        tcg_gen_ld8u_i64(r, base, ofs);
+        break;
+    case 1:
+        tcg_gen_ld16u_i64(r, base, ofs);
+        break;
+    case 2:
+        tcg_gen_ld32u_i64(r, base, ofs);
+        break;
+    case 3:
+        tcg_gen_ld_i64(r, base, ofs);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return r;
+}
+
+/* Load an unsigned element of ESZ from RM[LAST].  */
+static TCGv_i64 load_last_active(DisasContext *s, TCGv_i32 last,
+                                 int rm, int esz)
+{
+    TCGv_ptr p = tcg_temp_new_ptr();
+    TCGv_i64 r;
+
+    /* Convert offset into vector into offset into ENV.
+       The final adjustment for the vector register base
+       is added via constant offset to the load.  */
+#ifdef HOST_WORDS_BIGENDIAN
+    /* Adjust for element ordering.  See vec_reg_offset.  */
+    if (esz < 3) {
+        tcg_gen_xori_i32(last, last, 8 - (1 << esz));
+    }
+#endif
+    tcg_gen_ext_i32_ptr(p, last);
+    tcg_gen_add_ptr(p, p, cpu_env);
+
+    r = load_esz(p, vec_full_reg_offset(s, rm), esz);
+    tcg_temp_free_ptr(p);
+
+    return r;
+}
+
+/* Compute CLAST for a Zreg.  */
+static void do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
+{
+    TCGv_i32 last = tcg_temp_local_new_i32();
+    TCGLabel *over = gen_new_label();
+    TCGv_i64 ele;
+    unsigned vsz, esz = a->esz;
+
+    find_last_active(s, last, esz, a->pg);
+
+    /* There is of course no movcond for a 2048-bit vector,
+       so we must branch over the actual store.  */
+    tcg_gen_brcondi_i32(TCG_COND_LT, last, 0, over);
+
+    if (!before) {
+        incr_last_active(s, last, esz);
+    }
+
+    ele = load_last_active(s, last, a->rm, esz);
+    tcg_temp_free_i32(last);
+
+    vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd), vsz, vsz, ele);
+    tcg_temp_free_i64(ele);
+
+    /* If this insn used MOVPRFX, we may need a second move.  */
+    if (a->rd != a->rn) {
+        TCGLabel *done = gen_new_label();
+        tcg_gen_br(done);
+
+        gen_set_label(over);
+        do_mov_z(s, a->rd, a->rn);
+
+        gen_set_label(done);
+    } else {
+        gen_set_label(over);
+    }
+}
+
+static void trans_CLASTA_z(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    do_clast_vector(s, a, false);
+}
+
+static void trans_CLASTB_z(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    do_clast_vector(s, a, true);
+}
+
+/* Compute CLAST for a scalar.  */
+static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
+                            bool before, TCGv_i64 reg_val)
+{
+    TCGv_i32 last = tcg_temp_new_i32();
+    TCGv_i64 ele, cmp, zero;
+
+    find_last_active(s, last, esz, pg);
+
+    /* Extend the original value of last prior to incrementing.  */
+    cmp = tcg_temp_new_i64();
+    tcg_gen_ext_i32_i64(cmp, last);
+
+    if (!before) {
+        incr_last_active(s, last, esz);
+    }
+
+    /* The conceit here is that while last < 0 indicates not found, after
+       adjusting for cpu_env->vfp.zregs[rm], it is still a valid address
+       from which we can load garbage.  We then discard the garbage with
+       a conditional move.  */
+    ele = load_last_active(s, last, rm, esz);
+    tcg_temp_free_i32(last);
+
+    zero = tcg_const_i64(0);
+    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, zero, ele, reg_val);
+
+    tcg_temp_free_i64(zero);
+    tcg_temp_free_i64(cmp);
+    tcg_temp_free_i64(ele);
+}
+
+/* Compute CLAST for a Vreg.  */
+static void do_clast_fp(DisasContext *s, arg_rpr_esz *a, bool before)
+{
+    int esz = a->esz;
+    int ofs = vec_reg_offset(s, a->rd, 0, esz);
+    TCGv_i64 reg = load_esz(cpu_env, ofs, esz);
+
+    do_clast_scalar(s, esz, a->pg, a->rn, before, reg);
+    write_fp_dreg(s, a->rd, reg);
+    tcg_temp_free_i64(reg);
+}
+
+static void trans_CLASTA_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_clast_fp(s, a, false);
+}
+
+static void trans_CLASTB_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_clast_fp(s, a, true);
+}
+
+/* Compute CLAST for a Xreg.  */
+static void do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+
+    switch (a->esz) {
+    case 0:
+        tcg_gen_ext8u_i64(reg, reg);
+        break;
+    case 1:
+        tcg_gen_ext16u_i64(reg, reg);
+        break;
+    case 2:
+        tcg_gen_ext32u_i64(reg, reg);
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    do_clast_scalar(s, a->esz, a->pg, a->rn, before, cpu_reg(s, a->rd));
+}
+
+static void trans_CLASTA_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_clast_general(s, a, false);
+}
+
+static void trans_CLASTB_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_clast_general(s, a, true);
+}
+
+/* Compute LAST for a scalar.  */
+static TCGv_i64 do_last_scalar(DisasContext *s, int esz,
+                               int pg, int rm, bool before)
+{
+    TCGv_i32 last = tcg_temp_new_i32();
+    TCGv_i64 ret;
+
+    find_last_active(s, last, esz, pg);
+    if (before) {
+        wrap_last_active(s, last, esz);
+    } else {
+        incr_last_active(s, last, esz);
+    }
+
+    ret = load_last_active(s, last, rm, esz);
+    tcg_temp_free_i32(last);
+    return ret;
+}
+
+/* Compute LAST for a Vreg.  */
+static void do_last_fp(DisasContext *s, arg_rpr_esz *a, bool before)
+{
+    TCGv_i64 val = do_last_scalar(s, a->esz, a->pg, a->rn, before);
+    write_fp_dreg(s, a->rd, val);
+    tcg_temp_free_i64(val);
+}
+
+static void trans_LASTA_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_last_fp(s, a, false);
+}
+
+static void trans_LASTB_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_last_fp(s, a, true);
+}
+
+/* Compute LAST for a Xreg.  */
+static void do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
+{
+    TCGv_i64 val = do_last_scalar(s, a->esz, a->pg, a->rn, before);
+    tcg_gen_mov_i64(cpu_reg(s, a->rd), val);
+    tcg_temp_free_i64(val);
+}
+
+static void trans_LASTA_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_last_general(s, a, false);
+}
+
+static void trans_LASTB_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_last_general(s, a, true);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a89bd37eeb..1370802c12 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -431,6 +431,26 @@ TRN2_z		00000101 .. 1 ..... 011 101 ..... .....		@rd_rn_rm
 # Note esz >= 2
 COMPACT		00000101 .. 100001 100 ... ..... .....		@rd_pg_rn
 
+# SVE conditionally broadcast element to vector
+CLASTA_z	00000101 .. 10100 0 100 ... ..... .....		@rdn_pg_rm
+CLASTB_z	00000101 .. 10100 1 100 ... ..... .....		@rdn_pg_rm
+
+# SVE conditionally copy element to SIMD&FP scalar
+CLASTA_v	00000101 .. 10101 0 100 ... ..... .....		@rd_pg_rn
+CLASTB_v	00000101 .. 10101 1 100 ... ..... .....		@rd_pg_rn
+
+# SVE conditionally copy element to general register
+CLASTA_r	00000101 .. 11000 0 101 ... ..... .....		@rd_pg_rn
+CLASTB_r	00000101 .. 11000 1 101 ... ..... .....		@rd_pg_rn
+
+# SVE copy element to SIMD&FP scalar register
+LASTA_v		00000101 .. 10001 0 100 ... ..... .....		@rd_pg_rn
+LASTB_v		00000101 .. 10001 1 100 ... ..... .....		@rd_pg_rn
+
+# SVE copy element to general register
+LASTA_r		00000101 .. 10000 0 101 ... ..... .....		@rd_pg_rn
+LASTB_r		00000101 .. 10000 1 101 ... ..... .....		@rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

