Received: by 10.25.208.137 with SMTP id h131csp1683171lfg;
        Mon, 9 May 2016 10:30:26 -0700 (PDT)
X-Received: by 10.140.29.165 with SMTP id b34mr35861635qgb.100.1462815023458;
        Mon, 09 May 2016 10:30:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v96si2184440qge.76.2016.05.09.10.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp0h-00043y-0A
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:30:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0d-0003xv-Rg
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0c-0000Ge-R7
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0c-00005k-Hd; Mon, 09 May 2016 13:30:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0O-0001W1-0X; Mon, 09 May 2016 18:30:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:47 +0100
Message-Id: <1462814989-24360-22-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 21/23] hw/intc/arm_gicv3: Work around Linux
 assuming interrupts are group 1
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d10PG+AAZrem

The Linux kernel's GICv3 driver assumes that all interrupts are in
group 1. This is correct if the system supports the Security extensions,
because in that case the kernel cannot configure the interrupts and
it must have been done already by firmware. However if the system does
not support the Security extensions then the kernel is perfectly capable
of configuring them into group 1 itself if it wants them there; it
just doesn't.

Work around this by having the GICv3 emulation put all the interrupts
into group 1 if we're directly booting a Linux kernel, whether the
Security extensions are supported or not.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 901ec60..73d3c6d 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -288,6 +288,13 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
          * equivalent).
          */
         s->irq_reset_nonsecure = true;
+    } else {
+        /* This is purely a workaround for broken Linux kernel behaviour
+         * on non-TrustZone systems. It assumes that interrupts have been
+         * set to group 1 even though it could do that itself for a non-secure
+         * GIC.
+         */
+        s->irq_reset_nonsecure = true;
     }
 }
 
-- 
1.9.1

