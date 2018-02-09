Received: by 10.28.71.27 with SMTP id u27csp660254wma;
        Fri, 9 Feb 2018 01:01:09 -0800 (PST)
X-Google-Smtp-Source: AH8x224KfPp6+C2x22Ks9da1pLB4ywsXDhLV60+APNmE+g31mZVcMDo6zcPCX21c5WauBBdLYSgZ
X-Received: by 10.37.208.143 with SMTP id h137mr1200726ybg.285.1518166869558;
        Fri, 09 Feb 2018 01:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518166869; cv=none;
        d=google.com; s=arc-20160816;
        b=mBf2gyxPq+1ghomXu8lcu1xFng67yDd7onqMWC/nmn7ROBwNtFYUkkBxBpUH0roPu5
         beFldo2rpB7x3ahgaQa4efHMuEFbBzq2aS77SeBGGrh+OnuMFUaZrSlkccNtB3a87GTS
         KLDT02RDk2j5GBSMNZ+13wZTOJF2QXDKo5Phjr01OplJqdYpTyhgND2PNgU30EBFJNOi
         xpJzyUz0OA3laJDO9xt9enHBKTGlzHmtsv410yXXQiZYdNg2ZcNNdHbFxP0FDaXZCc25
         XTRMT9mAjGRmehp+maMMzLsU5YdIQQ5vM9ELnPhiowOEUkqW/z8vNjnTruD6eLMOpbZt
         U0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RK/O25PVdwZHeI48ZBu1+HFj1jnQmG+BwE+y0cMoJi0=;
        b=Ps0ObWRo4hwptnUZdBPq7LGjIZGAkEF2Jnzi7ATV6YrH9AL37w/9tN8KWS2/zUJJbg
         +jB4Q55ItgTtXXgnTLWbce0FYrowLxn+CZOCrhA52CUQNlosdK1NW8MuxAusTws8larZ
         ro3iIIwRlE0HDgoeg/xYichEFx905Z8WydXBJPUoyI9yasM4O7bzw9BdaWKTn8Bwv13j
         ZO8wx51G9KeVV4KRewsfM5xzDybk63fVx5+1xbUulV9xgFL0gMtH/BmAUcY8dpfmXeQp
         RcV7zW6gZHdXVd1Hp+cuPTlKuMJvjdoDWXJ9Ipz0kBfkv5eUIm/iliQMBC8v4S156Evn
         A8dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e6k70lOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si73352ywe.600.2018.02.09.01.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 01:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e6k70lOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ek4YO-0003cj-VM
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 04:01:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VW-0001PB-4v
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 03:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VV-0006Ib-84
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 03:58:10 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43178)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VS-0006ER-UX; Fri, 09 Feb 2018 03:58:07 -0500
Received: by mail-qt0-x243.google.com with SMTP id m11so9650998qtn.10;
	Fri, 09 Feb 2018 00:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RK/O25PVdwZHeI48ZBu1+HFj1jnQmG+BwE+y0cMoJi0=;
	b=e6k70lOWnZS7Tl2VfJ/cGNcgw/ENGgQjvL7/7vLzxvv0UIuVdb9HgY947OAmlDefL/
	26JstlPnG1Ok8Nai0x7XJ6vY5ZA6jaiJE4POWNaRQ0eB3COWGHJwGg8KGu4ql5cxld1r
	IRC/vQs19hdKR6V1yON4oIW6Ti2QdJhvwPEzbw3AIQClrwutFwyWYrPrA4W+KmQFi9RH
	pVGLQ9LUS0zina/1SOCoYvsxTxV2E4IPtrQvFQ0GUS+fP86c68/bup3TR7/KkSQ4ED6m
	Kti6O2xhYnI9Qc8BegGGhUQKYdecPKpQFG5Dvvhsyld6y24CoTxB27gmGarcL2Pimh+W
	CrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RK/O25PVdwZHeI48ZBu1+HFj1jnQmG+BwE+y0cMoJi0=;
	b=KXO7KXeD3xhmuyfAWeH3K/RCBaTNszlOD7oY1/TTV7S/4UzaQTdB0Bq1whhgCI+C1X
	xwQXcd4ty6AbXm2dCdPOWQhtoi0LXqCfMCh4VQAiOfDdb8SV7wPagqcKgoiKHihAlxav
	F09w2cRsDpP44S9D5xjbBhVyxcnIKq2spRZMYqgRPnnOCiJme5xa6TviDWdZACe/6Da0
	lUqkZf6FePLdJpbemxWs+a395ayes0oBRtwCW9XRSqEvpAQFAwtLX8k/rc93NM+b0CTY
	TVuKvHv7lR4uZwOVdI3FkLPJQEL7Se4dZUK+y3YcM5wHnjgngKXbwExA8CUQkDkEZdpW
	bptw==
