Received: by 10.80.166.35 with SMTP id d32csp290580edc;
        Thu, 13 Oct 2016 02:47:10 -0700 (PDT)
X-Received: by 10.55.184.2 with SMTP id i2mr6098407qkf.47.1476352030564;
        Thu, 13 Oct 2016 02:47:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p88si5960656qtd.69.2016.10.13.02.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 02:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bucbW-0001ti-1g
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 05:47:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bucZn-0000x3-6n
	for qemu-devel@nongnu.org; Thu, 13 Oct 2016 05:45:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bucZl-0000oI-B7
	for qemu-devel@nongnu.org; Thu, 13 Oct 2016 05:45:22 -0400
Received: from li2-213.members.linode.com ([69.56.173.213]:52038
	helo=mail.zilogic.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>)
	id 1bucZg-0000bO-1y; Thu, 13 Oct 2016 05:45:16 -0400
Received: from toad.zilogic (unknown [183.83.51.200])
	by mail.zilogic.com (Postfix) with ESMTP id 0B31F1057B;
	Thu, 13 Oct 2016 05:45:02 -0400 (EDT)
From: Vijay Kumar B <vijaykumar@zilogic.com>
To: balrogg@gmail.com,
	peter.maydell@linaro.org
Date: Thu, 13 Oct 2016 15:14:45 +0530
Message-Id: <1476351885-8905-1-git-send-email-vijaykumar@zilogic.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.56.173.213
Subject: [Qemu-devel] [PATCH] pxa2xx: Auto-assign name for i2c bus in
 i2c_init_bus.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Vijay Kumar B <vijaykumar@zilogic.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JXPR0xBYZ0u2

If a name is provided, the same name is assigned to both the I2C
controllers. Leaving it NULL, causes names to be automatically
assigned with an ID suffix, giving unique names to each
controller. This helps us to uniquely identify each controller in the
device tree, for example when adding an I2C device.

Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>
Reviewed-by: Deepak S. <deepak@zilogic.com>
---
 hw/arm/pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 0241e07..9898287 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1505,7 +1505,7 @@ static void pxa2xx_i2c_initfn(Object *obj)
     PXA2xxI2CState *s = PXA2XX_I2C(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s->bus = i2c_init_bus(dev, "i2c");
+    s->bus = i2c_init_bus(dev, NULL);
 
     memory_region_init_io(&s->iomem, obj, &pxa2xx_i2c_ops, s,
                           "pxa2xx-i2c", s->region_size);
-- 
2.1.4

