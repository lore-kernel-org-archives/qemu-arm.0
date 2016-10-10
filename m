Received: by 10.80.166.35 with SMTP id d32csp6084edc;
        Mon, 10 Oct 2016 09:35:57 -0700 (PDT)
X-Received: by 10.55.179.131 with SMTP id c125mr6482545qkf.14.1476117357523;
        Mon, 10 Oct 2016 09:35:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l65si4014477qkc.180.2016.10.10.09.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Oct 2016 09:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btdYT-0000oG-0q
	for alex.bennee@linaro.org; Mon, 10 Oct 2016 12:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1btdYN-0000mH-1e
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 12:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1btdYJ-0005yP-B1
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 12:35:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1btdYJ-0005yA-4k; Mon, 10 Oct 2016 12:35:47 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ACF3C04B95B;
	Mon, 10 Oct 2016 16:35:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com ([10.34.1.163])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9AGZhbu016657; Mon, 10 Oct 2016 12:35:45 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 10 Oct 2016 18:35:40 +0200
Message-Id: <1476117341-32690-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1476117341-32690-1-git-send-email-drjones@redhat.com>
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 10 Oct 2016 16:35:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/virt-acpi-build: fix MADT generation
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +0cMmmqFrikU

We can't return early from build_* functions, as build_header is
only called at the end.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7b39b1d2d676..c31349561c95 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -556,15 +556,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
         gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
 
-        if (!its_class_name()) {
-            return;
+        if (its_class_name()) {
+            gic_its = acpi_data_push(table_data, sizeof *gic_its);
+            gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
+            gic_its->length = sizeof(*gic_its);
+            gic_its->translation_id = 0;
+            gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
         }
-
-        gic_its = acpi_data_push(table_data, sizeof *gic_its);
-        gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
-        gic_its->length = sizeof(*gic_its);
-        gic_its->translation_id = 0;
-        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
     } else {
         gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
         gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
-- 
2.7.4

