Received: by 10.28.71.27 with SMTP id u27csp3202881wma;
        Mon, 22 Jan 2018 11:55:29 -0800 (PST)
X-Google-Smtp-Source: AH8x225b1Ta95lSFN/cCUPQfeFPCsy5Yx7WuszQcv9csYcQzE4jlQ72wc27cC/gTGNrHsODro6Pv
X-Received: by 10.37.64.66 with SMTP id n63mr30623yba.106.1516650929515;
        Mon, 22 Jan 2018 11:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650929; cv=none;
        d=google.com; s=arc-20160816;
        b=hDeSX9Hsal5o2AZtwyc7YvWvvKmt5p47Yrn5v0tVpCYaBg1NH0b0EtzjQ8rb079ws+
         3qn1s9zt2T0n+ADJ/FqtwAuhBk4SzliMnK/V9Q29T1yy6OqMszLIiiP+K3aUxLSHNrij
         y1gL5oCL2mGvP9dfDMngTHoA/GuvUKgI6FptjV1x7VUuY8QniVR/g0cLOB/eLQuuSAti
         S6gshgiBAA7eEkNlx1S5eRKVhQpL0lec27TQOCEq9h1rtH5bG8HaId/U+178pGfS+eOM
         d19iOGjni9aFmQ79uDw0uhV+peU2/zZqtuJDc0Z0dmQ8jv4ChYLAhw2IhAUyfuaGeWlX
         LGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XVG4lqZ7R/tEhbk9R4mcG5eexBa3PfuLZywpMZ9rz6w=;
        b=WuIFUCzsC3BXUYH5x+uMpzOxZtUoxGZ5xTyuj7IiI6/EonlqfrOn2288fqcibGZs3E
         dr8g/t0yRB360YMNE+RU6fTNbSWW9qVahr0uYBH3e8dQ6zlLwiocCulWmG+OS9uY1xv6
         4mAOZ/OOQZiNXmxZWZAFY+4DxDM8KSDbheC3iqy/ohIoSupgd2wFL8o7BCVRdHB3nvWV
         TJiT0Fjbr4ieVAgh2uK+AgRvMb89FTzQMltaDNwnTm0vs6Gclk43HlLNrnOiP1AUt/bW
         k45G/Rb69fpi6sSWYIn6gCaXsx6NL1PGTRPbHgcsRVjR849LnjtMADkdfh2PFquzXrWm
         l+kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H3rHGG0u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 137si2075679ybd.151.2018.01.22.11.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H3rHGG0u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ediBk-0003zq-QL
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:55:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4q-0007Gx-Ub
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:48:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4o-0006BF-HN
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:48:21 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:45313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4o-0006B4-Br; Mon, 22 Jan 2018 14:48:18 -0500
Received: by mail-pg0-x242.google.com with SMTP id m136so942274pga.12;
	Mon, 22 Jan 2018 11:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XVG4lqZ7R/tEhbk9R4mcG5eexBa3PfuLZywpMZ9rz6w=;
	b=H3rHGG0uL6Wz014oX0/XimP+4kniZ9hla3qBAxRGjCtizJH7E8WR8oQy1UWnosYiID
	+8BDXPe5KiYBTjI/h/Gmt+IfxSo6Du/mlh3XnodD+K1YiSZoViqNElXKNhriEuawcb2K
	AjrPH3kfMLk9nh4gV/3PE2wIU0Siof7hAkOVqvsZlo+w40JEby5Qf7DrjLqHENNuMk7O
	nFa1MJAodAqFrK1+nO7Y3Yuy1vvlFvlC8eVkw6DnhUOUe/Fs3EkMHUupMh11hyvBWjqs
	hP73wrAYA1NQYIDVSz4zHbpe9ZPubLmK2zOPPqFCSXoIMwSLnCILN8/8WbTFRslwBJYs
	O58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=XVG4lqZ7R/tEhbk9R4mcG5eexBa3PfuLZywpMZ9rz6w=;
	b=iiUdaYDI6cd+Ck3oiBDktNV86Ww5aBCieR19/ey7PnnMVGHeKkctXDJhZYVVJ+vhPu
	31FVgbQqbYgRxwjJE2I2WCDTbjPUSyrYVZe5WCIUq5yohBSbmGgXDRRlbIYINm86rfYr
	S3aAtRGZMobaE16EPLDZZinmV6mh4JQcafFWEbh8D1qVJ5t8myjbChFNP/0Im5LZiXb7
	xQcYA2o/rE216KXo4WCJkU3TNDJmJpGKHkp3+cFVYze4G6z6PaCdQknfINM49CoNUS+6
	iO635t1yGpXVYOoJaVwJez1VBKMSNk3MqXwg9pnEY0t1Ii+OOK4tk4PMaOfMzjZs97VO
	xw1Q==
X-Gm-Message-State: AKwxytdpklKIhe92Q/71dyfSRRro9EmltZFPTPLktz6TITvh1/4Hsrai
	zAvUigRUpp9VQdtt/lqrR+l8smPS
X-Received: by 2002:a17:902:1681:: with SMTP id
	h1-v6mr3952094plh.369.1516650497073; 
	Mon, 22 Jan 2018 11:48:17 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	a28sm1831765pfe.70.2018.01.22.11.48.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:48:15 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:52 -0800
Message-Id: <7b176d7bc8271aebdaacb4635f7f31d8fc41c078.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v7 9/9] xlnx-zynqmp: Connect the IPI device to
 the ZynqMP SoC
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lcCi3tfdK9Qi

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 3e6fb9b7bd..0a2b037c6b 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -28,6 +28,7 @@
 #include "hw/ssi/xilinx_spips.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/display/xlnx_dp.h"
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
@@ -90,6 +91,7 @@ typedef struct XlnxZynqMPState {
     XlnxZynqMPQSPIPS qspi;
     XlnxDPState dp;
     XlnxDPDMAState dpdma;
+    XlnxZynqMPIPI ipi;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..ca398c4159 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -50,6 +50,9 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define IPI_ADDR            0xFF300000
+#define IPI_IRQ             64
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -183,6 +186,9 @@ static void xlnx_zynqmp_init(Object *obj)
 
     object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
     qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
+
+    object_initialize(&s->ipi, sizeof(s->ipi), TYPE_XLNX_ZYNQMP_IPI);
+    qdev_set_parent_bus(DEVICE(&s->ipi), sysbus_get_default());
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -454,6 +460,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                              &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dpdma), 0, DPDMA_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dpdma), 0, gic_spi[DPDMA_IRQ]);
+
+    object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.14.1

