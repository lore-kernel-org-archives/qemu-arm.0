Received: by 10.25.85.209 with SMTP id j200csp101870lfb;
        Fri, 10 Jun 2016 10:43:47 -0700 (PDT)
X-Received: by 10.140.175.135 with SMTP id v129mr3086095qhv.5.1465580627122;
        Fri, 10 Jun 2016 10:43:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si6886487qkg.132.2016.06.10.10.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQTC-00008p-Bd
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:43:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQY-0006ZQ-Fw
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQX-0000SW-FJ
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQP-0000QI-Tr; Fri, 10 Jun 2016 13:40:54 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70B0E80E4A;
	Fri, 10 Jun 2016 17:40:53 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPZ032552; Fri, 10 Jun 2016 13:40:51 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:19 +0200
Message-Id: <1465580427-13596-9-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 10 Jun 2016 17:40:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RFC 08/16] hw/core/machine: set cpu global
 nr_cores, nr_threads in pre_init
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEI3NK+AefiF

CPUState nr_cores and nr_threads are properties so we can set
them using the GlobalProperty API. Doing this in machine pre_init
allows us to easily propagate the values from the machine properties
to all cpus. An excellent bonus of this is that we can now remove
the references to the cpu topology globals smp_cores,smp_threads
from cpus.c.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 cpus.c            |  2 --
 hw/core/machine.c | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/cpus.c b/cpus.c
index 326742f445eef..36d8faa0091c8 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1427,8 +1427,6 @@ static void qemu_dummy_start_vcpu(CPUState *cpu)
 
 void qemu_init_vcpu(CPUState *cpu)
 {
-    cpu->nr_cores = smp_cores;
-    cpu->nr_threads = smp_threads;
     cpu->stopped = true;
 
     if (!cpu->as) {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 75c5a1fdd7de1..5427924d4c911 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -511,9 +511,22 @@ static void machine_set_smp_parameters(MachineState *ms)
     ms->cpus    = cpus;
 }
 
+#define NR_CPUS_STRLEN sizeof(stringify(MAX_CPUMASK_BITS))
+
 static void machine_pre_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_CLASS(object_get_class(OBJECT(ms)));
+    static char nr_cores[NR_CPUS_STRLEN], nr_threads[NR_CPUS_STRLEN];
+    static GlobalProperty cpu_nr_cores = {
+        .driver   = "cpu",
+        .property = "nr-cores",
+        .value    = nr_cores,
+    };
+    static GlobalProperty cpu_nr_threads = {
+        .driver   = "cpu",
+        .property = "nr-threads",
+        .value    = nr_threads,
+    };
 
     machine_set_smp_parameters(ms);
     smp_cores   = ms->cores;
@@ -529,6 +542,11 @@ static void machine_pre_init(MachineState *ms)
         exit(1);
     }
 
+    snprintf(nr_cores, NR_CPUS_STRLEN, "%d", ms->cores);
+    snprintf(nr_threads, NR_CPUS_STRLEN, "%d", ms->threads);
+    qdev_prop_register_global(&cpu_nr_cores);
+    qdev_prop_register_global(&cpu_nr_threads);
+
     if (ms->cpus > 1) {
         Error *blocker = NULL;
         error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-- 
2.4.11

