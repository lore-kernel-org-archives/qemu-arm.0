Received: by 10.25.208.211 with SMTP id h202csp705057lfg;
        Tue, 15 Mar 2016 09:57:13 -0700 (PDT)
X-Received: by 10.140.145.151 with SMTP id 145mr41627389qhr.95.1458061033141;
        Tue, 15 Mar 2016 09:57:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c52si27252066qgc.5.2016.03.15.09.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 09:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afsHQ-0004z8-OK
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 12:57:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1afsHL-0004rH-9e
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 12:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1afsHK-00020Q-J2
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 12:57:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1afsHK-0001yh-CF; Tue, 15 Mar 2016 12:57:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1afsH4-0000MB-IZ; Tue, 15 Mar 2016 16:56:50 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 15 Mar 2016 16:56:49 +0000
Message-Id: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: hitmoon <zxq_yx_007@163.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, patches@linaro.org
Subject: [Qemu-arm] [PATCH] sd: Fix "info qtree" on boards with SD cards
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
X-TUID: c4xpvCwfAtZo

The SD card object is not a SysBusDevice, so don't create it with
qdev_create() if we're not assigning it to a specific bus; use
object_new() instead.

This was causing 'info qtree' to segfault on boards with SD cards,
because qdev_create(NULL, TYPE_FOO) puts the created object on the
system bus, and then we may try to run functions like sysbus_dev_print()
on it, which fail when casting the object to SysBusDevice.

(This is the same mistake that we made with the NAND device
and fixed in commit 6749695eaaf346c1.)

Reported-by: hitmoon <zxq_yx_007@163.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I assume that using qdev_create() for non-SysBus devices is
OK if we are passing in a specific bus pointer, because we do
this already for various things including PCI devices. The
various "properly QOMified" uses of TYPE_SD_CARD do that; only
this sd_init() function for the legacy uses doesn't.
---
 hw/sd/sd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 00c320d..1568057 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -563,17 +563,19 @@ static const VMStateDescription sd_vmstate = {
 /* Legacy initialization function for use by non-qdevified callers */
 SDState *sd_init(BlockBackend *blk, bool is_spi)
 {
+    Object *obj;
     DeviceState *dev;
     Error *err = NULL;
 
-    dev = qdev_create(NULL, TYPE_SD_CARD);
+    obj = object_new(TYPE_SD_CARD);
+    dev = DEVICE(obj);
     qdev_prop_set_drive(dev, "drive", blk, &err);
     if (err) {
         error_report("sd_init failed: %s", error_get_pretty(err));
         return NULL;
     }
     qdev_prop_set_bit(dev, "spi", is_spi);
-    object_property_set_bool(OBJECT(dev), true, "realized", &err);
+    object_property_set_bool(obj, true, "realized", &err);
     if (err) {
         error_report("sd_init failed: %s", error_get_pretty(err));
         return NULL;
-- 
1.9.1

