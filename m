Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4244890lfi;
        Mon, 6 Apr 2020 10:57:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmj0c3yfyPT4QY/8kgUzMjb4KpZl0fyUKddfSuu+sBPfPCGRCWIjlrYCMkX6ukwbB+KMWS
X-Received: by 2002:aed:37c3:: with SMTP id j61mr685681qtb.284.1586195865311;
        Mon, 06 Apr 2020 10:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195865; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPyjfcpdOcKCW3xzV0+CUsN7Sl9YwoXxrYsYFHtDvu07uhYG1A3Aj0D6R/XyP9QD+K
         1dAhbV5TN1B8UaRuwansiZC3YjKFW1DfXdp6tcm4T2eld1cLhus3ZZyWWaTqGz2oNBsl
         DQOZiiN8OSW6t9Tg/sCZ+FAs88QHLLH59VxmGTFygfHkh9fO/eh8E0x7Y4+G/3J0xqMo
         QUB8zJ0oENdsKKS+lMsN8dSI07GGGBFtnoR83tznv9E+0nTiUteEBgvm5DQks2ohEDEn
         4oJOhDyqtwUNk1QMkI6R2L12IPHbnyVKNs+hbaGbYTbLbQhLFsuNdztoxOXUrmM6x63x
         4zgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ACqwWM6q3w6eeeLf6eS/r0Fpb4qEkaBMb1O9yAVXZQo=;
        b=kxun8jXJX7yf+jVSIihgBXH7xXZIUOuG/MT+MnDXGxCFRKdbf8BX03WQegOBlQMQ1H
         vwAw5D9rODnWZ767JwrGjca+AnHroa/n0643fShoZypd35JRu5d4iaFjrzeKXpgF+lL5
         iFi1BWFynizJbEWXvG4PcdeaHhFJWr9t2AsaAslofuEGnQBvroaUewpKuHetXjdJmwnS
         z49k2jpOf9LF8pQBC/nicTchapLluFz8y8oL92483ZIWVR0BJsVap4ixJnD6RRe8fYIq
         Sn5OgJCroj5Z8MZj2OxAhnUXrz/3jzH+pbFZGHEcXiqZCK/yRmFMD1V3T5J0j8y7PKaX
         wx/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YnlBvtsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26si178968qtn.284.2020.04.06.10.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YnlBvtsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLW0G-00031E-Ny
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr6-00022W-4f
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr5-0002qU-0u
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqu-0001x3-2H; Mon, 06 Apr 2020 13:48:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s8so485999wrt.7;
 Mon, 06 Apr 2020 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACqwWM6q3w6eeeLf6eS/r0Fpb4qEkaBMb1O9yAVXZQo=;
 b=YnlBvtszUzDdb+icZKReBOOOFv0y6kc3QKAP+hS9DENTtSQ52gd5dGpP83znPnHzcA
 uV6RdSFmkila64rigN1j+TaMTrTjwErg9MX7TL2DhlnXV0tB8V/GXKMABWy0yQTJ6UIT
 pFMj2U1J7EsZXj5pwii6wtZab5Xd5LeWhU8BuyXH+rtBimXkg4wci7ZpXn83xwyVSTqa
 wmjBFsgXTjlrPsGl36usaWNEQ/CmFdWf/wH9ctIB4T+g6qBkmi+5WqS6rAqYO0lROSci
 4i8rrGmZar8XKfhxF2J5pq91RELY3N9yEpsGZdEpYv1Hkb/v47LKRp2UeHIIw/qxYZwY
 j2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ACqwWM6q3w6eeeLf6eS/r0Fpb4qEkaBMb1O9yAVXZQo=;
 b=mlIdxf819pS+HLG60OApjJWtvpHvIXw2H6mqCstqZoZpTN08Js5WrVYLT8pEYVSfNW
 V9+layNmeKLJzTX3mLlPbAE1Rxc/b+daomCuDfWN3gkyedU4lOi9QUu4T0vw4tqrBo5B
 Wjk7/g5+XoJFTRaLjXYtqrN+sA3NhUmwQKhz+6YRSOSAIwj9eePC1u6UOwLd8sVxojX7
 4NrbZuzEE9FIojCoQBkdLwC9mmIGYowVVqik9zHYwZgMnJpdlqqI2q8eni6MlSintzU7
 kfbAlyUN+fpl/CnWH/rVUio2+kJCCm52YghBnmrB4VVOqbW0qJCWnjYDm1W3ydTmG0UK
 7v/w==
X-Gm-Message-State: AGi0PubA+IQoIIq6MDemv9tqhjJRsnFkrOIdIC9qczk0aVTU0BC1+ZCN
 lSn4pEkZAkWcjfcBHPZtpQh3CMLCuro=
X-Received: by 2002:a5d:4649:: with SMTP id j9mr371222wrs.71.1586195282744;
 Mon, 06 Apr 2020 10:48:02 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 12/54] hw/arm/stm32f205_soc: Store MemoryRegion in
 STM32F205State
Date: Mon,  6 Apr 2020 19:47:01 +0200
Message-Id: <20200406174743.16956-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I8e4RaLfjlso

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/stm32f205_soc.c
  >>> possible moves from stm32f205_soc_initfn() to stm32f205_soc_realize() in ./hw/arm/stm32f205_soc.c:83

While reviewing we notice storing the MemoryRegion in the device
state, we'll be able to later automatically simplify the error
propagation calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/stm32f205_soc.h |  4 ++++
 hw/arm/stm32f205_soc.c         | 18 +++++++-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 922a733f88..63e7e7c825 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -56,6 +56,10 @@ typedef struct STM32F205State {
 
     ARMv7MState armv7m;
 
+    MemoryRegion sram;
+    MemoryRegion flash;
+    MemoryRegion flash_alias;
+
     STM32F2XXSyscfgState syscfg;
     STM32F2XXUsartState usart[STM_NUM_USARTS];
     STM32F2XXTimerState timer[STM_NUM_TIMERS];
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 118c342559..42f4e44134 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -87,23 +87,19 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     SysBusDevice *busdev;
     Error *err = NULL;
     int i;
-
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flash = g_new(MemoryRegion, 1);
-    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
 
-    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
+    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
                            FLASH_SIZE, &error_fatal);
-    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
-                             "STM32F205.flash.alias", flash, 0, FLASH_SIZE);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "STM32F205.flash.alias", &s->flash, 0, FLASH_SIZE);
 
-    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
-    memory_region_add_subregion(system_memory, 0, flash_alias);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
+    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
 
-    memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
+    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
-- 
2.21.1

