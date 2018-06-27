Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5770586wrq;
        Tue, 26 Jun 2018 21:35:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcYAxvqKDVE5oB6+sfb99pKvs08Sdb+jYEfDeTxAJeAJI4Cui2i22rOjRd4BbOggxG0mCav
X-Received: by 2002:a0c:cd89:: with SMTP id v9-v6mr4088291qvm.124.1530074114692;
        Tue, 26 Jun 2018 21:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074114; cv=none;
        d=google.com; s=arc-20160816;
        b=JbBcs8MCiM/g4TwRfdUzcdGc2LM8OSNh0AzGS5isZG+k0oa5MChsK1Yu5P0/LBzAkE
         Z1hYJhGimg7XEalJ9oQ3zAj9MoxQKgCaPziPhyFsf8feiwcOCtUxnZ5313zmHol6WqIC
         Xhqo9ybEmsr4sNrldx4Esx+uMGSwqzqxNxS07ZBZoj++ZPWTG0TsbRqx9nlByfAz2f4z
         AakLW6kkB+4btoL3T4w14lZjIoi3U8Zb8Jv55kzLxS6jJeEiP4ZGPUc/Up9PdsnWxRo7
         DlN6YM89aX/QxRmBMA3gxSbZVf8BDs+tSMDNDBulEND3Td6den3714x7qRm5tDF9Bgvd
         jb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=mZm2gkWkdnvvX+gOmWHDGixvgU5Aow6CSssLEBQ63CA=;
        b=GgdBAOeq/wVNlkEES/uQd8HXZZBWQDVzQ+SJ00CPSX+2R+nwUaotaGWsajkgt3y8H4
         9/9muVgAoApoBwlnvp5QWKhooI0Zz2d4+JdtFvX7Mz45K5n/AXV/1koKDAzwHpb6ZFCK
         DzQdLVU3lzfXmEwjU8FYGtEd1vI8UEQDwycKHJQvgV7RluvoWwVEOCW9OzfScdbNhoVT
         U3TPDO359BYP0EyXeRUHapVAoOH8OG2PvkINE4mRaOZqfTGzsZCWF9OA0gtkjvc3DC9x
         dF3twk3XCzCl4EBGhjaYAjC/axTaJSFklxNy6zq5f4wNdVwNcSKFHsmeUJUc2XCIT8Zl
         DRmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dsQ1t9Po;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m70-v6si3081156qkl.389.2018.06.26.21.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:35:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dsQ1t9Po;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Ak-000550-5b
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:35:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29K-00048P-Th
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29G-0000EJ-RU
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:46 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29G-0000Co-Gj
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:42 -0400
Received: by mail-pf0-x242.google.com with SMTP id s21-v6so384551pfm.6
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mZm2gkWkdnvvX+gOmWHDGixvgU5Aow6CSssLEBQ63CA=;
	b=dsQ1t9PoC5RLxZ0pbhkDiFKzixn7w+9nc+ibC6UCfY+1TSJr6uqVTPAf/fnIcsV7nt
	e+UuOxgsgsr8t3pcFNkc6NPckcFziT5+B9ucQZ28JDcBKUbIy+VISSrgtpgzLQs108Ga
	cYFZyXFiKN/n3+SdG0CD65CwdwajYyLxPg+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mZm2gkWkdnvvX+gOmWHDGixvgU5Aow6CSssLEBQ63CA=;
	b=tSERyx7Pf9T29mDRM7KdvS27dVHndPONLfvNbq3JpAFTpaueC6iudP+doajnUnpCOd
	5MFBz3vORYYHIStbtuCMJo+4cexnDeADC8xFl/2kEE/6ixkY0x4wtnxccgwdTl2QlMf9
	IGCRHIniNbsnvO2wVEOdJ+swMZSlRouWdavt2srk0RqlAwYUPwuG9qU7AtK2YGaK+voN
	hnhnQOUZFLoJqZHfbyp3ikuwxBBEOIsd0N+FQLVOMy2XO65T19KUKoPAUK2aCMduAi9a
	ZUZi4hsKajR7dmbk8v2dQ5lOIHUhymWoJi9eLOuBmHf5nRFl+dybZ5Zsy52tDotZ12Z/
	CDeg==
X-Gm-Message-State: APt69E1m5BjrWg+E6pJMdWjU9yXJ72HBEcDHQbKqxgPHFN/S0cNkrj0P
	e/1hDfrCuPJzoltCFXreBeBy4DrVj6Q=
