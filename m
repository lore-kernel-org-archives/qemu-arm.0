Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2431088ocg;
        Mon, 10 Oct 2022 06:26:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sq2LvcsIL9s31rpRuuAm3vCfpUmq94t5ppaPULxJdbMzo0xkD7wI5FLg2SSfb/mulXUYB
X-Received: by 2002:a05:620a:41c:b0:6ec:53b5:6eca with SMTP id 28-20020a05620a041c00b006ec53b56ecamr5163791qkp.767.1665408400425;
        Mon, 10 Oct 2022 06:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665408400; cv=none;
        d=google.com; s=arc-20160816;
        b=X/hCOjoBZx4c3lKKYaZ/oSCiqy6oYTZAHtF/R1TIYh7JO9008kYW//+cvDe3yBARQ/
         yoEeyNk7casW2Jf3CeKEsBy5y+N1vpI6J6q1bkac84Woduy7xwsE6NH7OvEaLz8s9fi0
         t9ApZKrWCjXwok3zm9t7vWcA3or/Ecx+ZjnkdcKzhC5rRn40o/PAyuXknsQtMKxvhsgM
         x4PWBK9ZOmaj3oprg2uBbmhJLp5EYGJKMHnIvBamaJdkyBSFZNiDCLp3Wp1aolX6PjsK
         i6bZGBRSSJeUWBQlmW9ZUdIKn0gfjytVrRK6D0/81k75arrsYpeVkNPBzTzt3yHvgMVh
         kQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5Vo5NYPzDepwuX7sr72mwz2n40SK2nDM87nlsqJkxeA=;
        b=XSeSxL4XwSbF1aFppRFxFV9nwJPb57FESqxX6dh7fNnXxytoCaHoMf+gD7GoIhdgu2
         hso8kpNhU4QXOh1jlpdZgBeM6gWAERJdE5uxUOLQ1lS50hYkiP1a9VOOl6V8g1BtUyL6
         uvglsWWzIfkC2GMsbmThzxJjG8lC5ugLQndxseIwpPgNWiLOigPM7haN5p6kUzvQKfPJ
         2gXAFrEITpmT9Iu+/iiHo19ps8V/jmgkG4zexVT4gYjhDycyJbYkb4cs436yUfMcgrDQ
         ElTQCqkT8e58ODfUHMc2PMDhYSnSoDNHn3jInk1viOlN++pdrV7xPlipMrRRPAhEo9a7
         e3Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=qDxBud46;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05620a0a8900b006ec620aa183si1871425qkg.746.2022.10.10.06.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 06:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=qDxBud46;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohsnn-0000TU-Vs
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 09:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohsl3-0006EM-Mq; Mon, 10 Oct 2022 09:23:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohsl2-0003Vi-0g; Mon, 10 Oct 2022 09:23:49 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ABqVt1019606;
 Mon, 10 Oct 2022 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=5Vo5NYPzDepwuX7sr72mwz2n40SK2nDM87nlsqJkxeA=;
 b=qDxBud46qISp5vUmM8NEy+ZgsXMmRYMhFQpxd1jYTGzJi5uc5iG7tGugajMJ/nF/IsSe
 u7CBmQrA5NO0WVu6BafhazZO0+Momp9Kyun9aH+OH/WgFhr2pLHuPeSeN/1Den25AjAM
 coybhSsfMlGNnCJYEBjw15xvmJlws3o9KNYA+CB2HdyXDFzZgtO839/q90JoQc6YC+yx
 0abp3Tjs7T28jH8V+CJHpROHKRJ2gXsNvmxvx9PD2boXBlrgaXMUjjXZ3HV4wy5VYlBv
 d3lTzZX2MPXrIpHqoTxhwiaN/TpOpV1yIqyhVRJ60WPWK00y0YsScBhpdTKT9hx6JBnj BQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k3002uj7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:45 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29AATCJj021912; Mon, 10 Oct 2022 13:23:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn3485p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:44 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ADNNh6019450;
 Mon, 10 Oct 2022 13:23:43 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-204-94.vpn.oracle.com
 [10.175.204.94])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3k2yn347wn-4; Mon, 10 Oct 2022 13:23:43 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH v2 3/4] acpi: arm/virt: madt: bump to revision 4
 accordingly to ACPI 6.0 Errata A
Date: Mon, 10 Oct 2022 13:22:59 +0000
Message-Id: <20221010132300.96935-4-miguel.luis@oracle.com>
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
X-Proofpoint-ORIG-GUID: rex1Y1dSXFBh9rLipHEpGE4Cx_c46KdW
X-Proofpoint-GUID: rex1Y1dSXFBh9rLipHEpGE4Cx_c46KdW
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
X-TUID: Xq6W7Ka26XMX

MADT has been updated with the GIC Structures from ACPI 6.0 Errata A
and so MADT revision and GICC Structure must be updated also.

Fixes: 37f33084ed2e ("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/arm/virt-acpi-build.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 72bb6f61a5..2d21e3cec4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -686,7 +686,7 @@ build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 };
 
 /*
- * ACPI spec, Revision 5.1 Errata A
+ * ACPI spec, Revision 6.0 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
  */
 static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
@@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
-    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
@@ -740,7 +740,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         /* 5.2.12.14 GIC Structure */
         build_append_int_noprefix(table_data, 0xB, 1);  /* Type */
-        build_append_int_noprefix(table_data, 76, 1);   /* Length */
+        build_append_int_noprefix(table_data, 80, 1);   /* Length */
         build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
         build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
@@ -760,6 +760,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
         build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
+        /* Processor Power Efficiency Class */
+        build_append_int_noprefix(table_data, 0, 1);
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 3);
     }
 
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
@@ -771,12 +775,6 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
 
         if (its_class_name() && !vmc->no_its) {
-            /*
-             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
-             * has additional fields on top of implemented 5.1 Errata A,
-             * to make it consistent with v6.0 we need to bump everything
-             * to v6.0
-             */
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
-- 
2.37.3

