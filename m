Received: by 10.80.163.71 with SMTP id 65csp2845715edn;
        Wed, 5 Oct 2016 12:43:37 -0700 (PDT)
X-Received: by 10.233.235.3 with SMTP id b3mr10477455qkg.77.1475696617204;
        Wed, 05 Oct 2016 12:43:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si3778284qka.196.2016.10.05.12.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 12:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brs6K-0005I4-2y
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 15:43:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1brs2I-0001PB-CF
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 15:39:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1brs2G-0007cU-8D
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 15:39:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1brs2G-0007cH-2G; Wed, 05 Oct 2016 15:39:24 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8239C65F7F;
	Wed,  5 Oct 2016 19:39:23 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-35.ams2.redhat.com [10.36.112.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u95Jcseg010540; Wed, 5 Oct 2016 15:39:19 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Oct 2016 21:38:39 +0200
Message-Id: <1475696333-8706-6-git-send-email-lvivier@redhat.com>
In-Reply-To: <1475696333-8706-1-git-send-email-lvivier@redhat.com>
References: <1475696333-8706-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 05 Oct 2016 19:39:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 05/19] target-arm: move cpu_exec_realize() to
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
X-TUID: wr+IeYXXd4mu

I've removed the cannot_destroy_with_object_finalize_yet field as
cpu_exec_init() is not called by arm_cpu_initfn() anymore
(tested with QOM command provided by commit 4c315c27 with
 "arm1026-arm-cpu")

CC: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-arm@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target-arm/cpu.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 5fda716..7920fb0 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -445,7 +445,6 @@ static void arm_cpu_initfn(Object *obj)
 
     cs->env_ptr = &cpu->env;
     cpu_exec_init(cs, &error_abort);
-    cpu_exec_realize(cs, &error_abort);
     cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
                                          g_free, g_free);
 
@@ -577,6 +576,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     ARMCPU *cpu = ARM_CPU(dev);
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
     CPUARMState *env = &cpu->env;
+    Error *local_err = NULL;
+
+    cpu_exec_realize(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
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

