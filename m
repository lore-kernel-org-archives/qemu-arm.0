Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp220353njl;
        Thu, 30 Jan 2025 03:27:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJu7eEAoijqQcKYiup7tJPci8SsqGx+Jq+KKIAYXpvvCFIchwEjeGGly8Q+j2KMjW0jsxBp+4wZamBBA==@linaro.org
X-Google-Smtp-Source: AGHT+IEu+nyTlavrkpRm6cXLjhBexUgR6nkoJ8IH3/6Xx1B0WkS7M/ngNhIuYnrfPL9pdpClvRqe
X-Received: by 2002:ac8:7dca:0:b0:46c:82dd:9a67 with SMTP id d75a77b69052e-46fd0acd528mr129128091cf.28.1738236445662;
        Thu, 30 Jan 2025 03:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738236445; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzHhsVr45MkFO1Syxa8wNLyaywRLG02UPa1LLsj+/oCEYaQtremb2JqP/U3lNMqsSW
         AdZFPvi2jpXAjR6orfn5rgeGQ29nd0NFsY/25uChxkRF+KueLwTzNh2GdKwa2VvNhsnH
         00+sci3CTLT3XTdYeBE0hd/ooqbbHSqKrPEaQiGE3YTyrnyROUtFvQlNeh1v1ofXYkGN
         NLe7T9nd6XPpZLxtNflE1nQ/FDSPfXBwMTqZV78uECPRBHXzR5y+WSNZHw/1rvizzyeu
         fw0XCt7UKA5ketOGWObxTxy15wXamTe+5qACRFWMyR41te2VCCAzVc23kad4WfDF1U3m
         RzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y10l/HYlkhSToy5oRoIjMOJTqZRFYA42fVDeO+zru8o=;
        fh=wXYnM2Xe6CLi/jjNhqKsBwYc7XquNHKu73845APGzhA=;
        b=Y0XOpSgiOZMITfmxeVrQXtftLtXEUcGTL5yP9WogVM+goyXSV3plyuNCMrH84zrfHt
         vjgYPgb6SiZVipGJmmzk0iYkw3m4r9adqGPURgQP64rc+pGEBfpD4YgjS4iQEuNEucns
         WxcZodbGph7VEssOBuyGK8jQclRLG/48e1FEHaH+I4GnAVxsY3jM7f0Cc6hOEtchQcfj
         Ryfy6n6maj61fKmYmg4EZ3qiaStMrEM6ytHNF3IpHfuJbfuzVTNc4u+JUnE8P4hXd3or
         Oj05uI2tckWYFBX4bb0JxsN79PeNOSJ0ngNgwccN0jHaH6rSM2QBPvWta6IZ6s0JLLWA
         o7bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eAjTQ/pY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab785si15100861cf.65.2025.01.30.03.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 03:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eAjTQ/pY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdSh0-0001Ww-5X; Thu, 30 Jan 2025 06:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSgx-0001W5-Tu
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 06:26:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSgw-0001j9-40
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 06:26:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso539748f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 03:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738236396; x=1738841196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y10l/HYlkhSToy5oRoIjMOJTqZRFYA42fVDeO+zru8o=;
 b=eAjTQ/pYa+pZDnE1segUvZPCgAe64h06DiCBAMUuHodK0tQI/n8idnrFQ/JzqW9ndf
 S6bJLR3HQeY1dszRYDXlgxsw52gf6OMee8UjQcKSMycrcEA99QWqqNIfDEu7pLIW3dWX
 H49jdfo6rtsM3hMAyXQteim8g/U/gc22191GLGcSnsJTm4uVSN9+p5ZFvlTr661ikiw/
 l+zDp5GZUz1YxuK4mhAB0mJdJo9feBG23NJ99o3Dur7vNgEO1z9pKnu8+yDXg/HZFLwE
 aJ6zX370pQszhzB1FMOC8RC7wBYxizsZ2pOc/015y49BQtjew9cvwCsFLPkjGIfd/GwJ
 IK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738236396; x=1738841196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y10l/HYlkhSToy5oRoIjMOJTqZRFYA42fVDeO+zru8o=;
 b=ErxQ/8McNEBUtpk3Q9ep507pMeamrQjukVEL0FndghH/uQgQ0uk6RhKqenyz5vw3/C
 mL0tziFfOFGsj3Y2ayVyo5SRSqJWC6eN+3oTcSfvOYagJ0k16IcyNWSadHV+3B8rFuYT
 pwHF+73teP/qZFJeMV6R3BFxV6jigJnvfZJlMfowcC1WJRF+LfrK0uz8UCM0xnSfnQhm
 B4fWBgXD5MHdjvnkrmssd0zRFj8rVb+Uc1zAyVw73Q8XjCbem4yCIeVYPSC47KTJenRC
 a+C+yex1bNMwsgnuFyCrNoyAsWjkoN4yuNsPIYRDiCOkauM+pBRjbkCV+nxs1vVlBF+3
 ouLQ==
X-Gm-Message-State: AOJu0YwNjLqSbf/3Jl2wvMS2n2RbWVWLVh67ELHO1pQ1agzDUhGOg4qp
 Z+4UJvOTuU9Yy5d4a2u6pjSBvnkl+ntrO5vvF/mk/i1ABdlwMOzJWPv3BEA+VJo=
