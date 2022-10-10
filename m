Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2434851ocg;
        Mon, 10 Oct 2022 06:32:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43OFMsovVASnpHEWgj81w9IdzE7Cj4DC1IdP9bjW6xKRSI6mcyqKaq8NGpHYs+y4Z1pttV
X-Received: by 2002:a05:6214:768:b0:4b3:cb4e:2d1d with SMTP id f8-20020a056214076800b004b3cb4e2d1dmr11657052qvz.50.1665408725350;
        Mon, 10 Oct 2022 06:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665408725; cv=none;
        d=google.com; s=arc-20160816;
        b=wbOtbWwNM1G+OOLiH/Ub3EV06TexJZBYeSl4cNcnHPbwGB319xYk9hCTbZsFzBlzMh
         fqIiM8RIMmt1ouoX1M4goF1iN6HiTjby3Xw795UB4MBMFtwOptiVWTei27AgHyx3nXAu
         GDCw2BdMMpSGeQeo2DrHf43qQkM3HfvKb3UawACHz96t8500gy+p8jmAof+Y2IZEAFn8
         q9EMgvc2BQ41BNkcvMIYbFFKVTmcJNnL02EbP0wtR+z9skle+QwB83nPYG38RPLd0C0j
         c+30L3p5afANdCcuMi+f3w40f/y6dH3oZS4vjKfbnkJ/Ji/B8oeB/wxeiUqMUyHgs8ca
         e9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=occ8mz+2XJr1oVuKO/QRWCF380lFZDnwUXkqWPMyE0I=;
        b=OPhiqe2JfmBE5d7Cshhx2SLnJo6dMVuXeTEW2YUQidcqyUVct1knHnzeyW6ERu0pzf
         lt53y8Y4JPT0v6F19tc2qNTOY1cMuleGBuLPu5/5t5DJm35uFiG543/mNUUJoTU9ANFU
         U2B9lRY6ImW+GsO5W8Njt2T8E5G+7Y07cP7IBig7rZWGMBIYCTflXzoOtR7CRFT/Mlb7
         yITxjU7J8zlkfW9xVGkLPEvLORnYQOuQdhz5J4xl3uO8qXVyDqRUqJKHU2C3JEwBVdUz
         qP4e8GzmVpbhXjouy3aWe7S1o32UHlPUQzIp4u1e6jvOwyebzIw4eanF5hj7ofLRwyBU
         F4uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=bfRVJBsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a37a902000000b006ed2a651f0esi1127222qke.154.2022.10.10.06.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 06:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=bfRVJBsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohst2-000894-TQ
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 09:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohskz-00063l-Su; Mon, 10 Oct 2022 09:23:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohskx-0003VE-Ly; Mon, 10 Oct 2022 09:23:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ABxbQP012858;
 Mon, 10 Oct 2022 13:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=occ8mz+2XJr1oVuKO/QRWCF380lFZDnwUXkqWPMyE0I=;
 b=bfRVJBsUtb4xIxMrr3/XXoYaas4jJaMNlYtrcv8anisAtAxC1O1zCSsNydlCnKVsmXEV
 PDwUYhKq2IYyFm3+iperGwhUHfheaEdnSEeOywyaENeGHvFy9jBxyt4CuG5JzTnWJTtv
 ojYSn2rMriTUdoQ9quyFQhz0C/E3vnyIlwsYn2a4KPEOKYzF81fofeyqYSPlNsJstN2M
 MWerSnW2qv+TCP1o078PLOnZjY0nPsng18FjkeHw8JmRqh5t1Ecee2CSrWXqpaG6Nn0n
 vlLsRP0WXI84kmJLH13aiNdXT1SsLXZkpnwEPgEhT7QIK8+S8ak/28A4RrdlQekPxelR hQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k31rtbk79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29AATCwZ021956; Mon, 10 Oct 2022 13:23:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn3484d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:39 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ADNNh4019450;
 Mon, 10 Oct 2022 13:23:38 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-204-94.vpn.oracle.com
 [10.175.204.94])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3k2yn347wn-3; Mon, 10 Oct 2022 13:23:38 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH v2 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
Date: Mon, 10 Oct 2022 13:22:58 +0000
Message-Id: <20221010132300.96935-3-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010132300.96935-1-miguel.luis@oracle.com>
References: <20221010132300.96935-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_08,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100080
X-Proofpoint-GUID: zARCsTkVB8bNGVBoowIPxAV-78gWY3Rz
X-Proofpoint-ORIG-GUID: zARCsTkVB8bNGVBoowIPxAV-78gWY3Rz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j8c58vyNbrUn

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

On the v1 [1] of this RFC there's the suggestion of having this information
in sync by the current acceleration name. This also seems to imply that QEMU,
which generates the FADT table, and the FADT consumer need to be in sync with
the values of this field.

This version follows Ani Sinha's suggestion [2] of using "QEMU" for the
hypervisor vendor ID.

[1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00911.html
[2]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00989.html

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 hw/acpi/aml-build.c      | 13 ++++++++++---
 hw/arm/virt-acpi-build.c | 10 +++++-----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index e6bfac95c7..42feb4d4d7 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2070,7 +2070,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_end(linker, &table);
 }
 
-/* build rev1/rev3/rev5.1 FADT */
+/* build rev1/rev3/rev5.1/rev6.0 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
 {
@@ -2193,8 +2193,15 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     /* SLEEP_STATUS_REG */
     build_append_gas_from_struct(tbl, &f->sleep_sts);
 
-    /* TODO: extra fields need to be added to support revisions above rev5 */
-    assert(f->rev == 5);
+    if (f->rev == 5) {
+        goto done;
+    }
+
+    /* Hypervisor Vendor Identity */
+    build_append_padded_str(tbl, "QEMU", 8, '\0');
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

