Received: by 10.25.221.202 with SMTP id w71csp1822106lfi;
        Fri, 4 Aug 2017 03:03:08 -0700 (PDT)
X-Received: by 10.55.21.28 with SMTP id f28mr2032129qkh.220.1501840988063;
        Fri, 04 Aug 2017 03:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501840988; cv=none;
        d=google.com; s=arc-20160816;
        b=pJOTTqLP4tlK3w2Q5GCjxeDotOEorMId1meuF6V7cZ7Uo+WaJTf4Mah333XyvKSDFT
         UyrmoYNEl/BLwSOSYClUpi0Ei0qKvbcEJVHjeLkXs3B4efCxht0OapUVgqd3PMXPB8Py
         oygbp8lLhcQERISXcMKZgy6trrQwsJGF10JOeh35q7IMlfimzwPJ8GoKGwgAU4huC3Tl
         mmSRBSvOh7WETSY94oWS+Y5EUew4kxp/IBTC5hfREds0GbmZm8OAhO+c+d7gzoyO+kNx
         tv/47m/ghIBpBKBGH2b2Q95Q6PQhH8V7+dx3RQn07E+Bb0HXWTcJuzdolThhFavyfeiH
         wOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=LIRrhZmx+TaiCNnME5J1Z4HSpKgokxX8Jt72Nt3ZSqM=;
        b=qHuPApdCgd/8WrwFZdvrW+SDX/ULKopkSVpcEOrIRdfREL7EfJZQru1NUxY4b2QScB
         k7viUUo2LGVjarygk5W4Q1Whmr4r7sNsDjPra9i1fiPW4dJlu7UeqXVyzyAUIlWLi0fZ
         9DqrPFWmywZHgyaA/YPTc+E8pk05LnzcuuHgrjo4byLxm5qjLT6PstMiao48+YQw95OL
         mPNW3I5aD1klbRDoEqYJmVS8PDIKmpxRLsDdcrRMdqeRdSjvmFNruPWwbxAGZSpfflnY
         yAthuxeK2bUoV9ElqsPBud+O7q/s97oIDe2qUcNRFgF1UaGEvrrvZBD0VPMAa+/SgEsd
         w2WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si1245384qtu.311.2017.08.04.03.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 03:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddZRh-0000yU-5N
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 06:03:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddZRa-0000uu-DT
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 06:03:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddZRY-0003pf-Jt
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 06:02:58 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:4349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1ddZRQ-0003ic-QC; Fri, 04 Aug 2017 06:02:49 -0400
Received: from 172.30.72.56 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.56])
	by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ASX06407; Fri, 04 Aug 2017 18:02:44 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.301.0; Fri, 4 Aug 2017 18:02:32 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 4 Aug 2017 18:22:15 +0800
Message-ID: <1501842138-17606-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090201.59844644.0185, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 43e03f9907b223421f82c625b7a10854
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.189
Subject: [Qemu-arm] [PATCH v10 0/3] Generate APEI GHES table and dynamically
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
Cc: zhengqiang10@huawei.com, wuquanming@huawei.com, huangshaoyu@huawei.com,
	gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mEiG6sQyXhUF

In the armv8 platform, the mainly hardware error source are ARMv8
SEA/SEI/GSIV. For the ARMv8 SEA/SEI, the KVM or host kernel will signal SIGBUS
or use other interface to notify user space, such as Qemu. After Qemu gets
the notification, it will record the CPER and inject the SEA/SEI to KVM. this
series of patches will generate APEI table when guest OS boot up, and dynamically
record CPER for the guest OS about the generic hardware errors, currently the
userspace only handle the memory section hardware errors. Before Qemu record the
CPER, it needs to check the ACK value written by the guest OS to avoid read-write
race condition.

Below is the APEI/GHESV2/CPER table layout, the max number of error soure is 11,
which is classified by notification type, now only enable the SEA/SEI notification type
error source.

	   etc/acpi/tables                               etc/hardware_errors
    ====================                    ==========================================
