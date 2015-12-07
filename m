Received: by 10.182.158.201 with SMTP id ww9csp2607549obb;
        Mon, 7 Dec 2015 14:53:33 -0800 (PST)
X-Received: by 10.55.77.9 with SMTP id a9mr408901qkb.38.1449528813644;
        Mon, 07 Dec 2015 14:53:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si336531qhz.53.2015.12.07.14.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Dec 2015 14:53:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a64ey-00018F-QX
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 17:53:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64ew-000184-It
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 17:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64et-0004y0-8i
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 17:53:30 -0500
Received: from zose-mta03.web4all.fr ([185.49.20.44]:45170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a64et-0004xP-2m; Mon, 07 Dec 2015 17:53:27 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta03.web4all.fr (Postfix) with ESMTP id 87CE544F6C;
	Mon,  7 Dec 2015 23:53:25 +0100 (CET)
Received: from zose-mta03.web4all.fr ([127.0.0.1])
	by localhost (zose-mta03.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 0PpPnbLNSwGi; Mon,  7 Dec 2015 23:53:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta03.web4all.fr (Postfix) with ESMTP id 1F1D844F6F;
	Mon,  7 Dec 2015 23:53:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-03.w4a.fr
Received: from zose-mta03.web4all.fr ([127.0.0.1])
	by localhost (zose-mta03.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id S5j97fFNq7f7; Mon,  7 Dec 2015 23:53:25 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta03.web4all.fr (Postfix) with ESMTPSA id C6B3044F6C;
	Mon,  7 Dec 2015 23:53:24 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Mon,  7 Dec 2015 23:53:22 +0100
Message-Id: <cover.1449528242.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.44
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-arm] [PATCH v6 0/5] Add an i.MX25 specific CCM driver
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wkpWecqdoPEY

i.MX25 SOC has a different CCM device than i.MX31.

Qemu i.MX25 emulation was built with i.MX31 CCM driver. This allows
Linux to work on top of the i.MX25 emultion but this is not correct.

Furthermore, other SOC we could emulate like i.MX6 have yet a different
implementation of the CCM device.

So we split the i.MX31 into a generic base class and a specific i.MX31
class.

We then add an i.MX25 specific CCM Device and have the i.MX25 SOC use it.

Jean-Christophe Dubois (5):
  i.MX: Fix i.MX31 default/reset configuration.
  i.MX: rename i.MX CCM get_clock() function and CLK ID enum names
  i.MX: Split the CCM class into an abstact base class and a concrete
    class.
  i.MX: Add an i.MX25 specific CCM class/instance.
  i.MX: move i.MX31 CCM object to register array.

 hw/arm/fsl-imx25.c          |   6 +-
 hw/arm/fsl-imx31.c          |   6 +-
 hw/misc/Makefile.objs       |   2 +
 hw/misc/imx25_ccm.c         | 341 ++++++++++++++++++++++++++++++++++++++++
 hw/misc/imx31_ccm.c         | 374 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/imx_ccm.c           | 231 +++------------------------
 hw/timer/imx_epit.c         |  20 ++-
 hw/timer/imx_gpt.c          |  16 +-
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/arm/fsl-imx31.h  |   4 +-
 include/hw/misc/imx25_ccm.h |  79 ++++++++++
 include/hw/misc/imx31_ccm.h |  88 +++++++++++
 include/hw/misc/imx_ccm.h   |  75 ++++-----
 include/hw/timer/imx_epit.h |   5 +-
 include/hw/timer/imx_gpt.h  |   5 +-
 15 files changed, 966 insertions(+), 290 deletions(-)
 create mode 100644 hw/misc/imx25_ccm.c
 create mode 100644 hw/misc/imx31_ccm.c
 create mode 100644 include/hw/misc/imx25_ccm.h
 create mode 100644 include/hw/misc/imx31_ccm.h

-- 
2.5.0

