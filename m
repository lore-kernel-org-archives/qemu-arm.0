Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C1C4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:49:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWh-0001sJ-K6; Tue, 21 Jul 2026 14:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFV1-00018G-Dy
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:28 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUz-0006hY-63
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2caea3f742bso139898265ad.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659642; x=1785264442; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DcdpeRn0/HAEk3CxOheIPUYZqTxloeiJkVjw0K4nE7M=;
 b=icZCmyq2eADQlLqLIewcw/1DS/OhAxVELYQYo9fAo6EsfGuxqMvsgF3WJXg/QPrNPU
 qLEVdHUtUVoetQQBH9OBRzBlbDwoBky6dTG5B0Q9Gmgu8AQORyimrmXwN/gWkGNCiCiZ
 uz22qV9BtTi2CrSaXFlcAHtbU0efFMiSUHNtHZiG/8cBCHktfLrsuT0yNXi93U6Pmn9V
 XJ9YO9Qr4GnUps0r/kOOVzT3jfoi1OpZhKVfNrZxgD0NzxpcA3X8y0+riAsmaJ1NkdgD
 zRw6FYbajXvMLkaZ1pl/OtUGGyVXIs9FWpf8RATeiNe8YF6F6skRSWOP5CPsvhm1EN7F
 CBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659642; x=1785264442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DcdpeRn0/HAEk3CxOheIPUYZqTxloeiJkVjw0K4nE7M=;
 b=QMnZmDYpXg5O/ksgBJm1n/L+gzA63OnS+MShY3G3s/c2TqeTMTArTERj4jkTGMvPEQ
 z+1bU8/W+jvOhVdNT8+MkJaQCj4XGEOU9GYDosH239yPIoV8JsvemZZvptMzqfnmvebI
 SbxpBaAOZKtFetWeg174O5jWyDevLWIyH2xon7+gx+8J1ajFeXqOGiySa95z7oLsG2lD
 rlleSMiexJJV4mdwDfWH9Fa6SpAY505hoqTqx9lXDhJq2fX3c19pDWhRWvVaD3AYPAgm
 urkudjq6AdX4GVFonficsribGji++e48GqG/dK9+knUIfHsEJxdEDSbDa27/Ko+vJb/Q
 ZpTg==
X-Gm-Message-State: AOJu0Yw0mjMg7VNs2qbpmiS5tMVi8jeN7gPM7N800NGb4f14V3NX2PvY
 9BZ2rAzBNh6ScyNAOMrXo4LjRVOLgkQyA0D1BYmi8MlmPM8lmg29ALcoLZC9JfnG0dc=
X-Gm-Gg: AfdE7clv3fYZFSOOqxW1g5B/ImU1X3ub18yC1VmV/D3gZ0bQA4GlEwJI+OWdqLP/1Cv
 t4VaoFhsHCtzEV7f2tFZJ6q36lF023FNxa5zCDipZinRNi/QDfu7oUszxWiHItmG7gpqATDmNHz
 bxxSvPEiZNKqGan5OzDp/DScXhdNRwN5/HYzzpDxhspfKY1+ES3WmlKEZStRTVTd+9FksXdRqgu
 Wd+gFdxLgwy0yduqnX4rAAojs6EMZhT0v94nrfKmu4S0bPS0/vwbkeRim8ZvOtGDIxKcS6v5y2n
 vUCbPVBCsboqe3gaHIEFyBijQd0+B5XZR9Z9wZE52iNIfjtHW0oA9Je9LTOWIUcPxA0+OF9wZxC
 7zIf4gsBVLcVTtp1Gjdt3e41tHVFY8cGO0qy6A023SRd/69Wlxuj7cZzshbsVbbKX6Wl3TW2YZQ
 LvKKyQsrs=
X-Received: by 2002:a05:6300:6d8a:10b0:3c4:13c:2ed3 with SMTP id
 adf61e73a8af0-3c4013c4b98mr6664400637.69.1784659642377; 
 Tue, 21 Jul 2026 11:47:22 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/20] target/arm: Implement PMULL, PMLAL
