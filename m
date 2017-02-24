Received: by 10.25.0.147 with SMTP id 141csp766917lfa;
        Fri, 24 Feb 2017 08:42:25 -0800 (PST)
X-Received: by 10.237.33.67 with SMTP id 61mr3504038qtc.37.1487954545205;
        Fri, 24 Feb 2017 08:42:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v34si5986772qtv.218.2017.02.24.08.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 08:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:38424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chIwo-0004lD-EN
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 11:42:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chIux-0003OA-QE
	for qemu-devel@nongnu.org; Fri, 24 Feb 2017 11:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chIuw-0001CK-Mq
	for qemu-devel@nongnu.org; Fri, 24 Feb 2017 11:40:27 -0500
Received: from bee.antfield.fr ([188.165.75.195]:53530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1chIut-0001AP-WF; Fri, 24 Feb 2017 11:40:24 -0500
From: Clement Deschamps <clement.deschamps@antfield.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487954422; bh=tb157WVU0QAJ6b7YN1lvjS5m5CpCvxeLmj7cgDk2yVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=anvkM6WLh+0deJQeBsqy+6mr0UEQOuIk1Hc2O6SaTui8cFKbh43zPxf5H4QCZQT0D
	tmj/s+aM4pAhctZ1CitqZlH0byJU/31h+Z5yeO8H3WdZSC1qoP8odp+cdHfY6nSbx8
	5t8NPpk68vweAT8+QdBUG+Uarg117fbnI524qBo8=
To: qemu-devel@nongnu.org
Date: Fri, 24 Feb 2017 17:40:19 +0100
Message-Id: <20170224164021.9066-3-clement.deschamps@antfield.fr>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170224164021.9066-1-clement.deschamps@antfield.fr>
References: <20170224164021.9066-1-clement.deschamps@antfield.fr>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: [Qemu-devel] [PATCH v3 2/4] hw/sd: add card-reparenting function
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	andrew.baumann@microsoft.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G8StqeLRldib

Provide a new function sdbus_reparent_card() in sd core for reparenting
a card from a SDBus to another one.

This function is required by the raspi platform, where the two SD
controllers can be dynamically switched.

Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
---
 hw/sd/core.c       | 30 ++++++++++++++++++++++++++++++
 include/hw/sd/sd.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/hw/sd/core.c b/hw/sd/core.c
index 14c2bdf27b..a8f24f505f 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -131,6 +131,36 @@ void sdbus_set_readonly(SDBus *sdbus, bool readonly)
     }
 }
 
+void sdbus_reparent_card(SDBus *from, SDBus *to)
+{
+    BusChild *kid = QTAILQ_FIRST(&from->qbus.children);
+    SDState *card;
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
+    if (!kid) {
+        return;
+    }
+
+    card = SD_CARD(kid->child);
+    sc = SD_CARD_GET_CLASS(card);
+    readonly = sc->get_readonly(card);
+
+    sdbus_set_inserted(from, false);
+    object_unparent(OBJECT(kid));
+    qdev_set_parent_bus(DEVICE(card), &to->qbus);
+    sdbus_set_inserted(to, true);
+    sdbus_set_readonly(to, readonly);
+}
+
 static const TypeInfo sd_bus_info = {
     .name = TYPE_SD_BUS,
     .parent = TYPE_BUS,
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 79909b2478..54eaf9b554 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -140,6 +140,7 @@ uint8_t sdbus_read_data(SDBus *sd);
 bool sdbus_data_ready(SDBus *sd);
 bool sdbus_get_inserted(SDBus *sd);
 bool sdbus_get_readonly(SDBus *sd);
+void sdbus_reparent_card(SDBus *from, SDBus *to);
 
 /* Functions to be used by SD devices to report back to qdevified controllers */
 void sdbus_set_inserted(SDBus *sd, bool inserted);
-- 
2.11.1

