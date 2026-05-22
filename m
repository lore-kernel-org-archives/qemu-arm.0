Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3C6CD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:12:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2N-0000YX-8V; Fri, 22 May 2026 18:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1D-0006eA-84
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:02 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY17-0002WS-NH
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:57 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ba3e3c4f87so80342285ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487612; x=1780092412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bG5QJmGGeeob8ME+IXN0PuN/c2eRAs1BkuVAXON0uNI=;
 b=ZNmrhfB/uOpV0HMO6G4nS9Uqbk/+yhhPSu/tINtDB4zSIrgF7wpz8r8DCUsdn8uekO
 kO+iHvoZ9+L9I274rr+hXddJsY+Z3naTkaPRRrndcoL8FbWlAA/wqjML9fwiw1AuINoW
 dcnTQwdByvUZlOA1Vxko81pQoHe9mgZpUIIOLobDjlHkCb3LKiFd2F2tGikCHqMtWTTZ
 8mgB9Pf9P5uqdeGM2h6LYNQIVoG9JC+OmdiPQNvsLJZQNMAuKrmBgGUp25YKI2u5nmjX
 wMOOLBtShNMRjlf98W3Es73YXkBsHgAdittszckyf7PPEy2d4SXVcUsoC6TyquuXFast
 x4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487612; x=1780092412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bG5QJmGGeeob8ME+IXN0PuN/c2eRAs1BkuVAXON0uNI=;
 b=gizcqpjrgsJkoWylvRxgokROoBnScFZtCna8ysjBjmOmbFAjQ4ap1bGZdTMzom3obL
 4xdrc/5CHnJIW8u9gl1JEsjAOObjRqoHaswnHDVI8v7LFHrygZj3jQQwKOnCXMGBKgDS
 YiUfSn5idZGBD9T0TJ9i0Pgi0aap3N4/c4L3L+b7mwXiMfPF/CnSzT4TNoc5mXgIbpWQ
 FvFwl+spdM95eC57UOZXmxyW/qcx5lbuC1Uy08YgDe6xRuZP+FbwpTMApulpxjMua9YN
 M3cLuVbn4Ej0lFEN7QGgudUtN5j9F3GnaK97MvxEJYefe4600ONqDbMqiUDDFRdQ73Ai
 euUQ==
X-Gm-Message-State: AOJu0Yy3nhMFPQZ+yg4d3gEnfkLMxIxB1Mup4x3UGA78hbstsw1LcQfx
 AvcjXh41qXqyjaRpEk2/oUKE0hDBMhRvgDdiMbWp1yryiuf2y47BgcOpa16X2oQKHzIzy4DBs6C
 GZTmU
X-Gm-Gg: Acq92OGcVmrak2owDOFWaD76tkQUpD84ghIxWTExRkcjtZYIfKcr6veWNauCx5dCgam
 /MaPnOi0Nb2UL3iAQf7dGbvbqJ9lDxq6u3xvZNJQFn227rM9ZUDsWqDE8JmgaXEHaKDoPzSXDPs
 vVTzNCTv1CLSw2nS7jKFPCeStjEvLaLZ0LpEwlFosj20mWlxkQcH4SdugPxUfaxEd7IAkJjjUvF
 85fLG4UfkE9wdOQCcNReH6KSFRmFp3jY/6ypBC1kZqmaNFGgbb8PyiMg0Lh/TN5CAv8ie4GtDPG
 HFjqy488u9dOBkp8XofqzrZvmdHUu82/iei0L5PI3emglAW8bDcnLmssHJnOhFrVmAw7DrxQog9
 TjVNUKyqyOhX/C5Nl7p08bQJKS1xHoAnHM34ecx/bw8isVVMDTofXYYpPRaOBJldMxe28YTM0cj
 HC9UfX+PF67uAOmQiHBxA4euT3lVSKMBr/lZ5K7hA=
X-Received: by 2002:a17:902:d4c3:b0:2bd:646b:2ddc with SMTP id
 d9443c01a7336-2beb0375f34mr59132755ad.12.1779487611964; 
 Fri, 22 May 2026 15:06:51 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 46/64] target/arm: Implement LUTI4 (four registers, 8-bit)
