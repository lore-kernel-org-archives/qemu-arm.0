Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp92260njb;
        Tue, 4 Feb 2025 01:22:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUd66ipAEZ76zp2wZpg9HcUyuOk835bN3OsjzcYbXC/KB3Fw6WJZKWe8fS2yUiA80CB1/q53heprWr3hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH5cXUeK/EsbmYyjWMg5epFmT1F6NvaXA6MnU2oiEOPWYZTyuhH30hItxvGNg7ttxX1GfDc
X-Received: by 2002:a05:620a:bcc:b0:7b6:6b88:cc00 with SMTP id af79cd13be357-7bffccc97b1mr3544907885a.5.1738660971890;
        Tue, 04 Feb 2025 01:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738660971; cv=none;
        d=google.com; s=arc-20240605;
        b=GZI3F+RsFsioHkemb8gPQIzRmjp+h40Q08Rw1jd2/CMZwh7ywVKNupG06dPa4WkFY9
         2Tqeef2gdEKaxiV9dnFuBu84bJQDgOoU5r6apFFF9Pxqz45WEmFVuIM20MAe4tKTRgiG
         bdN+ID/E5RSDsSCqAMj1Ny1zWdnVujPOlRGv2l1eRXjtB3J5H/rafq6VLoBO48x7aApD
         k8Vzqh+9lSQvtb5akB74NoBHj5EAWV9VpxqfUhGxuc03JOvnkpGedyObhHFLjJ0KJWYv
         BYlnNpuhvUoCDgbc6yTLnqo6BXnqNsEO2q7j5tn63Rr78t34pQcYERd66YYePLWGwO0J
         mOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=42R2aSml+VKTf0LoVp/saQ6KjzZL2IBFiJZ1dmWdk5A=;
        fh=qFJWFLdn9usdRQJpwONuWxMu3WzbDm5L0Uto7VYgE/c=;
        b=PYT/ZUTbfCosdG1MONAAcHczTvYF8McvxIt51cRkqo0AJ2QFPxCpo5bUHut30KB/Ir
         D915J/Vf099aLU5G01jA6S8D+zVDO4V48uhdfT/XTbhVN7crdLPv5Zet76/arx6+tOfT
         fpcmyTzZE0TMxiaIvNb5MY6FbM+3u4N+UYii8rs4mjd+VoN9YldtaskLyutJWuacSBMW
         B+owt0GNdQOPkUUd0KC8Wsd8PQBP20apaLhRZ4fDo/Aw0t2pkhrMH3FGn4ijCNXBvQzz
         7J3C95gDg1X70rd8VHrnzVbTMRVAp22GoeLetSfGh9qBMdYnSy4UGv1IpAbYDVvabXXt
         92pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcqTS11Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4b5c4si223878585a.35.2025.02.04.01.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 01:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcqTS11Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfF87-0005lE-JV; Tue, 04 Feb 2025 04:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7m-00054P-FF; Tue, 04 Feb 2025 04:21:43 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7k-000566-AH; Tue, 04 Feb 2025 04:21:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so61910725e9.0; 
 Tue, 04 Feb 2025 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738660898; x=1739265698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42R2aSml+VKTf0LoVp/saQ6KjzZL2IBFiJZ1dmWdk5A=;
 b=UcqTS11ZTtaIjhtasp65i5oq4SZ9LYS0tOb2mkZ6q21FYZkgtQS0cgnLgCpnGzSvA2
 ishB2MdG6FuY5NzeiSxMAe5tx46HzKCqk2adAqHPigAGfFn93p9BWXaTO6skLQgM5Geh
 ptJIETqiE4LkDGCTuDf7KYnV4Lkj55HKdfKxNJWxebtQyn0BcaOdXdTgDKfqIRn1EfBh
 CCRxxZftcHWSLCFzIRbWouP12Ozo3sHboOOeFRtPlHrCSHjiejle33CMUp5fXYX3axFN
 fN6/d5F8NRGsgZA8KLgWug4A6IYNTcRlnoGBYvyKvp9q8wmZFY3FmaA5YZ3P8g7/T1Tm
 5m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738660898; x=1739265698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42R2aSml+VKTf0LoVp/saQ6KjzZL2IBFiJZ1dmWdk5A=;
 b=pg4n61AH7DZhi9C6EFHmxY1smBUwaDZFzKRuNPFw/u9MqFhdH4TmmlesiHh87bebfA
 nCNN6uQSCZp5G2m5mrFJpk4PuvuAzzPS3C8D5uz4mYWBMnOWx21GhF2jQmTF8vb3H5OW
 ufbAmWuTwnJDazy8AJIJBHuIVSCIj7UMdv9OGORmnQB2dWLazfv7/QnQOZBp22y6rEhd
 clUILiL1rVe+9jTGgwEOB2XsFbjXSMNnbBpegT9MoOnush8bztc8POozV+ydBhTqgEUH
 2wwzXQj6PYaoM/EY7l+y1dymUZdcAPkYKG5VKuCfSlIVHSJQD2FF2NHD0kX1Sb5S1V2N
 3M8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJWo4pcxxfV/IQXzUuh7iK+lrDqv0VV3QCuIMe91aiVLxa3O4x778hmKUlJ9v1sqFwd0DlTQm7rw==@nongnu.org
