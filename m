Received: by 10.25.208.137 with SMTP id h131csp1683194lfg;
        Mon, 9 May 2016 10:30:29 -0700 (PDT)
X-Received: by 10.140.102.178 with SMTP id w47mr33224663qge.21.1462815024548;
        Mon, 09 May 2016 10:30:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g143si10633784qhc.45.2016.05.09.10.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp0i-000459-2T
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:30:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0f-0003yN-8Q
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0d-0000Gx-7w
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0c-00005k-Vk; Mon, 09 May 2016 13:30:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0N-0001Vk-AW; Mon, 09 May 2016 18:30:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:46 +0100
Message-Id: <1462814989-24360-21-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 20/23] target-arm/monitor.c: Advertise emulated
 GICv3 in capabilities
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +vL5NW6uB8e3

Now we have an emulated GICv3 we should advertise it via the
capabilities in the monitor protocol.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/monitor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-arm/monitor.c b/target-arm/monitor.c
index 1ee59a2..299cb80 100644
--- a/target-arm/monitor.c
+++ b/target-arm/monitor.c
@@ -72,8 +72,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
     GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
 
     v2->emulated = true;
-    /* TODO: we'd change to true after we get emulated GICv3. */
-    v3->emulated = false;
+    v3->emulated = true;
 
     gic_cap_kvm_probe(v2, v3);
 
-- 
1.9.1

