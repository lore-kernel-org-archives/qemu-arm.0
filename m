Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192740njb;
        Wed, 11 Dec 2024 08:36:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2pwqo7dmxZfU+3hFL2eXeDr7z5XMXu2DwT9xz4WpDGvfnti75HOmZaLzaoH5KFqkJqQzFv6WQRYhsjA==@linaro.org
X-Google-Smtp-Source: AGHT+IFCPHj3e88gGFfTn5liThCKxvu1zLcalTSYpujyW3DBQ5/TOsdYT27glaeq7hYLOLExh72a
X-Received: by 2002:ad4:5caa:0:b0:6d9:3016:d103 with SMTP id 6a1803df08f44-6d934b8fb01mr64149976d6.36.1733934979084;
        Wed, 11 Dec 2024 08:36:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934979; cv=none;
        d=google.com; s=arc-20240605;
        b=VkA4GUP6gUOaoYUGJ7GfJwiU08BCfWw3D9kZO2+q25siSqM09/PgNtlY1EfUq/FMUw
         x6CLkhnqsJZS38NNmHvJ9wUseLr7qCmzaLfY1GRaTf5tJViOcHLnPbGCfJELDSpgcvNy
         TgG7bKDl/4HBf8KPZHSAU4VE5gWw3ZXzSg3J9+taF0iA3qmplib7KRo0e9LCOfdltay8
         7NioUAeizqhMTjRyXwqTIGjZLhN1ti6MI056lxWh7YNcPWTgqRPX8KRg2KwnrTtdq7yV
         TeCGKjntZcYIiEFjORQJ2X+acnG4Lg7hbJw/FciVRoqT9N0PkkJh6DHx6KvPrRlebosv
         tcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NjJ6yNZWB0Ib9R3vyjGZylRzzND6ZWaBRLDVA9KvYvo=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Gw2Vuei+hgEjkqllDhYEzMzGivX1n3mTv14RuyBuM7JXEwX2usnMaEc9EaWM99UdFH
         O5dAphtHsuh0tjTkdR5NTxcctSc+rGwBNz0X8awWbvYU/cvqttxx4hfmfo/S9W3MXiqD
         q6XPkB2Ah3j59YafueSYifG6ju6Wz2tcojXPAQ/bhD/dREEEMlw5gl5Nrl0WKSuifuK6
         S2SKUSUwJXVbc1/aw4BibToCUG5PIHOLf/RYI9IS+rXz2d/hF0U8mXbhoiBynaqn8cx0
         E7RG0uTnC0Y28dFTHa+JbRXzaicqh1yGZ1GdKynp2GZZJ3BIk879T0zLzyuYSDFzcOZo
         KX/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bVqWRkag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac4588csi184383006d6.515.2024.12.11.08.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bVqWRkag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPgm-0005rc-NU; Wed, 11 Dec 2024 11:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgh-0005i2-Q1
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:35:48 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPge-000220-Nt
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:35:47 -0500
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6d8918ec243so69476686d6.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934944; x=1734539744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjJ6yNZWB0Ib9R3vyjGZylRzzND6ZWaBRLDVA9KvYvo=;
 b=bVqWRkageap/nh0N1JbslJtH2fuikXyTTC0me4wTKIlONz59NbDENLWySu69lsVQA/
 O2pMYKfJRq+ja7zNX33ZmSdaJQ5sDe1FQDI+QlU63N2Ukov3iHvjcGIG0/PPdHIgZCJ7
 1p+fq+2Gqd5UCvcLgDcFNDqhgOWqc0zQ+H/cuan3xHxB9EvqutHsrwte24uoSmXklUnV
 zYd+DYCtArofCH5iFUCdMtYCVZjL0c/BMY+N3h+rty4v1MO/a2CqZGsBLGvcp1iBATrx
 i+2vgFbFAtTjVcYIkEAg1bJj84IwciOLA63t8XG4AU7uHGztL6d396A2Fh9dP9F4/27K
 TQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934944; x=1734539744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjJ6yNZWB0Ib9R3vyjGZylRzzND6ZWaBRLDVA9KvYvo=;
 b=JnXJlmKSmfDbZRrPiMmo0p+gBfgBI94+TDVEJYeZw+kr9TPgR7uKsCXRt+rOwSRwR6
 oL3hBRYD6ewA7Oc/HEYlE3drEY32KGl3T+Z2cvGIWIIAk4ErYWJJQrGNk8lVFyp0U1ZH
 xGkY1MW0y5O5cGfvpnv7HNK77Zrkwr9fSuJKZnUlLsaaYRnfkhl03c50erB2uv4M1fHy
 g8RGufKzVlZnsVRCaYWMlnhGnZ4ge/iW+llOli/M80aW39cVjKrzwd/NorN2TWiwwkqf
 L14bxDTBIf6A36534gwKaTeIXaVraolPB1lJWW0dMF/CrIpi6rHc0rCOejHgUM6uRGWK
 3K3A==
