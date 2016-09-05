Received: by 10.25.87.130 with SMTP id l124csp1791225lfb;
        Sun, 4 Sep 2016 23:02:34 -0700 (PDT)
X-Received: by 10.55.81.133 with SMTP id f127mr24422552qkb.136.1473055354487;
        Sun, 04 Sep 2016 23:02:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s64si16622788qkb.290.2016.09.04.23.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgmzK-0002NL-1y
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxS-0001A0-VW
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxN-0001nU-8F
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:00:37 -0400
Received: from 2.mo7.mail-out.ovh.net ([87.98.143.68]:52945)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxN-0001nO-1g
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:00:33 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 27EC6100024B
	for <qemu-devel@nongnu.org>; Mon,  5 Sep 2016 08:00:32 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id DE7DD640072;
	Mon,  5 Sep 2016 08:00:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 08:00:00 +0200
Message-Id: <1473055209-18864-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 720575940514056977
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.143.68
Subject: [Qemu-devel] [PATCH v4 01/10] ast2400: rename the Aspeed SoC files
 to aspeed_soc
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: imwt4mW2WhUk

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

