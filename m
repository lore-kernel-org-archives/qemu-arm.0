Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B873CDE00B
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:36:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfI-0004el-0b; Thu, 25 Jun 2026 18:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcseg-0004WP-Vq
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcseZ-0002K6-Su
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:39 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-842358aaf36so115484b3a.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426725; x=1783031525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccxd1+lNvbzcZiCchkXOq85BfqNMWQBzMgKBQRJxBZY=;
 b=dF1HHutl/Z5KggtFa7NH++2s9KVgyAhlj5afpn9ThxaqJ45XdJAAA+7YH/5ZFqRBTR
 5ChIgmMGXPirMfxJwWorcCfAB4bF7nQKQKcR8UXSwEGa4Xz2n8fkgazToS8AnpRHoUFy
 Weksg7L9SO61rf7oD+cJM4BPhIlW9t/MzEzU0ue3ap7bw06KaxF+F9Mp4rRwnlCYJtUD
 tOZLMx250VoqMRYK4fnwJBTUg5JdnpIY9nyWFizk1U1EygCdNGdzqxkPTHiMLRKBs9Oz
 j0gzGb8k3bMyczSB2V8ojaFHNyLY7dmNriVclEB8jE9ElGqQ6Dbdb5RZNgtUguZAPO0s
 w7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426725; x=1783031525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ccxd1+lNvbzcZiCchkXOq85BfqNMWQBzMgKBQRJxBZY=;
 b=GnXzr1aPBlVloA5RSinXwQoq7Hz3TWXK18cBA9VzQGXDLgxoWJVcs5aJb8tOe/0g3q
 XSEW8UCmITy46yCarP139Xv2BUak+KHdFM/gu899p7C2HYXgTlS67x26MygLpo3KV7xt
 U7s70ISrML8g0qfhehdEbQduiGL2u++N9Ogfb+6mlPlFrqn8f7zhNNZ7QO3TRQg360Z7
 g9i1v+Ag13mxap+6odXSss190WvetICpI8bLccTaN5v5KazuIiZrl5onpmkr93LE8yce
 EIg3/BdnmVsKGNuPn8pQ7zohVKIsYlybuKmkjNnbo8EJoeH7JHiOyvy4SsoWgDE7bsc4
 4bjw==
X-Gm-Message-State: AOJu0YxUV0bc0iIplKXh3Uft5h74K7mLx48NeWw7rYGzPW7PeJE0julO
 rFCTRUmTPQwEuj+Rsdx6flh5dovU8aGAt+64avRO7O1j7rCZt0FmP9CQC2tec32LLfc=
X-Gm-Gg: AfdE7ckcTl2/CD/Pmc6IPQYEOsqfG+SxjteJqCkdfcI3G5wlAGGfF8zaMMl5v/4xXbi
 FRWjFjX1ocLGEIsGaRzANpoUf9BRiFuUfb3pwQJJCb2GpXTsQL5zx1gMsoRg7IpXSfZPpb5O3N+
 aUHoDltLlKwu17BwFK2qSQ7dcC4ccDIEMSrkxu5YRghf1tkQut4SbBa8BBgPrFc4VkzcQkl+x2e
 m/ckquJmqv8l1IyL3JxjkR+/sL9MWA6/bXtZEzWOhzRw/ksKjOWN6OzxL9BBAauhNGuDig0M0nl
 +qdR1J7ovCYxsGRGx3jWZ3zxPxoCAwWnWnsFexy75UNGiybya33WGagQ5zlRou1T2W7kQ8a/3Ms
 G4lz3s6roW+TyY5v5Xv+HQ0QFPTqFX7CmtMxF45txqoKMsucf9SJaZwKAXz/XZ8eFDNyx7TcoNr
 p2DBOkM+IgfqncaJKWQOIaqHpqvYKjakpmL7sTy6ZzUoYXzn45kw==
X-Received: by 2002:a05:6a00:230a:b0:842:6ec3:2359 with SMTP id
 d2e1a72fcca58-845b3af0ebfmr4487529b3a.45.1782426725132; 
 Thu, 25 Jun 2026 15:32:05 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/15] target/arm: Implement BFMOP4 (widening)
