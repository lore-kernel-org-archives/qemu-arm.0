Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2391805ejx;
        Sat, 3 Dec 2022 15:19:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DL90Udc0una6IGspmMcK4ICiCPIU9Ab4tCcJy2V6UzGLip7v1TppsAbbOrtcE/fYhDXgA
X-Received: by 2002:a05:620a:3714:b0:6fa:16fe:93f6 with SMTP id de20-20020a05620a371400b006fa16fe93f6mr66448645qkb.258.1670109590806;
        Sat, 03 Dec 2022 15:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670109590; cv=none;
        d=google.com; s=arc-20160816;
        b=hdSuMn4+/L62Q/i/dwIVXKy1DgBk28L3b11ITDHLa6Irl4SU2oFfEErmY2q5lhtQkF
         jXj0K2FCGmOQIBpCBkCXuudi5Quzk/pJE+XiN4nYLlkB+lKq6XKPu3UKvjstvkyvJ4nl
         Kaos1ZNzTN9C6ejpia1zhOIuXMkhNmvNukuEwFvXi7CksByoFsk/tN4G1cIK3kydHxc4
         MIiV0m9ouPBH9Z3cK5kAfIh5UjhpvKefdRJmFXjoe/c8aq7JnmxSBEQuksyet8A84DAD
         z5nkNhz8v4RO8QqnEOh3B6JTK+YNma+iKq1bEWJTajLQN2jLRbr5KuVE/pqVsVdDE0t4
         BQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=61qnkc3RjxGV9ijuLcoNsoslKp4YOIfKGjRa+fFUZQ4=;
        b=I9k84oJj0rA/WJ5JyYxsLz5aXpHK1j2vRIavNcU725TGmeqvmSyZmslDAtUpm65YpT
         ZUnAuRzy8TrZdikHOYaXUm5ekh3oPkDE5UCLhck4UYsPBmHBID95CJaeW736N24Xg5Tm
         PczCpn+tluP4Q1cwMMWUmSSg29Uyi3BU1RSKmE/4WWg17nJIznCfTxt4QOUS+YXAbVug
         s+7MmNOC60pL6wcCm9dBSvCuw1yFov7tmSA8pe4QZNxznPCvuFikYtzTtbOD20php00h
         AROvuGuGpPGaU2IPFZ/LY5XcXIzmij8QgVt48oHlAIWXnx/CNiQ/DlnZ5nxiinE+rXVe
         MMyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kWKuJGOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05620a0bca00b006fa4afd3003si6233013qki.688.2022.12.03.15.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Dec 2022 15:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kWKuJGOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p1bnK-000068-Ob; Sat, 03 Dec 2022 18:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnJ-0008WE-9J; Sat, 03 Dec 2022 18:19:41 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnF-0001Zy-4v; Sat, 03 Dec 2022 18:19:41 -0500
Received: by mail-lf1-x130.google.com with SMTP id c1so12930525lfi.7;
 Sat, 03 Dec 2022 15:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61qnkc3RjxGV9ijuLcoNsoslKp4YOIfKGjRa+fFUZQ4=;
 b=kWKuJGOnFe3SNyWIbY/jnrI2xVogtEBQllrtYrFFf1ZcYSjWohye9FGnpBFEJtHcZD
 v3oMr8voG07txSX35PfhSJax5g802SzdEFmOnubNI/jk9MWNSrEUiaRz8UAeXYO0HOcn
 D7PuYIB0seb3h1eYG6cA0etQF+w5YLJ51cSbXLcNIznlNf8xl5F6cCyHEQ/ctU4VIJNw
 lGIHGYExrK0M8hKichEMRl7rEP/FhHemFQI5f80GWxLUbRG7bQdtonxa9AgVJg3ggxNA
 O4Hz6+PuJUpck37YQeV3GCz392/zKiRQbUOX+Vn23KEuNujWuCD4j3NLt42z0WOMUbj6
 AXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61qnkc3RjxGV9ijuLcoNsoslKp4YOIfKGjRa+fFUZQ4=;
 b=HDvJuE27t5DYhgbn9n7l0nM6ggc763uSVNoZnoL9QxsXI47nSIEQ3MrvBonesB8h4T
 sBSa3MzoiP8WyxxupeUWq8gCtTFc8yanFoQWxoaxWYn+2AvAik4bvkSAnlpRk1q/dI8s
 t2/EcelGb64Sfyl5lEskRTw89YdIvBwIh2QhUaNkKI1WAS1EdFEyjrrQq2xlyKO2fNEx
 NKm7LbDLceM2N3s3vwwjQiC2K9S984Oe8MHC8ZrI+GIGD5d6VvRvdBAO1MStOQpPTpUt
 woCzr6miAjQGqTtfDMif9+Yxlqqnlal6GpfD+FQZqOAbGR86sdhREVU2WXs8AyDTeGV8
 icEg==
