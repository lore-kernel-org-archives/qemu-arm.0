Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD19C4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:52:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWp-0002Ar-F4; Tue, 21 Jul 2026 14:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUt-00015O-Jn
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:21 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUr-0006fl-I3
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so3793643a91.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659636; x=1785264436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5x/XwFF00evs9CWopDKjFJT8vjI2eG1ycTaTU4iYXRA=;
 b=zOkQZV5800id5ixkNTCh+3arBTENIYf622W1xlQh5Q2UniyTXi55A+rnPyy3PSh21+
 v+acLZmYc5D82RDgSnO3Zd5XNWGHRHTVR11FQq8sGFHYWAc37TNgi0+Iv3OXdzB9XiCu
 NLz9ZSDafZ9KtbjPdHlVxJGYUYrVAmabw3vedIdXeumANZGN/1fwSiLZQ7paPFP8+QID
 X3wi7GPT/A81Cx+VdNaKAyUJwzUQ94xuwOH1RbA6LF+yhG9/pc3WwV/sOkssDF96vCZu
 srKDdqGImQ7tV0CJtvWYPUR9pUbda8X1FXolj6+Lqes7mL577JuErNJhldhma3LhfIf+
 ue+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659636; x=1785264436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5x/XwFF00evs9CWopDKjFJT8vjI2eG1ycTaTU4iYXRA=;
 b=ARDx9dLlwEQssTWVAX4HN510UwflzEWLdLsFuSLXWFH4XvO+ydBd7dzspaaDu1Zv1r
 FAtslIToXHHyuBdhcv4fXwIK4Bcl7Kh6YAjxLA0VdgGg/Jbyr10q7la+86WYS0bNF3h7
 8rUREpBAkIChR4p5oJbzlTZcYigW7yfrYMlHLnFqhFc3pWt2mXOnJxXvhKVaA0rgiu3H
 YvyFKMbuN+7xPmz9M2pkUXTDSE8o7FknF/c7ote6ao64JWoF2xvrdrsJ6EjTtJenJU1l
 R683kKBrWIpEdeq4Z7GswmBzUCbYowBSI3/t3yKYzMnhMQFWNdQBG4ehIje9KD9e8P1g
 wGjg==
X-Gm-Message-State: AOJu0Yyi5WwGxQ+QU4gsbm3Csj1y1NgWvATfivW8Bg9q5HNcTwFSSerb
 P4qbpsFzFbPpyCt03puearHj16daxZCeuB1A4tj3MVdILZzQiWwSxnXys054j+5Kzxw2oyla3dn
 XxJg6
X-Gm-Gg: AR+sD12jQpniAYpBrI8G9DSZJFKun7LSz/ymBLMUZB3AL4t6/p0rgP8kAJg9e0Z7ivo
 8sJ8jzz689cMpNrmX3V6E1dLkygNe9nrbttbISQFgXlsP8vU1+6fE8YQvOh1LvvyapEVnLrbz2P
 u1l4kaGcmaPiUZCf00j3NZSzuKgD2yqs8OjVA0W8PyxUTrEEn/wGuJM4bXZWF+JpAZrDq85cYTG
 X0+FXla7hQQcyrR2RR3peTmxS4lgvKIwQy861sb3LySNe+0jrqJFzvPYLLFKnhzB5JEML0g/phr
 pFLiWHjgdSMzbxfT3QNmBRqCP21bS/YwsaS4RPNPgN19oU/TCqgvdCUpbIkpKuTT5yBwnek6Lau
 GxHc4WURQMULYQjtMc1apklMYjIWMaoH9BkjR6M8ZkR9gueLhPWkFjb+t68PnKNETiwbaIUd2XV
 DHlqUEwAiPF5uAC/QQhA==
X-Received: by 2002:a17:90b:2dc1:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-38e4b3e1424mr19525005a91.2.1784659636149; 
 Tue, 21 Jul 2026 11:47:16 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/20] target/arm: Rename isar_feature_aa64_sve_sm4
Date: Tue, 21 Jul 2026 11:46:49 -0700
Message-ID: <20260721184656.530230-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Rename from isar_feature_aa64_sve2_sm4 to match
the feature name: FEAT_SVE_SM4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/aarch64/target_arch_elf.h | 2 +-
 target/arm/cpu-features.h          | 2 +-
 linux-user/aarch64/elfload.c       | 2 +-
 target/arm/tcg/translate-sve.c     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bsd-user/aarch64/target_arch_elf.h b/bsd-user/aarch64/target_arch_elf.h
index 8669f3f833..0ec7a7b585 100644
--- a/bsd-user/aarch64/target_arch_elf.h
+++ b/bsd-user/aarch64/target_arch_elf.h
@@ -130,7 +130,7 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
     GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
-    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
+    GET_FEATURE_ID(aa64_sve_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f94e8efe47..44dfc7d457 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1554,7 +1554,7 @@ static inline bool isar_feature_aa64_sve_sha3(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SHA3) != 0;
 }
 
-static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_sve_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SM4) != 0;
 }
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 83791768c6..7afbfca418 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -196,7 +196,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
     GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
-    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
+    GET_FEATURE_ID(aa64_sve_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index be7ff74add..0b522e22ef 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8292,9 +8292,9 @@ TRANS_FEAT_STREAMING_IF(AESE, aa64_sve_aes, aa64_ssve_aes,
 TRANS_FEAT_STREAMING_IF(AESD, aa64_sve_aes, aa64_ssve_aes,
                         gen_gvec_ool_arg_zzz, gen_helper_crypto_aesd, a, 0)
 
-TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4e, a, 0)
-TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4ekey, a, 0)
 
 TRANS_FEAT_STREAMING_IF(RAX1, aa64_sve_sha3, aa64_sme2p1,
-- 
2.43.0


