Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp957655wrp;
        Thu, 14 Feb 2019 05:08:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYGekXZMERfPo1NDWg9Pfb+Gj06C20QhmDmwqR3VJhv7NHytP0NT+85VvpNxDc2XEbtr06i
X-Received: by 2002:a81:79cc:: with SMTP id u195mr3054317ywc.120.1550149734887;
        Thu, 14 Feb 2019 05:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149734; cv=none;
        d=google.com; s=arc-20160816;
        b=Auw6EkoiVC7SB6s7BtuZZ38ER8L2VPThWoZumCGL3cXCflpps6/eNlSQjCAqdtaMfk
         va8P8uifUHFat4o8yrqVjQip/EYP6J6XSF/hioqnQodvR+kc3xrtl1S9OqYl2fpHaYLt
         zL/5SjsxFifG9TSVOGUlkfBDPeexpef6+ghJ/EzVjQVFcHDsZAYNXoSYvV5Mg6fhbJlT
         C7ZJX08mpNRg5L5ig7TlouttNPaCaa8pBgvmZukR5CEGqRApHKTea3VxeXbKb1ng+srQ
         M56MXK8LL07/1OOfEeGxywJneiNLJ0i+cd+vdwm4DuMbOoJbV5bf2JEHAr62dQfUyOVJ
         Ei1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1OLWN1Os/7gGDPurXe5cQamlogPhIwB9LbNuZjXBuKI=;
        b=P2YTWLGGE4gLUf3a7xwGJMF2/36n/xBCZvYq28+pAe+ISxI0RFQ3E9Ue+K1oMKwC8l
         OkwIucno5WaDA8oI73R7DYGM0WOHMcLdxvswvwfojuOhuoXF4w01PXyaQ8OiuQet/yyf
         /qHIpq5y8OEhTgdUDPJvQp2gWmZV8MTiB7TvRS008LXVGYcYGfhezUe4AvR7DEPmiPLO
         DBQxvXjB4VW7GsCAxtC3vsKvTV2MY431aZPrj9Qbi+BGesfe0QaD1W+pCBZuhKKmSbvO
         TL5WBH2PbhYnjFMrNd7ic8hfcqD816OMwsqo1ZRiWGkDyWLg//W8nJDMAk/wPLOvgEcr
         8NJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lJpNLusD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j128si1350554ywb.125.2019.02.14.05.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:08:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lJpNLusD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGl4-0008NJ-6y
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeS-0002tT-GA
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGU0-0006Uo-LB
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:18 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGU0-0006U2-B2
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:16 -0500
Received: by mail-wr1-x442.google.com with SMTP id l9so6308571wrt.13
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1OLWN1Os/7gGDPurXe5cQamlogPhIwB9LbNuZjXBuKI=;
	b=lJpNLusDpQh2PHjl/4+ywixCD1ZJT8eezUQkNViObLwuuvQBjT/L1xNnqIK8p1aGoa
	z+7NGf2bU7yJRRWYRlbo8peZ5jboTUY50DEzI9kU88JM24elAwrezjARbH40do8RhJse
	6/DUxbhtEDHlTJyr7IQrexHv/2jvpEZqOlSOu/i5esjeFPq344SFFHWNPb8b7Zp5M200
	i26uBp0ZhNTEULGWAHCVzPX05ObqhJ3xUN+KKRJm03j/kMmBNkjnziPLhRCdgOaDsPIG
	+hSXKcxPugQBvVevviu9h/K7kdjtCN3H/qSvdLPEe6f6JAufQsHyTz+nnumfEajcHULj
	WMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1OLWN1Os/7gGDPurXe5cQamlogPhIwB9LbNuZjXBuKI=;
	b=hOkiyVtWdebPZsaAS7AenieQFk3OmFDOAzMRn4MXxI7Z/w4S4nvlTlPS8f4jc0lpTv
	rWWZQ++zejrVWAPBs1k/cU83HeG7LcXRFOnW6jO4zAXxfjmPwKFcUz2JQiW22AS7Tp8/
	yu1VdOr/j/QwUn/zsHVVvdcB45Lz5FLYhbAwFP2FNEuyoep55a2j+zQwOknKEuNJal/s
	eivzmKhgYVLjcUyXp63KbMxOXF6OLW3Ri4wsK1HQd0Sl5T32qxvakkd8zPp4ygLf12KE
	5hh119RjdNOfvvcao/r037PhZFuASOkx9h8nQ4lryvbbn0HE+36olwDuW0V9vZFyWs9R
	QVBA==
