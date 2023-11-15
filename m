Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3124712ejc;
        Wed, 15 Nov 2023 15:23:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHVLIwFQtZyKfJ9pojpUDmwL5L3WAMtj1jKke2fxQuWHrDEQYMnIsDZLp9JKTxlmjworJP
X-Received: by 2002:a05:6870:b50f:b0:1e9:db04:eb51 with SMTP id v15-20020a056870b50f00b001e9db04eb51mr17625255oap.39.1700090601876;
        Wed, 15 Nov 2023 15:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090601; cv=none;
        d=google.com; s=arc-20160816;
        b=EkpCM6XNFKD0G5p4/IWtPJO0Ld0zWeSdXIn+xMUjhqtg/jgf5LLMZDdseVVjNN25+0
         Se1b6nQfMNXjJohCrZiTPrAjgACqMttN4vHeNKjJVFfSC0gCFzOA7NiqDZu/knI2NhDs
         ULZRGHdGejZtDik4kxxiAVhftDbClIP/OJ/esZzWoi5DcVNYcEIw6IMsYZ+u/6sRTD9/
         6p2M0GwHOL6j7JQXQk+qMR/3ow+G1KvH7bfCyzyRiokMHfjI/Vlpqca2vjqnluiswiTl
         NFsGdNjbix6m8kft4LxkGe7wHoNtG3JDYJeCwotRMRUW7Qdc9gSsCAkbG1gteN0IblJl
         qHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=no978ZTm2/H5gCS/ezA/0hjk4jjwIQ7oHQcjYSAByag=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=jN/35nDIanrHPUsDv709ChtxUQJSuIPkCvdYq+q5982zZM93LH8rOLKNdCUEjpYFtf
         IDJhs2clDujU6HjXiejFh26a/zPRABJtXYEw+vn2yaes4R7DFHHMKQD6C+tMNqixf4RB
         Bv8S7jWSrI7kNYzqIzdn4Yu8gfOJJovFIsBuejduKn6PVJUYR2ZFJGOuS/XsnYzYxIeL
         +vXcrwQM4C1qp3RWTFMcXPUrPlnS5Xu8lrPwXMKhEQgN+hUxmNA19aZE37NplAoxiGew
         UcRXjiriU5WzQIK2/dlbRgFKY7+e3BnfZ9XGibwV2K0YK7o/XpqP0ha7cOYBs4MFr99o
         DDEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOu528ys;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020a05620a451200b00773be513ec2si11221648qkp.738.2023.11.15.15.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOu528ys;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3PDG-0007Yq-Pb; Wed, 15 Nov 2023 18:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDE-0007Y3-8h
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 18:22:24 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PD9-0003PU-4I
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 18:22:24 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50a938dda08so275406e87.3
 for <qemu-devel@nongnu.org>; Wed, 15 Nov 2023 15:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090537; x=1700695337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=no978ZTm2/H5gCS/ezA/0hjk4jjwIQ7oHQcjYSAByag=;
 b=nOu528ysueLmE6vMzJxQyNux8y1y0gsrM9qpGKD5xMhM9pJPfmJVPkIUh0J0Fz87GE
 Y3L0MnrIY9Qb6ft9F5SsjSBzM82+0e4T2SNTnHb+j0cDKxNhF78JpQPNaH5yJzkQLwqS
 sz9rvvxA5XvWxXdfvovXR+aC7xQZUHe0ECGi0L/CdSR++y/neFZZ26qPreLzP9VqkH+x
 3a6Y4XyDh+c+t3mST1WRKm0GDvmqheuuFFkP6bB3sBgiiL1/LgXepEq4yw1+MnB1IJ8t
 7U/0omNaOGtsEq+0NB7ZeQvfoNsz04rTyKKWPbBH7ntoXmti9mHg9mzE6DFVjeyxW2ke
 1+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090537; x=1700695337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=no978ZTm2/H5gCS/ezA/0hjk4jjwIQ7oHQcjYSAByag=;
 b=JnpQxJnCJlHZxuglZa9VdcurSiH0iEHfn6nBHeKTex0V4v3G235JUwBY4pb1eSiclz
 m06nPIghq0n/EfHKXtBFkyA4hexywYTXjUoy+8TdzZWrGFholGpksDfu5WPM/cJgxq/J
 qpl7pONl97hpkGsBeK/yg32mJtLswQZD6fQktT+z9+7X8atmk/31RquvCS2c4pj53Zav
 Yh0gcaKlNAXJcbJhxWfXtBArJ+6R/k5htYLnZNe+xbcqnz7qAwlM6dSOSuZO+G1Sn88T
 yuV0QS6Kzx/6cKofHepMDYvwLImIFJUAFo7qPSPUadWWnE/TpKkqDSlY6Gftje4Mu56G
 smEQ==
