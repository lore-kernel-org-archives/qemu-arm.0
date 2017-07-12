Received: by 10.25.44.15 with SMTP id s15csp191473lfs;
        Tue, 11 Jul 2017 18:47:47 -0700 (PDT)
X-Received: by 10.200.50.145 with SMTP id z17mr3566254qta.114.1499824067383;
        Tue, 11 Jul 2017 18:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499824067; cv=none;
        d=google.com; s=arc-20160816;
        b=tockAaQTS/3533VDm0ZXSP4X4v4wxk0PkxSt+fSr6N0ilVGG/YZHQ0WVD8ZcaGI6RZ
         0Eh+kFkWm0liUGr/Wu801jnImdKga4KCOaiKRiSs983U5ywhNikM3hmORRgw25irSvlT
         4nDkLf2Afoikut0k0h6Hz5JtWlQQe+ybrhC0CpZCaDv0twYQCCoBqDxA9+yOA6REwYtj
         XN6WR6r3gaAGl4xrBOj9X23TgvU4i11YXsPz4OfdIeV2XIs0Dvffcbs2+lvAjBnD0wxX
         HT99cPo4hoidogj95YoKfzmf0mDO6Y8/Lun5DjAeKledrc3gHO5OdA4sCpClcWRv/cQE
         V36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=9Ps/qEmCPJQXYvaPkfT3jfYzmVlPCjkf8A5UKpywJf8=;
        b=e8ZBHrSnC0OqJV3mYuxlYq0RYJTIYbEPK197tdX49SVRDRbzw+WB/utAl58u1bJpSg
         SmgsMuYBE9L9YWZrG07TFO+N8jpl4wQweJhpQ16oQiMop5d3SlpDdTL2oGVQe7TioGJ4
         ShhgQmMlddbM0gxpCsBmkJfW7SHOkP2Xpq78GrYfUZzv7w2+ZTlsoVzDbQXAYl7gy3XW
         /MopSd8n7qCFp5U6twwIr3tEgWFPwT/vXWj2n4lJH2QME0mTyC7xnk0XH5Wdr7gVgnos
         IlmPDAf500lGbYHXt+o+Bqn2C2QxV5/I4ZKrGFSfZQW56Fi5Ewsc0zjio4/Y/eVpTN4j
         poMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n66si903287qkf.365.2017.07.11.18.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 18:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dV6ki-00048A-3V
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 21:47:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dV6ka-00045g-4y
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 21:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dV6kZ-0000II-7D
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 21:47:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dV6kT-0000Ew-TG; Tue, 11 Jul 2017 21:47:30 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARX36946; Wed, 12 Jul 2017 09:47:23 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.301.0; Wed, 12 Jul 2017 09:47:14 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<famz@redhat.com>, <qemu-devel@nongnu.org>, <zhaoshenglong@huawei.com>, 
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<james.morse@arm.com>, <zhengqiang10@huawei.com>,
	<huangshaoyu@huawei.com>, <wuquanming@huawei.com>
Date: Wed, 12 Jul 2017 10:08:14 +0800
Message-ID: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.59657FAC.000A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b046b06dea387f42877965c8036b2e1d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: [Qemu-arm] [PATCH v5 0/3] Generate APEI GHES table and dynamically
 record CPER
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
Cc: gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3oMmQHZ5QSoA

In the armv8 platform, the mainly hardware error source are ARMv8
SEA/SEI/GSIV. For the ARMv8 SEA/SEI, the KVM or host kernel will signal SIGBUS
or use other interface to notify user space, such as Qemu. After Qemu gets
the notification, it will record the CPER and inject the SEA/SEI to KVM. this
series of patches will generate APEI table when guest OS boot up, and dynamically
record CPER for the guest OS about the generic hardware errors, currently the
userspace only handle the memory section hardware errors

how to test:
1. In the guest OS, use this command to dump the APEI table: 
	"iasl -p ./HEST -d /sys/firmware/acpi/tables/HEST"
2. And find the address for the generic error status block
   according to the notification type
3. then find the CPER record through the generic error status block.

For example(notification type is SEA):

