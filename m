Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD78BCA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:24:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXYd-0002Ug-DC; Thu, 14 Aug 2025 08:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYJ-0001zq-Ic
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYB-0004Mf-SF
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-244580523a0so7948335ad.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176362; x=1755781162; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80S2/0N0JL09bgOILR4cEYvK2n2zuzmPlht61UmRSoo=;
 b=LOYregu/nFrdvOixy2X3yi8KHvJvSGSE3cM4BIhx55RM5e5fm+Fw4NW1zgyE0fSPSi
 1bT8t9PDxrOVo04do9B4SYDEBohvUx/OVPxmxsWzZEPnObgHesputwhy9ZCmLkUv4WhC
 dEuxNygA516wWNrvIzj7Zu7VxceRMQPczeUtu5QsExqLHE9DAxGydRkWNkkg8GkLWlG2
 Cv7Yj5w97eJg+6zLBQeCrfrBeDJX0mLkuHkYLdJLF+SVvvRj4BlzbbOQEB6vKHYZji4V
 nfY+TQsSivG1om5OmHnl5FRKvpdPhtcVfdKZzxgBDs0rOrf4M64Q6ANHQ9H5d9ZudgbE
 RZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176362; x=1755781162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80S2/0N0JL09bgOILR4cEYvK2n2zuzmPlht61UmRSoo=;
 b=tW63gGPWTtvVfDnmIpXjyEOwXiwPOTtcDZjDfjUwHiArZV7nyn0QOU2vG8Ym3N63iw
 y44/ONkwzPzR5zVbLW2DaUbWa4ut+oRTkveYv2A4QklgUxWXNK7kj6iODWmqeVNFjdL4
 TGsXo4nF0JwuKoQkZGNz0P3QzV3xzoWQ2TGyLY6P/o/ak6IyFNTU+Lpgpm6/wk17Zj4+
 HDLcBWLe94xf8bQWeOYG0hs71xma1NzHPBZsD1cCTI8VcSkpVBU77R+1MEHwHkDJWKt1
 Ov3JKWDuotXpxtgWD5sYKLzDPiTC5rb3PWD3DRH6D4excl8/Wps6eHAbMQiaSeLYF/xN
 77WA==
X-Gm-Message-State: AOJu0YydNyTdCi8OewAMBVAatMo8uZEsEPB8UyFHCqqV2ufieSgAwWtr
 Ub5ewGYvaVsNbn1dNzppp4OPMHfmH/on6XITy5anEr5KO4gT/JPVEKQDLq4qNQsY0B0=
X-Gm-Gg: ASbGnctmQJKrB4L5oxJz8L0z9aREaF8w+4Z7ymF6SBr8mqUYqJXSY1lh2US0mWeu/VV
 vkzRSePFEJb03dNIvk3+r21RsH2VF7e2RAAVUmMIlvRA+egq73OmuEntZlw9kcmp/XfO/R2AT/W
 IXACm+haH2WjKOF2WrOz81AvuTvBrDq4X9iYxZ4qWzDDB/S90WOmbE02wuG8NmGMSmeWYLFiZm0
 QZ4vQJ5b5avXhqFxQoLxkTLm+552M8byccqm8KDv/pr39osxFd6kbGnsybY+a2MQE8ahPAa6N1I
 pUeGcxSHdt3VDwwS+NnXqMCIyJvr3UeyVeQp4KMOq0fTdvdz3l0y6kAeQPi1tvNKgtsFbPIAJ5s
 dOotpv9mFWIWgIkIBkMCE1KTnbkpwJdUnLFXwv7u028Y4kRs=
X-Google-Smtp-Source: AGHT+IHhYC0xNlnUEaGC2fWjEHijjpRhl8GIo8wE01KmXFl0fmZtqNNfvsrhGALl8yukwaPyVTdD0A==
X-Received: by 2002:a17:902:c410:b0:242:a0b0:3c28 with SMTP id
 d9443c01a7336-24458b9cd96mr46529665ad.51.1755176361692; 
 Thu, 14 Aug 2025 05:59:21 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 25/85] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu
 max
Date: Thu, 14 Aug 2025 22:56:52 +1000
Message-ID: <20250814125752.164107-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 22ccc4f697..f4a41c854f 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1253,6 +1253,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1489c262b8..6ebf9c9ce9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -123,6 +123,8 @@ the following architecture extensions:
 - FEAT_RME (Realm Management Extension) (NB: support status in QEMU is experimental)
 - FEAT_RNG (Random number generator)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
+- FEAT_S1PIE (Stage 1 permission indirections)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
-- 
2.43.0


