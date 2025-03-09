Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607779njc;
        Sun, 9 Mar 2025 06:56:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHEDDRCVIFC5hhn+TR5sHXeGkNx3RQnA2iLDiojK+X4M/UNLgPdXiXufAX9gktx6lrCd1egT1qjGCkAw==@linaro.org
X-Google-Smtp-Source: AGHT+IFluPDyuUDbrd+PdgeK03zTQCmZib6IcaQEHKAXOwW0OKRl3kohTLUWSnjy4/8LTOPlS7rU
X-Received: by 2002:a05:6214:d6d:b0:6e8:9170:9d06 with SMTP id 6a1803df08f44-6e900697909mr175137226d6.37.1741528585153;
        Sun, 09 Mar 2025 06:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528585; cv=none;
        d=google.com; s=arc-20240605;
        b=CXi/foyNE2PMbm2JOSErTcem0JRs/Im1e3h2zKkReORdY5iR8lgv8odLSkVNlBpBiA
         5gX/3nBBhWj1vkQIHO1uFOB5RcAVRvzlGAuBicYqF5KDLtFtNrHVJc+NjerDu/jkZR6J
         cJqYd2Zn9N+MzibaVqLPdn6ixA8rIoFYs+OPJImyaJPA1sRYVqQA3IvlrUr6vlpE3inp
         xv+G8yV7jZqsvUIMs2j5UcBO6OmSkXO+diAb4ntF9Yqzayz5miI8DSwtZu7+CnoiTlay
         qqv1v/GDx5VxOPe/dPsNLfnecLz/c+VGL+D7MIVEAC87jcL2yEdsRyFwfTcIng+5PttR
         UjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FOIFkxOYwijX8w88Idz+eZzBcBAwGSxFGCo/NAZIMBw=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=QcxNbPUgs2vY6BUHb2QlOAR4SSIGBqrGYCth+KJlL1BUiEBjsjg7k7OZ0nLhF+o/7K
         ehE2OtOXGlWoIE9xkqKvaRn0Dk54C1mz8hNZbhPfQjj9wuXkgMyECN/6tBnu9WFYwV1d
         kYrLzeHyIuRyF0oNZdjprTy/rrrxFavsMYxAP0uDWV4ww9OROWkAWQeX2S1ySIDNHfe2
         N15TAu++jLQRjJexkG8jp7M63UfgawtsogAlUQEiK4GNqrAL4irRsr2sFl3ncbIIQ+uv
         5UjbQzo+UHz49rcTg75b8IB07pRn5HgixXtxFt8pFMZ/j7ogpOCSQursqcLtbSjQsciN
         l+Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVyUHmLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7466fb2si73544356d6.400.2025.03.09.06.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVyUHmLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH6P-0004L8-KI; Sun, 09 Mar 2025 09:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5j-00023n-B4
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5h-0003xT-87
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOIFkxOYwijX8w88Idz+eZzBcBAwGSxFGCo/NAZIMBw=;
 b=LVyUHmLQFJ6B+O6z5jr4ZUoHEewZgGi0zFWJxe2b9PoN0vnirUu56HKPJvYdpob0WcG8lM
 IcZEc00dVZx8TdKwnNcy5LU6tiBo4q2f5jlzovxtzTmHLD1tQFlmbfRr6vaUGxzEKJ2HG7
 VjY5tPbS39fTTOwDSQdR77hLDuGZFhw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-v13eq5r4NjKcTIRg-Z3PZw-1; Sun,
 09 Mar 2025 09:53:11 -0400
X-MC-Unique: v13eq5r4NjKcTIRg-Z3PZw-1
X-Mimecast-MFC-AGG-ID: v13eq5r4NjKcTIRg-Z3PZw_1741528390
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C8DD31800EC5; Sun,  9 Mar 2025 13:53:10 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F3FF1956094; Sun,  9 Mar 2025 13:53:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 38/46] hw/arm/aspeed_ast27x0: Support two levels of INTC
 controllers for AST2700 A1
Date: Sun,  9 Mar 2025 14:51:22 +0100
Message-ID: <20250309135130.545764-39-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o1iTSfW8Zawh

From: Jamin Lin <jamin_lin@aspeedtech.com>

The design of INTC controllers has significantly changed in AST2700 A1.

There are a total of 480 interrupt sources in AST2700 A1. For interrupt numbers
from 0 to 127, they can route directly to PSP, SSP, and TSP. Due to the
limitation of interrupt numbers of processors, the interrupts are merged every
32 sources for interrupt numbers greater than 127.

