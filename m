Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5235432lfm;
        Tue, 14 Apr 2020 10:28:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzp0p36lj/Q39tJQQOke8bFlheclJ5r3RmtiyYl++FI9pa16OKEw4okLz7Os9+iU1/Pue4
X-Received: by 2002:a05:620a:12fa:: with SMTP id f26mr11229062qkl.374.1586885324692;
        Tue, 14 Apr 2020 10:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586885324; cv=none;
        d=google.com; s=arc-20160816;
        b=oUqdSKYjd0Yw8PaQsCo+8fShBxcw+GB413tLBOHHME8S+OzAlyBMBLKMa5ybPcFJu4
         Uxtysr/qbi247QS8Nj+H8HZp8apEkD0WIoc6Fu7ex4VPmyzRURc+bFZMTzDpauavNaQk
         LtRfmFS813I/PHbhNHEbmuIacC2wa5lznHbUfMkwJEGWbY0cr9WQEz6wOa0cyBRJ1wMT
         CSPPHVlhHSIFwR3+3DxKbhTYOJDBJTHj/FFk+eVGzoiLBHdMD5wUT2eBiMDvet8pWPpw
         ThLwRTp84t/SxRnI0F2je7UI6VmVJ9n38JiS2ljUEjEzs/31njNhknbhR+0AS3poIBg9
         AXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CUyXXTyShFlx2/maCp5HGaaaIrvw4HRoNrxDU7Mf/kQ=;
        b=hKuaT+F183xDXu/imgU+NiCSQwN5wZKwBRahLIB6xfWhDAMv15lNh451hZr1Mmh2oh
         3EY8zcF1dpyjYBqnisGj3vRc4gFQk6yhw0kJ0Mh2FPVib3EirdW+bIDOKdARNZaiy9LG
         1ZEfXpSTKEgiBozSONa+VFAHUwl59L1srbK4Q2AVawLUD7vcLpE9lcXk1WGVN/kvpGT3
         f4BSzoQ+80Qd1HnFJi3JwwjCso3cY/cD4CRu90Bo86Mui3WhCPvkOIrs/Gw2a/VDOoxQ
         Ion6RecDTz0TMj2hbCRsCxHsn+2HnXs7WTJ3NxiXg+1RXEhGbFw/3qb4J14XWlFfItjj
         Wfxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WluseXrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si3514550qkc.351.2020.04.14.10.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 10:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WluseXrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOPMa-0007Yz-4z
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 13:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOP9Q-0001hS-Dx
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 13:15:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOP9M-0005x1-FR
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 13:15:08 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jON5O-0003dY-JW; Tue, 14 Apr 2020 11:02:50 -0400
Received: by mail-pf1-x443.google.com with SMTP id n10so39092pff.3;
 Tue, 14 Apr 2020 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUyXXTyShFlx2/maCp5HGaaaIrvw4HRoNrxDU7Mf/kQ=;
 b=WluseXrBHnVseij7jQRu9iNU5Wspkl85BKByw1Ua6dODwWIgNS01Q+3np+07qVQ957
 o7syHT4q3eI+sEPmYMQFUi5R6yr/xUQjQp5A+Ruxf55+3IFoyB9qC+AImyuKAtZdp8sZ
 9D/M1wQPCXLLizkp83+404zHMTn+cofqj+RZSRhA633VLVWcmPlSW4AmzoBT3xV/xxsH
 BJ+sdVrQLlLWnIC2yeN3d8e3HL59jyJVnKV0O1Wr1dSNkt62tIzK82oiTjrXSgGVqJEZ
 Tak0Ef6TSC9D0Qm7SKB7nr5qNpuFXge4rPd2fQJbuvn3gXwMgfq3NTzYAOfHKLRCxqA9
 C1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUyXXTyShFlx2/maCp5HGaaaIrvw4HRoNrxDU7Mf/kQ=;
 b=DH+s8sJSvYyriSol6ODS1HyzbK0YA03eGbh4JkN5xdzooMpl1WVGoYU8mXVtgh1Vl6
 jxFyddcqddCR75q95KczDL4w6gr1CjYirPaF8tbSXddF8XzJLNPNcQBRixb3p2C7VcTk
 xBMER21ZPQP4d92KEcNJXL2sUpp8TdzA2oELMaui8LhXc9LSMLyd3y8Cgar6Ko5CavXk
 qMfH9pBFd0YBr7e1J6fGoY+XNJrr3amHmB9XE5huEn7KGSIEmPMoLv/Jqk/u1Rdn2PGg
 6boD1Byw6wteRFm9se3x2gRfX91bGc/BjHZm1UghfYV75rDL+M2nM3ZCaL9EH5qc5z60
 9Dmg==