X-Gm-Gg: ASbGncsU8ke26PUDKXZzC3GXkpabXYVMQu+ZYeyLtX0bMhHVPFhNwKd71AAIyAKdjFe
 v19xyvWW9XX4fEEy4crZaMrkUXS7jrQjk4petCy20aU3qREPQycKjpvVilIyrB6H91vaVlUgshq
 64uI+1c0lVRo/zBRHu534SR8kflouXgfrZYDqnHIk9LwxxTnh2R1zGymEBO/CAPm94Ygju3bx9L
 98MYuYjfVelL7r2lRcYdAkbzhUhNgP0M+g7ZrqrWD00o/Hnl8N9LI9dsjPyUos4hQPOJ3koYKYE
 53EjXTZoQT9pSa9ik6/tnCVc6wSdjlXitubXqlYvxS8sbrTDjxKUuGAfVkcAUQJPPg==
X-Received: by 2002:a5d:47c8:0:b0:38c:1270:f96b with SMTP id
 ffacd0b85a97d-38c520af7a5mr5173742f8f.45.1738236396533; 
 Thu, 30 Jan 2025 03:26:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b61f1sm1719272f8f.68.2025.01.30.03.26.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 03:26:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 4/6] hw/arm/fsl-imx7: Add local 'mpcore/gic' variables
Date: Thu, 30 Jan 2025 12:26:13 +0100
Message-ID: <20250130112615.3219-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130112615.3219-1-philmd@linaro.org>
References: <20250130112615.3219-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GCTncHwl6uqw

The A7MPCore forward the IRQs from its internal GIC.
To make the code clearer, add the 'mpcore' and 'gic'
variables.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c | 52 +++++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 004bf499376..3374018cde0 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -166,7 +166,8 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX7State *s = FSL_IMX7(dev);
-    Object *o;
+    DeviceState *mpcore = DEVICE(&s->a7mpcore);
+    DeviceState *gic;
     int i;
     qemu_irq irq;
     char name[NAME_SIZE];
@@ -182,7 +183,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
      * CPUs
      */
     for (i = 0; i < smp_cpus; i++) {
-        o = OBJECT(&s->cpu[i]);
+        Object *o = OBJECT(&s->cpu[i]);
 
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
@@ -205,16 +206,15 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     /*
      * A7MPCORE
      */
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", smp_cpus,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
+    object_property_set_int(OBJECT(mpcore), "num-cpu", smp_cpus, &error_abort);
+    object_property_set_int(OBJECT(mpcore), "num-irq",
                             FSL_IMX7_MAX_IRQ + GIC_INTERNAL, &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(mpcore), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(mpcore), 0, FSL_IMX7_A7MPCORE_ADDR);
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX7_A7MPCORE_ADDR);
-
+    gic = mpcore;
     for (i = 0; i < smp_cpus; i++) {
-        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(gic);
         DeviceState  *d   = DEVICE(qemu_get_cpu(i));
 
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
@@ -255,8 +255,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_realize(SYS_BUS_DEVICE(&s->gpt[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, FSL_IMX7_GPTn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_GPTn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_GPTn_IRQ[i]));
     }
 
     /*
@@ -298,12 +297,10 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                         FSL_IMX7_GPIOn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_GPIOn_LOW_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_GPIOn_LOW_IRQ[i]));
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_GPIOn_HIGH_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_GPIOn_HIGH_IRQ[i]));
     }
 
     /*
@@ -355,8 +352,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
                         FSL_IMX7_SPIn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_SPIn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_SPIn_IRQ[i]));
     }
 
     /*
@@ -381,8 +377,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, FSL_IMX7_I2Cn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_I2Cn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_I2Cn_IRQ[i]));
     }
 
     /*
@@ -416,7 +411,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, FSL_IMX7_UARTn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_UARTn_IRQ[i]);
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_UARTn_IRQ[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0, irq);
     }
 
@@ -454,9 +449,9 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_ENET_IRQ(i, 0));
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_ENET_IRQ(i, 0));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 0, irq);
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_ENET_IRQ(i, 3));
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_ENET_IRQ(i, 3));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 1, irq);
     }
 
@@ -483,7 +478,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
                         FSL_IMX7_USDHCn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_USDHCn_IRQ[i]);
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_USDHCn_IRQ[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usdhc[i]), 0, irq);
     }
 
@@ -522,8 +517,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX7_WDOGn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_WDOGn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_WDOGn_IRQ[i]));
     }
 
     /*
@@ -606,11 +600,11 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTD_MSI_IRQ);
     qdev_connect_gpio_out(DEVICE(&s->pcie4_msi_irq), 0, irq);
 
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTA_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTA_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 0, irq);
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTB_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTB_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 1, irq);
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTC_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTC_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 2, irq);
     irq = qdev_get_gpio_in(DEVICE(&s->pcie4_msi_irq), 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 3, irq);
@@ -643,7 +637,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX7_USBn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_USBn_IRQ[i]);
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_USBn_IRQ[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0, irq);
 
         snprintf(name, NAME_SIZE, "usbmisc%d", i);
-- 
2.47.1

