Received: by 10.25.85.209 with SMTP id j200csp108683lfb;
        Fri, 10 Jun 2016 11:02:25 -0700 (PDT)
X-Received: by 10.55.183.135 with SMTP id h129mr3221320qkf.105.1465581744775;
        Fri, 10 Jun 2016 11:02:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34si6954635qtd.10.2016.06.10.11.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 11:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQlE-0007dR-8u
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 14:02:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQZ-0006bL-PS
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQV-0000RW-3H
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQU-0000RK-Rs; Fri, 10 Jun 2016 13:40:59 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62DCFC04D292;
	Fri, 10 Jun 2016 17:40:58 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPb032552; Fri, 10 Jun 2016 13:40:56 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:21 +0200
Message-Id: <1465580427-13596-11-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 10 Jun 2016 17:40:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 10/16] hw/ppc/spapr: don't use smp_cores,
 smp_threads
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hOkkLZgUEsLC

Use CPUState nr_cores,nr_threads and MachineState
cores,threads instead.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/ppc/spapr.c      | 9 +++++----
 hw/ppc/spapr_rtas.c | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 063664234106e..f78276bb4b164 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -35,7 +35,6 @@
 #include "net/net.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "sysemu/device_tree.h"
 #include "kvm_ppc.h"
@@ -603,7 +602,7 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
     uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq() : 1000000000;
     uint32_t page_sizes_prop[64];
     size_t page_sizes_prop_size;
-    uint32_t vcpus_per_socket = smp_threads * smp_cores;
+    uint32_t vcpus_per_socket = cs->nr_cores * cs->nr_threads;
     uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
 
     /* Note: we keep CI large pages off for now because a 64K capable guest
@@ -1774,7 +1773,7 @@ static void ppc_spapr_init(MachineState *machine)
     /* Set up Interrupt Controller before we create the VCPUs */
     spapr->icp = xics_system_init(machine,
                                   DIV_ROUND_UP(max_cpus * kvmppc_smt_threads(),
-                                               smp_threads),
+                                               machine->threads),
                                   XICS_IRQS, &error_fatal);
 
     if (smc->dr_lmb_enabled) {
@@ -2268,9 +2267,11 @@ static HotplugHandler *spapr_get_hotpug_handler(MachineState *machine,
 
 static unsigned spapr_cpu_index_to_socket_id(unsigned cpu_index)
 {
+    CPUState *cs = first_cpu;
+
     /* Allocate to NUMA nodes on a "socket" basis (not that concept of
      * socket means much for the paravirtualized PAPR platform) */
-    return cpu_index / smp_threads / smp_cores;
+    return cpu_index / cs->nr_cores / cs->nr_threads;
 }
 
 static void spapr_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 43e2c684fda8d..3fdfbb01a20dd 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -742,7 +742,7 @@ int spapr_rtas_device_tree_setup(void *fdt, hwaddr rtas_addr,
     lrdr_capacity[1] = cpu_to_be32(max_hotplug_addr & 0xffffffff);
     lrdr_capacity[2] = 0;
     lrdr_capacity[3] = cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE);
-    lrdr_capacity[4] = cpu_to_be32(max_cpus/smp_threads);
+    lrdr_capacity[4] = cpu_to_be32(max_cpus / machine->threads);
     ret = qemu_fdt_setprop(fdt, "/rtas", "ibm,lrdr-capacity", lrdr_capacity,
                      sizeof(lrdr_capacity));
     if (ret < 0) {
-- 
2.4.11

