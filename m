Received: by 10.25.21.96 with SMTP id l93csp858413lfi;
        Thu, 23 Jun 2016 22:00:03 -0700 (PDT)
X-Received: by 10.55.197.149 with SMTP id k21mr2328628qkl.89.1466744403507;
        Thu, 23 Jun 2016 22:00:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j75si3561108qkh.196.2016.06.23.22.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 22:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGJDn-0004W1-0G
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 01:00:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDf-0004S7-Sc
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDa-0001Wp-32
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:59:54 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bGJDX-0001Vx-Q8; Fri, 24 Jun 2016 00:59:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailnew.nyi.internal (Postfix) with ESMTP id 88401C28;
	Fri, 24 Jun 2016 00:59:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 24 Jun 2016 00:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=nps5bkkDlkAcZq0mEbDoHlm6oR0=; b=hrmctx
	VMkeds012Z8kw6aioXt2UEt0ruVEzXGqV03v8nY7e2OmFjBqZnfNtFBKGNgjKBM6
	gp5GM3oQQKIXWe9YUvRP/PWc0GUYsGTTR7wP2us5o53XANyfFOVn0cmz8tDGoE5z
	H7OpiqEtRirl3WJGcvMoxdhDV7+E2kgCqbX0w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=nps5bkkDlkAcZq0
	mEbDoHlm6oR0=; b=awq+ecEx40cCgYDxBW2uYzMzJjVQsAbYx9/41kYa89R9lXU
	LF9gVaOD4jnvBi0GtmMCMV1Ax7nyak1EmUr8J7zEVXRgVgNVcJjzTqTBVysxkPzU
	Ks/GneDpgOY0I/A31Kws5O7sdwl6B3TWKbCQHDZlhgt4blMwMwqDdbeQ3ADk=
X-Sasl-enc: s0TnX7DUgygvP6e34si91s2RB5b+rVDqO4C6Prp0mywS 1466744381
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id B2E1FF29EE;
	Fri, 24 Jun 2016 00:59:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 14:28:24 +0930
Message-Id: <1466744305-23163-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v3 2/3] ast2400: Integrate the SCU model and set
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
X-TUID: tJJRB0jtgNcU

By specifying the silicon revision we select the appropriate reset
values for the SoC.

Additionally, expose hardware strapping properties aliasing those
provided by the SCU for board-specific configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
Since v2:

* Configure SoC silicon revision in the SCU via silicon-rev property

Since v1:

* Remove reset value configuration
* Alias the SCU's hardware strapping properties to expose them to boards

 hw/arm/ast2400.c         | 21 +++++++++++++++++++++
 include/hw/arm/ast2400.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 4a9de0e10cbc..b14a82fcdef1 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -24,9 +24,12 @@
 #define AST2400_IOMEM_SIZE       0x00200000
 #define AST2400_IOMEM_BASE       0x1E600000
 #define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
 
+#define AST2400_A0_SILICON_REV   0x02000303
+
 static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
 
@@ -72,6 +75,16 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
     object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
+    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
+    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
+    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
+                         AST2400_A0_SILICON_REV);
+    object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
+                              "hw-strap1", &error_abort);
+    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
+                              "hw-strap2", &error_abort);
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -110,6 +123,14 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
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

