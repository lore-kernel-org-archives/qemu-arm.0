Received: by 10.25.221.202 with SMTP id w71csp2358378lfi;
        Fri, 4 Aug 2017 10:33:15 -0700 (PDT)
X-Received: by 10.55.69.73 with SMTP id s70mr4115458qka.291.1501867995524;
        Fri, 04 Aug 2017 10:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501867995; cv=none;
        d=google.com; s=arc-20160816;
        b=oVViut3vdkMaW7BcGgvT4dLIC/0JmhOZ6fDCDuQKJdj13PO7iplaGJYU2ikQOl3CFL
         MmFKQHaWQVT+N6cfzwBb5GERLOIACDM4H7LGZva0y4eLjRIp33pu3I5SpWOxgErEl9Ii
         62DI2ooKamd0cmkdnJXLrU6Cp+Y09+v3a1o0fVVISAXpxOvpgjCKEatt2jfaSqBl0KYa
         KPHyZ+7gUcvWo7zsoE+G4I4ERyPrvm5Nk1775Zl8KxU8Ic5USZfa/xwz5yK1FMQMLKmp
         PADtu/p9odjvVoS1kOcY4QTbYGwfcK9WolS6VEi+QFi2RoBAc7A72VVL5v1iL5wM8KEn
         6d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=z3oFB170EXueAdyWVSsysPr05zdfm+glpwPS6I0jlAw=;
        b=Z4PctR1cSn6FePELB46YiShNkN8Ra2k/Cttvyk6NFO2usElGywLL3aDI/UqZurA1/z
         5Vo9vPjlE1WEkvHRhkix63gV3U7wgSiSGFSfKzDutVJd8/OiSL6lfnYf6WdgYZdgnARO
         qJfkiHgSEu7+wY3+sThXmk3vFUDbeSxkqrERTiFHY5lFhu15NMXlfPmdjyD1GExqQi57
         lO9Ob9GxwMRcwPBgA8Sj8kTQiyQw5VYRsol2JL6yZbklioJyDa2F/B2xWk3Flewyw322
         fAc+9+ak73yMKlTyq+FuT7ArrpGne0ac0K+PGMBqaCYdeC4+M7ITnolwveE+/iTxDZTy
         qy6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o78si1976796qki.275.2017.08.04.10.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:33:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgTI-0007UH-Fs
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:33:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTD-0007TM-S7
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTC-0001iL-IX
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgTC-0001gy-Bg; Fri, 04 Aug 2017 13:33:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHM-0006sy-69; Fri, 04 Aug 2017 18:20:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:45 +0100
Message-Id: <1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zbx+ZDh+TsaY

Define a new MachineClass field ignore_memory_transaction_failures.
If this is flag is true then the CPU will ignore memory transaction
failures which should cause the CPU to take an exception due to an
access to an unassigned physical address; the transaction will
instead return zero (for a read) or be ignored (for a write).  This
should be set only by legacy board models which rely on the old
RAZ/WI behaviour for handling devices that QEMU does not yet model.
New board models should instead use "unimplemented-device" for all
memory ranges where the guest will attempt to probe for a device that
QEMU doesn't implement and a stub device is required.

We need this for ARM boards, where we're about to implement support for
generating external aborts on memory transaction failures. Too many
of our legacy board models rely on the RAZ/WI behaviour and we
would break currently working guests when their "probe for device"
code provoked an external abort rather than a RAZ.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h | 11 +++++++++++
 include/qom/cpu.h   |  7 ++++++-
 qom/cpu.c           |  7 +++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3363dd1..7f044d1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -131,6 +131,16 @@ typedef struct {
  *    size than the target architecture's minimum. (Attempting to create
  *    such a CPU will fail.) Note that changing this is a migration
  *    compatibility break for the machine.
+ * @ignore_memory_transaction_failures:
+ *    If this is flag is true then the CPU will ignore memory transaction
+ *    failures which should cause the CPU to take an exception due to an
+ *    access to an unassigned physical address; the transaction will instead
+ *    return zero (for a read) or be ignored (for a write). This should be
+ *    set only by legacy board models which rely on the old RAZ/WI behaviour
+ *    for handling devices that QEMU does not yet model. New board models
+ *    should instead use "unimplemented-device" for all memory ranges where
+ *    the guest will attempt to probe for a device that QEMU doesn't
+ *    implement and a stub device is required.
  */
 struct MachineClass {
     /*< private >*/
@@ -171,6 +181,7 @@ struct MachineClass {
     bool rom_file_has_mr;
     int minimum_page_bits;
     bool has_hotpluggable_cpus;
+    bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
     void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size);
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index fc54d55..8cff86f 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -311,6 +311,9 @@ struct qemu_work_item;
  * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
  *                        to @trace_dstate).
  * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
+ * @ignore_memory_transaction_failures: Cached copy of the MachineState
+ *    flag of the same name: allows the board to suppress calling of the
+ *    CPU do_transaction_failed hook function.
  *
  * State of one CPU core or thread.
  */
@@ -397,6 +400,8 @@ struct CPUState {
      */
     bool throttle_thread_scheduled;
 
+    bool ignore_memory_transaction_failures;
+
     /* Note that this is accessed at the start of every TB via a negative
        offset from AREG0.  Leave this field at the end so as to make the
        (absolute value) offset as small as possible.  This reduces code
@@ -853,7 +858,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->do_transaction_failed) {
+    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
         cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
                                   mmu_idx, attrs, response, retaddr);
     }
diff --git a/qom/cpu.c b/qom/cpu.c
index 4f38db0..d8dcf64 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -29,6 +29,7 @@
 #include "exec/cpu-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
+#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "trace-root.h"
 
@@ -360,6 +361,12 @@ static void cpu_common_parse_features(const char *typename, char *features,
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
+    Object *machine = qdev_get_machine();
+    ObjectClass *oc = object_get_class(machine);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    cpu->ignore_memory_transaction_failures =
+        mc->ignore_memory_transaction_failures;
 
     if (dev->hotplugged) {
         cpu_synchronize_post_init(cpu);
-- 
2.7.4