+ +--------------------------+            +------------------+
| | HEST                     |            |    address       |              +--------------+
| +--------------------------+            |    registers     |              | Error Status |
| | GHES0                    |            | +----------------+              | Data Block 0 |
| +--------------------------+ +--------->| |status_address0 |------------->| +------------+
| | .................        | |          | +----------------+              | |  CPER      |
| | error_status_address-----+-+ +------->| |status_address1 |----------+   | |  CPER      |
| | .................        |   |        | +----------------+          |   | |  ....      |
| | read_ack_register--------+-+ |        |  .............   |          |   | |  CPER      |
| | read_ack_preserve        | | |        +------------------+          |   | +------------+
| | read_ack_write           | | | +----->| |status_address10|--------+ |   | Error Status |
+ +--------------------------+ | | |      | +----------------+        | |   | Data Block 1 |
| | GHES1                    | +-+-+----->| | ack_value0     |        | +-->| +------------+
+ +--------------------------+   | |      | +----------------+        |     | |  CPER      |
| | .................        |   | | +--->| | ack_value1     |        |     | |  CPER      |
| | error_status_address-----+---+ | |    | +----------------+        |     | |  ....      |
| | .................        |     | |    | |  ............. |        |     | |  CPER      |
| | read_ack_register--------+-----+-+    | +----------------+        |     +-+------------+
| | read_ack_preserve        |     |   +->| | ack_value10    |        |     | |..........  |
| | read_ack_write           |     |   |  | +----------------+        |     | +------------+
+ +--------------------------|     |   |                              |     | Error Status |
| | ...............          |     |   |                              |     | Data Block 10|
+ +--------------------------+     |   |                              +---->| +------------+
| | GHES10                   |     |   |                                    | |  CPER      |
+ +--------------------------+     |   |                                    | |  CPER      |
| | .................        |     |   |                                    | |  ....      |
| | error_status_address-----+-----+   |                                    | |  CPER      |
| | .................        |         |                                    +-+------------+
| | read_ack_register--------+---------+
| | read_ack_preserve        |
| | read_ack_write           |
+ +--------------------------+

After injecting a SEA/SEI ghes error, the gueset OS kernel log will be shown as below:

[  142.911115] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 8
[  142.913141] {1}[Hardware Error]: event severity: recoverable
[  142.914498] {1}[Hardware Error]:  Error 0, type: recoverable
[  142.915851] {1}[Hardware Error]:   section_type: memory error
[  142.917163] {1}[Hardware Error]:   physical_address: 0x0000000000001111
[  142.918792] {1}[Hardware Error]:   error_type: 3, multi-bit ECC

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
     * AML/ASL+ Disassembler version 20170728 (64-bit version)
     * Copyright (c) 2000 - 2017 Intel Corporation
     *
     * Disassembly of /sys/firmware/acpi/tables/HEST, Mon Sep  5 07:59:17 2016
     *
     * ACPI Data Table [HEST]
     *
     * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
     */

    ..................................................................................
	[308h 0776   2]                Subtable Type : 000A [Generic Hardware Error Source V2]
	[30Ah 0778   2]                    Source Id : 0008
	[30Ch 0780   2]            Related Source Id : FFFF
	[30Eh 0782   1]                     Reserved : 00
	[30Fh 0783   1]                      Enabled : 01
	[310h 0784   4]       Records To Preallocate : 00000001
	[314h 0788   4]      Max Sections Per Record : 00000001
	[318h 0792   4]          Max Raw Data Length : 00001000

	[31Ch 0796  12]         Error Status Address : [Generic Address Structure]
	[31Ch 0796   1]                     Space ID : 00 [SystemMemory]
	[31Dh 0797   1]                    Bit Width : 40
	[31Eh 0798   1]                   Bit Offset : 00
	[31Fh 0799   1]         Encoded Access Width : 04 [QWord Access:64]
	[320h 0800   8]                      Address : 00000000785D0040

	[328h 0808  28]                       Notify : [Hardware Error Notification Structure]
	[328h 0808   1]                  Notify Type : 08 [SEA]
	[329h 0809   1]                Notify Length : 1C
	[32Ah 0810   2]   Configuration Write Enable : 0000
	[32Ch 0812   4]                 PollInterval : 00000000
	[330h 0816   4]                       Vector : 00000000
	[334h 0820   4]      Polling Threshold Value : 00000000
	[338h 0824   4]     Polling Threshold Window : 00000000
	[33Ch 0828   4]        Error Threshold Value : 00000000
	[340h 0832   4]       Error Threshold Window : 00000000

	[344h 0836   4]    Error Status Block Length : 00001000
	[348h 0840  12]            Read Ack Register : [Generic Address Structure]
	[348h 0840   1]                     Space ID : 00 [SystemMemory]
	[349h 0841   1]                    Bit Width : 40
	[34Ah 0842   1]                   Bit Offset : 00
	[34Bh 0843   1]         Encoded Access Width : 04 [QWord Access:64]
	[34Ch 0844   8]                      Address : 00000000785D0098

	[354h 0852   8]            Read Ack Preserve : 00000000FFFFFFFE
	[35Ch 0860   8]               Read Ack Write : 0000000000000001

	[364h 0868   2]                Subtable Type : 000A [Generic Hardware Error Source V2]
	[366h 0870   2]                    Source Id : 0009
	[368h 0872   2]            Related Source Id : FFFF
	[36Ah 0874   1]                     Reserved : 00
	[36Bh 0875   1]                      Enabled : 01
	[36Ch 0876   4]       Records To Preallocate : 00000001
	[370h 0880   4]      Max Sections Per Record : 00000001
	[374h 0884   4]          Max Raw Data Length : 00001000

	[378h 0888  12]         Error Status Address : [Generic Address Structure]
	[378h 0888   1]                     Space ID : 00 [SystemMemory]
	[379h 0889   1]                    Bit Width : 40
	[37Ah 0890   1]                   Bit Offset : 00
	[37Bh 0891   1]         Encoded Access Width : 04 [QWord Access:64]
	[37Ch 0892   8]                      Address : 00000000785D0048

	[384h 0900  28]                       Notify : [Hardware Error Notification Structure]
	[384h 0900   1]                  Notify Type : 09 [SEI]
	[385h 0901   1]                Notify Length : 1C
	[386h 0902   2]   Configuration Write Enable : 0000
	[388h 0904   4]                 PollInterval : 00000000
	[38Ch 0908   4]                       Vector : 00000000
	[390h 0912   4]      Polling Threshold Value : 00000000
	[394h 0916   4]     Polling Threshold Window : 00000000
	[398h 0920   4]        Error Threshold Value : 00000000
	[39Ch 0924   4]       Error Threshold Window : 00000000

	[3A0h 0928   4]    Error Status Block Length : 00001000
	[3A4h 0932  12]            Read Ack Register : [Generic Address Structure]
	[3A4h 0932   1]                     Space ID : 00 [SystemMemory]
	[3A5h 0933   1]                    Bit Width : 40
	[3A6h 0934   1]                   Bit Offset : 00
	[3A7h 0935   1]         Encoded Access Width : 04 [QWord Access:64]
	[3A8h 0936   8]                      Address : 00000000785D00A0

	[3B0h 0944   8]            Read Ack Preserve : 00000000FFFFFFFE
	[3B8h 0952   8]               Read Ack Write : 0000000000000001
	.....................................................................................
