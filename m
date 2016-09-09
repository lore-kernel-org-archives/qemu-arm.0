Received: by 10.80.163.71 with SMTP id 65csp198401edn;
        Fri, 9 Sep 2016 09:23:40 -0700 (PDT)
X-Received: by 10.55.192.24 with SMTP id o24mr5205784qki.113.1473438220067;
        Fri, 09 Sep 2016 09:23:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si2548761qtg.0.2016.09.09.09.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOaZ-0002My-H0
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:23:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaU-0002JP-KQ
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaP-0005jv-Ih
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:33 -0400
Received: from 1.mo178.mail-out.ovh.net ([178.33.251.53]:53931)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biOaP-0005jj-CS
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:29 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 90439FFC897
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:23:28 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 49FE93C0066;
	Fri,  9 Sep 2016 18:23:23 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:44 +0200
Message-Id: <1473438177-26079-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16285016253905603345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.53
Subject: [Qemu-arm] [PATCH v5 01/14] ast2400: rename the Aspeed SoC files to
 aspeed_soc
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
X-TUID: aB/d3lWgHADH

Let's prepare for new Aspeed SoCs and rename the ast2400 file to a
more generic one. There are no changes in the code apart from the
header file include.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Makefile.objs                       | 2 +-
 hw/arm/{ast2400.c =3D> aspeed_soc.c}         | 2 +-
 hw/arm/palmetto-bmc.c                      | 2 +-
 include/hw/arm/{ast2400.h =3D> aspeed_soc.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename hw/arm/{ast2400.c =3D> aspeed_soc.c} (99%)
 rename include/hw/arm/{ast2400.h =3D> aspeed_soc.h} (100%)

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 12764ef2b719..7901294630b1 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,4 +17,4 @@ obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108=
.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
-obj-$(CONFIG_ASPEED_SOC) +=3D ast2400.o palmetto-bmc.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o palmetto-bmc.o
diff --git a/hw/arm/ast2400.c b/hw/arm/aspeed_soc.c
similarity index 99%
rename from hw/arm/ast2400.c
rename to hw/arm/aspeed_soc.c
index 136bf6464e1d..b272f4e48cfc 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/aspeed_soc.c
@@ -15,7 +15,7 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
-#include "hw/arm/ast2400.h"
+#include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
 #include "qemu/log.h"
 #include "hw/i2c/aspeed_i2c.h"
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 54e29a865d88..67676a8a8042 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -15,7 +15,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "hw/arm/arm.h"
-#include "hw/arm/ast2400.h"
+#include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/aspeed_soc.h
similarity index 100%
rename from include/hw/arm/ast2400.h
rename to include/hw/arm/aspeed_soc.h
--=20
2.7.4

