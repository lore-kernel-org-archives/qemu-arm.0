Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB1CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8Rz-0007Pr-Ts; Thu, 07 May 2026 19:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rk-0007D7-AO
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:03 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rg-00025o-Ss
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:47:58 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-40ea36b56b7so1059255fac.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197675; x=1778802475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9inL9WKVMj4YtL3JrvHyAFtU6G89KncdZZ3z0WH6BeU=;
 b=er92aTepZt3m2RZ6V81lCpkujmpf5erehbo/NUteX5yxwBQd+61okEGC0CUy4pzrTx
 8zNic7OxwCZZjfxT4fmKFRRc6aLNzk4N16ZUo6U/dtP7zU/i0dqT1O7LOAmV6gq7RshF
 jZ6o/JL2YPIAKDY9RwRZ7WvFAe7JZPyghfWxo0wFWc2Y5l13ZsHRX2yjm7uhWNQUHxww
 AIz4c3SKQGhrsyGRxGXs6AH8GH5TAsQ34H4F7nNUOSKcuf6p3BOmeC5Wz3Nq2nXpXmIG
 juH+WeAKWz52MdAdbpBV9ptcA7ncChDyRZ2ftpk8AUatzFjZqH/RTh52HckKKOWGmpdj
 hsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197675; x=1778802475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9inL9WKVMj4YtL3JrvHyAFtU6G89KncdZZ3z0WH6BeU=;
 b=OGjgFTvcFTgojPet8p6/D9zRhxKy3DNbz+OyjpTCCY7UyfIIaAZPyvmZsJNE3bKeOS
 X+YmeXd99rVYO1jp3fnUq0n3zi9/5FEB3wiq4ThKXAmWXtQlQgaHar0Iq9FNveapRYm/
 2bAee07MaGNuw7hUSP3X/i+dXwpo9/kH5uG342PsHEWWl5ZHs5n/pgJkaQh8oGW06ufE
 7T9Tq2cEPYey03Tgj94Ks2n4K2aZuco9DfkW5xtjv+yulpUF4BCR9xEEBW+89I71jWL9
 OGefHaLYj5Bxo7RvdJpt1WiPye0VI2mbHj/uXvAgfhicoKa5+bmPkZI/a/3U94z8+j9x
 7T4w==
X-Gm-Message-State: AOJu0YzWx6kRT0DdsalnRXho93KQBrgJWAupjCs9/H8EWr//Ze+g917S
 1zvLvmH/19fjWwVNX6hvawd8u8Y1+IFY1dih5SQKN2VBKpoOX5ZP8GFarmZct/2P1sI=
X-Gm-Gg: Acq92OFK48YesAhhkjz6EAj6Y36qnRJuCcxied4z6Cpt3GfDDDLMhCEUCbXlJ32ckrf
 +OETkBYsjAhNlVWfgL1GP4ldMv8K7ShSBfiQDNqoz2lOqXQ/ra2ih0OHzGIjWUnBOujB28tIXH8
 lGrQIbtEO853+MroI8wVVC14GLJ/4mwBolZsYRy5Md8DhCgOTH51ER+iwq2FCVweVAhJF5L+NHD
 ELp3o8QzuNDHm35eMN+bu7HcC+o45IKyx/2o0okdmy13KwMK8R8mgAR22jBpg10epkOOhup5lFX
 rPDPBP1Pt9LYGBGNYHYs7SxSjzqxeEGK8TeaOq+xmz0wEndppxnpuSbTUcHztHKz3Xrbzke7FgG
 zTHdQxXVrNjf1Wsb4PzgwRIWAmA3savLBi7HMU1HfYLYfvIKKfu2u6zTzcS4eWZEYZKgbb4Uv8x
 D+49yorPJPmHiqSRP+qMBo2h0xblbE1DkpM432pk9C/bhaFSnmkerwj04E
X-Received: by 2002:a05:6871:80b:b0:36e:8381:db00 with SMTP id
 586e51a60fabf-434f6144552mr6678988fac.9.1778197675441; 
 Thu, 07 May 2026 16:47:55 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:47:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 41/60] target/arm: Implement MOVT (vector to table)
Date: Thu,  7 May 2026 18:43:54 -0500
Message-ID: <20260507234413.643512-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
index 684d635433..fa8a619ae0 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1564,6 +1564,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
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


