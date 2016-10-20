Received: by 10.80.166.35 with SMTP id d32csp776192edc;
        Thu, 20 Oct 2016 04:30:57 -0700 (PDT)
X-Received: by 10.55.77.148 with SMTP id a142mr243085qkb.157.1476963057035;
        Thu, 20 Oct 2016 04:30:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si27465595qkf.25.2016.10.20.04.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Oct 2016 04:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxBYm-00066N-2L
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 07:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bxBUh-0001t2-4C
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 07:26:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bxBUe-0007UL-Sc
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 07:26:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bxBUe-0007Tt-Kl; Thu, 20 Oct 2016 07:26:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6D6272658;
	Thu, 20 Oct 2016 11:26:39 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KBQ412019916; Thu, 20 Oct 2016 07:26:32 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2016 13:26:04 +0200
Message-Id: <1476962764-12166-4-git-send-email-lvivier@redhat.com>
In-Reply-To: <1476962764-12166-1-git-send-email-lvivier@redhat.com>
References: <1476962764-12166-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 20 Oct 2016 11:26:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 3/3] exec: call cpu_exec_exit() from a CPU
 unrealize common function
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
Cc: Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnD5pry4I/FL

As cpu_exec_exit() mirrors the cpu_exec_realizefn(),
rename it as cpu_exec_unrealizefn().

Create and register a cpu_common_unrealizefn() function for
the CPU device class and call cpu_exec_unrealizefn() from
this function.

Remove cpu_exec_exit() from cpu_common_finalize()
(which mirrors init, not realize), and as x86_cpu_unrealizefn()
and ppc_cpu_unrealizefn() overwrite the device class unrealize function,
add a call to a parent_unrealize pointer.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 exec.c                      | 2 +-
 include/qom/cpu.h           | 2 +-
 qom/cpu.c                   | 8 +++++++-
 target-i386/cpu-qom.h       | 1 +
 target-i386/cpu.c           | 9 +++++++++
 target-ppc/cpu-qom.h        | 1 +
 target-ppc/translate_init.c | 9 ++++++++-
 7 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index dddaf69..7e91f28 100644
--- a/exec.c
+++ b/exec.c
@@ -596,7 +596,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 }
 #endif
 
-void cpu_exec_exit(CPUState *cpu)
+void cpu_exec_unrealizefn(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 5520c6c..633c3fc 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -948,7 +948,7 @@ void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
-void cpu_exec_exit(CPUState *cpu);
+void cpu_exec_unrealizefn(CPUState *cpu);
 
 #ifdef CONFIG_SOFTMMU
 extern const struct VMStateDescription vmstate_cpu_common;
diff --git a/qom/cpu.c b/qom/cpu.c
index 85f1132..03d9190 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -345,6 +345,12 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
     trace_init_vcpu(cpu);
 }
 
+static void cpu_common_unrealizefn(DeviceState *dev, Error **errp)
+{
+    CPUState *cpu = CPU(dev);
+    cpu_exec_unrealizefn(cpu);
+}
+
 static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
@@ -369,7 +375,6 @@ static void cpu_common_initfn(Object *obj)
 static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
-    cpu_exec_exit(cpu);
     g_free(cpu->trace_dstate);
 }
 
@@ -403,6 +408,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->cpu_exec_exit = cpu_common_noop;
     k->cpu_exec_interrupt = cpu_common_exec_interrupt;
     dc->realize = cpu_common_realizefn;
+    dc->unrealize = cpu_common_unrealizefn;
     /*
      * Reason: CPUs still need special care by board code: wiring up
      * IRQs, adding reset handlers, halting non-first CPUs, ...
diff --git a/target-i386/cpu-qom.h b/target-i386/cpu-qom.h
index e724004..7c9a07a 100644
--- a/target-i386/cpu-qom.h
+++ b/target-i386/cpu-qom.h
@@ -68,6 +68,7 @@ typedef struct X86CPUClass {
     const char *model_description;
 
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     void (*parent_reset)(CPUState *cpu);
 } X86CPUClass;
 
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index eedce4a..4c8e869 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -3356,6 +3356,8 @@ out:
 static void x86_cpu_unrealizefn(DeviceState *dev, Error **errp)
 {
     X86CPU *cpu = X86_CPU(dev);
+    X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
 
 #ifndef CONFIG_USER_ONLY
     cpu_remove_sync(CPU(dev));
@@ -3366,6 +3368,12 @@ static void x86_cpu_unrealizefn(DeviceState *dev, Error **errp)
         object_unparent(OBJECT(cpu->apic_state));
         cpu->apic_state = NULL;
     }
+
+    xcc->parent_unrealize(dev, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
 }
 
 typedef struct BitProperty {
@@ -3640,6 +3648,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     xcc->parent_realize = dc->realize;
+    xcc->parent_unrealize = dc->unrealize;
     dc->realize = x86_cpu_realizefn;
     dc->unrealize = x86_cpu_unrealizefn;
     dc->props = x86_cpu_properties;
diff --git a/target-ppc/cpu-qom.h b/target-ppc/cpu-qom.h
index 713deef..d46c31a 100644
--- a/target-ppc/cpu-qom.h
+++ b/target-ppc/cpu-qom.h
@@ -174,6 +174,7 @@ typedef struct PowerPCCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     void (*parent_reset)(CPUState *cpu);
 
     uint32_t pvr;
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 40dae70..208fa1e 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -9906,11 +9906,17 @@ static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
 static void ppc_cpu_unrealizefn(DeviceState *dev, Error **errp)
 {
     PowerPCCPU *cpu = POWERPC_CPU(dev);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
+    Error *local_err = NULL;
     opc_handler_t **table, **table_2;
     int i, j, k;
 
-    cpu_exec_exit(CPU(dev));
+    pcc->parent_unrealize(dev, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
         if (env->opcodes[i] == &invalid_handler) {
@@ -10521,6 +10527,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     pcc->parent_realize = dc->realize;
+    pcc->parent_unrealize = dc->unrealize;
     pcc->pvr_match = ppc_pvr_match_default;
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_always;
     dc->realize = ppc_cpu_realizefn;
-- 
2.7.4

