Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E3DCD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPSv-00019Z-Ht; Sat, 16 May 2026 20:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSD-00077M-ID
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:10 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS7-0006qw-KM
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-365d8e43759so957456a91.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978034; x=1779582834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmYcixsE9fFRDHnLmbIPkr+l+gClGb8ndXVyGs3CEgQ=;
 b=mkOw2DDVs5ywgyZFcMKMWZz7KQl3TNnjfmFgGITyTtJYxMZN5pxVm8XyNyrIkZ8CLR
 KDZp10rskEdUkODd/v7i2wUmzdvgSax3juQr4PE1IZAaGLBJS6WOLiH9l05TqXZ2jPgk
 9W6D1mNBiXzScUZkBfzFEphqsQK3CYv/st3Vtxgcmd5L7120SeRTULe7YSGInSOcykrB
 hTVIovh48WAHeY549OX+7L9r7Nt26PH44aDZRjxVuXFSuAplsu7P/P4WN4QKYtPV7poZ
 mL35VjGjPE0kXI5IJBtP9e7J/LVdYV7uTe8M6mac6wYks4FhpoEr2fUTBzM/AUaNl0mA
 It4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978034; x=1779582834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZmYcixsE9fFRDHnLmbIPkr+l+gClGb8ndXVyGs3CEgQ=;
 b=HROD8YYkZMvQh3+X+PGndXgJv0zEbYoRoAYWWx/xsNiMmF1h1dzYzE9gyoo3oU9YLJ
 u4z+97ogZEYLM+etc5Ldc3sgYHhNtkcDjK4xahL/8JzY5pLVCbW6XO08Hkfy3M0DAZBh
 S86SV+EC7TffpXJwEN7BLLlsT4OZ7HgUrOOZLIeuJe29EIxBjy68wSoICrRx/tAc88w7
 oOLx0YM7VPgW2KxlJ0ffZaiyktVQtksZ6deXMcviUJEKovTk4aAiIzlmdLnkbP+duyxx
 Am8NcsV1f8oA1inA17nnqhEm1yonaebh9A5/WJxYRxL/4mtXyzXN4Sq7xM8NKgsEO4Pr
 eGNA==
X-Gm-Message-State: AOJu0YyJ/G+kWqTnrDMs33gbtMhhGLtTji69/Daw9+WxscAbxQ/C5LGt
 h7CwoZHdlJCCkmwb0oi6RS4eL0JBQdZGKA5yVqF+L+63536ydvgp+HNq33vOXKDU/v0=
X-Gm-Gg: Acq92OFUNn80ShpdiYWOnJUagnHuN4lAAHLyj1qGn1XlcR/S3L4ike63gELAa39RzI4
 Fvw8ASatIq5mleH9HVZdhnBwxoltN+nAMmuuhO1DfjKmhqdobh3aL0PTyUAVB8RMqGrJmoNPHcQ
 r3TjiEjKLnedPn/r37LRT23fkq4vTrKTF6iPajW5aQXFuuRT3EsLwgZHqtc9KxfJwev+PcB4zXH
 vrwuVer5MC4/nBKC76JyyXZj9nX8TxajzekCRQG8X318qGUhWHKDUjxkxbYMSYgwZOs3xTeP1I6
 dab6hkluH6dc7HGOswR+B62UL+0Ye8lIxg+ja/bCR20rVGJgEec5GkW8AREhgl44cPHp/UFOzyg
 HYLXKSjsJrIdB+H6sEI2wea0rEE/CkNPocCiTyg4eVFpEcj0VGLro7MzRgQNj7MolnCVMHfP4M3
 5wepS3pjKSXSDzNUoranJqguw/uhI7
X-Received: by 2002:a17:90a:d40b:b0:368:4942:50c4 with SMTP id
 98e67ed59e1d1-3692363eecamr11943510a91.17.1778978033917; 
 Sat, 16 May 2026 17:33:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 53/63] target/arm: Implement FDOT (FP8 to FP16) for AdvSIMD
