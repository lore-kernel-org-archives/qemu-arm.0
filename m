Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955857lfg;
        Tue, 9 Mar 2021 08:22:03 -0800 (PST)
X-Received: by 2002:aca:ad87:: with SMTP id w129mr3529554oie.63.1615306923569;
        Tue, 09 Mar 2021 08:22:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306923; cv=none;
        d=google.com; s=arc-20160816;
        b=sDsS4RxISxoL9Ay2MQrtNqGEsvq+onSbcPcvnOGAYDH5sppmeDl8OWEW0AWfs3tKRQ
         E5U7WYbsn2FY28UmiooTE8CuR8oERdkfV03qaWvMjd51AMLV1j2zLJ+i/nmq7Qf2KzBX
         CB+GmSRVGHXVHRFob24XJX90qA2hWC6WJ5G/2/UYNYGV6vkmrA0NoGN9AjevuA6tu7Dl
         gEnuED7LJ8eGeOD8+JhhIFr+3bmdC55U4sSQ9+byvN+iC9eX+MVcHeUqwbgCJH6Praff
         5yJ73exJiNzG8NTNUBZlrMRdlPjXHBw8TAzwBppb4v3Eq5YhWgiZ1/3h87d9hvwAtiMR
         egGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=adanJyUxqOWc9Dhq8EIk3bW7dNNKqybJfKCeN5b9hiE=;
        b=TRQI2SUgLSftNTlXl7b2NA0phOuiEmpk6qLMpbEAqvcNF1ThbDft2mCf7cpzqtX/Uh
         /fxcenRL9sQM17z348E/6suf6X9uPLzAMGBhUGhEr2lcxD+fiuoyR/f3yq3NM7Q9A9st
         WdGzn92WLbQWrGOU3NJCz5QmYLZNDiEsiv8r7QJz2eYIvjQzwhGgybQUNhtrwZCg3SCV
         H3+h3O4MOHCkukO4Jqm/9NLzCeo9DdT+PwBQIq6LiBtC56EKKpEPgWEfrt3ypEFOaeXR
         6Pkz4aOeLYZfC02eteZPkVLQpHyDYZfKQInQ4SFDkQhDoYai0jKCYmoZo4AkkA42xa+t
         qfmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRzMroVD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e20sor1549780otr.71.2021.03.09.08.22.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRzMroVD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=adanJyUxqOWc9Dhq8EIk3bW7dNNKqybJfKCeN5b9hiE=;
        b=rRzMroVDH+kXWy/hu6PDgmO5Gc6ZYGbJznpGLle8WV9D9FkNySPcyOIFR+vM1BT8MI
         vEgiPlqczHEXRdn0UnRCDiGNVALrC+py3kMg989Qfx6geFW4oOZAvT5wfshuJe7z2VRi
         kMQ0OTg6DqCvhCh+hfXn5NcFRcIyfDji+ZAuRd8XrVM8NEHtWcifSQPkdcjuFzbWMTcf
         4h8gjpE/lSL8I6tUtW1J16YpStq1HsR/0qudmc4+TGPzdu+YCpMCOiPWlnmcUkl9cIct
         b0hxellvspd1qrHMTEMW7Qi17tu7faxpKSuAnNxMiTPvldDAQRP3bDwz32blqnIQTXFc
         5eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=adanJyUxqOWc9Dhq8EIk3bW7dNNKqybJfKCeN5b9hiE=;
        b=tht6fwet8MgTEBrTVZN2+vb+bcVfLdWDKvbns6GpaHBotVnN5IWXIhiaXOrECgM+pc
         1VzmVazg6etb+dxbPp/A3c+WRuJuN5VrNEZc5orWP/3NpTKTdAoSY8BBxPNrKcOvn2Uk
         hSnPyawejleZagq11m307NohaEB11A9AdxkgCrWKG5SGR4/UUceTMF9x/inZpaXVGEEH
         wqrGVtf3x3IFS3BVY3IDdsMmbC7Q0ctzMRHpWH3IHBfRVkRnoQCTNPjrkP5SLLHuKrJM
         t74rVl2qHNdFSc9/XIpcnz2DdpK6a9cGqk6ShIG65KLDw5Q53D+7bLOTgnqY7EVFOxZj
         X3CQ==
