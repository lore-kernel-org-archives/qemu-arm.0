Received: by 10.25.30.65 with SMTP id e62csp535476lfe;
        Thu, 26 May 2016 07:59:45 -0700 (PDT)
X-Received: by 10.200.45.177 with SMTP id p46mr9408104qta.82.1464274785321;
        Thu, 26 May 2016 07:59:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x9si11663926qhb.121.2016.05.26.07.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wlE-0002zy-OR
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:59:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whZ-0007Sr-6r
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whW-00058d-Vp
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:56 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whW-00058Q-Oq; Thu, 26 May 2016 10:55:54 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whV-0004AQ-Rt; Thu, 26 May 2016 15:55:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:37 +0100
Message-Id: <1464274540-19693-20-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 19/22] target-arm/machine.c: Allow user to
 request GICv3 emulation
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
X-TUID: Ej/nlgLob7Wg

Now we have an emulated GICv3, remove the restriction in
gicv3_class_name() so that the user can request a GICv3 with
-machine gic-version=3 even when not using KVM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/machine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index 2f45260..2dbeb82 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -342,8 +342,7 @@ const char *gicv3_class_name(void)
                      "platform");
 #endif
     } else {
-        /* TODO: Software emulation is not implemented yet */
-        error_report("KVM is currently required for GICv3 emulation");
+        return "arm-gicv3";
     }
 
     exit(1);
-- 
1.9.1