(1) root@genericarmv8:~# iasl -p ./HEST -d /sys/firmware/acpi/tables/HEST
(2) root@genericarmv8:~# cat HEST.dsl
	/*
	 * Intel ACPI Component Architecture
	 * AML/ASL+ Disassembler version 20170303 (64-bit version)
	 * Copyright (c) 2000 - 2017 Intel Corporation
	 *
	 * Disassembly of /sys/firmware/acpi/tables/HEST, Mon Dec 12 07:19:43 2016
	 *
	 * ACPI Data Table [HEST]
	 *
	 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
	 */
    ..................................................................................
    [228h 0552   2]                Subtable Type : 0009 [Generic Hardware Error Source]
	[22Ah 0554   2]                    Source Id : 0008
	[22Ch 0556   2]            Related Source Id : FFFF
	[22Eh 0558   1]                     Reserved : 00
	[22Fh 0559   1]                      Enabled : 01
	[230h 0560   4]       Records To Preallocate : 00000001
	[234h 0564   4]      Max Sections Per Record : 00000001
	[238h 0568   4]          Max Raw Data Length : 00001000

	[23Ch 0572  12]         Error Status Address : [Generic Address Structure]
	[23Ch 0572   1]                     Space ID : 00 [SystemMemory]
	[23Dh 0573   1]                    Bit Width : 40
	[23Eh 0574   1]                   Bit Offset : 00
	[23Fh 0575   1]         Encoded Access Width : 04 [QWord Access:64]
	[240h 0576   8]                      Address : 00000000785D0040

	[248h 0584  28]                       Notify : [Hardware Error Notification Structure]
	[248h 0584   1]                  Notify Type : 08 [SEA]
	[249h 0585   1]                Notify Length : 1C
	[24Ah 0586   2]   Configuration Write Enable : 0000
	[24Ch 0588   4]                 PollInterval : 00000000
	[250h 0592   4]                       Vector : 00000000
	[254h 0596   4]      Polling Threshold Value : 00000000
	[258h 0600   4]     Polling Threshold Window : 00000000
	[25Ch 0604   4]        Error Threshold Value : 00000000
	[260h 0608   4]       Error Threshold Window : 00000000

	[264h 0612   4]    Error Status Block Length : 00001000
    .....................................................................................
(3) according to above table, the address that contains the physical address of a block
    of memory that holds the error status data for SEA notification error source is 0x00000000785D0040
(4) the address for SEA notification error source is 0x785d8058
	(qemu) xp /2x 0x00000000785D0040
	00000000785d0040: 0x785d8058 0x00000000
(5) check the content of generic error status block and generic error data entry
    (qemu) xp /100x 0x785d8058
    00000000785d8058: 0x00000001 0x00000000 0x00000000 0x00000098
    00000000785d8068: 0x00000001 0xa5bc1114 0x4ede6f64 0x833e63b8
	00000000785d8078: 0xb1837ced 0x00000000 0x00000000 0x00000050
	00000000785d8088: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8098: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d80a8: 0x00000000 0x00000000 0x00000000 0x00004002
	00000000785d80b8: 0x00000000 0x00000000 0x00000000 0x00001111
	00000000785d80c8: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d80d8: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d80e8: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d80f8: 0x00000000 0x00000003 0x00000000 0x00000000
	00000000785d8108: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8118: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8128: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8138: 0x00000000 0x00000000 0x00000000 0x00000000

Dongjiu Geng (3):
  ACPI: Add new ACPI structures and macros
  ACPI: Add APEI GHES Table Generation support
  ACPI: build and enable APEI GHES in the Makefile and configuration

 default-configs/arm-softmmu.mak |   1 +
 hw/acpi/Makefile.objs           |   1 +
 hw/acpi/aml-build.c             |   2 +
 hw/acpi/hest_ghes.c             | 219 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c        |   6 ++
 include/hw/acpi/acpi-defs.h     | 194 +++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h     |   1 +
 include/hw/acpi/hest_ghes.h     |  47 +++++++++
 include/qemu/uuid.h             |  11 ++
 9 files changed, 482 insertions(+)
 create mode 100644 hw/acpi/hest_ghes.c
 create mode 100644 include/hw/acpi/hest_ghes.h

-- 
2.10.1

