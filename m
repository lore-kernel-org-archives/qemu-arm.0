Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3831181lfb;
        Mon, 13 Sep 2021 09:28:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrY2r497A3/8/JohDgE7tv5wlaJIf9mozdQY4AGbsulxKSy3FEhnU3MP2+pwVCjUjUlcGC
X-Received: by 2002:a05:6102:f11:: with SMTP id v17mr4205314vss.31.1631550507333;
        Mon, 13 Sep 2021 09:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631550507; cv=none;
        d=google.com; s=arc-20160816;
        b=jSNP5mm2xvDD0bFv6CiyKHNwpeDDMJBw+bZ4lCKyxAsPnePaM96yF3x2XaG7wYwD//
         ukPqcY+1iEGnthbgZuczyPVsfjmxCZXfThQWVGehWQndO9LB2lohi4Zyyv3PA0453MpP
         dHq9z5G6tCxUSnngaQ/PA1QsF1se67RMpGv87HhrQ1QKAFDeecd4A1QXp+hoXlAPj3mQ
         hX5As8XQzRpY1FrjwUB0R7Tz4SL69+TWe3pJaTsyE8GABzTotsFc3o/vc6f6T2ARukRS
         z4wupcOCLDLPWFA1K/XGyybnaF6uJDg1U3JDOw/EM7G95ySoG5T/9EqnUvwOn1BfPm3Q
         ql2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rcsQJX9BXBUjem9bi/u1cOmEbwSfgO8cym7reVUog6w=;
        b=QRgsQqzAEMYA2aRUDGnLSjUMwDwK+BIIdr853OTHd9h9gsps6VTqpFRLMwLbZPfZMU
         eLwF/fLQhxRzVOkh4Dysy4TbLsJl6+y3l1tpSN93dpRTXfmDZzQb4jPJ82fE35J2/HIY
         ffy4X4O73U+s4aYk8FprNW0fPuQcCE8KoWbZy13rwS/S+VhToflomb8zQ0R3jME8q3CZ
         gPjH8RhsAcVEkPIzYK2ZDgA0Ljh9CjxqWN/Pi7zwbntB4mIXOZLcpBUfVBOwrWEbwimu
         VOPXw4Z1peDwu7rPDc9iA7NddD7Vs6P2mrD8rvtm9R2mA16a6EtpmK4seeDmwcOsoct8
         eKIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az7si2225010uab.216.2021.09.13.09.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 09:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPook-0002OR-LA
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 12:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoaC-0003yV-Ou
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 12:13:25 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:57917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoa6-0000lW-H9
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 12:13:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D4CCD2092E;
 Mon, 13 Sep 2021 16:13:15 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00195fa7412-28ad-43fb-b229-c3ca1cc6eafa,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/14] hw/arm/aspeed: Allow machine to set UART default
Date: Mon, 13 Sep 2021 18:13:03 +0200
Message-ID: <20210913161304.3805652-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dc977883-d510-4e59-bd7d-c62fe05c12f1
X-Ovh-Tracer-Id: 8690539907994848105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ebHbPVR1uzSh

From: Peter Delevoryas <pdel@fb.com>

When you run QEMU with an Aspeed machine and a single serial device
using stdio like this:

    qemu -machine ast2600-evb -drive ... -serial stdio

The guest OS can read and write to the UART5 registers at 0x1E784000 and
it will receive from stdin and write to stdout. The Aspeed SoC's have a
lot more UART's though (AST2500 has 5, AST2600 has 13) and depending on
the board design, may be using any of them as the serial console. (See
"stdout-path" in a DTS to check which one is chosen).

Most boards, including all of those currently defined in
hw/arm/aspeed.c, just use UART5, but some use UART1. This change adds
some flexibility for different boards without requiring users to change
their command-line invocation of QEMU.

I tested this doesn't break existing code by booting an AST2500 OpenBMC
image and an AST2600 OpenBMC image, each using UART5 as the console.

Then I tested switching the default to UART1 and booting an AST2600
OpenBMC image that uses UART1, and that worked too.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210901153615.2746885-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed.h     | 1 +
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed.c             | 3 +++
 hw/arm/aspeed_ast2600.c     | 8 ++++----
 hw/arm/aspeed_soc.c         | 8 +++++---
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index c9747b15fc5f..cbeacb214ca4 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -38,6 +38,7 @@ struct AspeedMachineClass {
     uint32_t num_cs;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
+    uint32_t uart_default;
 };
 
 
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d9161d26d645..87d76c92598b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -65,6 +65,7 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
+    uint32_t uart_default;
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 886e5992cdf3..7a9459340cf4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -350,6 +350,8 @@ static void aspeed_machine_init(MachineState *machine)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
+    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
+                         amc->uart_default);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     memory_region_add_subregion(get_system_memory(),
@@ -848,6 +850,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
     mc->no_parallel = 1;
     mc->default_ram_id = "ram";
     amc->macs_mask = ASPEED_MAC0_ON;
+    amc->uart_default = ASPEED_DEV_UART5;
 
     aspeed_machine_class_props_init(oc);
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 8e1993790e6f..9d70e8e060c6 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -322,10 +322,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3ad6c56fa9a9..ed84502e238a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -287,9 +287,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
@@ -439,6 +439,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
+                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1

