Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp307321lff;
        Thu, 12 Dec 2019 20:27:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqJpFskhcfiSpr3EaFQJYOqkIH6y8VFZq3xOTKL3kmPwChH6n7NnsJlhH+aZGMt6K6XZKd
X-Received: by 2002:a05:6830:58:: with SMTP id d24mr12472566otp.356.1576211259359;
        Thu, 12 Dec 2019 20:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576211259; cv=none;
        d=google.com; s=arc-20160816;
        b=Cl8aolylxgFPDXgx9gYGQEidAumirx81vPoCosHBVR8dpOWMJ/OROn8zJ6t6vtqTPm
         ivojhC3zK74Zc400CsVNaoCuG7nE4nHBEYkm/sAnClQBMnO4qnGkHmLRoUKXNok2h2Dj
         N+VvRN3LisRK67E2h9VdjlfCPz28mfiSdDGg0Fe7bRyxUwhGrb4zYwxC9pY24V6ClhLC
         BlSSMe0qG1sdHyXZ83VQ5eEEXv5j02hXZaa9yyDsgbqspA5G07moTufBU1FCW/IjOxDJ
         82WVqxW9GmKT6lJBmFjPpZU0apvgmQQe1ejCD8lP/50QYajm+jOgiUhaad9PGY5q4zMW
         dlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=0lW1mMLBYhMF9Wt+yQXH47/Bfxh3BxEXaqeyk1Njp9k=;
        b=ehFoGyE2+P4BJ0oRjd1HZTKVoBMvzxtHjBBQ4NJ3MdSTv/c7nRtDHWlKc4xAkYngMs
         bnxUcXB4F+O0ueSlutogPyKFg0WzgYv1hHMETHE8/rvXiYBR0ujuR4GZb8hKEkrJ22Kb
         Ia0R1kBLeA7pj3zUjUfVAWAyzQfhUheQtDc3jCbL7iaomhWAYmhbdEe/tbTsX3XG9PVw
         Xg++Sw1Z8DuQylucHkiiZjBn5pVdDkDQDup+eMkFI6oCFUCB78XA4tTHJ+kIhcLQJm0G
         yv4MX/TZ4EzRtLpC+oB2oGTJyIpU4oMU1fWNLQjc/phyoIwHgk+WdroZhm4Rbwnh+WKU
         IxFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=WodJyDHB;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=XnKiNzXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i78si4586412oib.1.2019.12.12.20.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 20:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=WodJyDHB;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=XnKiNzXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifcYD-0003Pj-SW
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 23:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifcXv-0003N8-9F
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 23:27:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifcXt-0003Ce-TZ
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 23:27:19 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54267)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifcXt-0003Ai-Lv; Thu, 12 Dec 2019 23:27:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7267A87D;
 Thu, 12 Dec 2019 23:27:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 Dec 2019 23:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 0lW1mMLBYhMF9Wt+yQXH47/Bfxh3BxEXaqeyk1Njp9k=; b=WodJyDHBTZL3ni+d
 53jU7Qzqp16ZJwPCeyHiyvvK9VetkUfbOqlL+9dI3R/E7N4O8yH8ykytGTlO+Gsu
 MaOp9w43POdA60NhLLHxV4fl5I4+cE0cnJPf/sgyTMpDELfyjh0PeIxhbMaLLbUx
 wapi55dgTjPS/wkouwYQTLhJFoVA9OvdBvVpURqIlO3PCQ3FO+R/KAAy3hmzmZco
 PfI4rPya8AyUGwIU/egeSgul/zFuErtiRirBETTaEGv7ce8zhAZ6C+YS25JFIDXp
 OqZDg9Vf14OpYuRAHaBYAvJjhOanDhR8/mbS9zkC/j3Rn0foQ8BkmxZnoCpvgilR
 4BMHBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0lW1mMLBYhMF9Wt+yQXH47/Bfxh3BxEXaqeyk1Njp
 9k=; b=XnKiNzXdpUss4L6qJkeBUIJXU3PanyxhmqJ6+vMk4ZAG38htP23jU+bbB
 3VAvgNaNgh5A2mcMwPQnxnw+HqnYjvj776l95zqA1eh2wD59dPeeriLTQZOmNUR6
 l8S65WQSnbVRFG5tFptTY1dk2IlDKiWhNF1cqOE5fsvxTlsFqkNM3FMG7P+IrfyI
 xNomE+nl7I9zEPiKPFUaljeV2SHsneOJH5PkAxEuKa8pPbq9wBa3URy3VpY7ZaFr
 ixlXNGlwtUE9VwAM1uUVQb1uzOKOxK41gi/yCt/vq7Om69iGjJPEoCQsEBwN+fQg
 BUonlA7J7Dq1nS52VCUsVWCor6DQw==
