Received: by 10.25.208.194 with SMTP id h185csp2717041lfg;
        Wed, 20 Apr 2016 23:28:50 -0700 (PDT)
X-Received: by 10.55.73.199 with SMTP id w190mr17265447qka.77.1461220129267;
        Wed, 20 Apr 2016 23:28:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h105si659404qge.43.2016.04.20.23.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Apr 2016 23:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1at86a-0000ay-P3
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 02:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at861-00080E-Mk
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 02:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at85y-0002lO-J7
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 02:28:13 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:53350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1at85y-0002k1-0P; Thu, 21 Apr 2016 02:28:10 -0400
Received: from 172.24.1.49 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAI17796; Thu, 21 Apr 2016 14:24:41 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 21 Apr 2016 14:24:15 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 14:23:49 +0800
Message-ID: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.5718722B.00D6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5ea424319b605a40b1efadf8ee03d982
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-devel] [PATCH v5 0/5] ARM: Add NUMA support for machine virt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, david.daney@cavium.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Vjp1rYxHOR3

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
  ARM: Virt: Add /distance-map node for NUMA
  ARM: Virt: Set numa-node-id for CPUs
  ARM: Add numa-node-id for /memory node
  include/hw/acpi/acpi-defs: Add GICC Affinity Structure
  hw/arm/virt-acpi-build: Generate SRAT table

 hw/arm/boot.c               | 31 +++++++++++++++++++++++-
 hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c               | 37 +++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        |  2 +-
 include/hw/acpi/acpi-defs.h | 15 +++++++++++-
 5 files changed, 140 insertions(+), 3 deletions(-)

-- 
2.0.4