X-Gm-Message-State: AOJu0YzElsQijzABlxTHK+GqaQiYb48Vn/vs5n9A8cs7md7en5+uTI1s
 GvqD/xCqj20Ng4fB16DN8vaU+byQtjxLQugucE8=
X-Received: by 2002:a19:9108:0:b0:50a:3c38:778c with SMTP id
 t8-20020a199108000000b0050a3c38778cmr10023893lfd.12.1700090536874; 
 Wed, 15 Nov 2023 15:22:16 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a50c019000000b0053dec545c8fsm7199198edb.3.2023.11.15.15.22.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:22:16 -0800 (PST)
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
Subject: [PATCH-for-8.2? 3/6] hw/arm/stm32f100: Report error when incorrect
 CPU is used
Date: Thu, 16 Nov 2023 00:21:50 +0100
Message-ID: <20231115232154.4515-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115232154.4515-1-philmd@linaro.org>
References: <20231115232154.4515-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jYT8bW25GU/F

The 'stm32vldiscovery' machine ignores the CPU type requested by
the command line. This might confuse users, since the following
will create a machine with a Cortex-M3 CPU:

  $ qemu-system-aarch64 -M stm32vldiscovery -cpu neoverse-n1

Set the MachineClass::valid_cpu_types field (introduced in commit
c9cf636d48 "machine: Add a valid_cpu_types property").
Remove the now unused MachineClass::default_cpu_type field.

We now get:

  $ qemu-system-aarch64 -M stm32vldiscovery -cpu neoverse-n1
  qemu-system-aarch64: Invalid CPU type: neoverse-n1-arm-cpu
  The valid types are: cortex-m3-arm-cpu

Since the SoC family can only use Cortex-M3 CPUs, hard-code the
CPU type name at the SoC level, removing the QOM property
entirely.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/stm32f100_soc.h | 4 ----
 hw/arm/stm32f100_soc.c         | 9 ++-------
 hw/arm/stm32vldiscovery.c      | 7 ++++++-
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
index 40cd415b28..a74d7b369c 100644
--- a/include/hw/arm/stm32f100_soc.h
+++ b/include/hw/arm/stm32f100_soc.h
@@ -43,12 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
 #define SRAM_SIZE (8 * 1024)
 
 struct STM32F100State {
-    /*< private >*/
     SysBusDevice parent_obj;
 
-    /*< public >*/
-    char *cpu_type;
-
     ARMv7MState armv7m;
 
     STM32F2XXUsartState usart[STM_NUM_USARTS];
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index f7b344ba9f..b90d440d7a 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -115,7 +115,7 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Init ARMv7m */
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 61);
-    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
     qdev_connect_clock_in(armv7m, "refclk", s->refclk);
@@ -180,17 +180,12 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("CRC",       0x40023000, 0x400);
 }
 
-static Property stm32f100_soc_properties[] = {
-    DEFINE_PROP_STRING("cpu-type", STM32F100State, cpu_type),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void stm32f100_soc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = stm32f100_soc_realize;
-    device_class_set_props(dc, stm32f100_soc_properties);
+    /* No vmstate or reset required: device has no internal state */
 }
 
 static const TypeInfo stm32f100_soc_info = {
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 67675e952f..6300dca722 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -47,7 +47,6 @@ static void stm32vldiscovery_init(MachineState *machine)
     clock_set_hz(sysclk, SYSCLK_FRQ);
 
     dev = qdev_new(TYPE_STM32F100_SOC);
-    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -58,8 +57,14 @@ static void stm32vldiscovery_init(MachineState *machine)
 
 static void stm32vldiscovery_machine_init(MachineClass *mc)
 {
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
+
     mc->desc = "ST STM32VLDISCOVERY (Cortex-M3)";
     mc->init = stm32vldiscovery_init;
+    mc->valid_cpu_types = machine_valid_cpu_types;
 }
 
 DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
-- 
2.41.0

