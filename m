Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3439845njb;
        Tue, 10 Dec 2024 08:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7C51n5zvNpSH+OduJWi4ZFLPs3h0UOzU8FLHqBG5euJRHguF5LtcaCuTGL8JNjOVk20KjKsJY0lsomQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEkwvpqKKIJIs4AXMQJ8L7gMQaNGiTdvrYICnXq4izjSB1TUm/KoP0epjps0aBnXKMjJyYc
X-Received: by 2002:a05:622a:8c04:b0:466:b122:5143 with SMTP id d75a77b69052e-46771eb1893mr78524791cf.16.1733847695578;
        Tue, 10 Dec 2024 08:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847695; cv=none;
        d=google.com; s=arc-20240605;
        b=d/hqxt2ZWhQFMnYhXQ/zOL66+R68l8pDljjo00AvLneJfNQ/NAtS9NiOdl3rgCqASJ
         izn2uWcN5imwZfz8OgEiT0+m5zK7wj/4TYK5/O+tgcvtCBSb7bh8nwT3hg6offXnteEi
         YP2B5kMLXu2zee5lq25uvBXZEgBAmCu70KQPvkoYVdlrK2tbGRKbd9EI2m0yqBiPCIYu
         Y5gZTPzwp7kvaz6rMYPSM3AtzM3fGTiANCs4HHMw23E9cdicN3j9r80PQbwlfWkXuR71
         97A3E0RjtBrjjTup5mLSUaiAtjWLA9GNv3rXa9UJc2gwiohNQMdgR0vIElUcFiECAZuS
         nIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=03xpSjdU8Lg60/GRm5ycw84YKSH6ssdmmvij/MVKqHA=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=NbgbYHrrXUP9JWIWjjOn+jU5YHDYM8Yx1P8kCke9TL/mDv6rkyuOf8btP0SU3lmTuV
         mZsl6qgi7Uqo3QRcbf1ej5Imq6gDrt/dvFeBWj7bCwSejVHqsuRn54gaFvlcabIPqCHt
         ff8JXBRAX0dC6qTgmS3599sUHtZY64lLgy2WpRoeleIibuNX17UpiDSfm0am6BI24Um2
         XLm9K66nAdK6O1Xg5+MO7pYHd7vyyCnjEy8NRn3CtDQsxsyV2LJ7q0xtQmnnyrPVLQiB
         pmjEuxbSf2OUgOoC2WhkWqS60H1FZzwbTkdGw/RxmTpfeqjYKpXrInJJxPK+/GbVTDQJ
         QVoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLKWhDDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4677288acd5si29481541cf.153.2024.12.10.08.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:21:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLKWhDDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2yH-0000UU-3u; Tue, 10 Dec 2024 11:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2yD-0000CT-Lo
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:20:21 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2yB-0006s2-Cc
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:20:21 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso3381814e87.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847618; x=1734452418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03xpSjdU8Lg60/GRm5ycw84YKSH6ssdmmvij/MVKqHA=;
 b=OLKWhDDVfQAYHWUO7ikvTseWum75KRNdeinImwAaJGS8CPGhi9PRbgZhO3fMFhRwYs
 NKNalx9Y03vLl9V/XMv+UbFgUTcfWnUY+u7uFCQ9lF9bRwcgpCYvwgne0DTZwVNqE1DH
 a8mzD+tAqum79nW4LHfXNS7DNJbd/+q7j8VFI/ozT3SqrP3C+MZDpzOwXHjUQZl0VQpn
 1x5gaEXmmM3mnkiBUi+npWmrOP5v3vj6Xta4yp3bH654yqmHpSY9eHLlA9S0Dg8yhwu5
 6BBftAo7y3jOl+vtX6+LSVzRwX+xp9Bjeiedga9q8Q9wfPFmVbOzFEfawYQW0Ia6yEVe
 eV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847618; x=1734452418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03xpSjdU8Lg60/GRm5ycw84YKSH6ssdmmvij/MVKqHA=;
 b=SVqu6O6d7wCLx1XHcL1pabNUyds2LCfjwvY8HLaMIaZo7Bv8wbCrYEFBn1fpHHaP91
 e26L2f867U9KdJ4rbQ4jXFSJIzuryxRt7X8M4fPCpyeIpiTDFK0cyiEKIeIC5EGXoylA
 nNs8xeXKD9Dow4WJ/A/OyvAwFXvCdu7zrAfY1Jof/60l8X0x+R8EixptyqI7t4xBSnbU
 bYmZFFzZiXngFX3JyI9DNZKRiq45OCI5YXqDF2Mol/YJcRI5bE2u9YfpnMP5WQ8ILE55
 otdxtzikdS2hDefXoMTRp4VBiteYDrNzXD+1nbNvNtUV1v07NByahCWm5U6zv8gq/Z8R
 7kiw==
