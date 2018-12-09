Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2850077wrt;
        Sun, 9 Dec 2018 11:38:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U9k5ZdlW1Rz1jwI0rDEXB+AgJeaEWjw7F63V9F7aFQcjyw4nSfMqqTrSlHjKieAABJsmdt
X-Received: by 2002:ac8:164a:: with SMTP id x10mr9691085qtk.67.1544384292997;
        Sun, 09 Dec 2018 11:38:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544384292; cv=none;
        d=google.com; s=arc-20160816;
        b=dl53dv7LQQ6HcSzd7mKyxOm+1qQJ3Tq0gjOvEbr7aKoJs9+askHq45ghSC7Q9L89se
         aXTUJ46itbgHXHA6CcZ4c+LzPc+SSp3Mqy5JvE6spYQZTQj00RkP+qVFJzpLiX14eZ/h
         lcfMLBYnBnGBU14QwUA+0dmz4fmaaDyu5QjUd4X/eys5CIORmPKi1LjrvjlE/v9q6C/k
         0W5Ftlc5fPvhX7byH/V+gRzG0umPm14eGUzrK6NF1Eat7ut3iY5iYKhbKgAMNhwgV2i5
         FIcSZUpsK5vKy5/NEpfp8ff/ZtYbHtfGD97U+wqccos5GI6G3JS0jTJuyjK6GX5zliyn
         PzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=n3VUfFZCypUWEo5ApDoz2AmNCqEt2SRisr211rzgw6Y=;
        b=E/FClFHpJUrf7jTChOLnwo5Ux6wkKBEs2wSMgm+Vk85AwumS2qB6G/YvysIdjCfkn6
         r4xOMsGlObAeRj3iuYiWebUw5ta1cTlWB1kuJ8inflNG87pw2gLVyANEWgETPnpZhwJ2
         Z8R8783KIeQwgysJ1MWmizuP3xxGbVaoYoVDtoHfrvvqs6mYQwn5dTCpbTmE5A3LtQXq
         p6hubrx/l0zBjuXmdz74h8n6qxrNMzGIgTGuEqhvoaQQ/814gfG2ZaLNwqhX65Y6GidH
         J2ES9fVCKMxFuES0mwxcGVH0c0AlZcF0NIacktPPt0A16my1JhEmRVX8f5YqTxkSu5RU
         zLSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kkwGNBrq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1si1788357qvk.102.2018.12.09.11.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Dec 2018 11:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kkwGNBrq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gW4u4-00009G-GK
	for alex.bennee@linaro.org; Sun, 09 Dec 2018 14:38:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gW4tt-0008PR-Oc
	for qemu-arm@nongnu.org; Sun, 09 Dec 2018 14:38:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gW4ts-0004dF-QA
	for qemu-arm@nongnu.org; Sun, 09 Dec 2018 14:38:01 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gW4tm-0004GY-EI; Sun, 09 Dec 2018 14:37:54 -0500
Received: by mail-wm1-x342.google.com with SMTP id m22so9140639wml.3;
	Sun, 09 Dec 2018 11:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n3VUfFZCypUWEo5ApDoz2AmNCqEt2SRisr211rzgw6Y=;
	b=kkwGNBrqSa8m48rPo5pXsGt2l2fuy4XUZm7P0AtvoaB3ngES+sV1reVqG7GCR8n4ca
	AKgffgQKVy3gpI3zFhRixz76qH+j30jJIQxyYh7LXghjIK8YVFGlZFj/d7ZIrJlzEQH6
	HDl7ILBkdU028i2d05mZ/hYMhHeKyXXesBaMy+rAAPLwT9niGNmuhHK4ttmqJEz69yyE
	I92YuHUDEuiOH8PgbpcblTBWyhipvduUBBNe3oN7wMgrUT0pBLRCdphOnr1zYuA/OaeF
	leLGq4MvJ4Wok4NY+7jQGfTZHp2BZ7k9SVaPTx61UBsFJb/TWVrBdV9FqvN3nwGssZLz
	225w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=n3VUfFZCypUWEo5ApDoz2AmNCqEt2SRisr211rzgw6Y=;
	b=Piu2GNpJ8LHqTwdaebmyqfo2elpjTz1AFaGkpchMxEXM7XezG6LRBsmiz07+r0bsJa
	T4l2mc3gi1OlcVTPl6ZTCy+iD31vCAFbj04T8bcUTrEiTsXAjOGWyXYeF2I5hgTbVrOV
	PtLqASucuRsgETVjH9us7P4hikWiQVpX+Sio6CIpdaAlyIO0Isva3PvefOD2NjuyYp+A
	4ksebs55r26+16nuyjc2MI1gu2NzOswCzuR/FclQlRqOxrPbKwtL34qZfwszKTOO4VS+
	oU05c9h22yJqYsne581NZYSKTUu+gJg8jU616R+NDe0aHiUdB91KQAARdGL1697pA3cP
	mdOg==
X-Gm-Message-State: AA+aEWZyAiM6fRtd2mjeg78Sk2g0vx9oLTFX+fwBpkJCsaNcDrDH4qI+
	nCS1cCX7oQ6wP0a+PEwelhY=
X-Received: by 2002:a1c:68d7:: with SMTP id d206mr7968464wmc.43.1544384273193; 
	Sun, 09 Dec 2018 11:37:53 -0800 (PST)
Received: from x1.local (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	r76-v6sm10574641wmb.21.2018.12.09.11.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Dec 2018 11:37:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Charlie Smurthwaite <charlie@atech.media>
Date: Sun,  9 Dec 2018 20:37:42 +0100
Message-Id: <20181209193742.7582-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH] hw/arm/allwinner-a10: Add the 'A' SRAM and the
 SRAM controller
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
X-TUID: JBay+k4wEPYE

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
There is an unmerged Linux patch where this SRAM seems used by the EMAC:
https://patchwork.kernel.org/patch/6515451/

 hw/arm/allwinner-a10.c         | 5 +++++
 include/hw/arm/allwinner-a10.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 9fe875cdb5..0bb0aa3b64 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -22,6 +22,7 @@
 #include "hw/sysbus.h"
 #include "hw/devices.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/misc/unimp.h"
 
 static void aw_a10_init(Object *obj)
 {
@@ -85,6 +86,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(sysbusdev, 4, s->irq[67]);
     sysbus_connect_irq(sysbusdev, 5, s->irq[68]);
 
+    memory_region_init_ram(&s->sram_a, NULL, "sram A", 48 * KiB, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
+    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
+
     /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
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
-- 
2.17.2

