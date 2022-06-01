Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4483189lfh;
        Wed, 1 Jun 2022 14:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd4cvbScAUijN2Divbq9PgyeqZ0MathPnswGTg7MjMYsCd4EE8rmlCywXx9rSZbvXdJc3J
X-Received: by 2002:a05:6214:20ef:b0:462:5fb6:40ed with SMTP id 15-20020a05621420ef00b004625fb640edmr1237044qvk.73.1654118278339;
        Wed, 01 Jun 2022 14:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654118278; cv=none;
        d=google.com; s=arc-20160816;
        b=srBTqhuf2Z8sU6V31z56IHQixX+Oa3Rv7iY5XVnf13TuAqpRBi3KiLL23UnwgWg9q7
         KA7QP3dpUaZeT/MDY0P6Wqep//L6YE9en6ky1iQzip3TH3+g3Fu6ssSxEKzqdHyrsGub
         2O0buIzgnFxz2vw7/x/43+JnKl5hV+VF9jFIoIRlFVedizKU2Wq7Qbm/IItJN+uKP0vO
         NfIdm1rEjtXp6ofUr1niwJbJI6TX/xe94luNtoElaDEKlo/V9256IHQtvtxf141SrSGK
         8UZ8vONUAky8lC45/NGeAqkz6rx9wQYy8G/PeiTTDHs2avUjLsw2yN/DWsUiEZqmxxQX
         0G5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=mIqQ0jry0D/OdMJRidlYzDVlJUQoLVmgcKEbrCvUUxE=;
        b=lI8K3NK6EejKIFVjLVkOBv40bkLNvlpgI45zUBrjZNpDyNvjSR77XehNzST7GtfIRl
         Bq5GKtGA6UddBqih3ku3hC7aypvuY58OSOdl5p2Qg5rEwIZHwjnzAj6qcTNbmb0PlvEn
         HEKAyz1uqMASj0hdclDx5N9Zdm5cRD21oRlvr7fhadMMRW9tZVlTXSXiYOylBBcj27yw
         Rva87mcwPGQNS3z515SAZQwOr0lCDBSge/LxEErWGjnd77KBxl4aoJJQRDxgmx2YOcof
         U/poyb9LtmntSTn7LmRv0x/EvbI5A2Uuvts/M578YEWtpSlHbBxUTMSz3RJAhPCVEn5z
         JKGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=nDHsQGeQ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="Pu1uax/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf12-20020a056214250c00b004661abc8a16si1135118qvb.97.2022.06.01.14.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 14:17:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=nDHsQGeQ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="Pu1uax/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwVj3-0008AM-Eu
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 17:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa9-0000oS-Kd; Wed, 01 Jun 2022 17:08:45 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa8-00022j-1Y; Wed, 01 Jun 2022 17:08:45 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 547975C01AC;
 Wed,  1 Jun 2022 17:08:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 01 Jun 2022 17:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654117723; x=
 1654204123; bh=mIqQ0jry0D/OdMJRidlYzDVlJUQoLVmgcKEbrCvUUxE=; b=n
 DHsQGeQ2QcDjXI75gw/0gLL4NuASTP5h/ZEG7hX9Nu4urlmlD9+IS/lSCWr0XVjY
 BHwZD0+z4kUvyjEYJGpYo1ohG915Xak4cc/peEfo6hweZP4cITlVYyO36gOcmjwZ
 JBezPiBuyNi5VnIlZmXSQZ2swHXcSDdo99EFNPnYyvMn9gkDK3VUQPgXNA/l81uo
 9wHwwz9QfZC/RtRUsZBip00JLyOvlPCCPeX9PhYx3nuCcOjxfQwOv1OVEG0DbJKx
 sTno8x2Z5GpXtIO1A+lzhnfeT+u02apskkPyM1/QxaDUqp7C528PHbIylRpoO6d7
 UIYh6k+t0jvTjT2qDKC0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654117723; x=1654204123; bh=mIqQ0jry0D/Od
 MJRidlYzDVlJUQoLVmgcKEbrCvUUxE=; b=Pu1uax/6VSJyLqQBc5FNfnrB7Cu21
 I9AVhI17i2Xv64S+DSke7IqWb302ebl/4o4Cjz2JL3Fl80qtVwwvFFwDAAcAMXNT
 IOtGOl7GmtfYQwh6yTeuEDjlN+lAFmvtvFbhIMaqwE3kIWtMuAnPzK4Fmqx1bkS+
 D7QVPdCp2VM+2I3IYABt7hMmFntfWtsG+H1i3k1W0qQ815vtf8vnoge8JnJjK7uj
 mxEDLA3ZQ72n6au3HPj8+3w2CSLTGiMgNkkkX1913OZkgWg5L4EV3aBV9WyFXzBt
 CVf+AKLaHkcz0LGTGyKwV8hmnCGQbBPMjCTgzObU2kOqkoDtXbTAr3wVg==
