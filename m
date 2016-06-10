Received: by 10.25.85.209 with SMTP id j200csp107362lfb;
        Fri, 10 Jun 2016 10:58:59 -0700 (PDT)
X-Received: by 10.140.39.199 with SMTP id v65mr3039167qgv.92.1465581539747;
        Fri, 10 Jun 2016 10:58:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d52si6941898qga.57.2016.06.10.10.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQhv-0005bq-6Y
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:58:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQg-0006ia-RM
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQe-0000Uc-Vb
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQe-0000UH-Pw; Fri, 10 Jun 2016 13:41:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5720085A00;
	Fri, 10 Jun 2016 17:41:08 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPf032552; Fri, 10 Jun 2016 13:41:06 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:25 +0200
Message-Id: <1465580427-13596-15-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 10 Jun 2016 17:41:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 14/16] hw/arm/virt: stash cpu topo info in
 VirtGuestInfo
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
X-TUID: +msfe8FQ6fDu

This is a first step to preparing mach-virt for configurable
cpu topology, and is necessary now to prepare to move smbios
code away from using cpu topology globals smp_cores,smp_threads.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c                    | 6 +++++-
 include/hw/arm/virt-acpi-build.h | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 134b6e36623ba..769a49aa5be77 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1281,7 +1281,11 @@ static void machvirt_init(MachineState *machine)
     create_fw_cfg(vbi, &address_space_memory);
     rom_set_fw(fw_cfg_find());
 
-    guest_info->cpus = vbi->cpus;
+    guest_info->sockets = machine->sockets;
+    guest_info->cores   = machine->cores;
+    guest_info->threads = machine->threads;
+    guest_info->maxcpus = machine->maxcpus;
+    guest_info->cpus    = machine->cpus;
     guest_info->fw_cfg = fw_cfg_find();
     guest_info->memmap = vbi->memmap;
     guest_info->irqmap = vbi->irqmap;
diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
index d6c5982960403..a34fb04230e66 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -27,6 +27,10 @@
 #define ACPI_GICC_ENABLED 1
 
 typedef struct VirtGuestInfo {
+    int sockets;
+    int cores;
+    int threads;
+    int maxcpus;
     int cpus;
     FWCfgState *fw_cfg;
     const MemMapEntry *memmap;
-- 
2.4.11

