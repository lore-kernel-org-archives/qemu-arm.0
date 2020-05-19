Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3830625lfb;
        Tue, 19 May 2020 01:49:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi0Ub7VQvKFaKiHph48C6wniX1IuxHmAREFk/DHi74ulZ64bYNC6+PplqsCtJn8LEG9ysi
X-Received: by 2002:ac8:518f:: with SMTP id c15mr20200819qtn.142.1589878172988;
        Tue, 19 May 2020 01:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589878172; cv=none;
        d=google.com; s=arc-20160816;
        b=jcUupYolgYRRrvr8PYvYVQWtHxv+WDPvaaLUskgOwY+kHkNShhURGPkkUJ8n/9DWPg
         VdfqbhnVf+pC2IOSljwzNeG2m2/4qKK/VioJqUEYY0UDbwi5ELkbNgy/R3aAnozItCNH
         OGtcoU+E3cXeQn/5+brsdPdRxmZX0G41aV5xvkboqszNum1YQu5Xx2/+yHiHESmTmqcZ
         VMU2IJ09HtPuH6S06PsoKB34bab5z2W0P6Poa1wyJmYec3qlm6mTsZk0AkssxLvLt1Di
         7VavS2fCc/IN4J5Zx3Ut2AFvDQvY9VFWvcvWLoxtlyi+NKTb7qpRBrUbj3fg43i/N9OR
         nyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from;
        bh=B49AWPD+6J2nW0qdjXofvGWJMe5HVvktRWlzLmZRZEo=;
        b=AWlH3jAoWGc1TRonEIrH62atIf9u8wKlirOHrPrenZNzW/lvMWAF64ACxL+iku5WrC
         wS2D8NGZc2TGnDrDytDxJPr2Y903vRsAvllnP5v75/6cKM+agmkRBDL3+VnvvTOGsmj+
         ofBEwMscG807gVFU2SEi/xtxS7ytyLOeTH3flpg1t12l90h31JmuOAwksheq7mzn1Ppa
         wN2Lfwh6gxEF4IDoJQ47lthw6ZfQUHGuVduhGqBLzWMegHR9CeKQPXDeFZvnh9aNuYMP
         +IYjcJhxJFaHOUyIeNNAwkmPAB9uGYrbp1PpjDwHn/d0k4y0z30M6RPQHtB1UcUsfPNx
         Gs3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si7056146qtk.14.2020.05.19.01.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 01:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaxwJ-0003sk-FX
	for alex.bennee@linaro.org; Tue, 19 May 2020 04:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jaxw3-0003oM-VA
 for qemu-arm@nongnu.org; Tue, 19 May 2020 04:49:17 -0400
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18]:42060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jaxw2-0003vU-0l
 for qemu-arm@nongnu.org; Tue, 19 May 2020 04:49:15 -0400
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
 by michel.telenet-ops.be with bizsmtp
 id gYp6220074CPMDc06Yp60y; Tue, 19 May 2020 10:49:07 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jaxvu-0002Fv-1l; Tue, 19 May 2020 10:49:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jaxvt-0000I0-Va; Tue, 19 May 2020 10:49:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/virt: Fix PL061 node name and properties
Date: Tue, 19 May 2020 10:49:04 +0200
Message-Id: <20200519084904.1069-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a02:1800:110:4::f00:18;
 envelope-from=geert@linux-m68k.org; helo=michel.telenet-ops.be
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHMp1JpWfmVG

Make the created node comply with the PL061 Device Tree bindings:
  - Use generic node name "gpio" instead of "pl061",
  - Add missing "#interrupt-cells" and "interrupt-controller"
    properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Split off from "[PATCH QEMU v2 2/5] ARM: PL061: Extract pl061_create_fdt()"
(https://lore.kernel.org/r/20200423090118.11199-3-geert+renesas@glider.be).
---
 hw/arm/virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7dc96abf72cf2b9a..99593d7bce4d85cb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -818,13 +818,15 @@ static void create_gpio(const VirtMachineState *vms)
                                      qdev_get_gpio_in(vms->gic, irq));
 
     uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
+    nodename = g_strdup_printf("/gpio@%" PRIx64, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                  2, base, 2, size);
     qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#gpio-cells", 2);
     qemu_fdt_setprop(vms->fdt, nodename, "gpio-controller", NULL, 0);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 2);
+    qemu_fdt_setprop(vms->fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
                            GIC_FDT_IRQ_TYPE_SPI, irq,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-- 
2.17.1

