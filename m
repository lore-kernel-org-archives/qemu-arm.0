Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8175CD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:10:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY1A-0006WS-Gs; Fri, 22 May 2026 18:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY17-0006Dy-QI
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:53 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY14-0002Uz-LD
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2bd2051167eso37657905ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487609; x=1780092409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mlHp35ogsh7c26vT4z1y+taeBeDu4URlGrhll39PMw=;
 b=UdyMnMxmXI56/fWwO0P8bNnFDiIhASoUsuZSTvDHmsQfyAiHJQ3Ir1J00w6IIYA5Wd
 6Sk1vdPC8gRHq7TT58eNmM0zCePPsP+OeU3PH68fTFgHMLhyDnCVpBpPO562VXQWDjcD
 MtVbhNahZSJq3sL3p4qQ6OZ1oS8Qmk7Wqg/k2vkpUaDQWZ8ji9xkm8IHcuWwybw8kq3J
 DYxvUiL9IDPW4fdqER3fxKeuy7aXsMmmQzLEifo2cSkJ42ms1P4FSmrhx0YfdJ4jU15I
 m3gRds8JdOeyqiKLpYanY1CU/cyJb7qjnyLQJND5vYHaAqD1NZOq0E8NuIs88wg8/u7M
 HgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487609; x=1780092409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3mlHp35ogsh7c26vT4z1y+taeBeDu4URlGrhll39PMw=;
 b=Ht/KjJ4cxVLrj5GmdwH1I3b841UBWPR/wgChWL3OOgHIiGRy1xcC/GL7mYz1gRmPXv
 V1c1ifpbx1IMcrbNUPjljsevj6AyhlqWuruw6OsMY1iQaux1PtWvNnmlpi5HLmZalv0t
 PHmF3P/wiKO8qNLvOFUuPriZSRVR8Stiab7g3CJk1vYNu8lN1udQDfSJuEagLdX3RLVn
 TR4QlbDvIk/N8PZwyUsCfGDNNz+gKsqmcfADWcqBPZ2S5DIw8qtCLi8ZttGPSMupxNLM
 +0Lj3LpL1T4d/zFuGbhD3ELa4EVkRmuFuX1FWr1CLCNfyCw2F8gpM7pfYI8oPLPiDEtn
 bRmg==
X-Gm-Message-State: AOJu0YxvhY3X+2rkb4mePE0vYHmRu5XtQX2LynA+U7kEieR6yYsiWNKz
 ZldcR3iuI+Wk3AKfNweztxb0a3IqNnTUV433MMiMV9049Cv+YSgQ9PQ9NfAOO1V3NVw=
X-Gm-Gg: Acq92OFaPioQbLePru7RM7Q7EJZIzxNGlKGGbwQ7uj1iq1yEbIH02ljJS34hUH80nQe
 6R0fpgzA1nBVeAbUuNHA4q3LOw9UvE18kn9YaHCp1g60CdVWgQlkq4WXQ6wIgGYvOmPy0vgOmxH
 T+CZzHl5Tkd20+3Lho2e0YSgoLXabbyyzGkPqK6SXmodFWZspQFi4kj6tZBdeqoRis4BgT7iEfj
 PzOC9m06/LzS0UJX6l1rEjxEX0pL4EHTr9/AW76G97DUhzjtxeJ39iSopIiZplGuzVU3uZOuVck
 SjNh925SBPH8s6F04hTuqQTXHW/PvgT6TG/vPd+3Ig7TSqLCMLUMr6OfhktTMorWsCag9f8Z6Df
 oZPQzwTov3BuO/ecief/C2ilgqRivzjwMpTRvr+ki27dmFwlvXV+wCQI5sKJj4ue+N2df0JKDLD
 PA91htfGy3cOU3zD7SSp50xEBPQl/IZZEn3UvJ8sM=
X-Received: by 2002:a17:902:fc85:b0:2bc:f202:54d7 with SMTP id
 d9443c01a7336-2beb069e6c7mr56649375ad.38.1779487608782; 
 Fri, 22 May 2026 15:06:48 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 42/64] target/arm: Enable FEAT_LUT for -cpu max
Date: Fri, 22 May 2026 15:02:44 -0700
Message-ID: <20260522220306.235200-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index ceeeee5315..b5735a000f 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -220,6 +220,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
     GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
+    GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..bc866c5a67 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index e44b3016be..8fc4b2a3f2 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -101,6 +101,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


