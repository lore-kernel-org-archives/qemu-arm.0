Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878A5CD6E7B
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:53:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoH-0006qw-It; Thu, 04 Jun 2026 19:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoF-0006nn-Cg
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:11 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoD-0007xc-2Q
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:11 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c0c3315c5dso13683215ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616948; x=1781221748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0r7wpsbVgy960OZdgGRejoA9UrlzPFOcs7JjOtmCmrI=;
 b=AQ2f2lDMh7CHUyy5mShWX2AA+MMApO3yT5FKjQrizYxS6ZXC77WIczfrzCFmNvThcY
 K0FLShBCjYQ5Z02a5keRyJTJhV3XImFRWFd9rnxUjP0yFqUvJy0PWpnQFy2tRxZWZRuR
 +SQ2oH/XbonpfEZ5B+JPUYXAAPHrS87SXqRPd2Q1C1ELU2gFiKrztIQETFrKQ0++h67g
 qlNPKnzfm1UGTM/Ac/aAuBMNZotQ7gzFDXjY2WWU0PZ38WaOyrg4drHi4Pm0IDN9pKAR
 ZrA7kZoWmO+Sfq8DdpB00vJyWxGdNfzFsnTcW6iukgvMR8YJa6SwFEgACHuqeq/K0Sj1
 nJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616948; x=1781221748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0r7wpsbVgy960OZdgGRejoA9UrlzPFOcs7JjOtmCmrI=;
 b=OV/oU9zNsG19vYnrlwLOu/nHXAvx0rh0U3gBjQ7eHq85a5H+W79Q1J6UEdchLwcRbD
 mLgcZ5FugMCbQBVByqLiG4FEbqiwLFqHq/6fJipG7CXg/wKOonJsrrgl41RRxWXzWMi1
 EiBrk37IKQXLnufewdgjs70M5tSLj44z6K8KIUynyjE5qayJfzwoo1rrbfRtaNGL46YJ
 rWG2lus+i8ZOM7WkwfekKjkZXw9HQ/3HHHGmJC8WiQTuhRMC2YxN+u5V8ccyIc3BLFPl
 fqRnST48ps9vFOLTLO/UtJk7/TfKUldNRxEab2T6Ahp50dtJT8dfa8KEM5LmUXkiwNSF
 xDew==
X-Gm-Message-State: AOJu0YxMiAuOOUyiUN3dWZceus7Qa0FAyRDbr4eZXDrbLWgksN5ye5O3
 ET22EDWXtomahicIPc3fstOnkyMkYXH+u2Z1YvDeHHfPB7oSwRDT7ymmguCgMjKu0LA=
X-Gm-Gg: Acq92OHQyAcwr9K/QhS2NpYexsBZkjd+9zipqHG7MHjhfpPvUvElIX0vWapiRevaqtN
 OxkO/xPjAvD/Id3R53ZQL8QPrtAqgXM8MOfL656dn50oZIwbA4IhBwWu5M5SHQhUdODgCCMWlHc
 7HfBnoKJmS7cZfa0rZ3dVNQiPn7gjsDK6N/znXOsr/DjFe/7XDP+PpPcHVOvjQjFltzMmy0QGdX
 +/ILJ4BG7s622dBDYyieWZJADPK9YbdYV1uL96kQ1/hytdKjVHO22Y/BBanoS33PogE8PITVy1R
 cqoUMZvLGozXYzj6OvAUfuC2J+Rc7SSrFiNOoY98hWX22MKL6B1VnFCHM85apCFRwNzm8MICJpe
 OP4Tk7n4X/amZtYPFVQgrqcLkcTOIm1KmjXGh+yDOaXFAQCrMalhkGmxONX4u2SlI2VwZ+LxliF
 fabGxzvJv8v47BPo6OBT21JXv6MkLVAp+en/3xJlI=
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id
 d9443c01a7336-2c1e80d2996mr7718075ad.1.1780616947659; 
 Thu, 04 Jun 2026 16:49:07 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/25] target/arm: Implement EXPAND
