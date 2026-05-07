Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BCBCD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:44:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OF-0000Aa-Lx; Thu, 07 May 2026 19:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OE-00009Q-K7
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:22 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OC-0000zI-R3
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:22 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7dca4debedaso1461154a34.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197459; x=1778802259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdE2cHz55YabYtNeXRkV5W0sj4/MBF41JWJ0YA7+D58=;
 b=y+ZtZe/KG4bjGbr5SpHBNyqqLDO+0j9FvsYRW1yvZzuENLvO3D/GR8yJhJezKqPvH2
 A6OhAtm+7MlkIcWFRSOWO4WQZEg4lGkPsWIK/fms2KTN+PivGGQQ9v8iz7S6onA0olT8
 8YmE/Ql1wlRHxR0RTyNsZI97Ll22pYUcSSuHmCPDirvlNyxpUy1c9A5x2nROAjvwU7QI
 +5mIM5YjxAhCEy5u4tGq83W3nDJhvlH2F+m++E0/6lYXrw8WjgtJfeKCkqFuwugnScmV
 iC4rKb8uu7WDqSD9Ipv+cpmkVIx1FsuPfzQaoxE+UNX3fSHN+1D66e0FR18yiSIIPkhC
 MlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197459; x=1778802259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AdE2cHz55YabYtNeXRkV5W0sj4/MBF41JWJ0YA7+D58=;
 b=Fk7uPhZakcVaENw2gZShoKMw4aUus21TifOWD7VryNoHZrmUHN3MpD+0hsqKVx6xPL
 +sHkSHBEMRgKIWqfPhvghLtsLjf/5uk9wxaOt8AgueWPjWUjruJneYiAKMvH++9ibbHw
 trJ7xgFXrNteXshkqN7Myzh2TOoDx0fFbEWcfLJo6zQ6IRoOjsG6wmnTw207m2f8sIIx
 7ZCupxzFcMFXD2JtdX0lOWblp+LjVViJy1e1XR9UjyF4QoQg8KPTJsbbMW02DNgdZKWN
 N2JveGTBSxZLrl35vILUIm93+qgepvgU9dmS365dv5ZVUAskLQf8fhTJ97lrdU+A1Vjl
 /2nA==
X-Gm-Message-State: AOJu0YwshJmRc+3WK89ljoMzFRyJ16T/My92mIVNAwk+Q1yfrUnz7k9H
 XskLTx0uNslBRmgZ1nWa24ITmeR2HDhMi98EpgVxXAZKBxZSYVlQjejwuOWk+Qr69OU2weg6HqB
 v/jKq
X-Gm-Gg: AeBDieuyuEFI4v2WkjpbmcWasKWSGP0PrpjmUvj8vKUiHPBFfKEOLDpIlednBYohV9V
 uONa5KpbnNbvhIWgq27P6maYImU5IiEPA+Y3i4OY4xHiBlWem2TKpbfAKyjY5DQWSrBlkxpuYKN
 cVjGVkkLDm/F6lLDmnHKWV4ZzYLBrBHMtRfStb/zLbptTbEfrzrq/AQiXypG5nPRDrOWJevGJIq
 nh4ZrXsbZl7fgkYYP9+sb0zZp26h1fQsQ8rVDhmjO+RDlLNpdea9bs8puf/6JCeEOipnD/k4rjh
 Extc2Zhb6TPL1JkReM2q8hxQIr+Wdhx6JG3QFbH6hsjP2KVWsp4TUOw+ZVelUjfjDx0vEIlnp2K
 kIeakyZTTTdfH6RXHSEwD7IIB4BkUMxAEY249Nj7gbnxZGBpk85Gu5rLx9b1i0hAfNWMkIIcnle
 LxAedimvoY0qnHm4YUieCPld0ZG7l8ggkr4a2PIb/zCFHzOw==
X-Received: by 2002:a05:6830:7103:b0:7de:4ebe:e44 with SMTP id
 46e09a7af769-7e1deeca7a1mr5827266a34.2.1778197459611; 
 Thu, 07 May 2026 16:44:19 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 04/60] target/arm: Implement FEAT_FAMINMAX for SVE
Date: Thu,  7 May 2026 18:43:17 -0500
Message-ID: <20260507234413.643512-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
 target/arm/cpu-features.h        | 11 +++++++++++
 target/arm/tcg/helper-sve-defs.h | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c      |  8 ++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  2 ++
 5 files changed, 37 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fe5d3a1635..4ce661d7fe 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1562,6 +1562,11 @@ static inline bool isar_feature_aa64_sme_or_sve2(const ARMISARegisters *id)
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
@@ -1602,6 +1607,12 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
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
index aa7d72a35e..db32230595 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4253,6 +4253,8 @@ DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_ah_fabd)
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


