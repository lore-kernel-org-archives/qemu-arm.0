Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48321C44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 10:59:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi8ww-0006Sx-Dj; Fri, 10 Jul 2026 06:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wr-0006Rb-Ai
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:13 -0400
Received: from mail-wm2-x02.google.com ([2a00:1450:4864:31::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wo-0001NB-P8
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:13 -0400
Received: by mail-wm2-x02.google.com with SMTP id
 5b1f17b1804b1-493b9643ab5so1696945e9.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681149; x=1784285949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WgXgLjcNB2sizCIRY4K8oa4Ca9Ff/wTtH9CTjHRjCJM=;
 b=Oj79xJLlznaOtVyBg/ShyzvO8yxEcDxzXPmZQDry3sQElwi05QdvkxreRWWGXUxzDA
 CoyYPnuAmnYkZRbMpcdsM+ClCWKdhbsXYcp34r9eGuAQ8EIPBzEMPsFC5PO82LrcsMYY
 n2jwwBufyqg+PYK7NxxMj7Z6nYcAgGfgJh+/xflhiIXpnFmT3PNjDps4EJJb8Ir7pts4
 sSTpYjn7O+XBXJ/MQgQrpNaTxUmvfx+UcZ1UzMQxR0MLXPdAMzmWsGW8L/n9/f+zd1nE
 e4QCq4ppZiBg06AXv5f3/cwq54ACNXs5F1jLArgFaIkqM4voHsE3EBV3eYwrlU8bJig6
 3A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681149; x=1784285949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WgXgLjcNB2sizCIRY4K8oa4Ca9Ff/wTtH9CTjHRjCJM=;
 b=Ig5SOBLOV/pJQLqrvuncq0dlkhI1qEtoP7Shg6HwEeGFhZieNZqdEkgCNfmrIQkqlj
 VTtb9uoRKidgf6+S5UfeCCQfV8qxOToX2Ry85A52QFSpLbTYrW8GkYHQFXEdGDFn4Til
 zudR8jmQcm03676pWhoyU2zDGtC1PCOoTWBTnV/zdPfFYYsGnxyAzHwBU7aYHukrIu9Y
 WUlUno/tdyoB4+tnfKu5txKu7PrJ4rvyBAqsf6PDDrgvDu4ISpr5HyDlD0FKEVn/wOd8
 YUjLmYvqZ4uM/IpguvzSVZkfGu2ht9zfhtvONdMt5fg7brjZ5TUs2X9r2VQmNwZEV3N0
 qo8w==
X-Gm-Message-State: AOJu0YwyzrPgUbmZ3L6vLjpQuSYpZds4cKBJjZ/TGStullDSU7Cj+jFk
 cbppRgd1aNer+nPuemVD4VajEEbX/+4p4HAQ+o+ns1mash99ZnoMQBbcnQQ8/MPfcTQ8PrL9MRd
 CRkUjALcDESOv
X-Gm-Gg: AfdE7clliF91+dvS99iPbHhr/fQr46VvxXlRR9ZdaVR5hi3faBNKshxpEjZGYRuTK4E
 7ESbQpTBNmK8DDB9gRJ3il3IjZAMqA0IvuNalXvR7+1S6eYEww4cdLajSOrydXAIuLTTUo/zVfZ
 OW/pUl3SbtTwvKaE82n17REwwmaP/Q0rZ/GNXTDiJvr5ATAsJXVeCHaiR/quL9pG5Px2C97cL6a
 CU3kzrzMDpP1+3qRx1gcn1B5lx1Oj6JEh2confsDzyNW0g8KvdeVMcaUgSZ6o528aCYDAD/b5xC
 cS+HrfWfLBTkNZHXYLVud4FP3A/PcGKMiFb80a/0ygO5/YgVoCo/h+evyK9L/RHxOVMrmQ1KJT8
 Ta0x8IwgQuShgsXpZFfnQlrY39Qj1mnIB+29Ee0KPvOQR5jrMYetR6xveqssgH2AgVmJUKoOJ8B
 6hZ9RNhC59HtmFy3GGmo4kBHoCCpLBZuxBYGh5rV1PlvHEZcQZQwums/uCDnQwQ5aW8stf1/7FF
 eMLa9cgofU4wHLYGLhm7Q==
X-Received: by 2002:a05:600c:310f:b0:493:d1e0:a4f1 with SMTP id
 5b1f17b1804b1-493e6c05de0mr98206315e9.0.1783681149018; 
 Fri, 10 Jul 2026 03:59:09 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm51946175e9.1.2026.07.10.03.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 03:59:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 0/9] omap_dma: avoid non-bounds-checked memcopy
Date: Fri, 10 Jul 2026 11:58:58 +0100
Message-ID: <20260710105907.2570621-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::2;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm2-x02.google.com
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

The omap_dma device is the only user of the soc_dma code.  This code
has a fastpath for when DMA transfers are from RAM to RAM.  The
current implementation of this has the caller of
soc_dma_port_add_mem() pass the underlying host address of the RAM
block that the DMA port is connected to (obtained via
memory_region_get_ram_ptr()).  Then the actual transfer function does
a simple memcpy().  This has several problems.
    
Most importantly, no bounds checking is done on the address and size
passed by the guest, so the memcpy source and destination might be
outside the backing host RAM entirely.  Secondly, because the DMA
access is done via this back door, there is no updating of the dirty
region when memory is written this way.

The better way to handle memory-to-memory DMA is to use
physical_memory_map(), because this will tell you if the address/size
you asked for would run off the edge of the RAM block, and it handles
updating dirty bits on write.

There are also various places where the omap_dma code is a bit
cavalier about possible integer overflows if the guest sets a
very high element and frame count for a transfer.

This series fixes both these problems, thus resolving
https://gitlab.com/qemu-project/qemu/-/work_items/3204
In the process it also simplifies the soc_dma code by removing
the unused "FIFO port" handling, so we don't have to check or
update that code.

thanks
-- PMM

Peter Maydell (9):
  hw/dma/soc_dma: Remove soc_dma_port_fifo support
  hw/dma/soc_dma: Simplify soc_dma_ch_update()
  hw/dma/soc_dma: Remove union from memmap_entry_s struct
  hw/dma/omap_dma: Be more careful about overflow in transfer setup
  hw/dma/soc_dma: dma bytes is uint64_t
  hw/dma/soc_dma: Use physical_memory_map() for mem2mem transfers
  hw/dma/soc_dma: Remove unused mem.base, paddr fields
  include/hw/arm/omap_dma.h: Move to include/hw/dma
  MAINTAINERS: Add soc_dma to OMAP section

 MAINTAINERS                       |   2 +
 hw/arm/omap1.c                    |   8 +-
 hw/dma/omap_dma.c                 |  37 +++---
 hw/dma/soc_dma.c                  | 196 ++++++++++--------------------
 include/hw/{arm => dma}/soc_dma.h |  33 ++---
 5 files changed, 97 insertions(+), 179 deletions(-)
 rename include/hw/{arm => dma}/soc_dma.h (70%)

-- 
2.43.0


