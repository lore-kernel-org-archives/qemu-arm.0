Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1211935lfc;
        Thu, 12 Mar 2020 14:35:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsIVbfLR5TzhK3Cxbgd6he1PiVdK5EvGVtccx+a7rSC90Ye/olv3nXi7lle6DO1HMP62Vic
X-Received: by 2002:aed:2625:: with SMTP id z34mr3535941qtc.276.1584048923155;
        Thu, 12 Mar 2020 14:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584048923; cv=none;
        d=google.com; s=arc-20160816;
        b=THuLdeuNwvlmUh5BntDpXQlyso7eaqUUW02tESKw77/6aj4zcw4gFOOQdKbQHfkeWj
         1XBrudpBUWymSWe+Hgc2kpDpCGK2QOhJHGm9cdaY1OkCmMCyo+sBazERXiU9Ha6pPh9q
         0HWfAyMcQempjY0OHZxfCusGucBghbuv4cJkjNUEwDTGicWFNjFqeDJddLixaOTAzJl4
         DDtFaOABT1ZNeKK4oUPzJmKnerA1qSTmy7HXz+t9vSq1CqWhUyB6UGpxHr0JbQjvejbO
         tJOZyNDZVgQ/k+fbSgmHXfptjboFqmbz9DrfFmw4BpGqZFUep+hJEIfGTYA0WD1QukVh
         p3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=mFXbCCigBc0ZW7QUeDzPsEBC/Vs0XXPpm3bcXDVS2qo=;
        b=VZ78Ai/Pm5WuyGmKh93g/ullqs3g5vLtMk5zs6jiVQi5i6F6aVbV+bfakfUFGo1VIU
         mnPqf4gLfC2tcAFl+CgWsaIa7PUYqQ425QlBBxRG/zJpJ6aUb3GY0hHvGuR5Y/kaol/U
         wFAsjrBx4LsU87ObY7nIIWfX8rSPtDI4ZwjMwqtBNNTAsiwTGuc9eXy6bPR2hPEJeb/9
         B4txK6ewX9Hl59I1tlycjThbJgRHiXwKTAooLnvd9M/oFcTp2k49a8K56PSoklMzg9pw
         PkkmZ6PYgLjJa3zjYzzZfrWj7o7T82udN4jSokntMTuUZT/61k/zoR9V3YPswSN6hGYN
         M+BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vv7r8OJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk9si3260703qvb.92.2020.03.12.14.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 14:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vv7r8OJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCVUA-0008MP-Im
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 17:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCVU1-0008Lt-B9
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 17:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCVTy-0005FO-Mc
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 17:35:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24320
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCVTy-0005Dt-Hv
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 17:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584048909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mFXbCCigBc0ZW7QUeDzPsEBC/Vs0XXPpm3bcXDVS2qo=;
 b=Vv7r8OJXQXEy7zVe7Tx/Ws+9mLZBHLjKXYSk0ON8NipM8YFf+L4PQ5wRonXqfWKbrc9bVl
 tXiZIuIQi6PJHkvGCLIWz4gI9VZY77amiu5BOBUKbRgbVoE1LprMT2gQkMXcbFubCibJwy
 ukMbqZ6TuEWr7len1zT60zMKxEQC8Mo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-W9kR7fDvNny8rXVX0byMgg-1; Thu, 12 Mar 2020 17:35:05 -0400
X-MC-Unique: W9kR7fDvNny8rXVX0byMgg-1
Received: by mail-wm1-f71.google.com with SMTP id a13so2703385wme.7
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 14:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTi8YTd4XLR6S3OLKdtMkCx2y1clO9+fdoByjKp8tgw=;
 b=JDqf+JN4MStmqckkSHuYKsy3PQWf884RC7ijg+3pf63QZ5qI3eTiDIy2AANDvP5XjY
 o1Gzl0mvRqqWWqdWAW6I4nY7kFod7ZSa5kH+lbYsYc9tL8meHgjazhLRux6Mz16DqJ9k
 wFcgzAHluyjYoiyKozsDj17aWRQhi8dMbok4D/RlxwPflinJgUyf0CoXLXEuaGgPptwX
 F0W4y5jarqGuUX4lL3/EpF9jyAiejToKOnUk9wUQLJydEHEwgOZO6J2NKBm2tVWVGCMO
 jZ5TpUMioG9u1wqwhY+wJQCd4IwH9LLAd9OmmTI4aS166ut9542Any7Gd2j2qn3rwvMO
 NOcg==
