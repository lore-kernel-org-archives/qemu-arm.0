Received: by 10.25.208.194 with SMTP id h185csp1207517lfg;
        Sat, 23 Apr 2016 03:05:12 -0700 (PDT)
X-Received: by 10.55.26.140 with SMTP id l12mr8402808qkh.153.1461405912620;
        Sat, 23 Apr 2016 03:05:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n15si5307142qki.176.2016.04.23.03.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 03:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atuR6-0006Op-1z
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 06:05:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atuQx-00067D-Q4
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 06:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atuQx-0005vd-2e
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 06:05:03 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:56160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atuQq-0005tm-Pe; Sat, 23 Apr 2016 06:04:57 -0400
Received: from 172.24.1.47 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DJI66781; Sat, 23 Apr 2016 18:04:37 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml422-hub.china.huawei.com (10.82.67.152) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Apr 2016 18:04:25 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2016 18:04:12 +0800
Message-ID: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.571B48B7.017C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 07e9bd2f034772d228ef0ddbb909ce7b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: [Qemu-arm] [PATCH v2 0/3] Add guest PMU in machine virt
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
Cc: drjones@redhat.com, shannon.zhao@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4nIm1ZASo9I

From: Shannon Zhao <shannon.zhao@linaro.org>

KVM-ARM64 supports guest PMU now. This series add the support in machine
virt so that guest could use PMU.

Changes since v1:
* rebase on master
* Address Andrew's comments, add a macro PPI, fix code style, add
  cpu_to_le32()

Shannon Zhao (3):
  target-arm: kvm64: set guest PMUv3 feature bit if supported
  hw/arm/virt: Add PMU node for virt machine
  hw/arm/virt-acpi-build: Add PMU IRQ number in ACPI table

 hw/arm/virt-acpi-build.c |  3 +++
 hw/arm/virt.c            | 31 +++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  4 ++++
 include/sysemu/kvm.h     |  1 +
 stubs/kvm.c              |  5 +++++
 target-arm/cpu-qom.h     |  2 ++
 target-arm/kvm64.c       | 44 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 90 insertions(+)

-- 
2.0.4


