Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1309772njc;
        Sun, 23 Feb 2025 03:48:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNQeI93ZHrx4O8BJErWnykozwWoM189+K2fCYCY1t0M6oHTt5Pkm0N5vgsbJBbAtiF9ahsNUgkp9Qp8w==@linaro.org
X-Google-Smtp-Source: AGHT+IEUtWIyXU7pl44c7zL90QodJD+YfQP0uxRDRVz4Jb7OCpldUPwdQR7bUzO9gnB1+fG2DaII
X-Received: by 2002:a05:620a:28ca:b0:7c0:ae2e:630c with SMTP id af79cd13be357-7c0ceef980cmr1381600285a.22.1740311322107;
        Sun, 23 Feb 2025 03:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740311322; cv=none;
        d=google.com; s=arc-20240605;
        b=jfJePGRrIKlUrZoAJXYXweUbPsO9ZGz/LC7UjB36WgibplQvDwsmnlbpd0LIbr272+
         L2l8xBVFKjGS3aJqIhsMuT8eG4xvxXW3MVhZkiyGqVYN2F3yXy6vDe+Lckl6JRux4WYh
         FjSA4kHTWKBjXzCi3i627xzL35qw4CgXCXLxAmH9sXR6s2nIdiKFhvggPjvvszMOwXLn
         LtymxXf3KGYQoW9CWOXX8knrafAWrFYsjKViCbLxAG8ikWHc8CNoNzXzlYGWWvOmZBhu
         /ztvbqPPm8wRt5g16TcU1UXtECNwF9UCXa4Vz9x/I59o5uFfXJz+fWOPave53VG1j5gK
         pv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AieNCuXJCXf3WSAGsRoruSJQCi8pXIbogaJCtAJEy7M=;
        fh=nszG7hAfR7+8pHxbp3p6RjIfaZ5XPyeiRfRdRNgHM2I=;
        b=aHBs4zKQKlMvAyBeMm4oe/nHMUfEHkXWHTwRNhn9MldUvnd5Z3mLJzSolp8YInMchx
         DzbCLNrhRzmnxyza4r1neVX6uzn5vcO2XZLpotmsG7uLghndAmJOTwxCqJYMNtxt//95
         iqBlg5sCKwT7v+FxqBvxKcNN/Sarz69XULxEYfUz+O/zQJHDUFZ9/RwkhSW1zOzMFu52
         MCmgApa1kZ1D0Mas4ew5etvhMgydg+qXTDEoyQOKnoWuNfOY+JeRoIuAIe7vZSrxeOWm
         uh0IBhby/BO/ROsH3IpXdzNer4X85cN2ZobgfPxhATjKKTqPcoGcHSPvwviTYUREdQhE
         8HtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RGp8wwEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b500da56si856254285a.117.2025.02.23.03.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2025 03:48:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RGp8wwEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmAST-00007t-0D; Sun, 23 Feb 2025 06:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tmASQ-00005a-C2; Sun, 23 Feb 2025 06:47:38 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tmASO-0005x8-Hw; Sun, 23 Feb 2025 06:47:38 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so561367666b.2; 
 Sun, 23 Feb 2025 03:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740311254; x=1740916054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AieNCuXJCXf3WSAGsRoruSJQCi8pXIbogaJCtAJEy7M=;
 b=RGp8wwEO9Og1tAtYFgZQqEMTznRZcPDmkg3GbbUpRx10bSzci4KnWd+ln3kAwQXMrP
 3npzXWBdYQklE3R7AecrHsmjtzP5NZdxacTf0CN07PfdfLaQQR6fo/aYE1Om7b+v3DwG
 xcl4/pSJEfUkuEheYMXK8XHqqivzgzIZ3V/Rks5rBZd0M5jP7HhX1/N9+qJ0Pc/LjNkQ
 weI7zlCXL6rzWQyfg5D+oI6z7WEZhQ90ZOC9ThVceTwblUFmH0CoRRBZ9kNhlcsS6uzc
 5jn7LPEWLiGwmFRbDtzpsqId1mm7zbKJ92lu8Qn2FwRaxmvuY7uIGUBkH9E+IuxV8GwI
 pnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740311254; x=1740916054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AieNCuXJCXf3WSAGsRoruSJQCi8pXIbogaJCtAJEy7M=;
 b=GbJa2JUBCm3eGMu3ZFJwn2a79rOrXSvmo59IufVdXB/lxpLNXUed15gFN3uVXFsif8
 CegXm4f+kK1xVrg5CzgzM2LIowzYsFUKzfSZfyFg4PoTKylIXaqTtrymgh+8hy7zLWio
 0oh1qbOwNvkA2++pPPSv4NhN5OVC9ahMQaX4Gj4MpdYAVAGDxIh8Q70xDkYwO8btGRPw
 /m5vIsRyIX1gMH6U4EVf8nBEYCH2poXcR7RGbPiedy9ukfxssRq6QJRxp20SRlmroMEq
 /I3cnHCjVVlV/jwPX1QpDALBsJ0zLIzk70uTMxnnMO3WqsBxIhm0z6I55OegtBN9q/Ll
 APvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGayZoXi3pQPn3wkI6WvROhQjDz5umBFKr0HJIOFy+U3/5e2iUsdt3OQ7r2lrIbLreb3uAPkZ36w==@nongnu.org