X-Gm-Message-State: ANhLgQ33sePVlUvw0jdrRDoDM3UIxiYtuGtrpn+8wXkNUWDMrXdx34wG
 VLaxWrDZd1LV3VN6Upt4YlKJJQj9zh5x97EuBFV9XJ9Yai1OI98LPNgRrKVcmDwa2sHGyqelC1y
 8rgBjCaSxZqga
X-Received: by 2002:adf:f0c6:: with SMTP id x6mr12710923wro.273.1584048904435; 
 Thu, 12 Mar 2020 14:35:04 -0700 (PDT)
X-Received: by 2002:adf:f0c6:: with SMTP id x6mr12710886wro.273.1584048903943; 
 Thu, 12 Mar 2020 14:35:03 -0700 (PDT)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id i9sm14457664wmd.37.2020.03.12.14.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 14:35:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/bcm283x: Correct the license text
Date: Thu, 12 Mar 2020 22:34:55 +0100
Message-Id: <20200312213455.15854-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RWuPsMyIJjK9

The license is the 'GNU General Public License v2.0 or later',
not 'and':

  This program is free software; you can redistribute it and/ori
  modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 2 of
  the License, or (at your option) any later version.

Fix the license comment.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/arm/bcm2835_peripherals.h | 3 ++-
 include/hw/arm/bcm2836.h             | 3 ++-
 include/hw/char/bcm2835_aux.h        | 3 ++-
 include/hw/display/bcm2835_fb.h      | 3 ++-
 include/hw/dma/bcm2835_dma.h         | 4 +++-
 include/hw/intc/bcm2835_ic.h         | 4 +++-
 include/hw/intc/bcm2836_control.h    | 3 ++-
 include/hw/misc/bcm2835_mbox.h       | 4 +++-
 include/hw/misc/bcm2835_mbox_defs.h  | 4 +++-
 include/hw/misc/bcm2835_property.h   | 4 +++-
 hw/arm/bcm2835_peripherals.c         | 3 ++-
 hw/arm/bcm2836.c                     | 3 ++-
 hw/arm/raspi.c                       | 3 ++-
 hw/display/bcm2835_fb.c              | 1 -
 hw/dma/bcm2835_dma.c                 | 4 +++-
 hw/intc/bcm2835_ic.c                 | 4 ++--
 hw/intc/bcm2836_control.c            | 4 +++-
 hw/misc/bcm2835_mbox.c               | 4 +++-
 hw/misc/bcm2835_property.c           | 4 +++-
 19 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_=
