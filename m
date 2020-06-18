Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1272237lfm;
        Wed, 17 Jun 2020 21:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp3HmOX7l8dqosZBlpoLJyaeOXPGp5ugR5Zk8irKFiQKODY8EIaSR1vBMmZbjAjxRBRiPy
X-Received: by 2002:a25:8284:: with SMTP id r4mr3343776ybk.351.1592455713580;
        Wed, 17 Jun 2020 21:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455713; cv=none;
        d=google.com; s=arc-20160816;
        b=0s4JADeFa/Z00F9aZeU3SovR/v/THYfb+O8p7jkjjmdI+gBHO/jcJGKBc68Zq0YeGk
         d2ngJSL1hz37Iu6wdurMHIP2fRtLDE4uwM/wSxYTav5olBpnNKr8DKdgbdMtZb4Z1744
         WJrcanGWadxINDqMv8nX1Cc4ywcPiIKIRIrQ8TLxaG4kIi6veLaYn3n8LbAEjh99+SGJ
         H3OwkAGcTDwgG01cYb0n+//yvjpGZWmbsAiv0T8xGiB/vvwlOC97Lmr9UnW/eoxMlYL6
         nhlskLgWgyx84ullrvYSa2OdPtUTc3NrKTJjbGdbgmtfHLxXVTEZNBF757lnN8EHVI7k
         ucPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Qb+FUV2u5aZNttZFTTxRMgR8jBZvyMgSBRxaVrQ0vLo=;
        b=HbhhckpFiW92ZYVtcKlY9+F0qKE3CCJ7NyXESaVqWsgzp7wKUq3OZt4Rik745aMg+9
         wQe51EemQVH+WpBh/B1HckeOL5eKCp/wDasMpMQDWTCbiFaiRq3gaHvY+Jp6xPuXLk8t
         l9gCZTq29CrB1ey+Mmj/NoW7FwKgpuHDQ/opzLTsAbvr8turGqEjEBeqbf2d7wYkFirA
         M6fJpk9izV/pCsVCB38Y1Fs2h0D3qU1zu6sTaRnCjTuwp2zibl2QFg2arSSbm9OfC4kw
         eOecxLHTj6u0+NMTM6Ok3h6Ym1V6kj53vYXIWr/ORr2VZbcFuGLDx2xXyPlhFWY00sEX
         e0cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k8qaOytO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si1391750ybn.356.2020.06.17.21.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k8qaOytO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmTY-0002Lw-SY
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBP-00089s-DE
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:47 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBN-0002uX-1Q
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id d8so1897925plo.12
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qb+FUV2u5aZNttZFTTxRMgR8jBZvyMgSBRxaVrQ0vLo=;
 b=k8qaOytO4E/0cWGgkCYMXqL1a/T8dUtAzsNp7sAzZJpBMrdDpXQ5tGRkPTbdXPmisZ
 AEDMzkX/vrkKu6SZrhYo+w5MHzvq4W2D9eKc+w1LddFKdUt+TbTDZCM2A+Qlv7YufVbU
 tZBWGOtAt5eK5Coz0rTqkacTYqBuHv8Tr/S+nq/7zrKx+VOv8SUFvSv+qa+2HKN6s09f
 MeY4UOY2dT4XltO1d9g5MoLjclupc/zmv0Dr5Uk+HHFVkZXEzoIy9q9AOgSG1O7J6QdB
 i6sSYBCfGUq+1L6wkeZS9Z6ezJxIsDqFhIFzkoEsez3qten9GvyqVbleeJjIifIl6LyL
 4uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qb+FUV2u5aZNttZFTTxRMgR8jBZvyMgSBRxaVrQ0vLo=;
 b=WDhoI6BJEsWt2wjNtJxNJVHAQA1cIY+2PSRJuMa4AUz3ke2FEBjabmbzBluEQWl/lr
 0BUYQDj8acwzv6htgIlpftayoe+16+16kySZ3igpTxMxBoCE6Kp+cWJ9t8FRegciECqw
 +LYutBSboCNoWrlTyfgsf3wdGKbW0+eZp4uszHn6hvOGUQWkrl+Tb9FoTzvXTUo9Hfen
 9qaBYmlgdhTTPvOdcuGyki692rqMoYZ7mCqgjMUMmBsWB5XhPprsu6ZTHSY1wRMibho9
 Qpq0oPmws+wfbYWVa54kKm1XzEF+DtWTnQ6tHLEShGXVRecwB957LdYAuE4BZvRY+i/0
 lfqw==
X-Gm-Message-State: AOAM531gU6gHspzGZ+0BajuPEZVtORw0E6Iaptf+4/T2lVyZ2fwjFdR4
 0THZFWuH+W13T8nGnuHr211LYQ==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr2214940plr.39.1592454583772; 
 Wed, 17 Jun 2020 21:29:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 041/100] target/arm: Implement SVE2 SHRN, RSHRN
Date: Wed, 17 Jun 2020 21:25:45 -0700
Message-Id: <20200618042644.1685561-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ny9R/PD0cv6j

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix typo in gen_shrnb_vec (laurent desnogues)
---
 target/arm/helper-sve.h    |  16 ++++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  45 ++++++++++-
 target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
 4 files changed, 227 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index cad45b0f16..3a7d7ff66d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1956,6 +1956,22 @@ DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_shrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_shrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_rshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_rshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 54657d996a..7cc4b6cc43 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1285,6 +1285,14 @@ UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
 SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
 SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
 
+## SVE2 bitwise shift right narrow
+
+# Bit 23 == 0 is handled by esz > 0 in the translator.
+SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
+SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
+RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
+RSHRNT          01000101 .. 1 ..... 00 0111 ..... .....  @rd_rn_tszimm_shr
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 27ba4e81fb..9b3d0d2ddd 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1882,12 +1882,53 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
 DO_ZPZI(sve_asrd_s, int32_t, H1_4, DO_ASRD)
 DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 
