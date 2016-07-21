Received: by 10.25.21.156 with SMTP id 28csp492910lfv;
        Thu, 21 Jul 2016 09:28:39 -0700 (PDT)
X-Received: by 10.98.30.133 with SMTP id e127mr23974983pfe.104.1469118519361;
        Thu, 21 Jul 2016 09:28:39 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id lv5si10636297pab.152.2016.07.21.09.28.39;
        Thu, 21 Jul 2016 09:28:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1753411AbcGUQ2i (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Thu, 21 Jul 2016 12:28:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60869 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753396AbcGUQ2g (ORCPT <rfc822;kvm@vger.kernel.org>);
	Thu, 21 Jul 2016 12:28:36 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51C9346202;
	Thu, 21 Jul 2016 16:28:35 +0000 (UTC)
Received: from redhat.com (vpn1-7-84.ams2.redhat.com [10.36.7.84])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP id u6LGSRRo009931;
	Thu, 21 Jul 2016 12:28:28 -0400
Date:	Thu, 21 Jul 2016 19:28:27 +0300
From:	"Michael S. Tsirkin" <mst@redhat.com>
To:	qemu-devel@nongnu.org
Cc:	Peter Maydell <peter.maydell@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	James Hogan <james.hogan@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: [PULL v4 30/57] kvm-irqchip: i386: add hook for add/remove virq
Message-ID: <1469118288-4776-31-git-send-email-mst@redhat.com>
References: <1469118288-4776-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469118288-4776-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 21 Jul 2016 16:28:35 +0000 (UTC)
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: CDALqo1KyH+I

From: Peter Xu <peterx@redhat.com>

Adding two hooks to be notified when adding/removing msi routes. There
are two kinds of MSI routes:

- in kvm_irqchip_add_irq_route(): before assigning IRQFD. Used by
  vhost, vfio, etc.

- in kvm_irqchip_send_msi(): when sending direct MSI message, if
  direct MSI not allowed, we will first create one MSI route entry
  in the kernel, then trigger it.

This patch only hooks the first one (irqfd case). We do not need to
take care for the 2nd one, since it's only used by QEMU userspace
(kvm-apic) and the messages will always do in-time translation when
triggered. While we need to note them down for the 1st one, so that we
can notify the kernel when cache invalidation happens.

Also, we do not hook IOAPIC msi routes (we have explicit notifier for
IOAPIC to keep its cache updated). We only need to care about irqfd
users.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/sysemu/kvm.h     |  6 ++++++
 kvm-all.c                |  2 ++
 target-arm/kvm.c         | 11 +++++++++++
 target-i386/kvm.c        | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 target-mips/kvm.c        | 11 +++++++++++
 target-ppc/kvm.c         | 11 +++++++++++
 target-s390x/kvm.c       | 11 +++++++++++
 target-i386/trace-events |  2 ++
 8 files changed, 102 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e5d90bd..0a16e0e 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -359,6 +359,12 @@ void kvm_arch_init_irq_routing(KVMState *s);
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev);
 
+/* Notify arch about newly added MSI routes */
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev);
+/* Notify arch about released MSI routes */
+int kvm_arch_release_virq_post(int virq);
+
 int kvm_arch_msi_data_to_gsi(uint32_t data);
 
 int kvm_set_irq(KVMState *s, int irq, int level);
diff --git a/kvm-all.c b/kvm-all.c
index d94c0e4..69ff658 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1133,6 +1133,7 @@ void kvm_irqchip_release_virq(KVMState *s, int virq)
         }
     }
     clear_gsi(s, virq);
+    kvm_arch_release_virq_post(virq);
 }
 
 static unsigned int kvm_hash_msi(uint32_t data)
@@ -1281,6 +1282,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
     }
 
     kvm_add_routing_entry(s, &kroute);
+    kvm_arch_add_msi_route_post(&kroute, vector, dev);
     kvm_irqchip_commit_routes(s);
 
     return virq;
diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index 5c2bd7a..dbe393c 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -622,6 +622,17 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     return 0;
 }
 
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    return 0;
+}
+
 int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     return (data - 32) & 0xffff;
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index f574513..8875034 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -3400,6 +3400,54 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     return 0;
 }
 
+typedef struct MSIRouteEntry MSIRouteEntry;
+
+struct MSIRouteEntry {
+    PCIDevice *dev;             /* Device pointer */
+    int vector;                 /* MSI/MSIX vector index */
+    int virq;                   /* Virtual IRQ index */
+    QLIST_ENTRY(MSIRouteEntry) list;
+};
+
+/* List of used GSI routes */
+static QLIST_HEAD(, MSIRouteEntry) msi_route_list = \
+    QLIST_HEAD_INITIALIZER(msi_route_list);
+
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    MSIRouteEntry *entry;
+
+    if (!dev) {
+        /* These are (possibly) IOAPIC routes only used for split
+         * kernel irqchip mode, while what we are housekeeping are
+         * PCI devices only. */
+        return 0;
+    }
+
+    entry = g_new0(MSIRouteEntry, 1);
+    entry->dev = dev;
+    entry->vector = vector;
+    entry->virq = route->gsi;
+    QLIST_INSERT_HEAD(&msi_route_list, entry, list);
+
+    trace_kvm_x86_add_msi_route(route->gsi);
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    MSIRouteEntry *entry, *next;
+    QLIST_FOREACH_SAFE(entry, &msi_route_list, list, next) {
+        if (entry->virq == virq) {
+            trace_kvm_x86_remove_msi_route(virq);
+            QLIST_REMOVE(entry, list);
+            break;
+        }
+    }
+    return 0;
+}
+
 int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     abort();
diff --git a/target-mips/kvm.c b/target-mips/kvm.c
index f3f832d..dcf5fbb 100644
--- a/target-mips/kvm.c
+++ b/target-mips/kvm.c
@@ -1043,6 +1043,17 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     return 0;
 }
 
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    return 0;
+}
+
 int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     abort();
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 7a8f555..91e6daf 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -2621,6 +2621,17 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     return 0;
 }
 
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    return 0;
+}
+
 int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     return data & 0xffff;
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index 2991bff..80ac621 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -2267,6 +2267,17 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     return 0;
 }
 
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    return 0;
+}
+
 int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     abort();
diff --git a/target-i386/trace-events b/target-i386/trace-events
index 2113075..818058c 100644
--- a/target-i386/trace-events
+++ b/target-i386/trace-events
@@ -2,3 +2,5 @@
 
 # target-i386/kvm.c
 kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %" PRIu32
+kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
+kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
-- 
MST

