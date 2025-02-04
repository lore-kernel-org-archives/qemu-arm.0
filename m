Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp92568njb;
        Tue, 4 Feb 2025 01:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/y0K/ywDQYpGGT125i1EUq82UxXq+oWg+gDNIlAnWHCF1ShaWnuW1yd9hPagLL8bxA1UcVhsKM8NoGg==@linaro.org
X-Google-Smtp-Source: AGHT+IFeOC5ozJHKBVmI3LtEYRDb4gC3kQJrpMKg1eC8RO/NcUm0BfYQRru2grcOzDuLLP3oCBL/
X-Received: by 2002:ad4:5c67:0:b0:6d8:9127:e71e with SMTP id 6a1803df08f44-6e243cae138mr277997766d6.41.1738661016118;
        Tue, 04 Feb 2025 01:23:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738661016; cv=none;
        d=google.com; s=arc-20240605;
        b=brd/BBSq0cII5JQ0pvIL8rGuyws/1iFo4eqzifEejtldHGgVdO1Uw4ObsXH2OHw2TH
         sCovVQg94wjCQyLNFx3mGPW6Bzw4pMFGLqmm07D7vskyjprzWzP3NR+pe8siTIkCkT2R
         MnR9GN9njb0rMzt/F2AsVf+3dDTuFLQWX1ShWimB4noeKM4SBxV9+SonRQ1eZKdqiwBk
         4vyg8S66zd+SteMTBgQyirjkRC1E2NUa/VcJLGKSzxswBOpF0dJ7ksJq4I+L43+VjgLV
         d+/t/omIGj8IhKN8cjRX251WzeweVdsJXNqLNsWQBGD0IG8XNPyA7t96aUCdNyq6S+8S
         +Wtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZET0FZghy1VaZG04EsXu8gNTUS9Eix03bx06NlnEf/w=;
        fh=GddeRP94XHw9hDOmVbYN7+mXFhI6zYC6ErDCZLP4Sb0=;
        b=cn2kANMjJex35mdQ8UqoxGfDRKwbjksdGp5ErfVQo2V7rqbnm3gq1LZhgNYBr4p2SF
         VWjhb0psy/nXg3P8LlpQRmZy2tLLYiVSYsRRFResqGODdLdnDZlJZ1AoxBcMfsVf0X5s
         paoZj54VJCgxaGUM6FS1gLQNHuPo/vEdRVm7zF9tR8zP4XO/HMmszjyrVnQNUzsh7r2U
         bIpyzMJiRuWGLXO999bC1yaiH0Gj1WKfUyrF+RruCWHQC3p+kmtfw1IYjy5lpN4bcqmU
         WiJbwaLTxAj2eNYBaNq+C+dKC7NLTKA3BFPZ8RAJNVDD0JcRzOcwM0OHedEIo+bTCrUF
         zniQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2qmDym+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e42783468dsi7899126d6.45.2025.02.04.01.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 01:23:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2qmDym+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfF85-0005bD-Ed; Tue, 04 Feb 2025 04:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7l-000514-4N; Tue, 04 Feb 2025 04:21:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7i-00055f-UC; Tue, 04 Feb 2025 04:21:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso39130285e9.0; 
 Tue, 04 Feb 2025 01:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738660897; x=1739265697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZET0FZghy1VaZG04EsXu8gNTUS9Eix03bx06NlnEf/w=;
 b=K2qmDym+C/gjyjRFM5Tifv5JROr7zycsC6WUZUb2uk5jjItsZN9qaSI4UwVJjtMpwu
 mCiE6W0wPlrhnnowuSYCQiV3Q7XA+lw1qrFNXYU2OjmCakUJZoeDPcGx+KlFM+wzgG/e
 bfc+ZApveFOtEeNWNqNYIjD/Wy1UkSVlD8+kDY7p8V8Rq+3yZGyXrb/pPJ7mh1gzhBdQ
 SRtYUnOdXw4zSq5yDj1M4JsFdXIA3Wvqvb493W2HDccarkRNy+V+dJWuraa2H6Qx5r9f
 HZvWbE5AFz0KJ6gg5qPpOnoO+WmVTCp/UKC8Pi9i8oWZD/vbIfT3Ye6zlgUo7VajfsTg
 3Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738660897; x=1739265697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZET0FZghy1VaZG04EsXu8gNTUS9Eix03bx06NlnEf/w=;
 b=lDwOtXrn2EX2QrcaKRk9FvIiZkHLYWVa7At/Sv8VEHPst1rehqqG7CpWfOGi2c1nMU
 NyzCjQz+JE3ebtwEqKulCZCHgZxYWr89G0QXckCwCpaVmRGI/dPZYl+MAs4L8HHb69zP
 8k6mWyxADPQbpH5eMS3kP7+ALvF+kTCf9KdgPJDGoBjYmfWT9A+hhM5lBtL4ViSJAv2r
 1NHuFNL5r1XCsGvBotlgojMd7nGIkb9zBjYgS2YeNl9SCgJ3L399a2G6EPVheovxm1UZ
 PtCJX547YbrjVmhP2ZZFgFFCqzkguKYSvcsNs3GZ9cSC/J7YKIEWiPF/IdgF1vUf+A46
 Cn9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNs4DIHlUzlG4YVRpr1YClTeQPUO+/eUxYyLf4CwdfgH1c28P5ujzzXpviG+owkd0Q76RXbX481g==@nongnu.org
