Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9BCCD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 05:52:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWSsF-0002Pa-Na; Mon, 08 Jun 2026 01:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wWSrh-0001mn-Ll
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 01:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wWSrf-0000gi-1M
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 01:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780897774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW0f8311kd5c+oUI1hixT0UXSpuywxH8OcV1GYZi3tg=;
 b=bCEUeJqgPfPvOwmFLaorHOQ1BdB6A+/Hc3A9wV1iDHElsyE2M2MeKcuWqhCNgwNr4bKqHr
 Wz4D/NTBQ6jErjDps6qmDpO/OO5WKfOsZ8vHBTj2Smvt6ifMx2A7rqeNoetjW2uK15Ggw2
 rFNQryJUhglMEUAZ8pt2FkZetv+da8c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-ubl9iv50NSCFy7Yh8Ms78Q-1; Mon,
 08 Jun 2026 01:49:21 -0400
X-MC-Unique: ubl9iv50NSCFy7Yh8Ms78Q-1
X-Mimecast-MFC-AGG-ID: ubl9iv50NSCFy7Yh8Ms78Q_1780897753
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EC8BB1956094; Mon,  8 Jun 2026 05:49:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.33])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7972727A; Mon,  8 Jun 2026 05:49:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 21/37] hw/pci-host/aspeed_pcie: Convert to DEFINE_TYPES() with
 inlined TypeInfo
Date: Mon,  8 Jun 2026 07:48:10 +0200
Message-ID: <20260608054826.346488-22-clg@redhat.com>
In-Reply-To: <20260608054826.346488-1-clg@redhat.com>
References: <20260608054826.346488-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: ducoNHuJEOTNqLd7hn3vzRrIjugDZHb3PJqI2x3t4GM_1780897753
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jamin Lin <jamin_lin@aspeedtech.com>

Replace the legacy type_register_static()/type_init() registration
pattern with the modern DEFINE_TYPES() macro.

Inline 6 standalone TypeInfo variables (aspeed_pcie_phy_info, aspeed_2700_pcie_phy_info
aspeed_pcie_root_port_info, aspeed_pcie_rc_info, aspeed_pcie_cfg_info and
aspeed_2700_pcie_cfg_info directly into the 'aspeed_pcie_types[]'
array, removing the need for separate declarations.

No functional change.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20260601024959.2347639-22-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/pci-host/aspeed_pcie.c | 94 +++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 53 deletions(-)

diff --git a/hw/pci-host/aspeed_pcie.c b/hw/pci-host/aspeed_pcie.c
index 186e5aeea298..b46eb74234bb 100644
--- a/hw/pci-host/aspeed_pcie.c
+++ b/hw/pci-host/aspeed_pcie.c
@@ -83,13 +83,6 @@ static void aspeed_pcie_root_port_class_init(ObjectClass *klass,
     rpc->ssid = 0x1150;
 }
 
-static const TypeInfo aspeed_pcie_root_port_info = {
-    .name = TYPE_ASPEED_PCIE_ROOT_PORT,
-    .parent = TYPE_PCIE_ROOT_PORT,
-    .instance_size = sizeof(AspeedPCIERootPortState),
-    .class_init = aspeed_pcie_root_port_class_init,
-};
-
 /*
  * PCIe Root Complex (RC)
  */
@@ -305,14 +298,6 @@ static void aspeed_pcie_rc_class_init(ObjectClass *klass, const void *data)
     msi_nonbroken = true;
 }
 