Date: Fri, 22 May 2026 15:02:48 -0700
Message-ID: <20260522220306.235200-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/translate-sme.c |  6 ++++++
 target/arm/tcg/vec_helper.c    | 14 ++++++++++++++
 target/arm/tcg/sme.decode      |  6 ++++++
 5 files changed, 32 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 29d0464a03..007e656ed4 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1643,6 +1643,11 @@ static inline bool isar_feature_aa64_sme2_f8cvt(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_f8cvt(id);
 }
 
+static inline bool isar_feature_aa64_sme2p1_lutv2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2p1(id) && isar_feature_aa64_sme_lutv2(id);
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 05ccf795e8..8ec6c16319 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -1120,6 +1120,7 @@ DEF_HELPER_FLAGS_4(sme2_luti4_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
+DEF_HELPER_FLAGS_4(sme2_luti4_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 214427db1f..0af133c1c4 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1846,6 +1846,9 @@ TRANS_FEAT(LUTI4_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2s, false)
 TRANS_FEAT(LUTI4_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4h, false)
 TRANS_FEAT(LUTI4_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4s, false)
 
+TRANS_FEAT(LUTI4_c_4b, aa64_sme_lutv2, do_lut, a,
+           gen_helper_sme2_luti4_4b, false)
+
 static bool do_lut_s4(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
 {
     return !(a->zd & 0b01100) && do_lut(s, a, fn, true);
@@ -1866,3 +1869,6 @@ TRANS_FEAT(LUTI4_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2b)
 TRANS_FEAT(LUTI4_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2h)
 
 TRANS_FEAT(LUTI4_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti4_4h)
+
+TRANS_FEAT(LUTI4_s_4b, aa64_sme2p1_lutv2, do_lut_s4, a,
+           gen_helper_sme2_luti4_4b)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index cb633817d7..eaf15a0cb5 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3349,6 +3349,20 @@ DO_SME2_LUT(4,4,s, 4)
 
 #undef DO_SME2_LUT
 
+void helper_sme2_luti4_4b(void *zd, void *zn, CPUARMState *env, uint32_t desc)
+{
+    unsigned vl = simd_oprsz(desc);
+    unsigned strided = extract32(desc, SIMD_DATA_SHIFT, 1);
+    unsigned dstride = !strided ? 1 : 4;
+    uint64_t indexes[ARM_MAX_VQ * 4];
+
+    memcpy(&indexes, zn, vl);
+    memcpy((void *)&indexes + vl, zn + sizeof(ARMVectorReg), vl);
+
+    do_lut_b(zd, indexes, (void *)env->za_state.zt0, vl, 0,
+             dstride * sizeof(ARMVectorReg), 4, 32, 4);
+}
+
 void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     unsigned part = simd_data(desc);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 339de72b8a..495330aed7 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1014,8 +1014,14 @@ LUTI4_c_2s      1100 0000 1000 101 idx:2  1 10 00 zn:5 .... 0   &lut zd=%zd_ax2
 LUTI4_c_4h      1100 0000 1000 101 idx:1 10 01 00 zn:5 ... 00   &lut zd=%zd_ax4
 LUTI4_c_4s      1100 0000 1000 101 idx:1 10 10 00 zn:5 ... 00   &lut zd=%zd_ax4
 
+LUTI4_c_4b      1100 0000 1000 101     1 00 00 00 ....0 ...00   \
+                &lut zd=%zd_ax4 zn=%zn_ax2 idx=0
+
 # LUTI4, strided (must check zd alignment)
 LUTI4_s_2b      1100 0000 1001 101 idx:2  1 00 00 zn:5 zd:5     &lut
 LUTI4_s_2h      1100 0000 1001 101 idx:2  1 01 00 zn:5 zd:5     &lut
 
 LUTI4_s_4h      1100 0000 1001 101 idx:1 10 01 00 zn:5 zd:5     &lut
+
+LUTI4_s_4b      1100 0000 1001 101     1 00 00 00 ....0 zd:5    \
+                &lut zn=%zn_ax2 idx=0
-- 
2.43.0


