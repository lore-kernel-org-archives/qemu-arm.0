Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5125B1098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Zi4-00067c-Oi; Fri, 20 Mar 2026 09:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhx-0005zH-8X
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhs-0000NB-T1
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:08 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-668e55bd36bso637441a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012563; x=1774617363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bvPr4D3U4aYpEBDt0gtYg+QezK8BhDvD368zVSWXdg=;
 b=LPBdfxmGDjHZfTAGIts/LJF0QkKVZYd+N1NgCali/S3dG/sbLhIxrGYy9342CUJFvn
 /duYzzNPGpUtO3ak4podA5RAqetPN9bQJvbdJavxGLIg1tIrNPG5UNsw9mDOGHaaG5/C
 QtNkpfn5qLFDeZNlJqhl3x7NUw5yI4N6zF5Hw9pEHBiFtlXhvRW9Wg9dd3d3fN3QdWx5
 YSmMjKVDA2Q1qB/tWf9c3iuIJEz1O2JTsjjI8pWAHpA6CHc3nYmXFkBwH7y0yYOa60Pb
 EzS52voSrT08YiWm0Z3fuKlQE1yE5gFf7Kwjbz+gXinm84wFIJgSD7ZJSc1Wgac/uuJC
 sA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012563; x=1774617363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3bvPr4D3U4aYpEBDt0gtYg+QezK8BhDvD368zVSWXdg=;
 b=AVCfNzn0Ow027aiZnCzqZhHUZFVNHR64t0HCGpZ3UfqRr4WFOtHz5AZGS+GYeXE3L9
 uX9w2pyzXPV1Hw8YVLrCsXlNYpl7FBgRjcNkvQRp4MSyPm6kJmliSZPW0D31BETpRvH5
 fzfXic/6TalukR1RzDEbNAUEhMVV6nNRmsxWnJMmMbC9uUGOiP3jOScYeixhrAAZy4Qf
 GSP8h7h36yETdUP4y3VisnEFuPrNBbZZ0Fpbr6jF2Usz7hnnuOTgrcYBVK6xFfUF3Q2R
 Oc0poM+5nizhUB6E9O/JEReScJQJHogmkF5xtcr50aXPnH2qP68sg83o+Ork0wLVp/XR
 UUYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX38DP/SJ5Lk1s7vitCPsAxZT3pivLlL6ExYRTy3HlVDZbaOiWm0WIBMUktYhvliSMyos/ZaEXAug==@nongnu.org
X-Gm-Message-State: AOJu0YyK8+oHseyufQKUM93kApMdo42o35L913ByM6Me9YbnsoLwj4GU
 S43XtigL9oj87mBfwHY2t6RRVwGif+rhy/UTcKhPjd/Dxh06bFhzNmRjOObU/asb78o=
X-Gm-Gg: ATEYQzy+pYFwCygIBvsL6bW7vIhcqjwT3HVWrp0UpGn4Uwk0Dt604keY6Fz+YimNjU2
 TsksxYZgjyHuJja8ggYr86Oq8zVOQVZdC6bYW8XNyZopqka4lUf8okImZyb8iX+jM4Y8eq1ipMV
 XBCDebUXAeUi2HnMM9N4ObSGXyMSK9DPGtGzm3ZmO2W9vkoZN2z2/cO6vxoFpg3cbVunjig1j9a
 CahoO9487iwtMnEkzQyiPwK1VYW2wfkwO1f3q11Gy3Erp3cfSbi00YZXiZW1/aSA3G+HeZheKAD
 ni35plUeIS4TfaEQLaVRpXpJDe2X/yYDme+dBS5TJzH4PMhhTC0/viz6utP3jDrQwWZsS4HX1eG
 NLlAqtq1fbbFosK8RSDupUDnS9e5OEwwp/wXUrL8JwQkMxuhsPphFZlnHXSJWJEpcRhkLXL3lLx
 IUBqBkNVJLKOp9vxOQgdWCCuo=
X-Received: by 2002:a05:6402:440a:b0:665:e9f:9021 with SMTP id
 4fb4d7f45d1cf-668c932395fmr2098518a12.9.1774012562887; 
 Fri, 20 Mar 2026 06:16:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-668cf4f887fsm1427482a12.1.2026.03.20.06.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B05CD5F909;
 Fri, 20 Mar 2026 13:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 24/35] target/arm: remove event_register check from
 arm_cpu_has_work
Date: Fri, 20 Mar 2026 13:05:55 +0000
Message-ID: <20260320130607.2071996-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

The generation of events are not indications of work to be done and
importantly for the case of WFI instructions not a reason to wake up.
Remove the check.

Fixes: d238858bff6 (target/arm: Implement WFE, SEV and SEVONPEND for Cortex-M)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 98d09ac0656..d51599dfdab 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -144,12 +144,6 @@ static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
-        if (cpu->env.event_register) {
-            return true;
-        }
-    }
-
     return (cpu->power_state != PSCI_OFF)
         && cpu_test_interrupt(cs,
                CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
-- 
2.47.3


