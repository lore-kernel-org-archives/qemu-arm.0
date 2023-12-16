Received: by 2002:a17:906:4e11:b0:a23:2eff:81d7 with SMTP id z17csp289658eju;
        Sat, 16 Dec 2023 10:28:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrwSPCDulMOOcwBIoI+XPWahAGez7nj/s+/crw+MoWDVRzOtwgtEZaufZA0dFF/3xzuflA
X-Received: by 2002:a05:6214:c25:b0:67a:a721:830b with SMTP id a5-20020a0562140c2500b0067aa721830bmr17341738qvd.101.1702751316290;
        Sat, 16 Dec 2023 10:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702751316; cv=none;
        d=google.com; s=arc-20160816;
        b=jKh2SniYNzdT46l9TPZcNCDH2YE3cYM5vKQXPs+qDXsEzsAPw1U+cUNWNRKoL1aFmj
         md0tQ/TMc+76OP7D4NGZv9FwDLq7T4g7tcDfXB5WY5gInFf84VybCeR8eQ7PMLZXYA2n
         CCa79HMD7IxgxGSZwsCleuQf+OPY5oHWnMgkjB2hCOv9sCTb095wiE0R2NeqZ3Q4FbvG
         Sz3kGEgHWGbe4ihydcwsbD+Yamq8E0B/rK1UsZoTA2TNH/Fw4kG4Gw3/KCZzHHKa4cGq
         SH3zp0vVedO8SoY87jbbZYJbdTV0W3fY0qi2Fr0jSx8cUA5CV8O69L2/amtEszPQCYas
         epGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=PkTXigDYauoucvjBUtw2yaQyE7NWG9f3qiOiYzY+4gw=;
        fh=oGKIVXcH1r9KL/hdyO5aIi4Tl7S6YUHGM7njmdJqg74=;
        b=028kcr8Xjr4DeiI/7DiG/+V1NPb/U0UwEiBrnchH/KQ678HStOmto5FHFFM3+U1Jgf
         TXadlcIa+xu+H/+F5LvfizxpUR+q916fHzlvkhqjKyQeWpC6y5/GN5vgFiUdXnKF7dN8
         lx2g/A9wkP6O7sNqY7UPJ/3bh+zffIW6GW53vx8km3gPCHGGVFP632EDrfCVtKOD6GCW
         UCUJArKjTiH4CclOd25EWorzdTp9F7V7eaucsvAsdfyiYlVy8uWAhWXeyIrwS4xPB6Kb
         57GEX2DQgHnf2BKP732Nj2ulrt3/uPZx063ryQrCFM2DyuqaU1svrWAI8/FIKeUMZ97H
         4I2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a0cc547000000b0067f35b9c13csi17728qvi.238.2023.12.16.10.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Dec 2023 10:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rEZOG-0000Sz-VU; Sat, 16 Dec 2023 13:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEZOE-0000QH-IO; Sat, 16 Dec 2023 13:27:54 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEZOC-0006XS-O5; Sat, 16 Dec 2023 13:27:54 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 2D5DD80028;
 Sat, 16 Dec 2023 19:27:47 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH 3/3] hw/arm/socs: configure priority bits for existing SOCs
Date: Sat, 16 Dec 2023 19:27:40 +0100
Message-ID: <20231216182740.3305724-4-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216182740.3305724-1-sam@rfc1149.net>
References: <20231216182740.3305724-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ip+IqW5RRB2y

Update the number of priority bits for a number of existing
SOCsaccording to their technical documentation:

- STM32F100/F205/F405: 4 bits
- Stellaris (Sandstorm/Fury): 3 bits

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 hw/arm/stellaris.c     | 2 ++
 hw/arm/stm32f100_soc.c | 1 +
 hw/arm/stm32f205_soc.c | 1 +
 hw/arm/stm32f405_soc.c | 1 +
 4 files changed, 5 insertions(+)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index dd90f686bf..38981967f3 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -47,6 +47,7 @@
 #define BP_GAMEPAD   0x04
 
 #define NUM_IRQ_LINES 64
+#define NUM_PRIO_BITS 3
 
 typedef const struct {
     const char *name;
@@ -1067,6 +1068,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
     nvic = qdev_new(TYPE_ARMV7M);
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
+    qdev_prop_set_uint8(nvic, "num-prio-bits", NUM_PRIO_BITS);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
     qdev_prop_set_bit(nvic, "enable-bitband", true);
     qdev_connect_clock_in(nvic, "cpuclk",
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index b90d440d7a..808b783515 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -115,6 +115,7 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Init ARMv7m */
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 61);
+    qdev_prop_set_uint8(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 1a548646f6..a451e21f59 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -127,6 +127,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_uint8(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index a65bbe298d..2ad5b79a06 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -149,6 +149,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_uint8(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
-- 
2.42.0