(3) according to above table, the address that contains the physical address of a block
    of memory that holds the error status data for SEA notification error source is 0x00000000785D0040
(4) the address for SEA notification error source is 0x785d8108
    (qemu) xp /1 0x00000000785D0040
    00000000785d0040: 0x785d80b0

(5) check the content of generic error status block and generic error data entry
    (qemu) xp /100x 0x785d80b0
	00000000785d80b0: 0x00000001 0x00000000 0x00000000 0x00000098
	00000000785d80c0: 0x00000000 0xa5bc1114 0x4ede6f64 0x833e63b8
	00000000785d80d0: 0xb1837ced 0x00000000 0x00000300 0x00000050
	00000000785d80e0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d80f0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8100: 0x00000000 0x00000000 0x00000000 0x00004002
	00000000785d8110: 0x00000000 0x00000000 0x00000000 0x00001111
	00000000785d8120: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8130: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8140: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8150: 0x00000000 0x00000003 0x00000000 0x00000000
	00000000785d8160: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8170: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8180: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8190: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d81a0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d81b0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d81c0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d81d0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d81e0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d81f0: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8200: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8210: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8220: 0x00000000 0x00000000 0x00000000 0x00000000
	00000000785d8230: 0x00000000 0x00000000 0x00000000 0x00000000
(6) check the OSPM's ACK value(for example SEA)
    /* Before OSPM acknowledges the error, check the ACK value */
    (qemu) xp /1 0x00000000785D0098
    00000000785d00f0: 0x00000000

    /* After OSPM acknowledges the error, check the ACK value */
    (qemu) xp /1 0x00000000785D0098
    00000000785d00f0: 0x00000001


Dongjiu Geng (3):
  ACPI: add APEI/HEST/CPER structures and macros
  ACPI: Add APEI GHES Table Generation support
  ACPI: build and enable APEI GHES in the Makefile and configuration

 default-configs/arm-softmmu.mak |   1 +
 hw/acpi/Makefile.objs           |   1 +
 hw/acpi/aml-build.c             |   2 +
 hw/acpi/hest_ghes.c             | 344 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c        |   6 +
 include/hw/acpi/acpi-defs.h     | 193 ++++++++++++++++++++++
 include/hw/acpi/aml-build.h     |   1 +
 include/hw/acpi/hest_ghes.h     |  47 ++++++
 8 files changed, 595 insertions(+)
 create mode 100644 hw/acpi/hest_ghes.c
 create mode 100644 include/hw/acpi/hest_ghes.h

-- 
1.8.3.1

