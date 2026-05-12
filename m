Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A895CD343F
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoV-0002X4-Dr; Tue, 12 May 2026 16:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoQ-0002St-Nc
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoM-0002UB-TX
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:42 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso55146525e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618070; x=1779222870; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q0ezEWD89kSd2U78SG8CWQUtQB+DX/bs8Y9jX+srHFU=;
 b=tnOS/vfvf87wPFJcPfIPiK2RjAKLf+/PoJTLoywxCXap2occindC+xjE6iThXbZeUp
 TP6uR1yWwvxToJjCD/xmViCTd8eurNVJWQAdoBvg1mXuIhliwT+G6y6KGlZauRYX8t+k
 /AyYXOq+LoYpgwJhg/w+TLe/D4isqUgqsug2VNedphGcMy6kNkA58UbUUA60FNdjP+4v
 MHSGIv91YY3pCgNAe9RN6gIlhQ/TdbA1bhUjy/PfZhxbdIz9rPTyFTxIzc4iViGItLd6
 iq92fbeznWPgsdFBunb8Jp4fjgqbhN1w8JB12UGPRvpCcf7bIbME2Ur+Dd146rTFWtRb
 W9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618070; x=1779222870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q0ezEWD89kSd2U78SG8CWQUtQB+DX/bs8Y9jX+srHFU=;
 b=SPQngjE8AHBT5rmS3F0s18FTF66pZp1YVfeSE1OlEP9oAnky41asH23VUx2uT6WU34
 uGxvCGRXdO2lb+V4zaZmppQ/p1IxOMCHx81iJKiWzwDhBR8v7Qa0ljmmmkKkq+TRXlxJ
 RRIb5WnjYZHNm0glPVs2PPvIsST47TKHmZ2pR8LUpIRvaPRtCMlZEeDH41TAb3QtlZ3v
 glXZH5W8FP0x8oWf/nGokXi7hiE/wJXnBJzC949jNF4fq87QGwrsk930n5SGZdr66L5z
 tApoWbQO/JmpOIcWYa5DJdTu78G9wYmpKXJ+X0m1ZJb90PnlC2V4dT6CHUnP5Bz7iGxp
 7+bA==
X-Gm-Message-State: AOJu0YyTM2JtZsoHSisKo5vcJgPsQ8YrY5sH+9gxIAkEDcwwELAO5Wyi
 ETtqkNKAlpeRFsmjlINRln0uL8Ub42FkmeHSOoisa74UcMYFzyK+2Fiobc8bIFKYEJGAZzbmaoQ
 p+dVO
X-Gm-Gg: Acq92OH993KmIqooyqLcOB8pLBE6cjR2tK2/pcagDfIXxd4poPO/Ly0NI43SebvhPC7
 jBB9sRugFoEEC5JsoIRvPXIBjU/0DeLnMhaq51FX3eaXW009swejxIHtLKigplh1AzLmaPS24Km
 3DHif5w2lC8N9vmVy3NOUOxGi+cM+ndi6TEb2YARju+wWybg+oHC0YIbJ+X5eO24ntjh5yO3SPC
 2sp8goGAmAa4NXGvds+ayb96bwPZrKZItmAsqcr2GvgmnTNGVxdjPM2JI4MhnaQH/LORoEcFqQ7
 j2W2CaeuA2bHGv9orV+jer7CHlkzouHLhqcpJglR1AC+BLGZP0/RtxF4HaPlyYBn1Brf7cPtIq9
 3ot1MRsdAayHco9ovupbytMZGOrBQigwQ3fYo3/G3jZ0ZHZyXpK/TvffO5twJmq4tKnXgqaWCpU
 R6ECKkwX4kN+DjeTpqHFHiQDGThvGjTFcBo2oq8hATgM97JKEzwwd1zkFntrArIdMYxScTmkmTF
 NaQ7i2/ZGd8Wq4B5v3Xop/V4IkMzJ1iTWdLtW5V8w==
X-Received: by 2002:a05:600c:190f:b0:486:fbd1:9dc0 with SMTP id
 5b1f17b1804b1-48fc9a44021mr5170825e9.22.1778618070342; 
 Tue, 12 May 2026 13:34:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/12] hw/dma/omap_dma: Drop model argument to omap_dma_init()
Date: Tue, 12 May 2026 21:34:14 +0100
Message-ID: <20260512203414.3633237-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The model argument to omap_dma_init() is always omap_dma_3_1, and all
we do with it now is assert this; drop the argument and the enum.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c        |  2 +-
 hw/dma/omap_dma.c     |  8 +++-----
 include/hw/arm/omap.h | 12 +++---------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 80168644ce..44f9dd67c3 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3789,7 +3789,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *dram,
     }
     s->dma = omap_dma_init(0xfffed800, dma_irqs, system_memory,
                            qdev_get_gpio_in(s->ih[0], OMAP_INT_DMA_LCD),
-                           s, omap_findclk(s, "dma_ck"), omap_dma_3_1);
+                           s, omap_findclk(s, "dma_ck"));
 
     s->port[emiff    ].addr_valid = omap_validate_emiff_addr;
     s->port[emifs    ].addr_valid = omap_validate_emifs_addr;
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index dea251afbc..a93d9ad196 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -1075,15 +1075,13 @@ static void omap_dma_clk_update(void *opaque, int line, int on)
 }
 
 struct soc_dma_s *omap_dma_init(hwaddr base, qemu_irq *irqs,
-                MemoryRegion *sysmem,
-                qemu_irq lcd_irq, struct omap_mpu_state_s *mpu, omap_clk clk,
-                enum omap_dma_model model)
+                                MemoryRegion *sysmem,
+                                qemu_irq lcd_irq,
+                                struct omap_mpu_state_s *mpu, omap_clk clk)
 {
     int num_irqs, memsize, i;
     struct omap_dma_s *s = g_new0(struct omap_dma_s, 1);
 
-    assert(model == omap_dma_3_1);
-
     num_irqs = 6;
     memsize = 0x800;
     s->mpu = mpu;
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 36569815e8..2675d064f2 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -172,17 +172,11 @@ void omap_gpio_set_clk(Omap1GpioState *gpio, omap_clk clk);
 #define OMAP_INT_310_McBSP2RX_OF       31
 
 /* omap_dma.c */
-enum omap_dma_model {
-    omap_dma_3_0,
-    omap_dma_3_1,
-    omap_dma_3_2,
-};
-
 struct soc_dma_s;
 struct soc_dma_s *omap_dma_init(hwaddr base, qemu_irq *irqs,
-                MemoryRegion *sysmem,
-                qemu_irq lcd_irq, struct omap_mpu_state_s *mpu, omap_clk clk,
-                enum omap_dma_model model);
+                                MemoryRegion *sysmem,
+                                qemu_irq lcd_irq,
+                                struct omap_mpu_state_s *mpu, omap_clk clk);
 void omap_dma_reset(struct soc_dma_s *s);
 
 struct dma_irq_map {
-- 
2.43.0


