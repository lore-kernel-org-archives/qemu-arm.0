Received: by 10.25.208.211 with SMTP id h202csp1078904lfg;
        Fri, 11 Mar 2016 07:16:00 -0800 (PST)
X-Received: by 10.140.81.51 with SMTP id e48mr12351584qgd.27.1457709359452;
        Fri, 11 Mar 2016 07:15:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 141si8886399qhq.73.2016.03.11.07.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 07:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeOnG-0004ro-R9
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 10:15:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aeOgD-0000kV-9G
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 10:08:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aeOg8-000056-Nz
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 10:08:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aeOg8-00004s-Gm; Fri, 11 Mar 2016 10:08:36 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B65AE627CA;
	Fri, 11 Mar 2016 15:08:34 +0000 (UTC)
Received: from redhat.com (vpn1-4-242.ams2.redhat.com [10.36.4.242])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u2BF8TW9023332; Fri, 11 Mar 2016 10:08:29 -0500
Date: Fri, 11 Mar 2016 17:08:28 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1457708548-14093-18-git-send-email-mst@redhat.com>
References: <1457708548-14093-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457708548-14093-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 11 Mar 2016 15:08:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xensource.com,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-arm] [PULL 17/53] msi_supported -> msi_nonbroken
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wvLGk0xfHQsX

Rename controller flag to make it clearer what it means.
Add some documentation as well.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/msi.h           |  2 +-
 hw/i386/kvm/apic.c             |  2 +-
 hw/i386/xen/xen_apic.c         |  2 +-
 hw/intc/apic.c                 |  2 +-
 hw/intc/arm_gicv2m.c           |  2 +-
 hw/intc/openpic.c              |  2 +-
 hw/intc/openpic_kvm.c          |  2 +-
 hw/pci-bridge/pci_bridge_dev.c |  2 +-
 hw/pci/msi.c                   | 19 ++++++++++++++++---
 hw/pci/msix.c                  |  2 +-
 hw/ppc/spapr.c                 |  4 ++--
 hw/ppc/spapr_pci.c             |  2 +-
 hw/s390x/s390-pci-bus.c        |  2 +-
 13 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/include/hw/pci/msi.h b/include/hw/pci/msi.h
index 50e452b..8124908 100644
--- a/include/hw/pci/msi.h
+++ b/include/hw/pci/msi.h
@@ -29,7 +29,7 @@ struct MSIMessage {
     uint32_t data;
 };
 
-extern bool msi_supported;
+extern bool msi_nonbroken;
 
 void msi_set_message(PCIDevice *dev, MSIMessage msg);
 MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector);
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 694d398..3c7c8fa 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -186,7 +186,7 @@ static void kvm_apic_realize(DeviceState *dev, Error **errp)
                           APIC_SPACE_SIZE);
 
     if (kvm_has_gsi_routing()) {
-        msi_supported = true;
+        msi_nonbroken = true;
     }
 }
 
diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
index 2b8d709..21d68ee 100644
--- a/hw/i386/xen/xen_apic.c
+++ b/hw/i386/xen/xen_apic.c
@@ -44,7 +44,7 @@ static void xen_apic_realize(DeviceState *dev, Error **errp)
     s->vapic_control = 0;
     memory_region_init_io(&s->io_memory, OBJECT(s), &xen_apic_io_ops, s,
                           "xen-apic-msi", APIC_SPACE_SIZE);
-    msi_supported = true;
+    msi_nonbroken = true;
 }
 
 static void xen_apic_set_base(APICCommonState *s, uint64_t val)
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index a299462..28c2ea5 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -874,7 +874,7 @@ static void apic_realize(DeviceState *dev, Error **errp)
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, apic_timer, s);
     local_apics[s->idx] = s;
 
-    msi_supported = true;
+    msi_nonbroken = true;
 }
 
 static void apic_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index 70c0b97..ebd368b 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -148,7 +148,7 @@ static void gicv2m_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->spi[i]);
     }
 
-    msi_supported = true;
+    msi_nonbroken = true;
     kvm_gsi_direct_mapping = true;
     kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
 }
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 903888c..7685250 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1375,7 +1375,7 @@ static void fsl_common_init(OpenPICState *opp)
 
     opp->irq_msi = 224;
 
