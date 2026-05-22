Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF29CD5BB9
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:08:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2F-0007vS-Jc; Fri, 22 May 2026 18:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1A-0006WD-KE
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:56 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY17-0002Vp-5F
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:56 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ba928852a5so54804055ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487611; x=1780092411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rijKST64WZpELrwBb6/Q5we+Vkq4bBbLxG5KgrYkJ+U=;
 b=NsT71NYiW45O+dxG9o4O8z1TVkW52tiJy3Sx1t7i0r7G6kWjeTAPEQ32Cwo4mvs2jt
 DNw2sI9qvcIV7GfCE9CVjK4T9aKZ/+dcaj7jBxzqGaUWG/2vim+tvNc9PvITk62N/e+g
 bMb0un+g+XgVTHBdbWuutdzk0hCBvlC3y5GarSVBP5N7CKWS0f36uZK0gM/wmZICMLmH
 c35kmYOnewomlhXVi0zeD7hewCCwLtsvcwDD82d41rRRTwYwF27eCYUzJzqV3zoxljbj
 uIh+EpSboXtbQ03RI1/SBcoaep2GEtqzlzsX7DOQHPmtmYA1ElPPcrNdqVyH/T7fw2rR
 HTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487611; x=1780092411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rijKST64WZpELrwBb6/Q5we+Vkq4bBbLxG5KgrYkJ+U=;
 b=iZUH3SOZ0ZT5R1tTBsaXIqjwfiCEde/NWB3v8Wh1crZDmkdT48tc3z+HtckMpiH+Vw
 6bb3t+eUHY9cHDyrF2F7YrAPl9pHegKAyweihDT/I7jBgA5yEefja2ed6MvPp1/E0UJx
 +8rzaXvaNKfuTB5N8aBLHZLO0x9stkGtAYq9B26XMibNh0z+ErL8hrj1gQRXq5YG5CdT
 rxztZbL1fdFmHwCxhiOWm4Q+KQ+zoSmWyXL3vwT9kvtmc1ggmaP7i28wPbpM9ZRcNopQ
 1myTnuMK9u4Sr4j5V2jS+nPy92zhtI+1zTvqM/XekobKSgAfdqCxRK1FczGU9+yydrVr
 ZPuw==
X-Gm-Message-State: AOJu0YxkPIk7jjenjkpAIzjWFPD8mXLMFaHaNQtV+buqUGWp12kxFF6U
 ODs9s6PSn5RkJ/o1OeHq0sMvREMCvzKnw+UEMOMlNkhrNLsQYbZ6YUXzoM1CUF8bPdUUCgBAXHH
 VBf7j
X-Gm-Gg: Acq92OEa8xX9I5CNq8K3ur7McPeOVxWBdRp59OjdmtefuwUfBSB7SPAhZU1Owm9ZwtW
 GpSX7rxmKQO+m9R0hERkWfguXqQ9oO0ZOmKsbmxQKVIHuJ3p+G/hjMxv575HqlAfd5SoMb6cdvM
 qoFb6HAMoqG0HMKIcryhpc3xF1kLhC6Ct4jQ/DMiFTA62amFsak0P9lNTChQMWs0sepMwsFpI31
 1XNik7St3kb0MEqTX1+52hl683W4piv6bVKaaAQeyNwZXahetT/auTsSqCLuQpvflDxeIKutMzv
 ctucnLYV9uSyY0TxT7gM096nHsq2B+jS3wCiF8EkyUYMV/2lVs/dgJBgAENb6eZ7gj9RQAfhq/3
 m2O/RpbN8WjWcbkUFdbnOHjjPospa9M+yDoS324ICx0gx2jb6lytYJ39dzXiRSgn8gWgd8L6hLA
 0NHICQyddamEpL0F16aSSvdCW+M8n1
X-Received: by 2002:a17:903:1247:b0:2bc:8f9a:3642 with SMTP id
 d9443c01a7336-2beb0758d9emr58191295ad.16.1779487611157; 
 Fri, 22 May 2026 15:06:51 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 45/64] target/arm: Implement MOVT (vector to table)
Date: Fri, 22 May 2026 15:02:47 -0700
Message-ID: <20260522220306.235200-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sme.c | 18 ++++++++++++++++++
 target/arm/tcg/sme.decode      |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 811f2a7291..29d0464a03 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1570,6 +1570,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_sme_lutv2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, LUTv2);
+}
+
 static inline bool isar_feature_aa64_sme2(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) != 0;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 2f79c458e1..214427db1f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -391,6 +391,24 @@ static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
 TRANS_FEAT(MOVT_rzt, aa64_sme2, do_movt, a, tcg_gen_ld_i64)
 TRANS_FEAT(MOVT_ztr, aa64_sme2, do_movt, a, tcg_gen_st_i64)
 
+static bool trans_MOVT_ztz(DisasContext *s, arg_MOVT_ztz *a)
+{
+    if (!dc_isar_feature(aa64_sme_lutv2, s)) {
+        return false;
+    }
+    if (sme_sm_enabled_check(s) && sme2_zt0_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int tsize = MIN(svl, 64);
+        int offset = (a->off % (64 / tsize)) * tsize;
+
+        tcg_gen_gvec_mov(MO_64,
+                         offsetof(CPUARMState, za_state.zt0) + offset,
+                         vec_full_reg_offset(s, a->rt), tsize,
+                         offset ? tsize : 64);
+    }
+    return true;
+}
+
 static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
 {
     typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i64);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 2b9e41a75a..339de72b8a 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -141,6 +141,8 @@ MOVAZ_zt4       11000000 11 00011 0 v:1 .. 00110 za:3 zr:3 00 \
 MOVT_rzt        1100 0000 0100 1100 0 off:3 00 11111 rt:5
 MOVT_ztr        1100 0000 0100 1110 0 off:3 00 11111 rt:5
 
+MOVT_ztz        1100 0000 0100 1111 00 off:2 00 11111 rt:5
+
 ### SME Memory
 
 &ldst           esz rs pg rn rm za off v:bool st:bool
-- 
2.43.0


