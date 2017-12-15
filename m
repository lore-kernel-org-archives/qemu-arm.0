Received: by 10.223.159.74 with SMTP id f10csp7095497wrg;
        Thu, 14 Dec 2017 19:23:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBouBjKLdumbfH5BJpyGVi2ZkuZMCW31EeI2fjaCuqiGEanP6W5MN4rkuHJnqmhdiZD8hp6H2
X-Received: by 10.37.66.139 with SMTP id p133mr5862261yba.58.1513308234177;
        Thu, 14 Dec 2017 19:23:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308234; cv=none;
        d=google.com; s=arc-20160816;
        b=wvpfZ0TdBEIocasBUSMKF0crV85Xia2lOrvcoKW8TbL/EI/FdADq3F0gp9/1Cq+rFb
         afstb81jqyH3xPcCaHxGy22TkcU0B9IM55ghZDZE2SKJbsHO4g/ZFzoySbwiC7xBNrc1
         JVjR6oVloTuJMNnxfeirVTm4WWtpRpTcarhPEVj0tTkdCgwdTFV49KkqhpI0VzEPqsxk
         LLwJuYtBlVyEIchD6bWbkr4MIllLxASdry4zRfMgbvbDHHj0O0OFyIJwuWmyyeRqY9Ux
         FAV4o+2XRgGM21Zomd2opdOT14Wd4kfLywV3tKI1qGK5pWarkf8RoMPCDQ5CvgMzALEp
         LC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Pi56S70/QP5FTX+T+8F/it7D9+WDbcWEgfzEWvyQBTE=;
        b=A3BMMy09jH9pj/8YmLMogmlRPKcRd6xiaqg84Ru5YjJe/nv/H7oPhMITLtrSBTu4UV
         33xTXA6/lD6Re4C2IRYbd3XDU1+1kZbYBnqIe/wuSD35/N4AE9FfbjRXZLkI3B2b3gnb
         E7tHX1lFaaOZQ+gId/VKX9UL5yW17jrIHfKFYIzMPslrRV2ffcj5dInJhUFOW0l98cs6
         l43oR95bbhnZo1lNQoKPWPSRhyHQ5acHHjDqxwUWAtFYNu0jGPkkRB9TIu4RymhL7c6C
         vWkA545jOAN5btOekFc8c1zRpSyyJUZ1FBGqXOw3BuoEZcV++L+M7pjaRHI+je5OC/j4
         Hn5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q67cx0Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si1068769ybl.273.2017.12.14.19.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:23:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q67cx0Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgbJ-0003Tn-Ib
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:23:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgU6-0005ie-M5
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgU5-0000v1-M6
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:26 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:40598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgU5-0000uY-Gk; Thu, 14 Dec 2017 22:16:25 -0500
Received: by mail-qk0-x241.google.com with SMTP id b123so8847368qkg.7;
	Thu, 14 Dec 2017 19:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Pi56S70/QP5FTX+T+8F/it7D9+WDbcWEgfzEWvyQBTE=;
	b=Q67cx0JjcXx4yygr0xGQO0fpbvRs1qzFbMZAP/qto8Gi0kOlISXVldlQbwFASbgqmR
	D8oS+BNg84/Si/Bt1qyt4xvT84pCaMvP7Wb01BsTad2alfmllVyg/xpbmpArmFZikZc2
	5bYb4JvHQaHK/SxxQrhLtKro6uuVsAOgnfUcDWhB94Ua15A0Ts7U9fGRl9hTF6rr9Nhm
	vU/VpjZ+EK1LbE/95ADJVLZKasJtqjDvdJLH3uUT4NnnDPjxBz0WiLFKPwrPHwE6gCC3
	caGuq40J8sgI0DmchulvVZ1Y/dSihfBYdOsD/fe33Jh0/l1h+aOjHcRS/h9+z9vfYnRW
	pozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Pi56S70/QP5FTX+T+8F/it7D9+WDbcWEgfzEWvyQBTE=;
	b=hACBhto/1EAD3UxhB270uuI5WGhdjDNpINPmeIaMRAydX/JT+fcTVWGyLMpgnDZ/RH
	cP1XLOXM+tUdcMkJGEBA0t4f64PbkhEGouHjQsl9W/Nxrjn+NcCcdirjEwopT4HCTqmq
	+rVuplNJktUt4ZgDO8EsLw5Z0Kk6lRZUJZGlOTNRnvmBI8AmtQW7TLNQBuIJshoD/bwY
	p2qIp1yamwt4w6xLIyIRiR7fLxzMKiOFBffBZsteh0rGa0NQr+4HRYHhGUE7vd/oOOYp
	1k8K0QBSjCg9X8QlKsBhsplcotaaje78I+51dLpDAvZMTgc0D8Bn+FoaccXU44elN/DU
	RgAw==
X-Gm-Message-State: AKGB3mKDMG6x1ZUiLCINTcnlcdKrS74uzmPAGFLOb0KjQyA2Pw0OSDJ7
	h3CKh34Bolx3+lUd7cjaSrY=
X-Received: by 10.55.73.87 with SMTP id w84mr19908465qka.215.1513307785026;
	Thu, 14 Dec 2017 19:16:25 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 15 Dec 2017 00:15:32 -0300
Message-Id: <20171215031547.31006-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v2 05/20] sdhci: refactor common sysbus/pci
 realize() into sdhci_realizefn()
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ww13griyr0y0

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index dbdfd54350..fc5bac5cb9 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1191,6 +1191,15 @@ static void sdhci_initfn(SDHCIState *s)
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
 }
 
+static void sdhci_realizefn(SDHCIState *s, Error **errp)
+{
+    s->buf_maxsz = sdhci_get_fifolen(s);
+    s->fifo_buffer = g_malloc0(s->buf_maxsz);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
+                          SDHC_REGISTERS_MAP_SIZE);
+}
+
 static void sdhci_uninitfn(SDHCIState *s)
 {
     timer_del(s->insert_timer);
@@ -1281,12 +1290,11 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
     SDHCIState *s = PCI_SDHCI(dev);
     dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
     dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
+
     sdhci_initfn(s);
-    s->buf_maxsz = sdhci_get_fifolen(s);
-    s->fifo_buffer = g_malloc0(s->buf_maxsz);
+    sdhci_realizefn(s, errp);
+
     s->irq = pci_allocate_irq(dev);
-    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
-            SDHC_REGISTERS_MAP_SIZE);
     pci_register_bar(dev, 0, 0, &s->iomem);
 }
 
@@ -1343,11 +1351,9 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
     SDHCIState *s = SYSBUS_SDHCI(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    s->buf_maxsz = sdhci_get_fifolen(s);
-    s->fifo_buffer = g_malloc0(s->buf_maxsz);
+    sdhci_realizefn(s, errp);
+
     sysbus_init_irq(sbd, &s->irq);
-    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
-            SDHC_REGISTERS_MAP_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-- 
2.15.1

