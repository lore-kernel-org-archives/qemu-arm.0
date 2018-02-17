Received: by 10.28.71.27 with SMTP id u27csp2078706wma;
        Sat, 17 Feb 2018 10:35:52 -0800 (PST)
X-Google-Smtp-Source: AH8x225/wXsLL/bRhmyOs4RNvsArTUcPTgBUFfijcExqk6Umz9K+9Kso9Ty+puts2XxwR3d7Tr3e
X-Received: by 10.37.171.6 with SMTP id u6mr7043434ybi.88.1518892552190;
        Sat, 17 Feb 2018 10:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892552; cv=none;
        d=google.com; s=arc-20160816;
        b=NzpqHyrp9VKstSrPsp4+GSu4DtTduj2fy93qJ+JVhQeZcf4VgFiECFucaSTZ6HugkI
         rHL/ycDX6XuddYbOgxUdyJvP9I/U6U7grp1nMWm+32So0A8wvgDFes38vI1q/XtD0Lji
         Thj6tKj7VoW7Kr9V9c7JhCHkgHsifg7J8dlIqL77b6yeG7PnIEo923SWziTA8TD7yQ/z
         Cp4jIdpQ05KGI+t8u8Jd48dFx8w/40NlqOk5a/7EQk/2Veshr5MuPhzYPev8Y6VA5ZxI
         a6S1jYQEC/hlUmEZ1Uzr7voHoepHLmylUnJqcTtNDhSnwMQxGANzDlEj6oh5IunrAB15
         oEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qPsbfGNpCfDIlap2bj2lVE1RF8fhYlKz98g2CqBrEjw=;
        b=g3z18vpBIidGceYS39YvnaO84M38PNZXeAiOYfEVKyqbnhkLtqQx1Udy+hOUUP3Q5C
         iC0iBeE2L2ezwZZpCl8knx0M8E/Am1ZFdp5PI2VMEHXzIoHGwjkFv/KVf40P+k7pmQMz
         ihFatTcF/IJwSzTApttWpYxw+MQLazpNPXBqNKLKHYTS4lwZgdnuSRmHNCQ/NgC5vn4Q
         EQ7nG2cFNpItoriDocj8rKxLj7S1jkOSQZE0uKLkK9DawkGDskh1fqH5yIhmuk4T75pF
         z4dVEqLLI2kg96UUwXUbFx7deoa8fEoBRJu9B1MZGYZ8uNLqN3mbPAnpQS4Fzk1ZqS/o
         8CwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CtJ3puXX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m15si1950082ybm.106.2018.02.17.10.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:35:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CtJ3puXX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Kx-0001ay-It
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:35:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79h-0000rJ-OK
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79f-0001ow-Jh
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:13 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:40421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79f-0001nU-BN
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:11 -0500
Received: by mail-pl0-x243.google.com with SMTP id g18so3435334plo.7
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qPsbfGNpCfDIlap2bj2lVE1RF8fhYlKz98g2CqBrEjw=;
	b=CtJ3puXXRdtHjT+YOvukmfZ36iapRfi545H3hposydFmKXzn4AnDPMpIdxExGg9jYZ
	XeXy0IhUWNx75Sy68mBgXscviZiASPGvHugp8ALndLyLq1HQFEyNEZKmGMzn3KVa9tBM
	S85mjdXBCQZmsdUi55/gSP3sIudaEB0yXm8zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qPsbfGNpCfDIlap2bj2lVE1RF8fhYlKz98g2CqBrEjw=;
	b=qSYvGrWc1wbMDck9uOGPWlaC8TgAvIyoDOdb7fi2yJot3B40gaTyWAD3FwcsNBySwf
	zufyhphbeIRyWI7G/cZ4FPNrIxXWfstsjEIw7h+O5q7lwsfEpWSfzgc5ucxCOq65wlID
	cuCanh1YaPL2l7td2Kzs3ecVWouiXP/sGzWArAGV7nAPXg5OlY3/lJO/WWc+gyB9zPk8
	tRqelw5ZSucde4sJnBq+pxfAL+ruAbqR1hvaXhusuOeqRJPfBmdNHSC7XoatrtMIh6fa
	4HgZeuhSki182GkTL0UeeQzpajfuA+LlvKTrbhaLtw+Upr3FYqWtTdCdKxlxX7vURzA/
	Ccxg==
