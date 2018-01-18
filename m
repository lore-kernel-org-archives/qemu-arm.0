Received: by 10.28.173.206 with SMTP id w197csp6990265wme;
        Thu, 18 Jan 2018 12:43:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBosM0ZON0yoB5wth3n1+zeSv7ggDCm0vNlbD4aHlGHXI6N6Ua00JpZM/owzDGBgw6/SeJ/40
X-Received: by 10.37.185.140 with SMTP id r12mr11047563ybg.107.1516308236012;
        Thu, 18 Jan 2018 12:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516308236; cv=none;
        d=google.com; s=arc-20160816;
        b=Mi7ZAkSLXUlkzoYuKeNmdcEbfp4Gu3BcF2hti5yL/vhOA0he5H2dEWYVpHy1TUddLV
         fHJxl6+PhQLTxB9Tpndpvrk97vPMpoEsp2f15RRJNCdd3kTZ1a86ernCY0k5eHVM+nRz
         Pgu7zSKkoU4ZqZ23AJwJvJMB7Ys4oUEyK2Lyf1E8xeHN/BJ4NWK0SOMR+yrOskHJBfaY
         93Eo0ezvj0A27VBqTydbGsnvLoNt3OuOYhJbe/Y7WFtG4lROQbwjaP09hr1FBE82/YH/
         N5S1dNh5sZBLejkofHr/Hs8zKYt55eV5lVvEhXqCQtdwokbouGnAjVHY+9xau+8DR81o
         UwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=VcznwnAQCLddMsbntcQbOsipL+gOjhUaYYE70CPpa8c=;
        b=z1TDaMc59scLiGAl7cQ8d2lLq9dZOsQHP7Fpmv5NCss4aq1XU7fk88qsG9WMzsdNuW
         64pv7V2B6GMJ1A/ctycvANQm8En+9A4McrxCI6JZkggoi2KFvvXz8P5YMqv1d5p0UQLd
         LtX1b4l89rfvQGChMtfHBZoRZu9wqaV8cz6Hoal7UGDHlePq67ZVWzlUzBHLRSArkhqG
         jc3PGC3eApUBzPKXVvaZaxvHWFEczJSuxNYYalQ0ffPkoM69oOM00fmlkgr/rfuf6ZTF
         wMAfs3n+y/jamkphHZgPMBezy4iG6Ps5dHTm1rQDzFKC6sULRSQULlt1zsnGblewJasr
         DANw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vwso8dwA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c73si275370ybf.762.2018.01.18.12.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 12:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vwso8dwA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecH2R-0001qP-Co
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 15:43:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH08-0000aO-H8
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 15:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH07-0007Xo-20
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 15:41:32 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH06-0007XN-Tt; Thu, 18 Jan 2018 15:41:30 -0500
Received: by mail-qt0-x241.google.com with SMTP id s39so16481351qth.7;
	Thu, 18 Jan 2018 12:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VcznwnAQCLddMsbntcQbOsipL+gOjhUaYYE70CPpa8c=;
	b=Vwso8dwAoYd+/X27NnQgMDkQ7dqJPnI0tRr8bt/jUc+eoAAd2jDYtge8zNssTtezoG
	X/Sl3E9DyCcCJwbPpoYFBDLcKi6Zl9H9KTRpfBcv67aF4AusmT/upQE+Fqdx/piMh37d
	k7FNSLVzaKdmoG2bHRn8Tp12iBY4VGBJwbfiL+wDOz3bBorGcmp2QC7Qaj9O7lU8aEHU
	sQxgSvtpzmOIARdj42LvBW+wZyl0XUEonI/4hXQ4ZwVDQwCOZqhVQdVhND/g9hbAW24t
	2O8ov7TAr+am7Z9b5taoBiwLI30OCXZoWclHw3d3pIjGqdij7GjhMTdc3/bcvvKnLV4+
	mlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VcznwnAQCLddMsbntcQbOsipL+gOjhUaYYE70CPpa8c=;
	b=fyOWNNbyk9SOut1eByPTBvZ9TjvTPzQRbD8YCzUfWEh+hJBmSYW6Xs1rjt1IFM1Bg6
	JyjDCNh0FrPyN9u67QZrDcmIjMfxpWsORdDHint0Ruiw+jLG72ZpdHwIwa9hH4xt9zYT
	U7zFwyhkphU0BbX/LQA8d979xW0mkUFS7DvSl36NwLgUCwnAuNAGoB4qQTqDAQuEXWPW
	jrPZPUtB1HdettUhZP4DRPAWnifnX2c4OH9ec3993aLtqFTLR0gnnroqKM3tdlsIrZbw
	qOL9evm//8MLjbbxff6pWZfqohoOkDCjrFjeuDUsoYMjz3NuyFtRYu7q0tXx3pF1dqd9
	iZyQ==
X-Gm-Message-State: AKwxytfLc1DhZIUi3h0s6mgWukkQWXHILsW9K7IrLgQ3k5neGFbuF0//
	EO7gTw1AU4D/J65O241b9oQ=
X-Received: by 10.200.44.251 with SMTP id 56mr15185529qtx.55.1516308090404;
	Thu, 18 Jan 2018 12:41:30 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 24sm5484621qkv.64.2018.01.18.12.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 12:41:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jan 2018 17:40:50 -0300
Message-Id: <20180118204058.5768-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118204058.5768-1-f4bug@amsat.org>
References: <20180118204058.5768-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v7 06/14] hw/arm/xilinx_zynqmp: implement SDHCI
 Spec v3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JRKPGWM48kXK

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..c4f6638ab7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -381,22 +381,40 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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
+         *
+         * Host clock rate variable between 0 and 208 MHz
+         * Transfers the data in SDR104, SDR50, DDR50 modes
+         * (SDR104 mode: up to 832Mbits/s using 4 parallel data lines)
+         * Transfers the data in 1 bit and 4 bit SD modes
+         * UHS speed modes, 1.8V
+         * voltage switch, tuning commands
+         */
+        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
+        object_property_set_uint(sdhci, 0, "timeout-freq", &err);
+        object_property_set_uint(sdhci, 0, "max-frequency", &err);
+        object_property_set_bool(sdhci, true, "suspend", &err);
+        object_property_set_bool(sdhci, false, "adma1", &err);
+        object_property_set_bool(sdhci, true, "64bit", &err);
+        object_property_set_uint(sdhci, 0b111, "bus-speed", &err);
+        object_property_set_uint(sdhci, 0b111, "driver-strength", &err);
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
2.15.1