peripherals.h
index 7859281e11..2e8655a7c2 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -5,7 +5,8 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_PERIPHERALS_H
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 92a6544816..024af8aae4 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -5,7 +5,8 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2836_H
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/char/bcm2835_aux.h
index cdbf7e3e37..934acf9c81 100644
--- a/include/hw/char/bcm2835_aux.h
+++ b/include/hw/char/bcm2835_aux.h
@@ -2,7 +2,8 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_AUX_H
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_f=
b.h
index 228988ba05..2246be74d8 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -5,7 +5,8 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_FB_H
diff --git a/include/hw/dma/bcm2835_dma.h b/include/hw/dma/bcm2835_dma.h
index 91ed8d05d1..a6747842b7 100644
--- a/include/hw/dma/bcm2835_dma.h
+++ b/include/hw/dma/bcm2835_dma.h
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_DMA_H
diff --git a/include/hw/intc/bcm2835_ic.h b/include/hw/intc/bcm2835_ic.h
index fb75fa0064..392ded1cb3 100644
--- a/include/hw/intc/bcm2835_ic.h
+++ b/include/hw/intc/bcm2835_ic.h
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_IC_H
diff --git a/include/hw/intc/bcm2836_control.h b/include/hw/intc/bcm2836_co=
ntrol.h
index de061b8929..2c22405686 100644
--- a/include/hw/intc/bcm2836_control.h
+++ b/include/hw/intc/bcm2836_control.h
@@ -8,7 +8,8 @@
  * ARM Local Timer IRQ Copyright (c) 2019. Zolt=C3=A1n Baldaszti
  * Added basic IRQ_TIMER interrupt support
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2836_CONTROL_H
diff --git a/include/hw/misc/bcm2835_mbox.h b/include/hw/misc/bcm2835_mbox.=
h
index 7e8f3ce86d..57f95cc35e 100644
--- a/include/hw/misc/bcm2835_mbox.h
+++ b/include/hw/misc/bcm2835_mbox.h
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_MBOX_H
diff --git a/include/hw/misc/bcm2835_mbox_defs.h b/include/hw/misc/bcm2835_=
mbox_defs.h
index a18e520b22..9670bf33a0 100644
--- a/include/hw/misc/bcm2835_mbox_defs.h
+++ b/include/hw/misc/bcm2835_mbox_defs.h
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_MBOX_DEFS_H
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_p=
roperty.h
index 11be0dbeac..b321f22499 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #ifndef BCM2835_PROPERTY_H
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 17207ae07e..edcaa4916d 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -5,7 +5,8 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 38e2941bab..43022b83f5 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -5,7 +5,8 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index acd2bb794d..fe3b9bc78b 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -8,7 +8,8 @@
  * Raspberry Pi 3 emulation Copyright (c) 2018 Zolt=C3=A1n Baldaszti
  * Upstream code cleanup (c) 2018 Pekka Enberg
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index d6bf3374a6..c6263808a2 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -1,7 +1,6 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
  * Refactoring for Pi2 Copyright (c) 2015, Microsoft. Written by Andrew Ba=
umann.
- * This code is licensed under the GNU GPLv2 and later.
  *
  * Heavily based on milkymist-vgafb.c, copyright terms below:
  *  QEMU model of the Milkymist VGA framebuffer.
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index ccff5ed55b..4cd9dab745 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
index 05bd28e4f9..53ab8f5881 100644
--- a/hw/intc/bcm2835_ic.c
+++ b/hw/intc/bcm2835_ic.c
@@ -1,7 +1,6 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
  * Refactoring for Pi2 Copyright (c) 2015, Microsoft. Written by Andrew Ba=
umann.
- * This code is licensed under the GNU GPLv2 and later.
  * Heavily based on pl190.c, copyright terms below:
  *
  * Arm PrimeCell PL190 Vector Interrupt Controller
@@ -9,7 +8,8 @@
  * Copyright (c) 2006 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licensed under the GPL.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index 61f884ff9e..53dba0080c 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -4,7 +4,6 @@
  * Written by Andrew Baumann
  *
  * Based on bcm2835_ic.c (Raspberry Pi emulation) (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
  *
  * At present, only implements interrupt routing, and mailboxes (i.e.,
  * not PMU interrupt, or AXI counters).
@@ -13,6 +12,9 @@
  *
  * Ref:
  * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/=
QA7_rev3.4.pdf
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
index 77d2d80706..2afa06a746 100644
--- a/hw/misc/bcm2835_mbox.c
+++ b/hw/misc/bcm2835_mbox.c
@@ -1,11 +1,13 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
  *
  * This file models the system mailboxes, which are used for
  * communication with low-bandwidth GPU peripherals. Refs:
  *   https://github.com/raspberrypi/firmware/wiki/Mailboxes
  *   https://github.com/raspberrypi/firmware/wiki/Accessing-mailboxes
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index df91280dfc..3e228ca0ae 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -1,6 +1,8 @@
 /*
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
- * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
  */
=20
 #include "qemu/osdep.h"
--=20
2.21.1

