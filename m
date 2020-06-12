Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp643397lfc;
        Fri, 12 Jun 2020 10:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1+5PkdK6IHh+jfCvWhV3vT2GD5FCVnpEZZHNoW3O/0e2iWjcsBpmLKuQl0BBWH6G7E5zZ
X-Received: by 2002:a25:8404:: with SMTP id u4mr21130876ybk.515.1591984623926;
        Fri, 12 Jun 2020 10:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591984623; cv=none;
        d=google.com; s=arc-20160816;
        b=FzzPIiERhmJaSQ0CwgvG387zXKIz7LhrASnQYYHZEGb8+hDvEVfSGxFAFkur73/I2S
         LIBzSS+USVpHLRDXGC+abSWBhGX8WrBxtSygjwFlEgQciUcuBAyu++D/Leg6OXbGYBAk
         LAesREJyZv/yMohIfmNrkAen1HvfYFhkmnINMpnWEwnG/ixAfhG/FCr6mEYG2HU30mi2
         j4pYzNjv1UNtwdOXwCKRrVSZAd7gRPT3D2XI3ejHQiCG9/aEXxdCwAXmdwxFjz3A+QIj
         Cx1Z8NDyWmvr9TNGKBZqgjSu+Kro3G6C/EtymXFWGjuFb9i3A9yuOHWFISsoS5fPH56B
         L5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Jpf6+q8OiuFmDbu8SbMqWnakxmwLS2sZMacUeOa9SzM=;
        b=HjwIbR6/5RN8jp+YF0Vg/ca2idyQZfkd8mQA/tjt9phbQjGDAt+0MDs3lr8CzK+YNO
         6UEJWug4PnbL+iwql78iF+VKWX9DmahKU6MfF2rXs1VuvJ2vVs6ffQ1ORDs6XkXAiq2S
         7XJxALJnAdzprh7IkiV24gVmFkPOUqNxS1vUY+E4/EwRTxVdgGM98Ou2kjBJPDgK0GLi
         Y4NnTDm9dBavIAkStof77PcbAHztbuegEUOGO29US7tqelku48sKcyfOcs7elyBbFCWp
         QHCEztz24+mtr7N8F41ldIUr5FvryVPYquMflGjgnbdeXdi2VsX8ptwoq8UlfpUFr6bh
         sKxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y2hCBfiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w77si6337454ybe.432.2020.06.12.10.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jun 2020 10:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y2hCBfiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjnvL-0001tm-AU
	for alex.bennee@linaro.org; Fri, 12 Jun 2020 13:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjntR-0006q8-Ux; Fri, 12 Jun 2020 13:55:05 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33848)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjntQ-0004CM-Bl; Fri, 12 Jun 2020 13:55:05 -0400
Received: by mail-wm1-x342.google.com with SMTP id u26so9659118wmn.1;
 Fri, 12 Jun 2020 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jpf6+q8OiuFmDbu8SbMqWnakxmwLS2sZMacUeOa9SzM=;
 b=Y2hCBfiuLlI1O5dzMiGWrA7Ky6pBN+vlWi54JY52Grf0MVMZp7NjqAPRG+dpSOQuqE
 j+qJWuEu3V8/iUn+RrlV30ACQgpsib6rVrB1cjSqMwr5t5zkJegBoaF47zJQJVy6KtvH
 sXKUw2L3DZ957/3HOM9b5/kOXqyunK53SpuI+lKnP4GPl1TPrTR/naEwEkIzzqdK/C2k
 zd4x8WJYp/tYDhGSTQW3jEC3D+mXRsyINheOeZhE8JcHm+LLa5VxtqHZ49eg+4MOE9ST
 fWC9HD2JIPjLaL4obaYHr2Oi9h+I/lmHzLjiXNFKi+bzOglDF9lKD7X6CSKfIXwXBDMi
 tIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jpf6+q8OiuFmDbu8SbMqWnakxmwLS2sZMacUeOa9SzM=;
 b=VOEKHVSR8l5IF6HIWrixsPpTjA9E4TiWufKjK+FdUWYKN+4tra9LNyDGpCREnmEhTY
 ymIFcuSuor9acGRYHQLnWYR/x5LEbnHp3aXUSliv6aSLiTfeTPr/XmxyI2Zih1gJaued
 XhpU4fJXCUS/N36kYXC+1vBd4Bk5WUOIFy+AB1W0RNX0mYBjgEjr2rteZPNMVvEo74cR
 kurlPXAzvS9oZloRiG8U3QS5wIbtdnS0I2vslIMoMzsb/oUfp4YiSrEKKUsmtdKRzBZp
 RRO0Y4AR2FSQQk2DNMozfAgTeQqTKCyP60ow4u2KeHj5ty9VXzv2w4obSpeIP5kYdfjK
 1OFA==