X-ME-Sender: <xms:IxPzXYDKFnzgCmTEFFy7NX2TcifkXCP7vE3jgAUlAmzdwPdZOdFm_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughr
 vgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtd
 dvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:IxPzXaF3wZtP8fclQpNOYBzB9omYtmZ8hfpoFRYDlGnQ0eajZQ8_fw>
 <xmx:IxPzXf4owusVqP5hHefPk_mwoqKjC8T11BjEe4vYtvGZJ42_gDziBw>
 <xmx:IxPzXRQoiCFYCYjZ5I794TIOiEQwf9Mp5rwu4VoyWLuPBqHsDb8W4w>
 <xmx:JBPzXQvkYCh8m3JxfD7veREistXs4K-tycwkI0LcAHyuQAy6-DVXdg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D73B80066;
 Thu, 12 Dec 2019 23:27:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] hw/sd: Configure number of slots exposed by the ASPEED
 SDHCI model
Date: Fri, 13 Dec 2019 14:58:41 +1030
Message-Id: <6281ebb475f652838d10dc48ec70fa5113b1f029.1576211124.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
References: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.19
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zX2fTGpXeRro

The AST2600 includes a second cut-down version of the SD/MMC controller
found in the AST2500, named the eMMC controller. It's cut down in the
sense that it only supports one slot rather than two, but it brings the
total number of slots supported by the AST2600 to three.

The existing code assumed that the SD controller always provided two
slots. Rework the SDHCI object to expose the number of slots as a
property to be set by the SoC configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/aspeed.c              |  2 +-
 hw/arm/aspeed_ast2600.c      |  2 ++
 hw/arm/aspeed_soc.c          |  2 ++
 hw/sd/aspeed_sdhci.c         | 11 +++++++++--
 include/hw/sd/aspeed_sdhci.h |  1 +
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 028191ff36fc..862549b1f3a9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -259,7 +259,7 @@ static void aspeed_board_init(MachineState *machine,
         cfg->i2c_init(bmc);
     }
 
-    for (i = 0; i < ARRAY_SIZE(bmc->soc.sdhci.slots); i++) {
+    for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
         SDHCIState *sdhci = &bmc->soc.sdhci.slots[i];
         DriveInfo *dinfo = drive_get_next(IF_SD);
         BlockBackend *blk;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 931887ac681f..931ee5aae183 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -208,6 +208,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci),
                           TYPE_ASPEED_SDHCI);
 
+    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_abort);
+
     /* Init sd card slot class here so that they're under the correct parent */
     for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index f4fe243458fd..c39a42f914d4 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -215,6 +215,8 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci),
                           TYPE_ASPEED_SDHCI);
 
+    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_abort);
+
     /* Init sd card slot class here so that they're under the correct parent */
     for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]),
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index cff3eb7dd21e..939d1510dedb 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -13,6 +13,7 @@
 #include "qapi/error.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
 
 #define ASPEED_SDHCI_INFO            0x00
 #define  ASPEED_SDHCI_INFO_RESET     0x00030000
@@ -120,14 +121,14 @@ static void aspeed_sdhci_realize(DeviceState *dev, Error **errp)
 
     /* Create input irqs for the slots */
     qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_sdhci_set_irq,
-                                        sdhci, NULL, ASPEED_SDHCI_NUM_SLOTS);
+                                        sdhci, NULL, sdhci->num_slots);
 
     sysbus_init_irq(sbd, &sdhci->irq);
     memory_region_init_io(&sdhci->iomem, OBJECT(sdhci), &aspeed_sdhci_ops,
                           sdhci, TYPE_ASPEED_SDHCI, 0x1000);
     sysbus_init_mmio(sbd, &sdhci->iomem);
 
-    for (int i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
+    for (int i = 0; i < sdhci->num_slots; ++i) {
         Object *sdhci_slot = OBJECT(&sdhci->slots[i]);
         SysBusDevice *sbd_slot = SYS_BUS_DEVICE(&sdhci->slots[i]);
 
@@ -174,6 +175,11 @@ static const VMStateDescription vmstate_aspeed_sdhci = {
     },
 };
 
+static Property aspeed_sdhci_properties[] = {
+    DEFINE_PROP_UINT8("num-slots", AspeedSDHCIState, num_slots, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(classp);
@@ -181,6 +187,7 @@ static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
     dc->realize = aspeed_sdhci_realize;
     dc->reset = aspeed_sdhci_reset;
     dc->vmsd = &vmstate_aspeed_sdhci;
+    dc->props = aspeed_sdhci_properties;
 }
 
 static TypeInfo aspeed_sdhci_info = {
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index dfdab4379021..dffbb46946b9 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -24,6 +24,7 @@ typedef struct AspeedSDHCIState {
     SysBusDevice parent;
 
     SDHCIState slots[ASPEED_SDHCI_NUM_SLOTS];
+    uint8_t num_slots;
 
     MemoryRegion iomem;
     qemu_irq irq;
-- 
git-series 0.9.1
