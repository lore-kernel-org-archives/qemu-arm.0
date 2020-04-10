Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp750198lfm;
        Fri, 10 Apr 2020 07:47:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJaG2EeQHImJ40nKcOWzsJcNbOmyZXQ03MzrucnR36QW15ClxQBDGo8sIygFGsGm63hYzHa
X-Received: by 2002:ae9:ed04:: with SMTP id c4mr1821004qkg.367.1586530028910;
        Fri, 10 Apr 2020 07:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586530028; cv=none;
        d=google.com; s=arc-20160816;
        b=coLpGwPfT9NCz07S+yusTFAzPODMG4jc0X+KFmfTHQUh4Kl7akZFAh/QKDGzqO64le
         RXWbrbHoL0ZTNTHFU50svvWfLbaIx/zn/dQGG3d4DMgjaQ53NBAf6g/eEBZ9rmi9lt2c
         D6SocnMT/5SQ4fumo7/YxmekBF15sezCqzK7AkpzgQYnqeauO961FsaqL05zcf81PocW
         dxoM5boE/nk5AO0fIwwxw/vQgx5tusxbm04p907Aw7Pi8MW/YjSr7B4qwuBJqOpPKx+L
         UrDGrn4k/WwwO+TqgjLAprm6g48/pY4gcaggLlPtNAgoCNVKMhkJkMRe/49vEsK39HLw
         iUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
        b=F9cvj5O8CtEQHqZORuGwxUuf7NsjSuRXwTzPUj0r4V5jE65ueqBk/sVooQil/WPfZm
         JykcEOV6+IsI+znGk8crPNyh6Ih9VaR9SnsS0mdRDhTMC2GvAUO90b0pryYNibsw25G+
         XI2w1Qsim8CdsvEj1jcyPkywU1vYbpsnYG2WzAUseQFUM1ykvyl684XojGrnLMjYgKWh
         btfO0EDscU4BoVRClbAe9KMp/Hb15SHpRPB5+ZOYvei8GrAdliF10tEGQCQ7trIato3S
         nDRjJx48xNooTQ29T1eWxZwyeUwsZ213vgUaiX/EvljKkAKYYI+J7TEbT/uUMB6vLKI6
         R1lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=svA2wAbN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si1595518qkm.3.2020.04.10.07.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Apr 2020 07:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=svA2wAbN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMuvz-0007wg-4T
	for alex.bennee@linaro.org; Fri, 10 Apr 2020 10:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jMuuk-0006gT-OX
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 10:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jMuuj-0007QN-I7
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 10:45:50 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jMuuj-0007Os-Cj; Fri, 10 Apr 2020 10:45:49 -0400
Received: by mail-pf1-x441.google.com with SMTP id u65so1133444pfb.4;
 Fri, 10 Apr 2020 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
 b=svA2wAbNvNLpRGQAB7IyXw4FYliHSAjP+ryyHVhf2+zbajJ4Gb1xd3ARoZNZAQHB+j
 mwp8y2E+7BJKL0Tlm1ZnFzm6bCrBh2/UBmpEPWRbJuSPedLW0cTRpr5VCEt6Ffz1X0nP
 5MRyv5SW6OvzOF9EqQWpua8Az1FQzZNRAnluF5C1LyIcbwh5E6iJsALEwlWSX4c/P0eV
 32oXVZTuWkvR5O4fswjZnnXIQO8kOj+1tDSMjT+RqNP45RrGKARQvGW40bbOpgr3oEpD
 uJtVkcHCypJtnBq6Cn3/cTfokZ/g7iuVvBtGWWpKHPZitVyDVT1c8lmP5/e0ySDEcBhV
 Jw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
 b=oXpZTuEdgbYYZnuDS+kDb4SgobKQloXI9Vng8Gr2rS9Yqbzhzdsm5F8ypTbbBA2IKL
 j0S2OQ2c9rg96l0g6u/N34ETKLtoUhWptB+FQ3qAI8o/jGIsVyKo+x+puilSG9Cqy0rw
 N9q2UTMaqUC8EKEEF2sKxoNh2kRP++yxLSimbRYbl6fKXFZRpxyjQAvEMkMYwo7l6fbF
 G4DB5PUirLWMN4FlMkMMSTWKAHQlWq0GXiZwkh9tasgci93ApDnxWJmAm7uZ7ZwNEP10
 w07ddaRILjxzv5YCegO0VxTi52Y9W1NlfASLsUooXYUndP9dHRkhKA2sMhGILqT1BRp7
 3JQQ==