X-Gm-Message-State: AOJu0Yw6dm3LgRSsfzvvIQMXpvZBW+wL+HBuUmWYF+EMtD6RFhS4Xiew
 yx8Az30wS4Bi+zp6RBjoQL604Ah7WDRXj2ckDlMEuYTGaNIqSnnDtEp4Og==
X-Gm-Gg: ASbGncvNk74SQ43PnQeGgHzRkhPgyNL7yvIJg5venVu40KSCnZySX4/bfldOm/v4hY6
 IYINjqQik8A9ioxuJuxIHag5tbAyns48p9ofKDFYWmE7ZHwnCNhQTAYQUMMHDTY6cGryiGpkXCJ
 fQidvPtDaGhqvHx6Fy1+fBqp+tOvyLEWAB9xsTqFQZLFUEYbyYLUgUaDU5JTIMK9Jjba17srYXV
 sRHYnGemJV7ijoqFJSu7Ifwhncxi3cNXBWNpqDYjA6qf/cGDjhAmC5nUpCncb7Y4K4CyvzRU8rl
 R6oZR22tT5DmjGMLtcvMI56sqpnu/6QaII//zRN7Y7tFJ8K5WmKYnjeaBBdZyBpC5cc5ent3/PM
 6TFs7RoCC2PXP
X-Received: by 2002:a17:906:f596:b0:ab2:b5f1:567d with SMTP id
 a640c23a62f3a-abc0da30be2mr936458666b.32.1740311253819; 
 Sun, 23 Feb 2025 03:47:33 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-011-167-038.77.11.pool.telefonica.de. [77.11.167.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba4b9ee98sm1240515466b.167.2025.02.23.03.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 03:47:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/18] hw/arm/fsl-imx8mp: Add GPIO controllers
Date: Sun, 23 Feb 2025 12:46:59 +0100
Message-ID: <20250223114708.1780-10-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223114708.1780-1-shentey@gmail.com>
References: <20250223114708.1780-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
X-TUID: Ivg3BtUEkkYR

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst |  1 +
 include/hw/arm/fsl-imx8mp.h    | 14 +++++++++
 hw/arm/fsl-imx8mp.c            | 55 ++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index 18a8fdd278..37d3630d09 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -14,6 +14,7 @@ The ``imx8mp-evk`` machine implements the following devices:
  * 4 UARTs
  * 3 USDHC Storage Controllers
  * 1 Designware PCI Express Controller
+ * 5 GPIO Controllers
  * Secure Non-Volatile Storage (SNVS) including an RTC
  * Clock Tree
 
diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index 4c70c887a8..18ea52d083 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -11,6 +11,7 @@
 
 #include "cpu.h"
 #include "hw/char/imx_serial.h"
+#include "hw/gpio/imx_gpio.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/misc/imx7_snvs.h"
 #include "hw/misc/imx8mp_analog.h"