X-Gm-Message-State: AOJu0YygHFUuLsoVFFoYdYpV9u7vzZBKRouayVBYXe+pFhLiw84aOjod
 wImM5Yn3SMC+NS8/QVz5Msd/Y01agQsbz0qf3gabxww2mh9AhY9zOLuCk7ydBpg=
X-Gm-Gg: ASbGncucNfzRIy31rrfahIVzQKGRaiQcmai2z4P30R+TXrZ/IOAQcAVx4vH28LR8v5E
 I4BysFscfV2qZQ/oP1+UsypmAeyA2s810fguJE7bs00OXBvEJiLxWk90QUwKVI70ariM9FFXxsc
 xaDNbCKgT0uhNnH/w5FvL8LURBKKPK3vf7tQaaKgMXq0c40OZQp8JZPi1E3sbTaCotNHfX4ksQ/
 GIPkGrUup9KzvXXzgy54NXSRSSjoY8Wh3mruV6sH97bKKG3QWNNUQefJAMoyw==
X-Received: by 2002:a05:6214:2489:b0:6d4:27fd:a99d with SMTP id
 6a1803df08f44-6d934b0e3eemr59079626d6.19.1733934943694; 
 Wed, 11 Dec 2024 08:35:43 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:35:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 42/69] target/arm: Introduce gen_gvec_rev{16,32,64}
Date: Wed, 11 Dec 2024 10:30:09 -0600
Message-ID: <20241211163036.2297116-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
X-TUID: +BfKOgd3dNLG

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  6 +++
 target/arm/tcg/gengvec.c        | 58 ++++++++++++++++++++++
 target/arm/tcg/translate-neon.c | 88 +++++++--------------------------
 3 files changed, 81 insertions(+), 71 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index cb8e1b2586..342ebedafc 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -586,6 +586,12 @@ void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_rev16(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_rev32(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_rev64(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t opr_sz, uint32_t max_sz);
 
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 85a0b50496..33c0a94958 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2409,3 +2409,61 @@ void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
                        gen_helper_gvec_rbit_b);
 }
