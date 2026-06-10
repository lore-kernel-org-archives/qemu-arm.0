Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DB8CD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 20:44:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXPls-0005oj-Nm; Wed, 10 Jun 2026 16:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlp-0005kx-8w
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlm-0003ku-Ux
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so59694155e9.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781124205; x=1781729005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjVdjpfOdad/VHaFqOII69qjP1mCIpEc8kf1f/xpvbs=;
 b=fsqwzxMlTzoygIm/FxNDijG4xGiN1A+EYV4RaCWFBKolRhkjVdqU0qur5kie5fNZ8r
 35JgqMYCOciPyJ0J9v1wF3utedZWs86GuTWcrx+cr5rpTrPhfG//xgrOxVoc4MwsurcQ
 sgQ52EcZjNYJV2tiKL0EB511s2wvjoYKSiIt46iw4txzSsoz8VzivXnWSGb8LGVyEme1
 XlQeUO1tQkosewIBlXaUsjgk4YfirR4dAtHitu4wfXcUhRw3mo3WB6LUD1cKgRe1fOxD
 idKpCMViaQlVBoZB8OkwTmBfo5OTHMVSD6kEsJxdsprJne2gkIw0avGgnNMkhh/HrceK
 JeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124205; x=1781729005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BjVdjpfOdad/VHaFqOII69qjP1mCIpEc8kf1f/xpvbs=;
 b=tDEaThG3Cc5FaM9hV/ww+kb4FDVEaR/Uhs/B171TixF3lD8h4PUJBC4EEcIXB9VFIl
 ajnovyJiejygRiywo2A85FZJFA29wZ6P4YniSRhjaHDPUjHSyoI+j4xCpdNp+dTDqn9t
 4svQJot2GDk3L4uh96wkhb9YC6IF6EoY1zv7QaGoMFSkPp8G2eaS6ymRTAQBpcT5JiYl
 6p8e3NKxPXmm6RYZ2AFUrquVe68vtyK/b4Q85dceCitTISBzPV+qYfQZeTb8dZFyA7Yn
 R69PHwxmj1dGEPL6I08xxJnJGwnst1EB2gIY12mbONXvRpRG2KxTXfuFNsIGzYFxlH8L
 HqQA==
X-Gm-Message-State: AOJu0Ywls+71Eg/6qjsJOhh78hCDFM+oWW6wi4fiKEHxld8SGdYYEnct
 0NxYMQfswd/QzIvvp1WpX5xJeNHKjPW26vOQ61uytX+CXXXYojj043iAJ7v+dIN4690=
X-Gm-Gg: Acq92OFKy5mfhHQZj9pK2BAr6I46+YDAKfH7yt29JfuNYJz9QpUdSa4wGL+49BVXxPF
 0kuIKmvDIYZ3UX5tWVaHW9pHJ/XvjgG7ylM61VVA5UblowVmaKfahTPDIAFk9DQ62kvJLbhl50L
 qO2pBv3Zwrt6EAzhnv73jowADVdUcsCZiLmash/tmMv5zJQLpLFJ5Dfa6bcK3kwX6HH5X/9LSXQ
 QODXsGphT44P5iRUfyYXT3GTNmb7YIKnDUWms+kcwUzWap4G/670FS5K0c4JKCgZvljvxWXfMkg
 pC8ElNb0umOVt1mLt1EIyohXtKWn23Ol/njf+vsW00g8nheHIv3vlorsXxHexcx22DC7nHiaw9R
 hRMwFxAq5GvjiLmalau/D8k3S4lCQtf/H2i7AKsErIDDXe3OKOe4RpFp8dqsaurTxi+EUp4UVIk
 5251nulePfviDlo2JbqvF3TICrojcsO/F5P3+KjYflZuWI
X-Received: by 2002:a05:600c:c0d3:b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-490c265c148mr302919585e9.33.1781124204639; 
 Wed, 10 Jun 2026 13:43:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm72388472f8f.12.2026.06.10.13.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 370555FA43;
 Wed, 10 Jun 2026 21:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/6] target/arm: trigger timer recalculation when toggling
 CNTHCTL:ECV
Date: Wed, 10 Jun 2026 21:43:18 +0100
Message-ID: <20260610204322.828645-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610204322.828645-1-alex.bennee@linaro.org>
References: <20260610204322.828645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

When toggling the state of ECV we affect the offset applied to timers.
As a result we should trigger a recalculation of the timer value to
take into account the new offset.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


