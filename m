Received: by 10.103.124.15 with SMTP id x15csp523298vsc;
        Fri, 19 May 2017 17:28:09 -0700 (PDT)
X-Received: by 10.237.60.207 with SMTP id e15mr13250475qtf.106.1495240089171;
        Fri, 19 May 2017 17:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495240089; cv=none;
        d=google.com; s=arc-20160816;
        b=diSGCMNhEpzZTQ7+qVHyV0CthYmPCGnignZCeVBA8B7dWS1FCKwhaQemkPGXmvcRfo
         MG/OEX1cWVatRsPcT7rEn7LJ56+sISJNejYoM+l7MH1DcDMiBPbbTCW39X+z3clm/s/W
         XOfUxbZwDT2Bw8lKqN1jyoNNO5+7/mD4DGcg5CfHSn8Xr1VaUIO4bU39jVYu7LRT0Rv9
         hU9fpgHQndONzfibB2NlSIMuWJLkyccFvo9V2jgTgfU9e0igyaJW83NHmPc+5rMfx2nx
         zOF7+AM6lqnPJO5B0P57M09G5UzEi5Qnx9f11gZR6Wq7SCDnK6lZuUNjmaM+PIcvcqNW
         O14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bEidNuZadtg+gfp/qngfZt03GLwTKGxQo146dgMPOiI=;
        b=wG6cuRuOxqLjKM1E/Dr6kKHk+4E/dkNvm922004G98mg9F8plq1gAm+vWewL/o5+Nw
         1czfx3tgVmgtwkXydvhyi7pKLZy+7jmXjVqTzQKgkc0F+OR9yPIpH7PR16LNhUTG+D41
         2xlZ3Qcx6Wy889ktCQ+Z4wrQYIocDxdtZp/2TYkZtqvici5+PrGTODJLDocMAyBZnTT2
         DKx2Li3LpXNSHcgELaRj5rOvvdIq94eNUg8RiJ9E+1U5v5leJwkfJVDIN3igIMZRo0X2
         vbZWP05nqWX+7qUd/e11lv2N2JhirUv+uNP3Ofpm4SHjWiMDMZHqWcbhaZTViDVJPKka
         5BvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30si10323274qtm.116.2017.05.19.17.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 17:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBsFc-0004Nz-OV
	for alex.bennee@linaro.org; Fri, 19 May 2017 20:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBsFR-0004FD-Qu
	for qemu-arm@nongnu.org; Fri, 19 May 2017 20:27:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBsFQ-0001aw-U1
	for qemu-arm@nongnu.org; Fri, 19 May 2017 20:27:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39673)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dBsFQ-0001am-Pg; Fri, 19 May 2017 20:27:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 53738206CA;
	Fri, 19 May 2017 20:27:56 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 19 May 2017 20:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=bEidNu
	Zadtg+gfp/qngfZt03GLwTKGxQo146dgMPOiI=; b=p02qc5tpoT6gpW3CwyA21y
	DvCkQdUOdjh+mzmHHYsallkL3a7d+xQDwm4DCFGBsND1OMEAkpMQVJXp6vaROjgz
	MMUXMyk/QyL744uUy2l/oERvecHrXn0CxWBT66//Y/8BYwE+Stkv6PwozC9SSKLu
	MFPBFUAXwrHfzckHxkKj6cbv3dCs/3TpdQikf0faMA7iDI3Hzr32v0eVbEC3unHX
	uaCKhq9S4aWoFZUDY41ZP0DusdyPHfH95IfxK8EJeA6lT0vslTlTfjHuTJLBhUVR
	hTGvSAMpVpHCAWxRdntJOZAIeV0b/kO7PSnIPCpqHAwCyZkX2uxsWdj+Env8uxnA
	==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=bEidNuZadtg+gfp/qngfZt03GLwTKGxQo146dgMPO
	iI=; b=YdAFJ9wsUflSbYbLS6TRbVDa2aVYupzjwlOlGLPP3/w9Q/ewWdC25XSPD
	iDezwcJVvN1xIcGcpHYjWsOkhZYj93Cg2ACEAssd2QQpsGcZXHT4qCPg+PmajQ7v
	mR6EQOOGxQzjQsSCt0SFJ8qarQ/1xeZKmhV6BcJOZnMcm7QxDPdNFaKtpjAg3ZHr
	qQU/LIZfKHw9ImnjXJ9KrR4o/Yu40g0t9sSmubLsRRODVyAGExN7mQMgFn/LVi4M
	1rFfJHqHEWSaSkMns7yrYa42VE0eemaKpQc9Hqt2HiHiQ3O/bx07MD1N0Va1Lmow
	fMzpVtfNvnxXHfRIP1KLqQeYK2eag==
X-ME-Sender: <xms:jI0fWQLLS24FWb8g-H04B8ZDYzDCYLvPZx5jQ0yRHisgTtMGQh-2ew>
X-Sasl-enc: FmgCG6i+EeaDL5ia7NKH38wcyyCzgIj8bsQO6/STIBgO 1495240075
Received: from keelia.au.ibm.com (unknown [202.90.207.97])
	by mail.messagingengine.com (Postfix) with ESMTPA id 43391241E3;
	Fri, 19 May 2017 20:27:49 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Sat, 20 May 2017 08:26:53 +0800
Message-Id: <20170520002653.20213-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170520002653.20213-1-andrew@aj.id.au>
References: <20170520002653.20213-1-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH 2/2] hw/arm: Integrate ADC model into Aspeed SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: czxrAd3R6mlK

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c         | 15 +++++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5c667d2c35b6..11f9588720d2 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -31,6 +31,7 @@
 #define ASPEED_SOC_VIC_BASE         0x1E6C0000
 #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
 #define ASPEED_SOC_SCU_BASE         0x1E6E2000
+#define ASPEED_SOC_ADC_BASE         0x1E6E9000
 #define ASPEED_SOC_SRAM_BASE        0x1E720000
 #define ASPEED_SOC_TIMER_BASE       0x1E782000
 #define ASPEED_SOC_WDT_BASE         0x1E785000
@@ -157,6 +158,10 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
 
+    object_initialize(&s->adc, sizeof(s->adc), TYPE_ASPEED_ADC);
+    object_property_add_child(obj, "adc", OBJECT(&s->adc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->adc), sysbus_get_default());
+
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
@@ -256,6 +261,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
 
+    /* ADC */
+    object_property_set_bool(OBJECT(&s->adc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, ASPEED_SOC_ADC_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+            qdev_get_gpio_in(DEVICE(&s->vic), 31));
+
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d16205c66b5f..3b4d66d30f08 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -15,6 +15,7 @@
 #include "hw/arm/arm.h"
 #include "hw/intc/aspeed_vic.h"
 #include "hw/misc/aspeed_scu.h"
+#include "hw/adc/aspeed_adc.h"
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
@@ -37,6 +38,7 @@ typedef struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
+    AspeedADCState adc;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
-- 
2.9.3

