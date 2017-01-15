Received: by 10.25.205.13 with SMTP id d13csp935614lfg;
        Sun, 15 Jan 2017 02:51:47 -0800 (PST)
X-Received: by 10.55.82.84 with SMTP id g81mr27913335qkb.235.1484477506980;
        Sun, 15 Jan 2017 02:51:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si12152687qki.166.2017.01.15.02.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Jan 2017 02:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cSiPa-0002pe-9d
	for alex.bennee@linaro.org; Sun, 15 Jan 2017 05:51:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cSiPS-0002pX-IU
	for qemu-arm@nongnu.org; Sun, 15 Jan 2017 05:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cSiPP-0006Vl-IP
	for qemu-arm@nongnu.org; Sun, 15 Jan 2017 05:51:38 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:47310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cSiPP-0006Ro-73; Sun, 15 Jan 2017 05:51:35 -0500
Received: from 172.24.1.36 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id COA63786; Sun, 15 Jan 2017 18:51:20 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Sun, 15 Jan 2017 18:51:11 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sun, 15 Jan 2017 18:51:02 +0800
Message-ID: <1484477462-14088-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH] arm: virt: Fix the segmentation fault when
 specifying an unsupported CPU
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
Cc: qemu-devel@nongnu.org, wu.wubin@huawei.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+WVQNuWQNa5

From: Shannon Zhao <shannon.zhao@linaro.org>

For example, using -cpu generic will cause qemu segmentation fault.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7a03f84..4b301c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -175,7 +175,7 @@ static bool cpuname_valid(const char *cpu)
     int i;
 
     for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
-        if (strcmp(cpu, valid_cpus[i]) == 0) {
+        if (valid_cpus[i] != NULL && strcmp(cpu, valid_cpus[i]) == 0) {
             return true;
         }
     }
-- 
2.0.4


