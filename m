Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp637898ocb;
        Thu, 6 Oct 2022 10:18:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eb8KM/5oyljE9mXHBbS5ctog+4Mk1MIIC/BB+waR5ezxdVcuMG9IiMDmrIXELx3dOlw6z
X-Received: by 2002:a05:620a:1b8b:b0:6cf:4dbc:e0a9 with SMTP id dv11-20020a05620a1b8b00b006cf4dbce0a9mr926220qkb.342.1665076692610;
        Thu, 06 Oct 2022 10:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665076692; cv=none;
        d=google.com; s=arc-20160816;
        b=mM4asBEDBhlae2Q0Rb4p6SgKmfr4+FHTpH0qtuvAHS2Li63NU5Fin7+1ZUmbKJxtk8
         CNQFRK475A07RrZy2ca6L9Cc289+eBpEx01mDA73mO1kmAhSPL+wlKQMz7GNgNDCF1KT
         MRVt7H9udaQjiTONLg82s6bAZXwp4QTvcVKz/S0377pIEB6EI37eRmOj00WvvBCq5s/d
         ZB8YdpBGmbumvk7+rFWuEWA4fe2mbkClqyuJeap6RaOMUhVUKuh+pT1m5ITS8TMmSP+C
         Wp8zpmceNVV8WQicmCZrvLVQDJtnCBY+1xgg+qeZb2dQcln7sURMgkUQTbITKAuxTQbU
         +l2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3KYlp9niCt61OSJPWbphR2HpAFLdUAVFlJ/zEozb2SI=;
        b=I8bLVZnNrE7dOntjYf0vnLy9fE2k89cbnshcfS+DYKo7xXH6gwtQWQt4F9UshEbcLz
         EU2P8YEzwI/Z35lrGrhkTRCKiuwdn7Rm97tXyHFXBy1/XbZJ+PzXrxrZ92FgyA/j8fvX
         VkQAimITiaV8zsITONjLm/iA44qILOa6ir7YlT9lgTJpziHW88wl/784iIpnVXV+3vMX
         j4WNDZ0qjM+2XwoSMKPwnwKek6zFb131Bf/PSbcLUL35YDxJmfs/KBs1dzjRhtbMCb9d
         Jl+U2S6LAIt+OZm/dPaBwF6AFDsB1oymXRKu5Z7BcOfEybwu2odiGsWF8vpgjkCnErJe
         3zTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=nijCasxj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a379102000000b006cfc1e935b9si7568083qkd.185.2022.10.06.10.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 10:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=nijCasxj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogUVe-00080a-UK
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 13:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTXB-0007Oq-Bd; Thu, 06 Oct 2022 12:15:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTX9-0006nZ-6u; Thu, 06 Oct 2022 12:15:40 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296FhmeR001815;
 Thu, 6 Oct 2022 16:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=3KYlp9niCt61OSJPWbphR2HpAFLdUAVFlJ/zEozb2SI=;
 b=nijCasxjYJYuUeDsWWq8nCPqTApRh+GX+oGnfFNjy+sE7LRd8I02R+b19n81kR8Lnabw
 //u98TONYTOV8u/ATXiFNoOmMmeedIUUCxSJOJDvbxI2fsN5EUsxOUR2NFI1gbFOgY1H
 2QsEnwKhStPAskHFahWTMlRElcQ9tS1cKMLm0CeKR2aUAjWGeQVP+p8Zk2+MY73I5aKi
 O/l/1TmD2GbLl6NrztEPp4syed3dI+7JN/Fx2/WDjFgDdPSmoRRovGidPBF1LaKSpTzQ
 SiknXz6zxCHnEKzJ3S8eY4PBLTDNkyCyQ2D6rb7gHsDkeywSM8GK75YQYbi1uyqZTB/p vg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxd5tmn57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:37 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296FAfJo028246; Thu, 6 Oct 2022 16:15:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06eqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:36 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296GFLrj001092;
 Thu, 6 Oct 2022 16:15:35 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-170-234.vpn.oracle.com
 [10.175.170.234])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc06eq1e-3; Thu, 06 Oct 2022 16:15:35 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
Date: Thu,  6 Oct 2022 16:14:48 +0000
Message-Id: <20221006161450.69912-3-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006161450.69912-1-miguel.luis@oracle.com>
References: <20221006161450.69912-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060094
X-Proofpoint-ORIG-GUID: cpAo_Gu8ZCtUxilNMK1BpbgQtI02VTOp
X-Proofpoint-GUID: cpAo_Gu8ZCtUxilNMK1BpbgQtI02VTOp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JqdKaQX6gVN3

Update the Fixed ACPI Description Table (FADT) to revision 6.0 of the ACPI
specification adding the field "Hypervisor Vendor Identity" that was missing.

This field's description states the following: "64-bit identifier of hypervisor
vendor. All bytes in this field are considered part of the vendor identity.
These identifiers are defined independently by the vendors themselves,
usually following the name of the hypervisor product. Version information
should NOT be included in this field - this shall simply denote the vendor's
name or identifier. Version information can be communicated through a
supplemental vendor-specific hypervisor API. Firmware implementers would
place zero bytes into this field, denoting that no hypervisor is present in
the actual firmware."

Hereupon, what should a valid identifier of an Hypervisor Vendor ID be and
where should QEMU provide that information?

On this RFC there's the suggestion of having this information in sync by the
current acceleration name. This also seems to imply that QEMU, which generates
the FADT table, and the FADT consumer need to be in sync with the values of this
field.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 hw/acpi/aml-build.c      | 14 +++++++++++---
 hw/arm/virt-acpi-build.c | 10 +++++-----
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index e6bfac95c7..5258c4ac64 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -31,6 +31,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
 #include "qemu/cutils.h"
+#include "qemu/accel.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -2070,7 +2071,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_end(linker, &table);
 }
 
-/* build rev1/rev3/rev5.1 FADT */
+/* build rev1/rev3/rev5.1/rev6.0 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
 {
@@ -2193,8 +2194,15 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     /* SLEEP_STATUS_REG */
     build_append_gas_from_struct(tbl, &f->sleep_sts);
 
-    /* TODO: extra fields need to be added to support revisions above rev5 */
-    assert(f->rev == 5);
+    if (f->rev <= 5) {
+        goto done;
+    }
+
+    /* Hypervisor Vendor Identity */
+    build_append_padded_str(tbl, current_accel_name(), 8, '\0');
+
+    /* TODO: extra fields need to be added to support revisions above rev6 */
+    assert(f->rev == 6);
 
 done:
     acpi_table_end(linker, &table);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9b3aee01bf..72bb6f61a5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -809,13 +809,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 /* FADT */
-static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
+static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
                             VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
-    /* ACPI v5.1 */
+    /* ACPI v6.0 */
     AcpiFadtData fadt = {
-        .rev = 5,
-        .minor_ver = 1,
+        .rev = 6,
+        .minor_ver = 0,
         .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
         .xdsdt_tbl_offset = &dsdt_tbl_offset,
     };
@@ -945,7 +945,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     /* FADT MADT PPTT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
+    build_fadt_rev6(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
-- 
2.37.3