X-Gm-Message-State: APf1xPDKW1YNb3sik3Fst46hG6ybixmkQq3UW1MPc0MLssNRjikfCjcG
	38X92JSLAIepEBMSFDZRtCbZdpWQbZ4=
X-Received: by 2002:a17:902:2bc5:: with SMTP id
	l63-v6mr9564154plb.108.1518891849947; 
	Sat, 17 Feb 2018 10:24:09 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:43 -0800
Message-Id: <20180217182323.25885-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v2 27/67] target/arm: Implement SVE Permute -
 Unpredicated Group
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
X-TUID: 62vAHngothpU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  23 +++++++++
 target/arm/translate-a64.h |  14 +++---
 target/arm/sve_helper.c    | 114 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  29 +++++++++++-
 5 files changed, 285 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 94f4356ce9..0c9aad575e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -416,6 +416,29 @@ DEF_HELPER_FLAGS_4(sve_cpy_z_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 
 DEF_HELPER_FLAGS_4(sve_ext, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_insr_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_insr_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_insr_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_insr_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_3(sve_rev_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_rev_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_rev_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_rev_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_tbl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_sunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_sunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_sunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_uunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index e519aee314..328aa7fce1 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -66,18 +66,18 @@ static inline void assert_fp_access_checked(DisasContext *s)
 static inline int vec_reg_offset(DisasContext *s, int regno,
                                  int element, TCGMemOp size)
 {
-    int offs = 0;
+    int element_size = 1 << size;
+    int offs = element * element_size;
 #ifdef HOST_WORDS_BIGENDIAN
     /* This is complicated slightly because vfp.zregs[n].d[0] is
      * still the low half and vfp.zregs[n].d[1] the high half
      * of the 128 bit vector, even on big endian systems.
-     * Calculate the offset assuming a fully bigendian 128 bits,
-     * then XOR to account for the order of the two 64 bit halves.
+     * Calculate the offset assuming a fully little-endian 128 bits,
+     * then XOR to account for the order of the 64 bit units.
      */
-    offs += (16 - ((element + 1) * (1 << size)));
-    offs ^= 8;
-#else
-    offs += element * (1 << size);
+    if (element_size < 8) {
+        offs ^= 8 - element_size;
+    }
 #endif
     offs += offsetof(CPUARMState, vfp.zregs[regno]);
     assert_fp_access_checked(s);
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fb3f54300b..466a209c1e 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1550,3 +1550,117 @@ void HELPER(sve_ext)(void *vd, void *vn, void *vm, uint32_t desc)
         memcpy(vd + n_siz, &tmp, n_ofs);
     }
 }
+
+#define DO_INSR(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, uint64_t val, uint32_t desc) \
+{                                                                  \
+    intptr_t opr_sz = simd_oprsz(desc);                            \
+    swap_memmove(vd + sizeof(TYPE), vn, opr_sz - sizeof(TYPE));    \
+    *(TYPE *)(vd + H(0)) = val;                                    \
+}
+
+DO_INSR(sve_insr_b, uint8_t, H1)
+DO_INSR(sve_insr_h, uint16_t, H1_2)
+DO_INSR(sve_insr_s, uint32_t, H1_4)
+DO_INSR(sve_insr_d, uint64_t, )
+
+#undef DO_INSR
+
+void HELPER(sve_rev_b)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    for (i = 0, j = opr_sz - 8; i < opr_sz / 2; i += 8, j -= 8) {
+        uint64_t f = *(uint64_t *)(vn + i);
+        uint64_t b = *(uint64_t *)(vn + j);
+        *(uint64_t *)(vd + i) = bswap64(b);
+        *(uint64_t *)(vd + j) = bswap64(f);
+    }
+}
+
+static inline uint64_t hswap64(uint64_t h)
+{
+    uint64_t m = 0x0000ffff0000ffffull;
+    h = rol64(h, 32);
+    return ((h & m) << 16) | ((h >> 16) & m);
+}
+
+void HELPER(sve_rev_h)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    for (i = 0, j = opr_sz - 8; i < opr_sz / 2; i += 8, j -= 8) {
+        uint64_t f = *(uint64_t *)(vn + i);
+        uint64_t b = *(uint64_t *)(vn + j);
+        *(uint64_t *)(vd + i) = hswap64(b);
+        *(uint64_t *)(vd + j) = hswap64(f);
+    }
+}
+
+void HELPER(sve_rev_s)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    for (i = 0, j = opr_sz - 8; i < opr_sz / 2; i += 8, j -= 8) {
+        uint64_t f = *(uint64_t *)(vn + i);
+        uint64_t b = *(uint64_t *)(vn + j);
+        *(uint64_t *)(vd + i) = rol64(b, 32);
+        *(uint64_t *)(vd + j) = rol64(f, 32);
+    }
+}
+
+void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    for (i = 0, j = opr_sz - 8; i < opr_sz / 2; i += 8, j -= 8) {
+        uint64_t f = *(uint64_t *)(vn + i);
+        uint64_t b = *(uint64_t *)(vn + j);
+        *(uint64_t *)(vd + i) = b;
+        *(uint64_t *)(vd + j) = f;
+    }
+}
+
+#define DO_TBL(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    uintptr_t elem = opr_sz / sizeof(TYPE);                    \
+    TYPE *d = vd, *n = vn, *m = vm;                            \
+    ARMVectorReg tmp;                                          \
+    if (unlikely(vd == vn)) {                                  \
+        n = memcpy(&tmp, vn, opr_sz);                          \
+    }                                                          \
+    for (i = 0; i < elem; i++) {                               \
+        TYPE j = m[H(i)];                                      \
+        d[H(i)] = j < elem ? n[H(j)] : 0;                      \
+    }                                                          \
+}
+
+DO_TBL(sve_tbl_b, uint8_t, H1)
+DO_TBL(sve_tbl_h, uint16_t, H2)
+DO_TBL(sve_tbl_s, uint32_t, H4)
+DO_TBL(sve_tbl_d, uint64_t, )
+
+#undef TBL
+
+#define DO_UNPK(NAME, TYPED, TYPES, HD, HS) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    TYPED *d = vd;                                             \
+    TYPES *n = vn;                                             \
+    ARMVectorReg tmp;                                          \
+    if (unlikely(vn - vd < opr_sz)) {                          \
+        n = memcpy(&tmp, n, opr_sz / 2);                       \
+    }                                                          \
+    for (i = 0; i < opr_sz / sizeof(TYPED); i++) {             \
+        d[HD(i)] = n[HS(i)];                                   \
+    }                                                          \
+}
+
+DO_UNPK(sve_sunpk_h, int16_t, int8_t, H2, H1)
+DO_UNPK(sve_sunpk_s, int32_t, int16_t, H4, H2)
+DO_UNPK(sve_sunpk_d, int64_t, int32_t, , H4)
+
+DO_UNPK(sve_uunpk_h, uint16_t, uint8_t, H2, H1)
+DO_UNPK(sve_uunpk_s, uint32_t, uint16_t, H4, H2)
+DO_UNPK(sve_uunpk_d, uint64_t, uint32_t, , H4)
+
+#undef DO_UNPK
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 07a5eac092..3724f6290c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1819,6 +1819,119 @@ static void trans_EXT(DisasContext *s, arg_EXT *a, uint32_t insn)
     tcg_gen_gvec_3_ool(d, n, m, vsz, vsz, n_ofs, gen_helper_sve_ext);
 }
 
