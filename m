Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2890927lft;
        Mon, 27 Jun 2022 21:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uLwZTipaSiMi5V/xCLO0AVdTYV+1B1SdJ4zJbvZzqFJNhOvReOr+iivLsz7uBozW7FEujY
X-Received: by 2002:a05:6214:2605:b0:470:2cf3:82f2 with SMTP id gu5-20020a056214260500b004702cf382f2mr936638qvb.124.1656391267278;
        Mon, 27 Jun 2022 21:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391267; cv=none;
        d=google.com; s=arc-20160816;
        b=VDcfU5qB+iqqUKUaV2EpUGie4qjq5CSYWWdOjXtgMd6RrX5H63gQB9UtEWFmQyQ8Hd
         CV2tHZAHCJoh01oxTvj9A9Hs1Q0ZvVs92Ozfopxwhnxxp3ZcW2vyZc66VxuZ5qcGe9Ln
         DtKvIV8SEVBSovlq/56qFmdUupD+hPJCVCRE9y9qMr6fcnlrHGWg52TR6D6h49yoUode
         bvCFuMCUtQZqShdg1HCY4Esu+v04wXqlBXuOH26AuM4k9AhT8raaVjK2xjRX/1pm9fgd
         mrfHVfGmuuSFKdqHHCNcin0yToEBRXOyPzOi3hI4S6Mq8I0rtyn8zqqWjhDWpPVVgkxA
         21bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OCpZTwYRKjmhDta+uw08I335v7NtcU6c85SQuAKXnpU=;
        b=XD/yllWQEXmoITuR68QQ4TAiRukUJeCUoZQnPxvnBSLo+Ldyx9LcQd0YQNJAPmVTvP
         CMgbFH7rVMkHwCrNS5KVAGbbJKGLlYN4nB5HvlRBZJDxA7aU/WGO4KObdt5WfI+isD//
         vrN6GrsZFsMuBGFN1Z3zg1dJfAobZKxR2xg4fb2OzZAXTGVxtPc392kutve799P6/t1L
         LSj8kBW6J4+NG2HOChA9ekLFaTY8Rhe370i4WmMZk8rgOYUSH+o7ov8gy3D6yrIdxseW
         3cWsuM/fdfVKgg6a/UPNv8tx+KLhKpVhrJrkQ70c6lYVn7Iq5MecCYcNfU4TYdqkXDWD
         PQkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MvY/AxW1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f29-20020ac8015d000000b0031bef908883si666443qtg.752.2022.06.27.21.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MvY/AxW1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o632A-0005A0-Jf
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jt-000243-9j
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:14 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jo-0003k5-RD
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:12 -0400
Received: by mail-pf1-x433.google.com with SMTP id 128so10861045pfv.12
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCpZTwYRKjmhDta+uw08I335v7NtcU6c85SQuAKXnpU=;
 b=MvY/AxW12VTwmXJXh1aGEW/53xbcm5M5+WJ9F2yi+BUmChy/xEWB77+h7YPtZCH7cN
 3AxKrIjhFFN0S6O0PAUIgWlcSE/bjrJkZYM2A62HPg196wEpJ6c6UqpO33vZ75UlNLfF
 jFgOsoRDUbW9YqS3sY+5HSEp3zr/dXH5wdJ3p5pbaRB0qRRQvEzM/cixRfoWuP5ydzgH
 dwCiKXPn34eMKaHGiKdPMjTwC9EmfQKJLG4Ca0X6xC9GxN7ehmrUbxUzhoWQsqDDyNGq
 zDGaAIUn2O0Ksk3DKUsLiG/pz/ZFp79NOvSkfZujJXaIvFod7CinKbIXCack+T4/aecJ
 m7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCpZTwYRKjmhDta+uw08I335v7NtcU6c85SQuAKXnpU=;
 b=dMtxKcNABH+7w58+PZCwt7cw/nLiuWlMjgw/pPYYGp8BZZ2jQHVdMcH0w229Vggw3e
 Zt33fH68+/gjPATBa1xSnjIJPbQqvvKpcL02auYijQzJFJ144BXMxAhGBzJGDdpsl3rw
 dIm+kxKRIG1whbQs6VHyNNc2yS/XM7+yqwSeBsDZsJAL1trZ0Gn7U5nROkSJwQR9zXRH
 AqhT0nU+uIOVZ4A8fe0nMpxmIqEouHGq8a7tzL2GxkLC6hlIPid12z9+cmgsj5nD1TEf
 dt4Z1I4r7fr2Zl48MTZ6SfJ05xKcLZHa2x9W9D9mht/44GJFMhPZV62fLm+8l4OMd+DW
 ZZvg==
