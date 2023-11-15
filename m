Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3124832ejc;
        Wed, 15 Nov 2023 15:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhTlXwpN1KOGXGihDUddYMnYFE28AvIDeh8hiqqv/BmR5sIgeqvmcVDBHwfO7B5IAT3xOJ
X-Received: by 2002:a05:622a:254:b0:41c:c770:62be with SMTP id c20-20020a05622a025400b0041cc77062bemr11592616qtx.33.1700090617891;
        Wed, 15 Nov 2023 15:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090617; cv=none;
        d=google.com; s=arc-20160816;
        b=X43ToizmFNGRzO7T9N76L16V2kFxbixNy+wtQM+409ghPPC6BPePupkfrVg8CBFIf1
         Tj9FQs/wF4s+pAs3VPBjlTHp7jHLHVn4Cz5woWaLVI0lGsHgQ6qYSKmVtNvhuf7kbZvG
         W8V0gzltKABadsJYwDyEX2bJ7lYD+nP451ui+a++DJSj7Hi78AQ/fAEH+5fLhy5wy+Wm
         SuMMZJObGrECZHyhzlSKXd2xP6s6xcx4FNCok1vRLwnazLycjr7SSf6RpKI30DD1TdsR
         8reYjP1g0hrzQNcUa6RcGAOLzuW2hv03S1cdOYxHbU4ySYFQot0kMAKMV7ObeZTCWrFE
         wi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z2Aez4pIK4BJ1WwRvt8loGDJ5oavAC3olsgV9rlMnB0=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=itzPDh2VZJVvv+TFJ8aJDyfTn6Mu2G6Mf/4cuejifE6Le5Gk2lQc0NwNr1s9UjR1fb
         /+vKiPOMHbm2G+KkwOuZOT/gafgZ0tYhl3FkMlreXfGMaNcILl9YCtx0tXfdy48ytTdB
         iz62ecgloh3vSakP+Iu+P2hh7+mEut+AiwloH4jVTyuMSSP3xppQhpCDTvldMCJjW8/4
         xDUMb9pHFRw1wjFBgF2Voz0gFlTJvITbm+quL0DWw24AtahszGRokOGomrFXAYAP/spW
         tYZLKLYMTYecQ7Q4ndAJdW1abq7SiibG9pTOV/kD73WMyJCQ63dNjDJ4hvSfYbwyAWO/
         qzJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEZdCpuM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac87d56000000b0041b77a0e2a2si10259490qtb.769.2023.11.15.15.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEZdCpuM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3PDE-0007Y7-9k; Wed, 15 Nov 2023 18:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PD9-0007WD-V4
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:19 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PD2-0003M3-1f
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:19 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so303016a12.3
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 15:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090530; x=1700695330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2Aez4pIK4BJ1WwRvt8loGDJ5oavAC3olsgV9rlMnB0=;
 b=yEZdCpuMVTV5AI/PE113amxAg2Rhc5rTULO1uEivn8a+OjiFDBxhnuLobJXJBvd4o4
 qtEgfX23ZMtcyqh0ndLLoYoBa/q/QAKgc+F4pF8XdP4+asl8JBy+jXBMSsm6KM7CtTxV
 /z75oOyL2suCuPuMw9f+UdljxCv1kPwYrtH1JvuyZKnP3uYuvim/gulQcg1bHNRlsHNo
 U1eOzeFAZ4ghqLwujllUor8x+7uqJ/V1Myo6U/V4JVVR4/T5E2hG5GKvXRVN8xIUEA08
 buIIRutfAZ2t5sQiOo/XreOSW6eWsXs5CGvjpSTWhKREw3d8L1LLmmzZEsuOaH5YyLz/
 dccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090530; x=1700695330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2Aez4pIK4BJ1WwRvt8loGDJ5oavAC3olsgV9rlMnB0=;
 b=Ct0CJMm5jdjz6nYdJB1CQZfM6ugm5WXgmvLyoNvOXgLhFttjlo1wHe1nfKApAZYqFv
 YdZbugS41EpqMSsOC5BHOZe8+X7l1Dz0eyjYrYH819XGSyS+cuJLkObiYh1WDJdji4rp
 cdZOra3oUaarneuEMjOiLmFcMEmCGnTtpMTJuT6Y4pEuN9HjcJGkvbfkzyV9XJ6sd6MI
 jP7AN7Rqy0KWW7YifEGrxoNe3fmtaooaFjSi0YlKYFCE3A2OIWELZO/XmIY2RkUlx6Mu
 5Vz0r+QIoM0YEu57UpddYslYvnAvx2klIX4Li3GFg6STe9WTf0T8saU5v2D/2N2TYL7F
 8gwQ==
