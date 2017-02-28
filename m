Received: by 10.25.0.147 with SMTP id 141csp1440323lfa;
        Tue, 28 Feb 2017 07:21:44 -0800 (PST)
X-Received: by 10.55.143.3 with SMTP id r3mr3218890qkd.152.1488295304492;
        Tue, 28 Feb 2017 07:21:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w51si1699585qta.3.2017.02.28.07.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 07:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cijav-0007na-Lj
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 10:21:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cijJz-0000o2-Hb
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cijJv-0001NI-MW
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:04:11 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cijJv-0001HT-G8; Tue, 28 Feb 2017 10:04:07 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cijBJ-0003IO-Ib; Tue, 28 Feb 2017 14:55:13 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Feb 2017 14:55:09 +0000
Message-Id: <1488293711-14195-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
References: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/4] hw/sd: add card-reparenting function
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiINHy+Oa3JN

From: Clement Deschamps <clement.deschamps@antfield.fr>

Provide a new function sdbus_reparent_card() in sd core for reparenting
a card from a SDBus to another one.

This function is required by the raspi platform, where the two SD
controllers can be dynamically switched.

Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
Message-id: 20170224164021.9066-3-clement.deschamps@antfield.fr
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: added a doc comment to the header file; changed to
 use new behaviour of qdev_set_parent_bus()]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sd/sd.h | 11 +++++++++++
 hw/sd/core.c       | 27 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 79909b2..96caefe 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -140,6 +140,17 @@ uint8_t sdbus_read_data(SDBus *sd);
 bool sdbus_data_ready(SDBus *sd);
 bool sdbus_get_inserted(SDBus *sd);
 bool sdbus_get_readonly(SDBus *sd);
+/**
+ * sdbus_reparent_card: Reparent an SD card from one controller to another
+ * @from: controller bus to remove card from
+ * @to: controller bus to move card to
+ *
+ * Reparent an SD card, effectively unplugging it from one controller
+ * and inserting it into another. This is useful for SoCs like the
+ * bcm2835 which have two SD controllers and connect a single SD card
+ * to them, selected by the guest reprogramming GPIO line routing.
+ */
+void sdbus_reparent_card(SDBus *from, SDBus *to);
 
 /* Functions to be used by SD devices to report back to qdevified controllers */
 void sdbus_set_inserted(SDBus *sd, bool inserted);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 14c2bdf..295dc44 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -131,6 +131,33 @@ void sdbus_set_readonly(SDBus *sdbus, bool readonly)
     }
 }
 
+void sdbus_reparent_card(SDBus *from, SDBus *to)
+{
+    SDState *card = get_card(from);
+    SDCardClass *sc;
+    bool readonly;
+
+    /* We directly reparent the card object rather than implementing this
+     * as a hotpluggable connection because we don't want to expose SD cards
+     * to users as being hotpluggable, and we can get away with it in this
+     * limited use case. This could perhaps be implemented more cleanly in
+     * future by adding support to the hotplug infrastructure for "device
+     * can be hotplugged only via code, not by user".
+     */
+
+    if (!card) {
+        return;
+    }
+
+    sc = SD_CARD_GET_CLASS(card);
+    readonly = sc->get_readonly(card);
+
+    sdbus_set_inserted(from, false);
+    qdev_set_parent_bus(DEVICE(card), &to->qbus);
+    sdbus_set_inserted(to, true);
+    sdbus_set_readonly(to, readonly);
+}
+
 static const TypeInfo sd_bus_info = {
     .name = TYPE_SD_BUS,
     .parent = TYPE_BUS,
-- 
2.7.4

