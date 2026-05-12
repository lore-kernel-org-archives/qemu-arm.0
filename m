Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A65CD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:34:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoP-0002SD-Rp; Tue, 12 May 2026 16:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoC-0002Mz-FQ
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMto5-0002LW-Sf
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488d2079582so62955375e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618058; x=1779222858; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=k1CltLWlpdRqeDsjwrhIyIZ+xlr45GHnVpmLg3jQEr8=;
 b=s3QFwdigzZzlDPENCG40wRnLXqUVQTWQk28crx7UBkTe57tFSSpC0iN7f8xzCPceX9
 47K+wOVs6w9eHe9prfrPp5oE0eNFkpBcQxFgk2nDKQjv5xJ5NXrlWiTw1NG40ZtJFZB0
 nqe6QcHj9AXL6ngK2Ha5JsjnszDUUklKHuY5MamgqHLyZbKVTbgPQDL+5JUP87K698EB
 esxC2ktpDydgHBaJkyHbp+3m5Q6Vt4/9O1DyzCvh0TX0KTfyzgUt6hG2MlqUznupr0HF
 JjyydaFkFeT4dMlZJ59Y1WrGsMaQOkIlrJyzV9/dTq0Or6t+7HEbtmcl2xab3YP4s+OZ
 kPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618058; x=1779222858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k1CltLWlpdRqeDsjwrhIyIZ+xlr45GHnVpmLg3jQEr8=;
 b=cFip5Yk/V+yp9N3jyTkd4m3IsSOcKpd6ImHfRjT/wIqP1v1D9nqejAzJR9oHsw8TyZ
 VkQFzp/4+8s22wtLm/K/Te7RVyjEyNj8u10VFB6E2mBlclcJLxvWmzfSrzPrxgMp8WDu
 BQH5L05s3JBnIEMt5WzAeOXXEoumvcjqJAuBLZOG5zbi1UPK8l+AoWsaOrCadTyNTrkx
 5bpezPkx9T4r70EIUR3nkpzyYZbZ7NlSwqSL1x3RIht6PBeU0eiWdn6p6K7FmlLYVvnI
 Z7SD2EPuoT7Q3HagmLjwsmKT6CiqAoYkYPQWtyHKdXMwzc+PSF5vziG94hB3NRwSMUu1
 3z4g==
X-Gm-Message-State: AOJu0YykIaLsorhBz+4br0gNjLzznE8mQo2wNEAF41ykwjFrYEPxAH7T
 pICDeu/Kn55TmkwpRHs+jI82U/wN1lfWmc8NJqH0JysfUCNGIewTc2Le0AqVAZovfOiUD7tD+s9
 eXdUI
X-Gm-Gg: Acq92OFGxqPbwkgwDr6ooSxRE7ax48ZrtdYlM6AumLZgXfezdl9ySxBJBlEEwAgb4Sx
 /T3FjBFOTszVh1CfxXRtMtRtDvgw/mjaKX8/A22bbMiWBd9ZvYsFNX0XTX+XlGZe2aFJcFs255H
 K79s4RH+zCm/XyOndLjaWwC25hYG4YmXGyZEnQL9QgN5ZKiQe4JBEDjYTDA0Z/z5EZXUowQh9xN
 8Z3paqnSgHfj/yc+L/mHMgirEXjcjkhruOKyIOBXXu0wgY5zys4v7ux76siXzX05CWFbNk+mSoE
 t74Kl9o8VRCyMq+sBSRWaDvXhpGbV7THzjd2xqYr63e9Stkt5vaHUyCioNdK5CL5d92XZloKPse
 xupU3d9K7XEGyYODLUjK9coeR5b1fHOhQldijR6GX2kOcZwvzX6PtSg6DZZG1kn7SLqFiFMKpDV
 d+hJJ/mVUjjpdZfR9hsJx1bUFCvrNqrMzOC5v3vXwS8asEx8OVxJJGhndEtzwm3PxmrewjsafMx
 jW3ZczikIhLhp/ygjd7glDHJA+oz/Rh+yiBn0BfdQ==
X-Received: by 2002:a05:600c:4689:b0:489:e696:836f with SMTP id
 5b1f17b1804b1-48fc9a0f84cmr5786085e9.10.1778618058054; 
 Tue, 12 May 2026 13:34:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/12] arm: OMAP: Remove some dead code
Date: Tue, 12 May 2026 21:34:02 +0100
Message-ID: <20260512203414.3633237-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The arm OMAP SoC code still has some remnants of support for other
SoCs in the family that we used to implement, and bits that were
there for features that were never implemented and we're hardly
likely to implement now.  This patchset removes some of that dead
code.  (I noticed this because I was looking at the hw_error() calls
and realized they were all in code that was dead or otherwise not
needed any more. Then I realized there was actually quite a lot
of dead code here...)

The OMAP code is still old and crufty, but at least this is
900 lines worth of it that we can just delete without even
having to think about updating it :-)

thanks
-- PMM

Peter Maydell (12):
  hw/arm/omap: Remove omap_mpu_model remnants
  hw/arm/omap: Remove unused omap_mpuio functions
  hw/arm/omap: Remove stray unused prototype
  hw/arm/omap: Remove unused omap1_dma_irq_map[] entries
  hw/arm/omap: Delete unused #defines
  hw/arm/omap: Remove unused wakeup irq
  hw/dma/omap_dma: Remove support for dma_3_0 and dma_3_2
  hw/dma/omap_dma: Fold omap_dma_sys_read() and omap_dma_sys_write()
    into callers
  hw/dma/omap_dma: Remove omap_3_1_compatible_disable flag
  hw/dma/omap_dma: Remove 3.1 mapping handling
  hw/dma/omap_dma: Remove unused ifdeffed out code
  hw/dma/omap_dma: Drop model argument to omap_dma_init()

 hw/arm/omap1.c        |  84 +-----
 hw/dma/omap_dma.c     | 666 ++++--------------------------------------
 hw/gpio/omap_gpio.c   |   6 -
 hw/misc/omap_clk.c    |   9 +-
 include/hw/arm/omap.h | 252 +---------------
 5 files changed, 65 insertions(+), 952 deletions(-)

-- 
2.43.0


