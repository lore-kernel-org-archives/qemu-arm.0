Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA88CD98DE
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:07:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa42M-0000tV-Am; Thu, 18 Jun 2026 00:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42H-0000r8-Jb
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42F-000451-R3
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-36d5fd50d20so273253a91.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781755642; x=1782360442; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJNYyxkPZZLm2j4qOnGcl3pJUfyQigIuYwn5g7Qoayk=;
 b=DMQ9X44ldnmHzoouFtPp6Om/DBM3jOig/TMPZPIgyEMILA5av3O411KGJ2dfZ0cdX+
 1irOz//qALFOAJtPQH+FyA4cAe+jZfFdKogyWprECAg/VBhNzontjfov3KFCksdgoyio
 nxToqWK/oAtNkF4UrSof2cqCO6Af/Fm1UnIwcIVnayBSI/RIfJevKUNQh2QA5bIXG1Su
 IOOkUCDNyw74hqjtoXGov2x6kuebcj2A30rdia0Nna1O3yBkgcbwrHqHoMGy3HlnC0cy
 BR3Q67zNWHLQLaqhpBPWW87ICjlIge05lKMg31hnfTKnvxs5e6acA594F1mO9kBAqaCw
 1KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781755642; x=1782360442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KJNYyxkPZZLm2j4qOnGcl3pJUfyQigIuYwn5g7Qoayk=;
 b=oLwjTlZI8E5V2MlYNSQZeYmIvTWjLEdIhO1uoPJyNqO1qJHnZZIP8/B2JF24YHoGqP
 zZNgbuaSNqcqN2TD5K/A+tATxY99sbM5AlSmb1kzkaZQAoHSG64OFwnBgCJurMfaxxsK
 apqsomXq4EFZtFtdipHgUu0o3v4ZwhxMOBdsSwXCY1ASJMeXEFWjac65Xcwj6cMz9MwO
 2CwgfkeHZ7zZ6Y6Wx93YuwCmVN2x5eCDr64ytz8hZ5I+rSjtUk1Qgg1eUUa1rTpp7/Fk
 Vu4Pt8vSQYZs4UmiMk3QZAqZ/yNkpg5gOH28U4S+1ZUGUh1bq8nOiz1MEqpyOeZRp1mT
 vzHQ==
X-Gm-Message-State: AOJu0YyaHxIcy3qnBGzAAUvuoL0T4zfi2Qx6N3aCHxTJVjHSaUpcF2gq
 rtRIRZ46SW08wGswym65DrUWUnonRm32BO+kEuiWiiXLge8rwwLtvtHpoPBSRfd3/HSopvND8wc
 qqFeI
X-Gm-Gg: AfdE7ckXhEDcJRl2JXRi9/EC7PCsH7LYGbtJjf3LEdF5ZVe6CA/Bsfsz7ezUsqp77qU
 ajpIixoyCPJ/+Dv2bjRQsL0e6ujHq6gHqvB9QIg7CtAltXVJqmXeZvJl+FdfJlyXhMA+GjK/jxk
 eX/4QI7fmJN2/cVKRI5MKy3rAHUegnyQetqURELWD7Iw9wxVddNe8HpTe3hzigxTZ/jxzbSBUtb
 nBshU3ynIHcaPXaNCHybJEtEKdfN2DgC9E3YXAMzbtvMN9veLeAKQS3sCHvzPxBvYb355EbHP8p
 DcBjOg41+3e06nNQxYFWYpAaPDizPJmD7Mw8hlVWQUePSl3dJ5hR8EOUdHMhKChYOLsJOFB7MbD
 hFIwlrtUL5IxW3ABzjwelF4cTQDp1V6KGJCS4c8xD7ar9XCjzSuMSMPnx/PT3yRX/StGZjhwtlU
 9gilQ/tYTZ/Zq2LF616vAjb7wqPRl1NPrU16jUDLytzF/isDhCzA==
