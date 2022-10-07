Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp552256ocg;
        Fri, 7 Oct 2022 08:29:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6HgbHRrRcZ/d7fQqjnapGN8mH6bR7X8ZsUFJxlltoeO0UrQgQK7DsXHwQzvGS/d2Vgny94
X-Received: by 2002:a0c:e34c:0:b0:4b1:874a:18ad with SMTP id a12-20020a0ce34c000000b004b1874a18admr4324053qvm.53.1665156577024;
        Fri, 07 Oct 2022 08:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665156577; cv=none;
        d=google.com; s=arc-20160816;
        b=DjUFuzCkgfVXM2/KUeK2/U93kVlXq4z9Cpahu1+59gYLlW2fG5z8fbH7pCoAzor7nj
         QH53nY27M7JibVsNim3L80gMollE2Uz7LkSZ6V7xCQ7+i8yPjPguAWeM5bjfWksLIqoE
         /K7nkZOck5V3lGqNtauorpiRSGKiu372iYbPfUiS4ADfGuecsX3NWOhwIXIhGakkVs1e
         8suUGIqhssL7iEIVp6leraIdjtfNIuSwH37ua+uDT5w1g8GHmvh7qC9lHoPcslSzKH1O
         z9Qk+ONofPsUHUdYcJjSamQNqUNwkrSS1v6t9CQDo6C5KNL/P+TqzS4daC5umbLBPjN0
         sRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5n4daUCclTBq2xuK7UvGBMyCxgG/DJzl1LFOnvJ29CM=;
        b=toHdt5ZchvhZ8/j4bBpawDhjydLsTJSAhL6yhzcbJHtYhuq+hSmzXaWGb7Gr2/Tv4v
         mD6RE3EDStMvACqfqNe5+jgDiISBh8rPh1gBe5+PZk5rhKD42kDqMpShU68YgHH7UNkv
         RbsgNaQMzhg3WrXJQoNx5Rr+DSo+Ve5uiYS23b6p7wbw8SNKaomJ+E+VlG7y3sAkhlf7
         +NqHRojBzvDcRkygw95uT8jCMjHs3srPf0ORHbFR/2q5vETd+GTRkUrKmLhiFoJXlvvP
         nkHxyFUWDTrr1vRd+eUiWLkZ6IeEOqqqvG0mEb99xLMud8/DzqWSQDzIPnbGhsjTb+VJ
         dQdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=Kzi9vmGR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq15-20020a056214258f00b0049e791de803si1020117qvb.240.2022.10.07.08.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 08:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=Kzi9vmGR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogpI7-0002tD-Ia
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogocU-00088c-SC; Fri, 07 Oct 2022 10:46:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogocT-0000BA-9v; Fri, 07 Oct 2022 10:46:34 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297Bx3X0031958;
 Fri, 7 Oct 2022 14:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=5n4daUCclTBq2xuK7UvGBMyCxgG/DJzl1LFOnvJ29CM=;
 b=Kzi9vmGRfiZEF66mf/JTmvUDAsaEHdLixpo4FMIZTgdwzbSB53TAR4Xe5rfrLEXIOn0f
 unm0kgMecOxLR3CRQ/f31qTrGcWxkDbP7+opq8Ehql9Kn4Uoc483FarFFx+R/dXWTHkr
 h0sXlUpFs6OaMN3e1dhfvHQp1haCKg0309HTnMAzRVafyCctgiEW6x4nUwzigonBWDxa
 /isAi+ILQIkp60vs9Tf09Sd/3l6dYYJJZAMPbUYZpJzEvdxI8s3GsQ7eDaZZYHauo74V
 wiQOwo/bVWGz11N9lrKfbzxJbcFSACRIx8iZIkvGZ0w8NTVNVISOIqnWxx01ngLLlyax Vg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxd5tq7tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:46:29 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297DEJei002779; Fri, 7 Oct 2022 14:46:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0d8n81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:46:29 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 297EkCYK028446;
 Fri, 7 Oct 2022 14:46:28 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-212-78.vpn.oracle.com
 [10.175.212.78])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc0d8n08-3; Fri, 07 Oct 2022 14:46:28 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH v2 2/3] acpi: arm/virt: build_gtdt: fix invalid 64-bit
 physical addresses
Date: Fri,  7 Oct 2022 14:45:52 +0000
Message-Id: <20221007144553.79648-3-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007144553.79648-1-miguel.luis@oracle.com>
References: <20221007144553.79648-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=817 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070088
X-Proofpoint-ORIG-GUID: cY1BAUbd0ngOOo97zakNSNzR45L6bruE
X-Proofpoint-GUID: cY1BAUbd0ngOOo97zakNSNzR45L6bruE
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
X-TUID: eiAbj+1ZkF86

Per the ACPI 6.5 specification, on the GTDT Table Structure, the Counter Control
Block Address and Counter Read Block Address fields of the GTDT table should be
set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.

Fixes: 41041e57085 ("acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/arm/virt-acpi-build.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9b3aee01bf..13c6e3e468 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -592,8 +592,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_begin(&table, table_data);
 
     /* CntControlBase Physical Address */
-    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
     /*
      * FIXME: clarify comment:
@@ -618,7 +617,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* Non-Secure EL2 timer Flags */
     build_append_int_noprefix(table_data, irqflags, 4);
     /* CntReadBase Physical address */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     /* Platform Timer Count */
     build_append_int_noprefix(table_data, 0, 4);
     /* Platform Timer Offset */
-- 
2.37.3

