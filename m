Received: by 10.28.71.27 with SMTP id u27csp2342489wma;
        Thu, 8 Feb 2018 09:37:53 -0800 (PST)
X-Google-Smtp-Source: AH8x224v5qCWBkC60p9HUunpvdM2ly2y8nA27MDiZ76rhGaBGbwxqbCYKC0YY5q98eD30bCeGZlj
X-Received: by 10.13.255.66 with SMTP id p63mr1160086ywf.482.1518111473658;
        Thu, 08 Feb 2018 09:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518111473; cv=none;
        d=google.com; s=arc-20160816;
        b=Pcj8MinWRfaqcTNr+HpJRmodelPXfiHuOKBbH5Iq6zcfJik6iV5jSbT9cndS+/HF3H
         lQjEkXZkOqdkeeRaHldyYC9EpZULwz050b0C8CeU5A+eE57yiyyzg0dot44CnpYPtRqg
         kPsCnw1UyGXPxU74/48R09sOHWUs/GI0y/Yswe6RHDU9bOl9JinoHY0gP9LPnBIOO8FP
         +zhA0erht+o895klliIFYNGcMwdjQABkniaa08RwwlFN3Uy4rvLMjSS1vmC+UaUgkATA
         SXvLPlNqzMia8V469iEJW2+PN7fszFdwZyFJ+nkx7t5h4vkimLlJXuJlMUFLTAfvz2kZ
         9f7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gQPw4nj/djjsXDUAN6bIZlkV/KD0cJagKx8Sq1y0JgQ=;
        b=jwX8n3vcxzPpjlPMosaeaoqHBCCwppSFTeyC/PU0aR+kxeHVnoVm+/r5ybf1DWqERX
         Ps/kgmouAmguIsM6K4xNMS3jP4h2zk2TzRA/B2Fl6KpbSxOAKUtAqaKzmVaB6KaB3dEr
         GDrBaQEec30Qq+MpD6A2cq9YPrctLENB2gJ/3T0QrnTa2SqgD8VvQE3zb/dMLL7t/AtC
         Ecszh8yPx+nNwZYFD2yVk9YCq7OCOrpCFc53A+2GN/C8W55rKt7wTgkJvZyIlMdqj/nl
         2LFoZPpKbEgctmYK7qNzMt8Nd6LjzGGlECdl7EDxKNKPL5rufa5oY9tc5WGm5WW21Oxr
         pJVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qn5Sxrr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h10si77688ywk.695.2018.02.08.09.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:37:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qn5Sxrr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejq8u-0007zQ-SI
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:37:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptq-00034Q-Dw
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:22:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptp-0006he-Dn
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:22:18 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:47079)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptp-0006hF-9q; Thu, 08 Feb 2018 12:22:17 -0500
Received: by mail-qk0-x244.google.com with SMTP id d125so6555508qkg.13;
	Thu, 08 Feb 2018 09:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gQPw4nj/djjsXDUAN6bIZlkV/KD0cJagKx8Sq1y0JgQ=;
	b=Qn5Sxrr7AZ2xTVmU//ojOo4FkOnAJAWoCu2Js/zqLqP6JEY+V/D2H/STAUoNCf+LBU
	0lkQ/LtyqDGPHoJw2b2L9d6Bk5/M0DFRk7t1jH1StzaItHZYD/yG5LnB/V9LA9GSQuAm
	1TElDhG+GHgyRCxFDqkNR3YtjE9wLtMvOWv+klp3Qa7QNljQxc9gMCDO8I+2vhKVBWEQ
	T9sTlV9nbRI0GN41vgXn4Afa5uO4UBsiU2GDGL66VvHRypD21uyTWs/5UrN4yGZDt+Y6
	J60P5WPGzROYGgwRv9SUeYfYk7TwM0mVBfBAyfZbuFeQ8l6ssmGMw5i59J3I232uti4Q
	7fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gQPw4nj/djjsXDUAN6bIZlkV/KD0cJagKx8Sq1y0JgQ=;
	b=Mo6HiLThdLl5PQ+H31O2K64+aGWz2/q7CoayZu8GmNZFxluC+jhYzeWCY2XMSNZF5g
	P1kyqMwp1TyrESpJXN9r5WpBZ/HxC/ILPTGK/OnHuzv/LeIN/TKd5YGIpI39t+01E4S2
	6/My1dHpFoXYFU12vRnKu6nBll2dd23bQQ0wNG44snY968VJmKVedhpjKN/xtJN5t2jh
	BkT/F4vR+ec0HSYt4F4AHmwkZV1PDaOBwf1+XEvRFLbbmpJ4YQuRTHTtAwFNwVbGk6yr
	GPpZZ9WwRtP0Gk/vuNT8gPSrS9sunjkG+2eP6nONYYhdOe6JfYvnp4cr2HpW0j2ttmXX
	5JhQ==
X-Gm-Message-State: APf1xPCmhD7pa/yXhen84so2Yb8YHRBBzC8sC3iXvJb9EPdYKL6onKM5
	In8H1PNSPfazJQxIiI6Pytc=
X-Received: by 10.55.214.217 with SMTP id p86mr2124210qkl.252.1518110536808;
	Thu, 08 Feb 2018 09:22:16 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id l66sm253466qkf.87.2018.02.08.09.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 09:22:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Thu,  8 Feb 2018 14:22:02 -0300
Message-Id: <20180208172202.9984-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208172202.9984-1-f4bug@amsat.org>
References: <20180208172202.9984-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH 2/2] hw/arm/aspeed: simplify using the
 'unimplemented device' for aspeed_soc.io
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMN3+pACJMAt

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index a786750e14..3d21128d47 100644
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

