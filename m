Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2105012ejb;
        Mon, 20 Feb 2023 01:23:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+I37iFjXEAk7fDQJcI9kmmZhPSW7B1TnbMoHlUMseFu29STQoNcHeytittte0Q2NxlD49Q
X-Received: by 2002:a05:6214:2462:b0:56e:9551:1966 with SMTP id im2-20020a056214246200b0056e95511966mr314308qvb.3.1676885009995;
        Mon, 20 Feb 2023 01:23:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676885009; cv=none;
        d=google.com; s=arc-20160816;
        b=fhi9eZxaAYaFj/2+TECHShx9RkQR/V0STndjYpT157KGFk2vsRgluV3N3vaPhIyGzI
         DTu/qbYAY6P0GaZi8/JNwJwkhsbXWcYqugO5yARJvlQNfe7TZl7JDn+yvSiczlEJPCT5
         fS7iw8oPzGcUok9epX7sQxdaGNlKfHaolEH0TbdgGAXgxCPi9bhEqcrGMKmGLOf0zDBz
         8rLl9wkmynJW/Dy2JgVgfh/S/Vby13eOBdNooDUtyhO0hej+aX8+oOCpluR2AEUzM0aY
         QZlvFpUCiLV36b5LLDdo0Qm5nSctBpKJVCMK0okAUjOMScQTJ9Xw59PPHRpM2Phmufb+
         WqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JkD4ylCUPd/YYTKvkzbI+ReBZ+PYphiYSDNHJcbrxXw=;
        b=W4zJRVuGk+BzVyDXdIKSnNW+/LrPPxqme4vp05A8oc8jvveCZMWl5EvX/BbloZZ/kw
         Jn2DZhSSEuk7Hwq0ejWj2DPPpShKeE291w9WgjmlmdpSM5U9gl8UtBou/mVIGuvE2/jm
         khgK9CE5WPVkFpTOmV9mKGnX5zwoiUHU4+AHkT/hsi2iKKHnvL/pQDDxXNjG6fEtVOJH
         rGsuYsRlZ1VTCvQ2q1rCP6Vn7IEW5of+y1InzgzxtAyvEGJfD8SUeVC+m65Zizyzn3kp
         MrM8ULv7QRwYLDL054yZkE26AAZf+E+HfCu8ioXKk2C+YXf43ZZPJ7fnaOenS4Ew9Q+X
         LACw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PfUnD/Ir";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25-20020a0cab19000000b0056eda58138esi1535498qvb.47.2023.02.20.01.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:23:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PfUnD/Ir";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2IW-0001gb-78; Mon, 20 Feb 2023 04:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H9-0007Xe-46
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H7-0004ME-Ar
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d0700b003dc4050c94aso401425wms.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JkD4ylCUPd/YYTKvkzbI+ReBZ+PYphiYSDNHJcbrxXw=;
 b=PfUnD/IrABYau0XaQ92dv/4sRwiEfhCSs655lVSoDxgLHNT7XuxW50lHhSloPVQAtv
 1fr80LwL0vJF0J8LuhkP1fPHzoIjiJ1yobgJMG6dEWVib21CiwKZaMe70RgXkuHxeDpt
 azQBqMKr8HauYTc5jsgx7neLwjcz9qQYokzmb24LcZZpu/KAGsHMQ+p1xnTAXy3csIml
 4w5t13Y/eRzHzB98ZC+M4fSKRDYWLQpXx5owL7M3QrUyuhG2HkmF61VHVR5v8fopvOSc
 3XylvJJkjgT3byPWzRxAovoGSHn+niHN9rvxn1iXAcpFGVVFoK0/a8I2vX/M01ulBe+c
 YlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JkD4ylCUPd/YYTKvkzbI+ReBZ+PYphiYSDNHJcbrxXw=;
 b=yoZHjW18z2D02MPmYUDvlp7ve8sQfUQutae9/IFDgj+b0aPv0PEHSfswjsqw4pZekP
 SkuRbG1iCntbB6W+hbBC+hB7IvuFa0Kq7bGCOW9NuujroeVFChIsHfuQVfniXHU4lBp5
 BX5e2dFxejtNCca0z3CLAy5wUALKcLe98ibqx7f6Z0aHei2PuhmZkGNCpP4rK4myTLF2
 uajOEHch9hVnZ9l1otOOmKe0WPv+57TuEh2fhc1gxLHTA4MqeQl8ZYnYLbpwXD4kMX1K
 USfcL7YlqWbuT38XHwrvxtfi6IyPGw/UWLp7a0fjLPh2+VXZ4L8TFh7c1sB+QD//Dejq
 PvPw==
X-Gm-Message-State: AO0yUKUHQmAKYD/rXaq9j/sR7ZiCRO+b7nIRk2OY0yx/nKcga9Y4jQs6
 FdixR3evR2/cH/rlBxkiQZc2JvAzPcmdBKbO
X-Received: by 2002:a05:600c:706:b0:3e2:1368:e3a0 with SMTP id
 i6-20020a05600c070600b003e21368e3a0mr9518224wmn.18.1676884555970; 
 Mon, 20 Feb 2023 01:15:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a05600c224c00b003dc53217e07sm13119110wmm.16.2023.02.20.01.15.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 23/24] hw/ide/piix: Refactor pci_piix_init_ports as
 pci_piix_init_bus per bus
Date: Mon, 20 Feb 2023 10:13:57 +0100
Message-Id: <20230220091358.17038-24-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GkfuqyAZSE1a

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-21-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b74f1c77c4..acb4eaa27f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -122,7 +122,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
+static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 {
     static const struct {
         int iobase;
@@ -132,24 +132,21 @@ static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int ret;
 
-    for (i = 0; i < 2; i++) {
-        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
-                                      port_info[i].iobase2);
-        if (ret) {
-            error_setg_errno(errp, -ret, "Failed to realize %s port %u",
-                             object_get_typename(OBJECT(d)), i);
-            return false;
-        }
-        ide_bus_init_output_irq(&d->bus[i],
-                                isa_get_irq(NULL, port_info[i].isairq));
-
-        bmdma_init(&d->bus[i], &d->bmdma[i], d);
-        d->bmdma[i].bus = &d->bus[i];
-        ide_bus_register_restart_cb(&d->bus[i]);
+    ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
+    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL,
+                                  port_info[i].iobase, port_info[i].iobase2);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
+                         object_get_typename(OBJECT(d)), i);
+        return false;
     }
+    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+
+    bmdma_init(&d->bus[i], &d->bmdma[i], d);
+    d->bmdma[i].bus = &d->bus[i];
+    ide_bus_register_restart_cb(&d->bus[i]);
 
     return true;
 }
@@ -166,8 +163,10 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    if (!pci_piix_init_ports(d, errp)) {
-        return;
+    for (unsigned i = 0; i < 2; i++) {
+        if (!pci_piix_init_bus(d, i, errp)) {
+            return;
+        }
     }
 }
 
-- 
2.38.1

