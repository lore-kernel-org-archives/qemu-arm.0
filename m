Received: by 10.28.173.206 with SMTP id w197csp6872508wme;
        Thu, 18 Jan 2018 10:46:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBotzW7BYN0K8ZRllrdP8IAyNpm3mRKm3TlWkqjgdm4h+HBYv+8CuoYeCJtiTklnrqCPJTqCY
X-Received: by 10.129.174.7 with SMTP id m7mr6817554ywh.382.1516301178623;
        Thu, 18 Jan 2018 10:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301178; cv=none;
        d=google.com; s=arc-20160816;
        b=UAjBXF5U/L5EZ2uBYrm7Jkw35tbpBmZ4XbJz9g1AWKmVaqzW/7FBVKf3H+AA+jT+Sz
         teUdwgToiiv69pLjgl0E0V5rR8OEXaU1OnUrUN9fgdSSwVC/0007bbIAFXnTHBzNoQn3
         RKKp1iYmfu+69NU3YAm4mlXbvxt8iN/ri93mTFnZp7U51evY5LDwsyfmKkdgJwXrbBVR
         Vsh/Cm9A6eNMvDb7czH1M+Y/vDrQja8EoxRszWpd1GKgyTEBjVTcG7yvp6C3k4KokCYl
         CI4UAN2hb3tlkjZ3/2bHJwmfYUYAutMUNf+z3stfLh3xIUImCfswPTOLuGaybleIOMtc
         Z0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XVG4lqZ7R/tEhbk9R4mcG5eexBa3PfuLZywpMZ9rz6w=;
        b=htvK5HymZB8i4mz3GAWRnoZxqfS5G8CrZvu1Di2estCM8VeUxomxMgFIWIAe+qjyro
         ZaDdj/QKlI4n5i1wc8SVDXLHzCOPWsaJgQ1mNH3Fmwv1y5FGSIwVo4h3rK6hsF6vNcVL
         UI32by8NKFDRxkWZ1w7Aotc15dm3SQ0TyQOHyZirFYZQ5vkleMpHrdBDtlf79Mi3qWtC
         pIyfzcTWb7yzWoQHbWjPa0g5SaCSpNPGPGIUpu3/pQqrHzVlZ28/Ujt/Nn9msSYtEXHj
         cL3Ku4fNEV3nV+OjnE7rdU7wEhe8SVtkQqSwHWl4HwXuAf3Uzb/yirtfgDwe07tQqMzh
         pWzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pc6oVQuI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b204si1845265ywc.663.2018.01.18.10.46.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:46:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pc6oVQuI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFCb-0002Bu-Sa
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:46:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF9H-00080u-9K
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF9G-0003KB-Bq
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:51 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:38474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF9G-0003Ja-6F; Thu, 18 Jan 2018 13:42:50 -0500
Received: by mail-pg0-x241.google.com with SMTP id y27so8994048pgc.5;
	Thu, 18 Jan 2018 10:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XVG4lqZ7R/tEhbk9R4mcG5eexBa3PfuLZywpMZ9rz6w=;
	b=Pc6oVQuItUleWGTnuD5CHStW4Dh+RYItW9l01Jkg9xgTFLPp+WPo6gDGZwmspb2b/3
	ZGnUQVnU7MpojRafkk8+ytUwBTIfcO+S/KkseDJJ87xuV5RIl7leAi8gcOeguk80Xf6e
	1+0YKecwWD1gICdVOe4fnvf+oDUFETLZLBmZx91o8bpwbnxTixugjLki9K5kkVY6SF3W
	0kTTo8G8qeFjkSjaUYovv9K2AGZlHv9L2zR/wTCrEEnB6JRVnL2vw6mG2Ov7SPYKDfZP
	ocIUazs7oTL/vZAyNcyMZWCX/++aK4RDVem45FP4ZkLi3UxyHiCWU5sQw3oDVWXnG3b4
	23Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=XVG4lqZ7R/tEhbk9R4mcG5eexBa3PfuLZywpMZ9rz6w=;
	b=NogLS03OUOS9rKbLuDGkOSQwIlb0JysrvCuZCXGEZTK9ipfwhsZ4DwxxhD3GNtVOI3
	jcwSltKFRMKqAXpAWOHfvk5stNecv0Bbb9zGIPE0Byq/cqV0ydYU5Vbt3YbEWDBpU/6Y
	UEfOG0Z+i5CrLcpE0LBPdqhBmvslH61rNayKoYEmTrgU00AhscZ9LM1cXHPlXOow47tZ
	uOqTVsEG3iVvBbjU5msHG5Ai2/Opn27f/l61TLWtW4P+puBD8qUh2XNRrdfQIFftRnoe
	H8wY1xuQhzHQwfwzru8P+wUucNC52zmpEjqY6oaPBVHoS788S+YSfkMP1LBxbx9AW9N7
	sN3g==
X-Gm-Message-State: AKwxytf0YBYO+eKCQWM6Gf+/uZuluGqtTaywpUtWBJ4oLPCvUFdNvEX/
	jQMtfj3LDbxpooB9T4xpmF7nR4OnrGQ=
X-Received: by 10.98.10.217 with SMTP id 86mr17876389pfk.240.1516300968988;
	Thu, 18 Jan 2018 10:42:48 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	q13sm12549307pgp.76.2018.01.18.10.42.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:47 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:38:23 -0800
Message-Id: <188965748a7065402eb1089492669809108b0f0c.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v6 9/9] xlnx-zynqmp: Connect the IPI device to
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
X-TUID: dLPatAYg0gMN

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

