Received: by 10.25.0.198 with SMTP id 189csp85644lfa;
        Wed, 3 May 2017 05:59:59 -0700 (PDT)
X-Received: by 10.200.54.2 with SMTP id m2mr29911492qtb.176.1493816399705;
        Wed, 03 May 2017 05:59:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c205si1707557qkg.91.2017.05.03.05.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 05:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5tst-0001fo-3a
	for alex.bennee@linaro.org; Wed, 03 May 2017 08:59:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqk-00087I-Bo
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqj-0000k5-5M
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tqi-0000il-WC; Wed, 03 May 2017 08:57:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCC6661BAE;
	Wed,  3 May 2017 12:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BCC6661BAE
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BCC6661BAE
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D0D917C5A;
	Wed,  3 May 2017 12:57:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:02 +0200
Message-Id: <1493816238-33120-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 03 May 2017 12:57:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 08/24] virt-arm: add node-id property to CPU
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
X-TUID: i6Vvxvy/gyXu

it will allow switching from cpu_index to property based
numa mapping in follow up patches.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c    | 15 +++++++++++++++
 target/arm/cpu.c |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3e19b5f..05a2822 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1350,6 +1350,7 @@ static void machvirt_init(MachineState *machine)
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
         CPUState *cs;
+        int node_id;
 
         if (n >= smp_cpus) {
             break;
@@ -1362,6 +1363,20 @@ static void machvirt_init(MachineState *machine)
         cs = CPU(cpuobj);
         cs->cpu_index = n;
 
+        node_id = numa_get_node_for_cpu(cs->cpu_index);
+        if (node_id == nb_numa_nodes) {
+            /* by default CPUState::numa_node was 0 if it's not set via CLI
+             * keep it this way for now but in future we probably should
+             * refuse to start up with incomplete numa mapping */
+             node_id = 0;
+        }
+        if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
+            cs->numa_node = node_id;
+        } else {
+            /* CPU isn't device_add compatible yet, this shouldn't happen */
+            error_setg(&error_abort, "user set node-id not implemented");
+        }
+
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ee1406d..c185eb1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1573,6 +1573,7 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
+    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.7.4

