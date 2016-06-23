Received: by 10.25.21.96 with SMTP id l93csp289398lfi;
        Wed, 22 Jun 2016 19:16:44 -0700 (PDT)
X-Received: by 10.55.110.65 with SMTP id j62mr42756898qkc.112.1466648204527;
        Wed, 22 Jun 2016 19:16:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t64si3204163qtd.22.2016.06.22.19.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 19:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFuCB-0003JB-Qz
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 22:16:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC7-0003HW-JV
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC0-000731-Oj
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:38 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:42008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bFuBy-000714-FF; Wed, 22 Jun 2016 22:16:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2A7EABAB;
	Wed, 22 Jun 2016 22:16:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 22 Jun 2016 22:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=38KG8DPcmRXtaDs7F6Qd39ZebMI
	=; b=MmsHyVD8b909lLBF9IFOx3/E/b5KnCzeFuTTrwLidylq805E3vJ0+CFkaUZ
	mfulYrTjMuhElxTtwlhKLfyOAGMiVoWIG+YEQJa2/7O0UA3j7KZVPe3t2E8yp2Qh
	sCIXbC0FnXAjiVkT7V0fLSBFzZGLxjzw0/IPjikAPBA5XaFs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=38KG
	8DPcmRXtaDs7F6Qd39ZebMI=; b=VV+r7f200rnRRt1eMxS6PhoCtMTGZW88YhGw
	KIF5LLiVyFBDWtJqjw6tToybHvxvIZ/vyvgcmMUSR5nr6teA3TqWei2SSnCKWpZB
	fkuk11R19oKqfK3WUZRa8iX1/Z1IKH43uRSLG3fikKsn3LaNAwjLcmsAXRmxjdgg
	2sxZFvE=
X-Sasl-enc: QYSkqOCpedTq8Tpkr2QywYc/GDRhvkFvbXDaLWTqRajG 1466648179
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 83290F29FA;
	Wed, 22 Jun 2016 22:16:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 11:45:14 +0930
Message-Id: <1466648115-17015-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v2 2/3] ast2400: Integrate the SCU model and set
 silicon revision
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
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xatyl4XtRMXW

By specifying the silicon revision we select the appropriate reset
values for the SoC.

Additionally, expose hardware strapping properties aliasing those
provided by the SCU for board-specific configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Since v1:

* Remove reset value configuration
* Configure SoC silicon revision in the SCU via property
* Alias the SCU's hardware strapping properties to expose them to boards

 hw/arm/ast2400.c         | 17 +++++++++++++++++
 include/hw/arm/ast2400.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 4a9de0e10cbc..1a26d74e695c 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -24,6 +24,7 @@
 #define AST2400_IOMEM_SIZE       0x00200000
 #define AST2400_IOMEM_BASE       0x1E600000
 #define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
 
@@ -72,6 +73,14 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
     object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
+    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
+    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
+    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
+                              "hw-strap1", &error_abort);
+    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
+                              "hw-strap2", &error_abort);
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -110,6 +119,14 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* SCU */
+    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2400_SCU_BASE);
+
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index c05ed5376736..f1a64fd3893d 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -14,6 +14,7 @@
 
 #include "hw/arm/arm.h"
 #include "hw/intc/aspeed_vic.h"
+#include "hw/misc/aspeed_scu.h"
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
 
@@ -27,6 +28,7 @@ typedef struct AST2400State {
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedSCUState scu;
 } AST2400State;
 
 #define TYPE_AST2400 "ast2400"
-- 
2.7.4

