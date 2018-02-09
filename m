Received: by 10.28.71.27 with SMTP id u27csp657618wma;
        Fri, 9 Feb 2018 00:58:23 -0800 (PST)
X-Google-Smtp-Source: AH8x224jTpnd1vALb8XuHun+v4J3rRleypR10a9wyMZqzX+nejO+vgrKE9EHkCRrsvhxpnd7Uiuo
X-Received: by 10.129.4.87 with SMTP id 84mr1346705ywe.36.1518166703644;
        Fri, 09 Feb 2018 00:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518166703; cv=none;
        d=google.com; s=arc-20160816;
        b=bX9E1tnuEOP4WrDEL5SpVbRNSHks1w3S9d6XbqXYQ1edqSIodrxQbShiuieqyzKlCy
         Ed8jgwbpUjVbZAhCz8+VZlQUDvpUjMshihEZEKUs5fwXQQzeBYjwk858c2DEIO2CCclY
         9dSM+NdzKersqf1dWunKnKXzrTkHYm70tXGeAhMtHYeFFbYW8DZ/SZuNUmjZPvxuNUfm
         nNpSaiWSgWMGqslBuVt4iZ2UDYgvXnEV7pW+cE4Dm56jRZOg7NKV4Ja+kyWWMXHmpHrV
         0gpXFTWq6H3bTFkBSwlpCoHNUynEC7ovEe2N4RpBqFDB03qCp9sZO8PM0/iNbxyOAAtB
         xVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nrFIXok//Li2LqHTdjYg1uQcj9Dw5eZxM/i+HXDwNpg=;
        b=IoYfhxWOpsQAmYLOlcDOO2c6bIVewHuPXcStoTxnxz1SaTHv644kDnCXIHGYXbBPGH
         2Wdi7JuBrFEXxJdkCM9yHP+fyOxS84dUf/RaF73LDUgEFSQ7qM7jyHFHoE8bwJ14hCro
         6O4uKKz/VwZirXwuwr2HmFfrQ+y0rmV0ppu9JkWeP47/A6ggIGkpBWJhmaS53J2cVMC5
         3+ViYJhJ8jtPKde6ItRBz1KZgUJLliouaoBTKxFnZWhclVslspd5Gdxc3sSj5Te+PNs8
         /dZUHTYwWgeahe4ciQBAnp1VeifDxyReUoBIAfdjd94VRqrFglMSJdOs3CarsGPdaGya
         TEjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vm7j28ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3si328965ybm.35.2018.02.09.00.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 00:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vm7j28ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ek4Vj-0001OI-1A
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 03:58:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VT-0001ML-Gs
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 03:58:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VS-0006EA-H2
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 03:58:07 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:39593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VQ-0006CV-5a; Fri, 09 Feb 2018 03:58:04 -0500
Received: by mail-qk0-x244.google.com with SMTP id d72so9098447qkc.6;
	Fri, 09 Feb 2018 00:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nrFIXok//Li2LqHTdjYg1uQcj9Dw5eZxM/i+HXDwNpg=;
	b=Vm7j28ugNMH1QK59A/J4i6fL0hEwZnNEmhigSDdcpAfm5RkggTPcUp+VGa6KwHGElq
	qelk2oSbeiX7Pvg7VcQ9CYSEPZT1NDDKss/a7Wsh8kPHwB8d8ueILxJRs/PkFwUpLdZv
	T90ZgwMx/NjiWE1HMSmvS/yfzoayGhtlFtTxqqwlIi8YnyVCBQJBj7hnmVa4zBjwWRWI
	nmSXap3/KBeHbfgSNY7GlJdRyBehVeVUjEZKyZOjeXX/yBcfanfScxton14fKsfafVAt
	ixHS7e3U/HS6m1HmhZ/1Gsz1vTGg9v6GYRXMx1o7NjP5B7f5oOoVV4Z1AVKKlGfxZ6zQ
	5/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nrFIXok//Li2LqHTdjYg1uQcj9Dw5eZxM/i+HXDwNpg=;
	b=EH3dfRGVjrzgeXj/pMEJCX3/3w0rco6fShySR7BZRNcs31q313V+0PB3OK99HtCrZC
	5ClzXoIvVlP6l4jTggX3Td9nE8V7KMmvjX+LvuqEVw83b7FSp6gjrvewgEgjr1VzsVXO
	2xZAtYlEnQrd0Wq5afGtTI3MwTWb1iRpS/Jp+ZUz401pyygr9XszvoEkk8L7fk2QbWWv
	moFsmtEFvoyrPGz9ndVWLFsl8B58+mduicrlFFl4Ct/AgKWPgypGV9G7jt+SOdFVsCY6
	dJDfElss6szp5NB/wjD8cwHCq2RHoMOWrTpBlkiM/yAkMF4hcJXxJrqezpF+M2RDLHe/
	+RcQ==
X-Gm-Message-State: APf1xPABJQjNQcgQJ8bRodbGQnxHE/pbtQHuin2H720SPqkCeOU4zkRb
	16uswpraFpflAGYSfoP/AK8=
X-Received: by 10.55.64.75 with SMTP id n72mr2888247qka.354.1518166683569;
	Fri, 09 Feb 2018 00:58:03 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	h195sm1363819qke.66.2018.02.09.00.58.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 00:58:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Fri,  9 Feb 2018 05:57:54 -0300
Message-Id: <20180209085755.30414-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209085755.30414-1-f4bug@amsat.org>
References: <20180209085755.30414-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v2 1/2] hw/arm/aspeed: directly map the serial
 device to the system address space
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKZ9uM47LmDP

(qemu) info mtree
 address-space: cpu-memory-0
   0000000000000000-ffffffffffffffff (prio 0, i/o): system
     0000000000000000-0000000007ffffff (prio 0, rom): aspeed.boot_rom
     000000001e600000-000000001e7fffff (prio -1, i/o): aspeed_soc.io
-      000000001e784000-000000001e78401f (prio 0, i/o): serial
     000000001e620000-000000001e6200ff (prio 0, i/o): aspeed.smc.ast2500-fmc
     000000001e630000-000000001e6300ff (prio 0, i/o): aspeed.smc.ast2500-spi1
     [...]
     000000001e720000-000000001e728fff (prio 0, ram): aspeed.sram
     000000001e782000-000000001e782fff (prio 0, i/o): aspeed.timer
+    000000001e784000-000000001e78401f (prio 0, i/o): serial
     000000001e785000-000000001e78501f (prio 0, i/o): aspeed.wdt
     000000001e785020-000000001e78503f (prio 0, i/o): aspeed.wdt

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_soc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c83b7e207b..2a5d041b3b 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -257,7 +257,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
-        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
+        serial_mm_init(get_system_memory(),
+                       ASPEED_SOC_IOMEM_BASE + ASPEED_SOC_UART_5_BASE, 2,
                        uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN);
     }
 
-- 
2.16.1

