Received: by 10.25.27.66 with SMTP id b63csp1783296lfb;
        Mon, 6 Jun 2016 19:48:56 -0700 (PDT)
X-Received: by 10.55.142.132 with SMTP id q126mr18464600qkd.81.1465267736731;
        Mon, 06 Jun 2016 19:48:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si12793851qkd.274.2016.06.06.19.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 19:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bA74a-0005Jq-5D
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 22:48:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA72o-0004E7-Te
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 22:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA72k-0003Vv-VX
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 22:47:06 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:14298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bA72i-0003To-Iy; Mon, 06 Jun 2016 22:47:02 -0400
Received: from 172.24.1.137 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCU77798; Tue, 07 Jun 2016 10:46:42 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.235.1; Tue, 7 Jun 2016 10:46:30 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 10:46:14 +0800
Message-ID: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.57563594.00EB, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ddf5cd08e7231d9a0000fdabb02b4ca0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-devel] [PATCH v5 0/3] Add guest PMU in machine virt
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mrqjxBpmyoCi

From: Shannon Zhao <shannon.zhao@linaro.org>

KVM-ARM64 supports guest PMU now. This series add the support in machine
virt so that guest could use PMU.

The ACPI part is tested with below guest kernel patches.
https://lkml.org/lkml/2016/4/12/755

Changes since v4:
* fix building failure due to kvm_arm_pmu_create()
* rebase on master

Changes since v3:
* if kvm_arm_pmu_create returns a failure, don't create pmu dts node for
  guest

Changes since v2:
* address Andrew's comments on PATCH 2, thanks

Changes since v1:
* rebase on master
* Address Andrew's comments, add a macro PPI, fix code style, add
  cpu_to_le32()

Shannon Zhao (3):
  target-arm: kvm64: set guest PMUv3 feature bit if supported
  hw/arm/virt: Add PMU node for virt machine
  hw/arm/virt-acpi-build: Add PMU IRQ number in ACPI table

 hw/arm/virt-acpi-build.c |  4 ++++
 hw/arm/virt.c            | 33 +++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  4 ++++
 target-arm/cpu.h         |  2 ++
 target-arm/kvm32.c       |  6 ++++++
 target-arm/kvm64.c       | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 target-arm/kvm_arm.h     |  7 +++++++
 7 files changed, 102 insertions(+)

-- 
2.0.4