X-Gm-Message-State: AOJu0YzfmV2ebD8Hx2kFHNAh0L4SzWT3Vnid786t/7oApbT6sB6psvdq
 2GZAAow9Q7j6gfb7XHE6BqOHi247AMaCW2+ykz3/NSVapsX9gCw/yXx7/Q==
X-Gm-Gg: ASbGncsgKxtqrCzFMsAZZCYKkQCYjDqvb4YQie6DazBO7nlLOdI62G/RIrxVFzn2Bb7
 +TkxgMngWze6x97IgfiyUNmhQPWa+eBGr8BpPOCSJWAmJ906TTJOGMZvjPpf0AzVIkahrILABlo
 ucBDsHP/xi7SXLvO7Je/uyFjEZLBT3ImQhqq0qNJZsGo9X1mVJovcfLp4AG2kuWzs3Wj9yGMsti
 IIM2SeXVBPWc7yas4QQP6Seg4Bze+4RN5GG262W7YeoSAmuG7zEJi2W3mDOub8UCk1bizOYseC8
 N1Id1hC2IBigfSMfMoKb2ZxkDTX/NAtFyIKOd7/3sbyxFi6QFUXj1yAfWNZtOGHgzcIFPYXon1k
 McL/juawAiw==
X-Received: by 2002:a05:600c:1d83:b0:434:a781:f5d5 with SMTP id
 5b1f17b1804b1-438dc43540bmr225404965e9.30.1738660897620; 
 Tue, 04 Feb 2025 01:21:37 -0800 (PST)
