Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFBF10F996B
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:32:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXhF-0008UC-4M; Wed, 08 Apr 2026 14:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAXhD-00089r-J2
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:32:11 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAHnI-0006Yt-NJ
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 21:33:26 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2b299b3c739so12408465ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775612002; x=1776216802; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAhS4MlZiUixeL5RoVk+cyKrBGfLpW045m/lFXD5jrg=;
 b=tV5OZ+l8A+p8T6BSUeeN22cD6OzurUz/xRfs+WSODX260JkqTgP6OTZrjR+NzeR/K1
 zkmZznuUdmvM8BKJ1X2zjgMiobYi9/mDiqm0cu70bLNHgbGrcWl7weGKX4KH6/if3rUt
 7VZf9HhBrAK8LuvX5I28rkNCSFS7kGd9BfZGWUTZ1hjhiC9hxGJVI2MgezpRWXmZVUcN
 pTg/ueoCXxv1ZsOVzSVs4qQ6o0M0X3KMxvp/VMSlAaP2iakq2Y5MtXUoSnZlWzdfI4Ho
 gq91RTV6HLc/fkFmJTQ55XKqF9hzMh0rEhe1nrGQbsCDHqybzFeU6p1sJbsyhcIu6th0
 pvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775612002; x=1776216802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iAhS4MlZiUixeL5RoVk+cyKrBGfLpW045m/lFXD5jrg=;
 b=BCag9SKpEiI9oNb/UpPWZZRoajk/YCXzLFYOmsoEMN7h4nDsOU3SAM4IArmmEN3g28
 uTChgTRbcEZQF1sEtyCPbAmWGhnVgRj/FiSNFH2AiFxJjFCht46xEF+s2BsOx8Svg2A7
 A8Prq4pbiirmbhppeFNDnPWeRNT/jqB0qpUmOoCdWpXbfIb3/mIWtz4bbvOAqxJTRwfP
 PxIEesUduY2sf+gZ78rLlqBIk0tFrE38z4PbI4a2/ZjnUAr8HXi9mnbab6AZA9MuGegP
 IVfMZTZr91UZOOEJil6CvRjkhcOMY/TQ8YeI1ve/9EtH4VO9RMUt8ZQEh124FBjYHVIH
 REkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0P+occ2ylEdorTYcjRNadAYZzDbIoRQ36HLMPKw1zcnYV7l2wvGA7TqEH7Tv70Piib7WVfELsRw==@nongnu.org
X-Gm-Message-State: AOJu0YwpXRxJ1bmwrfzHT5R/x7nKFDQsn4Q1yGaXINq2mxqb7m1QW/Q7
 wOA7mEEp7vsCEM7RH3I/i/GM8uXnDgelRdd5/wf7f5xFY3ZsX2wPX/9sdHbz3tGMdjgUAubFPNo
 pEzWtd+I=
X-Gm-Gg: AeBDievxzbHxFLsui03LAzkY+xDo2qQTGLQqNDMxi/nQthYlhDuvwL1z9AG80Z54kj7
 YZpxV9/6j4EIqVD9FAtPGnMUPTxFqaAqwiJKX/9PiJ8vyenxwRpjxJ/MuMTTTR+DeIGJNqNSG46
 Cwk/vTnmWvkcGESFEQRX3uwfL93H/jH7jglcFlnOfs5+k+XAfD/dZwgJZVKk0jFY9nPu21g2XgM
 gFGNERoogqKkZyBfd1qMgeFjnZEThIViCHVFlrveICxC13SeIsNmk6I2t0vG754m2fT7tQ/G0/Y
 sjl1JYoV4eUtTperVrwwl1KI5gVVT7pDBjhS49fgPgJKeRBmjeMN4CJEEdVisoQG1RMUTQoXQKq
 dM/N+Z0C1dU0+wEpuOro5akJxS5qu3tcsPesRhS2yYWHx9Xr0RMY6L939HZWNYKWTuJlR2RSMgb
 nwo/g1fRgpCAJEDK7ac0tM0S6Hw4ue0OVBGMN+pL7dGGhTCyQkaUYnmZ3W
X-Received: by 2002:a17:903:3886:b0:2b0:c45a:bc2 with SMTP id
 d9443c01a7336-2b2816bd61fmr216591655ad.16.1775612001972; 
 Tue, 07 Apr 2026 18:33:21 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm238277395ad.0.2026.04.07.18.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 18:33:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pierrick.bouvier@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Remove bswap_code
Date: Wed,  8 Apr 2026 11:33:09 +1000
Message-ID: <20260408013309.56122-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408013309.56122-1-richard.henderson@linaro.org>
References: <20260408013309.56122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

This function is no loner used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..917e9919e8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2568,22 +2568,6 @@ static inline int sme_vq(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, SVL) + 1;
 }
 
-static inline bool bswap_code(bool sctlr_b)
-{
-#ifdef CONFIG_USER_ONLY
-    /* BE8 (SCTLR.B = 0, TARGET_BIG_ENDIAN = 1) is mixed endian.
-     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_BIG_ENDIAN=0
-     * would also end up as a mixed-endian mode with BE code, LE data.
-     */
-    return TARGET_BIG_ENDIAN ^ sctlr_b;
-#else
-    /* All code access in ARM is little endian, and there are no loaders
-     * doing swaps that need to be reversed
-     */
-    return 0;
-#endif
-}
-
 enum {
     QEMU_PSCI_CONDUIT_DISABLED = 0,
     QEMU_PSCI_CONDUIT_SMC = 1,
-- 
2.43.0