@@ -29,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslImx8mpState, FSL_IMX8MP)
 
 enum FslImx8mpConfiguration {
     FSL_IMX8MP_NUM_CPUS         = 4,
+    FSL_IMX8MP_NUM_GPIOS        = 5,
     FSL_IMX8MP_NUM_IRQS         = 160,
     FSL_IMX8MP_NUM_UARTS        = 4,
     FSL_IMX8MP_NUM_USDHCS       = 3,
@@ -39,6 +41,7 @@ struct FslImx8mpState {
 
     ARMCPU             cpu[FSL_IMX8MP_NUM_CPUS];
     GICv3State         gic;
+    IMXGPIOState       gpio[FSL_IMX8MP_NUM_GPIOS];
     IMX8MPCCMState     ccm;
     IMX8MPAnalogState  analog;
     IMX7SNVSState      snvs;
@@ -202,6 +205,17 @@ enum FslImx8mpIrqs {
     FSL_IMX8MP_UART5_IRQ    = 30,
     FSL_IMX8MP_UART6_IRQ    = 16,
 
+    FSL_IMX8MP_GPIO1_LOW_IRQ  = 64,
+    FSL_IMX8MP_GPIO1_HIGH_IRQ = 65,
+    FSL_IMX8MP_GPIO2_LOW_IRQ  = 66,
+    FSL_IMX8MP_GPIO2_HIGH_IRQ = 67,
+    FSL_IMX8MP_GPIO3_LOW_IRQ  = 68,
+    FSL_IMX8MP_GPIO3_HIGH_IRQ = 69,
+    FSL_IMX8MP_GPIO4_LOW_IRQ  = 70,
+    FSL_IMX8MP_GPIO4_HIGH_IRQ = 71,
+    FSL_IMX8MP_GPIO5_LOW_IRQ  = 72,
+    FSL_IMX8MP_GPIO5_HIGH_IRQ = 73,
+
     FSL_IMX8MP_PCI_INTA_IRQ = 126,
     FSL_IMX8MP_PCI_INTB_IRQ = 125,
     FSL_IMX8MP_PCI_INTC_IRQ = 124,
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 791d24eec9..456fa47dc7 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -208,6 +208,11 @@ static void fsl_imx8mp_init(Object *obj)
         object_initialize_child(obj, name, &s->uart[i], TYPE_IMX_SERIAL);
     }
 
+    for (i = 0; i < FSL_IMX8MP_NUM_GPIOS; i++) {
+        g_autofree char *name = g_strdup_printf("gpio%d", i + 1);
+        object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
+    }
+
     for (i = 0; i < FSL_IMX8MP_NUM_USDHCS; i++) {
         g_autofree char *name = g_strdup_printf("usdhc%d", i + 1);
         object_initialize_child(obj, name, &s->usdhc[i], TYPE_IMX_USDHC);
@@ -355,6 +360,55 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(gicdev, serial_table[i].irq));
     }
 
+    /* GPIOs */
+    for (i = 0; i < FSL_IMX8MP_NUM_GPIOS; i++) {
+        static const struct {
+            hwaddr addr;
+            unsigned int irq_low;
+            unsigned int irq_high;
+        } gpio_table[FSL_IMX8MP_NUM_GPIOS] = {
+            {
+                fsl_imx8mp_memmap[FSL_IMX8MP_GPIO1].addr,
+                FSL_IMX8MP_GPIO1_LOW_IRQ,
+                FSL_IMX8MP_GPIO1_HIGH_IRQ
+            },
+            {
+                fsl_imx8mp_memmap[FSL_IMX8MP_GPIO2].addr,
+                FSL_IMX8MP_GPIO2_LOW_IRQ,
+                FSL_IMX8MP_GPIO2_HIGH_IRQ
+            },
+            {
+                fsl_imx8mp_memmap[FSL_IMX8MP_GPIO3].addr,
+                FSL_IMX8MP_GPIO3_LOW_IRQ,
+                FSL_IMX8MP_GPIO3_HIGH_IRQ
+            },
+            {
+                fsl_imx8mp_memmap[FSL_IMX8MP_GPIO4].addr,
+                FSL_IMX8MP_GPIO4_LOW_IRQ,
+                FSL_IMX8MP_GPIO4_HIGH_IRQ
+            },
+            {
+                fsl_imx8mp_memmap[FSL_IMX8MP_GPIO5].addr,
+                FSL_IMX8MP_GPIO5_LOW_IRQ,
+                FSL_IMX8MP_GPIO5_HIGH_IRQ
+            },
+        };
+
+        object_property_set_bool(OBJECT(&s->gpio[i]), "has-edge-sel", true,
+                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->gpio[i]), "has-upper-pin-irq",
+                                 true, &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), errp)) {
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, gpio_table[i].addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                           qdev_get_gpio_in(gicdev, gpio_table[i].irq_low));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
+                           qdev_get_gpio_in(gicdev, gpio_table[i].irq_high));
+    }
+
     /* USDHCs */
     for (i = 0; i < FSL_IMX8MP_NUM_USDHCS; i++) {
         static const struct {
@@ -415,6 +469,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_CCM:
         case FSL_IMX8MP_GIC_DIST:
         case FSL_IMX8MP_GIC_REDIST:
+        case FSL_IMX8MP_GPIO1 ... FSL_IMX8MP_GPIO5:
         case FSL_IMX8MP_PCIE1:
         case FSL_IMX8MP_PCIE_PHY1:
         case FSL_IMX8MP_RAM:
-- 
2.48.1

