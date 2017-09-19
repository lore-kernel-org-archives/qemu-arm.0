Received: by 10.223.172.38 with SMTP id v35csp4944513wrc;
        Tue, 19 Sep 2017 06:33:53 -0700 (PDT)
X-Received: by 10.200.56.252 with SMTP id g57mr1938436qtc.322.1505828033764;
        Tue, 19 Sep 2017 06:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505828033; cv=none;
        d=google.com; s=arc-20160816;
        b=pTm3VUl/j2fu+edsDP3VNqlP5KTuV0N2AgOPTkcosQCOhTnlyU+KC/986yzGMMRKwv
         w/AP5tTADXtZevfdyDOdjJbmIIQOIq5QE6LR7MHbbbBwvnMJ/GV1S5359s0KIPTcUtAE
         NAyuWHM3jruVwcjlbqwAbytfvmaR/crB/gEoELq68ir8kIbwOxgWrdnbxTzNhM2svdTt
         FVogZkCCzqn5NIWXpbiC+kYnoeH1Nxzb17tQ7a99EWC3ruHRBDiZHrp2nN0JejoBa5Kc
         CiPtPrP4fDAPst7bvcerXL0RxnIFKO8yC59Cw1BE4KoF+ErSvyqcXoSALjJ0b3Qb8Rb+
         4tHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=o/f4HyXUDNxsrxMwn/7PbqNsdb0q3V/n3FdaipX2p2U=;
        b=uQfcsv/4rHPbRt2hLDHhe5eBMD2Zff82jfvxdojx9i/XUZRYYX0CjRzQdZfBofWDX+
         SdP5MVuq7/h8vxG+1nECLeRMwmZXyPj1uvlx7P7awr6igLF471kgnCIWpvgS8nsf2ESs
         gGhztfzW8wt9Mk1pBNmZ0XbBhQV1N6eouvdNntIlWqsauswmNcHkGFLgfwFlgC5evlzX
         M6an5FnB6Em+fN3gL5Qh5M7U9iEJdDtL2h/+eJO61ZG1XFW/Rf03TRpRWczn6L7Bf5fs
         a9H4CbU8vjbjHGeyQRAsrqTVOUtmg6qY07x5lRKm4eA/akxin6e8I+PR0CL9liS+VTON
         B8Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EVoOaYOT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si8990464qkd.430.2017.09.19.06.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 06:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EVoOaYOT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duIet-0006X1-B1
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 09:33:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHzL-0004gc-LH
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 08:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHzH-0003XD-6D
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 08:50:55 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHzG-0003WL-OH; Tue, 19 Sep 2017 08:50:51 -0400
Received: by mail-qt0-x243.google.com with SMTP id l25so2248294qtf.2;
	Tue, 19 Sep 2017 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o/f4HyXUDNxsrxMwn/7PbqNsdb0q3V/n3FdaipX2p2U=;
	b=EVoOaYOTL/Sm6BOUpKiuU6nW939WvlOzAreJQm29hvKh1cANsZocuoFGsc6LCp/l/w
	lYslRIrhv8kO94I0vPKrniBG+3vqqgx8Oj5BvY/TMTdIgylSb5oKOxViCXQ7DMzH3HaT
	kSbwXTsIbCvcI++i13gFWerz0FJcYHMSpOqe5T7/qBOvHJqEnoJdwbvCSOawU3wvyMaT
	up1oNaGkNa2IZTY9ubhkfbsZ00Vp8cIQCavU7zniI4G+/glwmjb69PWxUnZZ4ldl7eTb
	WZbds3XNE21m/Rk3hlSDKaPb33pGeJ7beOWkavByvuqqAdE/1t9ey4AmAn8cGmO0ELR1
	CdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=o/f4HyXUDNxsrxMwn/7PbqNsdb0q3V/n3FdaipX2p2U=;
	b=Zk49Da6bHyucFlVfsD201fqwAT8pRLis/Pk8ISsoPvqcnBmDozREe/I3l2pGHweD5k
	lLNT5l0PBxuQm0asMvxqE6l4jK1WKD8oAa8W950ZOnlTaJib5vpoLMgW6dD4HUtbTx4d
	y5tkRFMLN5Fhr2utViQWp4gn5J2SfvErqfXyrg8FWVw0T/Np08TJ/xZdQLOBks41Yvj3
	RpRMt2tUS9Dqni2AnNre0ccjsFSj66kefrQuK9y5SFq/rf97gyvOVsFSuAaE3r9Mqy7J
	1+Ej8yovVGVn2BeRfjZHQmSNaczNyOUNHJdmd4GpHSPvPtbgOcOflZm+nvN4LIpcXw/R
	oUgw==
