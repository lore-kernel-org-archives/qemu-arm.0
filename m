Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE47C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:04:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfr-00068U-FI; Mon, 13 Jul 2026 19:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfq-00066u-2V
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:54 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfo-0005nC-0R
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:53 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso3991655ad.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983770; x=1784588570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c/U/Q9KaL1t57a12jvk2yeR0GpuqsQXc/eJUhWpLOZA=;
 b=CxYK5+d96Oz9DjFBurzLXNKZYZRffqeDTl22Ut+WZ+w/dWisvUKAlAA5inAHDa8eDJ
 sTQzXKcQ5vr03B7Io6kjs3CpbfdG1baBZ7Ke2MlG8np4BsrDyv7mrBNbG47gssjTxrc7
 7EGuWhV4pBBpoMCXrHcSV/WBNyX6UzF01Hl4X34YWJXtwLGcsJeLFpOKxvjdBV8NkYZH
 X4SpfS983l6awhw6CigPYdSkU3QWl58Yaa7cLX82bPAdFJ852MPArBl0xYpgDt+SY64i
 /uMAsEg53mpm+SDtgqb20ja8r5f6ESelbZT/a4JnS9Cm383DmItUNmwdURVZsPhcC+lh
 O9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983770; x=1784588570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c/U/Q9KaL1t57a12jvk2yeR0GpuqsQXc/eJUhWpLOZA=;
 b=KcwpuU+hj6lD2cwx0OCY4/HJEfswgv1oSuBlUfONf1WrH+lgxHy/qxEcAlxzBt9VeE
 vnmQVW5069x426F4XzfWIpO24lyOhjj3H+2xivpUkW2sl76eLtzsfCR/RjuIbFesNNzA
 iosYKwqwfDhmXRRElpRpC5zy2vvjlY4hH6Ht4dCSuxaEG84dFEgNsvetoHkykkNy6/rs
 SlQWMk9X1TH1AbL/yg9lkPcr4L/NchOIbv6Y49OBLoOxua29mc0/VCMOd6ukuuHTFJvc
 /rCnRJYmiw7xEaDgLYJZltdwC8SsAmL9tvVbGSLeVWN+LV4OUDRROZ+7IvLDRKcExrQp
 ZDFg==
X-Gm-Message-State: AOJu0YwK9fK44zv+bNwPx/0CHKL465tk6zor8bK7dPCubmHFB7WQT22v
 tNsL8ruE1Hl83nWW26KuwJ5+iOp6D1nlW7ypr3o9OxOz4cmdZrdRdG1dN4IU9PLNcks/j1CAXxy
 cvJqe
X-Gm-Gg: AfdE7cmOvp21jV71jK9wKcq3gbr1RGjHCjbz7AUyq+aCQMbixRgrhWUaEz2YEN3iT45
 dMheHxo4W/gapPDf5WbVnV+Gr3NcedNy5Uet5J0FNHl+HyR2zzEbETFF1Q2viDxsnYkxnUQE5yG
 b4FFYGVUi/AN7iJ1HEAfBup7KYn9Hl+IKzq6Kq8xP+kIrL9GJN/1BZBZxwUaK3iHP32uo8dezsr
 lDOimuHtJcz55gNql0yIvxVdcdJLrfS5ApW9DIBhWMgaqCYH5DuaI9YuK+wqQG8eqBNNFl/5ast
 e/LUhR7ImCCI8xtxY3nw1O9t6ymgcHq8hQZgCpHKNOQVSezStxhWWQquloh1/uVnf/aK91WnQvQ
 VY6ajLTvSbBOuZvKadwUNptNQd3xW9a9F9EE88oyMPkZ28IgIfrGds2Re10X3OGDSDS962UBHi3
 xp4BuuAJWQnkYf9zEOSTarPyGqJo9a
X-Received: by 2002:a17:902:d98b:b0:2ca:1bbe:c3d0 with SMTP id
 d9443c01a7336-2ce9f3d5e4amr101786985ad.43.1783983770461; 
 Mon, 13 Jul 2026 16:02:50 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/10] target/arm: Implement FTMOPA (widening, 2-way,
 FP8 to FP16)
