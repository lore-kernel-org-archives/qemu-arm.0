Received: by 10.25.21.96 with SMTP id l93csp272603lfi;
        Fri, 1 Jul 2016 05:46:03 -0700 (PDT)
X-Received: by 10.55.201.70 with SMTP id q67mr25683033qki.124.1467377163509;
        Fri, 01 Jul 2016 05:46:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si1945288qki.193.2016.07.01.05.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 05:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIxpa-0005hs-V3
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 08:46:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bIxpS-0005Er-G9
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 08:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bIxpQ-0005Xa-6j
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 08:45:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bIxpP-0005XT-VY; Fri, 01 Jul 2016 08:45:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bIxpK-0007iY-Au; Fri, 01 Jul 2016 13:45:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  1 Jul 2016 13:45:45 +0100
Message-Id: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.7] aux: Rename aux.[ch] to auxbus.[ch] for
 the benefit of Windows
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
Cc: Eric Blake <eblake@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <fred.konrad@greensocs.com>,
	=?UTF-8?q?=D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9=20=D0=9A=D1=83=D1=80=D0=B3=D0=B0=D0=BD?=
	<akurgan@yandex.ru>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xeH+OM9qt0ba

On Windows 'aux.*' is a reserved name and cannot be used for
filenames; see
  https://msdn.microsoft.com/en-gb/library/windows/desktop/aa365247(v=vs.85).aspx

This prevents cloning the QEMU git repo on Windows:

C:\Java\sources\kvm> git clone https://github.com/qemu/qemu.git
Cloning into 'qemu'...
remote: Counting objects: 279563, done.
remote: Total 279563 (delta 0), reused 0 (delta 0), pack-reused 279563R
Receiving objects: 100% (279563/279563), 122.45 MiB | 3.52 MiB/s, done.
Resolving deltas: 100% (221942/221942), done.
Checking connectivity... done.
error: unable to create file hw/misc/aux.c (No such file or directory)
error: unable to create file include/hw/misc/aux.h (No such file or directory)
Checking out files: 100% (4795/4795), done.
fatal: unable to checkout working tree
warning: Clone succeeded, but checkout failed.
You can inspect what was checked out with 'git status'
and retry the checkout with 'git checkout -f HEAD'

(bug https://bugs.launchpad.net/bugs/1595240)

Rename the offending files for the benefit of Windows.

Reported-by: Алексей Курган <akurgan@yandex.ru>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/dpcd.c                   | 2 +-
 hw/misc/Makefile.objs               | 2 +-
 hw/misc/{aux.c => auxbus.c}         | 4 ++--
 include/hw/display/xlnx_dp.h        | 2 +-
 include/hw/misc/{aux.h => auxbus.h} | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/misc/{aux.c => auxbus.c} (99%)
 rename include/hw/misc/{aux.h => auxbus.h} (99%)

diff --git a/hw/display/dpcd.c b/hw/display/dpcd.c
index 5a36855..ce92ff6 100644
--- a/hw/display/dpcd.c
+++ b/hw/display/dpcd.c
@@ -28,7 +28,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "hw/misc/aux.h"
+#include "hw/misc/auxbus.h"
 #include "hw/display/dpcd.h"
 
 #ifndef DEBUG_DPCD
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 54020aa..4cfbd10 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -51,5 +51,5 @@ obj-$(CONFIG_MIPS_ITU) += mips_itu.o
 obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
-obj-$(CONFIG_AUX) += aux.o
+obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
diff --git a/hw/misc/aux.c b/hw/misc/auxbus.c
similarity index 99%
rename from hw/misc/aux.c
rename to hw/misc/auxbus.c
index 25d7712..df2414b 100644
--- a/hw/misc/aux.c
+++ b/hw/misc/auxbus.c
@@ -1,5 +1,5 @@
 /*
- * aux.c
+ * auxbus.c
  *
  *  Copyright 2015 : GreenSocs Ltd
  *      http://www.greensocs.com/ , email: info@greensocs.com
@@ -28,7 +28,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "hw/misc/aux.h"
+#include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
 #include "monitor/monitor.h"
 
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index d3a03f1..ee046a5 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -24,7 +24,7 @@
 
 #include "hw/sysbus.h"
 #include "ui/console.h"
-#include "hw/misc/aux.h"
+#include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/dpcd.h"
 #include "hw/i2c/i2c-ddc.h"
diff --git a/include/hw/misc/aux.h b/include/hw/misc/auxbus.h
similarity index 99%
rename from include/hw/misc/aux.h
rename to include/hw/misc/auxbus.h
index 759c3bf..af39db7 100644
--- a/include/hw/misc/aux.h
+++ b/include/hw/misc/auxbus.h
@@ -1,5 +1,5 @@
 /*
- * aux.h
+ * auxbus.h
  *
  *  Copyright (C)2014 : GreenSocs Ltd
  *      http://www.greensocs.com/ , email: info@greensocs.com
-- 
1.9.1