X-Gm-Message-State: AOJu0YxFELluAFqasfFVrtaB1sOw4fPdYVTgNuQo/MkhHPef1rOIiWFi
 X1OpNMqOnCOIHx7ojPdfNa7ybU6sXD6BvisfUw0e5G+BZO7MZM9RLEVHtA==
X-Gm-Gg: ASbGnctXq8Z41R90JG8rOV71kXI+Kp/pOS/kHQIL1iPomJ9Vnlhl1pLPVkAfyUU1S0x
 NHi71w8NP97KfkxDcU8yqtGaIM0KrojCtmssGnlG6LjNPKd42rnrEIkh37QFDWt8tHuyMrDVJE/
 f2C/eSpXJz3qiXrtj2wOUpkoktfRsu0TgixRn3dGpKOHkHL+FsUiGYiufN/9owsNZRMfa17ZUDF
 3F/+7WRPLiuoko2LhqQ2KHE4Tgct70Jgn+VJt7/N1VhOXYpSY+oBcRjpdDz2VDlZMIpGVRXRGdY
 UQrDKWKs/MA8Q4OstufRAljoI+5oyjUNNxMlrYZE1KK8SLHv4mT+BjzW4X1geD/C6sbcyTKkyjC
 Qyoni/zizdg==
X-Received: by 2002:a05:600c:4fc5:b0:437:c453:ff19 with SMTP id
 5b1f17b1804b1-43905f99665mr16253245e9.14.1738660896459; 
 Tue, 04 Feb 2025 01:21:36 -0800 (PST)
