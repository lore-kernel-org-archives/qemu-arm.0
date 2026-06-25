Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B00CDE00C
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:38:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfn-0005F2-LW; Thu, 25 Jun 2026 18:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsew-0004aF-0g
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcseq-0002LA-QN
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:55 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-845bd3fcfa3so216152b3a.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426732; x=1783031532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2qvPCvAlb5yeTP6nFMpGkPdpxWzC532ymb18S8maJ0=;
 b=amicl6Mp//DbhzMaM9QZdteeNCheqfKtDfRX80RRUn6V8NpOZIz0Ay7qKM9az+81+g
 nCv4wh+AkF9ItUtHLnYugjewuuQRH13HLsmUBr5dxeD8xB2YXZ06jcywabXeuaBCbYeh
 EvYX35rgapQx0zWkpdNjsACM+AVCDOy8rt129FRl1+HBwxk8TlhHEuC/WKcylQ6MpF2N
 dNh7X5xFJ+ReQ7UgyuGBgD+QcmSI0GcuF5S7IDhsFM6wtXWfYkjQyieDwPx/6fGSs+40
 uCtIVoWWK2oyAAMyu4dIj4G+eq7C91Lt4gtoDVoh2v5udrxMUDL1KcF/46px+oa1HUDO
 Pqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426732; x=1783031532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N2qvPCvAlb5yeTP6nFMpGkPdpxWzC532ymb18S8maJ0=;
 b=UiPv85kkRrjTzSV4+wuAPvlb9VluxYAHXEB2dtrt/BMJchtXgkg6MiROtwNsp67h1t
 VLFd2iDDGL+CVpCOgcT/taP9H1o/12JABXXonjQ+qaewsGJd6SnXC6nI6ZQ3EyNSJd1B
 KwXFlBBLz0y3j6d4ZDZ0WTIeEMmXdPokGQO7VYTwxNL6JczmeWRVkhE09Q01/f12Ocm8
 4o3S4Qxs6oobmPjFJH2eGv7qFKVWh6sgcIGZE/4Xb62K28qsCURsNTpGqC8RruB3foYo
 KRjykJKBmMk0psDBVLCC/F2pPOFVJ9ca+D3/5aphScKlIFeNLSdANQr/Q6EplcZ4uGTV
 e3jw==
X-Gm-Message-State: AOJu0YyiSTphgAXT8YDnoaZ4kmpX9AeROpo9ZuiSXCM5X0n7dx0OmCNW
 GImr1XDKnFpVL3HEagwgUlHy27p9iNKskaKDfsgjWGrAZVb9Q4B9ZECh/1N4bWCFz+rJYVccCKY
 BWC6q
X-Gm-Gg: AfdE7cmi0e8lVzm37L2quXSHZnqSTVxsCG8ZOfWnZ6D3dW4pkt07rXbzmPP177KcHNP
 LnTgPpwlnCLrzTCwmcxZ8ecwlxGRCFDYImYjvtVy5MlDB6bZBDxrPruTWqvDnh64wvypDEbDFZ4
 G8rzj0IIR2McM8hT5RGK2Muh/RhMIv+7VtE5ANk1bQcwXkECP+cMzhAvMmNtDDp2RMx+Hm1pxOq
 nioQNbTgcH3hzJ/YCuq6snwuCiAATt1FP65RaTTCZ/McUup824yUid8SYYHeD2h+jkS4Iw2Kmni
 e9n5DwOWN9NoTUiu7w5PMgI8Mk03Ga4TTGltFoRLWIUJfk1V+MMXke+SK8eFIHC6On8rLFBTPy2
 Vm0TDbqkhtjN/zFUEMKK3woxMEgRt/K9dRK/L3etUpopPuyY+QY0s2R4POEKY1+ZLaTe74Q763C
 UhW2Yx20zUk4akTHlq5FNt9JuwOeShzWbK+ZWLo1ixIEdDX2ZcrA==
X-Received: by 2002:a05:6a00:2344:b0:82f:3a1e:5618 with SMTP id
 d2e1a72fcca58-845b3ab5607mr5422904b3a.22.1782426732132; 
 Thu, 25 Jun 2026 15:32:12 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/15] target/arm: Enable FEAT_SME_MOP4 for -cpu max
Date: Thu, 25 Jun 2026 15:32:00 -0700
Message-ID: <20260625223200.763198-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 42aeb29306..5c5fd17d68 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -174,6 +174,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
     GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
     GET_FEATURE_ID(aa64_ssve_aes, ARM_HWCAP_A64_SME_AES);
+    GET_FEATURE_ID(aa64_sme_mop4, ARM_HWCAP_A64_SME_SMOP4);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 42bff58e76..da2940a41e 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1383,6 +1383,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SMOP4, 1);    /* FEAT_SME_MOP4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, AES, 1);      /* FEAT_SSVE_AES */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 7b85ec6146..3d711d76b7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -173,6 +173,7 @@ the following architecture extensions:
 - FEAT_SME_F8F32 (SME2 ZA-targeting FP8 multiply-accumulate, dot product, and outer product to single-precision instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SME_MOP4 (Quarter-tile outer product instructions)
 - FEAT_SSVE_AES (Streaming SVE Mode Advanced Encryption Standard and 128-bit polynomial multiply long instructions)
 - FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
-- 
2.43.0


