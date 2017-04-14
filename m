Received: by 10.25.0.144 with SMTP id 138csp264433lfa;
        Fri, 14 Apr 2017 05:47:09 -0700 (PDT)
X-Received: by 10.200.55.15 with SMTP id o15mr6901978qtb.279.1492174029724;
        Fri, 14 Apr 2017 05:47:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si1689098qkl.296.2017.04.14.05.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 05:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cz0d3-00025p-6w
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 08:47:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cz0cn-0001rH-5Z
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 08:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cz0cm-00028E-9t
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 08:46:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cz0cm-000289-4I; Fri, 14 Apr 2017 08:46:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC9C885541;
	Fri, 14 Apr 2017 12:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EC9C885541
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EC9C885541
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D5E518AC5;
	Fri, 14 Apr 2017 12:46:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 14 Apr 2017 14:46:34 +0200
Message-Id: <1492173995-14140-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 14 Apr 2017 12:46:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 3/4] hw/intc/arm_gicv3_kvm: Implement pending
 table save
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, Vijaya.Kumar@cavium.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n04v9U41MaSs

This patch adds the flush of the LPI pending bits into the
redistributor pending tables. This happens on VM stop.

There is no explicit restore as the tables are implicitly sync'ed
on ITS table restore and on LPI enable at redistributor level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5: new
---
 hw/intc/arm_gicv3_kvm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 19aab56..9898c49 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/sysemu.h"
 #include "kvm_arm.h"
 #include "gicv3_internal.h"
 #include "vgic_common.h"
@@ -680,6 +681,26 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/**
+ * vm_change_state_handler - VM change state callback aiming at flushing
+ * RDIST pending tables into guest RAM
+ *
+ * The tables get flushed to guest RAM whenever the VM gets stopped.
+ */
+static void vm_change_state_handler(void *opaque, int running,
+                                    RunState state)
+{
+    GICv3State *s = (GICv3State *)opaque;
+
+    if (running) {
+        return;
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES, NULL, true);
+}
+
+
 static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = KVM_ARM_GICV3(dev);
@@ -751,6 +772,10 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                              KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES)) {
+        qemu_add_vm_change_state_handler(vm_change_state_handler, s);
+    }
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
2.5.5

