Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp744490lfr;
        Fri, 16 Apr 2021 14:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybV7N5/Wnj8NrxHuAfP7tSmL/aX/qhCq0UXktxip4Gw1g66qCHFx6NCTnEkW1On4ozJhes
X-Received: by 2002:a05:6e02:1d06:: with SMTP id i6mr6250379ila.165.1618608932664;
        Fri, 16 Apr 2021 14:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608932; cv=none;
        d=google.com; s=arc-20160816;
        b=xdxCOU8MX0nr1mFTVMIkKea+ZeYAeMSwgzFMzu1QCJgcEVboKnz5v9fB3DXugyGgLM
         O6tbvGMtHZ0b5fGiAVNlxwcclz1CveYm13b5Go72oMimsWIE4yLY8XUh6RP5CFTCX6Ja
         meTw1+fcagcMjgJmpmbdJKsjXPRpkHj6l50hrqVxkAqWbwWpKg+5aS9Elv79osxBwtZe
         ms+WAWzEobg8YFpxfSPtEOC3N0IF/dhgmdJIi5icsZg5p+hbiz/W8MEL0tzXKl1qj3Nu
         rFfcSGyVaqBa1QK6vQYe0gJsIXdQ/1ttcZv9vZHcJ0DQqJMIRlj1ZLXxKeUhwXirGmf8
         t1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VnUeaFstfauSS4JTjM/wMyZDfm9bVsWwY847CCsEpAM=;
        b=ymhKFNxgWJaqaXZT9qjm5CBFBfxjcjWaL3CtvyAvg+faloor85O2tUfyb1SHEZRbgG
         b5U72bLdRbX5OPvSdtzuyus2EXvhkCW0XX03G4ymNQYDVEin4PoFmMHeua1C7qdp15X5
         jxOyj6LSf5ULowNfKzh9P+sVKUkXXVklxI2XTHdjf9hQJHHefSzHxKJ4dNFTCxwhvoge
         CzaBJ0czSMzxZIkHeM5EJbsfIPoWMsb78jMmSCL3W3XPk0WoHWYHbl5ryS2/U4+VxVq8
         rkplUEW0AmzNgm50y1eTssPMBA5okTZrpIsdfFYv30ayGGjKvDch3+OadAbbdROv2WnN
         /LfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ed/ttoiq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si6835104ilc.120.2021.04.16.14.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ed/ttoiq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXW7f-00038B-UK
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcX-0004q5-Cg
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcR-0001IQ-6W
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso10050720pjg.2
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VnUeaFstfauSS4JTjM/wMyZDfm9bVsWwY847CCsEpAM=;
 b=ed/ttoiqFSyz12vMVfDNeHnFje2bcfafpdVe/gbuzxmW98wiU/nqPUouzMQqeMieZX
 w09GRsMieu4tBOGvPcbVEUPI4yg3hRU5MeiRljvvoobQJ/KzIE+MlubtJKKfUZ0hEzmw
 Um4hLqrn80JhpKKTtLPqkiboU00C302StTDOy6uRXmPmMVjOt8ebquRo+s+sLuFElWxU
 YhMM8WoGmKrLbfoFpcuMfByhorpiqbQ5CgDfby/3tBguSES7QpXpfVOqoyVl3j0A8n6F
 Za1DVcwJ+j49lGaXUGuMFLxsy6Gc4QnX4hEJ16H3ZZHthfwsIcjggctyzFS+Sao2ruZ5
 Qx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VnUeaFstfauSS4JTjM/wMyZDfm9bVsWwY847CCsEpAM=;
 b=Mwm1bZophWSUmkaAVFnl6GbuV2kEIXdzfN6RmFkYcv6LF5Hfo78b6i/1kx4rjOKyK2
 CfsHYMGA/obQNYLHPE6PDBBdAzw+C73R0V3iOCMR4+Uf1bG7YdkZo3zQdzlZBpC07nRn
 FRz7+dwQk2M3cBqR3fVpu08wtiAyLIDEFKKUC8a13CC1rkiGIHxJp16wuvy+GFdChGl1
 55CsLj6ab1E792/LMQ39I+i3XsLJKc2EdzIQSljxM73s4u6lp/OYkQHaVe5PZzMxhVyB
 y3wYIhxir2Ji3bJkz1P9ZcvlQYL6ROR5EYUPDJsYUXY9hGmCZYu6xy8t066ya+05oc9M
 1jtg==
