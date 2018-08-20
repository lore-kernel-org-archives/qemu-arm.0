Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp747603wrd;
        Mon, 20 Aug 2018 07:25:11 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzqzmlpRHypMPYNev/tRxBlmORvaYML0+kmrBMpzngBGTzzJpi1fC/VpwwggIMhHaPccvbg
X-Received: by 2002:a37:4bc8:: with SMTP id y191-v6mr39363571qka.98.1534775111810;
        Mon, 20 Aug 2018 07:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534775111; cv=none;
        d=google.com; s=arc-20160816;
        b=vGiRrUT0OidDicO/AKCgxpRcG/jxdy/Je77fWNMUIcxTJ98mQ9q/C9o2LalDKz3796
         HDJ5LoG3XDwo/Q2oOx8fwNuOISgMRuTQZslnDNOHQNd3qo8IoHfG+hWejnL7O1fBFVRQ
         +bkFubKEkrdHMvnFl4y7ueseXsIyDPakNDdUl912VEogDxGr/snn9cLC/igMB1GezHxH
         vWETthdHuJgMKSnQfiBY2iNFQk88vFPh6eWqeg9E/3wAgbJjGF8b3RyakL65/lFJHKPs
         +qCQZPqdo+6PfF7odEy8IXjic2Yoq0AsDwqmXuWDW237A0V69ObpFZRgexIJ1S8x79EO
         HSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=svJCUeuosepGZ9EPLDEcahkQqb+nL0vHoZvxS02RHbs=;
        b=oCpGJGnGhkoiI1EQmLOab5IwDgOwwZFCnHk/HWDnjvX7vctjYgp1LM/VU/sdbG5w1h
         lGuL4pyf10VH4mWO7Z2FHcEy9ItJ02rEABwlTXzgWMFpJ4gypaxrqYpuC2gTfCPEQG4o
         ou8ln3KU+24ueZnFPZ3FGJluIvtk7DbbHVTy9uNOyDUSPhDsVbGXhH/6BLRB6G9H0YQx
         zz8zW9kD7nELzROmTUq8oq5uNAlZ5g3GeXFU7tiimdP35wtHpxugsEUrlpOERWhTJHkP
         B3mv0/bI4HSnqdGOfMnKtMuPTyoZwx0BhflNKj/PHqfbfYYWHiYVuZwKfq61Z1ArBl3N
         8IKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v9-v6si5167630qkv.56.2018.08.20.07.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl7H-00076w-8F
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:25:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuC-0003c2-NH
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuB-0007MR-U6
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:40 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuB-0007Jz-Kb; Mon, 20 Aug 2018 10:11:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku9-0003T1-JP; Mon, 20 Aug 2018 15:11:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:10 +0100
Message-Id: <20180820141116.9118-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 16/22] hw/ssi/pl022: Set up reset function in
 class init
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NnsGHNxgDMkD

Currently the PL022 calls pl022_reset() from its class init
function. Make it register a DeviceState reset method instead,
so that we reset the device on system reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/pl022.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index 379d3093987..0b5f90b857f 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -203,8 +203,10 @@ static void pl022_write(void *opaque, hwaddr offset,
     }
 }
 
-static void pl022_reset(PL022State *s)
+static void pl022_reset(DeviceState *dev)
 {
+    PL022State *s = PL022(dev);
+
     s->rx_fifo_len = 0;
     s->tx_fifo_len = 0;
     s->im = 0;
@@ -277,7 +279,6 @@ static int pl022_init(SysBusDevice *sbd)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     s->ssi = ssi_create_bus(dev, "ssi");
-    pl022_reset(s);
     vmstate_register(dev, -1, &vmstate_pl022, s);
     return 0;
 }
@@ -285,8 +286,10 @@ static int pl022_init(SysBusDevice *sbd)
 static void pl022_class_init(ObjectClass *klass, void *data)
 {
     SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     sdc->init = pl022_init;
+    dc->reset = pl022_reset;
 }
 
 static const TypeInfo pl022_info = {
-- 
2.18.0