Date: Thu, 25 Jun 2026 15:31:50 -0700
Message-ID: <20260625223200.763198-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/tcg/helper-sme-defs.h |  4 ++
 target/arm/tcg/sme_helper.c      | 84 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 16 ++++--
 target/arm/tcg/sme.decode        |  2 +
 4 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 05ccb0d1e2..0e4bb12b38 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -371,3 +371,7 @@ DEF_HELPER_FLAGS_5(sme_ah_fmop4s_dd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst,
 DEF_HELPER_FLAGS_5(sme_bfmop4a_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sme_bfmop4s_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sme_ah_bfmop4s_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_5(sme_bfmop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(sme_bfmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(sme_ah_bfmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 0de7dd84e5..5a661ca616 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2803,3 +2803,87 @@ void HELPER(sme_ah_bfmop4s_hh)(void *vza, void *vzn, void *vzm,
 {
     sme_mop4(vza, vzn, vzm, fpst, desc, sizeof(bfloat16), inner_ah_bfmop4s_hh);
 }
+
+static void inner_bfmop4a_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = bfdotadd(*d, *n, *m, fpst);
+}
+
+static void inner_ebf_bfmop4a_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = bfdotadd_ebf(*d, *n, *m, fpst);
+}
+
+void HELPER(sme_bfmop4a_sh)(void *vza, void *vzn, void *vzm,
+                            CPUArchState *env, uint32_t desc)
+{
+    float_status fpst;
+
+    sme_mop4(vza, vzn, vzm, &fpst, desc, sizeof(float32),
+             is_ebf(env, &fpst) ? inner_ebf_bfmop4a_sh
+                                : inner_bfmop4a_sh);
+}
+
+static void inner_bfmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = bfdotadd(*d, *n ^ 0x80008000u, *m, fpst);
+}
+
+static void inner_ebf_bfmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = bfdotadd_ebf(*d, *n ^ 0x80008000u, *m, fpst);
+}
+
+void HELPER(sme_bfmop4s_sh)(void *vza, void *vzn, void *vzm,
+                            CPUArchState *env, uint32_t desc)
+{
+    float_status fpst;
+
+    sme_mop4(vza, vzn, vzm, &fpst, desc, sizeof(float32),
+             is_ebf(env, &fpst) ? inner_ebf_bfmop4s_sh
+                                : inner_bfmop4s_sh);
+}
+
+static void inner_ah_bfmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = bfdotadd(*d, bf16mop_ah_neg_adj_pair(*n, -1), *m, fpst);
+}
+
+static void inner_ebf_ah_bfmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = bfdotadd_ebf(*d, bf16mop_ah_neg_adj_pair(*n, -1), *m, fpst);
+}
+
+void HELPER(sme_ah_bfmop4s_sh)(void *vza, void *vzn, void *vzm,
+                               CPUArchState *env, uint32_t desc)
+{
+    float_status fpst;
+
+    sme_mop4(vza, vzn, vzm, &fpst, desc, sizeof(float32),
+             is_ebf(env, &fpst) ? inner_ebf_ah_bfmop4s_sh
+                                : inner_ah_bfmop4s_sh);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index f833975875..df4a5c2125 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2004,8 +2004,7 @@ TRANS_FEAT(LUTI4_s_4b, aa64_sme2p1_lutv2, do_lut_s4, a,
            gen_helper_sme2_luti4_4b)
 
 static bool do_mop4_fp(DisasContext *s, arg_mop4 *a, MemOp esz,
-                       ARMFPStatusFlavour e_fpst,
-                       gen_helper_gvec_3_ptr * const fns[3])
+                       int e_fpst, gen_helper_gvec_3_ptr * const fns[3])
 {
     int svl = streaming_vec_reg_size(s);
     uint32_t desc = simd_desc(svl, svl, (a->m << 1) | a->n);
@@ -2019,7 +2018,11 @@ static bool do_mop4_fp(DisasContext *s, arg_mop4 *a, MemOp esz,
     za = get_tile(s, esz, a->zad);
     zn = vec_full_reg_ptr(s, a->zn);
     zm = vec_full_reg_ptr(s, a->zm);
-    fpst = fpstatus_ptr(e_fpst);
+    if (e_fpst >= 0) {
+        fpst = fpstatus_ptr(e_fpst);
+    } else {
+        fpst = tcg_env;
+    }
 
     fns[fns_idx](za, zn, zm, fpst, tcg_constant_i32(desc));
     return true;
@@ -2055,3 +2058,10 @@ static gen_helper_gvec_3_ptr * const fmop4_dd[3] = {
 };
 TRANS_FEAT(FMOP4_dd, aa64_sme_mop4_f64f64,
            do_mop4_fp, a, MO_64, FPST_ZA, fmop4_dd)
+
+static gen_helper_gvec_3_ptr * const bfmop4_sh[3] = {
+    gen_helper_sme_bfmop4a_sh,
+    gen_helper_sme_bfmop4s_sh,
+    gen_helper_sme_ah_bfmop4s_sh
+};
+TRANS_FEAT(BFMOP4_sh, aa64_sme_mop4, do_mop4_fp, a, MO_32, FPST_ENV, bfmop4_sh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 6021803ca0..12a3a61432 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1105,3 +1105,5 @@ BFMOP4_hh       1000 0001 001. ...0 0000 00.. ..0. 100.         @mop4_o1
 FMOP4_hh        1000 0001 000. ...0 0000 00.. ..0. 100.         @mop4_o1
 FMOP4_ss        1000 0000 000. ...0 0000 00.. ..0. 00..         @mop4_o2
 FMOP4_dd        1000 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
+
+BFMOP4_sh       1000 0001 000. ...0 0000 00.. ..0. 00..         @mop4_o2
-- 
2.43.0