X-Gm-Message-State: AOJu0YwL2I8JBAIu/r4QzkdQf22OtIOy6DRfuNK4ojsHK+2s+uHHkhWM
 eCaBMHhvNz6yfiERJ6bAcZXtfB2PN3U4yJYGK596tdrs/B9DlzhIPEMZdX0rhkk=
X-Gm-Gg: ASbGncsno5YiUmZcdIqas8sp5ce+99S9UeoSxUaa7tQFWITRkov/dbgCk/BVi0cZ7ns
 8h6CVpElSqG9htIgYOWrfOaKDL9+QtWoyv6UCw/c9E7xcZPYX5J9COoJbLks4jsX8swwQ6PI0Uw
 3NA4R0xi/7nmV9ABvlmDbufVClSlYkhd+4pvIBr2mUhYzSHAOnhBX9HFSv5tv4cVpHmcKhPjyF7
 dSDDtrPGkIGW3Lxu+NlNDEGVduRtvAszEnW7duY59zDwTDyk+g3X+yc32A=
X-Received: by 2002:ac2:5b85:0:b0:540:2543:1b19 with SMTP id
 2adb3069b0e04-54025431b7cmr1155085e87.24.1733847617635; 
 Tue, 10 Dec 2024 08:20:17 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:20:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 39/69] target/arm: Introduce gen_gvec_cnt, gen_gvec_rbit
Date: Tue, 10 Dec 2024 10:17:03 -0600
Message-ID: <20241210161733.1830573-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x130.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c7YApcicgNc8

Add gvec interfaces for CNT and RBIT operations.
Use ctpop8 for CNT and revbit+bswap for RBIT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  4 ++--
 target/arm/tcg/translate.h      |  4 ++++
 target/arm/tcg/gengvec.c        | 16 ++++++++++++++++
 target/arm/tcg/neon_helper.c    | 21 ---------------------
 target/arm/tcg/translate-a64.c  | 32 +++++++++-----------------------
 target/arm/tcg/translate-neon.c | 16 ++++++++--------
 target/arm/tcg/vec_helper.c     | 24 ++++++++++++++++++++++++
 7 files changed, 63 insertions(+), 54 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0a697e752b..167e331a83 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -363,8 +363,8 @@ DEF_HELPER_1(neon_clz_u16, i32, i32)
 DEF_HELPER_1(neon_cls_s8, i32, i32)
 DEF_HELPER_1(neon_cls_s16, i32, i32)
 DEF_HELPER_1(neon_cls_s32, i32, i32)
-DEF_HELPER_1(neon_cnt_u8, i32, i32)
-DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
+DEF_HELPER_FLAGS_3(gvec_cnt_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
 DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
 DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 5c6c24f057..cb8e1b2586 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -582,6 +582,10 @@ void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                   uint32_t opr_sz, uint32_t max_sz);
 
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 834b2961c0..85a0b50496 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2393,3 +2393,19 @@ void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_8);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_cnt_b);
+}
+
+void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_8);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_rbit_b);
+}
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 93b2076c64..4e501925de 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -525,27 +525,6 @@ uint32_t HELPER(neon_cls_s32)(uint32_t x)
     return count - 1;
 }
 
