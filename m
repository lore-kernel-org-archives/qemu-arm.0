Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp663282wrt;
        Fri, 4 Jan 2019 06:30:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UuDUmoRYPffWjNIWHEUGmToPax/6l+gOzFTkrNVDdjUhqI9pPYWMgR7otaYjlhCe8nI/49
X-Received: by 2002:ac8:2e22:: with SMTP id r31mr50308825qta.333.1546612210438;
        Fri, 04 Jan 2019 06:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546612210; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTmXrbvvjB2eloNsp3wlRe4+hLW0Do1vgGHH+gpYHVQNfxjPTq7AMq75cFhlNxuXGW
         p6AZmxCK1WtqVbLz/rEyUTePwTXSKZuCGGYw2EDEyzQbaSlM+7qmYj6Hu6tOSex33xeh
         sVfPdVugyTQ+m3oACtJPcXQJsCIIpuwW71wYStj0ZG6bnyNflx3eQZ6pJ7B7PTJfxys4
         RLRuGf2T2pYU208OvdqePMWXMmb6nTfPFM8k61VeQm0rv/eUs5E8FAGZ54PEFutar3WX
         WpGPPfCVDmi+YuQXAcw/4xRviuqyLxAbt6fnELdfiwaeItY/wnO/ip37AsWmd8c+apXi
         8IJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=wF4jYv/17JG7Y3uVgw97u+TNgjPpE3Mix30t4w9F8v0=;
        b=andkwUy6s6eeQXQmr5opLIUKkc2xxeMyYNMwgXolB+ryV/c4B+3qK0qUg28CCocY5a
         AqHsULtiubyXQ0IJwR0I55l7pBYVv70oWV+M4R+zto7ZJMvPJNqvvHhGu0NpR6n1qAup
         +ea4jmsx0fSWZQVqfHaFvLX7ibMDIML/kpLua+hLPYC1N6PZSJ9UyKc+GW/zxdpH6+LW
         lk4N5JGLYmBtoVZFy+18eEM1p4oSHk4VG5FILEQ3jlnc4VF0GbmNCzasiQakDieejBOI
         HTbmRH/Ajfr4uKFYInS5QCF7/Ez24NRfEaQMPEsW0BXtloW8UAGGeDcBJ3DXjOLCslfM
         iQVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hr2cv8JM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s34si3398468qtb.17.2019.01.04.06.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:30:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hr2cv8JM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQUD-00012V-UY
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:30:09 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gfQTa-00011D-CZ
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:29:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gfQTV-0001LQ-5i
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:29:30 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gfQTU-0001Kn-VT; Fri, 04 Jan 2019 09:29:25 -0500
Received: by mail-wr1-x444.google.com with SMTP id t27so36760591wra.6;
	Fri, 04 Jan 2019 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wF4jYv/17JG7Y3uVgw97u+TNgjPpE3Mix30t4w9F8v0=;
	b=hr2cv8JM+t+l1ANVXTVGKVlLkdIIeLyT077XEh6rfI+7YBZxZGCevrluTtmtIFQ9Un
	GknhcvZIg4w0ogtVbW9GcMT4cmr87QRkPb3j7Pa1HJ2saD/84AmN9tqtFq9YuMbSX+Rm
	SN6cFPvbQCbKrIqpfPaUbwN+b6TmEplkxR7wey4i4cP+gd2Z2z/4pW/7m3bhZdRAu0AO
	q8j7zRlBeWIgX59T87eTny3mynnB7Y/fKmC4dMbm0VgcybUrVbpo309cQSvJhOQKBSFa
	TrqX9jL1yzk7zJp5y4NSAA2wkbud2MoVE+PgTrVjHT87jIHhlYccHf48IvBP+nNIGnx9
	we/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=wF4jYv/17JG7Y3uVgw97u+TNgjPpE3Mix30t4w9F8v0=;
	b=IOvz3CMDp6fzPnVyVYFFhG992f7M6VCbLzVL7uwDCxMuTt8ngfd+wXxtiRoMOvjlqT
	wrbovqGPPIoee7Bu1n0uvKD2D30bCqqVmzJCk1ZbojtHfy1KRVHKxWOKlJKRqmK8nJuC
	DF7fyjMZBecKEWQoxqbE65ewwNRT+UTHvK4P94qRvNT5hxTxE/idBdX+v8a5PAjvego1
	bsYRaB4jNZK0/cN/AVFfIGqpvSWw5bQLVbjPGDQwUx4ld96jzCHREo5NFkyWEj7ClES8
	sardlp7/dNtHze/9Nzt8pXXdblc+D73AxUEkTMDMInYvEbrLyWQzBADWjSGYm1gZQ361
	R+MQ==