X-Gm-Message-State: AHQUAua+dMy4+SaDZ2zc5U4E8VIdW0li2iSNMkuqNT02ejM0IO6e4+QT
	enZ/zqJ+cU+5JNsxAf+ioFOTFkCPdl3jlQ==
X-Received: by 2002:adf:fc87:: with SMTP id g7mr2710183wrr.136.1550148675171; 
	Thu, 14 Feb 2019 04:51:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:58 +0000
Message-Id: <20190214125107.22178-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 05/14] hw/char/pl011: Allow use as an
 embedded-struct device
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
X-TUID: V6fJuPqFCXxs

Create a new include file for the pl011's device struct,
type macros, etc, so that it can be instantiated using
the "embedded struct" coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h | 34 ++++++++++++++++++++++++++++++++++
 hw/char/pl011.c         | 31 ++-----------------------------
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 83649324b6a..1b52bfd5c90 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -15,6 +15,40 @@
 #ifndef HW_PL011_H
 #define HW_PL011_H
 
+#include "hw/sysbus.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_PL011 "pl011"
+#define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
+
+/* This shares the same struct (and cast macro) as the base pl011 device */
+#define TYPE_PL011_LUMINARY "pl011_luminary"
+
+typedef struct PL011State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t readbuff;
+    uint32_t flags;
+    uint32_t lcr;
+    uint32_t rsr;
+    uint32_t cr;
+    uint32_t dmacr;
+    uint32_t int_enabled;
+    uint32_t int_level;
+    uint32_t read_fifo[16];
+    uint32_t ilpr;
+    uint32_t ibrd;
+    uint32_t fbrd;
+    uint32_t ifl;
+    int read_pos;
+    int read_count;
+    int read_trigger;
+    CharBackend chr;
+    qemu_irq irq;
+    const unsigned char *id;
+} PL011State;
+
 static inline DeviceState *pl011_create(hwaddr addr,
                                         qemu_irq irq,
                                         Chardev *chr)
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 2aa277fc4f2..0c4711e4027 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -8,39 +8,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/char/pl011.h"
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qemu/log.h"
 #include "trace.h"
 
-#define TYPE_PL011 "pl011"
-#define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
-
-typedef struct PL011State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    uint32_t readbuff;
-    uint32_t flags;
-    uint32_t lcr;
-    uint32_t rsr;
-    uint32_t cr;
-    uint32_t dmacr;
-    uint32_t int_enabled;
-    uint32_t int_level;
-    uint32_t read_fifo[16];
-    uint32_t ilpr;
-    uint32_t ibrd;
-    uint32_t fbrd;
-    uint32_t ifl;
-    int read_pos;
-    int read_count;
-    int read_trigger;
-    CharBackend chr;
-    qemu_irq irq;
-    const unsigned char *id;
-} PL011State;
-
 #define PL011_INT_TX 0x20
 #define PL011_INT_RX 0x10
 
@@ -357,7 +330,7 @@ static void pl011_luminary_init(Object *obj)
 }
 
 static const TypeInfo pl011_luminary_info = {
-    .name          = "pl011_luminary",
+    .name          = TYPE_PL011_LUMINARY,
     .parent        = TYPE_PL011,
     .instance_init = pl011_luminary_init,
 };
-- 
2.20.1

