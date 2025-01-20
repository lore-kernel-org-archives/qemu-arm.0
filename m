Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6270753njn;
        Mon, 20 Jan 2025 12:40:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFmdQPMuJRsSnmJ+lYn5Kxp2FDrZJOKRYpGKzUR5CKSN33IPVRsrdFr9jZhuoyDpADpwWk+Cu1ymzAzg==@linaro.org
X-Google-Smtp-Source: AGHT+IF2b9id2fs+MruZnuQqKqfwwz7tF/ZsAmxzFsbjy41lMYyPywsXON0eP8VtOsGRnd4YfaNe
X-Received: by 2002:a05:622a:38b:b0:46c:7646:4a1e with SMTP id d75a77b69052e-46e12a62966mr233924851cf.13.1737405605938;
        Mon, 20 Jan 2025 12:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737405605; cv=none;
        d=google.com; s=arc-20240605;
        b=VAZ91+tLpchtsC0JCcIoWT5cvrgj4ZqpcE7NoBJdv5sRNAQXPpEntvZ7++DjJ8b0Nv
         SnZZlkOt1LL1sqBVs9nu1ToBQZ8jgmsL+ukzyvr6AyuLeIgPSDEW4YdpE5TgUeE0O0zo
         D/Nde2IuVP2DtSqmIopys3H9GnLSfFF07hOg0ZQIA8/q55Vn19teMGsFrfh98+XzGQbm
         0ehpLLYHjkb1s2QT4wX5qWxngNtzQSkVWUQ7Ql39SHg4kq9I4yEsG9Pzleh8s/KqBX2x
         izI/lHDkQKE3anJJ7m+kv76wasn2lLVHdFLLPwUChD+PZ39/x5HXiqusHyP6Aczbdx1w
         QlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j+AWIgiJrlTpetkFjJXweNVzkOFe/oxR3rTRm4rppbM=;
        fh=OJrhQOgOnP7O9e08k3lBoTSijqFTcZQgUlgVkOBdrd0=;
        b=TOfsegBFGRqL4JGnkNYJr7LwM4vZucTdX66u900c7MwQIWzz0SZPQHk33E5thBwIdV
         ZlLHvDMxTgb2hN+kVw3MMwsQKurPBYty6RLg3ECOfIekTmUaPsi/O21i2yKBJvmLYQbr
         nJaddbeyFbCAK5dJveZ56RYI/YKA2Pb2AsCOyWTcWoG60UdPYPuKOl9KvfMEClxp5QdY
         owT96HxKfUtJMQ4W50ziQAJAlc3yJPrwMCwG3kvJ2yaBnJ8Ul5mOgSStMkfiob7sRNql
         Wh5k04q0eiNaTbTGRRbdUfRkf4p9ojmFPMIA/7kcjML9p8itcP0QOQ/0RcEM+5ryw81N
         hTkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6naX5i1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1048fb2csi101219431cf.544.2025.01.20.12.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 12:40:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6naX5i1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tZyXS-000410-Uu; Mon, 20 Jan 2025 15:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyXL-0003wH-UN; Mon, 20 Jan 2025 15:38:22 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyXJ-0002XV-UO; Mon, 20 Jan 2025 15:38:19 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so764416a12.1; 
 Mon, 20 Jan 2025 12:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737405495; x=1738010295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+AWIgiJrlTpetkFjJXweNVzkOFe/oxR3rTRm4rppbM=;
 b=W6naX5i12I0CUp7RCM6OjaB67bGLpu77YGaYWKi4JPWH+PB4TnpUjzBnV2qzxw8TjS
 noDPPnk5CawjV/mHd/qzxcJM5oEK7KQHBZgEKeoZ3rSwNrxFz6Yra+SQien4Aqf7IsdN
 k2lXvo4GV4u04u8QrixU46GETP0qz1vFW4IQnYv+vNBqvDIULlfdXeUluL28vwy1wXOv
 YhsSM+zPO18aElisvuLzZTdluCDdenX/zHLnpizCW0HuS9BnHGbXTbhm8Y1IVYzc7w7t
 VQhxceFBzVc7AsSk4fD2ssp0G44AxBiQXsFd7jxsuZNm8ynEVfmLicKmU9fu7CWtrKoj
 DUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737405495; x=1738010295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+AWIgiJrlTpetkFjJXweNVzkOFe/oxR3rTRm4rppbM=;
 b=pSvxj2PCemd3wvJvvORFIIu7iGx2tUMf1r8etJ48U9740mPhQvvzj24dl57FpF1X88
 Tq+Z4eAaILSN9xFRqeTaWide1r+M8S10GQSOjDam/Flu0SFBqOu4Ti222axYLuTnJQ0L
 tSGT4HzBP5E/DwocJhXmb3AaX4xqb51qPjZKNLIhutaVTR8a3GcY1VjQF5Oc8QS2Ic/Q
 eMsavscDyXLv/5Q54IXvIS81LT6fUYb5+CbgA/Pq1HlgslUIsrlkjbrD0UxVcJPNciIV
 DNCFU8MmktCzYHJge227nCEIh4yr57O8D5bml4Yp/A6IkXbLU7PWHKoCgIloA+tV85lk
 2f6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC/NON2OrU7ODOtNzBNrcaJkzbTvrKtyjhFV4bmmq2vwyfknHzDxIAKS9nD4jhOPPOq3HTfuysIA==@nongnu.org
