Received: by 10.25.208.211 with SMTP id h202csp94491lfg;
        Fri, 25 Mar 2016 03:16:15 -0700 (PDT)
X-Received: by 10.140.196.203 with SMTP id r194mr16841397qha.60.1458900975100;
        Fri, 25 Mar 2016 03:16:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c207si10113654qhc.129.2016.03.25.03.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Mar 2016 03:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ajOms-0001qz-Hi
	for alex.bennee@linaro.org; Fri, 25 Mar 2016 06:16:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ajOmJ-0001Hw-JD
	for qemu-devel@nongnu.org; Fri, 25 Mar 2016 06:15:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ajOmF-0003qN-Hq
	for qemu-devel@nongnu.org; Fri, 25 Mar 2016 06:15:39 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:63507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ajOmE-0003q8-78; Fri, 25 Mar 2016 06:15:35 -0400
Received: from 172.24.1.51 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BYR60587; Fri, 25 Mar 2016 17:46:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 25 Mar 2016 17:46:47 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2016 17:46:18 +0800
Message-ID: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.56F50915.0017, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4d91912709c5e18c6e65f885bb431bf0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: wei@redhat.com, peter.huangpeng@huawei.com, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-devel] [PATCH 0/3] Add guest PMU in machine virt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YTWiN9D3kaX7

From: Shannon Zhao <shannon.zhao@linaro.org>

KVM-ARM64 supports guest PMU now. This series add the support in machine
virt so that guest could use PMU.

Shannon Zhao (3):
  target-arm: kvm64: set guest PMUv3 feature bit if supported
  hw/arm/virt: Add PMU node for virt machine
  hw/arm/virt-acpi-build: Add PMU IRQ number in ACPI table

 hw/arm/virt-acpi-build.c      |  3 +++
 hw/arm/virt.c                 | 31 ++++++++++++++++++++++++
 include/hw/arm/virt.h         |  2 ++
 include/sysemu/kvm.h          |  1 +
 linux-headers/asm-arm64/kvm.h |  6 +++++
 linux-headers/linux/kvm.h     |  2 ++
 stubs/kvm.c                   |  5 ++++
 target-arm/cpu-qom.h          |  2 ++
 target-arm/kvm64.c            | 56 +++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 108 insertions(+)

-- 
2.0.4


