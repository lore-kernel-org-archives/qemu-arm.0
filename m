Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp729940wrq;
        Fri, 29 Jun 2018 06:31:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeblyyxcwovqOwI2e6yHjWsneoKqde9ciBfdI3DPxOFxawW1v+98W0ZWEwcqXRVmhjkwDit
X-Received: by 2002:a37:1bc6:: with SMTP id m67-v6mr13266027qkh.380.1530279072317;
        Fri, 29 Jun 2018 06:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279072; cv=none;
        d=google.com; s=arc-20160816;
        b=Npzh43dLlyxRUfG32a5oQhxQziTyQV1jF4VLx1ii6TuRHtZf2TlmFLWSF8Q8UJCKGn
         1ycge99UFwmY1knqV7ID0mq9vJqHQo2akkTfWMAS8rOhaX6GiA4WjJPbTruIzVKvBsL7
         hQhH/9k9jx7VIV/eB58JMFmTKxeQhcVd7OPLFczfVKOcZEvn//aA8B+DqBfkfkOfIwme
         78VVd1mb/GvpblIEoOFMb3wbFuWAr6CStQ0lQC3R9bhZP0cGbHhdfGolHgbKuCrfO9Du
         m7HTk4o20Y/y/WETRNks6cIICpzJORSrLL+/7+t+0neL1nsxarbMP+nTnHj3tz0vaEbh
         rjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=vZlYer19KgTRyUq6ExenFDvk5QHa6BYmQzz6/J02oTE=;
        b=B9LRVEFg3/Tk/JL/s9AxeMkJ+NysHPbqL4xqGlGlRGBDqG7OLkKPRy80T3Iek6GIsU
         2lEF/9F3eBPEzWOjlo89oaJRbYGeCW9WHwNOaYEDchALAWYAky/4jrbW0UKL3AR5555E
         HHzNrtUSSeevX1n7W2epndJp/rigZRaj60Ke/Rf3uQgZRlzPKLnBFzTUHqsWHj2IHNHy
         zp7VoyYTKa+X/Rc3ZoCikldhjymxDeqcXkyQuMGXDYTuQsc3CG0zjKu2Cs51L8YvJvEl
         mYVgad48QbDFv7RZXUMBphiYPcaRcN1nofzWJ+6A6sSj1bNAfioD3EX9y6Nm8aVBKYfh
         cJkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YBFeVsEY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KcgyqTr4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KcgyqTr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v50-v6si3183925qtb.311.2018.06.29.06.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YBFeVsEY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KcgyqTr4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KcgyqTr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUV-0007fL-MN
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU9-0007aH-KN
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006rW-8w
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:49 -0400
Received: from greensocs.com ([193.104.36.180]:58622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006nW-H2; Fri, 29 Jun 2018 09:30:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F36D44434B5;
	Fri, 29 Jun 2018 15:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279041;
	bh=PIhnC8PVzlvZ+ddBfg9Qq1hRX0bI4MURM++5ytkZF98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YBFeVsEYmdoAp75dxdQRN6tv1MbHuF0SovfzQLxAkosNhMR9oFmKqYQptl+micFXY
	pg9+tAdbCalNiYnm6hd2ejhlwuMj7tkz/Ent0OS7XTGKsUqcdzCbIdqOBUlsost9o8
	QNlJkgOCSi6+ujLuKdFQgg0x8l5y2BqP0kj4Fv4E=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KcgyqTr4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KcgyqTr4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id te0kfxsKMRLD; Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 3CF154434BA; Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279039;
	bh=PIhnC8PVzlvZ+ddBfg9Qq1hRX0bI4MURM++5ytkZF98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KcgyqTr44Gymd6XuT+qQ3tEpFb6ZgGDe4OeTQpOJLTTksDD63ThvFV8S0VvYlDrVl
	+YtgR7jEq8YhXz1p3WvVlK6g27ySqKiY71rqPfvOYXRtitMi0d7okepMcMOXTeu6ca
	4HkLwnJYYQEUM8YygTQye25fAnzJpLJjdN9aqbkU=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id BD2EF4434B8;
	Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279039;
	bh=PIhnC8PVzlvZ+ddBfg9Qq1hRX0bI4MURM++5ytkZF98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KcgyqTr44Gymd6XuT+qQ3tEpFb6ZgGDe4OeTQpOJLTTksDD63ThvFV8S0VvYlDrVl
	+YtgR7jEq8YhXz1p3WvVlK6g27ySqKiY71rqPfvOYXRtitMi0d7okepMcMOXTeu6ca
	4HkLwnJYYQEUM8YygTQye25fAnzJpLJjdN9aqbkU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:48 +0200
Message-Id: <20180629132954.24269-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 14/20] intc/arm_gic: Wire the vCPU interface
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
X-TUID: Pd97goFzxPHT

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
 hw/intc/arm_gic.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 2b1fa280eb..9bbd544a5c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1488,6 +1488,46 @@ static MemTxResult gic_do_cpu_write(void *opaque, hwaddr addr,
     GICState *s = *backref;
     int id = (backref - s->backref);
     return gic_cpu_write(s, id, addr, value, attrs);
+
+}
+
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
+static MemTxResult gic_do_vcpu_read(void *opaque, hwaddr addr, uint64_t *data,
+                                    unsigned size, MemTxAttrs attrs)
+{
+    GICState **backref = (GICState **)opaque;
+    GICState *s = *backref;
+    int id = (backref - s->backref);
+
+    return gic_cpu_read(s, id + GIC_NCPU, addr, data, attrs);
+}
+
+static MemTxResult gic_do_vcpu_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    GICState **backref = (GICState **)opaque;
+    GICState *s = *backref;
+    int id = (backref - s->backref);
+
+    return gic_cpu_write(s, id + GIC_NCPU, addr, value, attrs);
+
 }
 
 static const MemoryRegionOps gic_ops[2] = {
@@ -1509,6 +1549,25 @@ static const MemoryRegionOps gic_cpu_ops = {
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
+static const MemoryRegionOps gic_vcpu_ops = {
+    .read_with_attrs = gic_do_vcpu_read,
+    .write_with_attrs = gic_do_vcpu_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
@@ -1531,7 +1590,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
     }
 
     /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
+    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, gic_virt_ops);
 
     /* Extra core-specific regions for the CPU interfaces. This is
      * necessary for "franken-GIC" implementations, for example on
@@ -1547,6 +1606,16 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
                               &s->backref[i], "gic_cpu", 0x100);
         sysbus_init_mmio(sbd, &s->cpuiomem[i+1]);
     }
+
+    if (s->virt_extn) {
+        for (i = 0; i < s->num_cpu; i++) {
+            memory_region_init_io(&s->vcpuiomem[i + 1], OBJECT(s),
+                                  &gic_vcpu_ops, &s->backref[i],
+                                  "gic_vcpu", 0x2000);
+            sysbus_init_mmio(sbd, &s->vcpuiomem[i + 1]);
+        }
+    }
+
 }
 
 static void arm_gic_class_init(ObjectClass *klass, void *data)
-- 
2.17.1

