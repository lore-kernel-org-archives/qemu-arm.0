Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF592C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 11:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi8x3-0006c2-St; Fri, 10 Jul 2026 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8x0-0006XE-94
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wx-0001QA-VA
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so4957505e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681158; x=1784285958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Dl9JxJv011eBVmZsRV56sHww0Wol1xI1ADK7rHs3if8=;
 b=zmkA/jhgXr/R+BngiIX+c2kBwGfp99YtdNLRWH7kVkK6v0hTCHV+H5KoZmvORgSbS/
 NDqo5vRuzuz7NLRLdgiC6tLJSlTFkmgCnTK+BC8bw9uka9DJ4TLbuZTWqdNUJUkL8ahW
 qPc65AbqgeLH9J201/9KKSvWzdneRQlHl/qlNFrNVuI7gWWnSvS0wkkRtG4LUWtIhZPQ
 8YgJWuYKIF56x2uwYFDhkNH3Ys0j/1TqLw8+X3ig1AA9SV97LBW2Za33IK4ygJB8ZVqQ
 +Imh4XJ1Gs0EsiAvROfZTTDCgx1r/WJV+yoCSKJICtxEbdZZiVD6VUFiuScO6tF5shJP
 C3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681158; x=1784285958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Dl9JxJv011eBVmZsRV56sHww0Wol1xI1ADK7rHs3if8=;
 b=tSKWlBjIB2OJTcZQKScCdg3g9wHxUC0rXw2aXaqKGnDnh0W2KjlUZJnw5pzVJxq5Su
 cP0yXAX1Y2yZoBntZ4KRjDKjcqvW76R6a542XGs1kzfgXVMupEvKQJk2JHMzi4VPSZP1
 cpqA08spZGH6HLaMOB0QP5ZSGVozJNaY52/gEBARFwFeAewy0AAWGvcJeEufaMwgHbDb
 RX88babglf2am7Zh8hhdiDaZHlTOe5ftB/4mr9Un+u0BkkXAJ1EMyLCy7Ak0+3n99ant
 O212Irz5sqvXBxhu/p3cIGwsAZfGapze+ONxQuxF+lykJRNVychqmycC5vzikwzh9ItA
 Yb6A==
X-Gm-Message-State: AOJu0YwZ8Cqvsq4N0mcjt0w4jxH5EQZrrjmxnph4EAlbxQLUKfCWnnI6
 0EvZRG7kOigB3ydPAWLflD6o/3wQMxkD7Dp4MzNrO78cPk4fIp7zLFULNU2YtBkxRsMnOItb/OA
 R6trzyyy2OQ==
X-Gm-Gg: AfdE7cnRGEUcECxbL0sGI5JH1JUw4SsrRNBIXJUrhQbnkYtpXn7pWZiPcUYwGHekbeF
 c0+2j86zgkjn76Bt4QvLF0jwDqBM9sAdrjO16DLVTRuESyg4cGXIILUQDPqOogTtnEWVKf+Z7Xa
 WADVTYLqi1El5i5bQorpDPODoJIqTuX839H7GMkEK3A+g0lHGU4he3GK0/oiQfPlmwZ52YDENcR
 6CuHS+cuMteA8FqWDa9u/ltkotZ7UzxMmTUfAW6aKnHfO6eb3QVgrx2AEkAdRok18rbtzY1xW3x
 SERGeNLRG0EJ9SpLJXH2vc1Kab4twvnBbpl0pgIHSw0zfBhx52TGlsec+YF1DPvap1yh1n4Mr4b
 QFGW68IeuM2zUHq0Su/dT2nSfpzCR6O4sz34XPbriRNAyIMcd3/RRUbFQlbVZB4LyIBkZHYwgfU
 MpcRIPgy4yrjo0MM+vH7hB9FboTUI5i+j1rE9evyCn541uV/1Ywhcx1/vyujneqt+FQ41zew+ZT
 o2OhWL4fXjCEyleSaS14w==
X-Received: by 2002:a05:600c:3515:b0:493:bc92:2a2f with SMTP id
 5b1f17b1804b1-493e6894936mr114992955e9.1.1783681158336; 
 Fri, 10 Jul 2026 03:59:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm51946175e9.1.2026.07.10.03.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 03:59:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 9/9] MAINTAINERS: Add soc_dma to OMAP section
Date: Fri, 10 Jul 2026 11:59:07 +0100
Message-ID: <20260710105907.2570621-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710105907.2570621-1-peter.maydell@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

The hw/dma/soc_dma.c code appears to have been written with the idea
that it abstracts out DMA transfer operations from the details of a
particular DMA controller device.  In practice, it's used only by the
omap_dma code and I would not today recommend trying to use it in any
new DMA device.  Add the files to the OMAP section of MAINTAINERS so
that patches can be cc'd to the appropriate places.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6171cc7494..bf1ef71f24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2201,7 +2201,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/*/omap*
+F: hw/dma/soc_dma.c
 F: include/hw/arm/omap.h
+F: include/hw/dma/soc_dma.h
 F: docs/system/arm/sx1.rst
 F: tests/functional/arm/test_sx1.py
 
-- 
2.43.0


