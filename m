Received: by 10.223.172.38 with SMTP id v35csp2016589wrc;
        Sat, 16 Sep 2017 09:46:32 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCqEAavE3kHuChjSAEJFl8V0kuwbXP2Ds049wUvvsi3w34ZycpcLhhIAYSpZ4KWojcNShoB
X-Received: by 10.200.47.24 with SMTP id j24mr43911016qta.147.1505580392273;
        Sat, 16 Sep 2017 09:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580392; cv=none;
        d=google.com; s=arc-20160816;
        b=OOW5YWVXlPUL+hK7G38Bldy307brBhIxpF2uwlZkP5J+n4yGoDfK8Ap3Z+yFurMjgR
         +uyJbtb65FTLqirq/6MCYu47fVq4LuMxM4l0M7XPpS1OTfy4dozuIySRfAbZNDwgTRWw
         zn1uR7zsMe6NBoalIde2Wh6AihngZJMOr2Z7kYZNm5HSMn6dDvN+QCFVo6A5C0SxUjie
         RJmmuiPJsiOKdNNTQbOvKdRZ76gTm2ej24KjFq4juGr7lOS+aiJ97GDRo3v4Rs0e8hXh
         C7PzoO+Gtn+yTtCg8FdATv2tMyxKoruxbXAfGVREYn+g8ZXvMQosSVCQbtqPdrujuMjO
         XdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DkV6T3eBNbS2lfHo1XOKiBwxEvuouiaSzhiWzsQxerE=;
        b=Z9VLdysvHDF3TLR90+2YATxH21W1Ky4YGJm/R0b2tNx+fFEFhWA/MI2B6Dalec3w7Z
         Y/FHpe5UGMDxtGHbfgD6f4SU0p+tuwAcB+k4Gyk+X9HgVQiT+vKRm0amwdbKyVJUiC6+
         nROjbkdvceC9zjrmzFow/21KeufldZbZaXJp2OVziEYwBneglgOahyd1reITKB+5KHi3
         haHNqxY2yK2KtpvYhe+UWQmhMQtZe4kg80FMMVeQmDvBj9UeL6p/IoHbiwECx8gFNSYI
         8sqN2VSRIFSUC+4flb4niRPuJ3e38xzUNlPHHpvPljiM9rap3YtHUd34vwKfFg49jFPj
         JNVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y90si3614418qtd.484.2017.09.16.09.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGEf-0008UW-VZ
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:46:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEE-0008Dy-Ko
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGED-00079V-PV
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGED-00075o-J9; Sat, 16 Sep 2017 12:46:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGE0-00015k-5B; Sat, 16 Sep 2017 17:45:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:14 +0100
Message-Id: <1505580378-9044-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/6] hw/gpio/omap_gpio.c: Don't use old_mmio
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ZM8jy6CCG8i

Drop the use of old_mmio in the omap2_gpio memory ops.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/omap_gpio.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 1df394e..17891e2 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -525,17 +525,23 @@ static void omap2_gpio_module_write(void *opaque, hwaddr addr,
     }
 }
 
-static uint32_t omap2_gpio_module_readp(void *opaque, hwaddr addr)
+static uint64_t omap2_gpio_module_readp(void *opaque, hwaddr addr,
+                                        unsigned size)
 {
     return omap2_gpio_module_read(opaque, addr & ~3) >> ((addr & 3) << 3);
 }
 
 static void omap2_gpio_module_writep(void *opaque, hwaddr addr,
-                uint32_t value)
+                                     uint64_t value, unsigned size)
 {
     uint32_t cur = 0;
     uint32_t mask = 0xffff;
 
+    if (size == 4) {
+        omap2_gpio_module_write(opaque, addr, value);
+        return;
+    }
+
     switch (addr & ~3) {
     case 0x00:	/* GPIO_REVISION */
     case 0x14:	/* GPIO_SYSSTATUS */
@@ -581,18 +587,10 @@ static void omap2_gpio_module_writep(void *opaque, hwaddr addr,
 }
 
 static const MemoryRegionOps omap2_gpio_module_ops = {
-    .old_mmio = {
-        .read = {
-            omap2_gpio_module_readp,
-            omap2_gpio_module_readp,
-            omap2_gpio_module_read,
-        },
-        .write = {
-            omap2_gpio_module_writep,
-            omap2_gpio_module_writep,
-            omap2_gpio_module_write,
-        },
-    },
+    .read = omap2_gpio_module_readp,
+    .write = omap2_gpio_module_writep,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