-static const TypeInfo aspeed_pcie_rc_info = {
-    .name = TYPE_ASPEED_PCIE_RC,
-    .parent = TYPE_PCIE_HOST_BRIDGE,
-    .instance_size = sizeof(AspeedPCIERcState),
-    .instance_init = aspeed_pcie_rc_instance_init,
-    .class_init = aspeed_pcie_rc_class_init,
-};
-
 /*
  * PCIe Config
  *
@@ -679,15 +664,6 @@ static void aspeed_pcie_cfg_class_init(ObjectClass *klass, const void *data)
     apc->rc_rp_addr = PCI_DEVFN(8, 0);
 }
 
-static const TypeInfo aspeed_pcie_cfg_info = {
-    .name       = TYPE_ASPEED_PCIE_CFG,
-    .parent     = TYPE_SYS_BUS_DEVICE,
-    .instance_init = aspeed_pcie_cfg_instance_init,
-    .instance_size = sizeof(AspeedPCIECfgState),
-    .class_init = aspeed_pcie_cfg_class_init,
-    .class_size = sizeof(AspeedPCIECfgClass),
-};
-
 static void aspeed_2700_pcie_cfg_write(void *opaque, hwaddr addr,
                                        uint64_t data, unsigned int size)
 {
@@ -798,12 +774,6 @@ static void aspeed_2700_pcie_cfg_class_init(ObjectClass *klass,
     apc->rc_rp_addr = PCI_DEVFN(0, 0);
 }
 
-static const TypeInfo aspeed_2700_pcie_cfg_info = {
-    .name = TYPE_ASPEED_2700_PCIE_CFG,
-    .parent = TYPE_ASPEED_PCIE_CFG,
-    .class_init = aspeed_2700_pcie_cfg_class_init,
-};
-
 /*
  * PCIe PHY
  *
@@ -926,14 +896,6 @@ static void aspeed_pcie_phy_class_init(ObjectClass *klass, const void *data)
     apc->nr_regs = 0x100 >> 2;
 }
 
-static const TypeInfo aspeed_pcie_phy_info = {
-    .name       = TYPE_ASPEED_PCIE_PHY,
-    .parent     = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AspeedPCIEPhyState),
-    .class_init = aspeed_pcie_phy_class_init,
-    .class_size = sizeof(AspeedPCIEPhyClass),
-};
-
 static void aspeed_2700_pcie_phy_reset_hold(Object *obj, ResetType type)
 {
     AspeedPCIEPhyState *s = ASPEED_PCIE_PHY(obj);
@@ -961,21 +923,47 @@ static void aspeed_2700_pcie_phy_class_init(ObjectClass *klass,
     apc->nr_regs = 0x800 >> 2;
 }
 
-static const TypeInfo aspeed_2700_pcie_phy_info = {
-    .name       = TYPE_ASPEED_2700_PCIE_PHY,
-    .parent     = TYPE_ASPEED_PCIE_PHY,
-    .class_init = aspeed_2700_pcie_phy_class_init,
-};
+static const TypeInfo aspeed_pcie_types[] = {
+    {
+        .name = TYPE_ASPEED_PCIE_RC,
+        .parent = TYPE_PCIE_HOST_BRIDGE,
+        .instance_size = sizeof(AspeedPCIERcState),
+        .instance_init = aspeed_pcie_rc_instance_init,
+        .class_init = aspeed_pcie_rc_class_init,
+    },
+    {
+        .name = TYPE_ASPEED_PCIE_ROOT_PORT,
+        .parent = TYPE_PCIE_ROOT_PORT,
+        .instance_size = sizeof(AspeedPCIERootPortState),
+        .class_init = aspeed_pcie_root_port_class_init,
+    },
+    {
+        .name       = TYPE_ASPEED_PCIE_CFG,
+        .parent     = TYPE_SYS_BUS_DEVICE,
+        .instance_init = aspeed_pcie_cfg_instance_init,
+        .instance_size = sizeof(AspeedPCIECfgState),
+        .class_init = aspeed_pcie_cfg_class_init,
+        .class_size = sizeof(AspeedPCIECfgClass),
+    },
+    {
+        .name       = TYPE_ASPEED_PCIE_PHY,
+        .parent     = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(AspeedPCIEPhyState),
+        .class_init = aspeed_pcie_phy_class_init,
+        .class_size = sizeof(AspeedPCIEPhyClass),
+    },
+    {
+        .name       = TYPE_ASPEED_2700_PCIE_PHY,
+        .parent     = TYPE_ASPEED_PCIE_PHY,
+        .class_init = aspeed_2700_pcie_phy_class_init,
+    },
+    {
+        .name = TYPE_ASPEED_2700_PCIE_CFG,
+        .parent = TYPE_ASPEED_PCIE_CFG,
+        .class_init = aspeed_2700_pcie_cfg_class_init,
+    }
 
-static void aspeed_pcie_register_types(void)
-{
-    type_register_static(&aspeed_pcie_rc_info);
-    type_register_static(&aspeed_pcie_root_port_info);
-    type_register_static(&aspeed_pcie_cfg_info);
-    type_register_static(&aspeed_2700_pcie_cfg_info);
-    type_register_static(&aspeed_pcie_phy_info);
-    type_register_static(&aspeed_2700_pcie_phy_info);
-}
+};
 
-type_init(aspeed_pcie_register_types);
+DEFINE_TYPES(aspeed_pcie_types)
 
-- 
2.54.0