X-Received: by 2002:a62:569c:: with SMTP id h28-v6mr53573pfj.201.1530074021129;
	Tue, 26 Jun 2018 21:33:41 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:00 -0700
Message-Id: <20180627043328.11531-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v6 07/35] target/arm: Implement SVE FP
 Multiply-Add Group
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
X-TUID: jWMKOMap5lqy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Add some decode commentary.
---
 target/arm/helper-sve.h    |  16 ++++
 target/arm/sve_helper.c    | 158 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  49 ++++++++++++
 target/arm/sve.decode      |  18 +++++
 4 files changed, 241 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4097b55f0e..eb0645dd43 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -827,6 +827,22 @@ DEF_HELPER_FLAGS_5(sve_ucvt_ds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_ucvt_dd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3401662397..2f416e5e28 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2938,6 +2938,164 @@ DO_ZPZ_FP(sve_ucvt_dd, uint64_t,     , uint64_to_float64)
 
 #undef DO_ZPZ_FP
 
+/* 4-operand predicated multiply-add.  This requires 7 operands to pass
+ * "properly", so we need to encode some of the registers into DESC.
+ */
+QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 20 > 32);
+
+static void do_fmla_zpzzz_h(CPUARMState *env, void *vg, uint32_t desc,
+                            uint16_t neg1, uint16_t neg3)
+{
+    intptr_t i = simd_oprsz(desc);
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
+    void *vd = &env->vfp.zregs[rd];
+    void *vn = &env->vfp.zregs[rn];
+    void *vm = &env->vfp.zregs[rm];
+    void *va = &env->vfp.zregs[ra];
+    uint64_t *g = vg;
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            i -= 2;
+            if (likely((pg >> (i & 63)) & 1)) {
+                float16 e1, e2, e3, r;
+
+                e1 = *(uint16_t *)(vn + H1_2(i)) ^ neg1;
+                e2 = *(uint16_t *)(vm + H1_2(i));
+                e3 = *(uint16_t *)(va + H1_2(i)) ^ neg3;
+                r = float16_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                *(uint16_t *)(vd + H1_2(i)) = r;
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_h(env, vg, desc, 0, 0);
+}
+
+void HELPER(sve_fmls_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_h(env, vg, desc, 0x8000, 0);
+}
+
+void HELPER(sve_fnmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_h(env, vg, desc, 0x8000, 0x8000);
+}
+
+void HELPER(sve_fnmls_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_h(env, vg, desc, 0, 0x8000);
+}
+
+static void do_fmla_zpzzz_s(CPUARMState *env, void *vg, uint32_t desc,
+                            uint32_t neg1, uint32_t neg3)
+{
+    intptr_t i = simd_oprsz(desc);
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
+    void *vd = &env->vfp.zregs[rd];
+    void *vn = &env->vfp.zregs[rn];
+    void *vm = &env->vfp.zregs[rm];
+    void *va = &env->vfp.zregs[ra];
+    uint64_t *g = vg;
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            i -= 4;
+            if (likely((pg >> (i & 63)) & 1)) {
+                float32 e1, e2, e3, r;
+
+                e1 = *(uint32_t *)(vn + H1_4(i)) ^ neg1;
+                e2 = *(uint32_t *)(vm + H1_4(i));
+                e3 = *(uint32_t *)(va + H1_4(i)) ^ neg3;
+                r = float32_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                *(uint32_t *)(vd + H1_4(i)) = r;
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_s(env, vg, desc, 0, 0);
+}
+
+void HELPER(sve_fmls_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_s(env, vg, desc, 0x80000000, 0);
+}
+
+void HELPER(sve_fnmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_s(env, vg, desc, 0x80000000, 0x80000000);
+}
+
+void HELPER(sve_fnmls_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_s(env, vg, desc, 0, 0x80000000);
+}
+
+static void do_fmla_zpzzz_d(CPUARMState *env, void *vg, uint32_t desc,
+                            uint64_t neg1, uint64_t neg3)
+{
+    intptr_t i = simd_oprsz(desc);
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
+    void *vd = &env->vfp.zregs[rd];
+    void *vn = &env->vfp.zregs[rn];
+    void *vm = &env->vfp.zregs[rm];
+    void *va = &env->vfp.zregs[ra];
+    uint64_t *g = vg;
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            i -= 8;
+            if (likely((pg >> (i & 63)) & 1)) {
+                float64 e1, e2, e3, r;
+
+                e1 = *(uint64_t *)(vn + i) ^ neg1;
+                e2 = *(uint64_t *)(vm + i);
+                e3 = *(uint64_t *)(va + i) ^ neg3;
+                r = float64_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                *(uint64_t *)(vd + i) = r;
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_d(env, vg, desc, 0, 0);
+}
+
+void HELPER(sve_fmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_d(env, vg, desc, INT64_MIN, 0);
+}
+
+void HELPER(sve_fnmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_d(env, vg, desc, INT64_MIN, INT64_MIN);
+}
+
+void HELPER(sve_fnmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    do_fmla_zpzzz_d(env, vg, desc, 0, INT64_MIN);
+}
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4df5360da9..acad6374ef 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3472,6 +3472,55 @@ DO_FP3(FMULX, fmulx)
 
 #undef DO_FP3
 
+typedef void gen_helper_sve_fmla(TCGv_env, TCGv_ptr, TCGv_i32);
+
+static bool do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc;
+    TCGv_i32 t_desc;
+    TCGv_ptr pg = tcg_temp_new_ptr();
+
+    /* We would need 7 operands to pass these arguments "properly".
+     * So we encode all the register numbers into the descriptor.
+     */
+    desc = deposit32(a->rd, 5, 5, a->rn);
+    desc = deposit32(desc, 10, 5, a->rm);
+    desc = deposit32(desc, 15, 5, a->ra);
+    desc = simd_desc(vsz, vsz, desc);
+
+    t_desc = tcg_const_i32(desc);
+    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+    fn(cpu_env, pg, t_desc);
+    tcg_temp_free_i32(t_desc);
+    tcg_temp_free_ptr(pg);
+    return true;
+}
+
+#define DO_FMLA(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a, uint32_t insn) \
+{                                                                    \
+    static gen_helper_sve_fmla * const fns[4] = {                    \
+        NULL, gen_helper_sve_##name##_h,                             \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d         \
+    };                                                               \
+    return do_fmla(s, a, fns[a->esz]);                               \
+}
+
+DO_FMLA(FMLA_zpzzz, fmla_zpzzz)
+DO_FMLA(FMLS_zpzzz, fmls_zpzzz)
+DO_FMLA(FNMLA_zpzzz, fnmla_zpzzz)
+DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
+
+#undef DO_FMLA
+
 /*
  *** SVE Floating Point Unary Operations Prediated Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 636212a638..e8531e28cd 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -128,6 +128,8 @@
                 &rprrr_esz ra=%reg_movprfx
 @rdn_pg_ra_rm   ........ esz:2 . rm:5  ... pg:3 ra:5 rd:5 \
                 &rprrr_esz rn=%reg_movprfx
+@rdn_pg_rm_ra   ........ esz:2 . ra:5  ... pg:3 rm:5 rd:5 \
+                &rprrr_esz rn=%reg_movprfx
 
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
@@ -701,6 +703,22 @@ FMULX           01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
 FDIV            01100101 .. 00 1100 100 ... ..... .....    @rdm_pg_rn # FDIVR
 FDIV            01100101 .. 00 1101 100 ... ..... .....    @rdn_pg_rm
 
+### SVE FP Multiply-Add Group
+
+# SVE floating-point multiply-accumulate writing addend
+FMLA_zpzzz      01100101 .. 1 ..... 000 ... ..... .....         @rda_pg_rn_rm
+FMLS_zpzzz      01100101 .. 1 ..... 001 ... ..... .....         @rda_pg_rn_rm
+FNMLA_zpzzz     01100101 .. 1 ..... 010 ... ..... .....         @rda_pg_rn_rm
+FNMLS_zpzzz     01100101 .. 1 ..... 011 ... ..... .....         @rda_pg_rn_rm
+
+# SVE floating-point multiply-accumulate writing multiplicand
+# Alter the operand extraction order and reuse the helpers from above.
+# FMAD, FMSB, FNMAD, FNMS
+FMLA_zpzzz      01100101 .. 1 ..... 100 ... ..... .....         @rdn_pg_rm_ra
+FMLS_zpzzz      01100101 .. 1 ..... 101 ... ..... .....         @rdn_pg_rm_ra
+FNMLA_zpzzz     01100101 .. 1 ..... 110 ... ..... .....         @rdn_pg_rm_ra
+FNMLS_zpzzz     01100101 .. 1 ..... 111 ... ..... .....         @rdn_pg_rm_ra
+
 ### SVE FP Unary Operations Predicated Group
 
 # SVE integer convert to floating-point
-- 
2.17.1