+/*
+ *** SVE Permute - Unpredicated Group
+ */
+
+static void trans_DUP_s(DisasContext *s, arg_DUP_s *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_dup_i64(a->esz, vec_full_reg_offset(s, a->rd),
+                         vsz, vsz, cpu_reg_sp(s, a->rn));
+}
+
+static void trans_DUP_x(DisasContext *s, arg_DUP_x *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned dofs = vec_full_reg_offset(s, a->rd);
+    unsigned esz, index;
+
+    if ((a->imm & 0x1f) == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    esz = ctz32(a->imm);
+    index = a->imm >> (esz + 1);
+
+    if ((index << esz) < vsz) {
+        unsigned nofs = vec_reg_offset(s, a->rn, index, esz);
+        tcg_gen_gvec_dup_mem(esz, dofs, nofs, vsz, vsz);
+    } else {
+        tcg_gen_gvec_dup64i(dofs, vsz, vsz, 0);
+    }
+}
+
+static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
+{
+    typedef void gen_insr(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv_i32);
+    static gen_insr * const fns[4] = {
+        gen_helper_sve_insr_b, gen_helper_sve_insr_h,
+        gen_helper_sve_insr_s, gen_helper_sve_insr_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_ptr t_zd = tcg_temp_new_ptr();
+    TCGv_ptr t_zn = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, a->rn));
+
+    fns[a->esz](t_zd, t_zn, val, desc);
+
+    tcg_temp_free_ptr(t_zd);
+    tcg_temp_free_ptr(t_zn);
+    tcg_temp_free_i32(desc);
+}
+
+static void trans_INSR_f(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    tcg_gen_ld_i64(t, cpu_env, vec_reg_offset(s, a->rm, 0, MO_64));
+    do_insr_i64(s, a, t);
+    tcg_temp_free_i64(t);
+}
+
+static void trans_INSR_r(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_insr_i64(s, a, cpu_reg(s, a->rm));
+}
+
+static void trans_REV_v(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_2 * const fns[4] = {
+        gen_helper_sve_rev_b, gen_helper_sve_rev_h,
+        gen_helper_sve_rev_s, gen_helper_sve_rev_d
+    };
+    unsigned vsz = vec_full_reg_size(s);
+
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vsz, vsz, 0, fns[a->esz]);
+}
+
+static void trans_TBL(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
+        gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
+    };
+    unsigned vsz = vec_full_reg_size(s);
+
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vsz, vsz, 0, fns[a->esz]);
+}
+
+static void trans_UNPK(DisasContext *s, arg_UNPK *a, uint32_t insn)
+{
+    static gen_helper_gvec_2 * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_sve_sunpk_h, gen_helper_sve_uunpk_h },
+        { gen_helper_sve_sunpk_s, gen_helper_sve_uunpk_s },
+        { gen_helper_sve_sunpk_d, gen_helper_sve_uunpk_d },
+    };
+    unsigned vsz = vec_full_reg_size(s);
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn) + (a->h ? vsz / 2 : 0),
+                       vsz, vsz, 0, fns[a->esz][a->u]);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5e3a9839d4..8af47ad27b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -24,6 +24,7 @@
 
 %imm4_16_p1	16:4 !function=plus1
 %imm6_22_5	22:1 5:5