X-Gm-Message-State: AOAM5331T47OTdaF28EcfBmzqHgsLNRLYbRpui63L8iNAZxZ9vv40eqf
 FLZZ9oOuypBqdb3hmqQ4UaGzV/Qd
X-Received: by 2002:a1c:de55:: with SMTP id v82mr108082wmg.148.1591984490344; 
 Fri, 12 Jun 2020 10:54:50 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e12sm11288658wro.52.2020.06.12.10.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 10:54:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/5] hw/arm/microbit: Add a fake LED to use as
 proof-of-concept with Zephyr
Date: Fri, 12 Jun 2020 19:54:39 +0200
Message-Id: <20200612175440.9901-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200612175440.9901-1-f4bug@amsat.org>
References: <20200612175440.9901-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: czv/Fs4e/YIX

We were using an AVR based Arduino to use this device, but since
the port is not merged, the microbit is the easiest board to use
with Zephyr.
Note the microbit doesn't have a such LED, this is simply a proof
of concept.

How to test:

- Apply this patch on zephyr-v2.3.0

  diff --git a/boards/arm/qemu_cortex_m0/qemu_cortex_m0.dts b/boards/arm/qemu_cortex_m0/qemu_cortex_m0.dts
  index a1b3044275..61b39506b1 100644
  --- a/boards/arm/qemu_cortex_m0/qemu_cortex_m0.dts
  +++ b/boards/arm/qemu_cortex_m0/qemu_cortex_m0.dts
  @@ -21,6 +21,18 @@
                  zephyr,flash = &flash0;
                  zephyr,code-partition = &slot0_partition;
          };
  +
  +       leds {
  +               compatible = "gpio-leds";
  +               led0: led_0 {
  +                       gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
  +                       label = "Green LED 0";
  +               };
  +       };
  +
  +       aliases {
  +               led0 = &led0;
  +       };
   };

   &gpiote {

- Build Zephyr blinky:

  $ west build -b qemu_cortex_m0 samples/basic/blinky

- Run QEMU

  $ qemu-system-arm -M microbit -trace led\* \
      -kernel ~/zephyrproject/zephyr/build/zephyr/zephyr.elf -trace led\*
  2953@1591704866.319665:led_set led name:'Green LED #0' state 0 -> 0
  2953@1591704867.329143:led_set led name:'Green LED #0' state 0 -> 1
  2953@1591704868.332590:led_set led name:'Green LED #0' state 1 -> 0

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/microbit.c | 3 +++
 hw/arm/Kconfig    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index ef213695bd..102661b66a 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -18,6 +18,7 @@
 #include "hw/arm/nrf51_soc.h"
 #include "hw/i2c/microbit_i2c.h"
 #include "hw/qdev-properties.h"
+#include "hw/misc/led.h"
 
 typedef struct {
     MachineState parent;
@@ -58,6 +59,8 @@ static void microbit_init(MachineState *machine)
     memory_region_add_subregion_overlap(&s->nrf51.container, NRF51_TWI_BASE,
                                         mr, -1);
 
+    create_led_by_gpio_id(OBJECT(machine), DEVICE(soc), 21, "Green LED #0");
+
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
                        NRF51_SOC(soc)->flash_size);
 }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9afa6eee79..2afaa7c8e9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -436,6 +436,7 @@ config FSL_IMX6UL
 config MICROBIT
     bool
     select NRF51_SOC
+    select LED
 
 config NRF51_SOC
     bool
-- 
2.21.3

