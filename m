Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp779914wru;
        Fri, 27 Jul 2018 07:40:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdDhY3tyE4Nugx0TlyruKtbAbi/DIPg33dnCTjJVkKt8JHgtVcMss29mDKO18YNPS7yNJxp
X-Received: by 2002:aed:22ed:: with SMTP id q42-v6mr6394888qtc.193.1532702426849;
        Fri, 27 Jul 2018 07:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702426; cv=none;
        d=google.com; s=arc-20160816;
        b=hiwCltSL/7LHfgjv34XhPOBN2hYdr21SYojzyEA2rOYTEjPC1FzoTrv4HkJUAOWgs8
         BK/cqcFsOR456g2TAEnrrCTN4mjdljujYiru+cK6wWxFvYRmHmKfmASvegxot8mBHA6A
         qiPWBfsHYbbQZMARlsGlZzQUjrQJEpiCdlJpoSEB/LizizMAFTzvFmb01Mn5TcWS7xZS
         6Mf3Xcbj9f8AbOQZ+HFvuYEoqaFgodWSpuJg8YiQyghARu2PXlFyeMfhIvP7ZNZl8FSI
         KdOmsdsxtWmi/f9yRzyQO6FXUz3D5d+sO84wQtRudh3cnhx4l4JZN/XSqnTs1+tLfgHS
         GQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=LBF4TSDJ6nOfiIDEd5UQabiVhPQoI37ki5TNgKldeJ4=;
        b=XZ2MXox20tXUE56uxVD7qhUCQ3aV4kHlxfUgBhPZTE1oSWQMwlr3fMCie8iP2m7WUr
         vIDPqtZyFeG/IAAmV7Y2OD6vB5wDvWfow624T9cXfgqa+Pz10ta5lXr2qybXqZYwk2dg
         kcNG401x93845SuX6LmDmlcnndU+DK8ahzOlTSMlCSmunEcrZseAbD8Dwf2vbwW0Swkn
         Dqnu89zPHoW6z51/DHRPe/9BgbZ3AXq932Weo3TzUWvwF/agz4rR1SVlKe+gIqWqf1lh
         vxMDqITs6SVil5piB459y4meFpbi9ztJLCbok7YhzR9tnJldfuVNzhC3EwNCgTqwL73S
         WEug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qq8ENKMQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CZ9gA00W;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CZ9gA00W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o78-v6si4217338qko.11.2018.07.27.07.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qq8ENKMQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CZ9gA00W;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CZ9gA00W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3us-0004PS-8g
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:40:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sH-0003FA-Lk
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sG-0008Iw-PO
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:45 -0400
Received: from greensocs.com ([193.104.36.180]:50634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sC-0008Du-9K; Fri, 27 Jul 2018 10:37:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0B3604434A4;
	Fri, 27 Jul 2018 16:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702253;
	bh=/EvO9y+yBj8mI+048fwg1NECN+kG+3HyNMtEWLEux5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qq8ENKMQd85HD9VRwawkgCVdSdnhnOdZWuBBMAIjFNg1OzgFftxtA3KOo/9PEqbNC
	awYzZ8+ioVbZpPkywNDZMTa0hXJW1AmDwnlJmaoGYabDi/GXvNZ/HOsW0F9jEPMIlX
	nWG9tHw/Lg1b4FzGsQghqms0IQVdjNoqXvE1o2eY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CZ9gA00W;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CZ9gA00W
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_Bfm8teoVj3; Fri, 27 Jul 2018 16:37:32 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2ED98443548; Fri, 27 Jul 2018 16:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702252;
	bh=/EvO9y+yBj8mI+048fwg1NECN+kG+3HyNMtEWLEux5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZ9gA00WmYpoj1VakN32ttCPdiKYPStvS7eHotI0LFF4yMowdlHlASUGfX5nkUG9o
	GqfaUk0B7sWLOmGnZs0KbuOxdry4eZVlnhnY+3xHgYuOpt/RsbDGjKV0+fORNhAqi1
	2WPVfPnE+Bh+JFcOXyJOHBA+nlsy5AXwM6rVDRQw=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B6B99443555;
	Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702252;
	bh=/EvO9y+yBj8mI+048fwg1NECN+kG+3HyNMtEWLEux5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZ9gA00WmYpoj1VakN32ttCPdiKYPStvS7eHotI0LFF4yMowdlHlASUGfX5nkUG9o
	GqfaUk0B7sWLOmGnZs0KbuOxdry4eZVlnhnY+3xHgYuOpt/RsbDGjKV0+fORNhAqi1
	2WPVfPnE+Bh+JFcOXyJOHBA+nlsy5AXwM6rVDRQw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:25 +0200
Message-Id: <f7f6b76036ffcb6ef7f844f815f7d433374157f7.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 6/6] xilinx_zynq: add uart clock gating
 support
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3V+qpHcZ8Gv1

Add the link between the clock controller _slcr_ and the two
uarts _uart0_ and _uart1_ so that the controller can do the gating.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/arm/xilinx_zynq.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index f1496d2927..2ca2dc32cf 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -166,7 +166,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
-    DeviceState *dev;
+    DeviceState *dev, *slcr;
     SysBusDevice *busdev;
     qemu_irq pic[64];
     int n;
@@ -212,9 +212,11 @@ static void zynq_init(MachineState *machine)
                           1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
                               0);
 
-    dev = qdev_create(NULL, "xilinx,zynq_slcr");
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8000000);
+    /*
+     * Create slcr, initialization is completed below
+     * because we have some properties to set
+     */
+    slcr = qdev_create(NULL, "xilinx,zynq_slcr");
 
     dev = qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
@@ -235,8 +237,10 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
     sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
 
-    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
-    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    dev = cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
+    object_property_set_link(OBJECT(slcr), OBJECT(dev), "uart0", &error_abort);
+    dev = cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    object_property_set_link(OBJECT(slcr), OBJECT(dev), "uart1", &error_abort);
 
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
             pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], NULL);
@@ -246,6 +250,10 @@ static void zynq_init(MachineState *machine)
     gem_init(&nd_table[0], 0xE000B000, pic[54-IRQ_OFFSET]);
     gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
 
+    /* Complete the slcr initialization */
+    qdev_init_nofail(slcr);
+    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
+
     for (n = 0; n < 2; n++) {
         int hci_irq = n ? 79 : 56;
         hwaddr hci_addr = n ? 0xE0101000 : 0xE0100000;
-- 
2.18.0

