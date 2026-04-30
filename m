Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2C5FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFDz-0006rT-40; Wed, 29 Apr 2026 20:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDm-0006UD-9X
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDf-0007Tw-Q4
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:34 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c7961d7bc09so111482a12.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508725; x=1778113525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8+8W4S7e1exYCYoyBEXRHcKe1AEhJGQ33LWv5UpbTE=;
 b=d6Cvgm27a7EnWby76SVv1/FfHPV52wZGgvSB7TJJ58NP4N5o0wGfzrXzX8YfqCPDz2
 5oGSH9aE+X1IhnhTcKSZ61PkyP+tiL3lfW5y5DnyEq6T3rsfN1e5NnfdqtgnXMhvSe4d
 f/UxUEl+FV48LQgSp3rtUzY5KRafro3BstTFfGznx9FwTiqkYrf/yAHO8zo6VgBnZtNl
 TJCJEeuz0NZ/Zq/bz7+Nqln3eMxMXYfri2rV29/XOyp/nreLw6dWiZCo0+CNn0DEIG8Q
 CB59hHUY6WtE6TMRBXMpRLfSAUcS3CwzX3WcA0vMMPerWXfg1TDtDU2CoF/OLvGpIvZf
 pZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508725; x=1778113525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n8+8W4S7e1exYCYoyBEXRHcKe1AEhJGQ33LWv5UpbTE=;
 b=n48EkOV/C2QC3E2Rlv3Lmx/pEUJMFEcoseX6xGxPZXpboFJyMWhp93PrXNN0tMtRxQ
 xOaJ84nPnFRgisJQwgzqTY5M+ktwhosKKn7eX4csiVqvh4FC0pm7tj4YslSJflxtkDlL
 LaqdFqkFkxyCb5XhVvVyvJq30xOTgLj5dqSfi9tPq+Kjea2qwKmtteXkeh8mS4mP/N8O
 ZZJumMdbwZlk8U3zDCv6hZQwyB5Pbx/Ndzv2Ga+LEhoo5squj5Ss9q+UWEHZRboLrNT2
 Z77S0smGTvZWfcVWGYDJ2RDwTR01uSiyh0jIMSElaNtSSdcxH/odOAIluwAz5/yRaMGL
 IyOw==
X-Gm-Message-State: AOJu0YyQMu+KwMukBusGcJfCwKhh7fuGvxxpBsfWHXxnqfL2xMSIGZpo
 x3evPg+lur64x9/6LAPmpko5hTPzWb1Hd6oaYCCmbNLiJxlSprd+8Gi/FfynBK8CFq4=
X-Gm-Gg: AeBDiesCHYg+Jh/LSY1bFk1vwsW/wW2xbGuGuOGeEfYoteTe8DauJhve/NxjEXgDhsv
 Td4FB2lE0uCFAGbXuyKaHauT/5nv7mRcyQCtjCvb2pJg09U2/lXdpNxjjBvujuDw2pyo96xfYkr
 G1Ok3s+kSX70Dz7VFKdRrwOS5cicoTEoL+1V5QSV/CsdeuCAQ+OpGfnk+AR770sSIJTtsyFqw3f
 MQ+bm5uDLQRQLjzztkowX7JlAQpIisfqiruMK3EIDe5fc2Gl/0PPfwKZpokOb23tYmT+M9NmB9n
 OJbapf/D59FWQJ8oT0Xz0tlwc/VHBovFPj/ESAHMt3nc+8R5HfOabZTeTNAVqGzy8Ccf5jv855m
 zNbFkelva69DZ86riEIbRqG1ypDTRbXPLv/9CVX0RwmVuQokkVXxBa6/98+Fa+/OVlcoY1z5od6
 pidXcMAOApuWWGEqZWSlUCboePsjbAedXHqQ9W7Wce
X-Received: by 2002:a05:6a21:3285:b0:3a1:ed2a:1a4f with SMTP id
 adf61e73a8af0-3a3cf5ffc77mr648008637.16.1777508725334; 
 Wed, 29 Apr 2026 17:25:25 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7fd64f21b4sm3204112a12.21.2026.04.29.17.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:25:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 41/47] target/arm: Implement LUTI4 (four registers, 8-bit)
Date: Thu, 30 Apr 2026 10:20:40 +1000
Message-ID: <20260430002046.59739-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/translate-sme.c |  6 ++++++
 target/arm/tcg/vec_helper.c    | 14 ++++++++++++++
 target/arm/tcg/sme.decode      |  6 ++++++
 5 files changed, 32 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4b228b4f3b..535c1e4792 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1629,6 +1629,11 @@ static inline bool isar_feature_aa64_sme2_f8cvt(const ARMISARegisters *id)
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
index f0dc11bc8a..20ecdb0a9e 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3346,6 +3346,20 @@ DO_SME2_LUT(4,4,s, 4)
 
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


