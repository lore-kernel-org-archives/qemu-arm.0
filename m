Received: by 10.25.77.65 with SMTP id a62csp127211lfb;
        Fri, 20 Jan 2017 10:50:38 -0800 (PST)
X-Received: by 10.200.37.85 with SMTP id 21mr13861015qtn.238.1484938238229;
        Fri, 20 Jan 2017 10:50:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si5443302qkd.212.2017.01.20.10.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 10:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeGh-0007Uh-OS
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 13:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeGb-0007Sm-Dq
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:50:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeGa-00056W-O0
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:50:29 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cUeGa-00054q-HJ; Fri, 20 Jan 2017 13:50:28 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cUeGU-0004AC-Ee; Fri, 20 Jan 2017 18:50:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jan 2017 18:50:22 +0000
Message-Id: <1484938222-1423-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] arm: stellaris: make MII accesses complete
 immediately
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
Cc: Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P6KqRp85mW3Q

From: Michael Davidsaver <mdavidsaver@gmail.com>

When the guest attempts to start an MII register
access via the MCTL register, clear the START bit,
so that when the guest reads it back the register
transaction will be signalled as having completed.
This avoids the guest spinning as it polls the
START bit waiting for it to clear (which it
previously never would).

The  MII registers themselves still aren't implemented,
but at least we can avoid guests spending quite so much
time busy waiting.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: expand commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a minor bugfix that was lurking in Michael's
git tree from his unfinished work on a v3 of the NVIC
patchset.

 hw/net/stellaris_enet.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 957730e..04bd10a 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -416,7 +416,10 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
         s->thr = value;
         break;
     case 0x20: /* MCTL */
-        s->mctl = value;
+        /* TODO: MII registers aren't modelled.
+         * Clear START, indicating that the operation completes immediately.
+         */
+        s->mctl = value & ~1;
         break;
     case 0x24: /* MDV */
         s->mdv = value;
-- 
2.7.4