X-Gm-Message-State: AOJu0Yw5zZw9pm6sLWvYPCWZRLxDCXIquAzXtOzc09EnU4NMdQi3hUMN
 Ha2hqvRrS/55CAZ1XlwbjLl8lAOiZr2EHFhRgTqkl6XuHGp0OZGO+SwpYgYy
X-Gm-Gg: ASbGncvJjvnkUsEUu3OWHFvUZ6GMxnz1PU7dgBZME6WE1DkZ/gWC0yYUjQYmQ8eqJWj
 St/lttuWPulChTPyA2arwaMouWDanCxJZfNgCnPTWktRESTTRdp4hwpGHIIefiqT6vnLd+ZWu3M
 IT9gbIb7GKr4iYZ+pMHBs/fQI1cO/aUGN2naAOknhnKyKVYiqEXEGXftV0Qa9dgAqmvqbkTzHGs
 H8CZvF1lUtIwJ8TBNRzq2oybzyI2xvDVSeMovgLnr0BgHbeul8bpGl+m6B/+DFZkd9kFXbues/D
 X6vyOEuFAov3gg3VjTy4rXdpDTxNtUKBEzHLjxVQFGv/WRP+e33Z35S8jAVG
X-Received: by 2002:a05:6402:4308:b0:5da:d76:7b20 with SMTP id
 4fb4d7f45d1cf-5db7d0f6883mr14643351a12.0.1737405494834; 
 Mon, 20 Jan 2025 12:38:14 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-181-102.77.183.pool.telefonica.de. [77.183.181.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db7364258csm6021077a12.1.2025.01.20.12.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 12:38:14 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 12/21] hw/arm/fsl-imx8mp: Add SPI controllers
Date: Mon, 20 Jan 2025 21:37:39 +0100
Message-ID: <20250120203748.4687-13-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120203748.4687-1-shentey@gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eyHX8NgAeBse

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst |  1 +
 include/hw/arm/fsl-imx8mp.h    |  8 ++++++++
 hw/arm/fsl-imx8mp.c            | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index 2bcfe34f48..da0435fe55 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -17,6 +17,7 @@ The ``imx8mp-evk`` machine implements the following devices:
  * 1 Designware PCI Express Controller
  * 5 GPIO Controllers
  * 6 I2C Controllers
+ * 3 SPI Controllers
  * Secure Non-Volatile Storage (SNVS) including an RTC
  * Clock Tree
 
diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index 7e6f997d37..f019687cd2 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -19,6 +19,7 @@
 #include "hw/pci-host/designware.h"
 #include "hw/pci-host/fsl_imx8m_phy.h"
 #include "hw/sd/sdhci.h"
+#include "hw/ssi/imx_spi.h"
 #include "qom/object.h"
 #include "qemu/units.h"
 
