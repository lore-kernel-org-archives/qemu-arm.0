Received: by 10.223.172.38 with SMTP id v35csp1580624wrc;
        Tue, 5 Sep 2017 08:55:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBifaPWcAw66J5eyWifUGgJKYpFB4syZTeZc8/C5RaIz/SM2iz1V3pY/d/S2+eSiH9gHHEE
X-Received: by 10.55.25.29 with SMTP id k29mr3368911qkh.229.1504626909196;
        Tue, 05 Sep 2017 08:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504626909; cv=none;
        d=google.com; s=arc-20160816;
        b=nQ3T62WR1r1UciXWZqiQliy289JXvBUqEvnPIDig32e9uU2bY4XnliPpiBzM48OeTc
         gN6NTerWUzGSkv3OWx9sx/afnWFcBg7d7REWB+0fkcD9J3hJrCdvf2to+2e+ISpr/Zxl
         dvbWPwuZYnfnD/KCY/GpT7Fe9oZYMPmhIV6IwkIfjGv8tBn4H0u/lZi+kjJcKZUOpkE9
         x2K1fiKqogbiowQmlsJDVL6qUVSfEjX436hhL0a4dFgYDnDQk22shceUDtnuw3MN/5YB
         c/Ojv1tH75wA4x27Hk6KMFREJBEvZtoYArDZROpuIN7xrPhFjT5/UwABUO6dlYQjdPvr
         gmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=slMpr7YhTgdHcW7O5lZoqk4JtxQ/YWJjCYGMbYicSKs=;
        b=gI0miE2DftbBpyyI1jOx7N52/ZFE/5epbqdDWdBMay2yRBehZ+jqLMmz6+fOhtUmR+
         q+Ih4oiWs+hwvfuXQjdQotX/KQC/zt0CMfV88DiS1fkZL4/JQr6ADOb8tDzbmg9i6Vsf
         KnM2J+6iRsRGn2K3RkKxi1KbG1Kp7fJA8zoiURF3wHQWqMnvh9liqKm19mnWaD5ONIv9
         yK7DwGbJKJUXDyoL6NZ1TiTySHGrc1EJZdt3LT+O4KPebiKJKOk/11xLs2jZmv9iU+kP
         r1hZ31vGLV7ufi8ryh2tCuTrtF1lGtJQr+Z1WCUgC+QwvIi2HrJBdFCDYmj4FdOdaaeU
         7jlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si539054qtp.275.2017.09.05.08.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 08:55:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGBu-0001T3-Sx
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 11:55:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpGAO-0000CQ-FB
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpGAJ-0004Ay-J4
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:53:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dpGAJ-00045L-At; Tue, 05 Sep 2017 11:53:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dpGA8-00079N-Cr; Tue, 05 Sep 2017 16:53:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 16:53:32 +0100
Message-Id: <1504626814-23124-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
References: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 1/3] boards.h: Define new flag
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
X-TUID: M0vutWAjWLZ8

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
 qom/cpu.c           | 16 ++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

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
index 08bd868..995a7be 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -312,6 +312,9 @@ struct qemu_work_item;
  * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
  *                        to @trace_dstate).
  * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
+ * @ignore_memory_transaction_failures: Cached copy of the MachineState
+ *    flag of the same name: allows the board to suppress calling of the
+ *    CPU do_transaction_failed hook function.
  *
  * State of one CPU core or thread.
  */
@@ -398,6 +401,8 @@ struct CPUState {
      */
     bool throttle_thread_scheduled;
 
+    bool ignore_memory_transaction_failures;
+
     /* Note that this is accessed at the start of every TB via a negative
        offset from AREG0.  Leave this field at the end so as to make the
        (absolute value) offset as small as possible.  This reduces code
@@ -864,7 +869,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->do_transaction_failed) {
+    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
         cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
                                   mmu_idx, attrs, response, retaddr);
     }
diff --git a/qom/cpu.c b/qom/cpu.c
index deb8880..dc5392d 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -29,6 +29,7 @@
 #include "exec/cpu-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
+#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "trace-root.h"
 
@@ -363,6 +364,21 @@ static void cpu_common_parse_features(const char *typename, char *features,
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
+    Object *machine = qdev_get_machine();
+
+    /* qdev_get_machine() can return something that's not TYPE_MACHINE
+     * if this is one of the user-only emulators; in that case there's
+     * no need to check the ignore_memory_transaction_failures board flag.
+     */
+    if (object_dynamic_cast(machine, TYPE_MACHINE)) {
+        ObjectClass *oc = object_get_class(machine);
+        MachineClass *mc = MACHINE_CLASS(oc);
+
+        if (mc) {
+            cpu->ignore_memory_transaction_failures =
+                mc->ignore_memory_transaction_failures;
+        }
+    }
 
     if (dev->hotplugged) {
         cpu_synchronize_post_init(cpu);
-- 
2.7.4