X-Gm-Message-State: AGi0PuaJIqwVwa1tVtWqGSWL967EmartqoOwbsFqLY/Xvs7bMmrhy84M
 8mlk/b9ofOrHCNVHhMdLKSM=
X-Received: by 2002:a63:4004:: with SMTP id n4mr11361362pga.234.1586876569594; 
 Tue, 14 Apr 2020 08:02:49 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id f9sm12175240pjt.45.2020.04.14.08.02.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 08:02:49 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v5 2/3] msf2: Add EMAC block to SmartFusion2 SoC
Date: Tue, 14 Apr 2020 20:32:30 +0530
Message-Id: <1586876551-3695-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586876551-3695-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586876551-3695-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: 9ZGtactIjcje

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

With SmartFusion2 Ethernet MAC model in
place this patch adds the same to SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/msf2-soc.c         | 26 ++++++++++++++++++++++++--
 include/hw/arm/msf2-soc.h |  2 ++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 588d643..a455b88 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -1,7 +1,7 @@
 /*
  * SmartFusion2 SoC emulation.
  *
- * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ * Copyright (c) 2017-2020 Subbaraya Sundeep <sundeep.lkml@gmail.com>
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -35,11 +35,14 @@
 
 #define MSF2_TIMER_BASE       0x40004000
 #define MSF2_SYSREG_BASE      0x40038000
+#define MSF2_EMAC_BASE        0x40041000
 
 #define ENVM_BASE_ADDRESS     0x60000000
 
 #define SRAM_BASE_ADDRESS     0x20000000
 
+#define MSF2_EMAC_IRQ         12
+
 #define MSF2_ENVM_MAX_SIZE    (512 * KiB)
 
 /*
@@ -81,6 +84,13 @@ static void m2sxxx_soc_initfn(Object *obj)
         sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
                           TYPE_MSS_SPI);
     }
+
+    sysbus_init_child_obj(obj, "emac", &s->emac, sizeof(s->emac),
+                          TYPE_MSS_EMAC);
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -192,6 +202,19 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
+    dev = DEVICE(&s->emac);
+    object_property_set_link(OBJECT(&s->emac), OBJECT(get_system_memory()),
+                             "ahb-bus", &error_abort);
+    object_property_set_bool(OBJECT(&s->emac), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_EMAC_BASE);
+    sysbus_connect_irq(busdev, 0,
+                       qdev_get_gpio_in(armv7m, MSF2_EMAC_IRQ));
+
     /* Below devices are not modelled yet. */
     create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
     create_unimplemented_device("dma", 0x40003000, 0x1000);
@@ -202,7 +225,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("can", 0x40015000, 0x1000);
     create_unimplemented_device("rtc", 0x40017000, 0x1000);
     create_unimplemented_device("apb_config", 0x40020000, 0x10000);
-    create_unimplemented_device("emac", 0x40041000, 0x1000);
     create_unimplemented_device("usb", 0x40043000, 0x1000);
 }
 
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 3cfe5c7..c9cb214 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -29,6 +29,7 @@
 #include "hw/timer/mss-timer.h"
 #include "hw/misc/msf2-sysreg.h"
 #include "hw/ssi/mss-spi.h"
+#include "hw/net/msf2-emac.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
 #define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
@@ -62,6 +63,7 @@ typedef struct MSF2State {
     MSF2SysregState sysreg;
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
 } MSF2State;
 
 #endif
-- 
2.7.4

