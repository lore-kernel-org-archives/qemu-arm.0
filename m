Received: by 10.25.85.209 with SMTP id j200csp107344lfb;
        Fri, 10 Jun 2016 10:58:56 -0700 (PDT)
X-Received: by 10.200.37.239 with SMTP id f44mr3221416qtf.57.1465581535194;
        Fri, 10 Jun 2016 10:58:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e61si5021779qgf.53.2016.06.10.10.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQhq-0005Yh-KR
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:58:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQY-0006Zv-VM
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQX-0000Sc-H4
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQX-0000SM-CJ; Fri, 10 Jun 2016 13:41:01 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB66C8F504;
	Fri, 10 Jun 2016 17:41:00 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPc032552; Fri, 10 Jun 2016 13:40:58 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:22 +0200
Message-Id: <1465580427-13596-12-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 10 Jun 2016 17:41:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 11/16] target-ppc: don't use smp_threads
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
X-TUID: 5pInVuNiPmD1

Use CPUState nr_threads instead.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target-ppc/translate_init.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index a1db5009c4a83..f442b2fc934d1 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -24,7 +24,6 @@
 #include <sysemu/kvm.h>
 #include "kvm_ppc.h"
 #include "sysemu/arch_init.h"
-#include "sysemu/cpus.h"
 #include "cpu-models.h"
 #include "mmu-hash32.h"
 #include "mmu-hash64.h"
@@ -9228,15 +9227,15 @@ static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
 
 #if !defined(CONFIG_USER_ONLY)
-    if (smp_threads > max_smt) {
+    if (cs->nr_threads > max_smt) {
         error_setg(errp, "Cannot support more than %d threads on PPC with %s",
                    max_smt, kvm_enabled() ? "KVM" : "TCG");
         return;
     }
-    if (!is_power_of_2(smp_threads)) {
+    if (!is_power_of_2(cs->nr_threads)) {
         error_setg(errp, "Cannot support %d threads on PPC with %s, "
                    "threads count must be a power of 2.",
-                   smp_threads, kvm_enabled() ? "KVM" : "TCG");
+                   cs->nr_threads, kvm_enabled() ? "KVM" : "TCG");
         return;
     }
 #endif
@@ -9248,14 +9247,14 @@ static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    cpu->cpu_dt_id = (cs->cpu_index / smp_threads) * max_smt
-        + (cs->cpu_index % smp_threads);
+    cpu->cpu_dt_id = (cs->cpu_index / cs->nr_threads) * max_smt
+        + (cs->cpu_index % cs->nr_threads);
 
     if (kvm_enabled() && !kvm_vcpu_id_is_valid(cpu->cpu_dt_id)) {
         error_setg(errp, "Can't create CPU with id %d in KVM", cpu->cpu_dt_id);
         error_append_hint(errp, "Adjust the number of cpus to %d "
                           "or try to raise the number of threads per core\n",
-                          cpu->cpu_dt_id * smp_threads / max_smt);
+                          cpu->cpu_dt_id * cs->nr_threads / max_smt);
         return;
     }
 #endif
@@ -9496,7 +9495,7 @@ static void ppc_cpu_unrealizefn(DeviceState *dev, Error **errp)
 
 int ppc_get_compat_smt_threads(PowerPCCPU *cpu)
 {
-    int ret = MIN(smp_threads, kvmppc_smt_threads());
+    int ret = MIN(CPU(cpu)->nr_threads, kvmppc_smt_threads());
 
     switch (cpu->cpu_version) {
     case CPU_POWERPC_LOGICAL_2_05:
-- 
2.4.11

