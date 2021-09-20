Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1860558lfp;
        Mon, 20 Sep 2021 01:17:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGEHMb+TYJmy2cp8iHsKhFz6g88s9StcHS7+i9eDXXqUgGwo0NfyGP2Z4VqAIuYdmAcfN0
X-Received: by 2002:a5b:cd0:: with SMTP id e16mr2857402ybr.198.1632125841715;
        Mon, 20 Sep 2021 01:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125841; cv=none;
        d=google.com; s=arc-20160816;
        b=wSLELnePRYZM1GUrKRNManQTeZToFGFC1rFbD4O75XNZaVgo9DecLTSLggaPBNoexA
         SapHZY8YtoKe1NL+Z4kryjr7PkeIYi6t93wailYgQKhzICHLs4FCB7BhJjtmBI22FxoZ
         kY3+EzdI/wz72cTsNO/fVZ+WuVtN+gsQqzbowF58QBUP0R53byPxgdiI6QmB/NFaePdL
         yRX/M9qoEZ0CPykNVPategfAhsAA7cbQMlbQg+bvGPIzu/XCJ4U3yIJafHb9roNAjmgH
         w5Yq8rqAz4Hx3xLKyHCdiPwZ8IR8X5J8f9KSRUVcduj77y1J+ir+J6DrlS2BO/RQ70h3
         Er/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rcsQJX9BXBUjem9bi/u1cOmEbwSfgO8cym7reVUog6w=;
        b=oKXXxLROOHxKf7BTJIJZRLkbnPx/7Zd3qrkA96Wf1xJe3wtSb3LIMEA63atBlV1kDs
         aydHDZVLtTBikaCvAS2bCC/P13CpjED9xf5iKvBXq1Ina5/LzDHBwqTj9VK0nzjthSd2
         3zPsU3fw9b1SodZ2pSmd1/ERL91fC8vaCGBh8ih/hoXGqRPjgA6R9Anq0T2x/XFnQn8N
         hwHP1qdHHhxfBSNNysXps5+imXMEC8/ptmQDgu7r8achxtsQcWMjIFZ8Mlu4Bc/sReUR
         4CRYbtIMO+ohmDHIwWK4SLmSdONkwRuERWtfbADZ/DWw0ZglpiHrT8ZhyV1KZJbcJ1VO
         kDPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si15393082ybk.450.2021.09.20.01.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEUL-0000bz-1B
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSENB-0004bX-It
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:57 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:58315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMx-0003nN-3l
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 10450213E6;
 Mon, 20 Sep 2021 08:09:40 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c8fe341e-af88-4fe2-b401-37be9b7af0ba,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/14] hw/arm/aspeed: Allow machine to set UART default
Date: Mon, 20 Sep 2021 10:09:27 +0200
Message-ID: <20210920080928.1055567-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2f040a50-838b-4981-be80-b2d7606c4234
X-Ovh-Tracer-Id: 4738631235959229289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: kNoKIpVTyZAo

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