Date: Sat, 16 May 2026 17:29:52 -0700
Message-ID: <20260517003002.321430-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        |  5 ++++
 target/arm/tcg/helper-fp8-defs.h |  3 +++
 target/arm/tcg/fp8_helper.c      | 41 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  2 ++
 target/arm/tcg/a64.decode        |  2 ++
 5 files changed, 53 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 17d6acc14d..7bedc293fd 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1610,6 +1610,11 @@ static inline bool isar_feature_aa64_f8dp4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8DP4);
 }
 
+static inline bool isar_feature_aa64_f8dp2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8DP2);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index ee6f2e9236..5995d77577 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -32,3 +32,6 @@ DEF_HELPER_FLAGS_5(gvec_fmla_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_5(gvec_fdot_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fdot_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_fdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index c54a066b30..913c91fa06 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -782,3 +782,44 @@ void HELPER(gvec_fdot_idx_sb)(void *vd, void *vn, void *vm,
     fp8_mul_finish(env, &ctx);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fdot_hb)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    uint16_t *n = vn;
+    uint16_t *m = vm;
+    float16 *d = vd;
+
+    for (size_t i = 0; i < nelem; i++) {
+        d[i] = f8dotadd_h(n[i], m[i], 2, d[i], &ctx);
+    }
+
+    fp8_mul_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fdot_idx_hb)(void *vd, void *vn, void *vm,
+                              CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    size_t idx = simd_data(desc);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    uint16_t *n = vn;
+    uint16_t *m = vm;
+    float16 *d = vd;
+    size_t i = 0;
+
+    do {
+        uint16_t e1 = m[i + H2(idx)];
+        do {
+            d[i] = f8dotadd_h(n[i], e1, 2, d[i], &ctx);
+        } while (++i % 8 != 0);
+    } while (i < nelem);
+
+    fp8_mul_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8ea63e94fe..c5ea6b27a9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7417,6 +7417,7 @@ static bool do_f8dot(DisasContext *s, arg_qrrr_e *a,
 }
 
 TRANS_FEAT(FDOT_sb_v, aa64_f8dp4, do_f8dot, a, gen_helper_gvec_fdot_sb)
+TRANS_FEAT(FDOT_hb_v, aa64_f8dp2, do_f8dot, a, gen_helper_gvec_fdot_hb)
 
 static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
                          gen_helper_gvec_3_ptr *fn)
@@ -7432,6 +7433,7 @@ static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
 }
 
 TRANS_FEAT(FDOT_sb_vi, aa64_f8dp4, do_f8dot_idx, a, gen_helper_gvec_fdot_idx_sb)
+TRANS_FEAT(FDOT_hb_vi, aa64_f8dp2, do_f8dot_idx, a, gen_helper_gvec_fdot_idx_hb)
 
 static bool do_int3_vector_idx(DisasContext *s, arg_qrrx_e *a,
                                gen_helper_gvec_3 * const fns[2])
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d78a3d5486..d1254355b6 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1214,6 +1214,7 @@ FMLALL_sb_v     0.00 1110 0.0 rm:5 110001 rn:5 rd:5 \
                 &rxx idxm=0 idxn=%fmlall_idxn
 
 FDOT_sb_v       0.00 1110 000 ..... 11111 1 ..... ..... @qrrr_s
+FDOT_hb_v       0.00 1110 010 ..... 11111 1 ..... ..... @qrrr_h
 
 ### Advanced SIMD scalar x indexed element
 
@@ -1340,6 +1341,7 @@ FMLALL_sb_vi    0 . 10 1111 0 . ... rm:3 1000 . 0 rn:5 rd:5 \
                 &rxx idxm=%hlm4 idxn=%fmlall_idxn
 
 FDOT_sb_vi      0.00 1111 00 . ..... 0000 . 0 ..... .....   @qrrx_s
+FDOT_hb_vi      0.00 1111 01 .. .... 0000 . 0 ..... .....   @qrrx_h
 
 # Floating-point conditional select
 
-- 
2.43.0


