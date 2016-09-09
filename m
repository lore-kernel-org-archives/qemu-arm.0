Received: by 10.80.163.71 with SMTP id 65csp212072edn;
        Fri, 9 Sep 2016 10:31:01 -0700 (PDT)
X-Received: by 10.200.40.36 with SMTP id 33mr5264201qtq.53.1473442261197;
        Fri, 09 Sep 2016 10:31:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h197si2698022qke.319.2016.09.09.10.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 10:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biPdk-0001Op-JT
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 13:31:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdh-0001OU-3w
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdf-0005N4-1W
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:30:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1biPde-0005N0-Ru; Fri, 09 Sep 2016 13:30:54 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56878DCA1E;
	Fri,  9 Sep 2016 17:30:54 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-170.ams2.redhat.com
	[10.36.7.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u89HUlQp024546; Fri, 9 Sep 2016 13:30:51 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri,  9 Sep 2016 19:30:30 +0200
Message-Id: <1473442237-3746-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 09 Sep 2016 17:30:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 1/8] hw/intc/arm_gic(v3)_kvm: Initialize gsi
 routing
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pnqtKgEV56/g

From: Eric Auger <eric.auger@linaro.org>

Advertise gsi routing and set up irqchip routing entries for
GIC SPIs.

This is not mandated as long as MSI routing is not used
(because the kernel sets a default irqchip routing table).
However once MSI routing gets used (for VIRTIO-PCI vhost for
example), the first call to KVM_SET_GSI_ROUTING overrides the
kernel default irqchip table.

If no routing entry exists for the GSI, any IRQFD signaling for
this GSI will fail.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

RFC -> PATCH:
- KVM gsi/MSI routing for ARM now supported in 4.8
- use kvm_has_gsi_routing()
---
 hw/intc/arm_gic_kvm.c   | 12 ++++++++++++
 hw/intc/arm_gicv3_kvm.c | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 5593cdb..ae7ac58 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -577,6 +577,18 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
                                           "not support vGICv2 migration");
         migrate_add_blocker(s->migration_blocker);
     }
+
+    if (kvm_has_gsi_routing()) {
+        /* set up irq routing */
+        kvm_init_irq_routing(kvm_state);
+        for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
+            kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
+        }
+
+        kvm_gsi_routing_allowed = true;
+
+        kvm_irqchip_commit_routes(kvm_state);
+    }
 }
 
 static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 711fde3..199a439 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -85,6 +85,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     GICv3State *s = KVM_ARM_GICV3(dev);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
     Error *local_err = NULL;
+    int i;
 
     DPRINTF("kvm_arm_gicv3_realize\n");
 
@@ -127,6 +128,18 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
      */
     error_setg(&s->migration_blocker, "vGICv3 migration is not implemented");
     migrate_add_blocker(s->migration_blocker);
+
+    if (kvm_has_gsi_routing()) {
+        /* set up irq routing */
+        kvm_init_irq_routing(kvm_state);
+        for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
+            kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
+        }
+
+        kvm_gsi_routing_allowed = true;
+
+        kvm_irqchip_commit_routes(kvm_state);
+    }
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
2.5.5

