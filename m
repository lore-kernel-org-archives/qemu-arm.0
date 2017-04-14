Received: by 10.25.0.144 with SMTP id 138csp264498lfa;
        Fri, 14 Apr 2017 05:47:19 -0700 (PDT)
X-Received: by 10.233.223.134 with SMTP id t128mr7562362qkf.64.1492174039616;
        Fri, 14 Apr 2017 05:47:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 51si1711641qtw.122.2017.04.14.05.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 05:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cz0dD-0002EY-3E
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 08:47:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cz0cq-0001tF-D8
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 08:46:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cz0cp-00028f-2W
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 08:46:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cz0co-00028U-Qf; Fri, 14 Apr 2017 08:46:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5C6D7E9EA;
	Fri, 14 Apr 2017 12:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C5C6D7E9EA
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C5C6D7E9EA
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49E2D18AC5;
	Fri, 14 Apr 2017 12:46:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 14 Apr 2017 14:46:35 +0200
Message-Id: <1492173995-14140-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 14 Apr 2017 12:46:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 4/4] hw/intc/arm_gicv3_its: Allow save/restore
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
X-TUID: cBF49zr413+U

We change the restoration priority of both the GICv3 and ITS. The
GICv3 must be restored before the ITS and the ITS needs to be restored
before PCIe devices since it translates their MSI transactions.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>

---
v2 -> v3:
- reword migration blocker message
- remove unmigratable setting to false

v1 -> v2:
- handle case where migrate_add_blocker fails
- add comments along with ITS and GICv3 migration priorities
---
 hw/intc/arm_gicv3_common.c     |  1 +
 hw/intc/arm_gicv3_its_common.c |  2 +-
 hw/intc/arm_gicv3_its_kvm.c    | 24 ++++++++++++------------
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
index efab8c7..22ce4c4 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -48,7 +48,7 @@ static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
-    .unmigratable = true,
+    .priority = MIG_PRI_GICV3_ITS,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(ctlr, GICv3ITSState),
         VMSTATE_UINT32(iidr, GICv3ITSState),
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 7c5502c..8401d2f 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -77,18 +77,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
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
@@ -105,6 +93,18 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     gicv3_its_init_mmio(s, NULL);
 
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+        GITS_CTLR)) {
+        error_setg(&s->migration_blocker, "This operating system kernel "
+                   "does not support vGICv3 migration");
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

