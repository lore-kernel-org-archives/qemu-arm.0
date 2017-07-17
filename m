Received: by 10.25.44.15 with SMTP id s15csp4050865lfs;
        Sun, 16 Jul 2017 19:41:42 -0700 (PDT)
X-Received: by 10.55.148.70 with SMTP id w67mr23514546qkd.160.1500259302160;
        Sun, 16 Jul 2017 19:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259302; cv=none;
        d=google.com; s=arc-20160816;
        b=u2A/qzBb0J57Vgv7e63ms3Js1TVYrIlJMEnUmLoyUG69y8p0eMuZi8r3BzQTdK1VWh
         wDrySUCUPZa7jSaGaDom4+/EO9QDn3UYA4mg+xOdbC/ZxU+wicRiMzamZdi1llmSU3Hl
         zhEAq9gf/eDEzvximgrZe1cstPC0rWyWNmS1x0ZuoUBoxRfhg3CT/qrj1lGqIfxV84Rx
         RHv2hjziqTgAzhStywE99kc1aIreMNmsgtXkVM1qgvsxCKBPALtwhlMVZNmorSVBPuJA
         WGfdXkXNxzoGNkkvlr6DrL8FKBKtguyFHFFe29TWz3a4bnRwJ/M/+FIm24w1LhiR4Q9e
         21qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=DH4ljaKUH9ofdTh3d8ueQZxEsYwOHmnFD0KGNlO9lLM=;
        b=ORDQyxPidZ9QgqwTm7rhK+MDmMEfWxNMQH2t4rXp3mUzUQmA8zTachzf8FKLbffOui
         jxHGjjmNO2hs1peFoEHVRLrHsNeVZRghGAvnNZzma9CABDSSQYQzh3N30D6i2W1M5eRY
         CCIb3kvgO4dV/a9W3HrnqPOiaECZXzVvglv8M91yal5yUH0/DCKbFkhyugdMMU5dV4ff
         iRg19gRjEm+jWVumT3c65dNw/jPHbEQHryBFObmRouc6yiW5Jt2/Cb1CUOugNxQQXwyp
         Q7zZC6mprt0ws1OnslHgp12asoR2Si/SkXLFCJZfqOnDrfFbH9IN9IsxdxxGapPVHkNN
         C1xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i32si2973319qta.276.2017.07.16.19.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWvyd-0002lP-7g
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:41:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvk-0000Wm-FG
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvj-0001YM-LR
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvvj-0001Y3-G1; Sun, 16 Jul 2017 22:38:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68B912F86C2;
	Mon, 17 Jul 2017 02:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 68B912F86C2
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 68B912F86C2
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE22600C8;
	Mon, 17 Jul 2017 02:38:36 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:23 +0800
Message-Id: <20170717023824.18796-6-famz@redhat.com>
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
References: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 17 Jul 2017 02:38:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 5/6] xilinx_axienet: Convert to
 DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M/3S4pUWS8mf

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/net/xilinx_axienet.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 5ffa739..d4c2c89 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -989,18 +989,6 @@ static void xilinx_enet_init(Object *obj)
     XilinxAXIEnet *s = XILINX_AXI_ENET(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLAVE,
-                             (Object **) &s->tx_data_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-    object_property_add_link(obj, "axistream-control-connected",
-                             TYPE_STREAM_SLAVE,
-                             (Object **) &s->tx_control_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-
     object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
                       TYPE_XILINX_AXI_ENET_DATA_STREAM);
     object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
@@ -1021,6 +1009,10 @@ static Property xilinx_enet_properties[] = {
     DEFINE_PROP_UINT32("rxmem", XilinxAXIEnet, c_rxmem, 0x1000),
     DEFINE_PROP_UINT32("txmem", XilinxAXIEnet, c_txmem, 0x1000),
     DEFINE_NIC_PROPERTIES(XilinxAXIEnet, conf),
+    DEFINE_PROP_LINK("axistream-connected", XilinxAXIEnet,
+                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+    DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIEnet,
+                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.9.4