-/* Bit count.  */
-uint32_t HELPER(neon_cnt_u8)(uint32_t x)
-{
-    x = (x & 0x55555555) + ((x >>  1) & 0x55555555);
-    x = (x & 0x33333333) + ((x >>  2) & 0x33333333);
-    x = (x & 0x0f0f0f0f) + ((x >>  4) & 0x0f0f0f0f);
-    return x;
-}
-
-/* Reverse bits in each 8 bit word */
-uint32_t HELPER(neon_rbit_u8)(uint32_t x)
-{
-    x =  ((x & 0xf0f0f0f0) >> 4)
-       | ((x & 0x0f0f0f0f) << 4);
-    x =  ((x & 0x88888888) >> 3)
-       | ((x & 0x44444444) >> 1)
-       | ((x & 0x22222222) << 1)
-       | ((x & 0x11111111) << 3);
-    return x;
-}
-
 #define NEON_QDMULH16(dest, src1, src2, round) do { \
     uint32_t tmp = (int32_t)(int16_t) src1 * (int16_t) src2; \
     if ((tmp ^ (tmp << 1)) & SIGNBIT) { \
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bf993783ac..31f1d3961d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10324,12 +10324,15 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x5:
-        if (u && size == 0) { /* NOT */
+    case 0x5: /* CNT, NOT, RBIT */
+        if (!u) {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cnt, 0);
+        } else if (size) {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_rbit, 0);
+        } else {
             gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
-            return;
         }
-        break;
+        return;
     case 0x8: /* CMGT, CMGE */
         if (u) {
             gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cge0, size);
@@ -10374,13 +10377,14 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     } else {
         int pass;
 
+        assert(size == 2);
         for (pass = 0; pass < (is_q ? 4 : 2); pass++) {
             TCGv_i32 tcg_op = tcg_temp_new_i32();
             TCGv_i32 tcg_res = tcg_temp_new_i32();
 
             read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
 
-            if (size == 2) {
+            {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
                 case 0x2f: /* FABS */
@@ -10434,25 +10438,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
                 }
-            } else {
-                /* Use helpers for 8 and 16 bit elements */
-                switch (opcode) {
-                case 0x5: /* CNT, RBIT */
-                    /* For these two insns size is part of the opcode specifier
-                     * (handled earlier); they always operate on byte elements.
-                     */
-                    if (u) {
-                        gen_helper_neon_rbit_u8(tcg_res, tcg_op);
-                    } else {
-                        gen_helper_neon_cnt_u8(tcg_res, tcg_op);
-                    }
-                    break;
-                default:
-                case 0x7: /* SQABS, SQNEG */
-                    g_assert_not_reached();
-                }
             }
-
             write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
         }
     }
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 1c89a53272..50d0bf7753 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3131,6 +3131,14 @@ static bool trans_VMVN(DisasContext *s, arg_2misc *a)
     return do_2misc_vec(s, a, tcg_gen_gvec_not);
 }
 
+static bool trans_VCNT(DisasContext *s, arg_2misc *a)
+{
+    if (a->size != 0) {
+        return false;
+    }
+    return do_2misc_vec(s, a, gen_gvec_cnt);
+}
+
 #define WRAP_2M_3_OOL_FN(WRAPNAME, FUNC, DATA)                          \
     static void WRAPNAME(unsigned vece, uint32_t rd_ofs,                \
                          uint32_t rm_ofs, uint32_t oprsz,               \
@@ -3229,14 +3237,6 @@ static bool trans_VREV16(DisasContext *s, arg_2misc *a)
     return do_2misc(s, a, gen_rev16);
 }
 
-static bool trans_VCNT(DisasContext *s, arg_2misc *a)
-{
-    if (a->size != 0) {
-        return false;
-    }
-    return do_2misc(s, a, gen_helper_neon_cnt_u8);
-}
-
 static void gen_VABS_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                        uint32_t oprsz, uint32_t maxsz)
 {
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index e825d501a2..60381258cf 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3072,3 +3072,27 @@ DO_CLAMP(gvec_uclamp_b, uint8_t)
 DO_CLAMP(gvec_uclamp_h, uint16_t)
 DO_CLAMP(gvec_uclamp_s, uint32_t)
 DO_CLAMP(gvec_uclamp_d, uint64_t)
+
+/* Bit count in each 8-bit word. */
+void HELPER(gvec_cnt_b)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint8_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ctpop8(n[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+/* Reverse bits in each 8 bit word */
+void HELPER(gvec_rbit_b)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = revbit64(bswap64(n[i]));
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.43.0

