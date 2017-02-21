Received: by 10.103.98.197 with SMTP id w188csp375223vsb;
        Tue, 21 Feb 2017 05:04:01 -0800 (PST)
X-Received: by 10.55.169.75 with SMTP id s72mr18392135qke.300.1487682241620;
        Tue, 21 Feb 2017 05:04:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si15058259qkd.15.2017.02.21.05.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgA6r-0008Gq-49
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:04:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg9eb-0007ho-UB
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg9eZ-00085N-Cj
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:34:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cg9eU-00082B-Aj; Tue, 21 Feb 2017 07:34:42 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D1524E4F2;
	Tue, 21 Feb 2017 12:34:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LCYfBd012600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 21 Feb 2017 07:34:42 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D71811138657; Tue, 21 Feb 2017 13:34:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 13:34:32 +0100
Message-Id: <1487680479-15132-5-git-send-email-armbru@redhat.com>
In-Reply-To: <1487680479-15132-1-git-send-email-armbru@redhat.com>
References: <1487680479-15132-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 21 Feb 2017 12:34:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/11] hw: Default -drive to if=none instead of
 scsi when scsi cannot work
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lperOqh5fT6o

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
Message-Id: <1487153147-11530-5-git-send-email-armbru@redhat.com>
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