X-Gm-Message-State: AGi0PuZ6xlgY6ZtuweRlvgsFZO6O7r0zZAeW2lHKEuu7MzzKot2bv1oK
 81DWaMiwZjb1+bh82ooDjiQ=
X-Received: by 2002:a63:6f88:: with SMTP id k130mr4676687pgc.194.1586529948508; 
 Fri, 10 Apr 2020 07:45:48 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id p12sm1984667pfq.153.2020.04.10.07.45.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2020 07:45:48 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v4 2/3] msf2: Add EMAC block to SmartFusion2 SoC
Date: Fri, 10 Apr 2020 20:15:25 +0530
Message-Id: <1586529926-11441-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586529926-11441-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586529926-11441-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Lh8XtIlEdLy

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

With SmartFusion2 Ethernet MAC model in
place this patch adds the same to SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/msf2-soc.c         | 21 ++++++++++++++++++++-
 include/hw/arm/msf2-soc.h |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 588d643..2f2db6d 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -35,6 +35,7 @@
 
 #define MSF2_TIMER_BASE       0x40004000
 #define MSF2_SYSREG_BASE      0x40038000
+#define MSF2_EMAC_BASE        0x40041000
 
 #define ENVM_BASE_ADDRESS     0x60000000
 
@@ -55,6 +56,7 @@ static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
 static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
 static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
 static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
+static const int emac_irq[MSF2_NUM_EMACS] = { 12 };
 
 static void do_sys_reset(void *opaque, int n, int level)
 {
@@ -81,6 +83,13 @@ static void m2sxxx_soc_initfn(Object *obj)
         sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
                           TYPE_MSS_SPI);
     }
+
+    sysbus_init_child_obj(obj, "eth", &s->emac, sizeof(s->emac),
+                          TYPE_MSS_EMAC);
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -192,6 +201,17 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
+    dev = DEVICE(&s->emac);
+    object_property_set_bool(OBJECT(&s->emac), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_EMAC_BASE);
+    sysbus_connect_irq(busdev, 0,
+                           qdev_get_gpio_in(armv7m, emac_irq[0]));
+
     /* Below devices are not modelled yet. */
     create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
     create_unimplemented_device("dma", 0x40003000, 0x1000);
@@ -202,7 +222,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("can", 0x40015000, 0x1000);
     create_unimplemented_device("rtc", 0x40017000, 0x1000);
     create_unimplemented_device("apb_config", 0x40020000, 0x10000);
-    create_unimplemented_device("emac", 0x40041000, 0x1000);
     create_unimplemented_device("usb", 0x40043000, 0x1000);
 }
 
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 3cfe5c7..296ed03 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -29,12 +29,14 @@
 #include "hw/timer/mss-timer.h"
 #include "hw/misc/msf2-sysreg.h"
 #include "hw/ssi/mss-spi.h"
+#include "hw/net/msf2-emac.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
 #define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
 
 #define MSF2_NUM_SPIS         2
 #define MSF2_NUM_UARTS        2
+#define MSF2_NUM_EMACS        1
 
 /*
  * System timer consists of two programmable 32-bit
@@ -62,6 +64,7 @@ typedef struct MSF2State {
     MSF2SysregState sysreg;
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
 } MSF2State;
 
 #endif
-- 
2.7.4

