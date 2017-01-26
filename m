Received: by 10.25.77.65 with SMTP id a62csp111910lfb;
        Thu, 26 Jan 2017 01:20:53 -0800 (PST)
X-Received: by 10.55.7.2 with SMTP id 2mr1883424qkh.228.1485422453218;
        Thu, 26 Jan 2017 01:20:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17si710135qtf.24.2017.01.26.01.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 01:20:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWgEc-0004ZY-Gu
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 04:20:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgEA-0004JU-Kb
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgE9-0003uN-KB
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cWgE9-0003tq-C1; Thu, 26 Jan 2017 04:20:21 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5740AC05681B;
	Thu, 26 Jan 2017 09:20:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0Q9K4va003187; Thu, 26 Jan 2017 04:20:18 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Thu, 26 Jan 2017 10:19:41 +0100
Message-Id: <1485422381-29019-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 26 Jan 2017 09:20:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 4/4] hw/intc/arm_gicv3_its: Allow save/restore
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
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BTwpLKloCe3X

We change the restoration priority of both the GICv3 and ITS. The
GICv3 must be restored before the ITS and the ITS needs to be restored
before PCIe devices since it translates their MSI transactions.

We typically observe the virtio-pci-net device sending MSI transactions
very early (even before the first vcpu run) which looks weird. It
appears that not servicing those transactions cause the virtio-pci-net
to stall.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_common.c     | 1 +
 hw/intc/arm_gicv3_its_common.c | 3 ++-
 hw/intc/arm_gicv3_its_kvm.c    | 8 ++++++--
 include/migration/vmstate.h    | 2 ++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 0f8c4b8..f80e60d 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -84,6 +84,7 @@ static const VMStateDescription vmstate_gicv3 = {
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
index 3f8017d..7f81d33 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -95,8 +95,12 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
      * Block migration of a KVM GICv3 ITS device: the API for saving and
      * restoring the state in the kernel is not yet available
      */
-    error_setg(&s->migration_blocker, "vITS migration is not implemented");
-    migrate_add_blocker(s->migration_blocker);
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                               GITS_CTLR)) {
+        error_setg(&s->migration_blocker, "This operating system kernel does "
+                                          "not support vITS migration");
+        migrate_add_blocker(s->migration_blocker);
+    }
 
     kvm_msi_use_devid = true;
     kvm_gsi_direct_mapping = false;
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 1a22887..ebd755c 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -188,6 +188,8 @@ enum VMStateFlags {
 
 typedef enum {
     MIG_PRI_DEFAULT = 0,
+    MIG_PRI_GICV3_ITS,
+    MIG_PRI_GICV3,
     MIG_PRI_MAX,
 } MigrationPriority;
 
-- 
2.5.5

