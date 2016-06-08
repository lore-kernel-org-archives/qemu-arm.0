Received: by 10.25.27.66 with SMTP id b63csp2668419lfb;
        Wed, 8 Jun 2016 11:27:06 -0700 (PDT)
X-Received: by 10.55.39.141 with SMTP id n135mr6333217qkn.149.1465410426527;
        Wed, 08 Jun 2016 11:27:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x187si1386218qhx.83.2016.06.08.11.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 11:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAiC1-00053h-QO
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 14:27:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiAC-0003zY-V4
	for qemu-devel@nongnu.org; Wed, 08 Jun 2016 14:25:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiAC-0008S1-2r
	for qemu-devel@nongnu.org; Wed, 08 Jun 2016 14:25:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bAiA5-0008Mx-Nq; Wed, 08 Jun 2016 14:25:05 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CB7D486A4;
	Wed,  8 Jun 2016 18:25:05 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u58IOtQq006939; Wed, 8 Jun 2016 14:25:04 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  8 Jun 2016 20:24:51 +0200
Message-Id: <1465410291-2971-6-git-send-email-drjones@redhat.com>
In-Reply-To: <1465410291-2971-1-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 08 Jun 2016 18:25:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 5/5] hw/arm/virt: create the 2.7 machine type
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
Cc: wei@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3oID8y/AK/ec

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 017c244a46f41..323ffd4689641 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/boards.h"
+#include "hw/compat.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/bitops.h"
@@ -1423,7 +1424,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_6_instance_init(Object *obj)
+static void virt_2_7_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
@@ -1456,7 +1457,22 @@ static void virt_2_6_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
+static void virt_machine_2_7_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
+
+#define VIRT_COMPAT_2_6 \
+    HW_COMPAT_2_6
+
+static void virt_2_6_instance_init(Object *obj)
+{
+    virt_2_7_instance_init(obj);
+}
+
 static void virt_machine_2_6_options(MachineClass *mc)
 {
+    virt_machine_2_7_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 6)
+DEFINE_VIRT_MACHINE(2, 6)
-- 
2.4.11

