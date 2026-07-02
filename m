Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E3CC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 20:45:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfOG7-0006mh-5X; Thu, 02 Jul 2026 16:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFs-0006di-PI
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:30 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFo-0000Sw-Ja
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-845b6d9bf39so1080126b3a.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783025000; x=1783629800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgH2sd2miBDVDSuqMbMJY51o2ZIEn6agyauWQIe9T8w=;
 b=GNzTiPdtVPzlJmfOqSYjfYuxejRx2YcPb+BB/6o7VNA131u9+4uxa0VXMbcbwElDov
 svUlrdej2mYY2q+2Vc1ul8/kT+l6dznAe7F2Qmw6D+ia1RyiW9FDLxMzjg56GJuwYKvq
 umzBLf0tPTjJOX86gouHb5nXim30s3qNOpNr3bve90w2OBUG0PJyPCoZ9/pIYxgO92/k
 IzNPzYWjsFmYlrT8vw8fhuqkOUKCJeWZXJs9zEe4lAfHPJId/zV69WMKFMIKd27NA8QV
 HfH4780f+/UYmjNqYv/gZcpeO2vtu8ZlOM5C/fxS84eKgHb3sPwWS5w2YKByl4tTFvFr
 2d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783025000; x=1783629800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VgH2sd2miBDVDSuqMbMJY51o2ZIEn6agyauWQIe9T8w=;
 b=M7mvj1oRAWTjcAsa0+h5ymVraIlOzys+crxY8UgZ51LL3JNHBLImXn/OvV80N6G0ZW
 mDZE0kiAO9PrdJNJloSENYfLUgOMbKz5+WJCTnJMYN+rb3j8N9HQI3JhWHz5BCJI89ec
 NxMvvvnmXdX/g9QfOUk5zem/s9pYzM2delU7OYMWy3bSHLsC4PvrCbu1m+U1GY/0UrsK
 MGonEkSEPbob7y2HkqSfEoeV6oXh//yqFsFDZ5QiPZNPKazZJO8Kz7JdHdNXGuDQTNP9
 j6zgGyXmnCltRMonZ324gPRrZBKCu3f5y2Sb/UZmTOkH+beg5TCZsd4gUdQnPuIiM0kW
 y0Ww==
X-Gm-Message-State: AOJu0Yz9za+lY4XKBQwQFqdxNT0bnHL1L00cSIF+HM7oeJd+uDzxiFUF
 NxGZUe7/g7yI6j352PhtpyF8EsOsC9xdg2qcHL2bF2XF/W7h2UZyHSddSK3X8T/2Z8g=
X-Gm-Gg: AfdE7clZDgls8G5bGRCZB1ct8Qm89U//22Pli5nVaHCcoOdrqM5KICkjl4l8BP8xo4O
 PhM4eKlyX8O40/wL3RRz3GePhq9JFEi9wpFUrZizvsp7KZX5A2vs03xfa6Lh3RmzNZm2SGxqnzS
 d/QYMy3wnqrs+oiRY4gKhFGlSplmlyiAa9SouWKoCA5hEr13QVxeVDbElsS/Fnt+FAm4m6TUJry
 YcQ6FE9xRSG8Qn8baSS60FMsTcwKMGTph2RVEaaBubUb5O4iYIWFohNJ5xHYAHnQr2nShly/ke7
 W6Zm64afZGPcc1Jg9KK/6LuI4TlH/v/tZlC9oSL4mHp7uejGP/0pDolZu6NWESJKPJy6LzqdQSA
 7nzC8O7NsfqAZYIyqMIrv8sdkQk0a6UlbNaKhFbu4GAqG6FENWRXrzc8gazmUI0lguhS5iGzweH
 GEeawPB8Dkzukje7n/B75x0gt1+yB9ApkjXF1IVa+Cq9txB+c+Qw==
X-Received: by 2002:a05:6a00:993:b0:847:9301:48e9 with SMTP id
 d2e1a72fcca58-847e17aba3cmr1216845b3a.15.1783025000297; 
 Thu, 02 Jul 2026 13:43:20 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9e921cd139sm1678941a12.23.2026.07.02.13.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:43:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/15] target/arm: Implement BFMOP4 (widening)
Date: Thu,  2 Jul 2026 13:43:04 -0700
Message-ID: <20260702204314.79224-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702204314.79224-1-richard.henderson@linaro.org>
References: <20260702204314.79224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


