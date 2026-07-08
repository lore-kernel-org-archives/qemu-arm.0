Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03122C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 14:59:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whTjl-0003Tu-AW; Wed, 08 Jul 2026 10:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whTji-0003OD-6V
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:58:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whTjd-0002zK-KY
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:58:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so6194015e9.3
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783522728; x=1784127528; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5+grSbIIumxlH8jhvJyMtUcl5Okg6RaG2PcNOeusT/A=;
 b=BmSKjCA/78oBg+rcUrtdRzEY1j42ikfQU2H4we8gTnL4l5CIBoGuNcYLYetUUoaMAr
 45L1OiycwRvhI80QB2pvU59ZkljJvqvlr6kY+qSPgjmxzDj7UkXpi9T1nJJJecWBQWEw
 6JhG8rjsChfLFyFY3Uf9MHtJ25dpsPR2eV+t8mLpXeidCpdOdej5oeL5UajQyFvjSsKk
 o4fJLUBU1SAbCDBU6vdHlbEZUlQemhqA1m6dmYru7mFGfhmeTOKTSz8gFfpBiLg/Wp1+
 QiMGsBZ2kh84JqbHKI3d5oRzKVVM58fulffCwcp+jKD7ZU8L/SooNZo5+FEo0Wcpz89U
 vPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783522728; x=1784127528;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5+grSbIIumxlH8jhvJyMtUcl5Okg6RaG2PcNOeusT/A=;
 b=RC4uEN0o2PmcbuAiiG5fPmWnFG3/9tY7ZRmn7xyAy+LBN2YLiJmZWM3/ck+mwOByGs
 J6u3Prils+VK75Ax70Tc6aZdVioFlRklmMz5et9mXEHk9MOQP+WM2j/o2ID0K5/xXzrO
 OJ87/Kz0w2X8XdAri6Poc4/NZD8Qrop2g0/beo0JFNhPOyw+JneBEIi31LLK9Zad5fMP
 Cu/6/q2cDHM41+YK+wSxKDd/ATkB06JilwxOBp77/Y+0PxuX0McCuuSdmvrfCvHm9/fI
 w1YFlQjF2w5F9YEmCM5twRdowtzBTlRRoO0uWsARSXRmQX5nT6k9aflgxEDHVHqu+Vnv
 Po6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqiM5Y+IjhEO77pu3rOE+TlTxSxZi9TvIpZJHKg6jgQo22RAdJnTqv9YCx7jXDEWtA2eJJBxvudjA==@nongnu.org
X-Gm-Message-State: AOJu0YyzJjq5m3XzppI7BU9T/t7Ve8/8jcKew/ccHc6ugDI1oye1CGSX
 G5vREZRiaS+YsA/Tb2tf9yuBX3dtsG4BiLaFM2mzkDhqvz8P9pOB3jk6voI8qYyYMdQ=
X-Gm-Gg: AfdE7ckw6NaiwuGIBU2sSY6d7O2n3cCjpLn/3LUw2vpn/HYZzaS6cZazlmoydt3xYRQ
 FP3cSaMycvVJdUhKb9hne6zcZtnmEtoBbkvi9mppnbjaHPg+2mriVRgcK8zbcRWXspOW9tzarrJ
 Qw9ywL1ePfJri2kT4/LGHwLbjNplo17DE6QrRjbTmd2x2vy36WgqpJt3qZv9IcNJ2g9djxDe18v
 a1jnnHaHUtA8IrdolOxJZoI8F/iO2bPCTQk0+bcGFh8LiV8eRCpUg9h1fuYqwN/1+kcX7d9PhjS
 NgMGPzLxLUBbyG6xtruAiYnckaPZmlyeoxZmAjfYgrRIOFIYwt+9vTi+ynhFvTCTE88Cs/ImsAi
 iockzI56CZuCwQx+AKm8bsQwkD1IEN6edq6jjQuHBb67dfs+kLYwNoZTB3l6PqpzH7ew3P839s6
 omRXhFLBakZIfZaIml2ZS80Y0=
X-Received: by 2002:a05:600c:6206:b0:493:a573:179b with SMTP id
 5b1f17b1804b1-493e68d145dmr31328665e9.30.1783522728096; 
 Wed, 08 Jul 2026 07:58:48 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e10af550sm145923025e9.1.2026.07.08.07.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:58:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5E9D3600F1;
 Wed, 08 Jul 2026 15:58:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/8] docs/system: fix sorting of FEAT_S2[PIE|FWB]
Date: Wed,  8 Jul 2026 15:58:39 +0100
Message-ID: <20260708145841.3032079-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708145841.3032079-1-alex.bennee@linaro.org>
References: <20260708145841.3032079-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 7806982e0d6..b4b65694ff5 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -160,8 +160,8 @@ the following architecture extensions:
 - FEAT_RNG_TRAP (Trapping support for RNDR/RNDRRS)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
 - FEAT_S1PIE (Stage 1 permission indirections)
-- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
 - FEAT_Secure (Support for Secure state)
-- 
2.47.3