X-Received: by 2002:a17:90b:584b:b0:36a:8ce7:b879 with SMTP id
 98e67ed59e1d1-37c9da9a091mr5889490a91.5.1781755642267; 
 Wed, 17 Jun 2026 21:07:22 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c5222e042sm8830476a91.16.2026.06.17.21.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/8] target/arm: Implement EXPAND
Date: Wed, 17 Jun 2026 21:07:12 -0700
Message-ID: <20260618040718.572950-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618040718.572950-1-richard.henderson@linaro.org>
References: <20260618040718.572950-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 target/arm/tcg/helper-sve-defs.h |  5 +++++
 target/arm/tcg/sve_helper.c      | 26 ++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  7 +++++++
 target/arm/tcg/sve.decode        |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
index de2254bb19..1d9066dcbb 100644
--- a/target/arm/tcg/helper-sve-defs.h
+++ b/target/arm/tcg/helper-sve-defs.h
@@ -3203,3 +3203,8 @@ DEF_HELPER_FLAGS_6(sve2_famin_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve2_famin_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_4(sve_expand_b, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_expand_h, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_expand_s, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_expand_d, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index a0a189eb1e..2517362189 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -3671,6 +3671,32 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
     }
 }
 
+#define DO_EXPAND(NAME, TYPE, H)                                      \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
+{                                                                     \
+    intptr_t oprsz = simd_oprsz(desc);                                \
+    ARMVectorReg tmp_n = *(ARMVectorReg *)vn;                         \
+    for (intptr_t i = 0, j = 0; i < oprsz; ) {                        \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
+        do {                                                          \
+            TYPE nn = 0;                                              \
+            if (pg & 1) {                                             \
+                nn = *(TYPE *)((void *)&tmp_n + H(j));                \
+                j += sizeof(TYPE);                                    \
+            }                                                         \
+            *(TYPE *)(vd + H(i)) = nn;                                \
+            i += sizeof(TYPE);                                        \
+            pg >>= sizeof(TYPE);                                      \
+        } while (i & 15);                                             \
+    }                                                                 \
+}
+
+DO_EXPAND(sve_expand_b, uint8_t, H1)
+DO_EXPAND(sve_expand_h, uint16_t, H1_2)
+DO_EXPAND(sve_expand_s, uint32_t, H1_4)
+DO_EXPAND(sve_expand_d, uint64_t, H1_8)
+
+#undef DO_EXPAND
 /* Similar to the ARM LastActiveElement pseudocode function, except the
  * result is multiplied by the element size.  This includes the not found
  * indication; e.g. not found for esz=3 is -8.
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 9a72e03513..57c21a13e8 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -6956,6 +6956,13 @@ static gen_helper_gvec_3 * const sqneg_fns[4] = {
 TRANS_FEAT(SQNEG_m, aa64_sme_or_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
 TRANS_FEAT(SQNEG_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 1)
 
+static gen_helper_gvec_3 * const expand_fns[4] = {
+    gen_helper_sve_expand_b, gen_helper_sve_expand_h,
+    gen_helper_sve_expand_s, gen_helper_sve_expand_d,
+};
+TRANS_FEAT_STREAMING_IF(EXPAND, aa64_sme2p2_or_sve2p2, aa64_sme2p2,
+                        gen_gvec_ool_arg_zpz, expand_fns[a->esz], a, 0)
+
 DO_ZPZZ(SQSHL, aa64_sme_or_sve2, sve2_sqshl)
 DO_ZPZZ(SQRSHL, aa64_sme_or_sve2, sve2_sqrshl)
 DO_ZPZZ(SRSHL, aa64_sme_or_sve2, sve2_srshl)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 2795c2ec7f..5ec1d420c2 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -742,6 +742,8 @@ SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 # SVE2 vector splice (predicated, constructive)
 SPLICE_sve2     00000101 .. 101 101 100 ... ..... .....         @rd_pg_rn
 
+EXPAND          00000101 .. 110 001 100 ... ..... .....         @rd_pg_rn
+
 ### SVE Select Vectors Group
 
 # SVE select vector elements (predicated)
-- 
2.43.0


