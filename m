Received: by 10.80.166.35 with SMTP id d32csp478628edc;
        Thu, 13 Oct 2016 09:29:50 -0700 (PDT)
X-Received: by 10.200.51.20 with SMTP id t20mr7702270qta.48.1476376190489;
        Thu, 13 Oct 2016 09:29:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si6960943qku.104.2016.10.13.09.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 09:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buitB-00082G-B8
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 12:29:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1buiox-00045Z-JD
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 12:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1buiov-0007tn-Cb
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 12:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1buiov-0007tH-3v; Thu, 13 Oct 2016 12:25:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 816974E33A;
	Thu, 13 Oct 2016 16:25:24 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9DGP2ms010294; Thu, 13 Oct 2016 12:25:21 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Oct 2016 18:24:47 +0200
Message-Id: <1476375902-11715-6-git-send-email-lvivier@redhat.com>
In-Reply-To: <1476375902-11715-1-git-send-email-lvivier@redhat.com>
References: <1476375902-11715-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 13 Oct 2016 16:25:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 05/20] target-arm: move cpu_exec_realize() to
 realize function
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
Cc: Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ypjao5uGdT0a

Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
to arm_cpu_realizefn() as setting of cpu_index is now done
in cpu_exec_realize().

I've removed the cannot_destroy_with_object_finalize_yet field as
unsafe references have been moved to cpu_exec_realize().
(tested with QOM command provided by commit 4c315c27 with
 "arm1026-arm-cpu")

CC: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-arm@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target-arm/cpu.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 7e58134..54e7991 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -441,23 +441,12 @@ static void arm_cpu_initfn(Object *obj)
     CPUState *cs = CPU(obj);
     ARMCPU *cpu = ARM_CPU(obj);
     static bool inited;
-    uint32_t Aff1, Aff0;
 
     cs->env_ptr = &cpu->env;
     cpu_exec_init(cs);
-    cpu_exec_realize(cs, &error_abort);
     cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
                                          g_free, g_free);
 
-    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
-     * We don't support setting cluster ID ([16..23]) (known as Aff2
-     * in later ARM ARM versions), or any of the higher affinity level fields,
-     * so these bits always RAZ.
-     */
-    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
-    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
-    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
-
 #ifndef CONFIG_USER_ONLY
     /* Our inbound IRQ and FIQ lines */
     if (kvm_enabled()) {
@@ -577,6 +566,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     ARMCPU *cpu = ARM_CPU(dev);
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
     CPUARMState *env = &cpu->env;
+    Error *local_err = NULL;
+    uint32_t Aff1, Aff0;
+
+    cpu_exec_realize(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
@@ -632,6 +629,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_THUMB_DSP);
     }
 
+    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
+     * We don't support setting cluster ID ([16..23]) (known as Aff2
+     * in later ARM ARM versions), or any of the higher affinity level fields,
+     * so these bits always RAZ.
+     */
+    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
+    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
+    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
+
     if (cpu->reset_hivecs) {
             cpu->reset_sctlr |= (1 << 13);
     }
@@ -1534,17 +1540,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
 
     cc->disas_set_info = arm_disas_set_info;
-
-    /*
-     * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
-     * the object in cpus -> dangling pointer after final
-     * object_unref().
-     *
-     * Once this is fixed, the devices that create ARM CPUs should be
-     * updated not to set cannot_destroy_with_object_finalize_yet,
-     * unless they still screw up something else.
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 static void cpu_register(const ARMCPUInfo *info)
-- 
2.7.4

