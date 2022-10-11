Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2613358ejn;
        Tue, 11 Oct 2022 11:19:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uwxjkEtrsez/pqn+YIwhklm6j8FZ7vUWPuwgdV++bsAkf/peTg5LKMte4lC1kKBUoCD6b
X-Received: by 2002:a05:622a:15:b0:39a:1fcd:3750 with SMTP id x21-20020a05622a001500b0039a1fcd3750mr9555133qtw.56.1665512354374;
        Tue, 11 Oct 2022 11:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665512354; cv=none;
        d=google.com; s=arc-20160816;
        b=lI2STjNjfsUOpzsGHoBGIa4ww8Ribu0kZ6T+HrLMxRgQbouwDRIzS+dtYPv4rLHEjy
         J/lY3qKWnlmdaR1ABZEX007VxbQmNMyzBUqzuQsSdRMJ20FeI9s3XUJ1EM8djCUU2FKL
         eM5MA93acktTnJjCZWgBw5ljGxNazGUydr6C/ZT6/mwccVbaN6R7SPqQ4odrkh761ZX5
         0khKrcagKyYs9IGNn16Mim1IyXYNpFckXiyFux05LxOd4RVzcKP5F+zd7km9If/+rvEU
         t8zhHxf7hdixeV5FexP8FyMltWcdnPTJUJk/VteruD3n3uTnu9xiaUsop/o+EuVB10v2
         IgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5Vo5NYPzDepwuX7sr72mwz2n40SK2nDM87nlsqJkxeA=;
        b=IflC6JF29d7g1miDoijlofVp+AXlfSC0eoXQDkoz7Xf/RmidbWC9+vpX7tzOXQaty2
         7ZHgjH7l1QnuLVCKKjm1wtIHPbriF/pnfFGOUmCkkRlokZDL8pFkLOQkYS+DaO4Yk4U7
         YHTVY/rOQBSqrYyTh3cyXqoTmncRs7SUj5OBoFbwPG3qFQnzlbuN/e0ND+pwBcjyUB63
         kl0ZiQLlrMe3SOZtNZyZg/ZM7etgGd0fJ6eTlgktbWOYxQrzoCo/xP8Qhg081ouXd4Rl
         f4z4sKHvZLnNFpiP8Q7r2Xp3gtNOwSqqZS/YKDGSGcH4y54slNxkedbmnw2lT7Wcfc43
         nsHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=IHJxD6tU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq33-20020a05620a46a100b006ee8d44172esi784238qkb.634.2022.10.11.11.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 11:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=IHJxD6tU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiJqS-0006rz-Ji
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 14:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpW-0006q7-9l; Tue, 11 Oct 2022 14:18:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpT-0003U3-HO; Tue, 11 Oct 2022 14:18:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BHTac3012030;
 Tue, 11 Oct 2022 18:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=5Vo5NYPzDepwuX7sr72mwz2n40SK2nDM87nlsqJkxeA=;
 b=IHJxD6tUXi48aQrdbzMcGzUhUEvj27ZFvL7TSu0EL9884WdHl/Z9vO5WyQ3S9suJZWBR
 8Oxzuzn78aaqEHRzARSWXk6dAh4a38/MOs9CvoRuhwB1gYDSrp76FaJx7YpZgDQ64Eaj
 mIIxSkTI0dli+eSoGfdfmvMbKgQ7WqNzJ+NV0iXza1YFntHG2XaRWo50l+jO0+JZzFhE
 C94AObJky9D29XVrOjAWq+fTWTf/fMWhSgX2C4YN1EJOQRxZrm/t7WnsDzIUBgKJ/+cV
 X3EwqOt9fsKAt3LnQGugH7fUUaeVv1Nd6bEMD05K8N6TpCRjjlYXbM2LG68CMPZT70iX Gg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k3139yhd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:18:07 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29BGYFNC027452; Tue, 11 Oct 2022 18:18:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2ynaf4me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:18:06 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29BIEwgs034553;
 Tue, 11 Oct 2022 18:18:06 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-196-28.vpn.oracle.com
 [10.175.196.28])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3k2ynaf4fc-4; Tue, 11 Oct 2022 18:18:05 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH 3/4] acpi: arm/virt: madt: bump to revision 4 accordingly to
 ACPI 6.0 Errata A
Date: Tue, 11 Oct 2022 18:17:29 +0000
Message-Id: <20221011181730.10885-4-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011181730.10885-1-miguel.luis@oracle.com>
References: <20221011181730.10885-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110106
X-Proofpoint-GUID: jzLhkA_q_6RTFfi7qKqbpkPf7qL2NBQV
X-Proofpoint-ORIG-GUID: jzLhkA_q_6RTFfi7qKqbpkPf7qL2NBQV
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
X-TUID: fCCEAjAMc02y

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

