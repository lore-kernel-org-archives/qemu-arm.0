Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507BDCD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28H-0004cX-Un; Tue, 09 Jun 2026 15:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX220-0003d5-Um
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21t-00046E-UR
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2bf1f074a12so61437545ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032889; x=1781637689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yx3pBpNnnixYGvFXS+Bu2M3m7XbvSzNcUUbjpi1jMJc=;
 b=Dh4nGgkNWT0gpe/Hbk36KVl6RlFv4vh+KPvkrIhkz38cuH0t8j0Svysvt7YYpPk4t+
 j4cxWnvjuwiSe/DoG0BBVhX7Xkb9x9mLaQjsEuwDOfejZSEeeF6zEcUpBtzzghM4kPx9
 onJWx4ZmO6blsQbaWQrPytTbUNRZNaxgU7KZApqvfE9eNr1Vb7EuXBcR+AEC1Zb6iXna
 f9waQhKZsr0PyeeXqT4rMPEXGsQPanXibg8Rw2/JBcNlnOhsBvfrp9aLetrWyZ3w06/0
 BrMQmPpdUKJLhl6pgoBsrxzmGeytgycNC5BwqXeTmZm6IRw6v5TQXNtyQ9UiNyFH4Lhj
 O/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032889; x=1781637689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yx3pBpNnnixYGvFXS+Bu2M3m7XbvSzNcUUbjpi1jMJc=;
 b=M+MXhYBRGU951eIP6e0tEyejOTwwpaW3IaBqStPWhKAcoYk2p6v0eaW/um2hJYkgpD
 552XBhxacYeo7WFdWpNFljam8ptScF4zLCNDz1uuh56NB/zTwysILzkp2IsogUMZDihw
 pqgBMWXUYfhvythZgb5U5vLC34ATEi3W3XdfoNtWWhcNcCl1TaTJJJs5MfljhLXZWWZ3
 AuRpIE+WeMTNfVjb8GhxBldfwXqEDaS3bZH/5UBknFWcPgOtSRCxnVuYhlgY0poQlndN
 nuYOuji5hYjl0YN703CKCkJiclg2t0cg4g3CAnshhHZYS1zLqvgbg0GcwTKCOmOFquCK
 0EPg==
X-Gm-Message-State: AOJu0YwEsoaPzcWtFoNmEAtq/Ztz20m8En/a9KakfQ3C5WOUGsdoE3I1
 ZNlo0WK1pWnUEsCQ86E6AuecT/jSqK/E7/wt9OJM3NSE7BsWBRjJ4B+fWNA80jV9dbflZGNBwDg
 P3/ouFOQ=
X-Gm-Gg: Acq92OFl+CwNsuVqGl+d1NrPejHZDJ185C54gG6Fz/7rxaAjmSbsmabXPnwKn/pcWEv
 67zqCiMVKh1/YdrXosQz7VP7goIWwHim49W/qg0CD9VLXm4IRSK7xwn4J1u5WomAsVJLRMzRDQH
 kE3c3gK5blE1skLaZsubGDhFuMokuPiKfbctNNkgEN2YmuemyPrtNfswpRIEBj+tw88NYAI5n6l
 EpDyfkRjD9MrQB9FQzD5lDuLWu5z89jr6S9+fDSfSNgAOLJse5GsScnEH1mSNSnIfstX3qJKscx
 T48U8PeQTfYebkldMcBxvjtPuGYwsuAcHpGhXYwsv0YLBJ3lvDDFtrf6WzBbtD3hvLGLEUAp97M
 Lvz8X8lTTUXcSgl1V45bkSI4QiQfdZv4CB6pR9ymyDYdy3WsC3kUtqGmMaNQQAbtIso0V0Fhwug
 05DWHF0D5C1cAt9eqI8aRv0+WFGWNeDAXaOb+aeTQgbNdIa0yKGg==
X-Received: by 2002:a17:903:2411:b0:2bf:379b:53f4 with SMTP id
 d9443c01a7336-2c1e849511fmr270740355ad.19.1781032888649; 
 Tue, 09 Jun 2026 12:21:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 24/45] target/arm: Enable FEAT_FP8 for -cpu max
Date: Tue,  9 Jun 2026 12:20:48 -0700
Message-ID: <20260609192110.752384-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
 linux-user/aarch64/elfload.c  | 3 +++
 target/arm/tcg/cpu64.c        | 6 ++++++
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 10 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 5ed7a7badb..1c0c404b7c 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -222,6 +222,9 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
     GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
     GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
+    GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
+                               ARM_HWCAP2_A64_F8E4M3 |
+                               ARM_HWCAP2_A64_F8E5M2);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 39dc769a04..b48dd01a2c 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1392,6 +1392,12 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
+    t = GET_IDREG(isar, ID_AA64FPFR0);
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
+    SET_IDREG(isar, ID_AA64FPFR0, t);
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index dc20632097..470f7d891e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
+- FEAT_FP8 (FP8 convert instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
-- 
2.43.0


