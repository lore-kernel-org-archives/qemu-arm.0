Received: by 10.80.166.35 with SMTP id d32csp316604edc;
        Thu, 13 Oct 2016 03:56:03 -0700 (PDT)
X-Received: by 10.55.162.150 with SMTP id l144mr6318232qke.72.1476356163541;
        Thu, 13 Oct 2016 03:56:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14si6101884qtb.72.2016.10.13.03.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 03:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1budgA-0006T6-Ux
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 06:56:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1budg3-0006RI-5d
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1budg2-0000hv-6t
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:55:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1budg1-0000gv-UQ; Thu, 13 Oct 2016 06:55:54 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C4FD3F203;
	Thu, 13 Oct 2016 10:55:53 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-197.ams2.redhat.com
	[10.36.7.197])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9DAtjdI001541; Thu, 13 Oct 2016 06:55:51 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	prem.mallappa@broadcom.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Thu, 13 Oct 2016 12:55:43 +0200
Message-Id: <1476356143-10577-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476356143-10577-1-git-send-email-eric.auger@redhat.com>
References: <1476356143-10577-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 13 Oct 2016 10:55:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] ARM: Virt: ACPI: Build an IORT table with RC
 and ITS nodes
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
Cc: tn@semihalf.com, drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4yhIwXFGnVK3

From: Prem Mallappa <prem.mallappa@broadcom.com>

This patch builds an IORT table that features a root complex node and
an ITS node. This complements the ITS description in the ACPI MADT
table and allows vhost-net on ACPI guest.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fa0655a..373630a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -384,6 +384,73 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 }
 
 static void
+build_iort(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
+{
+    int iort_start = table_data->len;
+    AcpiIortTable *iort;
+    AcpiIortNode *iort_node;
+    AcpiIortItsGroup *its;
+    AcpiIortRC *rc;
+    AcpiIortIdMapping *idmap;
+    size_t node_size;
+
+    /* at the moment if there is no its, no need to build the IORT */
+    if (!its_class_name() || guest_info->no_its) {
+        return;
+    }
+
+    iort = acpi_data_push(table_data, sizeof(*iort));
+
+    iort->length = sizeof(*iort);
+    iort->node_offset = table_data->len - iort_start;
+
+    /* ITS group node featuring a single ITS identifier */
+    iort->node_count++;
+    node_size =  sizeof(*its) + sizeof(uint32_t);
+    its = acpi_data_push(table_data, node_size);
+
+    iort_node = &its->iort_node;
+    iort_node->type = ACPI_IORT_NODE_ITS_GROUP;
+    iort_node->length = node_size;
+    iort->length += iort_node->length;
+
+    iort_node->mapping_count = 0;  /* ITS groups do not have IDs */
+    iort_node->mapping_offset = 0; /* no ID array */
+    its->its_count = 1;            /* single ITS identifier */
+    its->identifiers[0] = 0;       /* ID = 0 as described in the MADT */
+
+    /* Root Complex Node with a single ID mapping*/
+    iort->node_count++;
+    node_size = sizeof(*rc) + sizeof(*idmap);
+    rc = acpi_data_push(table_data, node_size);
+
+    iort_node = &rc->iort_node;
+    iort_node->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
+    iort_node->length = node_size;
+    iort->length += iort_node->length;
+
+    iort_node->mapping_count = 1;
+    iort_node->mapping_offset = sizeof(*rc);
+
+    rc->memory_properties.cache_coherency = ACPI_IORT_NODE_COHERENT;
+    rc->memory_properties.hints = 0;
+    rc->memory_properties.memory_flags = 0;
+    rc->ats_attribute = 0;      /* does not support ATS */
+    rc->pci_segment_number = 0; /* MCFG _SEG */
+
+    /* fill array of ID mappings */
+    idmap = &rc->id_mapping_array[0];
+    idmap->input_base = 0;
+    idmap->id_count = 0xFFFF;
+    idmap->output_base = 0;
+    idmap->output_reference = iort->node_offset;
+    idmap->flags = 0;
+
+    build_header(linker, table_data, (void *)(table_data->data + iort_start),
+                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
+}
+
+static void
 build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     AcpiSerialPortConsoleRedirection *spcr;
@@ -676,6 +743,7 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
      * MADT
      * MCFG
      * DSDT
+     * IORT = ACPI 6.0
      */
 
     /* DSDT is pointed to by FADT */
@@ -703,6 +771,9 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
         build_srat(tables_blob, tables->linker, guest_info);
     }
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_iort(tables_blob, tables->linker, guest_info);
+
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
-- 
2.5.5