X-Gm-Message-State: AOAM530v73EetI4MDae6zaP+BiHfM5d7u2MTW66FsYZ7Rn8tpbam3LkJ
 yfg1ppNIEhOj4V+g0VChwJdxMg==
X-Received: by 2002:a17:902:f212:b029:e9:56f2:18ba with SMTP id
 m18-20020a170902f212b02900e956f218bamr11369724plc.75.1618606993928; 
 Fri, 16 Apr 2021 14:03:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 32/81] target/arm: Implement SVE2 bitwise ternary operations
Date: Fri, 16 Apr 2021 14:01:51 -0700
Message-Id: <20210416210240.1591291-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u2q0jgvQYlra

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   6 ++
 target/arm/sve.decode      |  12 +++
 target/arm/sve_helper.c    |  50 +++++++++
 target/arm/translate-sve.c | 213 +++++++++++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5bf9fdc7a3..df617e3351 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2543,3 +2543,9 @@ DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_eor3, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_bsl2n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_nbsl, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f365907518..bf673e2f16 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -124,6 +124,10 @@
 @rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
                 &rrrr_esz ra=%reg_movprfx
 
+# Four operand with unused vector element size
+@rdn_ra_rm_e0   ........ ... rm:5 ... ... ra:5 rd:5 \
+                &rrrr_esz esz=0 rn=%reg_movprfx
+
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
 
@@ -379,6 +383,14 @@ ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 
+# SVE2 bitwise ternary operations
+EOR3            00000100 00 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
+BSL             00000100 00 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+BCAX            00000100 01 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
+BSL1N           00000100 01 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+BSL2N           00000100 10 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+NBSL            00000100 11 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+
 ### SVE Index Generation Group
 
 # SVE index generation (immediate start, immediate increment)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fb38f2c57e..b0598f9097 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6792,3 +6792,53 @@ DO_ST1_ZPZ_D(dd_be, zd, MO_64)
 
 #undef DO_ST1_ZPZ_S
 #undef DO_ST1_ZPZ_D
+
+void HELPER(sve2_eor3)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = n[i] ^ m[i] ^ k[i];
+    }
+}
+
+void HELPER(sve2_bcax)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = n[i] ^ (m[i] & ~k[i]);
+    }
+}
+
+void HELPER(sve2_bsl1n)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = (~n[i] & k[i]) | (m[i] & ~k[i]);
+    }
+}
+
+void HELPER(sve2_bsl2n)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = (n[i] & k[i]) | (~m[i] & ~k[i]);
+    }
+}
+
+void HELPER(sve2_nbsl)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ~((n[i] & k[i]) | (m[i] & ~k[i]));
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 97e113ceec..ab290b9025 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -217,6 +217,17 @@ static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
             vec_full_reg_offset(s, rm), vsz, vsz);
 }
 
+/* Invoke a vector expander on four Zregs.  */
+static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
+                             int esz, int rd, int rn, int rm, int ra)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    gvec_fn(esz, vec_full_reg_offset(s, rd),
+            vec_full_reg_offset(s, rn),
+            vec_full_reg_offset(s, rm),
+            vec_full_reg_offset(s, ra), vsz, vsz);
+}
+
 /* Invoke a vector move on two Zregs.  */
 static bool do_mov_z(DisasContext *s, int rd, int rn)
 {
@@ -329,6 +340,208 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_fn(s, a, tcg_gen_gvec_andc);
 }
 
