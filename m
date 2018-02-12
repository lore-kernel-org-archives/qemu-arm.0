Received: by 10.28.71.27 with SMTP id u27csp205617wma;
        Mon, 12 Feb 2018 11:01:14 -0800 (PST)
X-Google-Smtp-Source: AH8x225JBm9519WF0fbWBdFxNJHlM2msXMYQ7pMdJRocA3fusmn0SE0nC/QMe8MHmlDIwBKRkTry
X-Received: by 10.37.211.130 with SMTP id e124mr8440375ybf.152.1518462074697;
        Mon, 12 Feb 2018 11:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462074; cv=none;
        d=google.com; s=arc-20160816;
        b=gSWY4L63NIE7z+RvfBC49bePy10y0Br+f7P2UQlmNMsEYlqsrKDF0vP1UVL9/aLd56
         jZRdmL/4JbeTJ/8FfhRCXBxu7r0yDXKW7gYPOHJ6tMybaOVSvSdJkr7H9qT8WeSPdAHi
         aJ9FyVjvTFONWBVsQkA5qwwI9q7kzYxnumRWh+Yb1OENvGtFNJkLkdQSQI98WH0s4rVJ
         6ORv3yN0VVPLh0ohgdB/VKbfrmxA+Wu+3yW3dRYo44eF4LE08dflNxn6YU2QE0Iw7ZSE
         Exd1AyrLcuGEQb4ccMFgxvRHfxULzR4lEhQ5wfcXZ0xYKcGqYnqbenMGAzTbsLELSMHo
         jDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Rbx7IWOY233saQqSFeI0AnlnPX0p9ZdU9tcau1j3BBU=;
        b=GfPc0/FjtixW6phRY8aTBrkfum7NfcCKpHDdHSDkAtcrH9fc5JV3HFTR2PfB1yGJKJ
         u/9XsiDsqVDkKBo7ZifgqFDAWllLyCxc08KQGbfnUk3edAysBZ8vkUWHIHxuSNpKke1n
         zYgFuLcyZq5i5XjPtCSjccN8VaiNEHRgT3ukRMPn1XUzXiCl9NzefprW8TfAnLAoDDVz
         WkqK8lLyRLYEWBjEAsjcbQiCgtFLeov+VO6v5+hugswdnjMkOqivRc9mJibXlzRr0omx
         26OrP0HylEZnEM7WwXrZVHybsiFHq4Xc1TgriqZIxP20AUV8GHiSAm1E8sr8AicCSv2S
         aWwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si270653ybv.448.2018.02.12.11.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJLl-0001mP-Vm
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:01:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJb-0008Cq-GN
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJZ-0002Cm-IE
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:58:59 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34170 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJJZ-0002BJ-Dp; Mon, 12 Feb 2018 13:58:57 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A22F48182D2F;
	Mon, 12 Feb 2018 18:58:56 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 943C11006ED7;
	Mon, 12 Feb 2018 18:58:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:04 +0000
Message-Id: <1518461904-5305-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:58:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:58:56 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 02/22] hw/arm/virt: Implement get_primary_pci_bus
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
X-TUID: QfvmMWVJfw2d

get_primary_pci_bus() returns the root bus. We also
add the PCIBus handle to VirtMachineState.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 11 ++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dbb3c80..08ac411 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -941,7 +941,7 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
-static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
+static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
@@ -1004,6 +1004,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
 
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
+        vms->pci_bus = pci->bus;
         for (i = 0; i < nb_nics; i++) {
             NICInfo *nd = &nd_table[i];
 
@@ -1523,6 +1524,13 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
@@ -1544,6 +1552,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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

