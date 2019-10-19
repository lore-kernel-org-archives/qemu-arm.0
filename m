Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2719343wrm;
        Sat, 19 Oct 2019 16:51:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkvNw/Jh5vu/gwVzVIVRfEJTTIU+bH85HnK/piHNAVmPluW03mpJ++uOQByojokTyIpYwv
X-Received: by 2002:a05:620a:1678:: with SMTP id d24mr16392122qko.349.1571529100259;
        Sat, 19 Oct 2019 16:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571529100; cv=none;
        d=google.com; s=arc-20160816;
        b=rhoU1L4LN191nPP5Cjhrzb5cygRwHOarUIKZdFscd9SJmKaHrP4OPsk1RO6mQU5CUY
         EkZk5mo9Mr57NMv0PabsAxk7w/U3vvzRq2oQxr15NY/9ZIBpVppZ3FvD6Ks8MH2KBMRR
         GevQAAn8kBoOZ6WHev6p2gI6e8AtsM/1gjKKNjCeo5WAp8B8rThQsZd7zcaDa84+li27
         qN7tzpoNl5XSF8j82BXjo0GpJdLrhIdlVymxavGPrP10DTl0nOikrt/J10ikvNPvcO4E
         1+Wc4OmFm9GBPKyvd89CK0JhrV2oveMASXUODWyxf7CcoTUbXuGxoFvhueJTYE+FZlWB
         mj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sY2Qm/7hhsy40ev21MwjtX91xjLeIkmxivxQSpr/t90=;
        b=LABDat//quNZ84weeMM4tCZia+D2sngX3dNSoqcVbwa/nDLoF3KrwEmu9EOWiMucm3
         LnY5WR3T8qkT8YWEluu4K7BcuDLxg7hOqz3YyTBhZErC3WWbwst34+aaNL7xdm7WeQ6O
         xjxPJWDkHSBQgvPy2IU5TCGSfq2yjdPcTNXlAeoXZcm2lnoWFYvJRfQ52V6u/OzA/GOV
         po3wbR3NqSXz8iCp2uaIuB4HHOoVCipRMxcwfMgECVR0igzsb/AOpnaQDJ6RSuXsvnpI
         mrnc2zhf3s5mdxwvKkiVUC1NC5j/+wYRqEq8JG8rx47OSxjYJ+ZDO4N97ehxS9YAVBkF
         89EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T1lrTj2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23si9961448qkh.33.2019.10.19.16.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 16:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T1lrTj2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLyVX-0005u1-CS
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 19:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRd-0000Ln-7i
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 19:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRc-0005cN-0q
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 19:47:37 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRZ-0005aI-A6; Sat, 19 Oct 2019 19:47:33 -0400
Received: by mail-wm1-x342.google.com with SMTP id p7so9571402wmp.4;
 Sat, 19 Oct 2019 16:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sY2Qm/7hhsy40ev21MwjtX91xjLeIkmxivxQSpr/t90=;
 b=T1lrTj2RJSL9BB2q5MOVKZ3X9M1rtnTr1KmNPwsF69GyFv+AJuwy5Kxf6117NvJlOK
 e2qbUoJws8VW/KfOzd9q/CiY1SD3ebPCr73+4/aXgWhFslTSr1uI+uf3vhWo3vABZs21
 QXzvSsEG97hxVKmsECfpB7wtOqjfPV8m9cAm2FFyDKnf0U7UlBcsTKuKIdVnUMD/UP2W
 P6PP7GpYYyAT+vKr7TDnzJyQCDJIySP8OEOxVp0QoFHvSiNCZvxA35RldVAmecnQTqxo
 ZasoQFDTIB/+Bzl3BY2AYBGYRUgjHOKCHTMwBJVMwe26LBP0xGCEmKEHu5GGf8MysHkO
 ZTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sY2Qm/7hhsy40ev21MwjtX91xjLeIkmxivxQSpr/t90=;
 b=VPkflCDXId98cUxTZtvqg2SqTF6Xyuou9cDpiaBu6RXWPyLQfwEpoZ0sq5P96bmSho
 YZMvWPY3ZSHc7GmVq7/7fddnk8U//fiMZ/8wqF5XyGapTwTjq2JCA7Bw8om94rGuSD4e
 2nze/1XUMosBlfrfQfc14wdw/CMPhsbMbIfGUkmnVxP4eTYiF2eexw1H6Eha1hHTq2Bv
 yoMe2R7bUwNURjMV1D4jMUjFv/zrq0rpL1wFtyl8mAYrzH9oRHL+EKvZO0neLANggd/w
 HSgp5sjlMyGM3espVwW+gxcrsYc+XuOGxrLJA5Kqfdzqx1m92TxadIFYFZZcBR7ekRf3
 9Rsw==
