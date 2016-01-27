Received: by 10.25.159.19 with SMTP id i19csp2424329lfe;
        Wed, 27 Jan 2016 05:53:35 -0800 (PST)
X-Received: by 10.55.23.212 with SMTP id 81mr6865151qkx.64.1453902814452;
        Wed, 27 Jan 2016 05:53:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si6678443qgf.53.2016.01.27.05.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQXN-0005K3-NT
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:53:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVz-0002gh-IU
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVy-00029K-Mt
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:07 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:36444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVy-00028x-G4
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:06 -0500
Received: by mail-wm0-x233.google.com with SMTP id l65so145791187wmf.1
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WX5OJfPGqkhLdjQ7ro/MH10LR+szMfEX9t+xmMaa47U=;
	b=UNbkJ6/sX+wUMzkcrjCj6sauK4PHN6WHeJmqi5k6l/bkLKQ2uNskH1iTqKkC+ZnICb
	dQjPVjPQbVk2bLYc67upUw4eEaiOqC7SDIASZGXWNuHIImyh2jUOBYR9HtuN192sZUlp
	8KsVfLaQjpjOJoZo1JoC5EeHe+pAYzKXxsNqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WX5OJfPGqkhLdjQ7ro/MH10LR+szMfEX9t+xmMaa47U=;
	b=LNP0gSh/Nu0xpE/l8ANQgiptJ1d0F9RJiHoBFERbNCB/E2ur6hUlJOv8oOn1B6zFHN
	MymGQTODKgI1ayDOmIi5lDZnA9W9C016/E9M/6QiM89Sj3/CVaYapBv0DnfWKzSW9Paq
	IW7vijIy53l9HN8fsBv92NZYUEA59WLw89gmA7hLzSA6n22qBXqeOuG270QLdcQVH1qe
	mbYyt4Ogn8SSmCdQ2953B1LHGeckVShI0w5UCXe9zT51qgi7mp9bzXeq3nFqpIXxOIqS
	49TqSQpOKHQ9pxbRcFyc47VgMil53qyUUTvwIl7f8AaJu4Dw62siRCeAUTxWVLUq+1HZ
	BvSQ==
X-Gm-Message-State: AG10YORzTshOogBAAENvh3mOtQLf0X7u4shty6tbruQNFZ3xed6e9wNH2vFXPPmY3NTJRwh7
X-Received: by 10.194.19.164 with SMTP id g4mr29122284wje.120.1453902725803;
	Wed, 27 Jan 2016 05:52:05 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:04 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:50 +0000
Message-Id: <1453902715-25304-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 2/7] Add a function to determine interrupt number
	for INTx routing
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z+SD5PJZMT/6

This patch adds a PCI bus specific function pointer "route_intx_to_irq"
for GPEX. This is used in detemining PCI INTx number from pin.

Signed-off-by: Pranavkumar Sawargaonkar <address@hidden>
Signed-off-by: Tushar Jagad <address@hidden>
---
 hw/pci-host/gpex.c         | 12 ++++++++++++
 include/hw/pci-host/gpex.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 9d8fb5a..d0d1250 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -42,6 +42,17 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(s->irq[irq_num], level);
 }
 
+static PCIINTxRoute gpex_route_intx_pin_to_irq(void *opaque, int pin)
+{
+    PCIINTxRoute route;
+    GPEXHost *s = opaque;
+
+    route.mode = PCI_INTX_ENABLED;
+    route.irq = (int)s->irq_num[pin];
+
+    return route;
+}
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
@@ -66,6 +77,7 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
                                 &s->io_ioport, 0, 4, TYPE_PCIE_BUS);
 
     qdev_set_parent_bus(DEVICE(&s->gpex_root), BUS(pci->bus));
+    pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
     qdev_init_nofail(DEVICE(&s->gpex_root));
 }
 
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 68c9348..7df1c16 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -51,6 +51,7 @@ typedef struct GPEXHost {
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
+    uint32_t irq_num[GPEX_NUM_IRQS];
 } GPEXHost;
 
 #endif /* HW_GPEX_H */
-- 
1.9.1