+%imm7_22_16	22:2 16:5
 %imm8_16_10	16:5 10:3
 %imm9_16_10	16:s6 10:3
 %preg4_5	5:4
@@ -85,7 +86,9 @@
 @pd_pg_pn_pm_s	........ . s:1 .. rm:4 .. pg:4 . rn:4 . rd:4	&rprr_s
 
 # Three operand, vector element size
-@rd_rn_rm	........ esz:2 . rm:5  ... ...  rn:5 rd:5	&rrr_esz
+@rd_rn_rm	........ esz:2 . rm:5 ... ... rn:5 rd:5		&rrr_esz
+@rdn_rm		........ esz:2 ...... ...... rm:5 rd:5 \
+		&rrr_esz rn=%reg_movprfx
 
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm	........ ... rm:5 .... imm:2 rn:5 rd:5		&rrri
@@ -370,6 +373,30 @@ CPY_z_i		00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
 EXT		00000101 001 ..... 000 ... rm:5 rd:5 \
 		&rrri rn=%reg_movprfx imm=%imm8_16_10
 
+### SVE Permute - Unpredicated Group
+
+# SVE broadcast general register
+DUP_s		00000101 .. 1 00000 001110 ..... .....		@rd_rn
+
+# SVE broadcast indexed element
+DUP_x		00000101 .. 1 ..... 001000 rn:5 rd:5 \
+		&rri imm=%imm7_22_16
+
+# SVE insert SIMD&FP scalar register
+INSR_f		00000101 .. 1 10100 001110 ..... .....		@rdn_rm
+
+# SVE insert general register
+INSR_r		00000101 .. 1 00100 001110 ..... .....		@rdn_rm
+
+# SVE reverse vector elements
+REV_v		00000101 .. 1 11000 001110 ..... .....		@rd_rn
+
+# SVE vector table lookup
+TBL		00000101 .. 1 ..... 001100 ..... .....		@rd_rn_rm
+
+# SVE unpack vector elements
+UNPK		00000101 esz:2 1100 u:1 h:1 001110 rn:5 rd:5
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

