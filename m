Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507642wru;
        Fri, 27 Jul 2018 02:56:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfaSzU9TZUcJZf0v6CyBuO9NKehGvklLeyQKO30P8tnx/vG0+6rPcvINBewb1cYE+bUW4nG
X-Received: by 2002:a0c:ca14:: with SMTP id c20-v6mr4961139qvk.8.1532685372805;
        Fri, 27 Jul 2018 02:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685372; cv=none;
        d=google.com; s=arc-20160816;
        b=T3CiBn8QBX9dqvOVdHksJ/ceH9GYwZlKegubc79jChhBJM/IZC+e6GbKjFvGflNHSO
         ogH7AolJdjSNWX5gx1aFNdVIztBVv77PTYLhSvUnIVUHdwOvcuGKh8HbXt/uDnDW1ZRU
         IdEWTDHjm8qk04E1Bj+Faob8l37CYmLl4D3iQOgPlp4AsZKpQi48LguZgP92kK/APhFF
         Bub72I0006RWUc+D73S4LgRJ4E0+/hR+3uzk4XjVOd+arAL7/qQTTAqW7kMSKWlfzJ5F
         r5AF/t+3fv1Pjjr+fcoLnsLcFpKQrqnC3QfN6Z5yh2CWK++gko20G+9cjVbg+LDpQJDa
         0QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=LfTBE8ByEg2JURfEL/NN+/aYP3rv9jXwG6l8JsVI0Yk=;
        b=q0gT+YSrCumiGH39LZrRM/Ro7qZGt24irLx98O8vvDaGpRlzxjs0aJyKkg/cKd+fFe
         D2PEp0Mm7PaoElylyOlg7/g+Yhxxptj2euYNmMqq72j3W/yVA68mfHdo2j1F+B+WUQ/f
         4SXIuRBqM9SuktfSiXk+Nb4MriS+QGcLeWa5LFBKyiM70Q6A106/cu8M7xsN5pUJrsH/
         iaZUVoIwcXhChMkyzOtmrSQBf/oOcopl1BpUC97XywtPJIducIdAKlxTPUQSdp1kuKNz
         oVGMDs2EDWQ3PJw5fwlvjrMq/Pm+363wWh/NStP37NMyRY5IHfJyF2xJduRLSPbJCSyf
         923g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BXSfjHLN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=v1yHMrwP;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=v1yHMrwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198-v6si3641947qkh.21.2018.07.27.02.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BXSfjHLN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=v1yHMrwP;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=v1yHMrwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTm-0004wM-Us
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSe-0003a4-Vp
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006BQ-HC
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from greensocs.com ([193.104.36.180]:47526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-00069I-18; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 8594A44A0F6;
	Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=cHsBGH+B8QsVcvDWbU048HeIcJif0GXd7IS1ZEW5Egw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BXSfjHLN2HjhquaZmuf2m+SpHbvmTDUF4uSIALRLa53nblcEJn9ynLDasibf2PRm0
	0fQ1kKL8z2us5Vc2jFb+olFB5PWRgtT6O6xMVSNm0NH7oZc1oqmCXIJCOhr1kwsk24
	tQbzM3+Q1/vO+mXmUeYWmmvhKjfWTpq24//+vucE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=v1yHMrwP;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=v1yHMrwP
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zC4pEp7RQr7p; Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A60584434A7; Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685288;
	bh=cHsBGH+B8QsVcvDWbU048HeIcJif0GXd7IS1ZEW5Egw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=v1yHMrwPgUdTbK8x9bUJMWw+buVPTjtj7i+mLWdNVWZWZYneUJLusWB2Mh57lLNWX
	vXHybOZtLLvLcKEt1opjp9dHub3azHsmGXzXwyoDcYh75QwMPSdMcqSJeYehFMEaIC
	hmtUrADd5PDcU0qTqeyVU1ZqZ9ypRxWw8Mqx1yZk=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 20CB9443485;
	Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685288;
	bh=cHsBGH+B8QsVcvDWbU048HeIcJif0GXd7IS1ZEW5Egw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=v1yHMrwPgUdTbK8x9bUJMWw+buVPTjtj7i+mLWdNVWZWZYneUJLusWB2Mh57lLNWX
	vXHybOZtLLvLcKEt1opjp9dHub3azHsmGXzXwyoDcYh75QwMPSdMcqSJeYehFMEaIC
	hmtUrADd5PDcU0qTqeyVU1ZqZ9ypRxWw8Mqx1yZk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:15 +0200
Message-Id: <20180727095421.386-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 14/20] intc/arm_gic: Wire the vCPU interface
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
X-TUID: yvrJGT8u4WbL

Add the read/write functions to handle accesses to the vCPU interface.
Those accesses are forwarded to the real CPU interface, with the CPU id
being converted to the corresponding vCPU id (vCPU id = CPU id +
GIC_NCPU).

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 0e1b23047e..7ee2e6bcbb 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1553,10 +1553,27 @@ static MemTxResult gic_do_cpu_write(void *opaque, hwaddr addr,
     GICState *s = *backref;
     int id = (backref - s->backref);
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
         .write_with_attrs = gic_dist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
@@ -1572,10 +1589,23 @@ static const MemoryRegionOps gic_cpu_ops = {
     .read_with_attrs = gic_do_cpu_read,
     .write_with_attrs = gic_do_cpu_write,
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
     int i;
     GICState *s = ARM_GIC(dev);
@@ -1593,12 +1623,15 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "KVM with user space irqchip only works when the "
                          "host kernel supports KVM_CAP_ARM_USER_IRQ");
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
      * Exynos 4.
      * NB that the memory region size of 0x100 applies for the 11MPCore
-- 
2.18.0

