Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4060740wrm;
        Mon, 7 Oct 2019 10:11:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDsSJ+nZaFIFgNjK9F/VZAfFx132p+C7u18M8lRxTF/ec4F2qUK+U7/q8HZT7LT5JxWw6x
X-Received: by 2002:aed:3b19:: with SMTP id p25mr2963098qte.355.1570468309585;
        Mon, 07 Oct 2019 10:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570468309; cv=none;
        d=google.com; s=arc-20160816;
        b=lsi7ZZy5GoxTYcKdLkinnSBr9XylKvZasjYRBFDP3YNc06RIxEZOzDAMSVuFn/utZY
         BJRaGj4dl7IdByHwhZgmSCc/vCsd3jxv7lT7hchGaoQiu6MAWU+4ukvTVSo8UmdhEWIe
         vHHTfjKUiTFXt13b+YvbXiaIcO6KsCIvelt8TdoT+S5KLT8SqOzPanZdaD1ybIKqM8Y5
         M4BDe40OJx0ClE0KZxf40zWxrfUlYO2zy0VxPUyAFZst5NV3aF/J4hSqgp5DHQ8xjPxu
         fPaPX2DwD5OIGfgynjyRQSF/1zRDBv9JpR3Lux2UKsCnlygg1ym7how2QnaZxEElU9Mb
         UXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h9QPSdYlAgh15MXqatIxr3w1iFSHreJWGKOTOlnlE1I=;
        b=Pm4+3LjiJOCOVC98+R1/LTMnRuEqcJhj2dYW9QQ5afiNn7GaaO59DWmr10VOLUoLDL
         WpAOr61PsigiiwUQhZGVxSLGmpe3pvG4ChRvYmvOuhWZ28tSpOqahhIZvHp9LxMrIovz
         kcr5fr6CdyCDDGc175L/W7UxY3SJJfw1UoQKed/Q0U3rF1o6p/0uPkfd61EYBDu3B11b
         jnLb1ituY+L3PL8sNpZcoSV1Ux6YHs2aFEkeAi81DS5PjPzszsLkbllkTDUWdhj3XSEE
         8YDth9HRxQplxKXdFuW/4DbDJTjfEip2GHPtf02m1DnQaSP4vYnM5KFMwIA0RlsNoYAm
         SozQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="m36v3Zb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r67si13994410qke.318.2019.10.07.10.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 10:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="m36v3Zb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHWY0-00044Q-VG
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 13:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iHWTM-0006rr-Kl
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:07:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iHWTL-0004xo-BG
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:07:00 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iHWTI-0004vX-CS; Mon, 07 Oct 2019 13:06:56 -0400
Received: by mail-wr1-x442.google.com with SMTP id h4so7494229wrv.7;
 Mon, 07 Oct 2019 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9QPSdYlAgh15MXqatIxr3w1iFSHreJWGKOTOlnlE1I=;
 b=m36v3Zb/J0IfGdJFu2+4hn+/UczY3B6eSt/YcSsm5tXpqxY1MMQZSazW7e21aXpBxc
 o/INrxvyIe6/Tvbc6qdhoQpLNxxN5KTcCInpe7Y9mrgqFENcnSKHMbBy4HerS5FYSoCj
 2rlNzJfGB1jlhVid5ibz2dgjhFq63D/Zn2dZrMv5A6UQfXLDqW/PWwi2Tmb0PNJaTJsX
 J4qbPFug3ONq+PNYqx87AHVKl13fj1DMymb6xc66xO4mwsJCtZN5PX2CkspPaHINXqOY
 845a5a0KJf7t7JV77JCt2P0DlcLVTVgnsv9TtPN+LQF9q06MUko96fmVnU0RUv0IG5Ns
 I4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h9QPSdYlAgh15MXqatIxr3w1iFSHreJWGKOTOlnlE1I=;
 b=VUVL09sCWDNZMyp/4y9FrZ2PaPvURyL9AIFcPjfElK3YPwDmZGM1WcblomleJcCMRT
 eSqf92oCFZZR7seMksJBTfU9zn5ooef6/gRSfEbbRARyfjBLf75srjRE1IqSCPwkmRTt
 XBTUD2Okz6IO4IksfgiWeDMuevLbLpv/qB4wI4KIQTSlDhN16P6zUtkojl0imm+GFKj6
 Hp2Gv7duPp6paqAAFNNqLpM4OvUh58DKxMsajrYhwfzYNNc79txvUEhRyWEDPqiDIQn1
 pMM86NDW5U0iS1vQ4PpOxZHeVVJ5UhjxgSK2+a85poYOAz+YQOOHFcg/tw5Qukx964Hh
 XZcw==
