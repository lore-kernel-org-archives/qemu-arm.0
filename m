Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp215633ejb;
        Thu, 16 Nov 2023 23:18:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO90dtamkmUuqL5nOSTo322EmgOriSXlPkouvqF/PyVvdm7RGFmkIPieIhXwRGkYuRIVDH
X-Received: by 2002:a05:6214:2d16:b0:66d:58a2:d23d with SMTP id mz22-20020a0562142d1600b0066d58a2d23dmr11850358qvb.61.1700205490212;
        Thu, 16 Nov 2023 23:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700205490; cv=none;
        d=google.com; s=arc-20160816;
        b=wKMhxpqAjl03xDzk1f7UVoyc3Q7P7JqjQ4u+6LwX+2EJ84suBnwA0S0TVwh9UFqEPi
         RFLinpGpkEMl50lGnQdx2yKt0lTa0kHFRg4mk2D5eJ1STw3Q7zf/TtMzjKq9EIXsJLCi
         iq35BkMiKCD5wouQNZHbfL3oG7gWIKfsStDVsPRn/YPebGeel8Yb5CUEHSnXb0veXMT9
         xPPdzOWXxKjxCUVp6nniPqKqCCq2aHbbHzTgScMWHv0NXN6rFWXIAxROo5cpumPzbKAk
         QeGSJPy2Jb7G6neSScBY7kFebOUD7z7S2/3nB8/gV2EIv5z1U9D0/Q2iYTmAf4nTW1Mr
         +tiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vTMyslaK2WpZ4IP8gJyy1ZNuQ4oQ3pn0mQiB92seVWw=;
        fh=/iNNmKky1DrOYOLWnTIBUxaMagIUG/IvUjT5dhZ7EH4=;
        b=S4KE1N5tUJFgguEBDKAI60VvYYXQ1snAF8LJmjpVMZXPc16w7ntFWCtR24nfKkdnqT
         ZBUXCMCs+MMCo2o34rLPeXE9gX5/wbKsj+kvm34m08gpLLIPn5+tBDD8EnNiJ8gZJT3K
         3sj0s+ftB4L3Yvm0Ulh9FZ81sdH/RdoBjQR9Dr/OX4DsvLx9lvepUImwiWZeECK5SDiI
         0rz8k4sL1tsPmEgxloR+vvuQ2zY65oP8MpGGzXFwtDR294xha/jxLVh/GWW/8IWYKvM2
         Oaw3Tog0e+U22wBDRHu8y9Ma4ATaxpk3lhENdEVO5H85kiHO+CAcSaxQUh27FqAp/VEC
         NCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N65RxRGe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a0ccd83000000b0064f68c194a6si1151414qvm.73.2023.11.16.23.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 23:18:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N65RxRGe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3t6X-0005OP-Uu; Fri, 17 Nov 2023 02:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3t6S-0005Le-0V
 for qemu-devel@nongnu.org; Fri, 17 Nov 2023 02:17:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3t6Q-0004IL-9X
 for qemu-devel@nongnu.org; Fri, 17 Nov 2023 02:17:23 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso13964725e9.3
 for <qemu-devel@nongnu.org>; Thu, 16 Nov 2023 23:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700205440; x=1700810240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTMyslaK2WpZ4IP8gJyy1ZNuQ4oQ3pn0mQiB92seVWw=;
 b=N65RxRGe1Toc16bX0HPtzdCydLBhCQc5cCy6nuzqyDOPg/3B25nxNyYhcbP7L57wvE
 nQzkhSzhkns2yjd/bsDskGFo7rukF/TOMycCc2g+FY1K84ZpZn51HasM0+cB8YMSOUVL
 yViBRNG7AesJlz1zZcI6ZlSTpvlDhOjXqk7o9TAYu4eBtZWWREakB+A3lyMgtb0Waz1j
 6v6QGAFxAwXc0cNUfYMv8PlXjDZK/JnPrY6nwrv/G4QghwH3dmxBcerfZNGrL6Cab5E4
 j85vUtpn2Qk1IoL2btlz/V7yyHCdRyJDM/U3q+CxWfn6Zgogmfpxu7Dvw9Dh+AtHhw9u
 PH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700205440; x=1700810240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vTMyslaK2WpZ4IP8gJyy1ZNuQ4oQ3pn0mQiB92seVWw=;
 b=EGH+AWpiTi6DMP+QOtViUYvINL8au5KZsCcb512HmC+OEKzKdLmd5EXkcWWA+GdONA
 Oux/hSFTSZqsOIJe/xLXyUqXu+naed24Jx/N2R46U0irmcy3JgnejmLvG6t7JzTTPHtK
 AN+P0azh52D8aL3pqOkBQLRd7zZLmzGQDPyo/nJ6Zq4OJmvxJ8PnlPH2x5QgXDmjoaX7
 dLO8mIxp7a9RTKFAI21/z99biUyB3Jh0ZDqTM+btp1iJYbKcRbzAtVSOXA51vbBxAdbi
 kO2eJ0rTtGTx6L/Waj7l8U/6cu9Na6DF/Dg99vqQByWcP7CEDAS1PAWzWovvrtmD4CK0
 L6MQ==