There are two levels of interrupt controllers, INTC(CPUD Die) and INTCIO
(IO Die). The interrupt sources of INTC are the interrupt numbers from INTC_0 to
INTC_127 and interrupts from INTCIO. The interrupt sources of INTCIO are the
interrupt numbers greater than INTC_127. INTC_IO controls the interrupts
INTC_128 to INTC_319 only.

Currently, only GIC 192 to 201 are supported, and their source interrupts are
from INTCIO and connected to INTC at input pin 0 and output pins 0 to 9 for
GIC 192-201.

The design of the orgates for GICINT 196 is as follows:
It has interrupt sources ranging from 0 to 31, with its output pin connected to
INTCIO "T0 GICINT_196". The output pin is then connected to INTC "GIC_192_201"
at bit 4, and its bit 4 output should be connected to GIC 196.
The design of INTC GIC_192_201 have 10 output pins, mapped as following:
Bit 0 -> GIC 192
Bit 1 -> GIC 193
Bit 2 -> GIC 194
Bit 3 -> GIC 195
Bit 4 -> GIC 196

To support both AST2700 A1 and A0, INTC input pins 1 to 9 and output pins
10 to 18 remain to support GIC 128-136, which source interrupts from INTC.
These will be removed if we decide not to support AST2700 A0 in the future.

|-------------------------------------------------------------------------------------------------------|
|                                                   AST2700 A1 Design                                   |
|           To GICINT196                                                                                |
|                                                                                                       |
|   ETH1    |-----------|                    |--------------------------|        |--------------|       |
|  -------->|0          |                    |         INTCIO           |        |  orgates[0]  |       |
|   ETH2    |          4|   orgates[0]------>|inpin[0]-------->outpin[0]|------->| 0            |       |
|  -------->|1         5|   orgates[1]------>|inpin[1]-------->outpin[1]|------->| 1            |       |
|   ETH3    |          6|   orgates[2]------>|inpin[2]-------->outpin[2]|------->| 2            |       |
|  -------->|2        19|   orgates[3]------>|inpin[3]-------->outpin[3]|------->| 3  OR[0:9]   |-----| |
|   UART0   |         20|-->orgates[4]------>|inpin[4]-------->outpin[4]|------->| 4            |     | |
|  -------->|7        21|   orgates[5]------>|inpin[5]-------->outpin[5]|------->| 5            |     | |
|   UART1   |         22|   orgates[6]------>|inpin[6]-------->outpin[6]|------->| 6            |     | |
|  -------->|8        23|   orgates[7]------>|inpin[7]-------->outpin[7]|------->| 7            |     | |
|   UART2   |         24|   orgates[8]------>|inpin[8]-------->outpin[8]|------->| 8            |     | |
|  -------->|9        25|   orgates[9]------>|inpin[9]-------->outpin[9]|------->| 9            |     | |
|   UART3   |         26|                    |--------------------------|        |--------------|     | |
|  ---------|10       27|                                                                             | |
|   UART5   |         28|                                                                             | |
|  -------->|11       29|                                                                             | |
|   UART6   |           |                                                                             | |
|  -------->|12       30|     |-----------------------------------------------------------------------| |
|   UART7   |         31|     |                                                                         |
|  -------->|13         |     |                                                                         |
|   UART8   |  OR[0:31] |     |                |------------------------------|           |----------|  |
|  -------->|14         |     |                |            INTC              |           |     GIC  |  |
|   UART9   |           |     |                |inpin[0:0]--------->outpin[0] |---------->|192       |  |
|  -------->|15         |     |                |inpin[0:1]--------->outpin[1] |---------->|193       |  |
|   UART10  |           |     |                |inpin[0:2]--------->outpin[2] |---------->|194       |  |
|  -------->|16         |     |                |inpin[0:3]--------->outpin[3] |---------->|195       |  |
|   UART11  |           |     |--------------> |inpin[0:4]--------->outpin[4] |---------->|196       |  |
|  -------->|17         |                      |inpin[0:5]--------->outpin[5] |---------->|197       |  |
|   UART12  |           |                      |inpin[0:6]--------->outpin[6] |---------->|198       |  |
|  -------->|18         |                      |inpin[0:7]--------->outpin[7] |---------->|199       |  |
|           |-----------|                      |inpin[0:8]--------->outpin[8] |---------->|200       |  |
|                                              |inpin[0:9]--------->outpin[9] |---------->|201       |  |
|-------------------------------------------------------------------------------------------------------|
|-------------------------------------------------------------------------------------------------------|
|  ETH1    |-----------|     orgates[1]------->|inpin[1]----------->outpin[10]|---------->|128       |  |
| -------->|0          |     orgates[2]------->|inpin[2]----------->outpin[11]|---------->|129       |  |
|  ETH2    |          4|     orgates[3]------->|inpin[3]----------->outpin[12]|---------->|130       |  |
| -------->|1         5|     orgates[4]------->|inpin[4]----------->outpin[13]|---------->|131       |  |
|  ETH3    |          6|---->orgates[5]------->|inpin[5]----------->outpin[14]|---------->|132       |  |
| -------->|2        19|     orgates[6]------->|inpin[6]----------->outpin[15]|---------->|133       |  |
|  UART0   |         20|     orgates[7]------->|inpin[7]----------->outpin[16]|---------->|134       |  |
| -------->|7        21|     orgates[8]------->|inpin[8]----------->outpin[17]|---------->|135       |  |
|  UART1   |         22|     orgates[9]------->|inpin[9]----------->outpin[18]|---------->|136       |  |
| -------->|8        23|                       |------------------------------|           |----------|  |
|  UART2   |         24|                                                                                |
| -------->|9        25|                       AST2700 A0 Design                                        |
|  UART3   |         26|                                                                                |
| -------->|10       27|                                                                                |
|  UART5   |         28|                                                                                |
| -------->|11       29| GICINT132                                                                      |
|  UART6   |           |                                                                                |
| -------->|12       30|                                                                                |
|  UART7   |         31|                                                                                |
| -------->|13         |                                                                                |
|  UART8   |  OR[0:31] |                                                                                |
| -------->|14         |                                                                                |
|  UART9   |           |                                                                                |
| -------->|15         |                                                                                |
|  UART10  |           |                                                                                |
| -------->|16         |                                                                                |
|  UART11  |           |                                                                                |
| -------->|17         |                                                                                |
|  UART12  |           |                                                                                |
| -------->|18         |                                                                                |
|          |-----------|                                                                                |
|                                                                                                       |
|-------------------------------------------------------------------------------------------------------|

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-22-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h |  1 +
 hw/arm/aspeed_ast27x0.c     | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 066d2fcc204b..f899356ed94c 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -194,6 +194,7 @@ enum {
     ASPEED_DEV_EHCI2,
     ASPEED_DEV_VIC,
     ASPEED_DEV_INTC,
+    ASPEED_DEV_INTCIO,
     ASPEED_DEV_SDMC,
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 6cffa5b9a05e..8ed57d23ef1c 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -57,6 +57,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ETH3]      =  0x14070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
     [ASPEED_DEV_INTC]      =  0x12100000,
