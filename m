Received: by 10.28.71.27 with SMTP id u27csp1039491wma;
        Fri, 9 Feb 2018 07:13:11 -0800 (PST)
X-Google-Smtp-Source: AH8x225vtCIeFuAslisV66PXtkdKmrTt6J3EHtIp5H3JWb4vvVl4YXTkcGdl3KHKpKh6DItTDWiy
X-Received: by 10.37.192.4 with SMTP id c4mr2006319ybf.133.1518189191804;
        Fri, 09 Feb 2018 07:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518189191; cv=none;
        d=google.com; s=arc-20160816;
        b=dAo5hCOsFSSckjCyRqn2RXCihFxy6K2BVmPr5wHEtNGiltMzYJgHttf3qX8TlzAa8I
         2qaacqn2PPV4sdP6LLPAo8S5yjHixwBtpWQqV7iwYSBOILojuDsvnFvaGupZJFi3Rb7I
         SLybHgef9dCaJeLiqu4MkuKY1O3RhfVre5D4D/s9ZAbxcXuqnpIxNbLEIUPIuPLCNJvC
         q61w3UTeQl70x/OQhJrqIlNuuSBDDrVlmyzvr9cq7oeZVmJqVxN7YLS2oDS6UdL55YJi
         xtbKy7Vf+JD90vEFgDjIcI69hzOR+sK+1aACjgxjaS3rXLdbhpZ1dJX7riPK105bQHaS
         CCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
        b=Pi35FLqQmcuJKmiL+V/GryCGea1pOXa6K6gPCYJiuIP20oERbQmt5rLj2mdCEu+sfV
         E6zLXqHWPXYkTEtGaxQxbXh5+NbgM9gjCN9fGb+QURAsfMzw42NqgLLEIq+7NX4SBq/Q
         GjD+2rAmLoJdXn8nqWaGFqlUohWz4VME70VQS0J45lUSqruSR12JO3UiiPmfkMniwA2k
         0qlTruel62cqgwKaCpn/qAd9oLb1N3zEapEzxe+6rgdhMvt95mJUjRGgmrQsX06zAynb
         Ux3DcYfYhdMNE7G+9LlDtPLqQ/NmnwF9tBSzx5HhzJGvtHvngwf7owjaep/rNCHqxkeK
         ybKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rVhuzKvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u190si435356ybf.20.2018.02.09.07.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:13:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rVhuzKvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAMR-0000Bn-4k
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:13:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5j-0002jt-Kh
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 09:55:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5i-0005r5-Ni
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 09:55:55 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5g-0005ps-Fq; Fri, 09 Feb 2018 09:55:52 -0500
Received: by mail-qt0-x241.google.com with SMTP id a9so4245436qtj.8;
	Fri, 09 Feb 2018 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
	b=rVhuzKvORaISLKAs5lYk2tjXOpjAiin4NZqvyvyJvY6IigHYW6i4xgUG2qOrak3S2V
	tjMZHozrT82oBxi6XL22GP8mFnBnpnn4N/Pb8hiQ/ZQbx1l8Ul/848Uz7s0DYJUi+eui
	2oeaVeiKHnssfLQkcuoS/lqY1rGEhtPcjoGV8DLao1a9bkYz9XUlRn3PQOUExOG5vdfA
	t5IZpQ1kaCZgfISBh14BBXGdq6CeJCSXRGpCsOVx+qw/MY85IQezzexquHEGRZVdcoj+
	dbWnOqBcX++q0PCgqTSxsPYunXMDLn7lJzLOVlh2qHky6HnUAzx6cYIyqyMJK4xmNew4
	1qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
	b=hXh0thoY16OP3/tWYyF0dACSv9wNtiPo2UUbbf6sDjOSS/jqUZlIgiods09BOO5SPO
	LfJE8yPjhz/APViDtiNKwA966E3hrmPCPT+AhCzJqWjGf5phVmmkuMg2hbSY6d+zaGog
	uakn4mWNeTli6XPj5TlJS/WsP2gOp9B84Y7jGzNDAvtoVtVenmBYM1TKEXp11gb/mnTt
	h2/OMtxfUTRg8S8i7lq220JGLhbhNJharw68zfoY+mjmk/yrKE2+/ZbOlXMLGfBtlar0
	lIlwnQwXE9rftjtQ+FyeQf1CvgvRQ+ODxGRnoy+Unrh1ygWSOuQHWOYUYx2mLGGlNbnL
	sxEw==
X-Gm-Message-State: APf1xPCOg5XK8wd2bpK6lnnbwYGjsYsm5kMx5zCiPLc/BQzbZk9N7Qgo
	wfQtJFhpkfDx83srRHYTQLddd8FP
X-Received: by 10.200.42.168 with SMTP id b37mr4783587qta.321.1518188151949;
	Fri, 09 Feb 2018 06:55:51 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:26 -0300
Message-Id: <20180209145430.26007-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v12 26/30] hw/arm/xilinx_zynqmp: fix the
 capabilities/spec version to match the datasheet
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BgPYNvHSuJd0

checking Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index ca398c4159..e39ad73bec 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -53,6 +53,8 @@
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
+#define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -387,22 +389,27 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
-        char *bus_name;
-
-        object_property_set_bool(OBJECT(&s->sdhci[i]), true,
-                                 "realized", &err);
+        char *bus_name = g_strdup_printf("sd-bus%d", i);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
+        Object *sdhci = OBJECT(&s->sdhci[i]);
+
+        /* Compatible with:
+         * - SD Host Controller Specification Version 3.00
+         * - SDIO Specification Version 3.0
+         * - eMMC Specification Version 4.51
+         */
+        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
+        object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                        sdhci_addr[i]);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                           gic_spi[sdhci_intr[i]]);
+        sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
+        sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
+
         /* Alias controller SD bus to the SoC itself */
-        bus_name = g_strdup_printf("sd-bus%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->sdhci[i]), "sd-bus",
+        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
                                   &error_abort);
         g_free(bus_name);
     }
-- 
2.16.1

