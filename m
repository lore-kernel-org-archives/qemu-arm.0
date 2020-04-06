Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4240951lfi;
        Mon, 6 Apr 2020 10:53:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKSFUrf+z8IOleoJmxdEfkE2x52ktLRp9B2z1Fnk9m3k+VJXQF5tFCh5nmlakpJK0VyLN28
X-Received: by 2002:a37:dd8:: with SMTP id 207mr12057224qkn.418.1586195600390;
        Mon, 06 Apr 2020 10:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195600; cv=none;
        d=google.com; s=arc-20160816;
        b=mqTwUgl0xJoGgsykIBJlSsrAsQFYfrMjhizR46vdPIPGBoWSaMLbIMNgGxPGeODJu9
         c2hX0SZ5ip4u6fUqYL8brztXxn3JKW+miAbZMpHG07MJ4L+iYZEsiUfurk3L8D7Ai9rS
         70AfxXn5CzPMLKRMrLJTtqT5SssklCA85TH+th4kG4IEPEibanRPEvh3B9rCjFS61Fe0
         ClOP9CWSHVtReRtWO0KNLHTUOhr0IrRdKzUWgDGs1Wldpm/hjvsdg8YaVHWJ3O/n4xGR
         6rbupCEnBuxH6j0CLkI3RkCfO8vyA6apLMAS+6Zhij1eYN1CESk2x+QdmDRCz/TqTRUk
         /hwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Mu58XTLOEJ0Z47s7hq7QXuE41EW+M1RFpApzokyZC4I=;
        b=ovDkhwnqjBSZbM+9tdU9HTpaKvvgBk8bqOPBrdbtD/aTU6G6VnzOyEz9eDIeALNP79
         JVZ3PWcr/7LdPs0P4vQR9AFHVmatB0Ypx2Ml7sfFFTEt3ogVUTzkMx7nr5NzvG2bc2a+
         WM9/L58ANa2e/jY1T9M208CHeJp9qIIF4TaxgE4e0pwQpnlrmNXsVv5LVpN3/ZSS/iBJ
         AfFZ0FFkzKrXxol28C2zHxcpZa0s/N/t0/OaKXUFqldOaSS8BMyTWinja3l8hwVUSuWi
         w6WrmgJ5GsRzbRTCNrWGgyTUijXRMQk7ZdTp0SFy0qDdcW64+UjHAChDLTHWgjkdtVOy
         jxmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nRVqn9rk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21si183039qte.81.2020.04.06.10.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nRVqn9rk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVvz-0002WH-Ot
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqw-0001lK-M1
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqv-00028x-Cn
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqv-00024c-64; Mon, 06 Apr 2020 13:48:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a25so547823wrd.0;
 Mon, 06 Apr 2020 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mu58XTLOEJ0Z47s7hq7QXuE41EW+M1RFpApzokyZC4I=;
 b=nRVqn9rkGY7U3g7uXtJxo3Ar8zpVQrPkPVzPL5BjnksUoMsou+q371pwhRqztVa00v
 mbk8xcP9BmLacWNgj2VMmfXVedPUTBUL8T6+UIzAQ1vjTD4653JY4OtG0h4qx7UeqLrV
 TKWUP+GTIfdU46cSfkEk/2GCDD3vmBL7lUNhUs+eC4yUXnUPnPaS6HeBv1/dNWJTQwIv
 IA5vD8kNjGlQJVApU2jrXpFNgMH3eCdRK7GwL2II9bf3Tn5sjx9lYf3FyM9E/acxuZaG
 KdJ4Ns7bT/YdM7g0N4uwtKuGD1JGZba+PJ/Amcdf1Jq91bUPZadcQY2dIY8MhSqRyWZP
 jtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mu58XTLOEJ0Z47s7hq7QXuE41EW+M1RFpApzokyZC4I=;
 b=T3bD1f5CpiboCWKbE9YoZ6AJcBzvnpOxhtGuJIG2GT+DP7l2fUlAyPRIAStnajPMqu
 BXly7Ti0eroWquUCex2r40Cy7V8qmxas/GyY/DhU2l3SUTfomnFBW6qDGf7pro07iI7R
 6Lql6zdaoLu5pnFV4BF/2Ge88iuSlYIqPSM0vOl+QaoqOLSE8PYv8fq+tKF5A91JUuez
 uhQ/StlzZnjmGdevF4K90KeIzH/hZbX11/bt3DwPzDWTa+vQ5qLGIooRid6lhqALe14+
 FiiAlBBjJpuGPUZWdgAO3Yu50BWSkE62TsNliSFQMY87oaRj5kX8103NpISE2NBY66AX
 xoxw==
X-Gm-Message-State: AGi0PuaVQwCnW5dnEVajjxzL7ESb+11M3LRvEkkKwnpcio618zvaj90M
 zOAuLjgdthKI9+0Br7Ocu9N4Ivxh5l4=
X-Received: by 2002:adf:a548:: with SMTP id j8mr322240wrb.331.1586195283915;
 Mon, 06 Apr 2020 10:48:03 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 13/54] hw/arm/stm32f205_soc: Move some code from
 realize() to init()
Date: Mon,  6 Apr 2020 19:47:02 +0200
Message-Id: <20200406174743.16956-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 76Zbo4UFSF7m

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/stm32f205_soc.c
  >>> possible moves from stm32f205_soc_initfn() to stm32f205_soc_realize() in ./hw/arm/stm32f205_soc.c:83

Move the calls using &error_fatal which don't depend of input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stm32f205_soc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 42f4e44134..76b0b0e9be 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -49,6 +49,7 @@ static const int spi_irq[STM_NUM_SPIS] = {35, 36, 51};
 static void stm32f205_soc_initfn(Object *obj)
 {
     STM32F205State *s = STM32F205_SOC(obj);
+    MemoryRegion *system_memory = get_system_memory();
     int i;
 
     sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
@@ -78,6 +79,14 @@ static void stm32f205_soc_initfn(Object *obj)
         sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
                               TYPE_STM32F2XX_SPI);
     }
+
+    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
+
+    memory_region_init_rom(&s->flash, obj, "STM32F205.flash",
+                           FLASH_SIZE, &error_fatal);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
 }
 
 static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -87,19 +96,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     SysBusDevice *busdev;
     Error *err = NULL;
     int i;
-    MemoryRegion *system_memory = get_system_memory();
 
-    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
-                           FLASH_SIZE, &error_fatal);
     memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
                              "STM32F205.flash.alias", &s->flash, 0, FLASH_SIZE);
-
-    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
-    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
-
-    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
-                           &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
+    memory_region_add_subregion(get_system_memory(), 0, &s->flash_alias);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
-- 
2.21.1

