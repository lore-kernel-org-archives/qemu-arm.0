Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3124591ejc;
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElAcKCg/V0PDlzmLUDL2Vpyz8aOzvYpms8H5HRBMH4PkFfZzOPoJiyI30uh9lj2I+On4A5
X-Received: by 2002:a05:6358:726:b0:168:d2f8:d2ad with SMTP id e38-20020a056358072600b00168d2f8d2admr7259412rwj.7.1700090587340;
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090587; cv=none;
        d=google.com; s=arc-20160816;
        b=Ptf70x37vmpy1T/xAPrus/OvV8fphNxfzQM9AOHIF8Xv2/wsScQmZAVCDJRind3/pt
         uLOwT/Yvl+DM1aj4miRz5JBIpgQI1E8ajb0y73yaRlk9lwO53fMabIOdJl5tBThZPQry
         fm3VXTqVJ8uZsH3HV9TFeOkxRFRoRSuQLwY8I9ijhzSp+tJGJkcrwZJqTu4mzjb2fCz7
         Tfjv2fMOkFGhqw2nt7QvB1DMBTPgfwN72jSCsVNPt+N8l5H1LKpYsCgxUiqoVKtBlYM5
         tQ/7kWwcxPfZGtGuWdKdrOCcb2Ns4TbHt7tGoXh9Kc/x7eT9xODqb2Wrw5pzQx+QbmZu
         lWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SyOSV1bHLb/8jtxLoF5k1Jl+S3gYGF1w2lu5Kj6Bo84=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=XfPOsai4pkzWUeZPRdwpK2vfAspvuikvt+psY0Em44+2tlvJNL63s7jx6/19cphxBJ
         EURyu/DGiy2z3Wn0EH4RWceffSEuS6Uv9S9io6SmoDnsTfhdKX7QD7v/5u+xuFIpvnvZ
         0+4cuVBC7kPzQOaZ9MCJc+yVlwEn/p2fUyswjbt1Ss0f/JAd77pkfdLDLUiHFL+38My8
         zww5iNjL35gnK9YrQ3D9o9Lr1dRHu6xiDNvtyUxdT4vW0EePJ/3g3t9pHW4W6+ZcZV3q
         37gvc9jnzc+bj/o/Ud6FvHMYxYHhYNicPmft7HYAcnVMIiAS13Bb8VMQVbE3jiimD4QN
         LowQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjtwpG9n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05622a064700b0041cc795c5e3si9884041qtb.759.2023.11.15.15.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjtwpG9n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3PDK-0007ai-MB; Wed, 15 Nov 2023 18:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDH-0007Yx-Dg
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:27 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDF-0003Rf-7t
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:26 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so30608366b.3
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 15:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090543; x=1700695343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SyOSV1bHLb/8jtxLoF5k1Jl+S3gYGF1w2lu5Kj6Bo84=;
 b=VjtwpG9n89RgJcXUQrRQgGX3I840mcjcXzcJ8Ce1D8oglzQrU2HI9L04Q0zip8x/Nd
 8r2pwkqkRFemG3ye5+xw187DKEUpqsXq+El2s8jUR3Iu4mMYfU60Zffr/RVmlUM3JR7l
 HiGoss38b+NgDq7r814G3KcuZ9MUoHPm0CF75f+9WAPzy0ps/shwNMOYa2RNZa6xSy5w
 ovyJT5cq3suIOO4mjDAI3NmrKkjifQr2x+u08RN8R5s8AkeBP7ct/AAhN87g8stD2/j3
 RjBCL/GcDa8TLpmu4eACpDt5dAotuwPNv8fq2A9z1FI4GPTYCo1hIwypmTD5TiuAZAdg
 JWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090543; x=1700695343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SyOSV1bHLb/8jtxLoF5k1Jl+S3gYGF1w2lu5Kj6Bo84=;
 b=PCMiMKzdLsj0G66ss8UOHbeBNJOfhS8eagmi2WfzDCxLiKhn1c3B4H57/d9fJbCcUS
 fDDjgIvM+NUhnB0RXVLkWxRwPER4Ig2Ox23Oe0tA4bN0w4p+I3UZm0JnQ+gAGbdjy7Rs
 ETsQ1HwP0X2ozj8q3PK0gIGXpRJ/Jj6tBAzALE3IClnMrXxEUjzQuyfaPR8sQnF+/4h8
 ywJx0MvPZ21xoGY0lTXXJ0z36gkrPOKEvmKmLw9y4nJJTJDmwEvun75tHQt0I6LySbdK
 X1nYUAILFG2lVhpSnD+P/9xr+hMLhBUfKTq2AlmV7Tj032/VdME6PNsOU1CFsxs5Tim7
 4DAQ==
