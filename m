Received: by 10.25.205.13 with SMTP id d13csp294221lfg;
        Mon, 16 Jan 2017 18:20:30 -0800 (PST)
X-Received: by 10.55.122.194 with SMTP id v185mr21635503qkc.99.1484619630859;
        Mon, 16 Jan 2017 18:20:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d189si7132768qkf.177.2017.01.16.18.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 18:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTJNs-0001IN-DX
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 21:20:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cTJMs-00010O-Ob
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 21:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cTJMp-0003wI-Js
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 21:19:26 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:17396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cTJMp-0003vy-8s; Mon, 16 Jan 2017 21:19:23 -0500
Received: from 172.24.1.137 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.137])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DTM05196; Tue, 17 Jan 2017 10:16:01 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Tue, 17 Jan 2017 10:15:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Tue, 17 Jan 2017 10:15:34 +0800
Message-ID: <1484619334-10488-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.587D7E62.0031, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7cbfbceb6b517b1ca2fad7babfcac1ba
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 119.145.14.65
Subject: [Qemu-devel] [PATCH v2] arm: virt: Fix the segmentation fault when
 specifying an unsupported CPU
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, wu.wubin@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6xLYeXzDLa5i

From: Shannon Zhao <shannon.zhao@linaro.org>

For example, using -cpu generic will cause qemu segmentation fault.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
V2: Just remove the member NULL instead of checking twice
---
 hw/arm/virt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7a03f84..95ac585 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -167,7 +167,6 @@ static const char *valid_cpus[] = {
     "cortex-a53",
     "cortex-a57",
     "host",
-    NULL
 };
 
 static bool cpuname_valid(const char *cpu)
-- 
2.0.4