X-Gm-Message-State: AHPjjUjADK+n/2TuSW+3i4wIDlC3TD1UJBLmQxZUcKgimoVrbyQ2g+fp
	R+xfDVBTMXuPfPvlZoUXBH0=
X-Google-Smtp-Source: AOwi7QAPAF/qzjA3siv1u1CSR8KD8Tcplc43PCyHNWaTrT/QkmBm+Fnj5WUa2wEGuDiIVRjxEZ0fIg==
X-Received: by 10.200.50.125 with SMTP id y58mr1688115qta.266.1505825450063;
	Tue, 19 Sep 2017 05:50:50 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	a132sm6650591qkb.28.2017.09.19.05.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 05:50:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Tue, 19 Sep 2017 09:50:41 -0300
Message-Id: <20170919125041.2153-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH] hw/input/lm832x: move LM8323 declarations to
 input/keypad.h
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kDv1PG5WK+qZ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: 20170919123053.32675-1-f4bug@amsat.org

$ ./scripts/get_maintainer.pl -f hw/input/lm832x.c
get_maintainer.pl: No maintainers found, printing recent contributors.

 include/hw/i2c/i2c.h      |  3 ---
 include/hw/input/keypad.h | 23 +++++++++++++++++++++++
 hw/arm/nseries.c          |  3 ++-
 hw/input/lm832x.c         |  3 +--
 4 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/input/keypad.h

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 24e95d0155..8fdf3e47d6 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -70,9 +70,6 @@ int i2c_recv(I2CBus *bus);
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
 
-/* lm832x.c */
-void lm832x_key_event(DeviceState *dev, int key, int state);
-
 extern const VMStateDescription vmstate_i2c_slave;
 
 #define VMSTATE_I2C_SLAVE(_field, _state) {                          \
diff --git a/include/hw/input/keypad.h b/include/hw/input/keypad.h
new file mode 100644
index 0000000000..efacef6458
--- /dev/null
+++ b/include/hw/input/keypad.h
@@ -0,0 +1,23 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_KEYPAD_H
+#define HW_KEYPAD_H
+
+#include "hw/hw.h"
+
+#define TYPE_LM8323 "lm8323"
+
+void lm832x_key_event(DeviceState *dev, int key, int state);
+
+#endif
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index a32ac82702..594b7e878c 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -30,6 +30,7 @@
 #include "ui/console.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
+#include "hw/input/keypad.h"
 #include "hw/devices.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
@@ -412,7 +413,7 @@ static void n810_kbd_setup(struct n800_s *s)
     /* Attach the LM8322 keyboard to the I2C bus,
      * should happen in n8x0_i2c_setup and s->kbd be initialised here.  */
     s->kbd = i2c_create_slave(omap_i2c_bus(s->mpu->i2c[0]),
-                           "lm8323", N810_LM8323_ADDR);
+                              TYPE_LM8323, N810_LM8323_ADDR);
     qdev_connect_gpio_out(s->kbd, 0, kbd_irq);
 }
 
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index 2340523da0..868ddfe5ea 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -19,12 +19,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/i2c/i2c.h"
+#include "hw/input/keypad.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
 
-#define TYPE_LM8323 "lm8323"
 #define LM8323(obj) OBJECT_CHECK(LM823KbdState, (obj), TYPE_LM8323)
 
 typedef struct {
-- 
2.14.1