X-Gm-Message-State: APf1xPDvlHX4sw9sInHnNNO7g0/isPAtm3fV8+h9ao4bdBhjC7oL+tco
	8EUKab+z833IgZSb0HPnvmI=
X-Received: by 10.200.3.29 with SMTP id q29mr3175801qtg.173.1518166686279;
	Fri, 09 Feb 2018 00:58:06 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	h195sm1363819qke.66.2018.02.09.00.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 00:58:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Fri,  9 Feb 2018 05:57:55 -0300
Message-Id: <20180209085755.30414-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209085755.30414-1-f4bug@amsat.org>
References: <20180209085755.30414-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v2 2/2] hw/arm/aspeed: simplify using the
 'unimplemented device' for aspeed_soc.io
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
X-TUID: iyqL4UDVvlKu

(qemu) info mtree
 address-space: cpu-memory-0
   0000000000000000-ffffffffffffffff (prio 0, i/o): system
     0000000000000000-0000000007ffffff (prio 0, rom): aspeed.boot_rom
-    000000001e600000-000000001e7fffff (prio -1, i/o): aspeed_soc.io
+    000000001e600000-000000001e7fffff (prio -1000, i/o): aspeed_soc.io
     000000001e620000-000000001e6200ff (prio 0, i/o): aspeed.smc.ast2500-fmc
     000000001e630000-000000001e6300ff (prio 0, i/o): aspeed.smc.ast2500-spi1
     000000001e631000-000000001e6310ff (prio 0, i/o): aspeed.smc.ast2500-spi2

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  1 -
 hw/arm/aspeed_soc.c         | 32 +++-----------------------------
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f26914a2b9..11ec0179db 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -31,7 +31,6 @@ typedef struct AspeedSoCState {
 
     /*< public >*/
     ARMCPU cpu;
-    MemoryRegion iomem;
     MemoryRegion sram;
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2a5d041b3b..30d25f8b06 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -15,6 +15,7 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
+#include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
 #include "qemu/log.h"
@@ -99,31 +100,6 @@ static const AspeedSoCInfo aspeed_socs[] = {
     },
 };
 
-/*
- * IO handlers: simply catch any reads/writes to IO addresses that aren't
- * handled by a device mapping.
- */
-
-static uint64_t aspeed_soc_io_read(void *p, hwaddr offset, unsigned size)
-{
-    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
-                  __func__, offset, size);
-    return 0;
-}
-
-static void aspeed_soc_io_write(void *opaque, hwaddr offset, uint64_t value,
-                unsigned size)
-{
-    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
-                  __func__, offset, value, size);
-}
-
-static const MemoryRegionOps aspeed_soc_io_ops = {
-    .read = aspeed_soc_io_read,
-    .write = aspeed_soc_io_write,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
-
 static void aspeed_soc_init(Object *obj)
 {
     AspeedSoCState *s = ASPEED_SOC(obj);
@@ -199,10 +175,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     Error *err = NULL, *local_err = NULL;
 
     /* IO space */
-    memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
-            "aspeed_soc.io", ASPEED_SOC_IOMEM_SIZE);
-    memory_region_add_subregion_overlap(get_system_memory(),
-                                        ASPEED_SOC_IOMEM_BASE, &s->iomem, -1);
+    create_unimplemented_device("aspeed_soc.io",
+                                ASPEED_SOC_IOMEM_BASE, ASPEED_SOC_IOMEM_SIZE);
 
     /* CPU */
     object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
-- 
2.16.1

