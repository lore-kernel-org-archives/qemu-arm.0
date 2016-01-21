Received: by 10.25.159.19 with SMTP id i19csp3701850lfe;
        Thu, 21 Jan 2016 04:55:09 -0800 (PST)
X-Received: by 10.140.107.182 with SMTP id h51mr51221305qgf.53.1453380909462;
        Thu, 21 Jan 2016 04:55:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g128si1193094qkb.78.2016.01.21.04.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 04:55:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMElZ-0006ID-2g
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 07:55:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aMElW-0006HX-BO
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 07:55:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aMElR-0005G3-B4
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 07:55:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aMElR-0005Fc-4b; Thu, 21 Jan 2016 07:55:01 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 502CD29B224;
	Thu, 21 Jan 2016 12:55:00 +0000 (UTC)
Received: from apm-mustang-ev3-03.lab.eng.brq.redhat.com
	(apm-mustang-ev3-03.lab.eng.brq.redhat.com [10.34.42.82])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0LCsvJo011925; Thu, 21 Jan 2016 07:54:58 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 13:54:53 +0100
Message-Id: <1453380893-26174-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, zhaoshenglong@huawei.com
Subject: [Qemu-arm] [PATCH] virt-acpi-build: add always-on property for timer
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
X-TUID: pplQYefnrw1E

This patch is the ACPI equivalent of "hw/arm/virt: Add always-on
property to the virt board timer". The timer is always on, and
thus setting this informs Linux that it may switch off the periodic
timer. Switching off the periodic timer substantially reduces the
number of interrupts the host needs to inject.

Testing note: AArch64 guests (the only ones currently booting with
ACPI) do not actually need this patch to determine it can turn the
periodic timer off. I therefore used a hacked guest kernel to ensure
this patch works as the equivalent DT patch does.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 87fbe7c97d99b..f6e538f3d02ea 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -443,7 +443,7 @@ build_gtdt(GArray *table_data, GArray *linker)
     gtdt->secure_el1_flags = ACPI_EDGE_SENSITIVE;
 
     gtdt->non_secure_el1_interrupt = ARCH_TIMER_NS_EL1_IRQ + 16;
-    gtdt->non_secure_el1_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->non_secure_el1_flags = ACPI_EDGE_SENSITIVE | ACPI_GTDT_ALWAYS_ON;
 
     gtdt->virtual_timer_interrupt = ARCH_TIMER_VIRT_IRQ + 16;
     gtdt->virtual_timer_flags = ACPI_EDGE_SENSITIVE;
-- 
1.8.3.1

