Received: by 10.25.208.194 with SMTP id h185csp747676lfg;
        Mon, 25 Apr 2016 00:15:24 -0700 (PDT)
X-Received: by 10.55.80.136 with SMTP id e130mr37254243qkb.28.1461568524202;
        Mon, 25 Apr 2016 00:15:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j40si9758108qkh.218.2016.04.25.00.15.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 00:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auajq-0003p9-JS
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 03:15:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auahV-0007wR-0n
	for qemu-devel@nongnu.org; Mon, 25 Apr 2016 03:12:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auahR-0008SI-0W
	for qemu-devel@nongnu.org; Mon, 25 Apr 2016 03:12:56 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:54867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1auahQ-0008S7-F3; Mon, 25 Apr 2016 03:12:52 -0400
Received: from 172.24.1.47 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY19817; Mon, 25 Apr 2016 15:12:31 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 15:12:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 15:11:43 +0800
Message-ID: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.571DC360.00FD, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 61f3ce342f5c7cd38dab0de58eac007f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-devel] [PATCH v3 0/3] Add guest PMU in machine virt
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
Cc: drjones@redhat.com, shannon.zhao@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7dkTdJHop12

From: Shannon Zhao <shannon.zhao@linaro.org>

KVM-ARM64 supports guest PMU now. This series add the support in machine
virt so that guest could use PMU.

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

 hw/arm/virt-acpi-build.c |  3 +++
 hw/arm/virt.c            | 34 ++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  4 ++++
 include/sysemu/kvm.h     |  1 +
 stubs/kvm.c              |  5 +++++
 target-arm/cpu-qom.h     |  2 ++
 target-arm/kvm64.c       | 44 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 93 insertions(+)

-- 
2.0.4