X-Gm-Message-State: AJIora8Gy84RgjWI1iy5en5I3226Yux8bl68wh2tuus7WNA0M13UNSId
 GIca0aoV3N7Z4X2sQZXN/hE2cQ==
X-Received: by 2002:a63:b54c:0:b0:40c:7b84:4f7f with SMTP id
 u12-20020a63b54c000000b0040c7b844f7fmr15407834pgo.586.1656390126978; 
 Mon, 27 Jun 2022 21:22:06 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 19/45] target/arm: Implement SME MOVA
Date: Tue, 28 Jun 2022 09:50:51 +0530
Message-Id: <20220628042117.368549-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8W+lioxIUdE5

We can reuse the SVE functions for implementing moves to/from
horizontal tile slices, but we need new ones for moves to/from
vertical tile slices.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  12 ++++
 target/arm/helper-sve.h    |   2 +
 target/arm/translate-a64.h |   8 +++
 target/arm/translate.h     |   5 ++
 target/arm/sme.decode      |  15 +++++
 target/arm/sme_helper.c    | 112 +++++++++++++++++++++++++++++++-
 target/arm/sve_helper.c    |  12 ++++
 target/arm/translate-sme.c | 130 +++++++++++++++++++++++++++++++++++++
 8 files changed, 295 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index c4ee1f09e4..154bc73d2e 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -21,3 +21,15 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
 
 DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
+
+/* Move to/from vertical array slices, i.e. columns, so 'c'.  */
+DEF_HELPER_FLAGS_4(sme_mova_cz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_cz_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_mova_zc_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index dc629f851a..ab0333400f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -325,6 +325,8 @@ DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_q, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve2_addp_zpzz_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 099d3d11d6..2a7fe6e9e7 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -178,6 +178,14 @@ static inline int pred_gvec_reg_size(DisasContext *s)
     return size_for_gvec(pred_full_reg_size(s));
 }
 
+/* Return a newly allocated pointer to the predicate register.  */
+static inline TCGv_ptr pred_full_reg_ptr(DisasContext *s, int regno)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, pred_full_reg_offset(s, regno));
+    return ret;
+}
+
 bool disas_sve(DisasContext *, uint32_t);
 bool disas_sme(DisasContext *, uint32_t);
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index e2e619dab2..af5d4a7086 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -156,6 +156,11 @@ static inline int plus_2(DisasContext *s, int x)
     return x + 2;
 }
 
+static inline int plus_12(DisasContext *s, int x)
+{
+    return x + 12;
+}
+
 static inline int times_2(DisasContext *s, int x)
 {
     return x * 2;
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 6e4483fdce..241b4895b7 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -22,3 +22,18 @@
 ### SME Misc
 
 ZERO            11000000 00 001 00000000000 imm:8
+
+### SME Move into/from Array
+
+%mova_rs        13:2 !function=plus_12
+&mova           esz rs pg zr za_imm v:bool to_vec:bool
+
+MOVA            11000000 esz:2 00000 0 v:1 .. pg:3 zr:5 0 za_imm:4  \
+                &mova to_vec=0 rs=%mova_rs
+MOVA            11000000 11    00000 1 v:1 .. pg:3 zr:5 0 za_imm:4  \
+                &mova to_vec=0 rs=%mova_rs esz=4
+
+MOVA            11000000 esz:2 00001 0 v:1 .. pg:3 0 za_imm:4 zr:5  \
+                &mova to_vec=1 rs=%mova_rs
+MOVA            11000000 11    00001 1 v:1 .. pg:3 0 za_imm:4 zr:5  \
+                &mova to_vec=1 rs=%mova_rs esz=4
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index eef2df73e1..95159862de 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -19,8 +19,10 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internals.h"
+#include "tcg/tcg-gvec-desc.h"
 #include "exec/helper-proto.h"
+#include "qemu/int128.h"
+#include "vec_internal.h"
 
 /* ResetSVEState */
 void arm_reset_sve_state(CPUARMState *env)
@@ -84,3 +86,111 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
         }
     }
 }
