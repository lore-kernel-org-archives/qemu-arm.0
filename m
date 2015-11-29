Received: by 10.182.158.201 with SMTP id ww9csp876116obb;
        Sun, 29 Nov 2015 00:23:23 -0800 (PST)
X-Received: by 10.140.44.9 with SMTP id f9mr37637670qga.69.1448785402617;
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d127si27728278qkb.124.2015.11.29.00.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2xGU-0008MU-0T
	for alex.bennee@linaro.org; Sun, 29 Nov 2015 03:23:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2xGR-0008MF-Vj
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:23:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2xGP-0003rF-G0
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:23:19 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:10772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a2xGO-0003qU-Rn; Sun, 29 Nov 2015 03:23:17 -0500
Received: from 172.24.1.50 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BRU76650; Sun, 29 Nov 2015 16:23:09 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Sun, 29 Nov 2015 16:23:02 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <p.fedin@samsung.com>
Date: Sun, 29 Nov 2015 16:22:48 +0800
Message-ID: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.565AB5EE.001A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: aa3fc5536996b0b1d003843de8cfd754
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: hangaohuai@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-arm] [RFC PATCH 0/2] Add GIC ITS description in ACPI MADT
	table
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
X-TUID: Openq8hRgBEi

From: Shannon Zhao <shannon.zhao@linaro.org>

These two patches add ITS description in ACPI MADT table. It bases on
Pavel Fedin's ITS series[1].

[1]https://www.mail-archive.com/qemu-devel@nongnu.org/msg337421.html

Shannon Zhao (2):
  ACPI: Add GIC Interrupt Translation Service Structure definition
  ARM: Virt: ACPI: Add GIC ITS description in ACPI MADT table

 hw/arm/virt-acpi-build.c    | 11 +++++++++++
 include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.0.4


