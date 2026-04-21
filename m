Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26CEA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:15:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rv-0008GN-6J; Tue, 21 Apr 2026 01:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Qz-0007w0-7D
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Qx-0006Ko-D2
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a871daa98fso25126165ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748442; x=1777353242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o688HWl5XrNHYPI7Z2Xn/6ecck2Zhe/qTWuxAA2gZDk=;
 b=yLHlW0EjSO5tcE9JikjpE38SDdNKTM/90wwn2+Du19bl4aKLwnziZAoQ0d5EQSYQTg
 mN44htV0DQ+5sC49M1OLwtBxys43KipnN6AvC7QzG5BBypyfzmqN9I8lcF2h6Fj2NSaW
 KWCMGbE+hmb1vlM03+mp2zXzfdDfDufKEPMNIgl/JbPUGI4lesMqwcG643R+ju4mrjPS
 qwXEiZy4ywpN69iEWEjSeCL9SKoUAnO82vlp1djsNUQK1stzCMQ1wKgqsEY70Q5szdLr
 GnkYcDY+4a2sOYyBe4wzD3+rFr8E7x8lnKekJKZORMaRxYT0FPWdoH/6BkQC9GU1S5b+
 ILpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748442; x=1777353242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o688HWl5XrNHYPI7Z2Xn/6ecck2Zhe/qTWuxAA2gZDk=;
 b=hmdqxoTHDCmyDCbvJWYNa0Fo/OS1cthyyPIv5LhJp9L9GnkgcQWXJ3J6sjoVm4ttQw
 vo4+FN33XASn40bvAREg+5dYwslNJCkdXE8eLQh5kyoK5yfOaLuxBx4z+BbrhLb7dslR
 htwh7HTX62D4+/9T7OT2/spFj60o6864EDfmq9etepxkiTurBwkjwLfeLEFAjM8RyO0a
 +Ru3iLlg4QHqJVSzGE1Uj31Wl1UknHX1DZlGfsbkacaCL7DZfGIT3G0K5Kf/XQjlIMPP
 DrNmedkWAFhvTsOee+H7TDLeiiVr1Sy/xJKfKTwi6x1lmeq/Kg/tEY2JgkZuSrcBR7qb
 gCXw==
X-Gm-Message-State: AOJu0YyUpW4AzlFIbU3fK3pni+RbKWbHGHSW3ZLnl1HWgWU9XecX5Vpo
 m3HZHRMpBAA+BYiCNbX3I84XM23RAwpOC9FS40onu3sy1zZqZCN+9HphdI2hOLjxNM0=
X-Gm-Gg: AeBDievVkPA9xNzCki3HIwvHPeC6+9nIlWm3xotFr1O5RAGfCWSy09ZI0xq7EXNbmzr
 Y1xh/3Dn3UVIjvjT5b9bL3IOO8lMWwygm69JtlK1zExyGAtdFueJjswWn7722lJkws364CnAJe8
 44ygJ+c0M1kQfhfJQhOxYBuAEet9DD+/aTWdO1TOzMfA1wCcKlQKTlFlS/kSxKqrXD4IaHYSHfv
 kjOjypm4TlZcK8A1ofOVp9BU3Z/nwaAnCFj9BTUv8vAuuwLP+PDzcemfWMOfHfwq5W9rvieTAFD
 NvBDLzQ2dHA5GhMoZ8E8wig8SSzkQ5GnB2FUttcIOfnew538s9cKRvgT5om/zz9ChFaQGaG3TJE
 /k4msRvFb3q3gqNTdrmCt+TfH/571yNZ+4ntFiReZar+jRqH30CwMdgXZdK4VTrks4XWVadC++i
 bo3lvJyw2yar5xWHzvGDgYc8Gl7Vp8fk/rN4iQMHu+
X-Received: by 2002:a17:903:2986:b0:2b2:4c58:5ba7 with SMTP id
 d9443c01a7336-2b5f9f43679mr173789765ad.30.1776748441564; 
 Mon, 20 Apr 2026 22:14:01 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/37] target/arm: Implement FEAT_FAMINMAX for SVE
