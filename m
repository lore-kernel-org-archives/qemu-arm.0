Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99C5C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNij-0007Ix-10; Sat, 02 Aug 2025 21:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNib-0007Ah-AT
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:57 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiX-0004dx-L2
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:56 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e8fce318224so1417099276.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185252; x=1754790052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LpTKcmqIXZhcFkcloKTAjB6pW68SlM02QmXcOabdBB8=;
 b=G0RpP7YYyu8OOETKXzmKFmI4pvu7/2HemMRRvXRW2M6f0sBE7ZE8r8XLUQIwN3MWoo
 K1Oie4+iJ7frdDQMcn4FLUJVCY5Sd6cfGs7SGqKHT2HzEVjO0Gld/T+0vYvMtSL93AGx
 tpW8RY8Ml7HT8qPNCnQ78Cy3DBvqSSLYstczvhUGhmI14uy+0VozyWI8v+pwe6hgC/ud
 KbgCZZOp15iBWJlaqXtGB3jzKU5mToUaplYofriZjquu6TkQgUajrd5RjEDsUzMcTDIX
 CmZ4cx15+zt5YVIuS25oh7knGxYcYXg5+egtquPUAA2WiWPFK92u7Wvb+Ds6/Ev37YJO
 4/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185252; x=1754790052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LpTKcmqIXZhcFkcloKTAjB6pW68SlM02QmXcOabdBB8=;
 b=bLINJ77+4cGojFQHIssX+kwqW7oS9bF4qkBWkfd/3dKanD8zdeo7WKZHOvYYXXkN4B
 CwKCItEvfM74o/kUePNDcwdGLFvzfGw10hziFmoNx0PXlc2N+00FPIBv28+KbUmFflzH
 jkLPmL+XwP2x5ig87PZrPwY+vJ+nLNwCUkEJFvA9Pp62l/39aHkwacxZgunpktRNr9+F
 izLAiQyR7Z52KZqgmg3YZbCQtVMOCB2zLySoLI/YzgXtSF7CdugmV5MC/tQWrhbBJ112
 hbdPPF4s0NUY5OpOg2X8Hk+xHA3PYnKueoJaw9mlhWAb0yGfHN1rB7iI9zo4fStq3fjQ
 IS7g==
X-Gm-Message-State: AOJu0YyCh3dqe4dU9lMykKVEXsdr2nzMAD5Lo2bf03cBHGGNc+TEPsKY
 8scJgXe7wNHWu7nbuMnuM4hO9IkHwm5/8JeQDTo+mxSmuWX12Dy4LFf/XQLYrROdhzdZyu1AIAz
 fItykLkk=
X-Gm-Gg: ASbGncsWXOP7Eof/OYj3lPSNc5IS1404lafB0YCoK3pzd8x/lU+YX2k7Ksj9JfEVVwH
 /g2nCPHegogJns4EgpPZIkq4hD3AkRGQx2mF5A38r/54YYoW7qK7ZWLkjkttctDlhWoXbVMrH4c
 1nTtAXneOTRqPkDl4ZTG8OFB+zp269YJdW7TGvN2qkJeI2U1C8z+DN+ooJ806G6vdyMhpSX2zLx
 bZYXg1ajkVjkHgdXv/qXvcGErdzbmBgwv8UBAkJRLYOV3Ka+JX957ZEiCtHsBBnstJJIHSUz9/Z
 7nwYu/sAFvhNC+ebhLsHF9lY5Xg1NiCd6erMNkPxmj2xHFHSYqYplLxFqDgArhVg6MLUHsW+yli
 8rEoWLW7e0co2Ohe1c21SQWUTyatMcJu72Y9n04ooFFSow7r+du/PD4b00FZdR6s=
X-Google-Smtp-Source: AGHT+IF9pDAZHuKurz3a/hpzaoKN7pR3e0mPTMen0Oi9o+xLMoyQULuLIsO0DSoQOW7LFgluJuJ2hw==
X-Received: by 2002:a05:690c:13:b0:71b:6628:ff1c with SMTP id
 00721157ae682-71b7f569f43mr59372717b3.41.1754185252053; 
 Sat, 02 Aug 2025 18:40:52 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:40:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/11] target/arm: Enable FEAT_CSSC for -cpu max
Date: Sun,  3 Aug 2025 11:40:14 +1000
Message-ID: <20250803014019.416797-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb35.google.com
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
 linux-user/elfload.c          | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ea214105ff..baa618d6c2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -923,6 +923,7 @@ uint64_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sme_b16b16, ARM_HWCAP2_A64_SME_B16B16);
     GET_FEATURE_ID(aa64_sme_f16f16, ARM_HWCAP2_A64_SME_F16F16);
     GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
+    GET_FEATURE_ID(aa64_cssc, ARM_HWCAP2_A64_CSSC);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 35cddbafa4..d4c021e34d 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1178,6 +1178,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
+    t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
     t = GET_IDREG(isar, ID_AA64PFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 890dc6fee2..b9b11e82b3 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -30,6 +30,7 @@ the following architecture extensions:
 - FEAT_CMOW (Control for cache maintenance permission)
 - FEAT_CRC32 (CRC32 instructions)
 - FEAT_Crypto (Cryptographic Extension)
+- FEAT_CSSC (Common Short Sequence Compression instructions)
 - FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
-- 
2.43.0


