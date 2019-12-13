Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp307927lff;
        Thu, 12 Dec 2019 20:28:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqycmRIb9nX0OOiLTrWBt5PGVqVSu+FNxM6UagsVZ9qixj8+prSYy4FHAPeBPWt3yjPZy87T
X-Received: by 2002:a9d:7f02:: with SMTP id j2mr12192159otq.123.1576211319753;
        Thu, 12 Dec 2019 20:28:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576211319; cv=none;
        d=google.com; s=arc-20160816;
        b=OefmYVyIeh/60pL5fXID6kmErctIIWjHfdBGKbRaf9aj2SEXo2pnsw1OYKlO0uZS6u
         B+i+NZ0Lj+IlAB+BfjPSLNjqKj7BiQe+YReJurgRyB/zTW9TaUO2QBvEgG+QbbFNPey3
         NIZ/m459Lwd77F9cgKd6L1/tIuP82u7IdDUvtyfbuib/Iq/Xg30rPG4z9ab+ShYR0jYo
         gkA98QqaTG2qVgbq+4ojN5rz2K8Q0KDq5cCL8uSFVBz1Tjv0pAcjdD+5P4KtZpSqHiT9
         FTcIBv6uJlx0LRzStz9PhTlsDofd6J0XO8jkT2enOkyRPRCmQOTVANy4bY0hw7dI9Jen
         tUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=zXn7cYEOSa/o40dnQ0SzE92heWINlABFTx7zsz1Qj1A=;
        b=JMl/8IpYqMrKBsQIu3HmZfwdzVrfNjXjCsE1OgtC/Wum+1U1gKXn7XYV/krSwTLN1z
         u6II6VwCnOtPnIuyFuqNxj28qg0MUCYtGLSg2hPKYG9JaA2FaG6RwnHJUkWorqkY3kL5
         HxtxEMSi80MDJLmlxm3NmX3tKntOdLruw5W6ghnz7TEoitlS/c/Tae94ZTHRKI+hc89c
         GTsn+DWdz5Ki3d3ADbyVoKHDT0DSy0+hBprtOAyMq1ZUZehmRmADTlNArhKRuhB7GqYw
         dNV7XBzr4DAIGVhsCTPQJXiVGdeVYVy8H3whb3ZTLm5K1Bxffu00xxKbhe7vZrX5W/9z
         K4oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=XY9Jy0Mo;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=rQMRRQV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si4568296otj.82.2019.12.12.20.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 20:28:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=XY9Jy0Mo;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=rQMRRQV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifcZC-0004zd-Ge
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 23:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifcXx-0003Pv-Vy
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 23:27:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifcXw-0003JP-LX
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 23:27:21 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43307)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifcXw-0003Hg-Cc; Thu, 12 Dec 2019 23:27:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3A54888E;
 Thu, 12 Dec 2019 23:27:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 Dec 2019 23:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zXn7cYEOSa/o4
 0dnQ0SzE92heWINlABFTx7zsz1Qj1A=; b=XY9Jy0Mo4vkJE9iD/kFxaH29OVN3W
 I2cwxfe+upBrUo4EV41m/+iB3zHQSJN7mHu140dB1uci0AjOURCH4ypmPk0gVd6u
 xFhbZ5jT0rnSKMWh7WHl+6Td3I/ubftqahLPoW8WTy6pqNvRnWgJcTdTDMp4lXy2
 21E/R+2Zz5V08ZUwOC6kFRn1G2mQIPv7ALjLO0Un0dTjGQVUMgqPYKep3ESUH5Za
 E5WNWF1k99AJUj4kwVEF2hUefGWCiX5wBkZsyb/1U7VI5VEpiVXpF/tV6XeVOUh/
 gSJJxv4138KtOZcVkLTBCDWdk7PQ77ux2WuKiJ2/2Dev+8zcWQyCpKmww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zXn7cYEOSa/o40dnQ0SzE92heWINlABFTx7zsz1Qj1A=; b=rQMRRQV0
 4dW2Mok94avZk2dTwY3A1X3J0WuMnSXxE8638K0ph6/r/qjLj+YST5BV7GaetBUM
 6Hcw8aN77rZY4xrP3nq76TFlrOmOoyZoV1l0EGtm0zmVeatWqxrFNIpm8LiKVgjV
 3SADrRHHR8wSGYa/0jELfVGCUK5+JRpLNNMKg1sydTrgP3N/Oe6ESH9rlttPDinh
 Spu2I4Ll0I7kxfDe7az+EuxxEg5YsqtJr5dOfARu05FWrgztm7w8tMqjjWnmJTxc
 aPUU9XuETT/ymvf49SU75UvTyR8V/d87ZO3wm7uuERRrg4C//sDSOkb6UsvPfhN1
 jFPMHHEt5+2h4g==
