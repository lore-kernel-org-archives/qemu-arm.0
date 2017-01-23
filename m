Received: by 10.25.77.65 with SMTP id a62csp1102984lfb;
        Mon, 23 Jan 2017 01:49:02 -0800 (PST)
X-Received: by 10.200.45.48 with SMTP id n45mr23561319qta.52.1485164941912;
        Mon, 23 Jan 2017 01:49:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si10416314qkk.223.2017.01.23.01.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jan 2017 01:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVbFD-0006Q4-7a
	for alex.bennee@linaro.org; Mon, 23 Jan 2017 04:48:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVbF4-0006Pe-LA
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 04:48:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVbF0-0003qC-Is
	for qemu-arm@nongnu.org; Mon, 23 Jan 2017 04:48:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cVbF0-0003pr-D0; Mon, 23 Jan 2017 04:48:46 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43E5C61B98;
	Mon, 23 Jan 2017 09:48:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-93.ams2.redhat.com
	[10.36.117.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0N9miV4012103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 23 Jan 2017 04:48:45 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 581EA1138649; Mon, 23 Jan 2017 10:48:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Jan 2017 10:48:41 +0100
Message-Id: <1485164923-17736-5-git-send-email-armbru@redhat.com>
In-Reply-To: <1485164923-17736-1-git-send-email-armbru@redhat.com>
References: <1485164923-17736-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 23 Jan 2017 09:48:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/6] hw: Default -drive to if=none instead of
 scsi when scsi cannot work
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eHroDTYl2Fzu

Block backends defined with -drive if=scsi are meant to be picked up
by machine initialization code: a suitable frontend gets created and
wired up automatically.

if=scsi drives not picked up that way can still be used with -device
as if they had if=none, but that's unclean and best avoided.  Unused
ones produce an "Orphaned drive without device" warning.

A few machine types default to if=scsi, even though they don't
actually have a SCSI HBA.  This makes no sense.  Change their default
to if=none.  Affected machines:

* aarch64/arm: realview-pbx-a9 vexpress-a9 vexpress-a15 xilinx-zynq-a9

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/realview.c    | 1 -
 hw/arm/vexpress.c    | 1 -
 hw/arm/xilinx_zynq.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 8eafcca..8c11c7a 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -443,7 +443,6 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "ARM RealView Platform Baseboard Explore for Cortex-A9";
     mc->init = realview_pbx_a9_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
 }
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58760f4..5756470 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -751,7 +751,6 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "ARM Versatile Express";
     mc->init = vexpress_common_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
 }
 
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 7dac20d..3985356 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -323,7 +323,6 @@ static void zynq_machine_init(MachineClass *mc)
 {
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 1;
     mc->no_sdcard = 1;
 }
-- 
2.7.4