+static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzzz(s, fn, a->esz, a->rd, a->rn, a->rm, a->ra);
+    }
+    return true;
+}
+
+static void gen_eor3_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_xor_i64(d, n, m);
+    tcg_gen_xor_i64(d, d, k);
+}
+
+static void gen_eor3_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                         TCGv_vec m, TCGv_vec k)
+{
+    tcg_gen_xor_vec(vece, d, n, m);
+    tcg_gen_xor_vec(vece, d, d, k);
+}
+
+static void gen_eor3(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_eor3_i64,
+        .fniv = gen_eor3_vec,
+        .fno = gen_helper_sve2_eor3,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_EOR3(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_eor3);
+}
+
+static void gen_bcax_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_andc_i64(d, m, k);
+    tcg_gen_xor_i64(d, d, n);
+}
+
+static void gen_bcax_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                         TCGv_vec m, TCGv_vec k)
+{
+    tcg_gen_andc_vec(vece, d, m, k);
+    tcg_gen_xor_vec(vece, d, d, n);
+}
+
+static void gen_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_bcax_i64,
+        .fniv = gen_bcax_vec,
+        .fno = gen_helper_sve2_bcax,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_BCAX(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bcax);
+}
+
+static void gen_bsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                    uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    /* BSL differs from the generic bitsel in argument ordering. */
+    tcg_gen_gvec_bitsel(vece, d, a, n, m, oprsz, maxsz);
+}
+
+static bool trans_BSL(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bsl);
+}
+
+static void gen_bsl1n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_andc_i64(n, k, n);
+    tcg_gen_andc_i64(m, m, k);
+    tcg_gen_or_i64(d, n, m);
+}
+
+static void gen_bsl1n_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                          TCGv_vec m, TCGv_vec k)
+{
+    if (TCG_TARGET_HAS_bitsel_vec) {
+        tcg_gen_not_vec(vece, n, n);
+        tcg_gen_bitsel_vec(vece, d, k, n, m);
+    } else {
+        tcg_gen_andc_vec(vece, n, k, n);
+        tcg_gen_andc_vec(vece, m, m, k);
+        tcg_gen_or_vec(vece, d, n, m);
+    }
+}
+
+static void gen_bsl1n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                      uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_bsl1n_i64,
+        .fniv = gen_bsl1n_vec,
+        .fno = gen_helper_sve2_bsl1n,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_BSL1N(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bsl1n);
+}
+
+static void gen_bsl2n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    /*
+     * Z[dn] = (n & k) | (~m & ~k)
+     *       =         | ~(m | k)
+     */
+    tcg_gen_and_i64(n, n, k);
+    if (TCG_TARGET_HAS_orc_i64) {
+        tcg_gen_or_i64(m, m, k);
+        tcg_gen_orc_i64(d, n, m);
+    } else {
+        tcg_gen_nor_i64(m, m, k);
+        tcg_gen_or_i64(d, n, m);
+    }
+}
+
+static void gen_bsl2n_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                          TCGv_vec m, TCGv_vec k)
+{
+    if (TCG_TARGET_HAS_bitsel_vec) {
+        tcg_gen_not_vec(vece, m, m);
+        tcg_gen_bitsel_vec(vece, d, k, n, m);
+    } else {
+        tcg_gen_and_vec(vece, n, n, k);
+        tcg_gen_or_vec(vece, m, m, k);
+        tcg_gen_orc_vec(vece, d, n, m);
+    }
+}
+
+static void gen_bsl2n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                      uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_bsl2n_i64,
+        .fniv = gen_bsl2n_vec,
+        .fno = gen_helper_sve2_bsl2n,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_BSL2N(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bsl2n);
+}
+
+static void gen_nbsl_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_and_i64(n, n, k);
+    tcg_gen_andc_i64(m, m, k);
+    tcg_gen_nor_i64(d, n, m);
+}
+
+static void gen_nbsl_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                          TCGv_vec m, TCGv_vec k)
+{
+    tcg_gen_bitsel_vec(vece, d, k, n, m);
+    tcg_gen_not_vec(vece, d, d);
+}
+
+static void gen_nbsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_nbsl_i64,
+        .fniv = gen_nbsl_vec,
+        .fno = gen_helper_sve2_nbsl,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_nbsl);
+}
+
 /*
  *** SVE Integer Arithmetic - Unpredicated Group
  */
-- 
2.25.1

