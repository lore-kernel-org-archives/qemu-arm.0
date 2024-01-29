Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp268685ejk;
        Mon, 29 Jan 2024 08:00:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfLNPuLi6c0bHqZ8K7wL7tYXB6XIV1NNw8RHXG1YenIKn0eP+QuoHrCZZxLAF5nFNuvmpg
X-Received: by 2002:ad4:5942:0:b0:68c:4e75:91bf with SMTP id eo2-20020ad45942000000b0068c4e7591bfmr2529094qvb.59.1706544049314;
        Mon, 29 Jan 2024 08:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544049; cv=none;
        d=google.com; s=arc-20160816;
        b=xdnfa1dV3/B7ckRXGu1fzIl/x3qqdROiNj5lhUEybGbxU+0bTUukG12uC8/6QKBsnt
         npfPpuLhr0m2mt5yLr80YD2OlrhZOsR2DVhaED3EhLZqncH1i4UPlhCJbdQz/qqeO9hk
         lV+gocLcFe4Srt1UNGQQu4AL1UtxbniO8mDYAvSOhG4DwHGp0mAbYCJbKv6EYmC6hraz
         d+r/BO4fUF0CIpX/39GCfB7ALmh9Vnpd6NaCT6rqpOumtCOYWZGcOuwD6UpddZ/RFu6h
         ir0l2pxPCt596GdWNMaJTKUzOpr4u2SyaTyXEosdddsBQlLAxiphRdYVkuhXPbZJpHTO
         DgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mBJNDAZyqhEZv/OjyuM8FGpJdQYjztNc0WQPIUrUC+c=;
        fh=dMzOc9t0R7FxAsncZd2VpkO6WcD5Y/3HEkT1EkbuhrY=;
        b=lRbtbyjAZIAdaEyMQz/f239KlY5qAxs8cd6qu0oxaTlFEppn7DzAfaAjg96+Wgm+KQ
         KKscOciTTSThAWDopBEBSBcxpBRQtb28vcL0ILXYijTrlGcdZXjCIjFNuq+jucGeOosW
         ginACq8LoklrUdjsQdUTlP+yU3n9f+wYmo4iuHzPnQ+MjfuvhVguGxx/Yf5YCey2l6Qv
         XzpgzDGY5aLIqJA9OPqP0Eiu+BaNBtEWOEzMwLIy6c4hgj/OByNLu3yDw78Aqs5fBoX7
         Opxpj84t+PaaQNDsqOp3tDeHKqGfD9E1s+h+cr/BhU5AZj4Q3xN/WhzmJ+4bu31CXikG
         1kdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bfJQ6ZjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a0562140cae00b0068c50d0e94esi1755175qvs.153.2024.01.29.08.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 08:00:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bfJQ6ZjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUU3h-0003ih-Mn; Mon, 29 Jan 2024 11:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rUU3f-0003i6-P5; Mon, 29 Jan 2024 11:00:28 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rUU3e-0000V2-3O; Mon, 29 Jan 2024 11:00:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d8e78270c1so5965675ad.0; 
 Mon, 29 Jan 2024 08:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706544023; x=1707148823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBJNDAZyqhEZv/OjyuM8FGpJdQYjztNc0WQPIUrUC+c=;
 b=bfJQ6ZjMC7jJeKETpe4zdsJUpeaWG2MmdTiv4CguTGelldoa5YWJWiLQfDRL5m7aky
 ZZ+7CwNFCgv27Bg4Dssvn4gume6dN+GjP9Sgii3kJlTB2PcGG0mm5uPe88Va7kW2wJRN
 Lf2CmZvNob6Aw18stKsLuf1RC2qZM2gjVo+hlbUzRePK+qF+mHuSQdfqAKn6vxFhgAUM
 DtEm/mpxLAB1ToZYr6ZLZVgwFS4REb14SPI5fbXcjijrDT/1S4nP+ykJH4jc2onUK+Jj
 U2A17mGLOrrCFXlMVJizvBhV9P3xNduZw9AwdtWQNMUnVYP3iv0O1guTQ6xvrCnUg/5O
 uP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706544023; x=1707148823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBJNDAZyqhEZv/OjyuM8FGpJdQYjztNc0WQPIUrUC+c=;
 b=t7mR3MSDYRouWXO/XTQyGWRU4+OZZ4UNUFQkUFoCWgpfpZdAxWyeNSmU59GjqF0bN3
 Mv0CmZbPdBWQ+/2IZREm+sbomqBKBgOjTyt/DEj+r7rifRpThDeZotGWEYnf9hFWmYF0
 fcK14aRG7omBsZ1+FB+yn8WZZCaXSl2Q7BriDf2vM0SBgLQ30az8ZXO237naXMjKtm6h
 vhTjOXSF3yHqnedkedTLatPTGWPXetzi9i1MedLHpimmUpZJL+IFe2j+THSukorskZ4u
 q2JVmOwC3IbEHGOTfsY7Hejh4SHr23WJi88AHz7Tjjmk6KTQbnccvoxu+F3/GQwC7ahw
 rDYQ==