X-Gm-Message-State: AOAM530opmRaLnb6OnQwvaMEqf26ZDULeUs/XgedYGEzvO1wKSwKvIq0
	5PwPK9AS/0nwgiCnsPvEqQbRcoUr
X-Google-Smtp-Source: ABdhPJzJ52FZ37P0Qpbz/n+DVPbwW08fEKV9skazsQVcAccNchL0xu0n0RRPxc9U0NWbw3eP5n+TPg==
X-Received: by 2002:a05:6830:1304:: with SMTP id p4mr24459350otq.185.1615306923128;
        Tue, 09 Mar 2021 08:22:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 43/78] target/arm: Implement SVE2 XAR
Date: Tue,  9 Mar 2021 08:20:06 -0800
Message-Id: <20210309162041.23124-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mwJf4W9bKRU+

In addition, use the same vector generator interface for AdvSIMD.
This fixes a bug in which the AdvSIMD insn failed to clear the
high bits of the SVE register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   4 ++
 target/arm/helper.h        |   2 +
 target/arm/translate-a64.h |   3 ++
 target/arm/sve.decode      |   4 ++
 target/arm/sve_helper.c    |  39 ++++++++++++++
 target/arm/translate-a64.c |  25 ++-------
 target/arm/translate-sve.c | 104 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  12 +++++
 8 files changed, 172 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 507a2fea8e..28b8f00201 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2558,6 +2558,10 @@ DEF_HELPER_FLAGS_5(sve2_histcnt_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_4(sve2_histseg, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_xar_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_xar_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_xar_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 6bb0b0ddc0..23a7ec5638 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -953,6 +953,8 @@ DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3668b671dd..cdf2b2d1be 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -122,5 +122,8 @@ bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t rm_ofs, int64_t shift,
+                  uint32_t opr_sz, uint32_t max_sz);
 
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8f501a083c..7645587469 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -65,6 +65,7 @@
 &rr_dbm         rd rn dbm
 &rrri           rd rn rm imm
 &rri_esz        rd rn imm esz
+&rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
@@ -384,6 +385,9 @@ ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 
+XAR             00000100 .. 1 ..... 001 101 rm:5  rd:5   &rrri_esz \
+                rn=%reg_movprfx esz=%tszimm16_esz imm=%tszimm16_shr
+
 # SVE2 bitwise ternary operations
 EOR3            00000100 00 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
 BSL             00000100 00 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 88a5e64277..0a02deef70 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7225,3 +7225,42 @@ void HELPER(sve2_histseg)(void *vd, void *vn, void *vm, uint32_t desc)
         *(uint64_t *)(vd + i + 8) = out1;
     }
 }
