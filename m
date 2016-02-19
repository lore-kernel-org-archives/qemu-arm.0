Received: by 10.25.208.211 with SMTP id h202csp1115652lfg;
        Fri, 19 Feb 2016 04:03:38 -0800 (PST)
X-Received: by 10.55.72.67 with SMTP id v64mr2446641qka.101.1455883418897;
        Fri, 19 Feb 2016 04:03:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x69si13948365qha.127.2016.02.19.04.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 04:03:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWjmc-0003vt-Cy
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 07:03:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWjma-0003u5-Ap
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 07:03:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWjmZ-0004M5-DU
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 07:03:36 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:38462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWjmX-0004LX-71; Fri, 19 Feb 2016 07:03:33 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWjmO-0002ra-Qp; Fri, 19 Feb 2016 12:03:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 12:03:24 +0000
Message-Id: <1455883404-10976-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: xiaoqiang zhao <zxq_yx_007@163.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, patches@linaro.org
Subject: [Qemu-arm] [PATCH] tusb6010: move from hw/timer to hw/usb
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
X-TUID: bYp72s+pZzD/

The TUSB6010 is a USB controller (as the name suggests). Move it from
hw/timer (where it was accidentally filed in 2013 when we moved
everything out of hw/) to hw/usb.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/Makefile.objs       | 1 -
 hw/usb/Makefile.objs         | 2 ++
 hw/{timer => usb}/tusb6010.c | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename hw/{timer => usb}/tusb6010.c (100%)

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 133bd0d..5cfea6e 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -25,7 +25,6 @@ obj-$(CONFIG_OMAP) += omap_gptimer.o
 obj-$(CONFIG_OMAP) += omap_synctimer.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
 obj-$(CONFIG_SH4) += sh_timer.o
-obj-$(CONFIG_TUSB6010) += tusb6010.o
 obj-$(CONFIG_DIGIC) += digic-timer.o
 
 obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 8f00fbd..2717027 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -10,6 +10,8 @@ common-obj-$(CONFIG_USB_EHCI_SYSBUS) += hcd-ehci-sysbus.o
 common-obj-$(CONFIG_USB_XHCI) += hcd-xhci.o
 common-obj-$(CONFIG_USB_MUSB) += hcd-musb.o
 
+obj-$(CONFIG_TUSB6010) += tusb6010.o
+
 # emulated usb devices
 common-obj-$(CONFIG_USB) += dev-hub.o
 common-obj-$(CONFIG_USB) += dev-hid.o
diff --git a/hw/timer/tusb6010.c b/hw/usb/tusb6010.c
similarity index 100%
rename from hw/timer/tusb6010.c
rename to hw/usb/tusb6010.c
-- 
1.9.1