X-Gm-Message-State: APjAAAXNhfUodtjNlwAThs1cRXhb8rOcYnkCoXLLQqOqLgS6PisodIE2
 913ZV/ja89Yavdr851zT5uusrwVj
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr9293880wmj.110.1571528852212; 
 Sat, 19 Oct 2019 16:47:32 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/16] hw/arm/bcm2835_peripherals: Add const link property
 in realize()
Date: Sun, 20 Oct 2019 01:47:07 +0200
Message-Id: <20191019234715.25750-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /BlvKiBrdROF

The VideoCore GPU is indenpendant from the Peripheral block. In
the next commit, we will move its instantiation to the SoC block.
The "gpu-bus" object will not be accessible in init() but later
in realize(). As a preliminary step to keep the diff clearer, move
the const link property creation from init() to realize().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 17207ae07e..d51e9c8def 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -82,9 +82,6 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size",
                               &error_abort);
 
-    object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
-                                   OBJECT(&s->gpu_bus_mr), &error_abort);
-
     /* Property channel */
     sysbus_init_child_obj(obj, "property", &s->property, sizeof(s->property),
                           TYPE_BCM2835_PROPERTY);
@@ -93,8 +90,6 @@ static void bcm2835_peripherals_init(Object *obj)
 
     object_property_add_const_link(OBJECT(&s->property), "fb",
                                    OBJECT(&s->fb), &error_abort);
-    object_property_add_const_link(OBJECT(&s->property), "dma-mr",
-                                   OBJECT(&s->gpu_bus_mr), &error_abort);
 
     /* Random Number Generator */
     sysbus_init_child_obj(obj, "rng", &s->rng, sizeof(s->rng),
@@ -112,9 +107,6 @@ static void bcm2835_peripherals_init(Object *obj)
     sysbus_init_child_obj(obj, "dma", &s->dma, sizeof(s->dma),
                           TYPE_BCM2835_DMA);
 
-    object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
-                                   OBJECT(&s->gpu_bus_mr), &error_abort);
-
     /* Thermal */
     sysbus_init_child_obj(obj, "thermal", &s->thermal, sizeof(s->thermal),
                           TYPE_BCM2835_THERMAL);
@@ -156,6 +148,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
                                         &s->peri_mr_alias, 1);
 
+    obj = OBJECT(&s->gpu_bus_mr);
     /* RAM is aliased four times (different cache configurations) on the GPU */
     for (n = 0; n < 4; n++) {
         memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
@@ -236,6 +229,12 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    object_property_add_const_link(OBJECT(&s->fb), "dma-mr", obj, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     object_property_set_uint(OBJECT(&s->fb), ram_size - vcram_size,
                              "vcram-base", &err);
     if (err) {
@@ -255,6 +254,11 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB));
 
     /* Property channel */
+    object_property_add_const_link(OBJECT(&s->property), "dma-mr", obj, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -323,6 +327,11 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                                INTERRUPT_SDIO));
 
     /* DMA Channels */
+    object_property_add_const_link(OBJECT(&s->dma), "dma-mr", obj, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->dma), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.21.0