-#undef DO_SHR
-#undef DO_SHL
 #undef DO_ASRD
 #undef DO_ZPZI
 #undef DO_ZPZI_D
 
+#define DO_SHRNB(NAME, TYPEW, TYPEN, OP) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
+{                                                            \
+    intptr_t i, opr_sz = simd_oprsz(desc);                   \
+    int shift = simd_data(desc);                             \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {            \
+        TYPEW nn = *(TYPEW *)(vn + i);                       \
+        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, shift);           \
+    }                                                        \
+}
+
+#define DO_SHRNT(NAME, TYPEW, TYPEN, HW, HN, OP)                  \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)              \
+{                                                                 \
+    intptr_t i, opr_sz = simd_oprsz(desc);                        \
+    int shift = simd_data(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                 \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                        \
+        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, shift);   \
+    }                                                             \
+}
+
+DO_SHRNB(sve2_shrnb_h, uint16_t, uint8_t, DO_SHR)
+DO_SHRNB(sve2_shrnb_s, uint32_t, uint16_t, DO_SHR)
+DO_SHRNB(sve2_shrnb_d, uint64_t, uint32_t, DO_SHR)
+
+DO_SHRNT(sve2_shrnt_h, uint16_t, uint8_t, H1_2, H1, DO_SHR)
+DO_SHRNT(sve2_shrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_SHR)
+DO_SHRNT(sve2_shrnt_d, uint64_t, uint32_t,     , H1_4, DO_SHR)
+
+#define DO_RSHR(x, sh) ((x >> sh) + ((x >> (sh - 1)) & 1))
+
+DO_SHRNB(sve2_rshrnb_h, uint16_t, uint8_t, DO_RSHR)
+DO_SHRNB(sve2_rshrnb_s, uint32_t, uint16_t, DO_RSHR)
+DO_SHRNB(sve2_rshrnb_d, uint64_t, uint32_t, DO_RSHR)
+
+DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, DO_RSHR)
+DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_RSHR)
+DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, DO_RSHR)
+
+#undef DO_SHRNB
+#undef DO_SHRNT
+
 /* Fully general four-operand expander, controlled by a predicate.
  */
 #define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 532db579a5..81e44bb818 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6264,6 +6264,166 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_narrow_extract(s, a, ops);
 }
 
+static bool do_sve2_shr_narrow(DisasContext *s, arg_rri_esz *a,
+                               const GVecGen2i ops[3])
+{
+    if (a->esz < 0 || a->esz > MO_32 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    assert(a->imm > 0 && a->imm <= (8 << a->esz));
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2i(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        vsz, vsz, a->imm, &ops[a->esz]);
+    }
+    return true;
+}
+
+static void gen_shrnb_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int shr)
+{
+    int halfbits = 4 << vece;
+    uint64_t mask = dup_const(vece, MAKE_64BIT_MASK(0, halfbits));
+
+    tcg_gen_shri_i64(d, n, shr);
+    tcg_gen_andi_i64(d, d, mask);
+}
+
+static void gen_shrnb16_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnb_i64(MO_16, d, n, shr);
+}
+
+static void gen_shrnb32_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnb_i64(MO_32, d, n, shr);
+}
+
+static void gen_shrnb64_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnb_i64(MO_64, d, n, shr);
+}
+
+static void gen_shrnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
+
+    tcg_gen_shri_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, mask);
+    tcg_gen_and_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = { INDEX_op_shri_vec, 0 };
+    static const GVecGen2i ops[3] = {
+        { .fni8 = gen_shrnb16_i64,
+          .fniv = gen_shrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_shrnb_h,
+          .vece = MO_16 },
+        { .fni8 = gen_shrnb32_i64,
+          .fniv = gen_shrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_shrnb_s,
+          .vece = MO_32 },
+        { .fni8 = gen_shrnb64_i64,
+          .fniv = gen_shrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_shrnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_shrnt_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int shr)
+{
+    int halfbits = 4 << vece;
+    uint64_t mask = dup_const(vece, MAKE_64BIT_MASK(0, halfbits));
+
+    tcg_gen_shli_i64(n, n, halfbits - shr);
+    tcg_gen_andi_i64(n, n, ~mask);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_or_i64(d, d, n);
+}
+
+static void gen_shrnt16_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnt_i64(MO_16, d, n, shr);
+}
+
+static void gen_shrnt32_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnt_i64(MO_32, d, n, shr);
+}
+
+static void gen_shrnt64_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    tcg_gen_shri_i64(n, n, shr);
+    tcg_gen_deposit_i64(d, d, n, 32, 32);
+}
+
+static void gen_shrnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
+
+    tcg_gen_shli_vec(vece, n, n, halfbits - shr);
+    tcg_gen_dupi_vec(vece, t, mask);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = { INDEX_op_shli_vec, 0 };
+    static const GVecGen2i ops[3] = {
+        { .fni8 = gen_shrnt16_i64,
+          .fniv = gen_shrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_shrnt_h,
+          .vece = MO_16 },
+        { .fni8 = gen_shrnt32_i64,
+          .fniv = gen_shrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_shrnt_s,
+          .vece = MO_32 },
+        { .fni8 = gen_shrnt64_i64,
+          .fniv = gen_shrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_shrnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_RSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_rshrnb_h },
+        { .fno = gen_helper_sve2_rshrnb_s },
+        { .fno = gen_helper_sve2_rshrnb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_rshrnt_h },
+        { .fno = gen_helper_sve2_rshrnt_s },
+        { .fno = gen_helper_sve2_rshrnt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1