X-Gm-Message-State: AJcUukdwTrBx3VMxf0XwwWzUZq+9tV4VYl+b3R1B8tJ2FFQamLwSf9ZF
	RRTbK0Pjfahdc6RZHbElSDXYI5vj
X-Received: by 2002:adf:9422:: with SMTP id 31mr47326171wrq.106.1546612163153; 
	Fri, 04 Jan 2019 06:29:23 -0800 (PST)
Received: from x1.local (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	z7sm46278401wrw.22.2019.01.04.06.29.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 06:29:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 Jan 2019 15:29:21 +0100
Message-Id: <20190104142921.878-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v2] hw/arm/allwinner-a10: Add the 'A' SRAM and
 the SRAM controller
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Charlie Smurthwaite <charlie@atech.media>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VLJyUQzYw0Mo

From the "A10 User Manual V1.20" p.29: "3.2. Memory Mapping" and:

 7. System Control
  7.1. Overview

  A10 embeds a high-speed SRAM which has been split into five segments.
  See detailed memory mapping in following table:

  Area          Address        Size (Bytes)
   A1    0x00000000-0x00003FFF 16K
   A2    0x00004000-0x00007FFF 16K
   A3    0x00008000-0x0000B3FF 13K
   A4    0x0000B400-0x0000BFFF  3K

Since for emulation purpose we don't need the segmentations, we simply define
the 'A' area as a single 48KB SRAM.

We don't implement the following others areas:
- 'B': 'Secure RAM' (64K),
- 'C': Debug/ISP SRAM
- 'D': USB SRAM

(qemu) info mtree
address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000000000bfff (prio 0, ram): sram A
    0000000001c00000-0000000001c00fff (prio -1000, i/o): a10-sram-ctrl
    0000000001c0b000-0000000001c0bfff (prio 0, i/o): aw_emac
    0000000001c18000-0000000001c18fff (prio 0, i/o): ahci
      0000000001c18080-0000000001c180ff (prio 0, i/o): allwinner-ahci
    0000000001c20400-0000000001c207ff (prio 0, i/o): allwinner-a10-pic
    0000000001c20c00-0000000001c20fff (prio 0, i/o): allwinner-A10-timer
    0000000001c28000-0000000001c2801f (prio 0, i/o): serial
    0000000040000000-0000000047ffffff (prio 0, ram): cubieboard.ram

Reported-by: Charlie Smurthwaite <charlie@atech.media>
Tested-by: Charlie Smurthwaite <charlie@atech.media>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Set owner=SoC in memory_region_init_ram() to avoid leak
    when SoC is destroyed (Peter Maydell)
---
 include/hw/arm/allwinner-a10.h | 1 +
 hw/arm/allwinner-a10.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index efb8fc8123..389e128d0f 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -35,6 +35,7 @@ typedef struct AwA10State {
     AwA10PICState intc;
     AwEmacState emac;
     AllwinnerAHCIState sata;
+    MemoryRegion sram_a;
 } AwA10State;
 
 #define ALLWINNER_H_
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 9fe875cdb5..df0d079ad0 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -22,6 +22,7 @@
 #include "hw/sysbus.h"
 #include "hw/devices.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/misc/unimp.h"
 
 static void aw_a10_init(Object *obj)
 {
@@ -85,6 +86,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(sysbusdev, 4, s->irq[67]);
     sysbus_connect_irq(sysbusdev, 5, s->irq[68]);
 
+    memory_region_init_ram(&s->sram_a, OBJECT(dev), "sram A", 48 * KiB,
+                           &error_fatal);
+    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
+    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
+
     /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
-- 
2.19.1

