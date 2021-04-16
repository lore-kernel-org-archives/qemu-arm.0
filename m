Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp752261lfr;
        Fri, 16 Apr 2021 14:50:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYqgArNiAh6/NjE+TwYhmb7aQMd9wXKVNqiF03Dbemd3KdUWb3csTiLeCUsz+LxglOHw0h
X-Received: by 2002:a25:2d4:: with SMTP id 203mr1661160ybc.241.1618609857237;
        Fri, 16 Apr 2021 14:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609857; cv=none;
        d=google.com; s=arc-20160816;
        b=Wr6Qz8eTXI8sVHONYw0JBRu3hGbUqOfwWI6bit3WrMbw5udpuzbdLNBqPl/0EXsnqT
         ghUziyAbyryEmiJ+IEgrz5q8ClNgYpALIBCs2q1x9N/nJAWgeQMfsF25lY9WwCwtfJT2
         djI4MiacGq115AQH+klj2usweF3aAjRxuOQ89q/fKiJZKmJgrLQVpVy+nTu/wCFhetIZ
         nIHgnZYV2DfDdzczEvNk6Lovfo0ZGgriNsioZYKiGRYqTeJLv8siI9P4xvl3tC0tOpyJ
         y4+ayOWC/WXFysJftrWJ7LpSQ42iK58yS9btERjyPyjy6+8u1mQSUbkK7+fHnq9uPJ+o
         u80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8WE8+/U1Z3Zm6Ai/dPG+UHhpoeyvgwdlIhVlAeBkl70=;
        b=dgyNp8O93dskNaFgT8tCh+udGCygraaw4R0h8gkw/qHCAfIZOI8J+3ja7qVmyeZI0/
         PH2W8ou3F4g3xL7iGj3XJG6DobmB85CfueePyQ7WyBwH/THjRcWK6ng+Gd88CeMc0GiZ
         Z+4SLWpiAoAlKw9wP/3Sn2ybjdg5v7zGiapsNuHMYtVmeMbQyl4g2d+5tW95bk54Jmuu
         rq6T6eWWGnTze9bo7KASgE4gtFqEPtU9t6VucFi5xZn5RKvX3pvpCRJHdnbXwvbyQVwV
         2F6+FVwGhb71wW0rGhwl4BQPszi7RfQbDlNuDtdTm23aLxa9Qyi5n4oMQ0NQ/tqlJnG8
         qRGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Il1f/GZW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si6864235ybg.15.2021.04.16.14.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Il1f/GZW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWMa-0004jw-IT
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdr-0006de-NN
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:43 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdW-0001mg-Uf
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:43 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so11073295pjb.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WE8+/U1Z3Zm6Ai/dPG+UHhpoeyvgwdlIhVlAeBkl70=;
 b=Il1f/GZWewBFRsLqE12bGqAWPw2IpRwBasRGB6V3cDv9Nz//s5utX/q1MLyfQ11Um+
 UE+t5fAeWK5jo2HYoHGvMAtbj15dLdV1XW43Q9tAC4plVEt6IFX5S5ufjwYzCS1zimBk
 XhhIBvMdwwWdxZsmAykZE+Vu9VvxnFblanJ5o5a1cQeXUmlCIAoFRaH+iK8lOZG3p5ti
 XFw35VBPXGu35kwuGNZSN0Xnp8o4u21/b4PLN/dYrs8uj6vtEzYsJCDK3SdvsFxICnOU
 gkYJmS531P3gruMm2Lh25IQuBHt1xeAHZamjsJkDAiss9XGBTC7T/s/X+kI/EbyBFU0D
 Rk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WE8+/U1Z3Zm6Ai/dPG+UHhpoeyvgwdlIhVlAeBkl70=;
 b=Ngu2M105pT+bXJBx/Ier3S6MYzWKyMdnLK2GdFDTgrz0bXBa35/oym9dx8bwCdsiUs
 IovNRln+wAIRFVG4ZHX6xyPiuasKEWrPQseyW2bOfQokOEzy99qRBdtpR11kzIVAtZ3l
 mfNfMwXelk/BclXE2FWX/i9yJwy6PInu8fJYI7Fxx+3RnzhrWdOlfNPIMV1n6Ap/JOzR
 uKMV1KMeOrEpGsHj/vudg8EMAFcWauCtUIE9akw1R5HahVX14efhJ6EBKp+FarTBgxtu
 6q5SCCbGMEBSpqUKV5Gb8nv3oxS9/2pYaoCd1fmUhDLlX4Qklcca5XXM1QZ5OgcNmuky
 n2Mw==
X-Gm-Message-State: AOAM532oRBSLCuJpk7VmTI7jGlbj+iPfYntl97ERaII+Ya3VFYLG4FZy
 2W5SpLwlFgk8rmrsSXvcUBxiZw==
X-Received: by 2002:a17:902:c407:b029:e7:2272:d164 with SMTP id
 k7-20020a170902c407b02900e72272d164mr11454227plk.84.1618607061722; 
 Fri, 16 Apr 2021 14:04:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 71/81] target/arm: Implement 128-bit ZIP, UZP, TRN