X-ME-Sender: <xms:W9WXYv44arpYlnNgp73xG4J7AIepAnZpXnCl7eIDrb9UPoyVG02Z0g>
 <xme:W9WXYk6UjOTjhEfMrBDGOBqANM50z4-vNZAYud69HvDDvrdWzvGHEXCkXdMglcd-T
 FGRjxv2G8AafwgYSF0>
X-ME-Received: <xmr:W9WXYmeRYfCtmwm0d41YGdbWc-16DOiCmo589eUl5ko_TlrRYd0Vd4K49CZrZsnx3zq7hGfUpur-E9UpqPZh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:W9WXYgLfBKR5Dqo2DtEOKMkbbRF8iTCovFdPyB8Cs-9hcXvHLDrPhQ>
 <xmx:W9WXYjKEisQiUgWBjHQnNjavyMOgRq8iKBxsdikIbUmv9TGD-52IGg>
 <xmx:W9WXYpzRvdy-Ldoy70D9K1ytAVFEhgdhb7jdYCAsNR4xBsTvmZnFMg>
 <xmx:W9WXYlyDG0G08VSZBmnzT9PcUx2uNz0-rCXcIVFcocXlwPqNKrfQOg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [RFC PATCH v2 3/6] hw/i2c: support multiple masters
Date: Wed,  1 Jun 2022 23:08:28 +0200
Message-Id: <20220601210831.67259-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601210831.67259-1-its@irrelevant.dk>
References: <20220601210831.67259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KXGovbRlBeBg

From: Klaus Jensen <k.jensen@samsung.com>

Allow slaves to master the bus by registering a bottom halve. If the bus
is busy, the bottom halve is queued up. When a slave has succesfully
mastered the bus, the bottom halve is scheduled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/i2c.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d0cb2d32fa44..145dce60782a 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -13,6 +13,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
 
 #define I2C_BROADCAST 0x00
@@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
 
     bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
+    QSIMPLEQ_INIT(&bus->pending_masters);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
     return bus;
 }
@@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
 /* Return nonzero if bus is busy.  */
 int i2c_bus_busy(I2CBus *bus)
 {
-    return !QLIST_EMPTY(&bus->current_devs);
+    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
 }
 
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
@@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
                                                : I2C_START_SEND);
 }
 
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
+{
+    if (i2c_bus_busy(bus)) {
+        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
+        node->bh = bh;
+
+        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+
+        return;
+    }
+
+    bus->bh = bh;
+    qemu_bh_schedule(bus->bh);
+}
+
+void i2c_bus_release(I2CBus *bus)
+{
+    bus->bh = NULL;
+}
+
 int i2c_start_recv(I2CBus *bus, uint8_t address)
 {
     return i2c_do_start_transfer(bus, address, I2C_START_RECV);
@@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast = false;
+
+    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
+        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
+        bus->bh = node->bh;
+
+        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+        g_free(node);
+
+        qemu_bh_schedule(bus->bh);
+    }
 }
 
 int i2c_send(I2CBus *bus, uint8_t data)
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 5ca3b708c0be..be8bb8b78a60 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -69,13 +69,25 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
 
+typedef struct I2CPendingMaster I2CPendingMaster;
+
+struct I2CPendingMaster {
+    QEMUBH *bh;
+    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
+};
+
 typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMasters;
 
 struct I2CBus {
     BusState qbus;
     I2CNodeList current_devs;
+    I2CPendingMasters pending_masters;
     uint8_t saved_address;
     bool broadcast;
+
+    /* Set from slave currently mastering the bus. */
+    QEMUBH *bh;
 };
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
@@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
 
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
+void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
-- 
2.36.1

