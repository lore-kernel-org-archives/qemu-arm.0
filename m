Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B32BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 11:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi8x1-0006a9-KD; Fri, 10 Jul 2026 06:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wv-0006Sv-Fv
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wt-0001Oi-O3
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso7217625e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681154; x=1784285954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q4Zq1gOCVbComkFhvXEvZvtbK0wUtEYI9Jqh3pC5jWQ=;
 b=QwJyHb0L7Nu2UOj+4YxK6WRBgwf7LzPUVqNAZA+zGunmluv1sFVOQav4f0vmgHeypg
 X0KAyIUopQfv6lYBc/cTBJ3ZdAVyYXS0+uXZKfZ98lQyke5GSMN4VvjQVm1JFstunwGw
 qGuu9tLHByC093OFF5MyzEUiJ4/8zDpV15SJl3jnmmUIF+qcmbYyaUClQi4d3Y/aLzWN
 bsKppw6xB/KCbuMz5Z2Eavi6JNShX2zPRgs7n7EJLbfuR6ODGlcMvwE62ZGvdnZwUIf3
 CayUSsilo17g3gWdbJvWuu8id61gG9Ff/lSe7HCtrVX4voOm604eD4PT5DOAHOnhWMxV
 Czvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681154; x=1784285954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q4Zq1gOCVbComkFhvXEvZvtbK0wUtEYI9Jqh3pC5jWQ=;
 b=QCFdOtd0i0I2UTce+YzzBumaO2g6etoPImzSvgxf3tsnbNhrGAYwrRuRAgMO69v1o2
 byMmflZVXzZ9msbCp48R7EbZLCPEIvrJBAs91SYW7P3BxhQQwCEutERY1CDqIrfJqgew
 rW2LNjW6uFVV8LY0IE4mMuRagA8aKJnk+d07oHxq0Su64DCpDDSWxwCwUm/Fr3dYnnDg
 wmBnfmwQmzveSfhYjcx9OMfRVzM2BI/h6BiZHmwnmwdrEYUiQKPhpZRrWSRleNb2z7zB
 8GuONkRzZi041hy10lJiCnALu6X6aBwNpEfFOIlI0izCdYc6Bkxw+pWi5t+bPiTxrVhG
 wUtw==
X-Gm-Message-State: AOJu0YyQAeVnWlS/3ZEzIjZ+wgEYEpD380neBCsJWlZWEXAlME4LPGkn
 pGJdyApBJNa3m0dD7/Y/sPmSh37lsGugDBYxM114uXZNpQDjdbIORM2GRplvxIL82nrC//TmBAo
 FFjq2D2HyiA==
X-Gm-Gg: AfdE7ckQrgIym/CmFZLYFP4G11JLf7z6uMA2ZYR8A+bKZmTi97La3DhzTHOX3bCI/1T
 U1u/ygG6FGvCKYthjgEwzyjWwjUkpb8O+Hi7RXXpx5uAa4LR8yrB+w3ngyr2k/cOWMC7J3I3dNk
 hDpXkwEj3BaIMdik31Wo5r0IhB0TYw1MKmL4wM/yWttGNFp9k5vhPFGhr9kWttmEJL/J9iSRInC
 Db7mtsWUFJ9vwMARupnBfFcd1HlNB78k2bwZVF0B1hNhO2nYdwop785Fh9jrLBjyIxzBg3I6ZBo
 +zbKUvyi4oazzqzevOLb+f1vlzoRDoavxvqMOlleCgd6w+SHEJ4d8gakHodGl04w/zD1NBMp9QM
 6RLSkufGHxpifqk3iIwU1KQs+5Ovb16B0/ZjZXUqp9S5o2/CfGy2DRGXqOwYG81eXU2bx0vnZqe
 X4VDAWofLwyLAKYZmK9kBVCRflLAdW/gzxsJYAf7X2gEIL4GewJF7vSLx1Bk9CjPD3Lirk4YCSJ
 CerIt07SIdgmTux9+Uj9A==
X-Received: by 2002:a05:600c:8284:b0:493:b243:8ffc with SMTP id
 5b1f17b1804b1-493e68ec789mr111497745e9.35.1783681154261; 
 Fri, 10 Jul 2026 03:59:14 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm51946175e9.1.2026.07.10.03.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 03:59:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 5/9] hw/dma/soc_dma: dma bytes is uint64_t
Date: Fri, 10 Jul 2026 11:59:03 +0100
Message-ID: <20260710105907.2570621-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710105907.2570621-1-peter.maydell@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The worst case number of DMA bytes that omap_dma will ask us to
transfer is 0xffff * 0xffff * 4 == 0x3fff80004, which is slightly
larger than fits into a uint32_t.  Move the byte count to uint64_t,
and adjust code that passes it around to also use uint64_t.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/soc_dma.c         | 6 +++++-
 include/hw/arm/soc_dma.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index bbcd2bdcd5..1b93aaf565 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -49,11 +49,15 @@ struct dma_s {
     struct soc_dma_ch_s ch[];
 };
 
-static void soc_dma_ch_schedule(struct soc_dma_ch_s *ch, int delay_bytes)
+static void soc_dma_ch_schedule(struct soc_dma_ch_s *ch, uint64_t delay_bytes)
 {
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     struct dma_s *dma = (struct dma_s *) ch->dma;
 
+    /*
+     * Worst case delay bytes is only slightly larger than fits into
+     * a 32-bit integer, so this won't overflow.
+     */
     timer_mod(ch->timer, now + delay_bytes / dma->channel_freq);
 }
 
diff --git a/include/hw/arm/soc_dma.h b/include/hw/arm/soc_dma.h
index e1d75bb3ba..b5ad9743be 100644
--- a/include/hw/arm/soc_dma.h
+++ b/include/hw/arm/soc_dma.h
@@ -49,7 +49,7 @@ struct soc_dma_ch_s {
     int update;
 
     /* This should be set by dma->setup_fn().  */
-    int bytes;
+    uint64_t bytes;
     /* Initialised by the DMA module, call soc_dma_ch_update after writing.  */
     enum soc_dma_access_type type[2];
     hwaddr vaddr[2];    /* Updated by .transfer_fn().  */
-- 
2.43.0


