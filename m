Received: by 10.25.77.65 with SMTP id a62csp1835127lfb;
        Wed, 15 Feb 2017 02:06:11 -0800 (PST)
X-Received: by 10.237.43.167 with SMTP id e36mr34882891qtd.245.1487153170926;
        Wed, 15 Feb 2017 02:06:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g55si2478024qta.65.2017.02.15.02.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Feb 2017 02:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdwTQ-0006cl-5k
	for alex.bennee@linaro.org; Wed, 15 Feb 2017 05:06:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cdwTE-0006ZU-KE
	for qemu-arm@nongnu.org; Wed, 15 Feb 2017 05:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cdwT9-0001ds-Ko
	for qemu-arm@nongnu.org; Wed, 15 Feb 2017 05:05:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cdwT9-0001cz-5X; Wed, 15 Feb 2017 05:05:51 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C57738047D;
	Wed, 15 Feb 2017 10:05:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1FA5nFH023545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 15 Feb 2017 05:05:50 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DF1C311384B0; Wed, 15 Feb 2017 11:05:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 Feb 2017 11:05:43 +0100
Message-Id: <1487153147-11530-5-git-send-email-armbru@redhat.com>
In-Reply-To: <1487153147-11530-1-git-send-email-armbru@redhat.com>
References: <1487153147-11530-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 15 Feb 2017 10:05:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 4/8] hw: Default -drive to if=none instead of
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
	qemu-arm@nongnu.org, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aNDUQh9/WfQK

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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
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
index e057568..c6b1e67 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -752,7 +752,6 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
 
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

