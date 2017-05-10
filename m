Received: by 10.25.0.6 with SMTP id 6csp242284lfa;
        Wed, 10 May 2017 04:40:23 -0700 (PDT)
X-Received: by 10.233.223.196 with SMTP id t187mr4777137qkf.31.1494416423804;
        Wed, 10 May 2017 04:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416423; cv=none;
        d=google.com; s=arc-20160816;
        b=kkxKWpYiPtfgO85UXsMx8RkWSSkRYIqnctgIRlnmrNqSNmEqMkznnCv4lAIR59xUod
         N7FY8aSMvg/kv2aIcw33c5QeR4SCDbde4NwI3rejcv1cEUt9NzC2DFgXdOQNbMilRxqp
         J2ftXQO+YBkh3yjZTa5dYK/U8OPtmBJYKFsbIJo+HE3YPK/kNNPqBqj0a34naasMKork
         LuE69PNzePnJvdHuU74pXrHFMfWMnMMnaxVUrFsZ2pqPflTgSMXVIb3pfANRMlmw6C07
         I0+9hmnAjoRnVjccH1miJKlnkwWg1OK7PX0M9GxGmPjOifPTHoT/jgloKv/Gv4uHmjLS
         q69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=S28Mf9ksoeQcD7SPGvfi8H09foXe07gs3H1/1vVHOJc=;
        b=FNngdX/UdYaUr7DWXTSLIMJVTF2iF6EL0KUWkNdNDTY/sv/sOPm7lmLuxbaD642WBx
         xW0jYvnjKG05tv07bVsem8lT0a2AdEamhKMmSb0wdef2UnwqPiyCMnvQ+PIUaK7N/aS4
         ifQxvdRkCNqwlZf13x5ADFqL84OWKYt0GYTs213QpUAtOMaXPvrcQf5cM5u6R33p9HpH
         kH05CaBTzILbGeBLKtkfvZfaUIBHK6HJ9iyljuJlKDB8mqoFdWZtfy5ujMclQHY+2dUB
         WG0AIPkbEaWaBZ/552AXNWIjBVNkAFhFvL6zTC+pVJlRd+Bzj0seMUgZ0b97B1UOoFm/
         YrQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h6si2915369qkd.281.2017.05.10.04.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pyh-0007gm-6D
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:40:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpO-0007t0-7b
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpN-0001pV-Fw
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpN-0001p7-AP; Wed, 10 May 2017 07:30:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49E78C04B310;
	Wed, 10 May 2017 11:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 49E78C04B310
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 49E78C04B310
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5958F7DFF5;
	Wed, 10 May 2017 11:30:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:58 +0200
Message-Id: <1494415802-227633-15-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 10 May 2017 11:30:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 14/18] machine: call machine init from wrapper
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
X-TUID: gr2ODBKZAxQU

add machine_run_board_init() wrapper that calls machine
init for now but in follow up patches it will be used
to run generic machine code that should run before
machine init.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/boards.h | 1 +
 hw/core/machine.c   | 6 ++++++
 vl.c                | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4e14ff0..76ce021 100644
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
index 420c8c4..64e2a4f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -678,6 +678,12 @@ bool machine_mem_merge(MachineState *machine)
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
index fe4741d..ac46d6e 100644
--- a/vl.c
+++ b/vl.c
@@ -4562,7 +4562,7 @@ int main(int argc, char **argv, char **envp)
     current_machine->boot_order = boot_order;
     current_machine->cpu_model = cpu_model;
 
-    machine_class->init(current_machine);
+    machine_run_board_init(current_machine);
 
     realtime_init();
 
-- 
2.7.4