Received: from Georg-PC.fritz.box
 (p200300faaf0043006a2cae69f03f1c85.dip0.t-ipconnect.de.
 [2003:fa:af00:4300:6a2c:ae69:f03f:1c85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm187233595e9.3.2025.02.04.01.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 01:21:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 14/18] hw/arm/fsl-imx8mp: Add Ethernet controller
Date: Tue,  4 Feb 2025 10:21:08 +0100
Message-ID: <20250204092112.26957-15-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204092112.26957-1-shentey@gmail.com>
References: <20250204092112.26957-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32d.google.com
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
X-TUID: n3WGIskMm8ZA

The i.MX 8M Plus SoC actually has two ethernet controllers, the usual ENET one
and a Designware one. There is no device model for the latter, so only add the
ENET one.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst |  1 +
 include/hw/arm/fsl-imx8mp.h    |  8 ++++++++
 hw/arm/fsl-imx8mp.c            | 24 ++++++++++++++++++++++++
 hw/arm/imx8mp-evk.c            |  1 +
 hw/arm/Kconfig                 |  1 +
 5 files changed, 35 insertions(+)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index 9293cabb85..4109387b6e 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -15,6 +15,7 @@ The ``imx8mp-evk`` machine implements the following devices:
  * 4 UARTs
  * 3 USDHC Storage Controllers
  * 1 Designware PCI Express Controller
+ * 1 Ethernet Controller
  * 5 GPIO Controllers
  * 6 I2C Controllers
  * 3 SPI Controllers
diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index 975887751b..e292c31a3d 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -17,6 +17,7 @@
 #include "hw/misc/imx7_snvs.h"
 #include "hw/misc/imx8mp_analog.h"
 #include "hw/misc/imx8mp_ccm.h"
+#include "hw/net/imx_fec.h"
 #include "hw/or-irq.h"
 #include "hw/pci-host/designware.h"
 #include "hw/pci-host/fsl_imx8m_phy.h"
@@ -58,11 +59,15 @@ struct FslImx8mpState {
     IMXSPIState        spi[FSL_IMX8MP_NUM_ECSPIS];
     IMXI2CState        i2c[FSL_IMX8MP_NUM_I2CS];
     IMXSerialState     uart[FSL_IMX8MP_NUM_UARTS];
+    IMXFECState        enet;
     SDHCIState         usdhc[FSL_IMX8MP_NUM_USDHCS];
     IMX2WdtState       wdt[FSL_IMX8MP_NUM_WDTS];
     DesignwarePCIEHost pcie;
     FslImx8mPciePhyState   pcie_phy;
     OrIRQState         gpt5_gpt6_irq;
+
+    uint32_t           phy_num;
+    bool               phy_connected;
 };
 
 enum FslImx8mpMemoryRegions {
@@ -253,6 +258,9 @@ enum FslImx8mpIrqs {
     FSL_IMX8MP_WDOG2_IRQ    = 79,
     FSL_IMX8MP_WDOG3_IRQ    = 10,
 
+    FSL_IMX8MP_ENET1_MAC_IRQ    = 118,
+    FSL_IMX6_ENET1_MAC_1588_IRQ = 121,
+
     FSL_IMX8MP_PCI_INTA_IRQ = 126,
     FSL_IMX8MP_PCI_INTB_IRQ = 125,
     FSL_IMX8MP_PCI_INTC_IRQ = 124,
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 43395df628..665123cf9c 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -243,6 +243,8 @@ static void fsl_imx8mp_init(Object *obj)
         object_initialize_child(obj, name, &s->wdt[i], TYPE_IMX2_WDT);
     }
 
+    object_initialize_child(obj, "eth0", &s->enet, TYPE_IMX_ENET);
+
     object_initialize_child(obj, "pcie", &s->pcie, TYPE_DESIGNWARE_PCIE_HOST);
     object_initialize_child(obj, "pcie_phy", &s->pcie_phy,
                             TYPE_FSL_IMX8M_PCIE_PHY);
@@ -546,6 +548,21 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(gicdev, spi_table[i].irq));
     }
 
+    /* ENET1 */
+    object_property_set_uint(OBJECT(&s->enet), "phy-num", s->phy_num,
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->enet), "tx-ring-num", 3, &error_abort);
+    qemu_configure_nic_device(DEVICE(&s->enet), true, NULL);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->enet), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->enet), 0,
+                    fsl_imx8mp_memmap[FSL_IMX8MP_ENET1].addr);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->enet), 0,
+                       qdev_get_gpio_in(gicdev, FSL_IMX8MP_ENET1_MAC_IRQ));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->enet), 1,
+                       qdev_get_gpio_in(gicdev, FSL_IMX6_ENET1_MAC_1588_IRQ));
+
     /* SNVS */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->snvs), errp)) {
         return;
@@ -608,6 +625,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_GIC_REDIST:
         case FSL_IMX8MP_GPIO1 ... FSL_IMX8MP_GPIO5:
         case FSL_IMX8MP_ECSPI1 ... FSL_IMX8MP_ECSPI3:
+        case FSL_IMX8MP_ENET1:
         case FSL_IMX8MP_I2C1 ... FSL_IMX8MP_I2C6:
         case FSL_IMX8MP_PCIE1:
         case FSL_IMX8MP_PCIE_PHY1:
@@ -628,10 +646,16 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static const Property fsl_imx8mp_properties[] = {
+    DEFINE_PROP_UINT32("fec1-phy-num", FslImx8mpState, phy_num, 0),
+    DEFINE_PROP_BOOL("fec1-phy-connected", FslImx8mpState, phy_connected, true),
+};
+
 static void fsl_imx8mp_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, fsl_imx8mp_properties);
     dc->realize = fsl_imx8mp_realize;
 
     dc->desc = "i.MX 8M Plus SoC";
diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index 27d9e9e8ee..e1a7892fd7 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -36,6 +36,7 @@ static void imx8mp_evk_init(MachineState *machine)
 
     s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+    object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX8MP_RAM_START,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f2859f6a88..7767a8725a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -585,6 +585,7 @@ config FSL_IMX8MP
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
     select IMX
+    select IMX_FEC
     select IMX_I2C
     select OR_IRQ
     select PCI_EXPRESS_DESIGNWARE
-- 
2.48.1

