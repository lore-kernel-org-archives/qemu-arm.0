Received: by 10.182.158.201 with SMTP id ww9csp450029obb;
        Wed, 25 Nov 2015 23:16:37 -0800 (PST)
X-Received: by 10.55.27.230 with SMTP id m99mr42967397qkh.103.1448522197063;
        Wed, 25 Nov 2015 23:16:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f10si25033347qkb.112.2015.11.25.23.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 23:16:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1qnE-0003Ns-Qx
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 02:16:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a1qml-0002y7-Tm
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 02:16:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a1qmi-0005AW-2m
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 02:16:07 -0500
Received: from zose-mta05.web4all.fr ([185.49.20.50]:32947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a1qmd-00055l-J3; Thu, 26 Nov 2015 02:15:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id B3FD240690;
	Thu, 26 Nov 2015 08:15:58 +0100 (CET)
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id af459RjwY6Rj; Thu, 26 Nov 2015 08:15:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 4ABCA4068F;
	Thu, 26 Nov 2015 08:15:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-05.w4a.fr
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id EIhwlHTBFv95; Thu, 26 Nov 2015 08:15:58 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta05.web4all.fr (Postfix) with ESMTPSA id EA98140666;
	Thu, 26 Nov 2015 08:15:57 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Thu, 26 Nov 2015 08:15:54 +0100
Message-Id: <cover.1448521064.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.50
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-devel] [PATCH v4 0/3] Add an i.MX25 specific CCM driver
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dD8qzoYNbHPI

i.MX25 SOC has a different CCM device than i.MX31.

Qemu i.MX25 emulation was built with i.MX31 CCM driver. This allows
Linux to work on top of the i.MX25 emultion but this is not correct.

Furthermore, other SOC we could emulate like i.MX6 have yet a different
implementation of the CCM device.

So we split the i.MX31 into a generic base class and a specific i.MX31
class.

We then add an i.MX25 specific CCM Device and have the i.MX25 SOC use it.

Jean-Christophe Dubois (3):
  i.MX: rename i.MX CCM get_clock() function and CLK ID enum names
  i.MX: Split the CCM class into an abstact base class and a concrete
    class.
  i.MX: Add an i.MX25 specific CCM class/instance.

 hw/arm/fsl-imx25.c          |   6 +-
 hw/arm/fsl-imx31.c          |   6 +-
 hw/misc/Makefile.objs       |   2 +
 hw/misc/imx25_ccm.c         | 276 +++++++++++++++++++++++++++++++++++++++
 hw/misc/imx31_ccm.c         | 306 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/imx_ccm.c           | 226 +++-----------------------------
 hw/timer/imx_epit.c         |  20 ++-
 hw/timer/imx_gpt.c          |  16 +--
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/arm/fsl-imx31.h  |   4 +-
 include/hw/misc/imx25_ccm.h |  59 +++++++++
 include/hw/misc/imx31_ccm.h |  64 +++++++++
 include/hw/misc/imx_ccm.h   |  75 ++++-------
 include/hw/timer/imx_epit.h |   5 +-
 include/hw/timer/imx_gpt.h  |   5 +-
 15 files changed, 784 insertions(+), 290 deletions(-)
 create mode 100644 hw/misc/imx25_ccm.c
 create mode 100644 hw/misc/imx31_ccm.c
 create mode 100644 include/hw/misc/imx25_ccm.h
 create mode 100644 include/hw/misc/imx31_ccm.h

-- 
2.5.0