Date: Tue, 21 Apr 2026 15:13:13 +1000
Message-ID: <20260421051346.41106-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 target/arm/cpu-features.h        | 11 +++++++++++
 target/arm/tcg/helper-sve-defs.h | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c      |  8 ++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  2 ++
 5 files changed, 37 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a2ce38faa3..03631018d7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1549,6 +1549,11 @@ static inline bool isar_feature_aa64_sme_or_sve2(const ARMISARegisters *id)
     return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2(id);
 }
 
+static inline bool isar_feature_aa64_sme2_or_sve2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) || isar_feature_aa64_sve2(id);
+}
+
 static inline bool isar_feature_aa64_sme_or_sve2p1(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2p1(id);
@@ -1589,6 +1594,12 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_bf16(id);
 }
 
+static inline bool
+isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_faminmax(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
index c3541a8ca8..1eebb64a29 100644
--- a/target/arm/tcg/helper-sve-defs.h
+++ b/target/arm/tcg/helper-sve-defs.h
@@ -3166,3 +3166,17 @@ DEF_HELPER_FLAGS_5(sve2p1_st1ss_le_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i
 DEF_HELPER_FLAGS_5(sve2p1_st1ss_be_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i64)
 DEF_HELPER_FLAGS_5(sve2p1_st1dd_le_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i64)
 DEF_HELPER_FLAGS_5(sve2p1_st1dd_be_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i64)
+
+DEF_HELPER_FLAGS_6(sve2_famax_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famax_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famax_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve2_famin_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famin_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famin_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 062d8881bd..9968600f75 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4742,6 +4742,14 @@ DO_ZPZZ_FP(sve_fmulx_h, uint16_t, H1_2, helper_advsimd_mulxh)
 DO_ZPZZ_FP(sve_fmulx_s, uint32_t, H1_4, helper_vfp_mulxs)
 DO_ZPZZ_FP(sve_fmulx_d, uint64_t, H1_8, helper_vfp_mulxd)
 
+DO_ZPZZ_FP(sve2_famax_h, uint16_t, H1_2, float16_famax)
+DO_ZPZZ_FP(sve2_famax_s, uint32_t, H1_4, float32_famax)
+DO_ZPZZ_FP(sve2_famax_d, uint64_t, H1_8, float64_famax)
+
+DO_ZPZZ_FP(sve2_famin_h, uint16_t, H1_2, float16_famin)
+DO_ZPZZ_FP(sve2_famin_s, uint32_t, H1_4, float32_famin)
+DO_ZPZZ_FP(sve2_famin_d, uint64_t, H1_8, float64_famin)
+
 #undef DO_ZPZZ_FP
 
 /* Three-operand expander, with one scalar operand, controlled by
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5bace3fda1..756c4373b5 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4252,6 +4252,8 @@ DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_ah_fabd)
 DO_ZPZZ_FP(FSCALE, aa64_sme_or_sve, sve_fscalbn)
 DO_ZPZZ_FP(FDIV, aa64_sme_or_sve, sve_fdiv)
 DO_ZPZZ_FP(FMULX, aa64_sme_or_sve, sve_fmulx)
+DO_ZPZZ_FP(FAMAX, aa64_sme2_or_sve2_faminmax, sve2_famax)
+DO_ZPZZ_FP(FAMIN, aa64_sme2_or_sve2_faminmax, sve2_famin)
 
 typedef void gen_helper_sve_fp2scalar(TCGv_ptr, TCGv_ptr, TCGv_ptr,
                                       TCGv_i64, TCGv_ptr, TCGv_i32);
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index ab63cfaa0f..078a085a79 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1130,6 +1130,8 @@ FSCALE          01100101 .. 00 1001 100 ... ..... .....    @rdn_pg_rm
 FMULX           01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
 FDIV            01100101 .. 00 1100 100 ... ..... .....    @rdm_pg_rn # FDIVR
 FDIV            01100101 .. 00 1101 100 ... ..... .....    @rdn_pg_rm
+FAMAX           01100101 .. 00 1110 100 ... ..... .....    @rdn_pg_rm
+FAMIN           01100101 .. 00 1111 100 ... ..... .....    @rdn_pg_rm
 
 # SVE floating-point arithmetic with immediate (predicated)
 FADD_zpzi       01100101 .. 011 000 100 ... 0000 . .....        @rdn_i1
-- 
2.43.0


