Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6611BC4452D
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWr-0002Co-0N; Tue, 21 Jul 2026 14:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFV1-00018K-VO
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:29 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUz-0006i6-6I
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-ca2fad0ae38so9120585a12.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659644; x=1785264444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=veqhogoqyls198dbcRhu1qq+EqvvsqzxKAimddpRnic=;
 b=MoUT1W9IlbQqw05gnyZOj2QfwL1O/vLu5CWiLIDVMZt2s0B6RgGEcK8U4hQn5Cla6O
 rlbNYkvodrsVjAa4oF0q/8ptYUKGB6BRfAkdBP/PbZ+N53IRSzTLX3/4Zy0cGMtwxYlC
 KP4KJC/xZzmHSSPVxBDzsqW+10Dz7OvYJid3yaYRunJ+U4fZdUI0KMS7ggWx6L9bxUzn
 g2dzeAWp5+8+rksJZythhrrzpJO0+d6vU+YhNw6S8xiwd0CVTIm7P6hx55ra5E58j3/z
 5P8Xt+cXV/lW3QTSpY3suMGsTuh/lw/85P/2TffydhqIFVp2SpJJmem3p5R2++I03Pa5
 8Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659644; x=1785264444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=veqhogoqyls198dbcRhu1qq+EqvvsqzxKAimddpRnic=;
 b=hqQH5k/YdMJA+ubWG1BWp0RhnxnpIz229c82Wp5zSxSgHZglPCkFM3BV9BgIf2d20d
 rQdQX4GFBd2R2/6A3/8AJdkWw/NcHosM1jmgtRcihF4+ikto0FHp7/6MAv97sMY4spnk
 yIFmGkgZXjyz79hf7oKlMm9Esf9bnGTfCDZXMVmU6ounL/3GtfRgj0RsSFRlMABSxCym
 xpoDb8Iujglfdh/V9M82nRrHm6+1e1+Edg4zalC1PuzAVhbw3nWITZC+nc26Yxf8JZKK
 V/F6MH1tHxkR1jTbKJ3rrnXGdCwHQ5sAH15qCqFyYbFLBQXbfqSfzZnCjwxww8z1RJeN
 RRMA==
X-Gm-Message-State: AOJu0Yz3zLji8HBgrCwQNXU9/R0qv3xNPWIYjSuTej31KhBek8X//9E4
 Fjyqjm7et7hKHpxa9+5Yq/1+3pR+jxEnR4Bpv49KIbxjQ/j4yKjz4WrgJgHuuJJsetI=
X-Gm-Gg: AR+sD11n8gnZt/EAst72qKB71fT6vjuwESokj3jn/vpiYiXuL4WUF3O/NJxI09ZCn6j
 LyvVyi+TkaInRs9l60etcKejYh1jvp2xu4Fs2h1vJAt3CqNuj07JPDEwVl0SnNyfX9rE1u+voZR
 lv0prfCMnrRikuTdnq2YgDC7Z90G2Y2MZGyuHvXz9wDds0hO4GRrvGGDWtdLUV3uO2PcLpFafP9
 vIFQrBM5yz/lPjbDAZcYomddAi1UycRIEihMnj7g3/jTipxgwyw/vLvMSw5Kuy4+sbUQLG+V20g
 t/qDg79oQlRAESeVC1zSybLT7ahrgV8hhcQl5rcRdxzTEGJiRFv79gvMO3MNbtA7NzIH+NlsyYG
 mgftgNqrx+Z/SMg/18Emk+xyVLtiVG4v+bfUCQm8m2i/raPqMBoVUaAB1Sck7v8Lb8gU1cYHNhs
 quPLkZf1k=
X-Received: by 2002:a05:6a21:6110:b0:3c3:a140:938a with SMTP id
 adf61e73a8af0-3c3ad947db0mr22396841637.45.1784659643388; 
 Tue, 21 Jul 2026 11:47:23 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/20] target/arm: Enable FEAT_SVE_AES2 for -cpu max
Date: Tue, 21 Jul 2026 11:46:56 -0700
Message-ID: <20260721184656.530230-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 2 +-
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 4359312ee3..f87f22f690 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -182,6 +182,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_sme2p2, ARM_HWCAP_A64_SME2P2);
     GET_FEATURE_ID(aa64_sve_bfscale, ARM_HWCAP_A64_SVE_BFSCALE);
     GET_FEATURE_ID(aa64_ssve_bitperm, ARM_HWCAP_A64_SME_SBITPERM);
+    GET_FEATURE_ID(aa64_sve_aes2, ARM_HWCAP_A64_SVE_AES2);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index c7f8217cb3..23612cd22c 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1366,7 +1366,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
     t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 3);    /* FEAT_SVE2p2 */
-    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 3);       /* FEAT_SVE_AES2 */
     t = FIELD_DP64(t, ID_AA64ZFR0, ELTPERM, 1);   /* FEAT_SVE2p2 */
     t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
     t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 2);  /* FEAT_BF16, FEAT_EBF16 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index fbc98d47d4..cb6c4ffd4a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -198,6 +198,7 @@ the following architecture extensions:
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
+- FEAT_SVE_AES2 (SVE multi-vector Advanced Encryption Standard and 128-bit polynomial multiply long instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
 - FEAT_SVE_BFSCALE (BFloat16 Floating-Point Adjust Exponent)
 - FEAT_SVE_BitPerm (Scalable Vector Bit Permutes instructions)
-- 
2.43.0


