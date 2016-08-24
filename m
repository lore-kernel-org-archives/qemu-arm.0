Received: by 10.25.21.156 with SMTP id 28csp192288lfv;
        Wed, 24 Aug 2016 01:03:26 -0700 (PDT)
X-Received: by 10.55.74.14 with SMTP id x14mr1755785qka.102.1472025806874;
        Wed, 24 Aug 2016 01:03:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u16si5523940qki.223.2016.08.24.01.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 01:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcT9i-0000fN-99
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 04:03:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bcT9W-0000RT-F5
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bcT9R-0003sM-Fb
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:03:13 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:48808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bcT9J-0003kt-TW; Wed, 24 Aug 2016 04:03:02 -0400
Received: from 172.24.1.136 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMC33647; Wed, 24 Aug 2016 16:02:51 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml430-hub.china.huawei.com (10.82.67.185) with Microsoft SMTP
	Server id 14.3.235.1; Wed, 24 Aug 2016 16:02:40 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2016 16:02:23 +0800
Message-ID: <1472025743-11484-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
References: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.57BD54AC.0014, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3f473621e3c96f3e834d9a3743645a65
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [RFC PATCH 3/3] hw/arm/virt: Add cortex-a72 cpu support
 in machine virt
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
Cc: qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GUAxSEgiIKGm

From: Shannon Zhao <shannon.zhao@linaro.org>

Add cortex-a72 cpu support in machine virt, so it can be used for TCG
and KVM.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a193b5a..adffe03 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -217,6 +217,11 @@ static VirtBoardInfo machines[] = {
         .irqmap = a15irqmap,
     },
     {
+        .cpu_model = "cortex-a72",
+        .memmap = a15memmap,
+        .irqmap = a15irqmap,
+    },
+    {
         .cpu_model = "host",
         .memmap = a15memmap,
         .irqmap = a15irqmap,
-- 
2.0.4