X-Gm-Message-State: AOJu0YxagftqsFYla6p/7IsXuwT5IlcE6Uao25aYX3beyIQ/UGd57wZi
 wFjnh8V+WOFfm7pWE0KUgVpT0w==
X-Received: by 2002:a05:6402:5193:b0:543:5789:4d6c with SMTP id
 q19-20020a056402519300b0054357894d6cmr733971edd.2.1700090530804; 
 Wed, 15 Nov 2023 15:22:10 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a50d096000000b0053e0f63ce33sm7104725edd.95.2023.11.15.15.22.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:22:10 -0800 (PST)
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
Subject: [PATCH-for-8.2? 2/6] hw/arm/stm32f205: Report error when incorrect
 CPU is used
Date: Thu, 16 Nov 2023 00:21:49 +0100
Message-ID: <20231115232154.4515-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115232154.4515-1-philmd@linaro.org>
References: <20231115232154.4515-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: v10rofEKcSzj

The 'netduino2' machine ignores the CPU type requested by the
command line. This might confuse users, since the following will
create a machine with a Cortex-M3 CPU:

  $ qemu-system-arm -M netduino2 -cpu cortex-a9

Set the MachineClass::valid_cpu_types field (introduced in commit
c9cf636d48 "machine: Add a valid_cpu_types property").
Remove the now unused MachineClass::default_cpu_type field.

We now get:

  $ qemu-system-arm -M netduino2 -cpu cortex-a9
  qemu-system-arm: Invalid CPU type: cortex-a9-arm-cpu
  The valid types are: cortex-m3-arm-cpu

Since the SoC family can only use Cortex-M3 CPUs, hard-code the
CPU type name at the SoC level, removing the QOM property
entirely.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/stm32f205_soc.h | 4 ----
 hw/arm/netduino2.c             | 7 ++++++-
 hw/arm/stm32f205_soc.c         | 9 ++-------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 5a4f776264..4f4c8bbebc 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -49,11 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F205State, STM32F205_SOC)
 #define SRAM_SIZE (128 * 1024)
 
 struct STM32F205State {
-    /*< private >*/
     SysBusDevice parent_obj;
-    /*< public >*/
-
-    char *cpu_type;
 
     ARMv7MState armv7m;
 
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 83753d53a3..94b6b379d6 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -44,7 +44,6 @@ static void netduino2_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F205_SOC);
-    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -54,8 +53,14 @@ static void netduino2_init(MachineState *machine)
 
 static void netduino2_machine_init(MachineClass *mc)
 {
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
+
     mc->desc = "Netduino 2 Machine (Cortex-M3)";
     mc->init = netduino2_init;
+    mc->valid_cpu_types = machine_valid_cpu_types;
     mc->ignore_memory_transaction_failures = true;
 }
 
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index c6b75a381d..1a548646f6 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -127,7 +127,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
-    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
     qdev_connect_clock_in(armv7m, "refclk", s->refclk);
@@ -201,17 +201,12 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     }
 }
 
-static Property stm32f205_soc_properties[] = {
-    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void stm32f205_soc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = stm32f205_soc_realize;
-    device_class_set_props(dc, stm32f205_soc_properties);
+    /* No vmstate or reset required: device has no internal state */
 }
 
 static const TypeInfo stm32f205_soc_info = {
-- 
2.41.0

