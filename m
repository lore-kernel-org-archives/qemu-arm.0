Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A333ACD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:31:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlYm-0006t0-JH; Wed, 20 May 2026 14:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYj-0006kd-VL
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:22 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYh-0000T5-6P
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3698e34a567so4550713a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301337; x=1779906137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4CCo6rT9IEUwVbHU8Dce71VDat7kIw7/6H6NNAMEGY=;
 b=Ree8kZPweRzHC9+mT84xnKNPy+JwEHicV93aAEPRoRhpkHt/PqbB/zo5z67Vg8BQry
 Ffs7gsCMTGa7LE2MffEzRa2TIzAHaawWKYJyb6cjwGcAsFtAazMgCf98yLHZxjlgzG73
 T85zm/zt6km6YVJ+05V+IBCCOB5N3h5C+ZMRkLZ9uGvT3ykJDtLaWWVextaIx6GxlUsL
 OpAnryKYn4a4lzThpd8XPgXoDL6jLt40g/gJWnOkj9JsbaaPjb56zGxrSYgKKQ0+xegP
 cRyJBMsx1XPAbpZp+TWe3+rPtVL+LiVFYhZaASpqXdaByXbUy5MCtHZ3weWH1GgdSNUs
 2B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301337; x=1779906137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k4CCo6rT9IEUwVbHU8Dce71VDat7kIw7/6H6NNAMEGY=;
 b=tG19+3U9po5mfwEzGG0ClHb3+D0GhLVPpa6LvUfpbWq3kYT8fobz4pyX4wUKyjCbSH
 kw83m923BIdmPqPQWf6sgiPL++U1q1lzD0JJhwMNkT8qaBUhGKLduXNHIB8e8g5NOq7I
 4k24aHhCv46zO6srTXfOWwgZcFasGm2LhMZZ1EEQLSXPNNxTPl0M4nbkGnn9UhN43d07
 1eIjc1dgyI0WNXrkkz481aDwaRdmBRKaY7vTuCh3B7h9pY82cHJBobCzB3befkISG/F7
 H/4wePj4m5WJcPmOHXdKx2fHBd2CNiRJnO4+D+KgTIN673C4tV4H365WTZOuoeldt+RG
 1HJQ==
X-Gm-Message-State: AOJu0Yx9ZR6kMbeEF5D617rgLaoI0AxSsVl+yj6Mz04Roc5Cm6pMiE6E
 ENB9aiR5JsseM6n2MSeXaZvXb0MJnoXJGLIUA8RudgfImTqscaMEwT8C9bWlr659lDM=
X-Gm-Gg: Acq92OElGeu9UzqvdW8nTsTjSHaxckU4HohYnNydHB5yA6e0aSv576w5gnmprZ96ioc
 dHQocv+tVHHOcxxakBjZ4HOvX6Y9aTtd2yO7A3sYiZaZ6IDFGxOmfIDVYt8t77CDg4VIp7Pzl2j
 0MsseogaOGD+qXYsvYIv15U+KaCXg1yna+9FegORCpxHoXYrLb4A8XJqTP3kVEtwWRlH7ZaShu3
 +NcBo87pog/5y8MaYH0C3ZWyneOFz1uW2gRs8Grn+Thu+hRSm75C2KA3DZBhG6n7s7rzj+mE7CW
 N+HqCdRd8LFZ7FeScrH88dOb5s2EMpBsHnNTmt9qohmb8EO2AH3weWL5xoFzkswGEFTbUqYR7RO
 oa0J5SuYjvXHP8oG/Yp9l1r16avB6ZTg2QXFJNJt/mrC9q/3/ehpDFfj6bTxDCXBh9uboaDU2TQ
 dH7WSo8dufE2JRDyJBaH+QOemZl9AL
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id
 98e67ed59e1d1-36951b88708mr24052549a91.17.1779301337368; 
 Wed, 20 May 2026 11:22:17 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 04/64] target/arm: Implement FEAT_FAMINMAX for SVE
Date: Wed, 20 May 2026 11:21:13 -0700
Message-ID: <20260520182213.872945-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index 21b91b1503..a7ab7e2a31 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1568,6 +1568,11 @@ static inline bool isar_feature_aa64_sme_or_sve2(const ARMISARegisters *id)
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
@@ -1608,6 +1613,12 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
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


