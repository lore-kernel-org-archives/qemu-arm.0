Received: by 10.25.0.23 with SMTP id 23csp3114930lfa;
        Fri, 9 Jun 2017 08:53:24 -0700 (PDT)
X-Received: by 10.200.38.8 with SMTP id u8mr34600041qtu.127.1497023604585;
        Fri, 09 Jun 2017 08:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497023604; cv=none;
        d=google.com; s=arc-20160816;
        b=GfinxNpdnbdTjLwatHICvjZVhzHsgs52hoLG9lO6GEtutbIcXUWNJW9+nU/j6e2Y9u
         +WjJOMYvo1CYLQJ3QVYNPh/LP34nAyFBHwsW9BeYZpwecsrefqC1RY8mQK+dinEWuFvp
         K2BO5iCajhvYQRZKYTfqUhZK7RmKSbK0PCxfj0Xjz9nyQaYbJlmjSC9vLb5J32WxZXy8
         6OEwgqnPxl78GZyWoN6AMrQ2j9d9xK5ycvXTtRh1tHw420YOWAfinVdps01YiwygD/Eg
         aE95Hvh+1m+zOZi4wXqX0NSHzTE+uIt4zr87EoUza1nzL3DP5unViAkEkULAgMJ2G1aK
         AGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=KR0JoNTt6tkLARkfs8Ofhr132D9UH4AAiXOt8Y45kjU=;
        b=k+L/URllumKnaAzCnu7kcDP0OX/zc21h+OwgRhV2Pg46ThTjhhQsVW82KgpBWQ9PA9
         YNW24KzXbk/7DhVmTnvjKRI7a4ykoyqcHD6mV8LUKkRMAbbuj/VJOGA2r/Z6LLdcqoJf
         hZP1wUJNMa8SS4zR6/rHJx/FfW6JMCIwk2FEKE/d6VmMQdd1ZhwP97dDrTnU2a+5KVHs
         cAfZJX+lM2X0JNDKUt/wcM3RIr8Tjj6JBIiVcnrs4tn8/5d6fkDe8L4pkJBHxq/CSwcQ
         WXXZXBUjjxEuUCzdfOO3QwRx220J3+brLHU/w4OxaAK94f0pBG3TAMU+e97C7Ijb71WV
         ncug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si1328298qtb.24.2017.06.09.08.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 08:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJMDx-0003JI-O9
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 11:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDr-0003Gr-JF
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDn-00059m-MU
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53294)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dJMDn-00059F-Da; Fri, 09 Jun 2017 11:53:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4553C334587;
	Fri,  9 Jun 2017 15:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4553C334587
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4553C334587
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEB50955A2;
	Fri,  9 Jun 2017 15:52:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri,  9 Jun 2017 17:52:31 +0200
Message-Id: <1497023553-18411-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Jun 2017 15:53:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 2/4] hw/intc/arm_gicv3_its: Implement state
 save/restore
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
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ReO93MZzyYTA

We need to handle both registers and ITS tables. While
register handling is standard, ITS table handling is more
challenging since the kernel API is devised so that the
tables are flushed into guest RAM and not in vmstate buffers.

Flushing the ITS tables on device pre_save() is too late
since the guest RAM is already saved at this point.

Table flushing needs to happen when we are sure the vcpus
are stopped and before the last dirty page saving. The
right point is RUN_STATE_FINISH_MIGRATE but sometimes the
VM gets stopped before migration launch so let's simply
flush the tables each time the VM gets stopped.

For regular ITS registers we just can use vmstate pre_save()
and post_load() callbacks.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- use &s->ctlr directly when writing GITS_CTLR
- don't abort on -EFAULT
- s->iidr reset in gicv3_its_common_reset
---
 hw/intc/arm_gicv3_its_common.c         |  10 ++++
 hw/intc/arm_gicv3_its_kvm.c            | 105 +++++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_its_common.h |   8 +++
 3 files changed, 123 insertions(+)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 9d67c5c..696c11c 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -49,6 +49,15 @@ static const VMStateDescription vmstate_its = {
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
     .unmigratable = true,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctlr, GICv3ITSState),