@@ -30,6 +31,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslImx8mpState, FSL_IMX8MP)
 
 enum FslImx8mpConfiguration {
     FSL_IMX8MP_NUM_CPUS         = 4,
+    FSL_IMX8MP_NUM_ECSPIS       = 3,
     FSL_IMX8MP_NUM_GPIOS        = 5,
     FSL_IMX8MP_NUM_I2CS         = 6,
     FSL_IMX8MP_NUM_IRQS         = 160,
@@ -46,6 +48,7 @@ struct FslImx8mpState {
     IMX8MPCCMState     ccm;
     IMX8MPAnalogState  analog;
     IMX7SNVSState      snvs;
+    IMXSPIState        spi[FSL_IMX8MP_NUM_ECSPIS];
     IMXI2CState        i2c[FSL_IMX8MP_NUM_I2CS];
     IMXSerialState     uart[FSL_IMX8MP_NUM_UARTS];
     SDHCIState         usdhc[FSL_IMX8MP_NUM_USDHCS];
@@ -207,6 +210,11 @@ enum FslImx8mpIrqs {
     FSL_IMX8MP_UART5_IRQ    = 30,
     FSL_IMX8MP_UART6_IRQ    = 16,
 
+    FSL_IMX8MP_ECSPI1_IRQ   = 31,
+    FSL_IMX8MP_ECSPI2_IRQ   = 32,
+    FSL_IMX8MP_ECSPI3_IRQ   = 33,
+    FSL_IMX8MP_ECSPI4_IRQ   = 34,
+
     FSL_IMX8MP_I2C1_IRQ     = 35,
     FSL_IMX8MP_I2C2_IRQ     = 36,
     FSL_IMX8MP_I2C3_IRQ     = 37,
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index f2d890ffb3..5897c34922 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -226,6 +226,11 @@ static void fsl_imx8mp_init(Object *obj)
         object_initialize_child(obj, name, &s->usdhc[i], TYPE_IMX_USDHC);
     }
 
+    for (i = 0; i < FSL_IMX8MP_NUM_ECSPIS; i++) {
+        snprintf(name, NAME_SIZE, "spi%d", i + 1);
+        object_initialize_child(obj, name, &s->spi[i], TYPE_IMX_SPI);
+    }
+
     object_initialize_child(obj, "pcie", &s->pcie, TYPE_DESIGNWARE_PCIE_HOST);
     object_initialize_child(obj, "pcie_phy", &s->pcie_phy,
                             TYPE_FSL_IMX8M_PCIE_PHY);
@@ -463,6 +468,26 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(gicdev, usdhc_table[i].irq));
     }
 
+    /* ECSPIs */
+    for (i = 0; i < FSL_IMX8MP_NUM_ECSPIS; i++) {
+        static const struct {
+            hwaddr addr;
+            unsigned int irq;
+        } spi_table[FSL_IMX8MP_NUM_ECSPIS] = {
+            { fsl_imx8mp_memmap[FSL_IMX8MP_ECSPI1].addr, FSL_IMX8MP_ECSPI1_IRQ },
+            { fsl_imx8mp_memmap[FSL_IMX8MP_ECSPI2].addr, FSL_IMX8MP_ECSPI2_IRQ },
+            { fsl_imx8mp_memmap[FSL_IMX8MP_ECSPI3].addr, FSL_IMX8MP_ECSPI3_IRQ },
+        };
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_table[i].addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                           qdev_get_gpio_in(gicdev, spi_table[i].irq));
+    }
+
     /* SNVS */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->snvs), errp)) {
         return;
@@ -502,6 +527,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_GIC_DIST:
         case FSL_IMX8MP_GIC_REDIST:
         case FSL_IMX8MP_GPIO1 ... FSL_IMX8MP_GPIO5:
+        case FSL_IMX8MP_ECSPI1 ... FSL_IMX8MP_ECSPI3:
         case FSL_IMX8MP_I2C1 ... FSL_IMX8MP_I2C6:
         case FSL_IMX8MP_PCIE1:
         case FSL_IMX8MP_PCIE_PHY1:
-- 
2.48.1

