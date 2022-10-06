Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp644492ocb;
        Thu, 6 Oct 2022 10:29:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qiwrazyqUg4wBN5SUK+j1yIg6/fjU74Kh0zzQo1yFoK2Dna7uT3gGqhpWiPOFn4hq10lW
X-Received: by 2002:a05:620a:856:b0:6e2:d96c:56a1 with SMTP id u22-20020a05620a085600b006e2d96c56a1mr895487qku.769.1665077360642;
        Thu, 06 Oct 2022 10:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665077360; cv=none;
        d=google.com; s=arc-20160816;
        b=oKcxcCFKyS03IuXEX2O4rlpKexotcijJOKLP930vfmM0ERCsAL/Gm1LmAfDxW3czgD
         6CsBIYBPp/1dyWsNiAAc0hZwlmjujL0+Hj2qDZvYwTgxP18MdhtvgJdfCeeFWS2smlt6
         UbibsteDalVHEev6wHOixfEJAb/YG17/C0ih1NIVMmU5Hzo3LhpCin+GzhFPDsJ/SpLc
         0ipa4TSjRJlyf4yejG8fQJAY8l/kHTWYuApKFYRYOnpCmvQL3dneC6AJ1Wtt64zsnL6W
         IgPCtRj7i3J1yZHWeWHiNWE+QhulkWsubmXGDxYpX7DxY1tSaL/O1e/iWDqAiXt8sjEO
         mXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=9H81aPdgl1UExUuG98zsEQrT8Z5iFKbGoxiLFepC7Wk=;
        b=OR5k8VzG1w0uaUYihiCxkXNWKRJpefpSRgwVFOjBlxDoIx0nkmV10eUNlytubxXYi3
         s/u/5KK+eW9U2DxlIU2XwB5pTFCUE2fE9fn/mC2Iapkpcn8iUTjebEbEA/5s7yIVok+Q
         rqoqiHFIwVTeFfeFIuySfSTNcRd9WvL85tRLBji1r7Eq5j1U8zb4NH0gmLEicnoytvN/
         5WfMmpTFdMHdScN2TXgGOJXRxVRFjw+EsvFKX4jqVaojjZfBLeB2SkNTzzyWHXIc0Vc0
         yCX+TeSCY3ye2bHLQ5e8sC6XT/giSjKWkoociLULP3RKphKR4VCrsKVNGRkSHXCxXsYa
         +INw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=MYI0xbzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp41-20020a05620a45a900b006cf7d65b5a0si7365994qkb.535.2022.10.06.10.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 10:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=MYI0xbzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogUgS-0005zq-6c
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 13:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTXA-0007OR-JX; Thu, 06 Oct 2022 12:15:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTX8-0006n2-GG; Thu, 06 Oct 2022 12:15:40 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296FhkfE009472;
 Thu, 6 Oct 2022 16:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=9H81aPdgl1UExUuG98zsEQrT8Z5iFKbGoxiLFepC7Wk=;
 b=MYI0xbzSjQpWFK+QJNJmYGc498CSCyWfNvhqO+BLj5z1ZVdzBgmJ2omFZiBJUmegXdcG
 a/7DDgBFaeERq8cFC3YgVI4iId91ju7TUsak4HTFAajekCxVUwnrfZ9eCvBTNy9Qy6Fy
 A5YrOxVfZfpFEvsQ4eAon0ShzmooxTGbzOjibCChMJLK0TvVhAPW+PSCq0OeZRR4ndlE
 ve23cubwYN2w0xFcSiXFNobUEDlvkPmqKik434T0x0sKBiSd1lqWR9HGCRPhrSWswTwJ
 L6N5UtOORMU3m4ergifjA0ety8rG8H9YH+VKk3dBvVrGcMHBNpYc7bo6TmouN5ZYPF6x DA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k15up4405-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:23 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296FAfJf028246; Thu, 6 Oct 2022 16:15:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06eq3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:22 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296GFLrf001092;
 Thu, 6 Oct 2022 16:15:21 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-170-234.vpn.oracle.com
 [10.175.170.234])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc06eq1e-1; Thu, 06 Oct 2022 16:15:21 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH 0/4] ACPI MADT and FADT update according to the ACPI 6.0
 spec
Date: Thu,  6 Oct 2022 16:14:46 +0000
Message-Id: <20221006161450.69912-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
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
X-Proofpoint-GUID: 5kvbw4DjOIRNqxtgox_KKM61-7XBVnxb
X-Proofpoint-ORIG-GUID: 5kvbw4DjOIRNqxtgox_KKM61-7XBVnxb
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
X-TUID: jlRXMm7layCo

The MADT table structure has been updated in commit 37f33084ed2e 
("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")
to include the 5.2.12.18 GIC ITS Structure and so table's revision also needs to
be updated. MADT and the FADT tables from the same spec need to be in sync and in
this case also the FADT needs to be updated.

Revision 6.0 of the ACPI FADT table introduces the field "Hypervisor Vendor
Identity" which is missing and must be included. Patch 2/4 includes a suggestion
for the value of this field by using the current acceleration name. This would
provide values like 'KVM' for example when KVM is used.

Ref: https://uefi.org/sites/default/files/resources/ACPI_6_0_Errata_A.PDF

Open to discussion, your comments, thoughts and suggestions are very welcome.

Thanks in advance.
Miguel

Miguel Luis (4):
  tests/acpi: virt: allow acpi MADT and FADT changes
  acpi: fadt: support revision 6.0 of the ACPI specification
  acpi: arm/virt: madt: bump to revision 4 accordingly to ACPI 6.0
    Errata A
  Step 6 & 7 of the bios-tables-test.c documented procedure.

 hw/acpi/aml-build.c               |  14 +++++++++++---
 hw/arm/virt-acpi-build.c          |  26 ++++++++++++--------------
 tests/data/acpi/virt/APIC         | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.memhp   | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.numamem | Bin 168 -> 172 bytes
 tests/data/acpi/virt/FACP         | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.memhp   | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.numamem | Bin 268 -> 276 bytes
 8 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.37.3

