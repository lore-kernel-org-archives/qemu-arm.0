Received: by 10.25.15.230 with SMTP id 99csp256734lfp;
        Wed, 22 Mar 2017 06:33:11 -0700 (PDT)
X-Received: by 10.55.64.74 with SMTP id n71mr34368198qka.250.1490189591662;
        Wed, 22 Mar 2017 06:33:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si1091659qtb.202.2017.03.22.06.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgNz-000716-3O
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:33:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgNm-0006tI-BP
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgNl-0001hd-DG
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:32:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgNl-0001hM-4y; Wed, 22 Mar 2017 09:32:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0150A64E0;
	Wed, 22 Mar 2017 13:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0150A64E0
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0150A64E0
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ACF35C6C9;
	Wed, 22 Mar 2017 13:32:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:27 +0100
Message-Id: <1490189568-167621-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 22 Mar 2017 13:32:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 02/23] hw/arm/virt: extract mp-affinity
 calculation in separate function
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zXB5aTnFEB/b

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c | 59 ++++++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f62a03..484754e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1194,6 +1194,45 @@ void virt_machine_done(Notifier *notifier, void *data)
     virt_build_smbios(vms);
 }
 
+static uint64_t virt_idx2mp_affinity(VirtMachineState *vms, int idx)
+{
+    uint64_t mp_affinity;
+    uint8_t clustersz;
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    if (!vmc->disallow_affinity_adjustment) {
+        uint8_t aff0, aff1;
+
+        if (vms->gic_version == 3) {
+            clustersz = GICV3_TARGETLIST_BITS;
+        } else {
+            clustersz = GIC_TARGETLIST_BITS;
+        }
+
+        /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
+         * GIC's target-list limitations. 32-bit KVM hosts currently
+         * always create clusters of 4 CPUs, but that is expected to
+         * change when they gain support for gicv3. When KVM is enabled
+         * it will override the changes we make here, therefore our
+         * purposes are to make TCG consistent (with 64-bit KVM hosts)
+         * and to improve SGI efficiency.
+         */
+        aff1 = idx / clustersz;
+        aff0 = idx % clustersz;
+        mp_affinity = (aff1 << ARM_AFF1_SHIFT) | aff0;
+    } else {
+        /* This cpu-id-to-MPIDR affinity is used only for TCG;
+         * KVM will override it. We don't support setting cluster ID
+         * ([16..23]) (known as Aff2 in later ARM ARM versions), or any of
+         * the higher affinity level fields, so these bits always RAZ.
+         */
+        uint32_t Aff1 = idx / ARM_DEFAULT_CPUS_PER_CLUSTER;
+        uint32_t Aff0 = idx % ARM_DEFAULT_CPUS_PER_CLUSTER;
+        mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
+    }
+    return mp_affinity;
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1210,7 +1249,6 @@ static void machvirt_init(MachineState *machine)
     CPUClass *cc;
     Error *err = NULL;
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
-    uint8_t clustersz;
 
     if (!cpu_model) {
         cpu_model = "cortex-a15";
@@ -1263,10 +1301,8 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->gic_version == 3) {
         virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
-        clustersz = GICV3_TARGETLIST_BITS;
     } else {
         virt_max_cpus = GIC_NCPU;
-        clustersz = GIC_TARGETLIST_BITS;
     }
 
     if (max_cpus > virt_max_cpus) {
@@ -1326,20 +1362,9 @@ static void machvirt_init(MachineState *machine)
 
     for (n = 0; n < smp_cpus; n++) {
         Object *cpuobj = object_new(typename);
-        if (!vmc->disallow_affinity_adjustment) {
-            /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
-             * GIC's target-list limitations. 32-bit KVM hosts currently
-             * always create clusters of 4 CPUs, but that is expected to
-             * change when they gain support for gicv3. When KVM is enabled
-             * it will override the changes we make here, therefore our
-             * purposes are to make TCG consistent (with 64-bit KVM hosts)
-             * and to improve SGI efficiency.
-             */
-            uint8_t aff1 = n / clustersz;
-            uint8_t aff0 = n % clustersz;
-            object_property_set_int(cpuobj, (aff1 << ARM_AFF1_SHIFT) | aff0,
-                                    "mp-affinity", NULL);
-        }
+
+        object_property_set_int(cpuobj, virt_idx2mp_affinity(vms, n),
+                                "mp-affinity", NULL);
 
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
-- 
2.7.4