Date: Thu,  4 Jun 2026 16:48:46 -0700
Message-ID: <20260604234852.573178-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 target/arm/tcg/helper-sve-defs.h |  5 +++++
 target/arm/tcg/sve_helper.c      | 28 ++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  7 +++++++
 target/arm/tcg/sve.decode        |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
index de2254bb19..75c0fc919d 100644
--- a/target/arm/tcg/helper-sve-defs.h
+++ b/target/arm/tcg/helper-sve-defs.h
@@ -3203,3 +3203,8 @@ DEF_HELPER_FLAGS_6(sve2_famin_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve2_famin_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_4(sve2p2_expand_b, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p2_expand_h, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p2_expand_s, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2p2_expand_d, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index c2b3162084..a13ccf4b85 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -8669,3 +8669,31 @@ void HELPER(pext)(void *vd, uint32_t png, uint32_t desc)
         do_whilel(vd, mask, MIN(b_count, vl), vl);
     }
 }
+
+#define DO_EXPAND(NAME, TYPE, H)                                      \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
+{                                                                     \
+    intptr_t oprsz = simd_oprsz(desc);                                \
+    ARMVectorReg tn = *(ARMVectorReg *)vn;                            \
+    intptr_t i = 0, j = 0;                                            \
+    do {                                                              \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
+        do {                                                          \
+            TYPE nn = 0;                                              \
+            if (pg & 1) {                                             \
+                nn = *(TYPE *)((void *)&tn + H(j));                   \
+                j += sizeof(TYPE);                                    \
+            }                                                         \
+            *(TYPE *)(vd + H(i)) = nn;                                \
+            i += sizeof(TYPE);                                        \
+            pg >>= sizeof(TYPE);                                      \
+        } while (i & 15);                                             \
+    } while (i < oprsz);                                              \
+}
+
+DO_EXPAND(sve2p2_expand_b, uint8_t, H1)
+DO_EXPAND(sve2p2_expand_h, uint16_t, H1_2)
+DO_EXPAND(sve2p2_expand_s, uint32_t, H1_4)
+DO_EXPAND(sve2p2_expand_d, uint64_t, H1_8)
+
+#undef DO_EXPAND
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 315ebe82f9..3101f572fa 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -6956,6 +6956,13 @@ static gen_helper_gvec_3 * const sqneg_fns[4] = {
 TRANS_FEAT(SQNEG_m, aa64_sme_or_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
 TRANS_FEAT(SQNEG_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 1)
 
+static gen_helper_gvec_3 * const expand_fns[4] = {
+    gen_helper_sve2p2_expand_b, gen_helper_sve2p2_expand_h,
+    gen_helper_sve2p2_expand_s, gen_helper_sve2p2_expand_d,
+};
+TRANS_FEAT_STREAMING_IF(EXPAND, aa64_sme2p2_or_sve2p2, aa64_sme2p2,
+                        gen_gvec_ool_arg_zpz, expand_fns[a->esz], a, 0)
+
 DO_ZPZZ(SQSHL, aa64_sme_or_sve2, sve2_sqshl)
 DO_ZPZZ(SQRSHL, aa64_sme_or_sve2, sve2_sqrshl)
 DO_ZPZZ(SRSHL, aa64_sme_or_sve2, sve2_srshl)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 2795c2ec7f..5ec1d420c2 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -742,6 +742,8 @@ SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 # SVE2 vector splice (predicated, constructive)
 SPLICE_sve2     00000101 .. 101 101 100 ... ..... .....         @rd_pg_rn
 
+EXPAND          00000101 .. 110 001 100 ... ..... .....         @rd_pg_rn
+
 ### SVE Select Vectors Group
 
 # SVE select vector elements (predicated)
-- 
2.43.0


