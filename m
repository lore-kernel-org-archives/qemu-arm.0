Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5137667wrt;
        Tue, 2 Oct 2018 07:42:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63jYc5bnfBX/y6+8SiUbTWA2fezayOxmKYCdhbuBoJmKNTeQ5/9gy2CrwGuzWJnKFid0+BP
X-Received: by 2002:ac8:1102:: with SMTP id c2-v6mr12375194qtj.307.1538491324881;
        Tue, 02 Oct 2018 07:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491324; cv=none;
        d=google.com; s=arc-20160816;
        b=HedEr/RR4DgZ4qJh9S2L7SAD1/4k6FsnXs1utPnEU1kyNGqIS/5GR35PvfAIaPFNbP
         ekY/g8FFOGq9qgAflUs9VEpAw0z+0TwH/KFdyx39ZXmMnXCwMVw21Vl8VUC6DlqkXFvi
         0b+U9iblR5JBiCKJW4tvM51JHXNvGd99w9PQcTNseV/vjVF1wFovppkFJo4v5EE37348
         y+WsZ43Gkxkehi6Kp2lDiMLUiVeCoMRt4oZVQacwaK5FRIgW5fLMnCMQ8wKI9AQ5ii95
         YLfpfOgJwS2cmKBvss2XED0pUGkojGVmlaXM2LDBuT/T9WPeSV7BS8z3bq50nbBM7yGo
         6FIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ccLjQfkEJ1THVZXgalmm8LfXIw7fm9tDBo5iWvAQxjo=;
        b=m51NziswqkvFdUqqAUBjsO+XG5cVm+XyJivNLotKA+Y5eHzyxDnEOPss4YI0DSfx7o
         e+yY+DVlTu3SuDyKHFggmwYuVb+AXvyKPH44pIfrspuvm9RfQVuFuwYK/LanBT8LXipu
         BrLrtLqT/ikruPHimzBwkjvHieIy3JQwhXa0FO2fUDGof9gGkKXNun95wLI/gm0oRAeU
         IAhUJN1xLySLr3Z/NHvwp+5lgtBo6tsKM9H98Pu2sVXTQ6NrmCg+fu4qaMNW1VuF+1/M
         9KwZBRyqLwIcmr4VIOSGPrRq575ZhuEr+TVYpBx5moUvKlp3VVdXUllefhAs3FI6NBbu
         Y5Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fCcDoJWC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QomYVnlv;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QomYVnlv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3-v6si2681395qkb.7.2018.10.02.07.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fCcDoJWC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QomYVnlv;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QomYVnlv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7LsC-0001Sp-DN
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:42:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmp-0005IS-Ia
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdD-0004RB-JA
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:36 -0400
Received: from greensocs.com ([193.104.36.180]:53928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7LdA-0004OM-Hf; Tue, 02 Oct 2018 10:26:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4F664442AFB;
	Tue,  2 Oct 2018 16:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490371;
	bh=jFdDOTrCjBSX31V7YSODO0nvlL+B8KjEWaH7DIakyp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fCcDoJWC3xZgdAPLCyboaeApG2IrTDP5qqaJ6CebqxjjU7NsAoE1hSCXwWxpqlqeb
	nE2suU7CTP/pzpmNysp3kO/JncmoodrRw2fTW0r1hAcJ7oHVJgxk9qA2h2PXMUMjA3
	e2L4VbfRDQOHm7SJNZoRHZhun+Mijohz1czdwSyw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QomYVnlv;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QomYVnlv
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6g9tA1GfWSVf; Tue,  2 Oct 2018 16:26:09 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id D21A5442AF5; Tue,  2 Oct 2018 16:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490367;
	bh=jFdDOTrCjBSX31V7YSODO0nvlL+B8KjEWaH7DIakyp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QomYVnlvv1AAJMtDNzt2gfFG00gfnM8/kNaCCEvuIUuL593kN9i6OJz1AWWiJJwN5
	kHuFRIZ9qb4K5sgvEQLRja08HFk8l+eTXMwBqiptI4XwrIHBY3xdnHfY/93HFBwE1i
	dkjbK3cpW1OOxXDAt7MyKMEjkNociHON3AR4zrzk=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6AB47442AFD;
	Tue,  2 Oct 2018 16:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490367;
	bh=jFdDOTrCjBSX31V7YSODO0nvlL+B8KjEWaH7DIakyp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QomYVnlvv1AAJMtDNzt2gfFG00gfnM8/kNaCCEvuIUuL593kN9i6OJz1AWWiJJwN5
	kHuFRIZ9qb4K5sgvEQLRja08HFk8l+eTXMwBqiptI4XwrIHBY3xdnHfY/93HFBwE1i
	dkjbK3cpW1OOxXDAt7MyKMEjkNociHON3AR4zrzk=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:43 +0200
Message-Id: <20181002142443.30976-10-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 9/9] hw/arm/xilinx_zynq: connect uart clocks
 to slcr
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
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAoF3Sq02kp6

Add the connection between the slcr's output clocks and the uarts inputs.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/arm/xilinx_zynq.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index f1496d2927..88f61c6a18 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -166,7 +166,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
-    DeviceState *dev;
+    DeviceState *dev, *slcr;
     SysBusDevice *busdev;
     qemu_irq pic[64];
     int n;
@@ -212,9 +212,10 @@ static void zynq_init(MachineState *machine)
                           1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2=
aa,
                               0);
=20
-    dev =3D qdev_create(NULL, "xilinx,zynq_slcr");
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8000000);
+    /* Create slcr, keep a pointer to connect clocks */
+    slcr =3D qdev_create(NULL, "xilinx,zynq_slcr");
+    qdev_init_nofail(slcr);
+    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
=20
     dev =3D qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
@@ -235,8 +236,12 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET])=
;
     sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET])=
;
=20
-    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
-    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    dev =3D cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial=
_hd(0));
+    qdev_connect_clock(dev, "busclk", slcr, "uart0_amba_clk", &error_abo=
rt);
+    qdev_connect_clock(dev, "refclk", slcr, "uart0_ref_clk", &error_abor=
t);
+    dev =3D cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial=
_hd(1));
+    qdev_connect_clock(dev, "busclk", slcr, "uart1_amba_clk", &error_abo=
rt);
+    qdev_connect_clock(dev, "refclk", slcr, "uart1_ref_clk", &error_abor=
t);
=20
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
             pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], =
NULL);
--=20
2.19.0

