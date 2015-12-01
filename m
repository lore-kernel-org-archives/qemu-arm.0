Received: by 10.182.158.201 with SMTP id ww9csp2588106obb;
        Tue, 1 Dec 2015 12:25:41 -0800 (PST)
X-Received: by 10.55.20.227 with SMTP id 96mr84174703qku.67.1449001541133;
        Tue, 01 Dec 2015 12:25:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si51834282qka.23.2015.12.01.12.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 12:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3rUa-0003L0-3R
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 15:25:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a3rUW-0003Jt-6Y
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 15:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a3rUS-0005Z8-KP
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 15:25:36 -0500
Received: from zose-mta05.web4all.fr ([185.49.20.50]:44182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a3rUS-0005Yr-9C; Tue, 01 Dec 2015 15:25:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 692D343757;
	Tue,  1 Dec 2015 21:25:29 +0100 (CET)
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id iANIRxCRor2k; Tue,  1 Dec 2015 21:25:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id D08FF4375C;
	Tue,  1 Dec 2015 21:25:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-05.w4a.fr
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id KiIGlR9g_uCg; Tue,  1 Dec 2015 21:25:28 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta05.web4all.fr (Postfix) with ESMTPSA id 836F443757;
	Tue,  1 Dec 2015 21:25:28 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Tue,  1 Dec 2015 21:25:19 +0100
Message-Id: <cover.1449000671.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.50
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-arm] [PATCH v5 0/4] Add an i.MX25 specific CCM driver
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
X-TUID: 4MGLVByItrbT

i.MX25 SOC has a different CCM device than i.MX31.

Qemu i.MX25 emulation was built with i.MX31 CCM driver. This allows
Linux to work on top of the i.MX25 emultion but this is not correct.

Furthermore, other SOC we could emulate like i.MX6 have yet a different
implementation of the CCM device.

So we split the i.MX31 into a generic base class and a specific i.MX31
class.

We then add an i.MX25 specific CCM Device and have the i.MX25 SOC use it.

Jean-Christophe Dubois (4):
  i.MX: Fix i.MX31 default/reset configuration.
  i.MX: rename i.MX CCM get_clock() function and CLK ID enum names
  i.MX: Split the CCM class into an abstact base class and a concrete
    class.
  i.MX: Add an i.MX25 specific CCM class/instance.

 hw/arm/fsl-imx25.c          |   6 +-
 hw/arm/fsl-imx31.c          |   6 +-
 hw/misc/Makefile.objs       |   2 +
 hw/misc/imx25_ccm.c         | 367 +++++++++++++++++++++++++++++++++++++++++
 hw/misc/imx31_ccm.c         | 392 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/imx_ccm.c           | 231 +++-----------------------
 hw/timer/imx_epit.c         |  20 +--
 hw/timer/imx_gpt.c          |  16 +-
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/arm/fsl-imx31.h  |   4 +-
 include/hw/misc/imx25_ccm.h |  61 +++++++
 include/hw/misc/imx31_ccm.h |  66 ++++++++
 include/hw/misc/imx_ccm.h   |  75 +++------
 include/hw/timer/imx_epit.h |   5 +-
 include/hw/timer/imx_gpt.h  |   5 +-
 15 files changed, 970 insertions(+), 290 deletions(-)
 create mode 100644 hw/misc/imx25_ccm.c
 create mode 100644 hw/misc/imx31_ccm.c
 create mode 100644 include/hw/misc/imx25_ccm.h
 create mode 100644 include/hw/misc/imx31_ccm.h

-- 
2.5.0

