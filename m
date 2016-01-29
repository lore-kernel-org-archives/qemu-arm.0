Received: by 10.25.159.19 with SMTP id i19csp1053830lfe;
        Fri, 29 Jan 2016 08:54:51 -0800 (PST)
X-Received: by 10.140.94.198 with SMTP id g64mr11995996qge.57.1454086490941;
        Fri, 29 Jan 2016 08:54:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81si1599390qhz.3.2016.01.29.08.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:54:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCJu-0002cB-EL
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:54:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ9-0001iE-R8
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ8-0003w8-Tb
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:03 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ8-0003vt-NB
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:02 -0500
Received: by mail-wm0-x22b.google.com with SMTP id r129so76808079wmr.0
	for <qemu-devel@nongnu.org>; Fri, 29 Jan 2016 08:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WX5OJfPGqkhLdjQ7ro/MH10LR+szMfEX9t+xmMaa47U=;
	b=c/utg90nU2HJlFXkRUiuFz3SRNwivf+2WYvxRrvsIw8C9fBZVeWC9u0vVR1tG7efER
	+EmYBJ8qf/R4Nt8SFKp4dSasRIl1lcuS3tAYfgWINeCfLBHOZpZDcYvgo91xggQWqTPQ
	4NHh1l16fy2X0tZEExOgEhbwLDlTL12xr38CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WX5OJfPGqkhLdjQ7ro/MH10LR+szMfEX9t+xmMaa47U=;
	b=ge5w2TOdjvQouTaSzsy03nGRvOeu5NOTVzISRzjbR4LhweMfW6rs8CllgiN5KYfzMI
	/yTglJVgMnZYTzuhCkUOCVQmeT7V4Vfs1zXBPvYgh3rzC+OyCcWlzmM0pL07wRlVduRF
	0UFSWnT5ze37MpRPmmQLobDwu+8J0gVZZS0Is/UUUPugixXj0oRn93ffPU11k9VcCj2g
	tXJmXQ2e/jjfNvhhGQ2enj+bWH/AGgz25Ys5HBMVnfEBRMUqmqm5AjS9BQURn6FQbJ4Y
	rtvPS0hvbWGUeLh5MO+vOeWLPs59iDofcpN4avAz/HSbqqGTlTHLyfchA2n/gPF2FeeV
	yNqA==
X-Gm-Message-State: AG10YOQCzBFhiBINM2VSS4WSxdvX1Jkkwhefowj4tjAqJFECE21PvrIxkvNm/XCrRGANt+TV
X-Received: by 10.28.137.135 with SMTP id l129mr9546055wmd.38.1454086441995;
	Fri, 29 Jan 2016 08:54:01 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.53.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:00 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:43 +0000
Message-Id: <1454086429-4373-3-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-devel] [RFC v2 2/8] Add a function to determine interrupt
	number for INTx routing
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ApreW60oKu4W

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

