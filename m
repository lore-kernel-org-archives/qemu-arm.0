Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12750EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKI-0001Oc-IL; Mon, 23 Feb 2026 12:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKG-0001N1-TV
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKF-00006W-CO
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4834826e555so44529075e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866146; x=1772470946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eG7OK00yaSbdKOgQYurB1+UoGEZISqkbJe1azzpynuk=;
 b=XCbJIREdifcX9r5hWOoB373TZ7ktgJAnuIexGVnHVcP0U3v/KFOzwQXZYDbi6HPqsZ
 6E+9hzcGRGWJ1Ng8Al2e6tAj7jYmPhONKop4ujfSvVfjw0IMriYOzHYlp0Alo1nLN2kM
 +JlCz3U6mG2JcjsQNBJc1BVXDsDNIOZX0aPxDGrSMYFsAwuiiHGrriwS1Wm9+FONRwl6
 aTFoayPVFNddgw+o28xGdFX5T2BRlNC2/rrHueC8mwt0dDmf+6kAoVLabJSmJsUyXrOp
 8MRByTAqkkNgXnkx6HbcqvVEEYP8AKvuRPUvXCJhHbTtSET95Qib2IpmWuSfssNQ8EZm
 VCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866146; x=1772470946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eG7OK00yaSbdKOgQYurB1+UoGEZISqkbJe1azzpynuk=;
 b=DOw+SiUh+n21wr/W5QPgdhoIKr7A9mb2rn0pFE9Hi5sNpB8wjbvrerNiXhcg8xE8E1
 5Kq395bco2CTP+GNwrDiaW6rg+UmbXFW2YOcXnE94ewN+DabLpyFB2wjLT7lav7jsVOe
 wjhuQcIJHZlH5u6dxNfVTCcOOzlmbq5LnSnreWg9CjEmQior/5BwsaOZ5pfpxTx1wRzq
 4Oih10jWFNl7bkDBigGg94AkAd+KVrnXCLfEmsF+vW1XkTmPIspL+RHCCZAOhF2+q8wI
 5JGo6zsHcdgptuOZcRxp5UzjUblHNqcjox1w7oxSru28eNQUYhgu0y0Ma5dkXiqziTDj
 01/Q==
X-Gm-Message-State: AOJu0YwpQD0lLfei4hSR07P0k0jwYBOwQDuCqfiK3GYtUAA4qULp5v7U
 fzs739JnEAG+q9jNOCSaBw8ug4oPQE5/Qwynsa4clv1c6MBvvL4O6WZfqcCUFLHjBWrlOtFqZnH
 a9Ufw
X-Gm-Gg: AZuq6aIVjb3X82tbb62thxflXx8DsAQO0BjewDgHxXgJtceuMkyzpHm44+XFljyqqTx
 z8gVNsHzevwVeU96x+MACEnQjzZMaHG+l9Op24ZUBVtsxY+BPOLJF1RqdgF3+eQY/cTecpIYTQ6
 hwvHDKptHuMEGYggkJZzFCCKyzsfARXfjGBriv9s8gAUca0LJawYYRgS1oR/2SmeLN82wlEkxsh
 pgg4Da1eRIBW1Ux7f5w1Ytta+8DUrk5FVKANeSsgPpx7QLirtAuWVPVNOi2465p8+4S8FGX1Weq
 j/4S62gtIhQpyZqNDbJ0t5J/gvpYAQInVh/d+6YauFn3y6LyOR/9av3qXWDrFb4E2Sw9ABIrhb2
 39o/u4oEy+of1kEp0aVO4Fp7LYcwY9UMkDOG3PL/OxHW1PE+xVx3k3FYHbhlSHtvZaYJMQ3cieR
 +DiEpKoFMTs/oWcTgMMW/scH024hTvf4ik0gTcA3pR40NkzgkvKlUPZRe0v6thoYoHdFvoOX7Gu
 MqTu/gTdW7inT/WODgM66EOaYqLKjY=
X-Received: by 2002:a05:600c:c104:b0:47d:264e:b35a with SMTP id
 5b1f17b1804b1-483a96076a5mr126421315e9.13.1771866145874; 
 Mon, 23 Feb 2026 09:02:25 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/65] hw/intc/arm_gicv5: Add link property for MemoryRegion
 for DMA
Date: Mon, 23 Feb 2026 17:01:17 +0000
Message-ID: <20260223170212.441276-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The GICv5 IRS keeps data structures in system memory.  (Notably, it
stores per-interrupt configuration information like the interrupt
priority and its active and pending state in an in-memory data
structure.) Add a link property so that the board or SoC can wire up
a MemoryRegion that we will do DMA to.  We name this property
"sysmem" to match the GICv3's equivalent property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5_common.c         | 8 ++++++++
 include/hw/intc/arm_gicv5_common.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 0f966dfd1b..274d8cd255 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -122,6 +122,12 @@ static void gicv5_common_realize(DeviceState *dev, Error **errp)
                    cs->spi_base, cs->spi_irs_range, cs->spi_range);
         return;
     }
+    if (!cs->dma) {
+        error_setg(errp, "sysmem link property not set");
+        return;
+    }
+
+    address_space_init(&cs->dma_as, cs->dma, "gicv5-sysmem");
 
     trace_gicv5_common_realize(cs->irsid, cs->num_cpus,
                                cs->spi_base, cs->spi_irs_range, cs->spi_range);
@@ -137,6 +143,8 @@ static const Property arm_gicv5_common_properties[] = {
     DEFINE_PROP_UINT32("spi-base", GICv5Common, spi_base, 0),
     DEFINE_PROP_UINT32("spi-irs-range", GICv5Common, spi_irs_range,
                        GICV5_SPI_IRS_RANGE_NOT_SET),
+    DEFINE_PROP_LINK("sysmem", GICv5Common, dma, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
 };
 
 static void gicv5_common_class_init(ObjectClass *oc, const void *data)
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index bcf7cd4239..3bffa2cb1d 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -83,6 +83,10 @@ struct GICv5Common {
     uint32_t num_cpu_iaffids;
     uint32_t *cpu_iaffids;
 
+    /* MemoryRegion and AS to DMA to/from for in-memory data structures */
+    MemoryRegion *dma;
+    AddressSpace dma_as;
+
     uint32_t irsid;
     uint32_t spi_base;
     uint32_t spi_irs_range;
-- 
2.43.0