+        VMSTATE_UINT32(iidr, GICv3ITSState),
+        VMSTATE_UINT64(cbaser, GICv3ITSState),
+        VMSTATE_UINT64(cwriter, GICv3ITSState),
+        VMSTATE_UINT64(creadr, GICv3ITSState),
+        VMSTATE_UINT64_ARRAY(baser, GICv3ITSState, 8),
+        VMSTATE_END_OF_LIST()
+    },
 };
 
 static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
@@ -118,6 +127,7 @@ static void gicv3_its_common_reset(DeviceState *dev)
     s->cbaser = 0;
     s->cwriter = 0;
     s->creadr = 0;
+    s->iidr = 0;
     memset(&s->baser, 0, sizeof(s->baser));
 
     gicv3_its_post_load(s, 0);
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 340c2b0..4cd8f5f 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -53,6 +53,33 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
     return kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
 }
 
+/**
+ * vm_change_state_handler - VM change state callback aiming at flushing
+ * ITS tables into guest RAM
+ *
+ * The tables get flushed to guest RAM whenever the VM gets stopped.
+ */
+static void vm_change_state_handler(void *opaque, int running,
+                                    RunState state)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    Error *err = NULL;
+    int ret;
+
+    if (running) {
+        return;
+    }
+
+    ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                            KVM_DEV_ARM_ITS_SAVE_TABLES, NULL, true, &err);
+    if (err) {
+        error_report_err(err);
+    }
+    if (ret < 0 && ret != -EFAULT) {
+        abort();
+    }
+}
+
 static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 {
     GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
@@ -89,6 +116,8 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     kvm_msi_use_devid = true;
     kvm_gsi_direct_mapping = false;
     kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
+
+    qemu_add_vm_change_state_handler(vm_change_state_handler, s);
 }
 
 static void kvm_arm_its_init(Object *obj)
@@ -102,6 +131,80 @@ static void kvm_arm_its_init(Object *obj)
                              &error_abort);
 }
 
+/**
+ * kvm_arm_its_pre_save - handles the saving of ITS registers.
+ * ITS tables are flushed into guest RAM separately and earlier,
+ * through the VM change state handler, since at the moment pre_save()
+ * is called, the guest RAM has already been saved.
+ */
+static void kvm_arm_its_pre_save(GICv3ITSState *s)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                          GITS_BASER + i * 8, &s->baser[i], false,
+                          &error_abort);
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CTLR, &s->ctlr, false, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CBASER, &s->cbaser, false, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CREADR, &s->creadr, false, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CWRITER, &s->cwriter, false, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_IIDR, &s->iidr, false, &error_abort);
+}
+
+/**
+ * kvm_arm_its_post_load - Restore both the ITS registers and tables
+ */
+static void kvm_arm_its_post_load(GICv3ITSState *s)
+{
+    int i;
+
+    if (!s->iidr) {
+        return;
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_IIDR, &s->iidr, true, &error_abort);
+
+    /*
+     * must be written before GITS_CREADR since GITS_CBASER write
+     * access resets GITS_CREADR.
+     */
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CBASER, &s->cbaser, true, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CREADR, &s->creadr, true, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CWRITER, &s->cwriter, true, &error_abort);
+
+
+    for (i = 0; i < 8; i++) {
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                          GITS_BASER + i * 8, &s->baser[i], true,
+                          &error_abort);
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_ITS_RESTORE_TABLES, NULL, true,
+                      &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CTLR, &s->ctlr, true, &error_abort);
+}
+
 static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -109,6 +212,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
 
     dc->realize = kvm_arm_its_realize;
     icc->send_msi = kvm_its_send_msi;
+    icc->pre_save = kvm_arm_its_pre_save;
+    icc->post_load = kvm_arm_its_post_load;
 }
 
 static const TypeInfo kvm_arm_its_info = {
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 1ba1894..fd1fe64 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -28,6 +28,13 @@
 #define ITS_TRANS_SIZE   0x10000
 #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
 
+#define GITS_CTLR        0x0
+#define GITS_IIDR        0x4
+#define GITS_CBASER      0x80
+#define GITS_CWRITER     0x88
+#define GITS_CREADR      0x90
+#define GITS_BASER       0x100
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -43,6 +50,7 @@ struct GICv3ITSState {
 
     /* Registers */
     uint32_t ctlr;
+    uint32_t iidr;
     uint64_t cbaser;
     uint64_t cwriter;
     uint64_t creadr;
-- 
2.5.5