+
+void gen_gvec_rev16(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_8);
+    tcg_gen_gvec_rotli(MO_16, rd_ofs, rn_ofs, 8, opr_sz, max_sz);
+}
+
+static void gen_bswap32_i64(TCGv_i64 d, TCGv_i64 n)
+{
+    tcg_gen_bswap64_i64(d, n);
+    tcg_gen_rotli_i64(d, d, 32);
+}
+
+void gen_gvec_rev32(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t opr_sz, uint32_t max_sz)
+{
+    static const GVecGen2 g = {
+        .fni8 = gen_bswap32_i64,
+        .fni4 = tcg_gen_bswap32_i32,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+        .vece = MO_32
+    };
+
+    switch (vece) {
+    case MO_16:
+        tcg_gen_gvec_rotli(MO_32, rd_ofs, rn_ofs, 16, opr_sz, max_sz);
+        break;
+    case MO_8:
+        tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void gen_gvec_rev64(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t opr_sz, uint32_t max_sz)
+{
+    static const GVecGen2 g[] = {
+        { .fni8 = tcg_gen_bswap64_i64,
+          .vece = MO_64 },
+        { .fni8 = tcg_gen_hswap_i64,
+          .vece = MO_64 },
+    };
+
+    switch (vece) {
+    case MO_32:
+        tcg_gen_gvec_rotli(MO_64, rd_ofs, rn_ofs, 32, opr_sz, max_sz);
+        break;
+    case MO_8:
+    case MO_16:
+        tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 50d0bf7753..ca6f5578b4 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -2565,58 +2565,6 @@ static bool trans_VDUP_scalar(DisasContext *s, arg_VDUP_scalar *a)
     return true;
 }
 
-static bool trans_VREV64(DisasContext *s, arg_VREV64 *a)
-{
-    int pass, half;
-    TCGv_i32 tmp[2];
-
-    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vd | a->vm) & a->q) {
-        return false;
-    }
-
-    if (a->size == 3) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    tmp[0] = tcg_temp_new_i32();
-    tmp[1] = tcg_temp_new_i32();
-
-    for (pass = 0; pass < (a->q ? 2 : 1); pass++) {
-        for (half = 0; half < 2; half++) {
-            read_neon_element32(tmp[half], a->vm, pass * 2 + half, MO_32);
-            switch (a->size) {
-            case 0:
-                tcg_gen_bswap32_i32(tmp[half], tmp[half]);
-                break;
-            case 1:
-                gen_swap_half(tmp[half], tmp[half]);
-                break;
-            case 2:
-                break;
-            default:
-                g_assert_not_reached();
-            }
-        }
-        write_neon_element32(tmp[1], a->vd, pass * 2, MO_32);
-        write_neon_element32(tmp[0], a->vd, pass * 2 + 1, MO_32);
-    }
-    return true;
-}
-
 static bool do_2misc_pairwise(DisasContext *s, arg_2misc *a,
                               NeonGenWidenFn *widenfn,
                               NeonGenTwo64OpFn *opfn,
@@ -3122,6 +3070,7 @@ DO_2MISC_VEC(VCGE0, gen_gvec_cge0)
 DO_2MISC_VEC(VCLT0, gen_gvec_clt0)
 DO_2MISC_VEC(VCLS, gen_gvec_cls)
 DO_2MISC_VEC(VCLZ, gen_gvec_clz)
+DO_2MISC_VEC(VREV64, gen_gvec_rev64)
 
 static bool trans_VMVN(DisasContext *s, arg_2misc *a)
 {
@@ -3139,6 +3088,22 @@ static bool trans_VCNT(DisasContext *s, arg_2misc *a)
     return do_2misc_vec(s, a, gen_gvec_cnt);
 }
 
+static bool trans_VREV16(DisasContext *s, arg_2misc *a)
+{
+    if (a->size != 0) {
+        return false;
+    }
+    return do_2misc_vec(s, a, gen_gvec_rev16);
+}
+
+static bool trans_VREV32(DisasContext *s, arg_2misc *a)
+{
+    if (a->size != 0 && a->size != 1) {
+        return false;
+    }
+    return do_2misc_vec(s, a, gen_gvec_rev32);
+}
+
 #define WRAP_2M_3_OOL_FN(WRAPNAME, FUNC, DATA)                          \
     static void WRAPNAME(unsigned vece, uint32_t rd_ofs,                \
                          uint32_t rm_ofs, uint32_t oprsz,               \
@@ -3218,25 +3183,6 @@ static bool do_2misc(DisasContext *s, arg_2misc *a, NeonGenOneOpFn *fn)
     return true;
 }
 
-static bool trans_VREV32(DisasContext *s, arg_2misc *a)
-{
-    static NeonGenOneOpFn * const fn[] = {
-        tcg_gen_bswap32_i32,
-        gen_swap_half,
-        NULL,
-        NULL,
-    };
-    return do_2misc(s, a, fn[a->size]);
-}
-
-static bool trans_VREV16(DisasContext *s, arg_2misc *a)
-{
-    if (a->size != 0) {
-        return false;
-    }
-    return do_2misc(s, a, gen_rev16);
-}
-
 static void gen_VABS_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                        uint32_t oprsz, uint32_t maxsz)
 {
-- 
2.43.0

