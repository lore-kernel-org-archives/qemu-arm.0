Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89F2C83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 17:00:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZub6-0007aO-NE; Thu, 10 Jul 2025 12:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZuLE-0004Qv-Qe
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:41:48 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZuLD-0001Au-5h
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:41:48 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7494999de5cso807331b3a.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752165705; x=1752770505; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxglZr9FSbfBVmHLZ+FvVDfQKN3fWf8b03y6OHhLFac=;
 b=XbGyl32HuXid/Xp6ibSD/wCDSnax1aJiUgR6GzJhvj5Y27ctxt+u6k7TbGZbcNP1EL
 CE/jWd2U9f4T5+jB3kIXNHWqmTJKYENq0NouxUdVwwJl+UnIl7gygkHv7AptAlmyE7ud
 2DhT1IM32dNG/syDsuWzXX1Jh7Q1R/gqY4xJ9PPmXYSqvBtLQ42pAhgfYSh7LxeMLeYI
 WDwHxXGXl3NjhURgHrM+hBO5ZTNTQOoGBGmHMsA4wZJY5Tyuc/vgmjCP7a8Bss7/faUc
 hmdrPPJpnwwMrIi+UgKD5+DwvtcwKbfH5r9faBPLN8FnWJBRXqGoiSvVBbWSxFIxtp1V
 DuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752165705; x=1752770505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxglZr9FSbfBVmHLZ+FvVDfQKN3fWf8b03y6OHhLFac=;
 b=ubEqp2wQu3xOOVUpcmmkP3vEozdUyQmc6HesDtCFAQ16163Gfh6bAKmG/pev12z2QQ
 9X0q+T+au2Hon954cqdGm7Z1TjknczEoK5N998mpoeXb9cUNd8AE3fxWSvOsPUEYsjqO
 wmfPT/5kRjleKse3KxhdIbeJDtsc1QHOY/Qy8MoCEsgU8lswpJ/vz/8H+8ONnjzT0nxa
 rvKiugsZ5mJnzxXRzMVNkgaOvXA0A9epMiGXuVtv35XtQrG+r70K5/PFOoPV/y5xtgAS
 qpz8J3C55tyHaY+7/MqpCq9SrQh4WskK6i0rkePBy9rbFRRtMvTZN5W01PdnydxjERYD
 5xQA==
X-Gm-Message-State: AOJu0Yy8aCSyAGW+qV1y2RubjnVBRNaLscoUDNx+4smxDEYk12XakRhR
 0H99WcmfT+ztJ9wAbuxJWTJvko6Yi2BgvMY5vJjVahm35gNTQ68Wh93joVnmfK//HxXR0u5jgmg
 w/U9RZqk=
X-Gm-Gg: ASbGncvrSE1xNnSS/2xc9casvCYNyb+RoCXpjl4bHq9vXpMSaVEYpB1Df5BFsdLIgyn
 ULMobNh1OJJQOSMqwnE6Jvog9w7PjlryJ7ao/2otPwTyEnk/FtvDrkygWgRqs7g8pXqah1kGQ7h
 LSs6sEAgsHdyJqqtcYfpczwatPskOQQqeKT7lUWiXmGSZ6h9UrFyShBu9Udpuw1RMxQlz/e8XM1
 Xq/61eDMx48zpicbb5yh1Cs3z8rSB/L72x2WUhB0jmP343COtBCTk3WO/H5FR1U1uiWvt11LbjG
 TY2USHzce/Qh6Qh/Z36OxVmIvEC8BII2X0eaxR4bHGAhep/SACekLft56cBGM1ugtog01m0B7cd
 MVLoYV0gBgLU/xO9BIyOnNg==
X-Google-Smtp-Source: AGHT+IHs6X6TJoZFV3hxG75A/LOqYKYH0DdE6kJoOtPODuPsbqQiF/CnEFD7ROf7LLpj5AehxDrz1g==
X-Received: by 2002:a05:6a00:bd93:b0:73e:2d7a:8fc0 with SMTP id
 d2e1a72fcca58-74ea641180fmr10537784b3a.1.1752165705377; 
 Thu, 10 Jul 2025 09:41:45 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f5c7f7sm2919119b3a.142.2025.07.10.09.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:41:44 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 6/6] target/arm: Advertise FEAT_MEC in cpu max
Date: Thu, 10 Jul 2025 16:38:59 +0000
Message-Id: <20250710163858.1094780-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710163858.1094780-1-gustavo.romero@linaro.org>
References: <20250710163858.1094780-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x434.google.com
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

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

At this point, no real memory encryption is supported, but software
stacks that rely on FEAT_MEC to run should work properly.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 3 +++
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 4 insertions(+)

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
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ae2046a7f6..1b9b6475b6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1250,6 +1250,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64MMFR3);
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
+    t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
-- 
2.34.1


