Received: by 10.80.163.71 with SMTP id 65csp42561edn;
        Thu, 29 Sep 2016 22:54:50 -0700 (PDT)
X-Received: by 10.233.222.129 with SMTP id s123mr5175908qkf.83.1475214890471;
        Thu, 29 Sep 2016 22:54:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o91si10947879qtd.75.2016.09.29.22.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 22:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpqmX-0001V9-Bf
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 01:54:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpqmR-0001Tb-Us
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 01:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpqmN-0004HT-Re
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 01:54:42 -0400
Received: from li2-213.members.linode.com ([69.56.173.213]:36465
	helo=mail.zilogic.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>)
	id 1bpqmN-0004F4-Lw; Fri, 30 Sep 2016 01:54:39 -0400
Received: from toad.zilogic (unknown [49.206.125.246])
	by mail.zilogic.com (Postfix) with ESMTP id 2D4911057B;
	Fri, 30 Sep 2016 01:54:26 -0400 (EDT)
From: Vijay Kumar B <vijaykumar@zilogic.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Sep 2016 11:24:07 +0530
Message-Id: <1475214847-28575-1-git-send-email-vijaykumar@zilogic.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.56.173.213
Subject: [Qemu-arm] [PATCH] pxa2xx: Add a reset handler to reset the ARM CPU.
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, balrogg@gmail.com,
	Vijay Kumar B <vijaykumar@zilogic.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1e7N04MkA4iH

Currently the CPU does not get reset when the system_reset command is
invoked. We register a handler in the pxa2xx SoC code, to reset the
CPU as well.

Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>
Reviewed-by: Deepak S. <deepak@zilogic.com>
---
 hw/arm/pxa2xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 0241e07..08223b7 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2056,6 +2056,12 @@ static void pxa2xx_reset(void *opaque, int line, int level)
     }
 }
 
+static void pxa_reset_cb(void *opaque)
+{
+    PXA2xxState *s = opaque;
+    cpu_reset(CPU(s->cpu));
+}
+
 /* Initialise a PXA270 integrated chip (ARM based core).  */
 PXA2xxState *pxa270_init(MemoryRegion *address_space,
                          unsigned int sdram_size, const char *revision)
@@ -2192,6 +2198,8 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     /* GPIO1 resets the processor */
     /* The handler can be overridden by board-specific code */
     qdev_connect_gpio_out(s->gpio, 1, s->reset);
+
+    qemu_register_reset(pxa_reset_cb, s);
     return s;
 }
 
-- 
2.1.4