Date: Fri, 16 Apr 2021 14:02:30 -0700
Message-Id: <20210416210240.1591291-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: k1FIAVfxR5Kr

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  3 ++
 target/arm/sve.decode      |  8 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++------
 target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 96bd200e73..6e9479800d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -689,16 +689,19 @@ DEF_HELPER_FLAGS_4(sve_zip_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_zip_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_zip_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_zip_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_zip_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_uzp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_uzp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_uzp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_uzp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uzp_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_trn_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_trn_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index df870ce23b..32e11301a5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -590,6 +590,14 @@ UZP2_z          00000101 .. 1 ..... 011 011 ..... .....         @rd_rn_rm
 TRN1_z          00000101 .. 1 ..... 011 100 ..... .....         @rd_rn_rm
 TRN2_z          00000101 .. 1 ..... 011 101 ..... .....         @rd_rn_rm
 
+# SVE2 permute vector segments
+ZIP1_q          00000101 10 1 ..... 000 000 ..... .....         @rd_rn_rm_e0
+ZIP2_q          00000101 10 1 ..... 000 001 ..... .....         @rd_rn_rm_e0
+UZP1_q          00000101 10 1 ..... 000 010 ..... .....         @rd_rn_rm_e0
+UZP2_q          00000101 10 1 ..... 000 011 ..... .....         @rd_rn_rm_e0
+TRN1_q          00000101 10 1 ..... 000 110 ..... .....         @rd_rn_rm_e0
+TRN2_q          00000101 10 1 ..... 000 111 ..... .....         @rd_rn_rm_e0
+
 ### SVE Permute - Predicated Group
 
 # SVE compress active elements
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 754301a3a6..d5701cb4e8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3338,36 +3338,45 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
         *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
         *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
     }                                                                \
+    if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
+        memset(vd + oprsz - 16, 0, 16);                              \
+    }                                                                \
 }
 
 DO_ZIP(sve_zip_b, uint8_t, H1)
 DO_ZIP(sve_zip_h, uint16_t, H1_2)
 DO_ZIP(sve_zip_s, uint32_t, H1_4)
 DO_ZIP(sve_zip_d, uint64_t, )
+DO_ZIP(sve2_zip_q, Int128, )
 
 #define DO_UZP(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
 {                                                                      \
     intptr_t oprsz = simd_oprsz(desc);                                 \
-    intptr_t oprsz_2 = oprsz / 2;                                      \
     intptr_t odd_ofs = simd_data(desc);                                \
-    intptr_t i;                                                        \
+    intptr_t i, p;                                                     \
     ARMVectorReg tmp_m;                                                \
     if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                      \
         vm = memcpy(&tmp_m, vm, oprsz);                                \
     }                                                                  \
-    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                      \
-        *(TYPE *)(vd + H(i)) = *(TYPE *)(vn + H(2 * i + odd_ofs));     \
-    }                                                                  \
-    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                      \
-        *(TYPE *)(vd + H(oprsz_2 + i)) = *(TYPE *)(vm + H(2 * i + odd_ofs)); \
-    }                                                                  \
+    i = 0, p = odd_ofs;                                                \
+    do {                                                               \
+        *(TYPE *)(vd + H(i)) = *(TYPE *)(vn + H(p));                   \
+        i += sizeof(TYPE), p += 2 * sizeof(TYPE);                      \
+    } while (p < oprsz);                                               \
+    p -= oprsz;                                                        \
+    do {                                                               \
+        *(TYPE *)(vd + H(i)) = *(TYPE *)(vm + H(p));                   \
+        i += sizeof(TYPE), p += 2 * sizeof(TYPE);                      \
+    } while (p < oprsz);                                               \
+    tcg_debug_assert(i == oprsz);                                      \
 }
 
 DO_UZP(sve_uzp_b, uint8_t, H1)
 DO_UZP(sve_uzp_h, uint16_t, H1_2)
 DO_UZP(sve_uzp_s, uint32_t, H1_4)
 DO_UZP(sve_uzp_d, uint64_t, )
+DO_UZP(sve2_uzp_q, Int128, )
 
 #define DO_TRN(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
@@ -3381,12 +3390,16 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
         *(TYPE *)(vd + H(i + 0)) = ae;                                 \
         *(TYPE *)(vd + H(i + sizeof(TYPE))) = be;                      \
     }                                                                  \
+    if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                  \
+        memset(vd + oprsz - 16, 0, 16);                                \
+    }                                                                  \
 }
 
 DO_TRN(sve_trn_b, uint8_t, H1)
 DO_TRN(sve_trn_h, uint16_t, H1_2)
 DO_TRN(sve_trn_s, uint32_t, H1_4)
 DO_TRN(sve_trn_d, uint64_t, )
+DO_TRN(sve2_trn_q, Int128, )
 
 #undef DO_ZIP
 #undef DO_UZP
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1cc98a1447..0cfc90b483 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2624,6 +2624,32 @@ static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
     return do_zip(s, a, true);
 }
 
+static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn) + high_ofs,
+                           vec_full_reg_offset(s, a->rm) + high_ofs,
+                           vsz, vsz, 0, gen_helper_sve2_zip_q);
+    }
+    return true;
+}
+
+static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_zip_q(s, a, false);
+}
+
+static bool trans_ZIP2_q(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_zip_q(s, a, true);
+}
+
 static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_b, gen_helper_sve_uzp_h,
     gen_helper_sve_uzp_s, gen_helper_sve_uzp_d,
@@ -2639,6 +2665,22 @@ static bool trans_UZP2_z(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_data_ool(s, a, 1 << a->esz, uzp_fns[a->esz]);
 }
 
+static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_uzp_q);
+}
+
+static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_uzp_q);
+}
+
 static gen_helper_gvec_3 * const trn_fns[4] = {
     gen_helper_sve_trn_b, gen_helper_sve_trn_h,
     gen_helper_sve_trn_s, gen_helper_sve_trn_d,
@@ -2654,6 +2696,22 @@ static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
 }
 
+static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_trn_q);
+}
+
+static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+        return false;
+    }
+    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_trn_q);
+}
+
 /*
  *** SVE Permute Vector - Predicated Group
  */
-- 
2.25.1