+
+/*
+ * Move Zreg vector to ZArray column.
+ */
+#define DO_MOVA_C(NAME, TYPE, H)                                        \
+void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
+{                                                                       \
+    int i, oprsz = simd_oprsz(desc);                                    \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                *(TYPE *)za = *(TYPE *)(vn + H(i));                     \
+            }                                                           \
+            za += sizeof(ARMVectorReg) * sizeof(TYPE);                  \
+            i += sizeof(TYPE);                                          \
+            pg >>= sizeof(TYPE);                                        \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
+DO_MOVA_C(sme_mova_cz_h, uint16_t, H2)
+DO_MOVA_C(sme_mova_cz_s, uint32_t, H4)
+
+void HELPER(sme_mova_cz_d)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pg = vg;
+    uint64_t *n = vn;
+    uint64_t *a = za;
+
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H1_2(i)] & 1) {
+            a[i * sizeof(ARMVectorReg)] = n[i];
+        }
+    }
+}
+
+void HELPER(sme_mova_cz_q)(void *za, void *vn, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 16;
+    uint16_t *pg = vg;
+    Int128 *n = vn;
+    Int128 *a = za;
+
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H2(i)] & 1) {
+            a[i * sizeof(ARMVectorReg)] = n[i];
+        }
+    }
+}
+
+#undef DO_MOVA_C
+
+/*
+ * Move ZArray column to Zreg vector.
+ */
+#define DO_MOVA_Z(NAME, TYPE, H)                                        \
+void HELPER(NAME)(void *vd, void *za, void *vg, uint32_t desc)          \
+{                                                                       \
+    int i, oprsz = simd_oprsz(desc);                                    \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = *(TYPE *)za;                     \
+            }                                                           \
+            za += sizeof(ARMVectorReg) * sizeof(TYPE);                  \
+            i += sizeof(TYPE);                                          \
+            pg >>= sizeof(TYPE);                                        \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_MOVA_Z(sme_mova_zc_b, uint8_t, H1)
+DO_MOVA_Z(sme_mova_zc_h, uint16_t, H2)
+DO_MOVA_Z(sme_mova_zc_s, uint32_t, H4)
+
+void HELPER(sme_mova_zc_d)(void *vd, void *za, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pg = vg;
+    uint64_t *d = vd;
+    uint64_t *a = za;
+
+    for (i = 0; i < oprsz; i++) {
+        if (pg[H1_2(i)] & 1) {
+            d[i] = a[i * sizeof(ARMVectorReg)];
+        }
+    }
+}
+
+void HELPER(sme_mova_zc_q)(void *vd, void *za, void *vg, uint32_t desc)
+{
+    int i, oprsz = simd_oprsz(desc) / 16;
+    uint16_t *pg = vg;
+    Int128 *d = vd;
+    Int128 *a = za;
+
+    for (i = 0; i < oprsz; i++, za += sizeof(ARMVectorReg)) {
+        if (pg[H2(i)] & 1) {
+            d[i] = a[i * sizeof(ARMVectorReg)];
+        }
+    }
+}
+
+#undef DO_MOVA_Z
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1654c0bbf9..9a26f253e0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3565,6 +3565,18 @@ void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve_sel_zpzz_q)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 16;
+    Int128 *d = vd, *n = vn, *m = vm;
+    uint16_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] = (pg[H2(i)] & 1 ? n : m)[i];
+    }
+}
+
 /* Two operand comparison controlled by a predicate.
  * ??? It is very tempting to want to be able to expand this inline
  * with x86 instructions, e.g.
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 971504559b..8e6881086b 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -35,6 +35,77 @@
 #include "decode-sme.c.inc"
 
 
+static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
+                                int tile_index, bool vertical)
+{
+    int tile = tile_index >> (4 - esz);
+    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
+    int pos, len, offset;
+    TCGv_i32 t_index;
+    TCGv_ptr addr;
+
+    /* Resolve tile.size[index] to an untyped ZA slice index. */
+    t_index = tcg_temp_new_i32();
+    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
+    tcg_gen_addi_i32(t_index, t_index, index);
+
+    len = ctz32(streaming_vec_reg_size(s)) - esz;
+
+    if (vertical) {
+        /*
+         * Compute the offset of the index within the tile:
+         *     (index % (svl / size)) * size
+         *   = (index % (svl >> esz)) << esz
+         * Perform the power-of-two modulo via extraction of the low @len bits.
+         * Perform the multiply by shifting left by @pos bits.
+         * These two operations are performed simultaneously via deposit.
+         */
+        pos = esz;
+        tcg_gen_deposit_z_i32(t_index, t_index, pos, len);
+
+        /* The tile slice offset within env->zarray is the column offset. */
+        offset = tile;
+
+        /* Include the offset of zarray to make this relative to env. */
+        offset += offsetof(CPUARMState, zarray);
+        tcg_gen_addi_i32(t_index, t_index, offset);
+
+        /*
+         * For big-endian, adjust the column slice offset within
+         * the uint64_t host words that make up env->zarray.
+         * This must wait until index and offset are combined.
+         */
+        if (HOST_BIG_ENDIAN && esz < MO_64) {
+            tcg_gen_xori_i32(t_index, t_index, 8 - (1 << esz));
+        }
+    } else {
+        /*
+         * Compute the offset of the index within the tile:
+         *     (index % (svl / size)) * (size * sizeof(row))
+         *   = (index % (svl >> esz)) << (esz + log2(sizeof(row)))
+         */
+        pos = esz + ctz32(sizeof(ARMVectorReg));
+        tcg_gen_deposit_z_i32(t_index, t_index, pos, len);
+
+        /* The tile slice offset within env->zarray is the row offset. */
+        offset = tile * sizeof(ARMVectorReg);
+
+        /* Include the offset of zarray to make this relative to env. */
+        offset += offsetof(CPUARMState, zarray);
+        tcg_gen_addi_i32(t_index, t_index, offset);
+
+        /* Row slices need no endian adjustment. */
+    }
+
+    /* Add the offset to env to produce the final pointer. */
+    addr = tcg_temp_new_ptr();
+    tcg_gen_ext_i32_ptr(addr, t_index);
+    tcg_temp_free_i32(t_index);
+    tcg_gen_add_ptr(addr, addr, cpu_env);
+
+    return addr;
+}
+
 static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
 {
     if (!dc_isar_feature(aa64_sme, s)) {
@@ -46,3 +117,62 @@ static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
     }
     return true;
 }
