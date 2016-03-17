Received: by 10.25.208.211 with SMTP id h202csp345849lfg;
        Thu, 17 Mar 2016 03:33:21 -0700 (PDT)
X-Received: by 10.140.172.212 with SMTP id s203mr13296326qhs.41.1458210801729;
        Thu, 17 Mar 2016 03:33:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si7302994qhd.101.2016.03.17.03.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 03:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agVF3-0005QV-6s
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 06:33:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1agVF1-0005QC-9E
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 06:33:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1agVEx-0005GB-Cm
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 06:33:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1agVEx-0005G5-64; Thu, 17 Mar 2016 06:33:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1agVEt-0001Rc-KZ; Thu, 17 Mar 2016 10:33:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 17 Mar 2016 10:33:10 +0000
Message-Id: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: =?UTF-8?q?Antonio=20Huete=20Jim=C3=A9nez?= <tuxillo@quantumachine.net>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Subject: [Qemu-arm] [PATCH] hw/arm/bcm2836: Wire up CPU timer interrupts
	correctly
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TlsbuzWpNSFk

Wire up the CPU timer interrupts in the right order, with the
nonsecure physical timer on cntpnsirq, the hyp timer on cnthpirq,
and the secure physical timer on cntpsirq. (We did get the
virt timer right, at least.)

Reported-by: Antonio Huete Jiménez <tuxillo@quantumachine.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2836.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 89a6b35..1cefe41 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -136,9 +136,13 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
         /* Connect timers from the CPU to the interrupt controller */
         qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_PHYS,
-                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpnsirq", n));
         qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_VIRT,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", n));
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_HYP,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cnthpirq", n));
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_SEC,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
     }
 }
 
-- 
1.9.1

