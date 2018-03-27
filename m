Received: by 10.28.71.155 with SMTP id m27csp734093wmi;
        Tue, 27 Mar 2018 07:21:47 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtzx/GP+CKAyoR54IydpPPPBfraXN6p91i5KR24jBZFpwMaLmVwgbKVAagt0UWU74ttUp/S
X-Received: by 2002:a25:3cd:: with SMTP id 196-v6mr26655733ybd.491.1522160507235;
        Tue, 27 Mar 2018 07:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160507; cv=none;
        d=google.com; s=arc-20160816;
        b=0NhaZM86dUu+nKiN0igHbJUCcZLjFgFk3NDKBbAksy1thhwEKGWjK/IsStzN8xidYa
         N87uF6fn2GwuGPnIDyOZWLy3qUtHInw/taflzmRu0UWFypyJ3jXYofjj14iMMQ6JGJE8
         V67GDUBt/CPC2z22kOFVjSUCO6IQvZK1b33YYa+KAOnk68YfQMwJ2P6hynY3C882whLG
         MIiVs5F57pDQYdk3qyluHW87wzd35w8wtvVNt3FpHCUML282srXcNWCoD4JwHfxVKbAH
         KAYGaHVYMN8oXTGmfqjUX14WKxO1mFcXoxiQCdqePc9sT+ziMoTqO3OVZlpgGUEoo5Jj
         9DLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=arp83PPAVt7eqJRmVVf+30SHEiTeuR5IOSVqMxrfP8w=;
        b=Nobt98qgptW7FWt494Cb5GBxwGAd9qU5pMJl0Z+7t9EkEb576YAU2NdYX+GJdrvwIq
         s/ZthIDQeoPFnCybPY7n8inXl+AlNecSOgFUVZXmCxwnudX5lCpIbnLkYXxEg/4RYiJF
         PQxGwrzXv90587fQaR3DX/5E0rJvKu8HktIOd3gwxhOw3DGScHF+pghphbLpxDkaOeRM
         APuDZeoyewOM2Arl7JnlnndMuS2itc7R4COwwD/eKWUjWy4ZILJ+F7zEQHGbOjboNTcu
         FSjMWlD0TYYOPR2TrDjjh4qST6w5F5kmDNU2on4cxfC2QP2JvCSxW50Qz6x40d93MYPJ
         CMRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si1545005qta.36.2018.03.27.07.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pTu-0001gQ-O1
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOH-0003Df-SP
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOH-0006hi-1h
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51308 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pOG-0006gt-UD; Tue, 27 Mar 2018 10:15:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BFE7722C6;
	Tue, 27 Mar 2018 14:15:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B07046F9E6;
	Tue, 27 Mar 2018 14:15:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:21 +0200
Message-Id: <1522160122-10744-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:56 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 7/8] hw/arm/virt-acpi-build: Handle multiple GICR
 structures
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PXUVxS6P1UZq

In case multiple redistributor regions were registered,
let's add the corresponding GICR structures in the MADT
ACPI table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c7c6a57..aefc1b4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
+#include "hw/intc/arm_gicv3.h"
 #include "sysemu/numa.h"
 #include "kvm_arm.h"
 
@@ -618,14 +619,22 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     if (vms->gic_version == 3) {
+        GICv3State *s = (GICv3State *)vms->gic;
+        int r;
+
         AcpiMadtGenericTranslator *gic_its;
-        AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
-                                                         sizeof *gicr);
 
-        gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
-        gicr->length = sizeof(*gicr);
-        gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
-        gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
+        for (r = 0; r <  s->nb_redist_regions; r++) {
+            AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
+                                                                sizeof *gicr);
+
+            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
+            gicr->length = sizeof(*gicr);
+            gicr->base_address = cpu_to_le64(s->redist_region[r].base);
+            /* count redistributors of 2 x 64kB pages */
+            gicr->range_length =
+                cpu_to_le64((uint64_t)s->redist_region[r].count << 17);
+        }
 
         if (its_class_name() && !vmc->no_its) {
             gic_its = acpi_data_push(table_data, sizeof *gic_its);
-- 
2.5.5