Date: Tue, 21 Jul 2026 11:46:55 -0700
Message-ID: <20260721184656.530230-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/arm/tcg/helper-sve-defs.h |  3 +++
 target/arm/tcg/translate-sve.c   |  5 +++++
 target/arm/tcg/vec_helper64.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode        |  5 +++++
 4 files changed, 43 insertions(+)

diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
index f78e77662d..498468a772 100644
--- a/target/arm/tcg/helper-sve-defs.h
+++ b/target/arm/tcg/helper-sve-defs.h
@@ -3215,3 +3215,6 @@ DEF_HELPER_FLAGS_4(sve_expand_b, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_expand_h, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_expand_s, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_expand_d, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_pmull_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_pmlal_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 14378cf066..b7849b5be5 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8341,6 +8341,11 @@ TRANS_FEAT_STREAMING_IF(AESEMC, aa64_sve_aes2, aa64_ssve_aes,
 TRANS_FEAT_STREAMING_IF(AESDIMC, aa64_sve_aes2, aa64_ssve_aes,
                         do_aes2_idx, a, gen_helper_crypto_aesdimc)
 
+TRANS_FEAT_STREAMING_IF(PMULL, aa64_sve_aes2, aa64_ssve_aes,
+                        gen_gvec_ool_arg_zzz, gen_helper_sve_pmull_q, a, 0)
+TRANS_FEAT_STREAMING_IF(PMLAL, aa64_sve_aes2, aa64_ssve_aes,
+                        gen_gvec_ool_arg_zzz, gen_helper_sve_pmlal_q, a, 0)
+
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
 TRANS_FEAT(FCVTNT_sh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
index 8879969350..7d4e21b9c7 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -89,6 +89,36 @@ void HELPER(sve2_pmull_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint64_t *n = vn, *m = vm;
+    Int128 *d0 = vd;
+    Int128 *d1 = vd + sizeof(ARMVectorReg);
+
+    for (intptr_t i = 0; i < opr_sz / 16; ++i) {
+        Int128 rl = clmul_64(n[2 * i + 0], m[2 * i + 0]);
+        Int128 rh = clmul_64(n[2 * i + 1], m[2 * i + 1]);
+        d0[i] = rl;
+        d1[i] = rh;
+    }
+}
+
+void HELPER(sve_pmlal_q)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint64_t *n = vn, *m = vm;
+    Int128 *d0 = vd;
+    Int128 *d1 = vd + sizeof(ARMVectorReg);
+
+    for (intptr_t i = 0; i < opr_sz / 16; ++i) {
+        Int128 rl = clmul_64(n[2 * i + 0], m[2 * i + 0]);
+        Int128 rh = clmul_64(n[2 * i + 1], m[2 * i + 1]);
+        d0[i] = int128_xor(d0[i], rl);
+        d1[i] = int128_xor(d1[i], rh);
+    }
+}
+
 DO_3OP_PAIR(gvec_ah_fmaxp_h, helper_vfp_ah_maxh, float16, H2)
 DO_3OP_PAIR(gvec_ah_fmaxp_s, helper_vfp_ah_maxs, float32, H4)
 DO_3OP_PAIR(gvec_ah_fmaxp_d, helper_vfp_ah_maxd, float64, /**/)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 7030d81db7..42f451ff9f 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1994,6 +1994,11 @@ AESEMC          01000101 00 1 .. .11111010 ..... ...00   @aes2_4
 AESDIMC         01000101 00 1 .. .11111011 ..... ....0   @aes2_2
 AESDIMC         01000101 00 1 .. .11111011 ..... ...00   @aes2_4
 
+PMULL           01000101 00 1 rm:5 111110 rn:5 ....0 \
+                &rrr_esz esz=0 rd=%zd_ax2
+PMLAL           01000101 00 1 rm:5 111111 rn:5 ....0 \
+                &rrr_esz esz=0 rd=%zd_ax2
+
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
-- 
2.43.0


