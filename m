Received: by 10.25.15.230 with SMTP id 99csp264182lfp;
        Wed, 22 Mar 2017 06:51:11 -0700 (PDT)
X-Received: by 10.55.166.11 with SMTP id p11mr37380728qke.132.1490190671631;
        Wed, 22 Mar 2017 06:51:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si1121011qki.283.2017.03.22.06.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgfP-0005a1-32
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPa-000096-Tg
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPZ-0002DC-Uh
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgPZ-0002D4-Ol; Wed, 22 Mar 2017 09:34:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A486E7AE93;
	Wed, 22 Mar 2017 13:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A486E7AE93
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A486E7AE93
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1F256046C;
	Wed, 22 Mar 2017 13:34:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:44 +0100
Message-Id: <1490189568-167621-20-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 Mar 2017 13:34:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 19/23] machine: call machine init from
 wrapper
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
X-TUID: v81qzdoe0AHF

add machine_run_board_init() wrapper that calls machine
init for now but in follow up patches it will be used
to run generic machine code that should run before
machine init.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/boards.h | 1 +
 hw/core/machine.c   | 6 ++++++
 vl.c                | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 40f30f1..42742d0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -32,6 +32,7 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
 MachineClass *find_default_machine(void);
 extern MachineState *current_machine;
 
+void machine_run_board_init(MachineState *machine);
 bool machine_usb(MachineState *machine);
 bool machine_kernel_irqchip_allowed(MachineState *machine);
 bool machine_kernel_irqchip_required(MachineState *machine);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 6ff0b45..d284a63 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -643,6 +643,12 @@ bool machine_mem_merge(MachineState *machine)
     return machine->mem_merge;
 }
 
+void machine_run_board_init(MachineState *machine)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(machine);
+    machine_class->init(machine);
+}
+
 static void machine_class_finalize(ObjectClass *klass, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(klass);
diff --git a/vl.c b/vl.c
index e5c1620..2b0aed3 100644
--- a/vl.c
+++ b/vl.c
@@ -4554,7 +4554,7 @@ int main(int argc, char **argv, char **envp)
     current_machine->boot_order = boot_order;
     current_machine->cpu_model = cpu_model;
 
-    machine_class->init(current_machine);
+    machine_run_board_init(current_machine);
 
     realtime_init();
 
-- 
2.7.4

