Received: by 10.28.71.27 with SMTP id u27csp829363wma;
        Fri, 19 Jan 2018 06:52:01 -0800 (PST)
X-Google-Smtp-Source: AH8x226wdlN67zXpXwgDarC/L/CjvG5nLg5EdLpNzRYLqo6rup7RUbQid5R8Rd7tIyBgo9QBNXz+
X-Received: by 10.13.208.197 with SMTP id s188mr296964ywd.217.1516373521427;
        Fri, 19 Jan 2018 06:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516373521; cv=none;
        d=google.com; s=arc-20160816;
        b=eCznqu8tlfxyEMFln5mGzdF6iS8AN/AzA99aDn86i/3sRHESq5PHrM8OHUTl1TZ7Sg
         WzN3HCdecDuagr9u5rgXjgbQLsAbRxJSvjwmJ6hhhDO8mRg4fhvfkH6OHHqfQ/pjvuOi
         KZ/Cstat1dUM+XGshTDUa+cP/QqHKLez1cSzMbMLbv3wwlQ2ba6EZEtc9bNhAWV1rzLp
         jiQe2frIADhMsmU5zVw0nH7MsXBO3pprpb32MGku6FumjWf4s2qzRdCDLxHUFVewKPjA
         0WeHH1lEI1M3Wnfu0V4c+fUor4zG6BHkXLswAZQYyeQsYf+6Mo2jASzgbhqoXw8WtarE
         Ad8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MvMkLVnEofsZ0qGicOrLjbUh1jDgJX4EeNXLwamcmtY=;
        b=UeEmnlBKW7syKeUjzKyDDXIThXbnPIcw+ohDvcM+gng408/Y5Cz1t79tJizyg5jdb0
         E7voLOXj5VCzixlfS4XX1vW//YBDkjJqDaE04LkUPz5afwNdLOTjjXAI83BTXrVVJtzj
         Ba6pLMzOnExwTIogyvuKt3GM67XCEbIJpJ5XGRBLutWEcjBR3mG+y/HrLWBQV053yGzn
         JVZcBnMiukBclkTS2OUuEuG7UnU2kyNaPN+miFgyvMBk3Utlauh4+oKi2+saGsaKhloN
         OHHaqg3QgQ2b41Ln02O00jFJ401r8FeTdo4SCmepAbV0laclHWXV7WU6wTT3xdOFxywD
         7r1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p125si623409ybb.831.2018.01.19.06.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 06:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecY1Q-0005lX-QU
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 09:52:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY0M-000524-5n
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY0L-0006qP-A6
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:50:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecY0L-0006p0-2q; Fri, 19 Jan 2018 09:50:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C9E65586C;
	Fri, 19 Jan 2018 14:50:51 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 036535C25E;
	Fri, 19 Jan 2018 14:50:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:48:55 +0000
Message-Id: <1516373355-305-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 19 Jan 2018 14:50:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 02/22] hw/arm/virt: Implement get_primary_pci_bus
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QeQtD/nCE0xl

get_primary_pci_bus() returns the root bus. We also
add the PCIBus handle to VirtMachineState.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 11 ++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 543f9bd..7844311 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -999,7 +999,7 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
-static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
+static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
@@ -1062,6 +1062,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
 
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
+        vms->pci_bus = pci->bus;
         for (i = 0; i < nb_nics; i++) {
             NICInfo *nd = &nd_table[i];
 
@@ -1581,6 +1582,13 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static PCIBus *virt_get_primary_pci_bus(const MachineState *ms)
+{
+    VirtMachineState *vms = VIRT_MACHINE(ms);
+
+    return vms->pci_bus;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1601,6 +1609,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->get_primary_pci_bus = virt_get_primary_pci_bus;
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..7e31e99 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -106,6 +106,7 @@ typedef struct {
     uint32_t gic_phandle;
     uint32_t msi_phandle;
     int psci_conduit;
+    PCIBus *pci_bus;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-- 
1.9.1