+
+void HELPER(sve2_xar_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    int shl = 8 - shr;
+    uint64_t mask = dup_const(MO_8, 0xff >> shr);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        uint64_t t = n[i] ^ m[i];
+        d[i] = ((t >> shr) & mask) | ((t << shl) & ~mask);
+    }
+}
+
+void HELPER(sve2_xar_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    int shl = 16 - shr;
+    uint64_t mask = dup_const(MO_16, 0xffff >> shr);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        uint64_t t = n[i] ^ m[i];
+        d[i] = ((t >> shr) & mask) | ((t << shl) & ~mask);
+    }
+}
+
+void HELPER(sve2_xar_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    int shr = simd_data(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ror32(n[i] ^ m[i], shr);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b591f096df..491519fa6c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14355,8 +14355,6 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
     int imm6 = extract32(insn, 10, 6);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    TCGv_i64 tcg_op1, tcg_op2, tcg_res[2];
-    int pass;
 
     if (!dc_isar_feature(aa64_sha3, s)) {
         unallocated_encoding(s);
@@ -14367,25 +14365,10 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_op1 = tcg_temp_new_i64();
-    tcg_op2 = tcg_temp_new_i64();
-    tcg_res[0] = tcg_temp_new_i64();
-    tcg_res[1] = tcg_temp_new_i64();
-
-    for (pass = 0; pass < 2; pass++) {
-        read_vec_element(s, tcg_op1, rn, pass, MO_64);
-        read_vec_element(s, tcg_op2, rm, pass, MO_64);
-
-        tcg_gen_xor_i64(tcg_res[pass], tcg_op1, tcg_op2);
-        tcg_gen_rotri_i64(tcg_res[pass], tcg_res[pass], imm6);
-    }
-    write_vec_element(s, tcg_res[0], rd, 0, MO_64);
-    write_vec_element(s, tcg_res[1], rd, 1, MO_64);
-
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_res[0]);
-    tcg_temp_free_i64(tcg_res[1]);
+    gen_gvec_xar(MO_64, vec_full_reg_offset(s, rd),
+                 vec_full_reg_offset(s, rn),
+                 vec_full_reg_offset(s, rm), imm6, 16,
+                 vec_full_reg_size(s));
 }
 
 /* Crypto three-reg imm2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index acda88cb2c..cad61f4577 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -340,6 +340,110 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_fn(s, a, tcg_gen_gvec_andc);
 }
 
+static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    uint64_t mask = dup_const(MO_8, 0xff >> sh);
+
+    tcg_gen_xor_i64(t, n, m);
+    tcg_gen_shri_i64(d, t, sh);
+    tcg_gen_shli_i64(t, t, 8 - sh);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_andi_i64(t, t, ~mask);
+    tcg_gen_or_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_xar16_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    uint64_t mask = dup_const(MO_16, 0xffff >> sh);
+
+    tcg_gen_xor_i64(t, n, m);
+    tcg_gen_shri_i64(d, t, sh);
+    tcg_gen_shli_i64(t, t, 16 - sh);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_andi_i64(t, t, ~mask);
+    tcg_gen_or_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_xar_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, int32_t sh)
+{
+    tcg_gen_xor_i32(d, n, m);
+    tcg_gen_rotri_i32(d, d, sh);
+}
+
+static void gen_xar_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    tcg_gen_xor_i64(d, n, m);
+    tcg_gen_rotri_i64(d, d, sh);
+}
+
+static void gen_xar_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                        TCGv_vec m, int64_t sh)
+{
+    tcg_gen_xor_vec(vece, d, n, m);
+    tcg_gen_rotri_vec(vece, d, d, sh);
+}
+
+void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t rm_ofs, int64_t shift,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop[] = { INDEX_op_rotli_vec, 0 };
+    static const GVecGen3i ops[4] = {
+        { .fni8 = gen_xar8_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fni8 = gen_xar16_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_xar_i32,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_xar_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_gvec_xar_d,
+          .opt_opc = vecop,
+          .vece = MO_64 }
+    };
+    int esize = 8 << vece;
+
+    /* The SVE2 range is 1 .. esize; the AdvSIMD range is 0 .. esize-1. */
+    tcg_debug_assert(shift >= 0);
+    tcg_debug_assert(shift <= esize);
+    shift &= esize - 1;
+
+    if (shift == 0) {
+        /* xar with no rotate devolves to xor. */
+        tcg_gen_gvec_xor(vece, rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz);
+    } else {
+        tcg_gen_gvec_3i(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz,
+                        shift, &ops[vece]);
+    }
+}
+
+static bool trans_XAR(DisasContext *s, arg_rrri_esz *a)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gen_gvec_xar(a->esz, vec_full_reg_offset(s, a->rd),
+                     vec_full_reg_offset(s, a->rn),
+                     vec_full_reg_offset(s, a->rm), a->imm, vsz, vsz);
+    }
+    return true;
+}
+
 static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 19006f50f7..a3d80ecad0 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2253,3 +2253,15 @@ void HELPER(gvec_umulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_xar_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ror64(n[i] ^ m[i], shr);
+    }
+    clear_tail(d, opr_sz * 8, simd_maxsz(desc));
+}
-- 
2.25.1
