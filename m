Received: by 10.25.0.147 with SMTP id 141csp1329452lfa;
        Mon, 6 Mar 2017 03:51:24 -0800 (PST)
X-Received: by 10.55.118.1 with SMTP id r1mr10493762qkc.236.1488801084269;
        Mon, 06 Mar 2017 03:51:24 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si8487872qkf.77.2017.03.06.03.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 03:51:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckrAf-0000wF-Jc
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 06:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ckr82-0007qY-JK
	for qemu-devel@nongnu.org; Mon, 06 Mar 2017 06:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ckr81-0006Oi-J4
	for qemu-devel@nongnu.org; Mon, 06 Mar 2017 06:48:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ckr7v-0006JI-47; Mon, 06 Mar 2017 06:48:31 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3936163E2C;
	Mon,  6 Mar 2017 11:48:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-100.ams2.redhat.com
	[10.36.116.100])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v26BmGgD027200; Mon, 6 Mar 2017 06:48:26 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Mon,  6 Mar 2017 12:48:14 +0100
Message-Id: <1488800894-22421-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1488800894-22421-1-git-send-email-eric.auger@redhat.com>
References: <1488800894-22421-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 06 Mar 2017 11:48:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 3/3] hw/intc/arm_gicv3_its: Allow save/restore
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1WVy5WFzsOd

We change the restoration priority of both the GICv3 and ITS. The
GICv3 must be restored before the ITS and the ITS needs to be restored
before PCIe devices since it translates their MSI transactions.

We typically observe the virtio-pci-net device sending MSI transactions
very early (even before the first vcpu run) which looks weird. It
appears that not servicing those transactions cause the virtio-pci-net
to stall.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- handle case where migrate_add_blocker fails
- add comments along with ITS and GICv3 migration priorities
---
 hw/intc/arm_gicv3_common.c     |  1 +
 hw/intc/arm_gicv3_its_common.c |  3 ++-
 hw/intc/arm_gicv3_its_kvm.c    | 23 +++++++++++------------
 include/migration/vmstate.h    |  2 ++
 4 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index c6493d6..4228b7c 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -145,6 +145,7 @@ static const VMStateDescription vmstate_gicv3 = {
     .minimum_version_id = 1,
     .pre_save = gicv3_pre_save,
     .post_load = gicv3_post_load,
+    .priority = MIG_PRI_GICV3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(gicd_ctlr, GICv3State),
         VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 75b9f04..854709f 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -48,7 +48,8 @@ static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
-    .unmigratable = true,
+    .unmigratable = false,
+    .priority = MIG_PRI_GICV3_ITS,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(ctlr, GICv3ITSState),
         VMSTATE_UINT64(cbaser, GICv3ITSState),
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 45e57d6..3bd2873 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -76,18 +76,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
     Error *local_err = NULL;
 
-    /*
-     * Block migration of a KVM GICv3 ITS device: the API for saving and
-     * restoring the state in the kernel is not yet available
-     */
-    error_setg(&s->migration_blocker, "vITS migration is not implemented");
-    migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        error_free(s->migration_blocker);
-        return;
-    }
-
     s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_ITS, false);
     if (s->dev_fd < 0) {
         error_setg_errno(errp, -s->dev_fd, "error creating in-kernel ITS");
@@ -104,6 +92,17 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     gicv3_its_init_mmio(s, NULL);
 
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+        GITS_CTLR)) {
+        error_setg(&s->migration_blocker, "vITS migration is not implemented");
+        migrate_add_blocker(s->migration_blocker, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            error_free(s->migration_blocker);
+            return;
+        }
+    }
+
     kvm_msi_use_devid = true;
     kvm_gsi_direct_mapping = false;
     kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index f2dbf84..8dab9c7 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -198,6 +198,8 @@ enum VMStateFlags {
 typedef enum {
     MIG_PRI_DEFAULT = 0,
     MIG_PRI_IOMMU,              /* Must happen before PCI devices */
+    MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
+    MIG_PRI_GICV3,              /* Must happen before the ITS */
     MIG_PRI_MAX,
 } MigrationPriority;
 
-- 
2.5.5