X-Gm-Message-State: ANoB5pmkusGo44Mg2NAI1vAMdw2ZzdKtH9c3kjq9DJ1RiqzQcI/A/qVf
 2GcuYfBwvjYWOjI4wZb955s=
X-Received: by 2002:a05:6512:1285:b0:4a2:26ed:a129 with SMTP id
 u5-20020a056512128500b004a226eda129mr24084736lfs.616.1670109575289; 
 Sat, 03 Dec 2022 15:19:35 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:35 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 6/6] hw/arm: Allwinner A10 enable SPL load from MMC
Date: Sun,  4 Dec 2022 00:19:04 +0100
Message-Id: <20221203231904.25155-7-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Z2oOI54tiW3r

This patch enables copying of SPL from MMC if `-kernel` parameter is not
passed when starting QEMU. SPL is copied to SRAM_A.

The approach is reused from Allwinner H3 implementation.

Tested with Armbian and custom Yocto image.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
 hw/arm/cubieboard.c            |  5 +++++
 include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 17e439777e..dc1966ff7a 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -24,7 +24,9 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/usb/hcd-ohci.h"
+#include "hw/loader.h"
 
+#define AW_A10_SRAM_A_BASE      0x00000000
 #define AW_A10_DRAMC_BASE       0x01c01000
 #define AW_A10_MMC0_BASE        0x01c0f000
 #define AW_A10_CCM_BASE         0x01c20000
@@ -38,6 +40,22 @@
 #define AW_A10_RTC_BASE         0x01c20d00
 #define AW_A10_I2C0_BASE        0x01c2ac00
 
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
+{
+    const int64_t rom_size = 32 * KiB;
+    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
+
+    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
+        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
+                   __func__);
+        return;
+    }
+
+    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
+                  rom_size, AW_A10_SRAM_A_BASE,
+                  NULL, NULL, NULL, NULL, false);
+}
+
 static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index afc7980414..37659c35fd 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
                                 machine->ram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_a10_bootrom_setup(a10, blk);
+    }
     /* TODO create and connect IDE devices for ide_drive_get() */
 
     cubieboard_binfo.ram_size = machine->ram_size;
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 763935fca9..b3c9ed24c7 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -15,6 +15,7 @@
 #include "hw/misc/allwinner-a10-ccm.h"
 #include "hw/misc/allwinner-a10-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "sysemu/block-backend.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -47,4 +48,24 @@ struct AwA10State {
     OHCISysBusState ohci[AW_A10_NUM_USB];
 };
 
+/**
+ * Emulate Boot ROM firmware setup functionality.
+ *
+ * A real Allwinner A10 SoC contains a Boot ROM
+ * which is the first code that runs right after
+ * the SoC is powered on. The Boot ROM is responsible
+ * for loading user code (e.g. a bootloader) from any
+ * of the supported external devices and writing the
+ * downloaded code to internal SRAM. After loading the SoC
+ * begins executing the code written to SRAM.
+ *
+ * This function emulates the Boot ROM by copying 32 KiB
+ * of data from the given block device and writes it to
+ * the start of the first internal SRAM memory.
+ *
+ * @s: Allwinner A10 state object pointer
+ * @blk: Block backend device object pointer
+ */
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
+
 #endif
-- 
2.30.2