+    [ASPEED_DEV_INTCIO]    =  0x14C18000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
     [ASPEED_GIC_DIST]      =  0x12200000,
@@ -411,6 +412,8 @@ static void aspeed_soc_ast2700_init(Object *obj)
     object_initialize_child(obj, "sli", &s->sli, TYPE_ASPEED_2700_SLI);
     object_initialize_child(obj, "sliio", &s->sliio, TYPE_ASPEED_2700_SLIIO);
     object_initialize_child(obj, "intc", &a->intc[0], TYPE_ASPEED_2700_INTC);
+    object_initialize_child(obj, "intcio", &a->intc[1],
+                            TYPE_ASPEED_2700_INTCIO);
 
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
@@ -527,6 +530,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     AspeedINTCClass *ic = ASPEED_INTC_GET_CLASS(&a->intc[0]);
+    AspeedINTCClass *icio = ASPEED_INTC_GET_CLASS(&a->intc[1]);
     g_autofree char *sram_name = NULL;
     qemu_irq irq;
 
@@ -564,6 +568,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc[0]), 0,
                     sc->memmap[ASPEED_DEV_INTC]);
 
+    /* INTCIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&a->intc[1]), errp)) {
+        return;
+    }
+
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc[1]), 0,
+                    sc->memmap[ASPEED_DEV_INTCIO]);
+
     /* irq sources -> orgates -> INTC */
     for (i = 0; i < ic->num_inpins; i++) {
         qdev_connect_gpio_out(DEVICE(&a->intc[0].orgates[i]), 0,
@@ -578,6 +590,18 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
                                             ast2700_gic_intcmap[i].irq));
     }
 
+    /* irq source -> orgates -> INTCIO */
+    for (i = 0; i < icio->num_inpins; i++) {
+        qdev_connect_gpio_out(DEVICE(&a->intc[1].orgates[i]), 0,
+                              qdev_get_gpio_in(DEVICE(&a->intc[1]), i));
+    }
+
+    /* INTCIO -> INTC */
+    for (i = 0; i < icio->num_outpins; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc[1]), i,
+                           qdev_get_gpio_in(DEVICE(&a->intc[0].orgates[0]), i));
+    }
+
     /* SRAM */
     sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
     if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size,
-- 
2.48.1

