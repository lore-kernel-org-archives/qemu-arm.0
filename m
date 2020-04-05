Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2568753lfi;
        Sat, 4 Apr 2020 22:14:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypLNuQXn/I5m7nJRYqlMiX98dTMrU72FYUy3sC2S8kdynV9zyxY0IEETaHLHJy/LZU+dV+ZX
X-Received: by 2002:a37:58c3:: with SMTP id m186mr9709085qkb.30.1586063663713;
        Sat, 04 Apr 2020 22:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586063663; cv=none;
        d=google.com; s=arc-20160816;
        b=yX2iJvxBTFxC68iUtJSwTz4p5sowMQ9oOBKYHCP39uR0CsJqLB3mkJpHh0cNfld2qn
         6IeHcjxw5QeXea245BMPl7isESGRuWBgbPOgiX5411C8gEwsFBDUllmTNWlI58bhG2Ue
         YhBy+oqiodbmkKADKIx+wWOTVm3OfFa1PgceOD4vCnRrihFLR3TylVGznLJ4FNbZ47rA
         J8JJ9AS7MGEf5hsHCAMDw+Lbkh8FNDt5706UNpyHLmBs9MwLtOXFMSSRJ/O/oqj9/cdN
         SpISLN/xNRkm/5WkTkHqD/Qx9LyeC0y2Oi1cDtAn2QmdoJ3zR9daLHtUHmHBzbbkB2zD
         elDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
        b=aHJpPvGSyz1KsKn/TNNT3Ojge3C8q7CuLJmWrzIhMq+U07ZmaC06eaN8s8v89736fb
         mHxLCRPRQZJMBqjFr0pRTUpwjiyDwqCVErjMA2F95OSrhg7l90Ght3at35a6Fz+Wxolc
         Wc7HXl8WGI/RHuKxTw83NsOBi/qMFYlQShIydP2xxJjnshDTDWwW6o1GH+uDiNI/0RKV
         4T6SHj9EQ8x0fKnPQ/kndWpSjMbCGClUIdLNwDKg5zPVPqENR8Rl9fGp3ltWPaLpzUQh
         TW5cPB9v6960IIDeEIzGTn4aO9WwhnXtabiBpDss2gOqQHDyMbA4kxkRt9x/B5jd57+5
         rTwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l4zINUAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23si8010196qkd.165.2020.04.04.22.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 22:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=l4zINUAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKxbz-0001by-5U
	for alex.bennee@linaro.org; Sun, 05 Apr 2020 01:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jKxbq-0001Vz-EO
 for qemu-arm@nongnu.org; Sun, 05 Apr 2020 01:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jKxbp-0007y3-7C
 for qemu-arm@nongnu.org; Sun, 05 Apr 2020 01:14:14 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38929)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jKxbm-0007wx-Dx; Sun, 05 Apr 2020 01:14:10 -0400
Received: by mail-pf1-x441.google.com with SMTP id k15so5856357pfh.6;
 Sat, 04 Apr 2020 22:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
 b=l4zINUApFN/LVGRRj8eCt+ns8s/07HaegEJ3mG1pl1IkmhIkMgXDUVZyxssnQOgqXl
 vaFeba6eft8j415MmvVw+8FLXThfwlhzff0dBiVXbgmDtNmktCWXhp4+53PEKV3Wxnox
 siXbri6yXroE6ggYDoaNCE57kXn6kejXXTnlsYlpvrgoFsyOCVBSE8V6ZK8qpeo2YL3Y
 bQkzyqPF93fycVKV45LkH9Buf/fZ1o5h8ao0W9o0vtTDskfiOLLaumuE6tqdcSKmDKsm
 iLBQ7rNqoVzM4AiB2BpaW9rFGKhqVlD8HOUfHENr1K2qfmVu+D3NEGLco3T4qoONff5p
 vFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
 b=rZc0k9W0CT2PRnvbOFsryOy0jkTNFb0t8o6oTRmQzLX58f2RzCbi5Il011aUGPVf0C
 Y4fM/RwBweQ0ZpkKZ/iI3xhqHemyE9NfLlGsITgQw/e0uAo3uZZ951UtCItjpTUHhgOZ
 b4FRNFWJjaqID9YG+dVhGhdjFM6MqlOmxXuUNqA7Gt4jE9gvx3eHmmwKxhG4sDP8UYLA
 2aH6uNQ1hShjvTmZvSRo9CzGp6szmz43i2/32UYe/5REiCpD6gODZzcjYt5sYQw6GnNY
 ywaEk8N1XCd6v/KRdDXNQuoypHD3vDKtL8NmF6vyUZW3W1DVkBzh7jUFJXU0v5oxhpJz
 jzcA==
X-Gm-Message-State: AGi0PubTEoPDsDkj8jvif/oiZvdaZU9vCNutGv4a6ZtEhy/5btpdgjNr
 jDtUcKpUpP9HlJxzTYCZiBw=
X-Received: by 2002:a62:6503:: with SMTP id z3mr16221804pfb.232.1586063649444; 
 Sat, 04 Apr 2020 22:14:09 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id j24sm3466012pji.20.2020.04.04.22.14.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 Apr 2020 22:14:09 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu-devel PATCH v2 2/2] msf2: Add EMAC block to SmartFusion2 SoC
Date: Sun,  5 Apr 2020 10:43:44 +0530
Message-Id: <1586063624-13375-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586063624-13375-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586063624-13375-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GtnAizDXROop

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

