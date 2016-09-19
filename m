Received: by 10.80.163.71 with SMTP id 65csp791081edn;
        Mon, 19 Sep 2016 13:04:33 -0700 (PDT)
X-Received: by 10.55.201.209 with SMTP id m78mr22532866qkl.308.1474315473070;
        Mon, 19 Sep 2016 13:04:33 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2si21145570qke.229.2016.09.19.13.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Sep 2016 13:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bm4no-0007aa-Gp
	for alex.bennee@linaro.org; Mon, 19 Sep 2016 16:04:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jakub@jermar.eu>) id 1bm4em-0000Xd-24
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 15:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jakub@jermar.eu>) id 1bm4ei-0007KV-UF
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 15:55:12 -0400
Received: from tmave.modry.cz ([82.208.58.129]:45238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jakub@jermar.eu>)
	id 1bm4ei-0007Hp-NW; Mon, 19 Sep 2016 15:55:08 -0400
Received: from 93-153-64-87.tmcz.cz ([93.153.64.87] helo=gorgo.localdomain)
	by tmave.modry.cz with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.86_2)
	(envelope-from <jakub@jermar.eu>)
	id 1bm4eT-00077H-As; Mon, 19 Sep 2016 21:55:05 +0200
From: =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub@jermar.eu>
To: qemu-devel@nongnu.org
Date: Mon, 19 Sep 2016 21:54:12 +0200
Message-Id: <1474314852-29465-1-git-send-email-jakub@jermar.eu>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.7.4"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 82.208.58.129
Subject: [Qemu-devel] [PATCH] hw/arm: Fix Integrator/CP memsz initialization
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
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub@jermar.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tDNi324Z7BQ

This is a multi-part message in MIME format.
--------------2.7.4
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


* Do not assume memsz is already initialized in integratorcm_init
* Calculate memsz directly from MachineState
* Get rid of the now unused memsz property

Signed-off-by: Jakub Jermar <jakub@jermar.eu>
---
 hw/arm/integratorcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


--------------2.7.4
Content-Type: text/x-patch; name="0001-hw-arm-Fix-Integrator-CP-memsz-initialization.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline; filename="0001-hw-arm-Fix-Integrator-CP-memsz-initialization.patch"

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 96dc150..3d88369 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -247,7 +247,9 @@ static void integratorcm_init(Object *obj)
 {
     IntegratorCMState *s = INTEGRATOR_CM(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    MachineState *machine = MACHINE(qdev_get_machine());
 
+    s->memsz = machine->ram_size >> 20;
     s->cm_osc = 0x01000048;
     /* ??? What should the high bits of this value be?  */
     s->cm_auxosc = 0x0007feff;
@@ -574,7 +576,6 @@ static void integratorcp_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x80000000, ram_alias);
 
     dev = qdev_create(NULL, TYPE_INTEGRATOR_CM);
-    qdev_prop_set_uint32(dev, "memsz", ram_size >> 20);
     qdev_init_nofail(dev);
     sysbus_mmio_map((SysBusDevice *)dev, 0, 0x10000000);
 
@@ -624,7 +625,6 @@ static void integratorcp_machine_init(MachineClass *mc)
 DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
 
 static Property core_properties[] = {
-    DEFINE_PROP_UINT32("memsz", IntegratorCMState, memsz, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 

--------------2.7.4--


