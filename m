Received: by 10.25.21.156 with SMTP id 28csp836334lfv;
        Thu, 28 Jul 2016 07:29:26 -0700 (PDT)
X-Received: by 10.200.50.199 with SMTP id a7mr58798265qtb.43.1469716166667;
        Thu, 28 Jul 2016 07:29:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x34si8165565qtx.14.2016.07.28.07.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmJS-00082Q-2T
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:29:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJC-0007qE-Qx
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJ8-0005v5-9H
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:10 -0400
Received: from 1.mo7.mail-out.ovh.net ([178.33.45.51]:46324)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmJ8-0005uQ-0D
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:06 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 52ECB101043F
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:29:00 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 1D1705C0083;
	Thu, 28 Jul 2016 16:28:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:14 +0200
Message-Id: <1469716099-8975-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1633680765920119569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.45.51
Subject: [Qemu-arm] [PATCH v2 4/9] ast2400: use machine cpu_model to
 initialize the soc cpu
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kIGV3NyARz2s

It will be easier to specify a different cpu for other soc derived
from the ast2400 soc.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Change since v1:

 - remove check on cpu_model.=20

 hw/arm/aspeed.c  | 1 +
 hw/arm/ast2400.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index f80a15733864..8a3ff5568575 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -91,6 +91,7 @@ static void aspeed_init(MachineState *machine)
=20
 static void palmetto_bmc_init(MachineState *machine)
 {
+    machine->cpu_model =3D "arm926";
     aspeed_init(machine);
 }
=20
diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index fa535065f765..84f3b444db09 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -15,6 +15,7 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
+#include "hw/boards.h"
 #include "hw/arm/ast2400.h"
 #include "hw/char/serial.h"
 #include "qemu/log.h"
@@ -67,7 +68,7 @@ static void ast2400_init(Object *obj)
 {
     AST2400State *s =3D AST2400(obj);
=20
-    s->cpu =3D cpu_arm_init("arm926");
+    s->cpu =3D cpu_arm_init(current_machine->cpu_model);
=20
     object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
     object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
--=20
2.1.4

