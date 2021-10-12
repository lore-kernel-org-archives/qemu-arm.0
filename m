Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1524158lfc;
        Tue, 12 Oct 2021 00:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGpaoKo5u63TqDuF6hrr5T3bfzPzpI+Vlt8p09OOtpy/RTQIWLogXx+blkgmJZGpIcOPBv
X-Received: by 2002:ac8:40d3:: with SMTP id f19mr20836964qtm.344.1634024622070;
        Tue, 12 Oct 2021 00:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024622; cv=none;
        d=google.com; s=arc-20160816;
        b=ANB6FiJUmShCnpH9m6Gt93mtxzqhKMAshnu4RXGy+W4M7jTR4fVpPS/Yy5kQMxxEGt
         OPe7Hu2XNqHbRC5tuDrH0WCYGrLV3SMtzq/w70yKAT145FZeuq56prQe8xE6meB74ZW2
         iY2jv3q+gue41cmddAe6Oh6rZSUSimnu5dSHgl/Y0yDFonMQtgMiW97QOP/sMkH/AcXy
         X8TWkZLcv6MfnUz6QyFo69hQnOOa6MPzx2xAdNfwkAuM56T3Cw4CO9P0W5D2zwZzBz4C
         4Kx1yo7ltumiK6BvkOEXv1aCyZVwTafM26CCQc0z02SCXdX/DOM8EfA4mC5hSNEd2cSQ
         lGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=FZ85/BuVUGbqXP6WCdd/htlavn3+YRqmozvPbptZ3hE=;
        b=ucVRdZK9x3MbovcPtlVstQJNNKkUBP4MW3EWhlpVnTCx+BlkyKw1vFleTZfKB+ssNI
         KzWt6tqVc6iojJ1Wzsa3gjGpQgCQFumu6/4S8xkI8bc1tO+jadWkAkRt2CG3nobifwIG
         EMPQe157PLk5/OT65mCSrgV6rrU7GMcUGvX7TLiI+T59AyANe/6H790l2n0p32Mtv5cJ
         5Un1hE9NSKt9eJZGIrIKJ4hf+/uq4rIL58iuLayHuTWVnhA6aGpXY6FCwXD/ca8WwRK2
         Y2f3KbypK34fIRyJTmxdpqjAXHvl2G6S67IGrXlDE5LBczdoJvQ2tEFJDTwOtzfa1GoA
         yIhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si7345813qty.0.2021.10.12.00.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCRp-0001WH-Eh
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM3-0000LY-Gj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:43 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCLy-000505-L4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C5CB8C407CFD;
 Tue, 12 Oct 2021 09:37:35 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c90cc831-e8e1-4b96-89a9-7309bf782fa2,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/18] aspeed/smc: Introduce a new addr_width() class handler
Date: Tue, 12 Oct 2021 09:37:20 +0200
Message-ID: <20211012073728.257748-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: df066341-8d74-4fb8-8e12-5fd9ef3f491d
X-Ovh-Tracer-Id: 4269130975013210918
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nznsx0qgPNKb

The AST2400 SPI controller has a transitional HW interface and it
stores the address width currently in use in a different register than
all the other SMC controllers. It needs special handling when working
in 4B mode.

Make it clear through a class handler. This also removes another use
of the segments array.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index a1ca0e65c405..8dc81294988e 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -111,6 +111,7 @@ struct AspeedSMCClass {
     void (*reg_to_segment)(const AspeedSMCState *s, uint32_t reg,
                            AspeedSegments *seg);
     void (*dma_ctrl)(AspeedSMCState *s, uint32_t value);
+    int (*addr_width)(const AspeedSMCState *s);
 };
 
 #endif /* ASPEED_SMC_H */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8cc7ccf45591..7129341c129e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -196,7 +196,6 @@
  * controller. These can be changed when board is initialized with the
  * Segment Address Registers.
  */
-static const AspeedSegments aspeed_2400_spi1_segments[];
 static const AspeedSegments aspeed_2500_spi1_segments[];
 static const AspeedSegments aspeed_2500_spi2_segments[];
 
@@ -382,15 +381,15 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
     return cmd;
 }
 
-static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
+static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
 
-    if (asc->segments == aspeed_2400_spi1_segments) {
-        return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
+    if (asc->addr_width) {
+        return asc->addr_width(s);
     } else {
-        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->cs));
+        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->cs)) ? 4 : 3;
     }
 }
 
@@ -450,7 +449,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl, uint32_t addr)
 {
     const AspeedSMCState *s = fl->controller;
     uint8_t cmd = aspeed_smc_flash_cmd(fl);
-    int i = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
+    int i = aspeed_smc_flash_addr_width(fl);
 
     /* Flash access can not exceed CS segment */
     addr = aspeed_smc_check_segment_addr(fl, addr);
@@ -558,7 +557,7 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
                                 unsigned size)
 {
     AspeedSMCState *s = fl->controller;
-    uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
+    uint8_t addr_width = aspeed_smc_flash_addr_width(fl);
 
     trace_aspeed_smc_do_snoop(fl->cs, s->snoop_index, s->snoop_dummies,
                               (uint8_t) data & 0xff);
@@ -1384,6 +1383,11 @@ static const AspeedSegments aspeed_2400_spi1_segments[] = {
     { 0x30000000, 64 * MiB },
 };
 
+static int aspeed_2400_spi1_addr_width(const AspeedSMCState *s)
+{
+    return s->regs[R_SPI_CTRL0] & CTRL_AST2400_SPI_4BYTE ? 4 : 3;
+}
+
 static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1405,6 +1409,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->addr_width        = aspeed_2400_spi1_addr_width;
 }
 
 static const TypeInfo aspeed_2400_spi1_info = {
-- 
2.31.1