X-Gm-Message-State: APjAAAUPkdBNBWYw3kwBh92dXGU7yVUs5icfnZu/M4bBg/hypjHzuLeb
 R51e8qnl6Pb9gsq4cVb/b2Jiy1dQsG0=
X-Received: by 2002:adf:e88f:: with SMTP id d15mr8093875wrm.324.1570468015165; 
 Mon, 07 Oct 2019 10:06:55 -0700 (PDT)
Received: from x1w.redhat.com (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id x5sm14036603wrt.75.2019.10.07.10.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 10:06:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw: Move BCM2835 AUX device from hw/char/ to hw/misc/
Date: Mon,  7 Oct 2019 19:06:46 +0200
Message-Id: <20191007170646.14961-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170646.14961-1-f4bug@amsat.org>
References: <20191007170646.14961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lcW7bAFS9Oat

The BCM2835 AUX device is a MUX between one UART block and two SPI
blocks. Move it to the hw/misc/ folder.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/Makefile.objs                   | 1 -
 hw/char/trace-events                    | 4 ----
 hw/misc/Makefile.objs                   | 1 +
 hw/{char => misc}/bcm2835_aux.c         | 2 +-
 hw/misc/trace-events                    | 4 ++++
 include/hw/arm/bcm2835_peripherals.h    | 2 +-
 include/hw/{char => misc}/bcm2835_aux.h | 0
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename hw/{char => misc}/bcm2835_aux.c (99%)
 rename include/hw/{char => misc}/bcm2835_aux.h (100%)

diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
index 5bd93bde9f..d6b8ce5e60 100644
--- a/hw/char/Makefile.objs
+++ b/hw/char/Makefile.objs
@@ -20,7 +20,6 @@ obj-$(CONFIG_SH4) += sh_serial.o
 obj-$(CONFIG_PSERIES) += spapr_vty.o
 obj-$(CONFIG_DIGIC) += digic-uart.o
 obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
-obj-$(CONFIG_RASPI) += bcm2835_aux.o
 
 common-obj-$(CONFIG_RASPI) += bcm2835_miniuart.o
 common-obj-$(CONFIG_CMSDK_APB_UART) += cmsdk-apb-uart.o
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 0c86a907df..f1e6dd9918 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,9 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
-# bcm2835_aux.c
-bcm2835_aux_read(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" value 0x%x"
-bcm2835_aux_write(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" value 0x%x"
-
 # bcm2835_miniuart.c
 bcm2835_miniuart_read(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" value 0x%x"
 bcm2835_miniuart_write(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" value 0x%x"
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index a150680966..9ffeee7f46 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -50,6 +50,7 @@ common-obj-$(CONFIG_OMAP) += omap_gpmc.o
 common-obj-$(CONFIG_OMAP) += omap_l4.o
 common-obj-$(CONFIG_OMAP) += omap_sdrc.o
 common-obj-$(CONFIG_OMAP) += omap_tap.o
+common-obj-$(CONFIG_RASPI) += bcm2835_aux.o
 common-obj-$(CONFIG_RASPI) += bcm2835_mbox.o
 common-obj-$(CONFIG_RASPI) += bcm2835_property.o
 common-obj-$(CONFIG_RASPI) += bcm2835_rng.o
diff --git a/hw/char/bcm2835_aux.c b/hw/misc/bcm2835_aux.c
similarity index 99%
rename from hw/char/bcm2835_aux.c
rename to hw/misc/bcm2835_aux.c
index a1ca9741d6..83698e2ece 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/misc/bcm2835_aux.c
@@ -12,7 +12,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/char/bcm2835_aux.h"
+#include "hw/misc/bcm2835_aux.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 74276225f8..0756d58162 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# bcm2835_aux.c
+bcm2835_aux_read(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" value 0x%x"
+bcm2835_aux_write(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" value 0x%x"
+
 # eccmemctl.c
 ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
 ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 6b17f6a382..7aae515d7e 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -13,7 +13,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/char/pl011.h"
-#include "hw/char/bcm2835_aux.h"
+#include "hw/misc/bcm2835_aux.h"
 #include "hw/display/bcm2835_fb.h"
 #include "hw/dma/bcm2835_dma.h"
 #include "hw/intc/bcm2835_ic.h"
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/misc/bcm2835_aux.h
similarity index 100%
rename from include/hw/char/bcm2835_aux.h
rename to include/hw/misc/bcm2835_aux.h
-- 
2.21.0

