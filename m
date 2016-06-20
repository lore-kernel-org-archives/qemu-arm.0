Received: by 10.25.21.96 with SMTP id l93csp1230643lfi;
        Sun, 19 Jun 2016 18:57:05 -0700 (PDT)
X-Received: by 10.55.179.195 with SMTP id c186mr17989607qkf.28.1466387825826;
        Sun, 19 Jun 2016 18:57:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a76si45168947qkj.186.2016.06.19.18.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 19 Jun 2016 18:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEoSX-0008IT-7K
	for alex.bennee@linaro.org; Sun, 19 Jun 2016 21:57:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bEoSR-0008HH-Jh
	for qemu-arm@nongnu.org; Sun, 19 Jun 2016 21:57:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bEoSQ-0001Z1-NY
	for qemu-arm@nongnu.org; Sun, 19 Jun 2016 21:56:59 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:30710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bEoRt-0001Tc-U0; Sun, 19 Jun 2016 21:56:47 -0400
Received: from 172.24.1.136 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DML14661; Mon, 20 Jun 2016 09:55:43 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 20 Jun 2016 09:55:35 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 09:55:17 +0800
Message-ID: <1466387717-13740-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.57674D23.00D4, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c7b415878b7ca7870cb458b0a9cafc96
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gicv3: Add missing break
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
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7LcQegYNRn6O

From: Shannon Zhao <shannon.zhao@linaro.org>

These are spotted by coverity 1356936 and 1356937.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 5b2972e..4633172 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -975,6 +975,7 @@ static CPAccessResult gicv3_irqfiq_access(CPUARMState *env,
             if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
+            break;
         default:
             g_assert_not_reached();
         }
@@ -1006,6 +1007,7 @@ static CPAccessResult gicv3_fiq_access(CPUARMState *env,
             if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
+            break;
         default:
             g_assert_not_reached();
         }
-- 
2.0.4


