Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DDFC87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 07:43:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufw1b-0007OH-Hg; Sun, 27 Jul 2025 03:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufw1U-0006QN-0G
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 03:42:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufw1S-00016x-Bk
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 03:42:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2352400344aso30452975ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 00:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753602137; x=1754206937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6I/c6izRvO/9YY3k1FhH9eJOO9nj/nIYdH0I7uHsCI=;
 b=wNZbE0iIRyx+wKTFaqdJbVfkRxYgcuaY3MNtQxzCO36xE0KgrUXm5qqJ00uCfwj5Tk
 wYVcLB+M6UYhDUQKw0a0Kwmn+siWM4aaMVYTABSBC2Su3ga/919cEtLMzDb3bspO0jfb
 ZLGIXmt9676MxYtFFUQJtknJriAXEg/TEKToc0Wt289w+J1d4IYngzUbxoIAqNUVllkc
 uVfdNNmfI5PVtLnDMnfhE7HrnSudgLxPrs0Fter29/KxraT/yPtQ1nKWNEiWl8hgnslX
 wTp3rtMWuH3OBSw3fvWVSwVBQb9qLI1sLGXDVwMaI2iK2B3LNzgrTGAuv1uGVH5EEKVS
 vFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753602137; x=1754206937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6I/c6izRvO/9YY3k1FhH9eJOO9nj/nIYdH0I7uHsCI=;
 b=He0mEP+/crFgT0rLlaT5VjdbNhCM73ysp7yaVHkpyvuH2JFo16hxIOJHnUMzH7TmRs
 thZdo+Fm51JpbvNhNlj99vJBYFaeEhB+rVJIT/1iA7S8kV1jnD091IV3mQ0Udp8OoS8F
 zQjH3kUvVFxksByGe5GN/F3pt/fceHL8zVOegPxAgn/Mzu+6Gp7Iw7zcAGXOsnn0i1af
 /aZ8KLzxMIK+u2pdYMksCHUmEaWf3yKSXuYDi+fBDdSHOE5aP91Ta/zR2gTDtpi58+Rh
 FVsyOgY94qIQhkp/tn5ofLV/48/9ZlVpjfEA27AmC5dIxSbHTfdZUcxjHI94zzIwHlo1
 dU7w==
X-Gm-Message-State: AOJu0YxVclMCZAGAr2N8pFOF5jXEqeQHDdw9CH/GfUZTyUBaVX8/ud1T
 rOG9kf/6loevsugyKHMuND6d1ulswnZT+dB4b8duRS1/a3CBbZSiSlPWOqdscLZ34RY=
X-Gm-Gg: ASbGnctooXgKPVRNX37yRuDtvMa2bbiZAP0dNzCQrhBfMqZJes9UnrOsGS015PrB7mN
 HHKCEX6EsdM1pTdl0Q4R+DjIb1DfVKpqsSPexUbV9BL7I5JUglMXJ9iEcgHIo3qnjiwc2JtoNfq
 N/RB4Cvxmu84pli8rBIZPB7pt5FbxZzmy0eN+s0ubGl6LiXhNoQlbh1oshgTfjljOLh3H2Oe7W+
 dpHeDRY7DbhN8kSFWpfc/eg6x/VkWwuHKvVSXc1wpFQGybFVTPqSzd0hGVFvhMNTK1zzpiEALDO
 w+QDIXNQ1kL2uRdc39eVbATZVbnik6Q8EhiC10kEXD2dHw0Ur3TGX4Rtf8oDEC4ZHIymrmTs85Y
 zSP+4ESa8MMvKgBZM8lZbeP1rONfRnAytmlBJy2fyyuGOQIPDDlN/uqvZ9FqFU7R/oGMHh3e13e
 lIeWvyBZOoZg==
X-Google-Smtp-Source: AGHT+IETF/Tl9fw42ilp67lr6vwrhtW7A/H1HWuow0B2+KLHZLi0AjQ3Cy0OLMZW9emZ8JYggA2drg==
X-Received: by 2002:a17:902:e1d3:b0:240:90d:468d with SMTP id
 d9443c01a7336-240090d4734mr9724485ad.9.1753602136932; 
 Sun, 27 Jul 2025 00:42:16 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe53b546sm29633055ad.177.2025.07.27.00.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 00:42:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH v9 6/6] target/arm: Enable FEAT_MEC in -cpu max
Date: Sat, 26 Jul 2025 21:42:02 -1000
Message-ID: <20250727074202.83141-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727074202.83141-1-richard.henderson@linaro.org>
References: <20250727074202.83141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

From: Gustavo Romero <gustavo.romero@linaro.org>

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

At this point, no real memory encryption is supported, but software
stacks that rely on FEAT_MEC should work properly.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20250711140828.1714666-7-gustavo.romero@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 4eb51420ef..c54aa528c6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1250,6 +1250,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64MMFR3);
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
+    t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1c597d8673..d207a9f266 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -89,6 +89,9 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
+- FEAT_MEC (Memory Encryption Contexts)
+
+  * This is a register-only implementation without encryption.
 - FEAT_MixedEnd (Mixed-endian support)
 - FEAT_MixedEndEL0 (Mixed-endian support at EL0)
 - FEAT_MOPS (Standardization of memory operations)
-- 
2.43.0