+
+static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
+{
+    static gen_helper_gvec_4 * const h_fns[5] = {
+        gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
+        gen_helper_sve_sel_zpzz_s, gen_helper_sve_sel_zpzz_d,
+        gen_helper_sve_sel_zpzz_q
+    };
+    static gen_helper_gvec_3 * const cz_fns[5] = {
+        gen_helper_sme_mova_cz_b, gen_helper_sme_mova_cz_h,
+        gen_helper_sme_mova_cz_s, gen_helper_sme_mova_cz_d,
+        gen_helper_sme_mova_cz_q,
+    };
+    static gen_helper_gvec_3 * const zc_fns[5] = {
+        gen_helper_sme_mova_zc_b, gen_helper_sme_mova_zc_h,
+        gen_helper_sme_mova_zc_s, gen_helper_sme_mova_zc_d,
+        gen_helper_sme_mova_zc_q,
+    };
+
+    TCGv_ptr t_za, t_zr, t_pg;
+    TCGv_i32 t_desc;
+    int svl;
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
+    t_zr = vec_full_reg_ptr(s, a->zr);
+    t_pg = pred_full_reg_ptr(s, a->pg);
+
+    svl = streaming_vec_reg_size(s);
+    t_desc = tcg_constant_i32(simd_desc(svl, svl, 0));
+
+    if (a->v) {
+        /* Vertical slice -- use sme mova helpers. */
+        if (a->to_vec) {
+            zc_fns[a->esz](t_zr, t_za, t_pg, t_desc);
+        } else {
+            cz_fns[a->esz](t_za, t_zr, t_pg, t_desc);
+        }
+    } else {
+        /* Horizontal slice -- reuse sve sel helpers. */
+        if (a->to_vec) {
+            h_fns[a->esz](t_zr, t_za, t_zr, t_pg, t_desc);
+        } else {
+            h_fns[a->esz](t_za, t_zr, t_za, t_pg, t_desc);
+        }
+    }
+
+    tcg_temp_free_ptr(t_za);
+    tcg_temp_free_ptr(t_zr);
+    tcg_temp_free_ptr(t_pg);
+
+    return true;
+}
-- 
2.34.1

