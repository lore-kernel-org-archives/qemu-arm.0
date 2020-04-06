Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4246315lfi;
        Mon, 6 Apr 2020 10:59:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ1Mi62EqU8O9pO+wxfQDmUoA+u3vZx/SQIUKp8MNRU65RIMtVqXHCmHwvZyNiK2ZCbyQR7
X-Received: by 2002:a05:6214:38e:: with SMTP id l14mr847567qvy.99.1586195961231;
        Mon, 06 Apr 2020 10:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195961; cv=none;
        d=google.com; s=arc-20160816;
        b=YwTJNgOrfsZN59YRuXGanJRa7TjLcR+M2pS4oZqiqlf8CiCEBWqgAqr0+7LO0OVnCQ
         ZFABGhLpNW97P9G4whIPRSscgf1Eq7UlV9/QJ8ZVU5tKR+Vt4iZ8lugWTZabBZ5axJb3
         93vlviUjpDDoQHjeWHBayjynBV5Uwsvmg1kCxNP8uGrPGEpXtgpLxEIZWtwgXMrWV1sY
         3po/xafYlkiij0naqCBWcf35EipQGJ5tenOziWoA06fpURtdaRQHqq/zfsjCsT0rIPbC
         HCexverAr9jW9vvJaP1erAkFI3GOWJsiIUn/646P5iqLWnUW7VXeJblXkDAN47gehkAt
         khdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9GzJBcaH7YPzqJchPXzUGJQV7uPNUIzvdkgPb+3/qBw=;
        b=wZqTmo5R18ouikQpK+ZVj/E4fV4EpH+0M4vTKZkK53XDL54PvGEuAZq6iI1XTU9vXh
         F3cLUBGx8CQ32t7a5R5u0Tve56yIIKHV7dcLiVLYEIMUFULW8Y3gnpRz3rKI5VN6RCBk
         pLbzLAdxtWDah7AUDHsW8hrECl9kze8DFP5yjLFxxnoLNAtZoWWWnCSYrStFQBARJL8s
         h0Dnq379ct48PysyKLQURl+Sb1Xa/Fw9OEVNJkvkg6cXYnV6jFC0eOrEu+LF28tDqYuq
         5enjNG9Mvd3Qg26Pqdlpf5qQIsiFhBjfJ0ia9ZOyUB505syh4utRm0Ry7V8GCTvntB5k
         P0ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lJezb71x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t186si278726qkb.61.2020.04.06.10.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lJezb71x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLW1o-0005I5-KB
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr2-0001vQ-0T
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqz-0002dU-O7
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:11 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqz-0002V2-HI; Mon, 06 Apr 2020 13:48:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id p10so493725wrt.6;
 Mon, 06 Apr 2020 10:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GzJBcaH7YPzqJchPXzUGJQV7uPNUIzvdkgPb+3/qBw=;
 b=lJezb71x6OD7EoU5SBsLyeXUDP99ZBy0CoJ2JTT9wrKvQUrcAA+9t72QAzfSE1WKGY
 EuPlLcv0ZcepsfwePaaxGy+zU7JE2uUkM1GqwPcaDLqcCelTrOHmQNMqm2ei0ABRHkWt
 aKg7QHkbs0qjq8UVo6L8r1RZq+ZElSn6kIcFWnDMOKx0Io7ptetsDceQeD/ULVjwWjVl
 uUrUJrfxI1NG0HsZ1DS0n8pnfGvQV559182Rs9a0IsPAk4p8cgVKaU5LSLarEY9Vq255
 aqLVBlzgTwXtNVaGTyW/y29r3kd0E1LhZROdcw105xJuLHfej+x9WsqQH6Jy7zHYNN5I
 9S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9GzJBcaH7YPzqJchPXzUGJQV7uPNUIzvdkgPb+3/qBw=;
 b=hGfi+fS7iNFWY8ks17ZVB5C7o+VGMDQYkkZwoaIcXLAh/QGOTYTtwWDg9c+jO+oGSQ
 Q9DWQQk1u9pN4WOZmAGhu9i+R+qCwM70hskqVG0o3vRFLizhEmnioHyq5atBAM3ldmzH
 PlFMpnaufNZ08FJg0HBQkG2SqsRIg928bpyDCn859KQ5TAp0hQFSWUTI9fFdD9mw/QQL
 8+kNxIoiS7bXgJpjlacc3uQD4clyfAXysPN/sT4GX+QvJYv39mlR+d1KqJ/okIKJZ8NI
 eB3gQihMmTJ1h/hOcOKdVzMLfvjFnFETInJ68HZxCO5yxhNj4T3iz4IHMVId4wsIa6cq
 SSlw==
X-Gm-Message-State: AGi0PuZxVKHjLHoq5WMjjVsqSB+7miYs6oUoDdHNfM3rq7UEwCa3Q8v4
 z+HLZswk2xDR5B6Vd0gNav8jbEu1T2g=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr362504wrj.95.1586195288048;
 Mon, 06 Apr 2020 10:48:08 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 16/54] hw/arm/xlnx-zynqmp: Move some code from
 realize() to init()
Date: Mon,  6 Apr 2020 19:47:05 +0200
Message-Id: <20200406174743.16956-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5TpLjwDfNM0

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/xlnx-zynqmp.c
  EXN: Coccinelle_modules.Common.Timeout

Move the calls using &error_abort which don't depend of input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 457057198a..5ec9c24ee7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -242,6 +242,11 @@ static void xlnx_zynqmp_init(Object *obj)
                                 &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
                                 ARM_CPU_TYPE_NAME("cortex-a53"),
                                 &error_abort, NULL);
+
+        object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
+                                "psci-conduit", &error_abort);
+        object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
+                                "reset-cbar", &error_abort);
     }
 
     sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
@@ -250,6 +255,10 @@ static void xlnx_zynqmp_init(Object *obj)
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
         sysbus_init_child_obj(obj, "gem[*]", &s->gem[i], sizeof(s->gem[i]),
                               TYPE_CADENCE_GEM);
+        object_property_set_int(OBJECT(&s->gem[i]), GEM_REVISION, "revision",
+                                &error_abort);
+        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
+                                &error_abort);
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
@@ -259,6 +268,8 @@ static void xlnx_zynqmp_init(Object *obj)
 
     sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
                           TYPE_SYSBUS_AHCI);
+    object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports",
+                            &error_abort);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         sysbus_init_child_obj(obj, "sdhci[*]", &s->sdhci[i],
@@ -370,9 +381,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < num_apus; i++) {
         char *name;
 
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
-                                "psci-conduit", &error_abort);
-
         name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
             /* Secondary CPUs start in PSCI powered-down state */
@@ -387,8 +395,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                                  s->secure, "has_el3", NULL);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                  s->virt, "has_el2", NULL);
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
-                                "reset-cbar", &error_abort);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), num_apus,
                                 "core-count", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
@@ -490,10 +496,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
             qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
         }
-        object_property_set_int(OBJECT(&s->gem[i]), GEM_REVISION, "revision",
-                                &error_abort);
-        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
-                                &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
             goto out_propagate_error;
@@ -514,8 +516,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[uart_intr[i]]);
     }
 
-    object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports",
-                            &error_abort);
     object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
     if (err) {
         goto out_propagate_error;
-- 
2.21.1

