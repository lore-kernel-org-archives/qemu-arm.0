Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE53CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:01:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWx0C-0001O4-0C; Tue, 09 Jun 2026 10:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx04-0001M6-HP
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx02-0004Jc-H3
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso43159995e9.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781013613; x=1781618413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hgC4BPNJwqz49DQoEMfvPbzbVF2te92kpDfaNPld+I=;
 b=jxJHHMJDrsDjOXmvhDsUSoBLIb9dCQxlALJ2e+eoYBJYjPGLisM9nQ9brZxqXYX/LT
 ryLzbi3O+Km78blTSzcPOhxO6PuLV/S2+Sv0QOItuvuBnhka6doIQBgB+r0XYfYS1iYO
 fcBzHc+xoyFCshzxUEQSSaC4sfozVTA+DZx03rylCw16Fq9rg49VqCoY30v1Gj1OQpg6
 IgFV6FrYjgbBlAbAsAobZGPWyME6mwWrHdQ1osCcCmHR8Rs1Ur86/bWja8wufkRJhNwq
 HU6xee/nbGVYZP6Y51KBqXSNZq6zlFcrBrIrkXIldQyIV2KFblYfgkcxNtqJB6Vtpjk2
 sykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781013613; x=1781618413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1hgC4BPNJwqz49DQoEMfvPbzbVF2te92kpDfaNPld+I=;
 b=IWwvp68UkIKGhWY56rGmUcWBAxvsE6UMVCum9WBEP+2a/cOXMIhjy2BkpxECvDSx0w
 FKPpkEY6JGlmc34/ptU6DRczUkfJP2X+r9UnZ1WJvc3zHnGvXZtK8MV+vH+AREMjCguC
 Vnqo1R7tlEol51K135GWmPjyXpl+0C+5kLia6hzSMCQX/Rc9oXOW4BJVVa2S8/GYTT4n
 RH2FgUPaJxkfcc25o2+toCzSBm4q+Dqel1k4AunJdMEzN4PHUdaP3b0vK4Gjd+gi3vqh
 htEo/bpQSEunKqpXDK5hU1PoMQv5afBX9seqYgRk9v3Hk/0RZtRkzJvwtFbDUucaAJMg
 NMcg==
X-Gm-Message-State: AOJu0YxJgPJ6glwZZU72VFW0lKLpVrPjsNHMG1he0xaIhg9bnG00s6yy
 x7qVJtb4g6x4dZgyHaThjzdsac0/jsKTu9OArOxDf6ysCN2xYnIMEdvhe6ubIHZ6WE8=
X-Gm-Gg: Acq92OGPZShoyTjLhUZ/fftsnt0p2BmDrCppg/LTkHbSVK3IsRujeP40EoKqpdgDBGR
 wZjlqcoZZOPM38dx1XibEjq4V3bmtmKQS3uT9Pd58mt+ZDi7lLTAx7o+UaaynaHs0087H0Ji8qj
 +0/NDL2ShT89bi9XmovXsqK3P8pMm9+enOxdeMpgWHNg8kkMqo/e1mZlgmKZ3ziV91FxiHDCx9e
 q5nCToNuUNBY9tTfYbJoksFY/Bmf7waq9lPu55I4W5wv5JvUtIeXzF/xEmKQ83aA8GbdVP2Mel8
 vboHHfm4+T/jlOBHv2+nYjJLcpQIc83cu4f9N+sqKqb8m9rIUoISECyJHfN4tseOp3BR9I83wMi
 pKiyy6l3zPo8msoQxRXERzeUw+e+KMJLSeBLLibaqJFWCOMYdrZg4eZ6DXbNmcchbLF4gNpMXWf
 VMiPRX/s1Swh/SNYBTcfLy8eAQ2nTqo0lT772eRbs4GaU7
X-Received: by 2002:a05:600c:a302:b0:490:c2a3:1781 with SMTP id
 5b1f17b1804b1-490c2a317c3mr268615525e9.34.1781013612670; 
 Tue, 09 Jun 2026 07:00:12 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c15cesm473268275e9.5.2026.06.09.07.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 07:00:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A5DA35FAE2;
 Tue, 09 Jun 2026 15:00:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/5] target/arm: trigger timer recalculation when toggling
 CNTHCTL:ECV
Date: Tue,  9 Jun 2026 15:00:05 +0100
Message-ID: <20260609140008.3206970-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609140008.3206970-1-alex.bennee@linaro.org>
References: <20260609140008.3206970-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

When toggling the state of ECV we affect the offset applied to timers.
As a result we should trigger a recalculation of the timer value to
take into account the new offset.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f4aae0a4072..5c640853060 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1806,6 +1806,9 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
         gt_update_irq(cpu, GTIMER_PHYS);
     }
+    if ((oldval ^ value) & R_CNTHCTL_ECV_MASK) {
+        gt_recalc_timer(cpu, GTIMER_PHYS);
+    }
 }
 
 static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.47.3


