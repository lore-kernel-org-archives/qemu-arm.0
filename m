Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2615243ejn;
        Tue, 11 Oct 2022 11:22:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ckeJdgWKzQQmqL6VtnHHO8UDXrMGpIhWXWHGBNGeYA7Aa4fJhLJWdiR1hKK23iII51g3e
X-Received: by 2002:ac8:5c09:0:b0:35c:e2f0:c3da with SMTP id i9-20020ac85c09000000b0035ce2f0c3damr20242035qti.107.1665512536439;
        Tue, 11 Oct 2022 11:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665512536; cv=none;
        d=google.com; s=arc-20160816;
        b=MXpZYwEziDPYvyqS6/bnoshfVSTenB8Znwc67j8uGZL2emvBGh0+vwbqYMDukmfSb/
         Rd++bBhNQ+MpRDsOA00FdMsz6d8lkOymOwDmKENOoWfzo0ULYvYncxCd7gUYdjIPIUma
         U9Qx48POwH4ENZE60NUYI4fAriIGeruOqsamo2n2t6cRGhuKyOvVSkpz99SUzZvZWwEu
         7cySIvpjYANDpZb6uQloQ02giuoRgHtSKQdpTkNUBp7qgNOJiDKYGxFJLDPz9fjmpNxY
         x98/AkQ7263l4t8q0csidJUdv+mN7wz3IfoohSiV/FqaGPvTr9bXwSxLKQy4VHRB0uzm
         EO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=h1lHEVGH6QW5BMm3SjV8kJC42p/ljTn4J9+kKBxdvHs=;
        b=dnmN47y5jL1frdMFWX0uJLlpPd3bnWu8gJyxKl48VemGJfrvc906le9jFK7OYOLVuk
         jiYnoBVlhCGPbfbBBd/Ni5pxr1z55tPLE9/UzaDglnJ/ZOUZKuXtGW+Mb6OsQ2FpfOgC
         4qXKCbas4UQOH9eqabzB4orJGxb8szbZj32diWC06evLv6kg6x+UP/ZoXovG4Hed21s1
         YI/PZdB4srijkWqUHy0DWQEWSdXmAnirwWlYl1UoI6ef7LYuSN23lYIJGsLeVxK5Z+5t
         iErDaRgotyuzEE1iBAxi7kAO13diksStCU1ho2OYIbzdYNHUPZ7lYliDMeV4nmxiTcfW
         Nt+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=wq1gZMG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv5-20020ad45ce5000000b004b17be19184si8641340qvb.77.2022.10.11.11.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 11:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=wq1gZMG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiJtP-0000IN-Up
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 14:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpL-0006bF-3A; Tue, 11 Oct 2022 14:18:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpH-0003T8-IJ; Tue, 11 Oct 2022 14:18:02 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BHT318031966;
 Tue, 11 Oct 2022 18:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=h1lHEVGH6QW5BMm3SjV8kJC42p/ljTn4J9+kKBxdvHs=;
 b=wq1gZMG13MqT2KEWDblsKOHelhC0bQmfTQ3sz9grV9bxAewmTu4lOXxJL1cTWuoJDtxT
 vhn7VSAUxz14kLczr3MI+tHTKjbusvQdUzACwPogth5EDSkimJsjBbDfxEsQHDVomdCk
 3cR2LUkQJg+PGfICAa1wZycj50EjjSZ+f+lskDg7k0XTNFIAQ1fKlqnZfdTwi/ZujKD1
 2lXvqC5vFFp5+Y/J7+HQynlgb17ecBdUZKFhHVkOE/MM3JZ+Zroq9fjRlwrHoDjNNLS5
 OXcaT3XW8GSXgzbfmCKJ+EWB5YZdX0bI5f0eO9grGiWdVaQJoosmChYs87A5B2wqtGNu iQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k30tt7m44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:17:51 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29BH4Wue027700; Tue, 11 Oct 2022 18:17:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2ynaf4g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:17:51 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29BIEwgm034553;
 Tue, 11 Oct 2022 18:17:50 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-196-28.vpn.oracle.com
 [10.175.196.28])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3k2ynaf4fc-1; Tue, 11 Oct 2022 18:17:50 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH 0/4] ACPI MADT and FADT update according to the ACPI 6.0 spec
Date: Tue, 11 Oct 2022 18:17:26 +0000
Message-Id: <20221011181730.10885-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=929
 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110106
X-Proofpoint-GUID: oIjbLqaL0W8i5tHptSdVH0dJrJ3j0e8W
X-Proofpoint-ORIG-GUID: oIjbLqaL0W8i5tHptSdVH0dJrJ3j0e8W
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
X-TUID: K7Te5uqb8KyQ

The MADT table structure has been updated in commit 37f33084ed2e                 
("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")
to include the 5.2.12.18 GIC ITS Structure and so table's revision also needs to 
be updated. MADT and the FADT tables from the same spec need to be in sync and in
this case also the FADT needs to be updated.                                     

Revision 6.0 of the ACPI FADT table introduces the field "Hypervisor Vendor      
Identity" which is missing and must be included.

Ref: https://uefi.org/sites/default/files/resources/ACPI_6_0_Errata_A.PDF

This patch series originates from a previous RFC [1] discussion. Reviewed-by
tags were kept on patches 2/4 and 3/4.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01326.html

Miguel Luis (4):
  tests/acpi: virt: allow acpi MADT and FADT changes
  acpi: fadt: support revision 6.0 of the ACPI specification
  acpi: arm/virt: madt: bump to revision 4 accordingly to ACPI 6.0
    Errata A
  tests/acpi: virt: update ACPI MADT and FADT binaries

 hw/acpi/aml-build.c               |  13 ++++++++++---
 hw/arm/virt-acpi-build.c          |  26 ++++++++++++--------------
 tests/data/acpi/virt/APIC         | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.memhp   | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.numamem | Bin 168 -> 172 bytes
 tests/data/acpi/virt/FACP         | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.memhp   | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.numamem | Bin 268 -> 276 bytes
 8 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.37.3

