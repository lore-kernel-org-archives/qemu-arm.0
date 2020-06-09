Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp450040lfc;
        Tue, 9 Jun 2020 05:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPNCa5iILDEYOTqAuSRh1BYgZZLCeE3e27koybvz4F2LlkEILp6iwugcJtWRJ8C67aPs9E
X-Received: by 2002:a67:19c6:: with SMTP id 189mr2842816vsz.184.1591706589055;
        Tue, 09 Jun 2020 05:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591706589; cv=none;
        d=google.com; s=arc-20160816;
        b=L0IRkl2y8buZ2OhLooq3ai5R521ssmhqZwj4KQx1PxG1n7oiQn5bloIRGhF67CCVNg
         tItIRkEgbBmaIQNX8miACd4H8JIrndwlPNntsVQCr7VmEGrvgtqfHfJ9djwC+CYRwCBe
         hWbenxH8jFtGX493GGK+Hl+pWSTkNg4duvr8KLkQJv8zAJeWoZ+BnbPnYvdVTbqPiOIV
         ftED4yyam497xnM74eJ9X7HXStKmWV7YrcfWjh6DYi3rkJqU8cEczgDfTjt2+kbKf8mP
         qNGxzSYxWEJRRwERcMDQpoFP2wV+OXidcQdtfWXUbLuwc+S11o6ASdxh7xBZUbO42ihp
         ZOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Jpf6+q8OiuFmDbu8SbMqWnakxmwLS2sZMacUeOa9SzM=;
        b=aqzw6coi/yXnXurJvBopoG3/RxWauD4Q2PBqKFbMQdl4nPI6THSr0XaQBMFpIChzjz
         uJmdKuZiwPxI4SbsBpWzaGaPR6i+JxKU4RV4pjnclXTpv9xf87dlNh/Q1aUo4OCpCKF4
         u5a6qqR9E9bio/a3Gkr4RFseAGhjI5ZS08sCP3ZJsdc726GbOUbZYypivalxleq3F3u2
         O7SxOLcJVC1yc6/bUElmWxId1CGZ0WrkOx9zDpbc4biras4qDaN6NhiMN59jc+rYQggb
         eMWC8UR1Oef0M8rW5QzSUeJTf2Q6gXs+9M1XlkxCXwXLeRBN8DTtuV1cPueK3e9Dd0ek
         +1nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A+IwQqfz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i62si274392vsi.117.2020.06.09.05.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A+IwQqfz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidau-0003H6-9q
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jidSl-0000Ka-01; Tue, 09 Jun 2020 08:34:43 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jidSe-00074m-Hs; Tue, 09 Jun 2020 08:34:42 -0400
Received: by mail-wr1-x443.google.com with SMTP id c3so21079926wru.12;
 Tue, 09 Jun 2020 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jpf6+q8OiuFmDbu8SbMqWnakxmwLS2sZMacUeOa9SzM=;
 b=A+IwQqfzZ+5v2HFoHECHAYAzj7L02eM8u7Jm0dSoZuC8n1JM027M8u4oe2bzsVT8jS
 gdLBfgknG6VLIfHQFO0J0L7XgVf+znqCjZzY8zDPUnoxLUhAwP/lhdv6xY9tg5UbYk7y
 2wsN55zcYtRU7imbsMniZa8MZbJOmgF9pYRDkAMaek87rN2+HjqVWFeV+Ivsz24UkcC6
 MNweAGONHAzAobpasUjAHo/seL653m2OAWXm34UKM35rFt3/hFYy++je8R1gz4vzwvlW
 UdDRUWTBdkGvQtqvGbAftWrCnH89nIlVHVUoT8vvVEPzYfKpsPKGUBi+zC4n2jhtuVln
 64Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jpf6+q8OiuFmDbu8SbMqWnakxmwLS2sZMacUeOa9SzM=;
 b=DxCSGWKvHix0l7NVI0GMoCPW/ZS1502n9vYyUYmhKn43PhorlUbAr5y/8BHeJSojzP
 zvVFHE3x+JxSdz1/1reVgz58OMFdH3M7EZDLTdv7Uml2w0AGzib7d8SEZBVlTXa6Nqdt
 8EW25/rJwkoVNtNfkmWhpRoarE+hrSdDP0Z4ZsqXrDGZJfLK4Ivu00eENFCyTWnRCSvC
 SXAYg32GUXjhY1cCL7jlkcoUNp9IGp5xf1LUXWamWuPBUbwwAwlkdhoFUetUYZPi91Ap
 eKmTOAHXfpw2AVxeXydrGPaCNJCw+gjPrOSUHkI4gvGeHZwX2XOgoQ3QAHcaLh2p8uvO
 zgiA==
X-Gm-Message-State: AOAM5323Rw+pPMeratNWPohTx01ao8IfDWoiL3BopPplEeGZIh/hJ2Ew
 Z0d0Ro5HyMXju2qp6dqUYxN8FNo7
X-Received: by 2002:a5d:5270:: with SMTP id l16mr4225546wrc.80.1591706071648; 
 Tue, 09 Jun 2020 05:34:31 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c81sm2920931wmd.42.2020.06.09.05.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 05:34:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] hw/arm/microbit: Add a fake LED to use as
 proof-of-concept with Zephyr
Date: Tue,  9 Jun 2020 14:34:24 +0200
Message-Id: <20200609123425.6921-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200609123425.6921-1-f4bug@amsat.org>
References: <20200609123425.6921-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZsJlo7NqKgj

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