X-Gm-Message-State: AOJu0YwD8mXlTfYNynGas6dbVP31sh0XXGa7pZflCvdiQK/xSDjgfg1f
 Azh2Qnj1TpZmFPiTxqBHl3e3bjKJ0ogXYPA1jPw=
X-Received: by 2002:a5d:6da9:0:b0:331:41ef:61f2 with SMTP id
 u9-20020a5d6da9000000b0033141ef61f2mr14721992wrs.15.1700205440338; 
 Thu, 16 Nov 2023 23:17:20 -0800 (PST)
Received: from m1x-phil.lan (bd137-h02-176-184-46-187.dsl.sta.abo.bbox.fr.
 [176.184.46.187]) by smtp.gmail.com with ESMTPSA id
 p17-20020a5d48d1000000b003316ad360c1sm692737wrs.24.2023.11.16.23.17.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Nov 2023 23:17:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Felipe Balbi <balbi@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Gavin Shan <gshan@redhat.com>
Subject: [PATCH-for-8.2? v2 2/4] hw/arm/stm32f405: Report error when incorrect
 CPU is used
Date: Fri, 17 Nov 2023 08:17:02 +0100
Message-ID: <20231117071704.35040-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117071704.35040-1-philmd@linaro.org>
References: <20231117071704.35040-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I3TUD6Yiwku/

Both 'netduinoplus2' and 'olimex-stm32-h405' machines ignore the
CPU type requested by the command line. This might confuse users,
since the following will create a machine with a Cortex-M4 CPU:

  $ qemu-system-aarch64 -M netduinoplus2 -cpu cortex-r5f

Set the MachineClass::valid_cpu_types field (introduced in commit
c9cf636d48 "machine: Add a valid_cpu_types property").
Remove the now unused MachineClass::default_cpu_type field.

We now get:

  $ qemu-system-aarch64 -M netduinoplus2 -cpu cortex-r5f
  qemu-system-aarch64: Invalid CPU type: cortex-r5f-arm-cpu
  The valid types are: cortex-m4-arm-cpu

Since the SoC family can only use Cortex-M4 CPUs, hard-code the
CPU type name at the SoC level, removing the QOM property
entirely.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/stm32f405_soc.h | 4 ----
 hw/arm/netduinoplus2.c         | 7 ++++++-
 hw/arm/olimex-stm32-h405.c     | 8 ++++++--
 hw/arm/stm32f405_soc.c         | 8 +-------
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index c968ce3ab2..d15c03c4b5 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -51,11 +51,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
 #define CCM_SIZE (64 * 1024)
 
 struct STM32F405State {
-    /*< private >*/
     SysBusDevice parent_obj;
-    /*< public >*/
-
-    char *cpu_type;
 
     ARMv7MState armv7m;
 
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index 515c081605..2e58984947 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -44,7 +44,6 @@ static void netduinoplus2_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F405_SOC);
-    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -55,8 +54,14 @@ static void netduinoplus2_init(MachineState *machine)
 
 static void netduinoplus2_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL
+    };
+
     mc->desc = "Netduino Plus 2 Machine (Cortex-M4)";
     mc->init = netduinoplus2_init;
+    mc->valid_cpu_types = valid_cpu_types;
 }
 
 DEFINE_MACHINE("netduinoplus2", netduinoplus2_machine_init)
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
index 3aa61c91b7..d793de7c97 100644
--- a/hw/arm/olimex-stm32-h405.c
+++ b/hw/arm/olimex-stm32-h405.c
@@ -47,7 +47,6 @@ static void olimex_stm32_h405_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F405_SOC);
-    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -58,9 +57,14 @@ static void olimex_stm32_h405_init(MachineState *machine)
 
 static void olimex_stm32_h405_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL
+    };
+
     mc->desc = "Olimex STM32-H405 (Cortex-M4)";
     mc->init = olimex_stm32_h405_init;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mc->valid_cpu_types = valid_cpu_types;
 
     /* SRAM pre-allocated as part of the SoC instantiation */
     mc->default_ram_size = 0;
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index cef23d7ee4..a65bbe298d 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -149,7 +149,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
-    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
     qdev_connect_clock_in(armv7m, "refclk", s->refclk);
@@ -287,17 +287,11 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("RNG",         0x50060800, 0x400);
 }
 
-static Property stm32f405_soc_properties[] = {
-    DEFINE_PROP_STRING("cpu-type", STM32F405State, cpu_type),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void stm32f405_soc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = stm32f405_soc_realize;
-    device_class_set_props(dc, stm32f405_soc_properties);
     /* No vmstate or reset required: device has no internal state */
 }
 
-- 
2.41.0

