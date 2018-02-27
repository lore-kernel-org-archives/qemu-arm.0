Received: by 10.28.71.27 with SMTP id u27csp4681453wma;
        Tue, 27 Feb 2018 02:53:49 -0800 (PST)
X-Google-Smtp-Source: AG47ELvCm4GeAYxgoxhXFToUqU+kTf5SYVgQp8gHmT95rvCnv8vahi0MKmqa1a+pS4FxM/431nWu
X-Received: by 2002:a25:e791:: with SMTP id e139-v6mr9242551ybh.457.1519728829639;
        Tue, 27 Feb 2018 02:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519728829; cv=none;
        d=google.com; s=arc-20160816;
        b=hq7Hr2DAbzrb4RC4my8Ne5bG6yeBAUMUpCE4iSCjqLKJx1rsU2AemtmXdwsQ9Ly3AC
         OpRjgPf4W5TRmNHBudi3jyBCOQcWWll2BkULjIWC+C6JgHkXlrv0aLBKcSKMajUmm4/l
         MtVORqFrHGtJFSmvl9tMHMMQ7SNvVGxHuoQukO7wR/D4u/l+qG4rK5st1M0nusP9cvTV
         h9lC2IxoayVtRbXFesRWrtvejl2zZ+5oGSi5i/5KYS7pqf8e9WYn0WDPUwpkh57JnkUx
         9ivCigoBNozLPQxYjZ8kyxcs3FggBzueMmBJJH1th11zBDGp8JINZ1c8YOIOiOJ9DNw1
         rSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=B3h3ngm0OffOmfESZWBoAmx9C3pRmKhosswAThUpbIU=;
        b=u2b/OK1Re2mp9AAc2Qh6p4Z2ExgKSgLTfZbE8KTkS171wbsGZ6twEYEp9xtO0q4TSD
         irzaaUgsmOPdUb0pI/c1Afchp7X4naQeljtZbgaErULb5xw5CkZbbKbqfjBoYIFjWkWv
         Jwo32klXlNg6q7CKShBjhtPiKUdUXPmSjAK6/Bi6+I8Onxa7hiiziz6FcvkCgNwuZqWb
         rEiVF1c5ns6PL+u6bGRzZZ5ouR/eYyhKeg6PNFvNxp7sWK0gPqI9uAeJwF4qfYI42qvR
         R0S5ImT6gTRWTxHD0CWWMWi/K8/L8e0NMBOrNZUE5sqxQi0/hAKyAJQZSZBIGkV0M+Y5
         oaMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jzIh9rUc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si1813003ywc.206.2018.02.27.02.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jzIh9rUc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqctJ-0001F3-3S
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:53:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcoz-0006Q6-RL
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcow-0004E5-LX
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:49:21 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:45834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcow-0004Dg-DK
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:49:18 -0500
Received: by mail-lf0-x241.google.com with SMTP id x196so26793788lfd.12
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B3h3ngm0OffOmfESZWBoAmx9C3pRmKhosswAThUpbIU=;
	b=jzIh9rUcL3FhJchz31Dvo+GGKt9uVzm1K0LoeoDuq1KtiAAHvn6ypRaWeubj96cP5n
	LJspgHzdxRviIbBEMpzj1vzZKIJCY8W/9tJy8PPFAlHj5pqToK8u3oZii6M98mxCkAC2
	BCaruBWdnqUz9/W2sJy7NtQ2Qf1unMYl2136Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B3h3ngm0OffOmfESZWBoAmx9C3pRmKhosswAThUpbIU=;
	b=dJ+cj1i4Q5Hk6E9fMh1TQe4lr06FKEWz8nWJeWg12Df9a5ymozWcEfVMh8rkyOBIDe
	4xemlpIoV3djGPaFU8G9fL5rL//Z8O41RCoYb+L9nAb//JHq9MBFhjb3Fyt9YtoYWYWG
	4hUTMdSVGYQWhPpHLrlMQ+IqF/Yi6TDpZj/RENOn5zmwb1Ty/TfnEyHmktYlhVia3ESs
	I5PVZgC5DHbDfltH5fK8FQhhKXTuMFmw6a2E6QQRblDLn1lVvhz2DZrCs4+JzctU5Ntu
	QQgDuUfVFPceSNEJ7dS8ImJZx61dcgsVX8K64gI/N6GQPmfvxkWXvgOlqezbXUmAm1HC
	Ao1Q==
X-Gm-Message-State: APf1xPAS2fEQn+K2N+wntuD7TYERj09O+Rsd9XXCZ7FMT9bsTTxHUS1C
	Nc2G9u51FHKazR4AjHX1RlEdEw==
X-Received: by 10.46.23.68 with SMTP id l65mr9791189lje.56.1519728557120;
	Tue, 27 Feb 2018 02:49:17 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
	by smtp.gmail.com with ESMTPSA id 74sm2484148ljq.32.2018.02.27.02.49.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 02:49:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 11:49:03 +0100
Message-Id: <20180227104903.21353-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227104903.21353-1-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-arm] [PATCH 5/5] arm/vexpress: Add proper display connector
 emulation
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
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FMAHj8pc7nj

This adds the SiI9022 and EDID I2C devices to the ARM Versatile
Express machine, and selects the two I2C devices necessary in the
arm-softmmy.mak configuration so everything will build smoothly.

I am implementing proper handling of the graphics in the Linux
kernel and adding proper emulation of SiI9022 and EDID makes the
driver probe as nicely as before, retrieveing the resolutions
supported by the "QEMU monitor" and overall just working nice.

The assignment of the SiI9022 at address 0x39 and the EDID
DDC I2C at address 0x50 is not strictly correct: the DDC I2C
is there all the time but in the actual component it only
appears once activated inside the SiI9022, so ideally it should
be added and removed to the bus by the SiI9022. However for this
purpose it works fine to just have it around.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Only add the SII9022 now that it will by itself realize
  the DDCI2C as part of the bridge.
---
 default-configs/arm-softmmu.mak | 2 ++
 hw/arm/vexpress.c               | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ca34cf446242..54f855d07206 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -21,6 +21,8 @@ CONFIG_STELLARIS_INPUT=y
 CONFIG_STELLARIS_ENET=y
 CONFIG_SSD0303=y
 CONFIG_SSD0323=y
+CONFIG_DDC=y
+CONFIG_SII9022=y
 CONFIG_ADS7846=y
 CONFIG_MAX111X=y
 CONFIG_SSI=y
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index dc5928ae1ab5..9fad79177a19 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -29,6 +29,7 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
 #include "hw/devices.h"
+#include "hw/i2c/i2c.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -537,6 +538,7 @@ static void vexpress_common_init(MachineState *machine)
     uint32_t sys_id;
     DriveInfo *dinfo;
     pflash_t *pflash0;
+    I2CBus *i2c;
     ram_addr_t vram_size, sram_size;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *vram = g_new(MemoryRegion, 1);
@@ -628,7 +630,9 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
     sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
 
-    /* VE_SERIALDVI: not modelled */
+    dev = sysbus_create_simple("versatile_i2c", map[VE_SERIALDVI], NULL);
+    i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
+    i2c_create_slave(i2c, "sii9022", 0x39);
 
     sysbus_create_simple("pl031", map[VE_RTC], pic[4]); /* RTC */
 
-- 
2.14.3