X-ME-Sender: <xms:JhPzXS4lHCJp_3RU5deandIZSh-l8neD0wwD97X8jhD_TvNj03u0UA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:JhPzXXpeWfahDkkEHoAQajiGqHR7J6tbTsTP4r9RzWHMDcQKO-9yAA>
 <xmx:JhPzXUOn1LLQAvlxE583LEiQ1hGpOyM26ZQaFunmRGO5QBDDHXZCqw>
 <xmx:JhPzXVJoe25BeSMbJ-L9Y6PNDD3nbEhTRj0iClI9sHPTd9esDwTTNw>
 <xmx:JhPzXeVpqaWewfRlkM0t8qMYuZcZtmsq4QL2qTIS_L-RNxDX33zwsg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6910A80064;
 Thu, 12 Dec 2019 23:27:16 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] hw/arm: ast2600: Wire up the eMMC controller
Date: Fri, 13 Dec 2019 14:58:42 +1030
Message-Id: <23bbbd829459a9a2508c9e76f0720e428852d92d.1576211124.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
References: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
MIME-Version: 1.0
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qhtJC/CW/FFx

Initialise another SDHCI model instance for the AST2600's eMMC
controller and use the SDHCI's num_slots value introduced previously to
determine whether we should create an SD card instance for the new slot.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

v2:
* Extract instantiation of SD cards to helper function

 hw/arm/aspeed.c             | 25 ++++++++++++++++---------
 hw/arm/aspeed_ast2600.c     | 21 +++++++++++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 3 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 862549b1f3a9..87baac0ea46c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -167,6 +167,18 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
+static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
+{
+        BlockBackend *blk;
+        DeviceState *card;
+
+        blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+        card = qdev_create(qdev_get_child_bus(DEVICE(sdhci), "sd-bus"),
+                           TYPE_SD_CARD);
+        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
+        object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
+}
+
 static void aspeed_board_init(MachineState *machine,
                               const AspeedBoardConfig *cfg)
 {
@@ -260,16 +272,11 @@ static void aspeed_board_init(MachineState *machine,
     }
 
     for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
-        SDHCIState *sdhci = &bmc->soc.sdhci.slots[i];
-        DriveInfo *dinfo = drive_get_next(IF_SD);
-        BlockBackend *blk;
-        DeviceState *card;
+        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
+    }
 
-        blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
-        card = qdev_create(qdev_get_child_bus(DEVICE(sdhci), "sd-bus"),
-                           TYPE_SD_CARD);
-        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
-        object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
+    if (bmc->soc.emmc.num_slots) {
+        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
     }
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 931ee5aae183..723c8196c8a5 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -46,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_ADC]       = 0x1E6E9000,
     [ASPEED_VIDEO]     = 0x1E700000,
     [ASPEED_SDHCI]     = 0x1E740000,
+    [ASPEED_EMMC]      = 0x1E750000,
     [ASPEED_GPIO]      = 0x1E780000,
     [ASPEED_GPIO_1_8V] = 0x1E780800,
     [ASPEED_RTC]       = 0x1E781000,
@@ -64,6 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_SOC_AST2600_MAX_IRQ 128
 
+/* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_UART1]     = 47,
     [ASPEED_UART2]     = 48,
@@ -77,6 +79,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_ADC]       = 78,
     [ASPEED_XDMA]      = 6,
     [ASPEED_SDHCI]     = 43,
+    [ASPEED_EMMC]      = 15,
     [ASPEED_GPIO]      = 40,
     [ASPEED_GPIO_1_8V] = 11,
     [ASPEED_RTC]       = 13,
@@ -215,6 +218,14 @@ static void aspeed_soc_ast2600_init(Object *obj)
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]),
                               sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SDHCI);
     }
+
+    sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc), sizeof(s->emmc),
+                          TYPE_ASPEED_SDHCI);
+
+    object_property_set_int(OBJECT(&s->emmc), 1, "num-slots", &error_abort);
+
+    sysbus_init_child_obj(obj, "emmc[*]", OBJECT(&s->emmc.slots[0]),
+            sizeof(s->emmc.slots[0]), TYPE_SYSBUS_SDHCI);
 }
 
 /*
@@ -487,6 +498,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_SDHCI));
+
+    /* eMMC */
+    object_property_set_bool(OBJECT(&s->emmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_EMMC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_EMMC));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 495c08be1b84..911443f4c071 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -56,6 +56,7 @@ typedef struct AspeedSoCState {
     AspeedGPIOState gpio;
     AspeedGPIOState gpio_1_8v;
     AspeedSDHCIState sdhci;
+    AspeedSDHCIState emmc;
 } AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -125,6 +126,7 @@ enum {
     ASPEED_MII4,
     ASPEED_SDRAM,
     ASPEED_XDMA,
+    ASPEED_EMMC,
 };
 
 #endif /* ASPEED_SOC_H */
-- 
git-series 0.9.1
