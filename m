Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1730768lfc;
        Mon, 22 Feb 2021 05:21:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc6zhE2ZcJb/fMXKclplnOKg95YQ/CeRc6e6ZFso4ukA+d47hQ+Cv45HG88Xk4cGwW19d9
X-Received: by 2002:a6b:f317:: with SMTP id m23mr15863549ioh.67.1614000063444;
        Mon, 22 Feb 2021 05:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614000063; cv=none;
        d=google.com; s=arc-20160816;
        b=BG68rMNmGkVhycb35L2gRCre0DP4Nd92qqbWcIU74gEzzzN9NNhF1nNe2e9kA98I1x
         WOq5TCXvXdU/9WsBzJt57MzdXDrDmPxFLHY7CgE9pJ9lY9Fukn21ghCb//031SDXqIZx
         aoUqvORpDXoEy98TQ9KITBi95XH7d9rDxwaAUqJgOU9Hq9NhJ13DBMyYeeH0ynFCTV+n
         JfO+kfEjRsvvRCPhv94bkAtvIWCxL8T+01tkHliRmBoGZV8DKZy60kSvgkUs91YlVOGQ
         BK7wvWECL4Bm6VXzNA4C55wG8+ryDVBsJFc+0d2flG2TOrhTZWyrRr4viqBpx4P4jNId
         GL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7J86W/zSZL3AWXKiADSN/SXL9whaD3dcfwEIBLtCwhY=;
        b=qO1r47fJd8fZRE3hpZKWhKp9qbqcGtNvnjzYAkXwkHHd3/jJ4Zp2FfvOuay1pZL1Lq
         kAdF1p+79r7FwUKXl5njCxwbyvlboo26Et12T/5SfWUHQw8E0ef9sMC7qtCW37zvkQug
         czDan9kkc6oashaddRi8qG+uxvSFzP3N4/ZnxBOiCIv/AF5MO5vXuiGrzF8T6iRMNv+A
         H8UunshTqZe4Hu3b3NVB/kT22/KZBO/5nUGqlcPEjp4xlpZv7nZGgyW+kLjIjwI8HPeQ
         ALri9kO1jUfVpc9Kk3ydg7j/Vjc3R8o6jHh84YlmjVtjST6N+D8F7Zq0rY7zMCTENA0h
         jsIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gRbGiM0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si11882972jak.87.2021.02.22.05.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 05:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gRbGiM0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEB94-0002eW-Oi
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 08:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEB3o-0005su-Hd; Mon, 22 Feb 2021 08:15:37 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEB3m-000163-0p; Mon, 22 Feb 2021 08:15:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id o6so728928pjf.5;
 Mon, 22 Feb 2021 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7J86W/zSZL3AWXKiADSN/SXL9whaD3dcfwEIBLtCwhY=;
 b=gRbGiM0GnIEEaKuluC5QgJnuHp7YXH8LT0f34jVNWCaTYzODK8OdzY5jOII0hHRSgA
 CFd502cmDoEZKQgmWYrdXMyomZl3DsseoesxDIOdwdvUxbaNJGYfV/hydArXegAaqY2D
 ha2tmSb5l7s48ktQ3okBH5zu+UKeA6Fato5cstLRdWkF0280MkpFkMG0/9R6eUKLGrnr
 D4QjgiUy9nw4660zM/aS5TabPEbmO1pSHF+Dunr2n9H5tPeV5H+lQY06XXiaVxaVHqTg
 c7Zhshkga7s4gCI3rQg3XxspP0/BBBQn9sfZAAUky0ni/rWp8CI5v4W8TjIPj3dKPPoj
 twsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7J86W/zSZL3AWXKiADSN/SXL9whaD3dcfwEIBLtCwhY=;
 b=Kkx5Tr5stWjlkGrVyB1cYjeWxAFsM6H+7s57cAEKZ2tKtUarkcO6lIOC+T35Kt03PU
 2a0VNtMOcqn9ZZNeU/QVag8sed5nCvYd88p3Q23gncHJpMDYQXTUw65+EqoQXRn9XmwX
 w1VQx342cWo6uZx6cA0lTscO0KAUUFrCjWcrd7tJ7HIrwsHKyaYrfiF1QrLb06j1iTj8
 sWPcBLCf4O47KKlFOaDBJEwDrsEwB/iUWBDvzBDRp8ghK3GBk08/iY2qPxfTp1pOLmIV
 JTszo556VR6o43F5QZR8RgzOcYvmt3VCA2zyLITVyDvJ6sCkjL2AD1QLNE0SYA/je53i
 FVdA==
X-Gm-Message-State: AOAM531zjEtwcgVNOaBa1yEL9LYIew5nVufV2MWas6bDeg4ukn3MxuoG
 ROxOvk/YZokLOyEc941nzSU=
X-Received: by 2002:a17:90a:6383:: with SMTP id
 f3mr22923856pjj.14.1613999730516; 
 Mon, 22 Feb 2021 05:15:30 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id p8sm17473190pgi.21.2021.02.22.05.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:15:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH v4 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA
 module for QSPI
Date: Mon, 22 Feb 2021 21:15:00 +0800
Message-Id: <20210222131502.3098-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222131502.3098-1-bmeng.cn@gmail.com>
References: <20210222131502.3098-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Xfg+LdyhOjg

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
link of GQSPI to CSU DMA.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---
RESEND this patch to remove 2 blank lines that were accidently added

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