Date: Mon, 13 Jul 2026 16:02:40 -0700
Message-ID: <20260713230244.70174-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
References: <20260713230244.70174-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 43 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 12 +++++++++
 target/arm/tcg/sme.decode        |  2 ++
 5 files changed, 64 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index d3bf0746cb..1ab6c90b8c 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1852,6 +1852,11 @@ static inline bool isar_feature_aa64_sme_tmop_f16f16(const ARMISARegisters *id)
     return isar_feature_aa64_sme_tmop(id) && isar_feature_aa64_sme_f16f16(id);
 }
 
+static inline bool isar_feature_aa64_sme_tmop_f8f16(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme_tmop(id) && isar_feature_aa64_sme_f8f16(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index dedbd8541c..13be62aa15 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -47,3 +47,5 @@ DEF_HELPER_FLAGS_5(sme_fvdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_5(sme_fmop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(sme_fmop4a_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_6(sme_ftmopa_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 4b046f5f26..305cafdc9b 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -1005,3 +1005,46 @@ void HELPER(sme_fmop4a_hb)(void *vza, void *vzn, void *vzm,
     FP8MulContext ctx = fp8_mul_start(env, 0xf);
     sme_mop4(vza, vzn, vzm, &ctx, desc, sizeof(float16), inner_fmop4a_hb);
 }
+
+void HELPER(sme_ftmopa_hb)(void *vza, void *vzn, void *vzm, void *vzk,
+                           CPUArchState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    intptr_t oprsz = simd_maxsz(desc);
+    intptr_t dim = oprsz >> MO_16;
+    intptr_t index = simd_data(desc);
+    intptr_t ctrl_base = (index * oprsz) >> 1;
+    uint8_t *zn0 = vzn, *zn1 = vzn + sizeof(ARMVectorReg);
+    uint16_t *za = vza, *zm = vzm;
+    uint64_t *zk = vzk;
+
+    for (intptr_t row = 0; row < dim; row++) {
+        uint16_t *za_row = za + tile_vslice_offset(row);
+
+        for (intptr_t col = 0; col < dim; col++) {
+            uint16_t e2 = zm[H2(col)];
+            uint16_t *e3 = za_row + H2(col);
+            uint16_t e1 = 0;
+
+            /*
+             * Four control bits select two elements.  The two elements
+             * may be non-contiguous, so assemble them locally into e1.
+             * Pseudo-code has a double loop running forward, with a
+             * test for (i < 2) to limit construction to 2 elements.
+             * Easier to run a single loop backward, shifting extra
+             * elements off the top of our uint16_t.
+             */
+            uint64_t this_ctrl = extractn(zk, ctrl_base + col * 4, 4);
+            for (int i = 3; i >= 0; i--) {
+                if (this_ctrl & (1 << i)) {
+                    bool e = i & 1;
+                    bool r = i & 2;
+                    uint8_t *p = (r ? zn1 : zn0) + H1(2 * row + e);
+                    e1 = (e1 << 8) | *p;
+                }
+            }
+
+            *e3 = f8dotadd_h(e1, e2, 2, *e3, &ctx);
+        }
+    }
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 43d1726972..395652f477 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2167,3 +2167,15 @@ TRANS_FEAT(BFTMOPA_sh, aa64_sme_tmop, do_tmop_fp,
            a, MO_32, FPST_ENV, gen_helper_sme_bftmopa_sh)
 TRANS_FEAT(FTMOPA_sh, aa64_sme_tmop, do_tmop_fp,
            a, MO_32, FPST_ENV, gen_helper_sme_ftmopa_sh)
+
+static bool do_tmop_fp8(DisasContext *s, arg_tmop *a, MemOp esz,
+                        gen_helper_gvec_4_ptr *fn)
+{
+    if (!fpmr_access_check(s)) {
+        return true;
+    }
+    return do_tmop_fp(s, a, esz, FPST_ENV, fn);
+}
+
+TRANS_FEAT(FTMOPA_hb, aa64_sme_tmop_f8f16, do_tmop_fp8,
+           a, MO_16, gen_helper_sme_ftmopa_hb)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 5c453ea729..da6f4686d3 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1148,3 +1148,5 @@ FTMOPA_ss       1000 0000 010 ..... 000 ... .... .. 00 ..       @tmop_o2
 
 BFTMOPA_sh      1000 0001 010 ..... 000 ... .... .. 00 ..       @tmop_o2
 FTMOPA_sh       1000 0001 011 ..... 000 ... .... .. 00 ..       @tmop_o2
+
+FTMOPA_hb       1000 0000 011 ..... 000 ... .... .. 100 .       @tmop_o1
-- 
2.43.0


