Received: by 10.25.159.19 with SMTP id i19csp332711lfe;
        Sat, 23 Jan 2016 03:38:45 -0800 (PST)
X-Received: by 10.141.23.137 with SMTP id z131mr10135064qhd.52.1453549125241;
        Sat, 23 Jan 2016 03:38:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a128si12641608qhc.128.2016.01.23.03.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 03:38:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMwWi-000578-Oh
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 06:38:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwWg-00052T-HE
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:38:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwWd-0005ES-Bd
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:38:42 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:27409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMwWc-0005Ao-OF; Sat, 23 Jan 2016 06:38:39 -0500
Received: from 172.24.1.51 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BVC88256; Sat, 23 Jan 2016 19:37:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Jan 2016 19:36:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2016 19:36:41 +0800
Message-ID: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56A365E4.0054, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 722273842fe28f16263e0757da54dc25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, ganapatrao.kulkarni@caviumnetworks.com,
	hanjun.guo@linaro.org
Subject: [Qemu-arm] [PATCH v4 0/5] ARM: Add NUMA support for machine virt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pIESkdznFqDy

From: Shannon Zhao <shannon.zhao@linaro.org>

Add NUMA support for machine virt. Tested successfully running a guest
Linux kernel with the following patch applied:

- [PATCH v9 0/6] arm64, numa: Add numa support for arm64 platforms
https://lwn.net/Articles/672329/
- [PATCH v2 0/4] ACPI based NUMA support for ARM64
http://www.spinics.net/lists/linux-acpi/msg61795.html

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

Shannon Zhao (5):
  ARM: Virt: Add /distance-map node for NUMA
  ARM: Virt: Set numa-node-id for CPUs
  ARM: Add numa-node-id for /memory node
  include/hw/acpi/acpi-defs: Add GICC Affinity Structure
  hw/arm/virt-acpi-build: Generate SRAT table

 hw/arm/boot.c               | 29 ++++++++++++++++++++++-
 hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c               | 37 +++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        |  2 +-
 include/hw/acpi/acpi-defs.h | 15 +++++++++++-
 5 files changed, 138 insertions(+), 3 deletions(-)

-- 
2.0.4


