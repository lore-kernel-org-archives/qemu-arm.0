Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp533667lfg;
        Wed, 24 Feb 2021 04:52:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqBnPAx3SSiMC8rOjHTZdCH8YoubYys87x0KyShj70ifapm1HLpRk/cnl9RfWoGNxrW7Ma
X-Received: by 2002:a05:6638:44e:: with SMTP id r14mr14430755jap.138.1614171149960;
        Wed, 24 Feb 2021 04:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614171149; cv=none;
        d=google.com; s=arc-20160816;
        b=dh4EE31y10RYgqXW1ye8vLYjb15uJ1xnRNxA44EIXvIax1UtFSN2t/8jGWvBoUejx9
         51XgztNw0qJ443nrJ/Mono2bwplqJBUybHGHWPEltDKABAWyidanFPVNrKV87wJQpXHQ
         mIVLtHpjc/eq41tDnty4ePUFcOGju8QYaD/KswWomHusb2w4uNvu+R7ZYSOM6laALO1c
         0x2FYRwAb0MMWjdt3kpK4huUEyws+CRzuXPpz8xbhU7IINmYmtT93czAWFi8U49L8pAS
         cqPz/4+CiZOFpc+lvpoO1FhgxOZ3v2Uftz0LMx4H1ITqhSMWP0/BNRx0vKwixeYItv71
         +7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
        b=ma0TM1KC5N/Kp0rMWJxe3tYmd1ymxgQD2B8XHv7DcyYSdGqyfwQaHV5dgqGy/WDMTv
         LUW19WZoIaMHNqLOXsGAU23V0XfqOAStn07MDOFYkVBQFSL+LaVKKta3Z3aH/PCBZUDi
         mLNSXnalgPESsRVtlfDNvjKHNGEsmxzcfYh20c8RMRBqJfZWVygQ8QtcBGUAtSNMJa3r
         bhwhouv21rke9jzzY3wHcTonRGYatxt2wKAK9Po9nS7zdunSwm0goPHjKFKrzuZ4BVSW
         aB6rkXuNqC46vokCFp5tDv4+rrwkuQi5U2/2aLzT6CLltHMMLpLXmv5noLe4nF4TKap0
         2vYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWXicEFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si1866680ilu.29.2021.02.24.04.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 04:52:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWXicEFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEteX-0006AM-8w
	for alex.bennee@linaro.org; Wed, 24 Feb 2021 07:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtd0-0004fC-OH; Wed, 24 Feb 2021 07:50:54 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtcy-0003om-4n; Wed, 24 Feb 2021 07:50:54 -0500
Received: by mail-pf1-x431.google.com with SMTP id j24so1278460pfi.2;
 Wed, 24 Feb 2021 04:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
 b=sWXicEFbRNgy4TorBFdZIyozG5Xc0XRnP9LwFkUc5lTwKOupafUtaAjEH/nYsITE7O
 525d2xCJza+SmEg8m7p/OugjdmVDmjpGCe3pNo+FjxsoNDeBOng5aCOZE41tcdLgX5rx
 nnkh1r33/RbAiLTs6nDy4TCiJX/5R+jIw83EI8A16VLor4phCNMEzI6CZuT/LmAEUNv0
 y6kFJk/R8TNjVcNOH8aQzoNXuAKkPamDTgoMf5f++Hr4t+O+LYmzex5R9DGt5VPNqH3U
 YgtjJ1lEZOUkBtTzEl/eaR/gXqtmYVEpcGcccqCdV0HdQXS71C/8LPusRUU5y7fXSDak
 pgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
 b=OHuxFTxyHW9J+BIbE8yDW52pmv7K6xzrc1vPg9AaEbBtGyPQgDAhTj3DzalDzuBEcD
 ZkDzPutmIPrCn59Qo+1cXT1XUgT+BKf/4FbcI6xXy2OB4RDQyGrzT5GzwKuoglEN8M1K
 d2VJwxEzSG7buywsRh7/1E/NPtMvvi2lZgTTnxvKu6czx4Mkba8XWZeNhp0KZHfBTWAG
 DH5uZoVc7q14k8RxuGeVOiC1/BMeeoN6bO9lz57EPF+uYIHib5BO/N0iByu1Uyrpwtzh
 32vm6KmdyOni2LevTMrcgncB07wetY3LCm+tVrVcGZhfzhGzmuNTx8shYJpHD8YoCSu3
 PW3g==
X-Gm-Message-State: AOAM531Q1HGEAKZ2Wcwb2EVvP/aFuw04lE3D2G2l2B1ORMAybhBQK0/G
 rhWMqBchvu+rgn+Rx3e1rAI=
X-Received: by 2002:a65:4782:: with SMTP id e2mr11973434pgs.93.1614171050642; 
 Wed, 24 Feb 2021 04:50:50 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e12sm2795661pjj.23.2021.02.24.04.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:50:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module
 for QSPI
Date: Wed, 24 Feb 2021 20:50:22 +0800
Message-Id: <20210224125024.4160-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224125024.4160-1-bmeng.cn@gmail.com>
References: <20210224125024.4160-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/DG5tCzTWbY

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
link of GQSPI to CSU DMA.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

---

(no changes since v4)

Changes in v4:
- Rename "csu_dma" to "qspi_dma"

Changes in v3:
- new patch: xlnx-zynqmp: Add XLNX CSU DMA module

 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 12 ++++++++++++
 hw/arm/Kconfig               |  1 +
 3 files changed, 15 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index be15cc8814..2edeed911c 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -35,6 +35,7 @@
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 #include "net/can_emu.h"
+#include "hw/dma/xlnx_csu_dma.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -108,6 +109,7 @@ struct XlnxZynqMPState {
     XlnxZynqMPRTC rtc;
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
+    XlnxCSUDMA qspi_dma;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 49465a2794..76cc3b5e78 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -50,6 +50,7 @@
 #define QSPI_ADDR           0xff0f0000
 #define LQSPI_ADDR          0xc0000000
 #define QSPI_IRQ            15
+#define QSPI_DMA_ADDR       0xff0f0800
 
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
@@ -284,6 +285,8 @@ static void xlnx_zynqmp_init(Object *obj)
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
         object_initialize_child(obj, "adma[*]", &s->adma[i], TYPE_XLNX_ZDMA);
     }
+
+    object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -643,6 +646,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
                            gic_spi[adma_ch_intr[i]]);
     }
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
+    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                             OBJECT(&s->qspi_dma), errp);
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4e6f4ffe90..27ec10f89b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -353,6 +353,7 @@ config XLNX_ZYNQMP_ARM
     select SSI_M25P80
     select XILINX_AXI
     select XILINX_SPIPS
+    select XLNX_CSU_DMA
     select XLNX_ZYNQMP
     select XLNX_ZDMA
 
-- 
2.25.1

