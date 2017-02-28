Received: by 10.25.0.147 with SMTP id 141csp1433890lfa;
        Tue, 28 Feb 2017 07:07:52 -0800 (PST)
X-Received: by 10.31.107.212 with SMTP id k81mr1003889vki.116.1488294471983;
        Tue, 28 Feb 2017 07:07:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n191si729210vkf.162.2017.02.28.07.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 07:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cijNV-0003ZD-Bq
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 10:07:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cijBP-0001VE-5I
	for qemu-devel@nongnu.org; Tue, 28 Feb 2017 09:55:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cijBO-0005dY-7x
	for qemu-devel@nongnu.org; Tue, 28 Feb 2017 09:55:19 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48690)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cijBM-0005cl-1K; Tue, 28 Feb 2017 09:55:16 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cijBI-0003ID-U9; Tue, 28 Feb 2017 14:55:12 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Feb 2017 14:55:08 +0000
Message-Id: <1488293711-14195-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
References: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 1/4] qdev: Have qdev_set_parent_bus() handle
 devices already on a bus
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +nq327eQRlkN

Instead of qdev_set_parent_bus() silently doing the wrong
thing if it's handed a device that's already on a bus,
have it remove the device from the old bus and add it to
the new one. This is useful for the raspi2 sdcard.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/qdev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 06ba02e..923e626 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -102,9 +102,23 @@ static void bus_add_child(BusState *bus, DeviceState *child)
 
 void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
 {
+    bool replugging = dev->parent_bus != NULL;
+
+    if (replugging) {
+        /* Keep a reference to the device while it's not plugged into
+         * any bus, to avoid it potentially evaporating when it is
+         * dereffed in bus_remove_child().
+         */
+        object_ref(OBJECT(dev));
+        bus_remove_child(dev->parent_bus, dev);
+        object_unref(OBJECT(dev->parent_bus));
+    }
     dev->parent_bus = bus;
     object_ref(OBJECT(bus));
     bus_add_child(bus, dev);
+    if (replugging) {
+        object_unref(OBJECT(dev));
+    }
 }
 
 /* Create a new device.  This only initializes the device state
-- 
2.7.4

