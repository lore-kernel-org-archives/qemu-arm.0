Received: by 10.25.21.156 with SMTP id 28csp351663lfv;
        Wed, 27 Jul 2016 09:56:57 -0700 (PDT)
X-Received: by 10.55.162.78 with SMTP id l75mr37901207qke.5.1469638616972;
        Wed, 27 Jul 2016 09:56:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w88si4888319qtd.96.2016.07.27.09.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 09:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSS8e-0006le-FK
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 12:56:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzg-0007MI-Nq
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzd-0001zt-SZ
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:40 -0400
Received: from 4.mo7.mail-out.ovh.net ([178.32.122.254]:39490)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSRzd-0001zS-La
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:37 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id AD303FFCF8F
	for <qemu-devel@nongnu.org>; Wed, 27 Jul 2016 18:47:36 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 64A845C008A;
	Wed, 27 Jul 2016 18:47:31 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2016 18:46:55 +0200
Message-Id: <1469638018-17590-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469638018-17590-1-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16548476834957265681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.122.254
Subject: [Qemu-devel] [PATCH 3/6] ast2400: use machine cpu_model to
 initialize the soc cpu
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QdNZ5JnyWK2M

It will be easier to specify a different cpu for other soc derived
from the ast2400 soc.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c      | 8 +++++++-
 hw/arm/palmetto-bmc.c | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index fa535065f765..7f3517a2c6c6 100644
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
@@ -65,9 +66,14 @@ static const MemoryRegionOps ast2400_io_ops =3D {
=20
 static void ast2400_init(Object *obj)
 {
+    const char *cpu_model =3D current_machine->cpu_model;
     AST2400State *s =3D AST2400(obj);
=20
-    s->cpu =3D cpu_arm_init("arm926");
+    if (!cpu_model) {
+        cpu_model =3D "arm926";
+    }
+
+    s->cpu =3D cpu_arm_init(cpu_model);
=20
     object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
     object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index f80a15733864..8a3ff5568575 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -91,6 +91,7 @@ static void aspeed_init(MachineState *machine)
=20
 static void palmetto_bmc_init(MachineState *machine)
 {
+    machine->cpu_model =3D "arm926";
     aspeed_init(machine);
 }
=20
--=20
2.1.4