X-Gm-Message-State: AOJu0Yw3vibROa0sAnM/KMRnV9gAAqbFiB318Jb1HF7nrem6q3juNNvz
 19/hmWsKOj3bsmidXMW/NOfiqQ==
X-Received: by 2002:a17:907:9688:b0:9e8:48e6:8e0a with SMTP id
 hd8-20020a170907968800b009e848e68e0amr11040286ejc.61.1700090543047; 
 Wed, 15 Nov 2023 15:22:23 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 kg4-20020a17090776e400b009e5e4ff01d4sm7563210ejc.129.2023.11.15.15.22.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:22:22 -0800 (PST)
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
Subject: [PATCH-for-9.0 4/6] hw/arm/msf2: Simplify setting
 MachineClass::valid_cpu_types[]
Date: Thu, 16 Nov 2023 00:21:51 +0100
Message-ID: <20231115232154.4515-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115232154.4515-1-philmd@linaro.org>
References: <20231115232154.4515-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: cEyweNCCIO3+

The M2Sxxx SoC family can only be used with Cortex-M3.
Propagating the CPU type from the board level is pointless.

Hard-code the CPU type at the SoC level.
Remove the now ignored MachineClass::default_cpu_type field.

Use the common code introduced in commit c9cf636d48 ("machine: Add
a valid_cpu_types property") to check for valid CPU type at the
board level.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/msf2-soc.h |  3 ---
 hw/arm/msf2-soc.c         |  3 +--
 hw/arm/msf2-som.c         | 16 ++++++----------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index ce417a6266..9300664e8e 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -47,13 +47,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(MSF2State, MSF2_SOC)
 #define MSF2_NUM_TIMERS       2
 
 struct MSF2State {
-    /*< private >*/
     SysBusDevice parent_obj;
-    /*< public >*/
 
     ARMv7MState armv7m;
 
-    char *cpu_type;
     char *part_name;
     uint64_t envm_size;
     uint64_t esram_size;
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index b5fe9f364d..d6eb9ec9ac 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -134,7 +134,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
-    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->m3clk);
     qdev_connect_clock_in(armv7m, "refclk", s->refclk);
@@ -231,7 +231,6 @@ static Property m2sxxx_soc_properties[] = {
      * part name specifies the type of SmartFusion2 device variant(this
      * property is for information purpose only.
      */
-    DEFINE_PROP_STRING("cpu-type", MSF2State, cpu_type),
     DEFINE_PROP_STRING("part-name", MSF2State, part_name),
     DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_MAX_SIZE),
     DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 7b3106c790..ed399223b8 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -47,7 +47,6 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     DeviceState *dev;
     DeviceState *spi_flash;
     MSF2State *soc;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     DriveInfo *dinfo = drive_get(IF_MTD, 0, 0);
     qemu_irq cs_line;
     BusState *spi_bus;
@@ -55,20 +54,12 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     MemoryRegion *ddr = g_new(MemoryRegion, 1);
     Clock *m3clk;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
                            &error_fatal);
     memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
 
     dev = qdev_new(TYPE_MSF2_SOC);
     qdev_prop_set_string(dev, "part-name", "M2S010");
-    qdev_prop_set_string(dev, "cpu-type", mc->default_cpu_type);
-
     qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
     qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
 
@@ -106,9 +97,14 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
 
 static void emcraft_sf2_machine_init(MachineClass *mc)
 {
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
+
     mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
     mc->init = emcraft_sf2_s2s010_init;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = machine_valid_cpu_types;
 }
 
 DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.41.0

