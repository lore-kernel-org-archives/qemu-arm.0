Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp650034wrq;
        Sat, 14 Jul 2018 10:17:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeYS2/+3+Q79UqAe/OTPgsIEjAaG6/t1A3O+1RUGcKcUvrZQVpdxjWLG5c9qVoW4/Cp5wC0
X-Received: by 2002:a0c:e94e:: with SMTP id n14-v6mr11919769qvo.84.1531588663471;
        Sat, 14 Jul 2018 10:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588663; cv=none;
        d=google.com; s=arc-20160816;
        b=YAxIWyLirdblXvJL9RStMBzOnTMEXkbrWvWsbBqCbaQo3DXNQy5qaPIYQpE/iPTJup
         gYBU9UqSZHMnX+U0Z2iNdmAgU6MwSwWHpp5zAEMMiDhr4SofQj5M0igspBcX6tiuTNaq
         c1vNQAb6e2iGdL3TRHoF31zdpH/M257zOT4O8BB+wl7KUcLaweEO0oxouR6jMo9Koccr
         hCEGEM7ykzaa4DaK+gdFABPVw8GF7doDAp1NXCIoV4b3JTh4rwRLukfYyHWGej6TrBz7
         2ZLIswVjjdyMHAj0EQCg1g4EDrhu+jbSi4VeUikFA+IVmeYgxp2DclxbsIVGrnlh63Zu
         609g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=bi4XxZcuKH2t3V9uC5BFuI+GGBl6AxhTyZdAyJXDA14=;
        b=gF0CYn+FLAW7+2uQ6HZFP3HBZZ2Fqob4kAmW6ZSJfyOYPJSiJuRvVojvt9fGQ+edHo
         RL4s7GEms60VuN1R/NSqrspbQEV2f24GWSVSprokatjfRykRIhH83q6boW6MkCmcqPLE
         rLRuVSPLNw9wTuj5jGTycKvNxDHfjP23GNBCOl0jZydT7QRvnO2LHVxiSNgqqKXaYxTA
         u5d5/T4Bhn/112S0IGjpwBqhaAK2BnGszvZq+C+elr+iGADG4F7nGZCFm2O8yRQ5ldnN
         mOdHCJOKdwpqY1hBQuL2zByeR1JGYrDgDD6v0wErPRZssxhuN0sEobSkcyDlhU8QyWDu
         tubg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=eFhN31X7;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Ekq/0qtI";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Ekq/0qtI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z37-v6si219909qtz.116.2018.07.14.10.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=eFhN31X7;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Ekq/0qtI";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Ekq/0qtI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAw-0006aH-S0
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9p-0005l2-NF
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0004VE-As
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:33 -0400
Received: from greensocs.com ([193.104.36.180]:57343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9l-0004UN-TA; Sat, 14 Jul 2018 13:16:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DB88FC7AF0;
	Sat, 14 Jul 2018 19:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588588;
	bh=gz2wz+zEPSs+qe9FFQpxhPmAyov+ZYPoqU7uxXP/pZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eFhN31X7kMGqPOCSeQ0SZaS7xuyBFpkvkXAl+EOoBdEqWFInWZ8ts8jt8eMT1P62C
	xfj+QYQvG8Xn9Cdkl3YtvE2dyF0oGR9K9FpUjMi9S5SJKHqBgp5Gy2UlQ71NVr8iB3
	bcnMYVqVqYZ5mtNRoYhlPYpAVMq5XMy7A/KPBxcY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ekq/0qtI;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ekq/0qtI
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zp0ytQcj14Oy; Sat, 14 Jul 2018 19:16:28 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id F2207C7ADD; Sat, 14 Jul 2018 19:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588587;
	bh=gz2wz+zEPSs+qe9FFQpxhPmAyov+ZYPoqU7uxXP/pZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ekq/0qtIJuUfWECkpf5GsCpjHCEo0rQuTJPzx10A+/OWHPpsUzM0u+Og/WXzOqm1v
	VCKSFFXfChlk46L0FfDJQeHwuySfie8zOIfLRitwaSx2nxhxG+TF6m511ZmhBnpzh0
	sYNQs4CFDg6PoO+UG/V6+vy3Ic7qu4emH1VnzI2M=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 40AC1C7AE3;
	Sat, 14 Jul 2018 19:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588587;
	bh=gz2wz+zEPSs+qe9FFQpxhPmAyov+ZYPoqU7uxXP/pZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ekq/0qtIJuUfWECkpf5GsCpjHCEo0rQuTJPzx10A+/OWHPpsUzM0u+Og/WXzOqm1v
	VCKSFFXfChlk46L0FfDJQeHwuySfie8zOIfLRitwaSx2nxhxG+TF6m511ZmhBnpzh0
	sYNQs4CFDg6PoO+UG/V6+vy3Ic7qu4emH1VnzI2M=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:55 +0200
Message-Id: <20180714171601.5734-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 14/20] intc/arm_gic: Wire the vCPU interface
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jpfgq5jV4nAL

Add the read/write functions to handle accesses to the vCPU interface.
Those accesses are forwarded to the real CPU interface, with the CPU id
being converted to the corresponding vCPU id (vCPU id = CPU id +
GIC_NCPU).

As for the CPU interface, we create a base region for the vCPU interface
that fetches the current vCPU id using the current_cpu global variable, and
one mirror region per vCPU which maps to that specific vCPU id. This is
required by the GIC architecture specification.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 28ecf0c1fc..be44015c39 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1514,6 +1514,23 @@ static MemTxResult gic_do_cpu_write(void *opaque, hwaddr addr,
     return gic_cpu_write(s, id, addr, value, attrs);
 }
 
+static MemTxResult gic_thisvcpu_read(void *opaque, hwaddr addr, uint64_t *data,
+                                    unsigned size, MemTxAttrs attrs)
+{
+    GICState *s = (GICState *)opaque;
+
+    return gic_cpu_read(s, gic_get_current_vcpu(s), addr, data, attrs);
+}
+
+static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    GICState *s = (GICState *)opaque;
+
+    return gic_cpu_write(s, gic_get_current_vcpu(s), addr, value, attrs);
+}
+
 static const MemoryRegionOps gic_ops[2] = {
     {
         .read_with_attrs = gic_dist_read,
@@ -1533,6 +1550,19 @@ static const MemoryRegionOps gic_cpu_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static const MemoryRegionOps gic_virt_ops[2] = {
+    {
+        .read_with_attrs = NULL,
+        .write_with_attrs = NULL,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+    },
+    {
+        .read_with_attrs = gic_thisvcpu_read,
+        .write_with_attrs = gic_thisvcpu_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+    }
+};
+
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
@@ -1554,8 +1584,11 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
+    /* This creates distributor, main CPU interface (s->cpuiomem[0]) and if
+     * enabled, virtualization extensions related interfaces (main virtual
+     * interface (s->vifaceiomem[0]) and virtual CPU interface).
+     */
+    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, gic_virt_ops);
 
     /* Extra core-specific regions for the CPU interfaces. This is
      * necessary for "franken-GIC" implementations, for example on
-- 
2.18.0

