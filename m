Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3124682ejc;
        Wed, 15 Nov 2023 15:23:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNfK6qOBLGtr6myYORHoRHbLgVPWqbV8xdmacqacK2+514wO3ur37UKF9DrwKUk+qA3Zto
X-Received: by 2002:a05:620a:16b3:b0:76f:1817:942b with SMTP id s19-20020a05620a16b300b0076f1817942bmr6422434qkj.28.1700090597902;
        Wed, 15 Nov 2023 15:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090597; cv=none;
        d=google.com; s=arc-20160816;
        b=Kuk3sTLZSnEUD4adPJPMbrzqtwaB8iEFO+KFzxsRPDuZMLvqyAvspKwl1Dzw5ILm6q
         KglhG4x1Ylxl5VgNtQBmCQIw3qTD5pZyu+0cpZAx16dsbETP6/l1RqRWwmunNIV+ulR+
         zNqQv0cRjnWQYpoYbhK9NkbN2YANEgj5yGwVYM0cQ7wlWV/klKOE4ko8ate3HCbDzIgo
         j9x2OdvQBxJ4cQR029f4zrCKTnNuZYYn09/jZKSb9RA5WHO5OTHMlH0gBez9y9DNOYX1
         wms2d0nabY5cmnnNvpLBdWLYi0/dCFCUpwMS4G9Pyu6jEb9DumgVdWTTQap+bVzU51c3
         +EYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SjjgBM6Far3ZU6D7cHhKn6yCQMmOx1k1V2GiDQ4UpRs=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=wJr+sLI7nVk7AUMelXXANuwcVfPUjuR/yypUOqMBzQdRS+fdjdcWlDzxdgwJmkLdDi
         tnsbPdKpThrKnw7uUhENR0gUbjZiR/a42pixe1/5d9TLitqYyUYMnaYePATfOu/VHPAZ
         UrecwxM6FwE82hdkGgCfnpS4Paq7wcZhY4luiFT0ByxcwSNgSMGZg/5sblFq10GMdqNL
         jK82/oKpS2B87D9wZbsgZy12IK6+A9RJ2b7tPsLukSsqeCQjH2fAHm+WQLhYn7zSh1Z0
         ytjqKXigtxeCGB/vbJ/72F+EKmDvpwgaeTPVPCGgGVSbS1Ue1OjYYa7EZEqKGEMMhVwv
         jXpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cyUzvsLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq16-20020a05620a469000b007757fdc429dsi10537856qkb.340.2023.11.15.15.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:23:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cyUzvsLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3PDJ-0007a3-Fj; Wed, 15 Nov 2023 18:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDH-0007Yw-DJ
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:27 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PCw-0003K8-5N
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:27 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso30697266b.0
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090524; x=1700695324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjjgBM6Far3ZU6D7cHhKn6yCQMmOx1k1V2GiDQ4UpRs=;
 b=cyUzvsLVbcaS9GosKcnf2v2lEJ6g6WNDhYKZZsMhU4A3QKV3vCHbrXt58iR709uaIK
 9NGlPRb28Bv2ggUyY+ffBG2GAbZViYhyKWepsMbOyzS5BhmP069q+/HIhfEDFHUcM+ak
 yTqcInlSuB3OoqA6Mv3Oh8GGz2ib7U+nhRGa9XTY3g1AOCwvcAei3bYoL4Uakl67exsb
 ZkbK6LU6JkFeaCJs8+7irfCElBCtrxjANt35BRlggaDbG4SndIdPDefxbjuOgYi7Q2m8
 mhPqJMgZNv0FFpes5UIXDnWQMwBizCRG8AzN3VyNCSTinFwLfp7BDbwh8qGUhGvSwocR
 utXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090524; x=1700695324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjjgBM6Far3ZU6D7cHhKn6yCQMmOx1k1V2GiDQ4UpRs=;
 b=DJRlXXrjlYtJBmdhd1a25PfU3UR2/soIn+a7WR7EPwz77Tf9ZDmVjF58bhKzu05PDB
 ljqelT4Of7zTMr1z0n0m/43yqcI1AXUBdsXWHkVAG9GZ1xIZxHNPf5+4UUXQqjtvbd8t
 94qo2hQcaBGzkKiRrMQpZ49vdxgn7xor1U1E2bV86aDQGebq82guPM8HSyv4tj1L2Kqk
 MN2eUEnwcFxcTbcTwbaFn/ZvRORpxdQb73i69bZiKsAqUayRHT1BFw83vULeda1a9yTc
 VsjF96aeJZjUvniZ1pyxBGyRz5dP7TBT1UO8bVk47GE1UAFUl1xpmb/vkGtno+ObpTao
 SS+w==
X-Gm-Message-State: AOJu0YymJjTVVTFlBMfQoF/J6+sVCclltnJxw1368QUFPPXSrKTj5kLi
 oLpaCrr0b6EFRXAKOjK30Q/jXw==
X-Received: by 2002:a17:907:c09:b0:9e7:de43:af91 with SMTP id
 ga9-20020a1709070c0900b009e7de43af91mr13824977ejc.41.1700090524467; 
 Wed, 15 Nov 2023 15:22:04 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 dt20-20020a170906b79400b009cb2fd85371sm7580944ejb.8.2023.11.15.15.22.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:22:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Hao Wu <wuhaotsh@google.com>, Felipe Balbi <balbi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2? 1/6] hw/arm/stm32f405: Report error when incorrect
 CPU is used
Date: Thu, 16 Nov 2023 00:21:48 +0100
Message-ID: <20231115232154.4515-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115232154.4515-1-philmd@linaro.org>
References: <20231115232154.4515-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: HU9hCrOxQaHF

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
index 515c081605..e411806dd7 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -44,7 +44,6 @@ static void netduinoplus2_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F405_SOC);
-    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -55,7 +54,13 @@ static void netduinoplus2_init(MachineState *machine)
 
 static void netduinoplus2_machine_init(MachineClass *mc)
 {
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL
+    };
+
     mc->desc = "Netduino Plus 2 Machine (Cortex-M4)";
+    mc->valid_cpu_types = machine_valid_cpu_types;
     mc->init = netduinoplus2_init;
 }
 
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
index 3aa61c91b7..694b1dd6ed 100644
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
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL
+    };
+
     mc->desc = "Olimex STM32-H405 (Cortex-M4)";
     mc->init = olimex_stm32_h405_init;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mc->valid_cpu_types = machine_valid_cpu_types;
 
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

