Received: by 10.25.77.65 with SMTP id a62csp1103002lfb;
        Mon, 23 Jan 2017 01:49:05 -0800 (PST)
X-Received: by 10.55.174.3 with SMTP id x3mr1973025qke.162.1485164945701;
        Mon, 23 Jan 2017 01:49:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c41si10403706qta.309.2017.01.23.01.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jan 2017 01:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVbFH-0006Xh-2T
	for alex.bennee@linaro.org; Mon, 23 Jan 2017 04:49:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVbF5-0006Pi-GL
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 04:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVbF1-0003qn-Vk
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 04:48:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cVbF1-0003qV-Q2; Mon, 23 Jan 2017 04:48:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D617E81247;
	Mon, 23 Jan 2017 09:48:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-93.ams2.redhat.com
	[10.36.117.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0N9mkPb012111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 23 Jan 2017 04:48:47 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5ADA6113864A; Mon, 23 Jan 2017 10:48:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Jan 2017 10:48:42 +0100
Message-Id: <1485164923-17736-6-git-send-email-armbru@redhat.com>
In-Reply-To: <1485164923-17736-1-git-send-email-armbru@redhat.com>
References: <1485164923-17736-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 23 Jan 2017 09:48:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 5/6] hw/arm/highbank: Default -drive to if=ide
 instead of if=scsi
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
Cc: kwolf@redhat.com, Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtKXZk/3eqsH

These machines have no onboard SCSI HBA, and no way to plug one.
-drive if=scsi therefore cannot work.  They do have an onboard IDE
controller (sysbus-ahci), but fail to honor if=ide.

Change their default to if=ide, and add a TODO comment on what needs
to be done to actually honor -drive if=ide.

Cc: Rob Herring <robh@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/highbank.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 80e5fd4..0a4508c 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -363,6 +363,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, pic[82]);
     }
 
+    /* TODO create and connect IDE devices for ide_drive_get() */
+
     highbank_binfo.ram_size = ram_size;
     highbank_binfo.kernel_filename = kernel_filename;
     highbank_binfo.kernel_cmdline = kernel_cmdline;
@@ -405,7 +407,8 @@ static void highbank_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Calxeda Highbank (ECX-1000)";
     mc->init = highbank_init;
-    mc->block_default_type = IF_SCSI;
+    mc->block_default_type = IF_IDE;
+    mc->units_per_default_bus = 1;
     mc->max_cpus = 4;
 }
 
@@ -421,7 +424,8 @@ static void midway_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Calxeda Midway (ECX-2000)";
     mc->init = midway_init;
-    mc->block_default_type = IF_SCSI;
+    mc->block_default_type = IF_IDE;
+    mc->units_per_default_bus = 1;
     mc->max_cpus = 4;
 }
 
-- 
2.7.4

