Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp502148wrq;
        Wed, 4 Jul 2018 05:49:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGzk8IZgsTCtbbWKytRsrZUNvHOdMeH88WHyrRxHXus3Ws6nBcu777vxQ45ElWl7XN8hnD
X-Received: by 2002:ac8:2b23:: with SMTP id 32-v6mr1573615qtu.119.1530708592384;
        Wed, 04 Jul 2018 05:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708592; cv=none;
        d=google.com; s=arc-20160816;
        b=E+rB7818j+q26lGfRZkNeYjqrLi0awGpDvqXFjrOBmP5pAkr7N/Y/m9MYVmWlLhM7k
         0VLONp7F5XWR6gjxGYxX0npweE7SzC0DcZfv0A1fOnw4/9B4WHiV8hfLtcfwFBCeqv0I
         kMoYd7yzSYqvOj8KP+Y++GRJ4s7xuuIpeKcPELh3B+NbUdFXWRpaxNPTQoac0+myNzp0
         2v/uz4KfXQG6m+jJv5p17rzi8nlV8ZN7BAUqTHu0lEGoVIc5ijt61VMUKwIo7r9kEFdH
         W/VhlQX9YH//N8bqIGTKKd76jDBXot18vTvQzBmF2JcSSFIXb5khqWzN3jqp6z/QT9fw
         GGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/8wgRWW0ItlQyNUurZS9dMdIdN//3QC1UJeztx0R4Dc=;
        b=stALWfTC/4BgcwS62nwcStOLFfhWXppSydOB8B/EXqM8JFBMGSUUEzajtHXB3jRrtn
         CyB0KQm/WxPgoKZfXuewF5i/oMq704QBIboBZnKT9XfaS4E9CerL73OA6Q6em6Eanri3
         HZPzvUt2LOSSsse1un1q8/rctXs2lu8HkIVuCPMsmnInFN0jmlpsiK+Zq3PwHaN6B3rM
         +qa1YpSuFEWUhtyM/RmDcYFIuPGnEM4buo99YziUhitoC2/ediVeXw9GB2VPGoSPw+ST
         mvewo4i6Fg6qwzwS1WeZoKZTS6hy5zi9Wf0UyQeczl2SuY64QY97Yzws7D1f7fMM+BXk
         0RKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m32-v6si2332637qvg.182.2018.07.04.05.49.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:49:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahEF-0007UL-QQ
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:49:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDx-0007RP-C1
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDw-0000Tb-1J
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40638 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fahDv-0000TS-S3; Wed, 04 Jul 2018 08:49:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57A864075740;
	Wed,  4 Jul 2018 12:49:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2232156889;
	Wed,  4 Jul 2018 12:49:30 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  4 Jul 2018 14:49:20 +0200
Message-Id: <20180704124923.32483-4-drjones@redhat.com>
In-Reply-To: <20180704124923.32483-1-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 04 Jul 2018 12:49:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 04 Jul 2018 12:49:31 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH 3/6] hw/arm/virt: DT: add cpu-map
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijmyEnQ8EBZV

Support devicetree CPU topology descriptions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 35 +++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 880441275031..6c5fecdd61df 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -40,6 +40,7 @@
 #include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/cpus.h"
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
@@ -302,6 +303,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
     /*
      * From Documentation/devicetree/bindings/arm/cpus.txt
@@ -358,8 +360,38 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
+                              qemu_fdt_alloc_phandle(vms->fdt));
         g_free(nodename);
     }
+
+    if (!vmc->ignore_cpu_topology) {
+        /* From Documentation/devicetree/bindings/arm/topology.txt
+         */
+        qemu_fdt_add_subnode(vms->fdt, "/cpus/cpu-map");
+
+        for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
+            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+            char *map_path;
+
+            if (smp_threads > 1) {
+                map_path = g_strdup_printf(
+                               "/cpus/cpu-map/%s%d/%s%d/%s%d",
+                               "cluster", cpu / (smp_cores * smp_threads),
+                               "core", (cpu / smp_threads) % smp_cores,
+                               "thread", cpu % smp_threads);
+            } else {
+                map_path = g_strdup_printf(
+                               "/cpus/cpu-map/%s%d/%s%d",
+                               "cluster", cpu / smp_cores,
+                               "core", cpu % smp_cores);
+            }
+            qemu_fdt_add_path(vms->fdt, map_path);
+            qemu_fdt_setprop_phandle(vms->fdt, map_path, "cpu", cpu_path);
+            g_free(map_path);
+            g_free(cpu_path);
+        }
+    }
 }
 
 static void fdt_add_its_gic_node(VirtMachineState *vms)
@@ -1839,7 +1871,10 @@ static void virt_3_0_instance_init(Object *obj)
 
 static void virt_machine_3_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_3_1_options(mc);
+    vmc->ignore_cpu_topology = true;
 }
 DEFINE_VIRT_MACHINE(3, 0)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870ccb6a57..deb8bee72cda 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -94,6 +94,7 @@ typedef struct MemMapEntry {
 typedef struct {
     MachineClass parent;
     bool disallow_affinity_adjustment;
+    bool ignore_cpu_topology;
     bool no_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
-- 
2.17.1

