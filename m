Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3323BC4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWp-0002CY-SN; Tue, 21 Jul 2026 14:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUt-00015L-DD
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:21 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUq-0006fA-IR
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:18 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-38e08baf860so9294010a91.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659635; x=1785264435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fbKvURaUToW+MLge/0h1mbq5aOuncglQwXEaMVLIT3g=;
 b=xPIU4COHUh5jb8kTj3pdOJSfunuPQlt1ubrZQFIVbrhFgicsZkg9omrOSkfFbpD76r
 Gpo1LGz7c7DxUMkpHSycqKWsDh7fpK0HUIptir8YnUkl6UVMvZcESIy9QJ0nMSQtOhyl
 dJoyELD7A9k5sqCcuJpPVGQldNOHNte+jMc+KBLfU1hx4XQCDj3SuRPcM64OyJgqaT44
 Y5nhRGDg7MZjmZFjnPeBmncrFRxnmj2MmoOAdC9EjdwNWDXk9HvhbidlSCK0u5yNLP7o
 NZ/ZCtuh/rBejtgW4myAHXEMrbxqcnFxDM27qqUjDaLdvIsDcQ5a6GvCqjyAn0hEEPDQ
 aAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659635; x=1785264435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fbKvURaUToW+MLge/0h1mbq5aOuncglQwXEaMVLIT3g=;
 b=BKJ7gVwcy9EhfIQvylbSpPQw2mxwyaVMFv5DngIhWW9NyFUlBjAnKznjVv+dGE496X
 NXSpj5KrMfsM1Pl585jEeRGrW9I9yr//TYpb6d0c7iPakaEtf5cA7321NHdruebsKurI
 NiDL4xFXiyto1HXdS2cf7IQvZvpdWo7+JC51JKjeOT84dJo6oY5EJI1/cIHG7nEfUz5N
 v7SpsGrkvWD+/yAfiHvwthFi5MrbO9T0bXmoONAsSXxuCpCL+K9kYURUz1E10gQTdn8q
 NL/R0epyk3LWItu1/Nr/GdklFVq2GRN8mfT9sQL2FOiFX/5aOv/ZEgbQI523tD30I6fH
 gIgQ==
X-Gm-Message-State: AOJu0YwiQ5Gu9LX/NjyucYgQawx7TFyJng8mSWbrvHUN1RZwE7LBF0EY
 i1DgSouhlyQkNBiAl9RiLeTKxNNPRfDV6BtC+rm7vxqcCvJRcyKqd5xHd+jP2h49CY0=
X-Gm-Gg: AR+sD10S6eumeTxcM/teRRi1uhtBIg2MvxOdaw7XT09kcDGZvE+JLKjcYR3SyoesdrL
 jlB6xbK50gpIAj1oXxgnYpRYKb6H6loyuXcutjzKrllWGguzjVjA7gtx6BCAWoJ7iVyWFPRs/Xs
 0xjL4852mOrIGbJnYpsKKSlV3UYft0YLXpuOVFnczJCNvRDRlbdfMnlccE4G6es0YvxrsVZ5rVx
 wiBU+3Y48QBKHdZzn2mMBHXg98/bGzm/x/a/GhyQv86bpvDAMRhn/S5xnyFxsyWXD1xvc7vF+tI
 yb6xn/UidNu9Yry8kO2H8ai3kF/AcAAfeC+PHx40RZ1mDdOHYcRQ7IZYu4cznePbE8TvfUaQ5LY
 sEHFlT162Lioelj/TWA0r2W0exSPVrrjmSLGBzLHLgk8AL8xOaSCjJvABuFUDVlnbbnIMPDX5Zi
 qa/DJVF4s=
X-Received: by 2002:a17:90a:d40f:b0:37f:eda5:5169 with SMTP id
 98e67ed59e1d1-38e4b4474f6mr21353737a91.13.1784659634836; 
 Tue, 21 Jul 2026 11:47:14 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/20] target/arm: Rename isar_feature_aa64_sve_sha3
Date: Tue, 21 Jul 2026 11:46:48 -0700
Message-ID: <20260721184656.530230-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Rename from isar_feature_aa64_sve2_sha3 to match
the feature name: FEAT_SVE_SHA3.

Reorg trans_RAX1 to use TRANS_FEAT_STREAMING_IF.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/aarch64/target_arch_elf.h |  2 +-
 target/arm/cpu-features.h          |  2 +-
 linux-user/aarch64/elfload.c       |  2 +-
 target/arm/tcg/translate-sve.c     | 13 ++-----------
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/bsd-user/aarch64/target_arch_elf.h b/bsd-user/aarch64/target_arch_elf.h
index 818b6f690a..8669f3f833 100644
--- a/bsd-user/aarch64/target_arch_elf.h
+++ b/bsd-user/aarch64/target_arch_elf.h
@@ -129,7 +129,7 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_aes, ARM_HWCAP2_A64_SVEAES);
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
-    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
     GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 857adf4ee0..f94e8efe47 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1549,7 +1549,7 @@ static inline bool isar_feature_aa64_sme_sve_bf16(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BFLOAT16) != 0;
 }
 
-static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_sve_sha3(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SHA3) != 0;
 }
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 0569350e37..83791768c6 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -195,7 +195,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve_aes, ARM_HWCAP2_A64_SVEAES);
     GET_FEATURE_ID(aa64_sve_pmull128, ARM_HWCAP2_A64_SVEPMULL);
     GET_FEATURE_ID(aa64_sve_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
-    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve_sha3, ARM_HWCAP2_A64_SVESHA3);
     GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 47986510e7..be7ff74add 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8297,17 +8297,8 @@ TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
 TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4ekey, a, 0)
 
-static bool trans_RAX1(DisasContext *s, arg_RAX1 *a)
-{
-    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
-        return false;
-    }
-    if (!dc_isar_feature(aa64_sme2p1, s)) {
-        /* SME2p1 adds this as valid in streaming SVE mode */
-        s->is_nonstreaming = true;
-    }
-    return gen_gvec_fn_arg_zzz(s, gen_gvec_rax1, a);
-}
+TRANS_FEAT_STREAMING_IF(RAX1, aa64_sve_sha3, aa64_sme2p1,
+                        gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
 
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
-- 
2.43.0


