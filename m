Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB50CDB471
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 12:46:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcMzP-0003LY-IG; Wed, 24 Jun 2026 08:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMz4-00038W-Ql
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMyz-0006Nv-NJ
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso10149645e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782305132; x=1782909932; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJY+W/ZKEQvF6jKnVZwMRA0n7P4OO5L2LHPk6wLaYKI=;
 b=g0iQ/Z+37U9b8RtAsvzkxT7BTh7nhsEH4YsYQHll+e6p7IP1q9zZDQKyBMRS+yelQf
 bWjejhp3vH80ZhnGuReim7wFNdO2Dz/I+1PvDqeem2TIVwBJBG0xhSmKaHKL0ae99tWa
 6cYEwUnqfp9FlmWW2o/7OAz+LrGNyavgnDJ5tH+48VDC1o+QNHaPF9N8Tp7fviroMcWw
 kw/kgJw81u5aePrbMzhlnJ3YYejIQfmgm8EJ7qBk5G+/mRDLcB9zIQeFGh0eeSOIJIKK
 GdnYRymzfffnfVsjmSNqHuIQO7M8KWtJqdzKqo0EppwvDG7wy4mLssp+qNAeFEVtZUAT
 lcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305132; x=1782909932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jJY+W/ZKEQvF6jKnVZwMRA0n7P4OO5L2LHPk6wLaYKI=;
 b=oNsmh4BLRaL/Uy/8JTgrg9h8wjyH4tV//R9LfFCX4gG6dpFMXpxAwcBLHkTu4LEQcu
 rD1dEYg/Rddwe2BpTti2ufu+MurKxap7kHubXfn9CR4iq9/Qo0iHQyzlBqTvPoEdx3pX
 02ccBVVe3LPNmBGnGGccwit3aTEOXGHZnuf4r3UCtUKRQ9AKavWen0u9M7UsUG9yf1zD
 5MXkP3kKd1CjloQt2+cVY6/nAqXmKzZROlZL/WerQwUJyERJ8mzH8aNpncks5fORZWFq
 D7xQESl//5/3ouwCJlrozoKB/1/1+byx10KTotPziS13G3GVCj6QOWm4EN0XV/69C9qR
 QASA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8PgG4/5LLbcjbb6yIPwAqnxYIZbePhG+lLs27ry8IJsEmyfRKkwToePeeRYkOEOEhc1jo/XOZI9A==@nongnu.org
X-Gm-Message-State: AOJu0Yz7QVoT5B3REVU/PcLgVnxZJMYgAvFiWYjEUikoffF4+YLbuWhY
 XONEWl5DVTCGn6+45tws7TrVo4ws/xoTXWnRJYPUY5N/hjHcKMQbGXl10GXk8j9koFU=
X-Gm-Gg: AfdE7cnQrPl5SwCB6PvNbfeMoKdmlrppyU55LISweEUEgrYBRnlI0Qo/FdOO8JkN3Ap
 mIT3Z5ina9Fk0b2vUW6urhDAFDmIJyHzWV9DwytTK0N95ljbblSa+8siR0kPytAvLYsJQuulRbM
 SIzSLHXiltkH08y35spXA9cJYT5Ipng3dH7ZoV1ez6Kc1vn+axuGPfS50Edgai32578IyP70t5D
 sCpW4OIG1TIse9trCQ+Lfsr2zpeDCcCjGehTWiyGU/Mal6b/IRx/yThOwFTfqnd2EyFZ4/owtHC
 BqGrBekvMylP99DM74FKU+il24oKZMlW1kiNHyilsBfMAyiE5Za++3IxVbgyHVF3WoF2Guy+2h8
 a3fjjx5tyQL/PPbyrcjZOvWNeLfcSFaMTdGQiT3MdNxA5KLb7PWKDLFvNOU3n8XsM5qpRgrs7wk
 n+qeVqRV2UKMD3
X-Received: by 2002:a05:600c:3148:b0:491:9969:739d with SMTP id
 5b1f17b1804b1-492608794f2mr40868705e9.29.1782305132228; 
 Wed, 24 Jun 2026 05:45:32 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944faa8sm361273435e9.13.2026.06.24.05.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:45:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 23CE85F845;
 Wed, 24 Jun 2026 13:45:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/6] target/arm: split evaluation of CNTHCTL timer IRQ masks
Date: Wed, 24 Jun 2026 13:45:22 +0100
Message-ID: <20260624124527.1018912-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624124527.1018912-1-alex.bennee@linaro.org>
References: <20260624124527.1018912-1-alex.bennee@linaro.org>
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

Whether the physical and virtual timer IRQs are masked are independent
of each other so the checking of CNTHCTL:CNTPMASK shouldn't depend of
not changing CNTVMASK.

While unlikely to be seen in real life we should still make sure we
behave correctly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a234aa031c0..3d52cdc4a5e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1802,7 +1802,8 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if ((oldval ^ value) & R_CNTHCTL_CNTVMASK_MASK) {
         gt_update_irq(cpu, GTIMER_VIRT);
-    } else if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
+    }
+    if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
         gt_update_irq(cpu, GTIMER_PHYS);
     }
 }
-- 
2.47.3


