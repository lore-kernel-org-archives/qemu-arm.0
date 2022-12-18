Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3013298ejb;
        Sun, 18 Dec 2022 13:21:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6GQS9zoJkj1K2gitBXCad52vYfBYbgBP2SMag23pw7iAg1P2NJBGLevObZ28p7cFnjV70r
X-Received: by 2002:ac8:534b:0:b0:3a6:a292:286c with SMTP id d11-20020ac8534b000000b003a6a292286cmr52426442qto.18.1671398476309;
        Sun, 18 Dec 2022 13:21:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671398476; cv=none;
        d=google.com; s=arc-20160816;
        b=vlECYxXzjPvdmWq6Pt0r4du2C+7O2s5U3nkh2x4xP/HjKQb9WDKvyclzlCX+HRuPa5
         a7CxDMKPBHSUKx8A3H9jBvtoHNh4F5xfVhH3MD22x6AJEjrwDFkK9vnaBe41RIP31Vqz
         U2jer6CwNPlDVZEkwc3HIkg7ctq2GLMJWJXP1QVWNo3jkk3A8Wpmz5n5gmZEwTUrsA/x
         odxwGCz5U85+b6dzH5TcSJ0lSF/B7NzGwwWEhrY4IgV5WaiRfZW02b8N20phcZTppofv
         cdSFe4aNN3t0EGi++2CawAfOA4THRFmwhFF0Zn9mVq0cufJFWuNKjLHvaqlr9iYrnNq8
         im/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c08hVl9D9/u/T28Fz+sqopcOehEP0Ikwgs0RHn7FUE4=;
        b=TlfwpEGtOq1GUzAPWza6qRYQojFKFGIFlIkczIefl6Me0vT0mbQxHp8BQT09Jn/x/A
         W5aMQQr3Usb+Vgh2mtidOZVI2J885M1ZKFPFQqHdk7Ime56ARiN8r2OoKEsXJP4WHDXx
         fnNTBQJmF7FRphZwNUEIS8JTbZA92sO6uzcPJP4zWoasO0gEgvgdpomRiw/sjATuamGW
         iG++jfOnKvHTSulIJwpL9fkP7lD3yy/kEXI9tYalTOMXmdd8mi4JgXKx4pqCV0WtyNFR
         KRYmgth1/emvwYiWe8h6m7H+5GAAUL/A93xHyrpcDzML5ftkT1YcQYs9OSerXz0uvYJw
         3TTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2att2n0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a05622a124c00b003a35753365dsi3547201qtx.77.2022.12.18.13.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 13:21:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2att2n0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p714u-0001F5-QS; Sun, 18 Dec 2022 16:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714F-000132-Qy; Sun, 18 Dec 2022 16:19:45 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714C-0001xu-QC; Sun, 18 Dec 2022 16:19:31 -0500
Received: by mail-lf1-x135.google.com with SMTP id cf42so11132339lfb.1;
 Sun, 18 Dec 2022 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c08hVl9D9/u/T28Fz+sqopcOehEP0Ikwgs0RHn7FUE4=;
 b=i2att2n0VwJ/3bKuHh8FH1yazM93JCE0oN6KSYqmvj6Cz9Gj611BMt8spLu3Y12KXF
 cPp/S/v/NOL6jXJI8ruawtnYPdTXUXyenZUo1g4x6TAKHgUyEUdHn7f2b6Mc+tqN3HbU
 LU0d3aLUVvR8n7jiscE36RCBbvZxNtK/vfcf0I1321iJG0XtFUAuoUdYjexMt1/qL83/
 FOd/HEhIGy9YsBZOtXzMP8OzLADMKgOOxSfCW/kW8mWDrfgAqHtUGeJ7OcyieFJRDPsh
 MqsaeUFjYHhkNTmZtUUfkWmI5rQKbheH9S+dIIFc6hDQkq/R1K5zKYvAs6YTNl+A4J1P
 9dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c08hVl9D9/u/T28Fz+sqopcOehEP0Ikwgs0RHn7FUE4=;
 b=QA6UNfs0Oz7oSW+CEWBzrWFRPgJ1tOfgFwTLPww/lcQJmHuUzFjXQcIfVoN7lJI+cG
 K03iM+FOyiL2YvusPltSv1GzfsP1CLBuO/4HjSGE9JDybdi3/HgJwjQ0NdlHIpmLd1HW
 /QjaC2oliL8Sctzdh8mtdnx+LNcMWiUW+9Foa27mT4zRY5/wexuBGqOLXYzf4WIBLiuM
 ydgDvCNxMVFO3tolRZXSfl/QVe/l7RM0FHUdTYqIBWuR6soMThrEMnGlbdprONywPAMH
 ggADAeNOEojboM3L25caGsUPeq0TOS8FH1bbcsm6Zfc6IoIDRsT4MhXXLhFKulYateII
 WiKw==
X-Gm-Message-State: ANoB5pnCfJfyIu771Yh/VPn1tfXzCMO4wQPn0XcehFAH7JGXXJZosjL2
 g/faCWPwJE92wQfu2ZP3A6wIN126Uw3qZA08
X-Received: by 2002:a05:6512:de:b0:4b5:2ef3:fd2a with SMTP id
 c30-20020a05651200de00b004b52ef3fd2amr16845051lfp.47.1671398366785; 
 Sun, 18 Dec 2022 13:19:26 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 w7-20020a05651234c700b0049464d89e40sm902620lfr.72.2022.12.18.13.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 13:19:26 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 6/7] hw/arm: Allwinner A10 enable SPL load from MMC
Date: Sun, 18 Dec 2022 22:19:17 +0100
Message-Id: <20221218211918.3592-7-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x135.google.com
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
X-TUID: oNxNAdBxUBDQ

This patch enables copying of SPL from MMC if `-kernel` parameter is not
passed when starting QEMU. SPL is copied to SRAM_A.

The approach is reused from Allwinner H3 implementation.

Tested with Armbian and custom Yocto image.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
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

