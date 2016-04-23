Received: by 10.25.208.194 with SMTP id h185csp1189446lfg;
        Sat, 23 Apr 2016 02:10:39 -0700 (PDT)
X-Received: by 10.140.99.106 with SMTP id p97mr6495029qge.94.1461402639066;
        Sat, 23 Apr 2016 02:10:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si5248713qkb.7.2016.04.23.02.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 02:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1attaI-0000Pl-Fe
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 05:10:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1attaF-0000Kh-TN
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 05:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1attaE-0001RP-RG
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 05:10:35 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:26011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atta8-0001PH-JW; Sat, 23 Apr 2016 05:10:29 -0400
Received: from 172.24.1.51 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFW58213; Sat, 23 Apr 2016 17:06:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Apr 2016 17:06:49 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2016 17:06:31 +0800
Message-ID: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.571B3B32.00F0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 29034b7dfda18ed81fb184b54f679044
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [PATCH v6 0/5] ARM: Add NUMA support for machine virt
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, david.daney@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dpU6juPEXlbk

From: Shannon Zhao <shannon.zhao@linaro.org>

Add NUMA support for machine virt. Tested successfully running a guest
Linux kernel with the following patch applied:

- [PATCH v16 0/6] arm64, numa: Add numa support for arm64 platforms
https://lkml.org/lkml/2016/4/8/571
- [PATCH v5 00/14] ACPI NUMA support for ARM64
https://lkml.org/lkml/2016/4/19/852

Example qemu command line:
qemu-system-aarch64 \
    -enable-kvm -smp 4\
    -kernel Image \
    -m 512 -machine virt,kernel_irqchip=on \
    -initrd guestfs.cpio.gz \
    -cpu host -nographic \
    -numa node,mem=256M,cpus=0-1,nodeid=0 \
    -numa node,mem=256M,cpus=2-3,nodeid=1 \
    -append "console=ttyAMA0 root=/dev/ram"

Changes since v5:
* don't generate /distance-map node since it's optional
* improve the /memory node name
* move acpi_build_srat_memory to common place then reuse it to generate
  SRAT table

Changes since v4:
* rebased on new kernel driver and device bindings, especially the
  compatible string "numa-distance-map-v1" of /distance-map node
* set the numa-node-id for first /memory node

Changes since v3:
* based on new kernel driver and device bindings
* add ACPI part

Changes since v2:
* update to use NUMA node property arm,associativity.

Changes since v1:
Take into account Peter's comments:
* rename virt_memory_init to arm_generate_memory_dtb
* move arm_generate_memory_dtb to boot.c and make it a common func
* use a struct numa_map to generate numa dtb

Shannon Zhao (5):
  ARM: Virt: Set numa-node-id for CPUs
  ARM: Add numa-node-id for /memory node
  ACPI: Add GICC Affinity Structure
  ACPI: move acpi_build_srat_memory to common place
  ACPI: Virt: Generate SRAT table

 hw/acpi/aml-build.c         | 12 +++++++++++
 hw/arm/boot.c               | 43 +++++++++++++++++++++++++++++++------
 hw/arm/virt-acpi-build.c    | 52 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c               |  8 +++++++
 hw/i386/acpi-build.c        | 22 +------------------
 include/hw/acpi/acpi-defs.h | 15 ++++++++++++-
 include/hw/acpi/aml-build.h | 10 +++++++++
 7 files changed, 134 insertions(+), 28 deletions(-)

-- 
2.0.4