Received: from Georg-PC.fritz.box
 (p200300faaf0043006a2cae69f03f1c85.dip0.t-ipconnect.de.
 [2003:fa:af00:4300:6a2c:ae69:f03f:1c85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm187233595e9.3.2025.02.04.01.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 01:21:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 15/18] hw/arm/fsl-imx8mp: Add USB support
Date: Tue,  4 Feb 2025 10:21:09 +0100
Message-ID: <20250204092112.26957-16-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204092112.26957-1-shentey@gmail.com>
References: <20250204092112.26957-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
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
X-TUID: JNjML/wC9YZQ

Split the USB MMIO regions to better keep track of the implemented vs.
unimplemented regions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst |  1 +
 include/hw/arm/fsl-imx8mp.h    | 12 +++++++++++
 hw/arm/fsl-imx8mp.c            | 37 ++++++++++++++++++++++++++++++++--
 hw/arm/Kconfig                 |  1 +
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index 4109387b6e..b3d657be10 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -16,6 +16,7 @@ The ``imx8mp-evk`` machine implements the following devices:
  * 3 USDHC Storage Controllers
  * 1 Designware PCI Express Controller
  * 1 Ethernet Controller
+ * 2 Designware USB 3 Controllers
  * 5 GPIO Controllers
  * 6 I2C Controllers
  * 3 SPI Controllers
diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index e292c31a3d..5247e972b8 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -24,6 +24,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/imx_spi.h"
 #include "hw/timer/imx_gpt.h"
+#include "hw/usb/hcd-dwc3.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "qom/object.h"
 #include "qemu/units.h"
@@ -42,6 +43,7 @@ enum FslImx8mpConfiguration {
     FSL_IMX8MP_NUM_I2CS         = 6,
     FSL_IMX8MP_NUM_IRQS         = 160,
     FSL_IMX8MP_NUM_UARTS        = 4,
+    FSL_IMX8MP_NUM_USBS         = 2,
     FSL_IMX8MP_NUM_USDHCS       = 3,
     FSL_IMX8MP_NUM_WDTS         = 3,
 };
@@ -62,6 +64,7 @@ struct FslImx8mpState {
     IMXFECState        enet;
     SDHCIState         usdhc[FSL_IMX8MP_NUM_USDHCS];
     IMX2WdtState       wdt[FSL_IMX8MP_NUM_WDTS];
+    USBDWC3            usb[FSL_IMX8MP_NUM_USBS];
     DesignwarePCIEHost pcie;
     FslImx8mPciePhyState   pcie_phy;
     OrIRQState         gpt5_gpt6_irq;
@@ -199,6 +202,12 @@ enum FslImx8mpMemoryRegions {
     FSL_IMX8MP_UART4,
     FSL_IMX8MP_USB1,
     FSL_IMX8MP_USB2,
+    FSL_IMX8MP_USB1_DEV,
+    FSL_IMX8MP_USB2_DEV,
+    FSL_IMX8MP_USB1_OTG,
+    FSL_IMX8MP_USB2_OTG,
+    FSL_IMX8MP_USB1_GLUE,
+    FSL_IMX8MP_USB2_GLUE,
     FSL_IMX8MP_USDHC1,
     FSL_IMX8MP_USDHC2,
     FSL_IMX8MP_USDHC3,
@@ -234,6 +243,9 @@ enum FslImx8mpIrqs {
     FSL_IMX8MP_I2C3_IRQ     = 37,
     FSL_IMX8MP_I2C4_IRQ     = 38,
 
+    FSL_IMX8MP_USB1_IRQ     = 40,
+    FSL_IMX8MP_USB2_IRQ     = 41,
+
     FSL_IMX8MP_GPT1_IRQ      = 55,
     FSL_IMX8MP_GPT2_IRQ      = 54,
     FSL_IMX8MP_GPT3_IRQ      = 53,
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 665123cf9c..14d696957a 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -40,8 +40,14 @@ static const struct {
     [FSL_IMX8MP_VPU_VC8000E_ENCODER] = { 0x38320000, 2 * MiB, "vpu_vc8000e_encoder" },
     [FSL_IMX8MP_VPU_G2_DECODER] = { 0x38310000, 2 * MiB, "vpu_g2_decoder" },
     [FSL_IMX8MP_VPU_G1_DECODER] = { 0x38300000, 2 * MiB, "vpu_g1_decoder" },
-    [FSL_IMX8MP_USB2] = { 0x38200000, 1 * MiB, "usb2" },
-    [FSL_IMX8MP_USB1] = { 0x38100000, 1 * MiB, "usb1" },
+    [FSL_IMX8MP_USB2_GLUE] = { 0x382f0000, 0x100, "usb2_glue" },
+    [FSL_IMX8MP_USB2_OTG] = { 0x3820cc00, 0x100, "usb2_otg" },
+    [FSL_IMX8MP_USB2_DEV] = { 0x3820c700, 0x500, "usb2_dev" },
+    [FSL_IMX8MP_USB2] = { 0x38200000, 0xc700, "usb2" },
+    [FSL_IMX8MP_USB1_GLUE] = { 0x381f0000, 0x100, "usb1_glue" },
+    [FSL_IMX8MP_USB1_OTG] = { 0x3810cc00, 0x100, "usb1_otg" },
+    [FSL_IMX8MP_USB1_DEV] = { 0x3810c700, 0x500, "usb1_dev" },
+    [FSL_IMX8MP_USB1] = { 0x38100000, 0xc700, "usb1" },
     [FSL_IMX8MP_GPU2D] = { 0x38008000, 32 * KiB, "gpu2d" },
     [FSL_IMX8MP_GPU3D] = { 0x38000000, 32 * KiB, "gpu3d" },
     [FSL_IMX8MP_QSPI1_RX_BUFFER] = { 0x34000000, 32 * MiB, "qspi1_rx_buffer" },
@@ -233,6 +239,11 @@ static void fsl_imx8mp_init(Object *obj)
         object_initialize_child(obj, name, &s->usdhc[i], TYPE_IMX_USDHC);
     }
 
+    for (i = 0; i < FSL_IMX8MP_NUM_USBS; i++) {
+        snprintf(name, NAME_SIZE, "usb%d", i);
+        object_initialize_child(obj, name, &s->usb[i], TYPE_USB_DWC3);
+    }
+
     for (i = 0; i < FSL_IMX8MP_NUM_ECSPIS; i++) {
         snprintf(name, NAME_SIZE, "spi%d", i + 1);
         object_initialize_child(obj, name, &s->spi[i], TYPE_IMX_SPI);
@@ -528,6 +539,27 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(gicdev, usdhc_table[i].irq));
     }
 
+    /* USBs */
+    for (i = 0; i < FSL_IMX8MP_NUM_USBS; i++) {
+        static const struct {
+            hwaddr addr;
+            unsigned int irq;
+        } usb_table[FSL_IMX8MP_NUM_USBS] = {
+            { fsl_imx8mp_memmap[FSL_IMX8MP_USB1].addr, FSL_IMX8MP_USB1_IRQ },
+            { fsl_imx8mp_memmap[FSL_IMX8MP_USB2].addr, FSL_IMX8MP_USB2_IRQ },
+        };
+
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "p2", 1);
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "p3", 1);
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "slots", 2);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usb[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0, usb_table[i].addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 0,
+                           qdev_get_gpio_in(gicdev, usb_table[i].irq));
+    }
+
     /* ECSPIs */
     for (i = 0; i < FSL_IMX8MP_NUM_ECSPIS; i++) {
         static const struct {
@@ -632,6 +664,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_RAM:
         case FSL_IMX8MP_SNVS_HP:
         case FSL_IMX8MP_UART1 ... FSL_IMX8MP_UART4:
+        case FSL_IMX8MP_USB1 ... FSL_IMX8MP_USB2:
         case FSL_IMX8MP_USDHC1 ... FSL_IMX8MP_USDHC3:
         case FSL_IMX8MP_WDOG1 ... FSL_IMX8MP_WDOG3:
             /* device implemented and treated above */
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7767a8725a..6daa9c651f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -592,6 +592,7 @@ config FSL_IMX8MP
     select PCI_EXPRESS_FSL_IMX8M_PHY
     select SDHCI
     select UNIMP
+    select USB_DWC3
     select WDT_IMX2
 
 config FSL_IMX8MP_EVK
-- 
2.48.1