X-Gm-Message-State: AOJu0YyoPYad9DUK51FRF2FjhCFCutDY+meJjxrmVqN8rFhdRr/MOMIn
 sSEh370n9IIJ8+awtJOCjOhfygUHp3I2OXEtgtMaKKPh0XhgqC7SQVO1xkt/Z3n/VQ==
X-Received: by 2002:a17:902:dad1:b0:1d7:3e7a:718e with SMTP id
 q17-20020a170902dad100b001d73e7a718emr5630548plx.12.1706544022640; 
 Mon, 29 Jan 2024 08:00:22 -0800 (PST)
Received: from localhost.localdomain ([49.47.195.100])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902cf4e00b001d8ffeb53dbsm100955plg.77.2024.01.29.08.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 08:00:22 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: Rayhan Faizel <rayhan.faizel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2 2/2] hw/arm: Connect SPI Controller to BCM2835
Date: Mon, 29 Jan 2024 21:25:45 +0530
Message-Id: <20240129155541.2767068-3-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129155541.2767068-1-rayhan.faizel@gmail.com>
References: <20240129155541.2767068-1-rayhan.faizel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: E9AGS+wsKld/

This patch will allow the SPI controller to be accessible from BCM2835 based
boards as SPI0. SPI driver is usually disabled by default and config.txt does
not work.

Instead, dtmerge can be used to apply spi=on on a bcm2835 dts file.

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
---
 hw/arm/Kconfig                       |  1 +
 hw/arm/bcm2835_peripherals.c         | 17 ++++++++++++++---
 include/hw/arm/bcm2835_peripherals.h |  3 ++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 218b454e97..c8e0f2d78c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -425,6 +425,7 @@ config RASPI
     select PL011 # UART
     select SDHCI
     select USB_DWC2
+    select BCM2835_SPI
 
 config STM32F100_SOC
     bool
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 0233038b95..f259da64f7 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -144,6 +144,10 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Power Management */
     object_initialize_child(obj, "powermgt", &s->powermgt,
                             TYPE_BCM2835_POWERMGT);
+
+    /* SPI */
+    object_initialize_child(obj, "bcm2835-spi0", &s->spi[0],
+                            TYPE_BCM2835_SPI);
 }
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -399,14 +403,21 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    memory_region_add_subregion(&s->peri_mr, PM_OFFSET,
-                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->powermgt), 0));
+    /* SPI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[0]), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, SPI0_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->spi[0]), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[0]), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_SPI));
 
     create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
-    create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
     create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
     create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
     create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d724a2fc28..0203bb79d8 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -31,6 +31,7 @@
 #include "hw/gpio/bcm2835_gpio.h"
 #include "hw/timer/bcm2835_systmr.h"
 #include "hw/usb/hcd-dwc2.h"
+#include "hw/ssi/bcm2835_spi.h"
 #include "hw/misc/unimp.h"
 #include "qom/object.h"
 
@@ -66,7 +67,7 @@ struct BCM2835PeripheralState {
     BCM2835GpioState gpio;
     Bcm2835ThermalState thermal;
     UnimplementedDeviceState i2s;
-    UnimplementedDeviceState spi[1];
+    BCM2835SPIState spi[1];
     UnimplementedDeviceState i2c[3];
     UnimplementedDeviceState otp;
     UnimplementedDeviceState dbus;
-- 
2.34.1