-    msi_supported = true;
+    msi_nonbroken = true;
     for (i = 0; i < opp->fsl->max_ext; i++) {
         opp->src[i].level = false;
     }
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 4dcdb61..778af4a 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -239,7 +239,7 @@ static void kvm_openpic_realize(DeviceState *dev, Error **errp)
     memory_listener_register(&opp->mem_listener, &address_space_memory);
 
     /* indicate pic capabilities */
-    msi_supported = true;
+    msi_nonbroken = true;
     kvm_kernel_irqchip = true;
     kvm_async_interrupts_allowed = true;
 
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 100bb5e..862a2366 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -72,7 +72,7 @@ static int pci_bridge_dev_initfn(PCIDevice *dev)
         goto slotid_error;
     }
     if ((bridge_dev->flags & (1 << PCI_BRIDGE_DEV_F_MSI_REQ)) &&
-        msi_supported) {
+        msi_nonbroken) {
         err = msi_init(dev, 0, 1, true, true);
         if (err < 0) {
             goto msi_error;
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 85f21b8..e0e64c2 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -34,8 +34,21 @@
 
 #define PCI_MSI_VECTORS_MAX     32
 
-/* Flag for interrupt controller to declare MSI/MSI-X support */
-bool msi_supported;
+/*
+ * Flag for interrupt controllers to declare broken MSI/MSI-X support.
+ * values: false - broken; true - non-broken.
+ *
+ * Setting this flag to false will remove MSI/MSI-X capability from all devices.
+ *
+ * It is preferrable for controllers to set this to true (non-broken) even if
+ * they do not actually support MSI/MSI-X: guests normally probe the controller
+ * type and do not attempt to enable MSI/MSI-X with interrupt controllers not
+ * supporting such, so removing the capability is not required, and
+ * it seems cleaner to have a given device look the same for all boards.
+ *
+ * TODO: some existing controllers violate the above rule. Identify and fix them.
+ */
+bool msi_nonbroken;
 
 /* If we get rid of cap allocator, we won't need this. */
 static inline uint8_t msi_cap_sizeof(uint16_t flags)
@@ -160,7 +173,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     uint8_t cap_size;
     int config_offset;
 
-    if (!msi_supported) {
+    if (!msi_nonbroken) {
         return -ENOTSUP;
     }
 
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 537fdba..b75f0e9 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -249,7 +249,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
     uint8_t *config;
 
     /* Nothing to do if MSI is not supported by interrupt controller */
-    if (!msi_supported) {
+    if (!msi_nonbroken) {
         return -ENOTSUP;
     }
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 64c4acc..298171a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -439,7 +439,7 @@ static void *spapr_create_fdt_skel(hwaddr initrd_base,
     _FDT((fdt_property_cell(fdt, "rtas-event-scan-rate",
                             RTAS_EVENT_SCAN_RATE)));
 
-    if (msi_supported) {
+    if (msi_nonbroken) {
         _FDT((fdt_property(fdt, "ibm,change-msix-capable", NULL, 0)));
     }
 
@@ -1743,7 +1743,7 @@ static void ppc_spapr_init(MachineState *machine)
     bool kernel_le = false;
     char *filename;
 
-    msi_supported = true;
+    msi_nonbroken = true;
 
     QLIST_INIT(&spapr->phbs);
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index e8edad3..3fc7895 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1790,7 +1790,7 @@ void spapr_pci_rtas_init(void)
                         rtas_ibm_read_pci_config);
     spapr_rtas_register(RTAS_IBM_WRITE_PCI_CONFIG, "ibm,write-pci-config",
                         rtas_ibm_write_pci_config);
-    if (msi_supported) {
+    if (msi_nonbroken) {
         spapr_rtas_register(RTAS_IBM_QUERY_INTERRUPT_SOURCE_NUMBER,
                             "ibm,query-interrupt-source-number",
                             rtas_ibm_query_interrupt_source_number);
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index dba0202..f5f679f 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -597,7 +597,7 @@ static void s390_pcihost_class_init(ObjectClass *klass, void *data)
     k->init = s390_pcihost_init;
     hc->plug = s390_pcihost_hot_plug;
     hc->unplug = s390_pcihost_hot_unplug;
-    msi_supported = true;
+    msi_nonbroken = true;
 }
 
 static const TypeInfo s390_pcihost_info = {
-- 
MST

