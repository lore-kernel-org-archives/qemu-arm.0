Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2385920ejb;
        Sun, 3 Dec 2023 16:28:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdIZHo9Y4WrsY/ohoLOOzeV42NE/QztFzu4d9lSLB9OymcWNul9J4JbctWqFoIDI8Fw38v
X-Received: by 2002:a05:6214:29c3:b0:67a:8e2d:6092 with SMTP id gh3-20020a05621429c300b0067a8e2d6092mr3764868qvb.4.1701649729073;
        Sun, 03 Dec 2023 16:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649729; cv=none;
        d=google.com; s=arc-20160816;
        b=MC71dYc/HmfGOVJepQpE9N8wd0UHNSEuQVCG3OFePTikMbm7tXZOwbg0S9DgSmKjO8
         ULfOFpamPvd/Mgmcc3J35oyh7v9T2/ENcJzxjQFRR7xs2j92NUKttyc7tmsfelypFfF8
         Zyra0myGkvpU8h2sV2XZOFw2Q0O4d0zO/xImFC3e28xboy+I5TIisVxCVslSB4c5qTUm
         wYZ+aUcsx1H1EP71KQlFUEXZlOAx4wL+UxEZv+L8cBlBOfK2wKqpfks1D6XoOrnu1Kwg
         rC0b45fb1DRRwAOgiiY9J7dINFzSgWJZ+TJzpjwqwyUdVV7UKY3nLvyWQXT8EkfW20Ua
         eimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=jQk9TsUC9FaSslgrgeYYpdM+XeXFXJNEtlBFd/lg9M3jqtonn7cn6wceDzxewG3baC
         hQrBRecy37j4+nwOfB5JCfgtAnsSoqxc0w3UAPmMjzuZHDhKkAjcy2QHM7gIDQ03oglC
         V9dF0V1SfsCq7OWtFesbHphbpZguoP5Yb82IeugTx5y5Qq3SdCHALMuCmxcTIyf1kr46
         WVvxH+Q27kM9DT/3beJEbPZuukNuvhK1Za5b7HQ2X02lFT5QodMzCAk/Y+eH4bDiMHtg
         B9t4JXpRd7hZnM5FCw4YTczLbLR0NdvaQwNQhJ9Bsd2DdItKTxhg8Lmsy7JY/At2pFcm
         KmIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwYNWgwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020a0cbe8c000000b0067a15482c88si8324350qvi.304.2023.12.03.16.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwYNWgwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9wnq-0004rG-Od; Sun, 03 Dec 2023 19:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnY-0004Yq-OH; Sun, 03 Dec 2023 19:27:02 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnK-00008q-9r; Sun, 03 Dec 2023 19:26:56 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d226f51f71so42970967b3.3; 
 Sun, 03 Dec 2023 16:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649600; x=1702254400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
 b=kwYNWgwTvHTXnHdHrD0zlK8OpqKkiV6oG3EK+fDtdd8FPzlj6CyTjvAL0vy1WG3w16
 bAZiIoEJOUNdwj5c2rBBqSg1nSxhjKpXezbrqjJ7HyW62EQngPpO2Zemw2DHxn6YiM+a
 OaGFHZwBz5CQroo+AXI1x8WR9JCbErXcySiwCdM7St49xAqLfMcRw+rW9wE1aPnX8pDo
 9tpaMeTTMxoWLebJIiHhvyAoKvyfdG7dIm9v2PQ5zdFzL7hJiCLgqODrGbzOoWC8pHrM
 6bC9v+boM/5FCDMqygIfsnlK43iyPUz524g16pJefzdw+rsJA9gzfqLhYvrsYFxrqbV+
 DpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649600; x=1702254400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
 b=JD0qxiNtzbJA7s54Mg9hSK2+58Gp84nM8d1+fwts7CeXCsh1Eu1WZRj+g4+zbwExNz
 LPsLe03+GAihjzv8yZneqF2svkPGp1heau0qWQVdaP0kmH4OfToYViT3xJnbbA6y0A26
 ZszfSz5Bm8e+FPZTA4O5c2Qhtunw4k6RBr5sm/j5cSujnxDuifqDxR65qkBAu+Ia1KEQ
 wM1EecGSjesfT9rMTeJveyxmcqDoabrU+iwrUA6mI1QvMEDRQ7nl3Ddm6Yak98ufangZ
 /VKVy3BKVGYpXAmagITdfcsLCms5ltmZtfn0U/g1P5gTYUYKyNrUlKqnyLQdAQE4+vhl
 2EGg==
X-Gm-Message-State: AOJu0YzoKp0WVlUEs1qbhWW1wCRg3IyP6rZU67Bg2t5CkgpE4us8SeQ2
 d3h7k9UYvmb99Yvfvzmf+ckBRB7Ejg8LPQ==
X-Received: by 2002:a81:994b:0:b0:5d7:1940:dd8f with SMTP id
 q72-20020a81994b000000b005d71940dd8fmr1740103ywg.101.1701649600281; 
 Sun, 03 Dec 2023 16:26:40 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:26:39 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 13/45] Add memory region for BCM2837 RPiVid ASB
Date: Sun,  3 Dec 2023 18:25:47 -0600
Message-Id: <20231204002619.1367044-14-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d3UmQcpvpqzv

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 3 +++
 include/hw/arm/bcm2838_peripherals.h | 3 ++-
 include/hw/arm/raspi_platform.h      | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 196fb890a2..d3b42cf25b 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -182,6 +182,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+
+    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
+    create_unimp(s_base, &s->asb, "bcm2838-asb", RPI4B_ASB_OFFSET, 0x24);
 }
 
 static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0a87645e01..af085934c9 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -64,12 +64,13 @@ struct BCM2838PeripheralState {
     MemoryRegion mphi_mr_alias;
 
     SDHCIState emmc2;
-    UnimplementedDeviceState clkisp;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
     OrIRQState dma_9_10_irq_orgate;
+
+    UnimplementedDeviceState asb;
 };
 
 struct BCM2838PeripheralClass {
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 0db146e592..537fc6b4af 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -74,6 +74,7 @@ uint64_t board_ram_size(uint32_t board_rev);
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
 #define ARBA_OFFSET             0x9000
 #define BRDG_OFFSET             0xa000
+#define RPI4B_ASB_OFFSET        0xa000   /* BCM2838 (BCM2711) RPiVid ASB */
 #define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-- 
2.34.1

