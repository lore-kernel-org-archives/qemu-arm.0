Received: by 10.25.21.156 with SMTP id 28csp1593340lfv;
        Mon, 11 Jul 2016 11:09:23 -0700 (PDT)
X-Received: by 10.55.96.66 with SMTP id u63mr26012114qkb.88.1468260562276;
        Mon, 11 Jul 2016 11:09:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g62si200505qkd.69.2016.07.11.11.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 11:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMfdx-0006yX-KM
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 14:09:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bMfdr-0006wK-Og
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:09:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bMfdq-0002O5-Sd
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:09:15 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bMfdq-0002Nf-MC; Mon, 11 Jul 2016 14:09:14 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bMfdp-00071r-Aj; Mon, 11 Jul 2016 19:09:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Jul 2016 19:09:12 +0100
Message-Id: <1468260552-8400-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target-arm: Fix unreachable code in
 gicv3_class_name()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6qSw2VHqNOkc

Coverity complains that the exit() in gicv3_class_name()
can be unreachable, because if TARGET_AARCH64 is defined
then all code paths return before reaching it. Move the
exit() up to the error_report() that it belongs with.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/machine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index 2dbeb82..7a6ca31 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -340,10 +340,9 @@ const char *gicv3_class_name(void)
 #else
         error_report("KVM GICv3 acceleration is not supported on this "
                      "platform");
+        exit(1);
 #endif
     } else {
         return "arm-gicv3";
     }
-
-    exit(1);
 }
-- 
1.9.1

