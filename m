Received: by 10.80.166.35 with SMTP id d32csp514853edc;
        Fri, 14 Oct 2016 16:02:00 -0700 (PDT)
X-Received: by 10.55.185.69 with SMTP id j66mr4108626qkf.264.1476486120060;
        Fri, 14 Oct 2016 16:02:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si11060388qka.157.2016.10.14.16.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 16:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bvBUF-0002wt-N4
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 19:01:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bvBUB-0002wl-8T
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 19:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bvBU6-0002Kg-N7
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 19:01:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bvBU6-0002K9-Dx; Fri, 14 Oct 2016 19:01:50 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B680F85365;
	Fri, 14 Oct 2016 22:53:23 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EMqoto012280; Fri, 14 Oct 2016 18:53:16 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Oct 2016 00:52:49 +0200
Message-Id: <1476485569-6744-4-git-send-email-lvivier@redhat.com>
In-Reply-To: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 14 Oct 2016 22:53:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 3/3] exec: call cpu_exec_exit() from a CPU
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
Cc: Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>, Jia Liu <proljc@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Anthony Green <green@moxielogic.com>, Alexander Graf <agraf@suse.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Greg Ungerer <gerg@uclinux.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 44uZ5DWvtVZv

As cpu_exec_exit() mirrors the cpu_exec_realizefn(),
rename it as cpu_exec_unrealizefn().

Create and register a cpu_common_unrealizefn() function for
the CPU device class and call cpu_exec_unrealizefn() from
this function.

Remove cpu_exec_exit() from cpu_common_finalize()
(which mirrors init, not realize), and as x86_cpu_unrealizefn()
overwrites the device class unrealize function, add a call to
cpu_exec_unrealizefn() (as in ppc_cpu_unrealizefn()).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 exec.c                      | 2 +-
 include/qom/cpu.h           | 2 +-
 qom/cpu.c                   | 8 +++++++-
 target-i386/cpu.c           | 2 ++
 target-ppc/translate_init.c | 2 +-
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 203eb52..3cd25db 100644
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
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 3476d46..399a3e4 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -3253,6 +3253,8 @@ static void x86_cpu_unrealizefn(DeviceState *dev, Error **errp)
         object_unparent(OBJECT(cpu->apic_state));
         cpu->apic_state = NULL;
     }
+
+    cpu_exec_unrealizefn(CPU(dev));
 }
 
 typedef struct BitProperty {
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 40dae70..2de6a06 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -9910,7 +9910,7 @@ static void ppc_cpu_unrealizefn(DeviceState *dev, Error **errp)
     opc_handler_t **table, **table_2;
     int i, j, k;
 
-    cpu_exec_exit(CPU(dev));
+    cpu_exec_unrealizefn(CPU(dev));
 
     for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
         if (env->opcodes[i] == &invalid_handler) {
-- 
2.7.4

