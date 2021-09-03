Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1609809lfb;
        Fri, 3 Sep 2021 12:50:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyX7InsR1uHIuxMaMRE52gjjkf0P+uyROCvsFNGVkyaJyA9DugwXkS21lFlTCgGgEyISGD
X-Received: by 2002:a05:6638:399:: with SMTP id y25mr598157jap.23.1630698643024;
        Fri, 03 Sep 2021 12:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630698643; cv=none;
        d=google.com; s=arc-20160816;
        b=EI0Yi1sd7/PtBDgylD1/2qqmBIB4Edz2NTicN/9g28lgF5Mh8o0xkSQ0+/V/jDXzJk
         eutR2LemFUSmXzHEZxY2sK/pjZVXxPS2dIcDqhgcqhWJbW8wUw947agUw9Tg7QdMWXrF
         IsDL8oFj2wE/qH0ar1mFcWEYxHyTPF6WFkRbUTQhIWviJkKRgikbiK60s1W5vQ3DIv/3
         5WiXxgd/qAqK21gHyQhlr6vZcPXKDMJTgaDmAm6XshL2f9YR2XeG+UCHggae8atM4N1L
         tHbb2yllNEilD4bQCDI/ocDpsrerFFTGa4jIa5pOj9yOkhiuDoIq8bE/atQrgkvUqQ3f
         valg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rcsQJX9BXBUjem9bi/u1cOmEbwSfgO8cym7reVUog6w=;
        b=lisMJa9o2u/jfd7eG6btTsLLlJTwVzMno28zguqxmWIBIfaWRWvUWPSzc80C7kfeyL
         i9PSuNvtU4XKwmz2AVhMCT23I1XuX1wjVTBlj9amIjoGPjS/1ZbPGfSJq4npA7kODrey
         IwUgidVuAFyiCnneYEfhL3REcv5V0golXJ62FuqMN3Sd2yaG3JPsKB1EtI2X4UXLLOEW
         5NFkhx7Nlc1l9rX7oUdcRZUKbV6MY7aN+aXSgDJwQmk4VtisoL4EUPUnTYB8R+Fb2D1J
         DFlRd7Kb33vnt3mAvQCJkWJDkZhRy6mxeo+Ls0zXuoDyvqH9uUlXYr5gK8B2OK8xz9B8
         J4DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si291008ioc.95.2021.09.03.12.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMFCy-0006pu-K5
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF40-0003v7-4A
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:24 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:58867
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF3v-0002N4-Nj
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 3D2DA13B20F;
 Fri,  3 Sep 2021 19:41:16 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005d1a95851-92f9-4c81-90ac-579b0736edef,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/14] hw/arm/aspeed: Allow machine to set UART default
Date: Fri, 3 Sep 2021 21:41:07 +0200
Message-ID: <20210903194108.131403-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fbf0155b-3bdc-4813-9270-b4ba2b1accf6
X-Ovh-Tracer-Id: 8816922173176515433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FJvwm3vq19P4

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

