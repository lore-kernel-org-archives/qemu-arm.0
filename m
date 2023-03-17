Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp290176ejb;
        Thu, 16 Mar 2023 17:14:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set9k29TUhGwW4fwbeu3XVKXQlGaU/sj3FtXzIOXrlcvDOrBGDu7stv68ctmeJ2mlUpLedfZe
X-Received: by 2002:ac8:5f07:0:b0:3bf:c575:3f42 with SMTP id x7-20020ac85f07000000b003bfc5753f42mr11170918qta.33.1679012074584;
        Thu, 16 Mar 2023 17:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679012074; cv=none;
        d=google.com; s=arc-20160816;
        b=dR3yzGS6l31JQU9GZqHpZn1sX0vpQuBWuo3ojXwo32CqUSiHmUvb/OUbwR0GEQcoe2
         e81pNSNgDKrRKWpiWX66eWbA4Mh53L4+kmoribddt5x3BDMzV7EXuxrK2fWP1ZJRW5OU
         vVg04/d4OlruG3hWF3j7vBsLXvrvFnFb9ER15Uac7WQXnXivSNSdx+FDAlRSqzrj/r2S
         R1UML6FXnHW2Aa+/95o+KEJu7u6Xh/s/uunf4XSUQZT2IdlOeX+Uhu5t3IRoAwAAOioY
         J483puVMUvy5WpcBICHgsZrluClpCeqhwGsFBFp/PIrKCR6jwLoC0A5qGnzU4wyrxsRD
         GYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gibIWHp2DjKhjqmF4CDIwlJs//RfjUNBpQ15/PPbVXI=;
        b=XQeFripC8I1y9H0LRzXjwcVQyyIXC14Olf9smRQHuMAVJSNFq5HBNeI2ttO8D3GKmz
         7okRqY7DjxM52/O9rSwuTsty8Rm441LQkQOiR+JVWM8X+eYk6yeTftk9tBnx1YrSBg6Z
         Bv9UiXqx8jqIbZ/thDBdb20s5ktCYFKIESYtOThomVStCqbzdw5vTjUksmdUZF+bESry
         A9ZzkdsUYmspU+v6Vblaocbdg2WcfvCo5X7b5Npe8EW7JfiIOoQIWYNkH2Rdwhq97hvA
         8qoG2O3j4Imf/bMIjig3Vi4CSULPZTNFup1WJtyC/lJUcQXCd0A7eSXH6h3LXF36um+p
         jIzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNYFb6NJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a284900b00742c45460dcsi644414qkp.460.2023.03.16.17.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 17:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNYFb6NJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcxir-0005Yc-3j; Thu, 16 Mar 2023 20:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxip-0005XD-80; Thu, 16 Mar 2023 20:13:27 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxin-0004PX-Bx; Thu, 16 Mar 2023 20:13:26 -0400
Received: by mail-lf1-x12a.google.com with SMTP id o8so4567854lfo.0;
 Thu, 16 Mar 2023 17:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679012003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gibIWHp2DjKhjqmF4CDIwlJs//RfjUNBpQ15/PPbVXI=;
 b=WNYFb6NJ27vYiKs4ZbCIVgbQRT9TR0/xH7sli9sDXrodzcj/qWqsDLWcJXgWP9UUfv
 vlzRT/pvhmnFYjopcAz7u6URuMKjqthOoCx+NTnh5zPf+A7ixJl+gISr5B2hzULoPBnj
 sGA3Nma/C+ZSh3iNF+n7At89653ueYsnANOXJhwum/Uon4nUEmMByFnxv6gsP6AvZMp2
 GdkyS1SaI+aS1FeG/zOr3vrdvNvX+RuPYbmUdKGHE+uYIuZTXca7RAHz/cLIDQM/XWwL
 j5KQuwcMKXhz5YB0dpMEcXw690ntcZBq8A0xVTnD/2q6djVrs9Ss6REdmNCjObZv7wOu
 NOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679012003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gibIWHp2DjKhjqmF4CDIwlJs//RfjUNBpQ15/PPbVXI=;
 b=IjP8Bbm8+EkRDykI3jODyTgFZY8eOEc3qJ1Gv0c0tnE+spZ+BMHELK99ldWgM/lAjs
 HfGdZlSxOCtztPXFHlc2hD0cHGnoPLPQ7qzYwL/N/LBmgYhEdsGAcYUKRyTMHQrVE82W
 L/tQDjBWTB+yUHY0XQ0ay0/9dQuVofFg5b/VTR+ay99PvInh/kubRvuhOugyxn2Vn7Dd
 oaRfdEvMdtrbbUpUTMQj64IyOoXpHb0F9+/xbYdWSCOIM51qWuUY5sxeyDt2WZvCMXQa
 55Y03PSqsqtv75i5wTQ/VqqdMekQGWv2Kn9iuD/IF4pouorSHoSfPxg+03W8Xj2nwGE2
 JG2w==
X-Gm-Message-State: AO0yUKULDUvqHV05OW4982R7AHStAldnpe/ntbLkGvRYH3cFj9cE73P6
 cWU/0bJ4ChKGi8BdoJVqBP8kJMRnQmvwFvlwU8w=
X-Received: by 2002:ac2:44cb:0:b0:4e8:5f9d:13d5 with SMTP id
 d11-20020ac244cb000000b004e85f9d13d5mr2565868lfm.43.1679012002676; 
 Thu, 16 Mar 2023 17:13:22 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 y17-20020ac24211000000b004ddaea30ba6sm97776lfh.235.2023.03.16.17.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 17:13:22 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 2/4] hw/arm: Add WDT to Allwinner-A10 and Cubieboard
Date: Fri, 17 Mar 2023 01:12:03 +0100
Message-Id: <20230317001203.18425-3-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
References: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: q4ZerfU0RPiv

This patch adds WDT to Allwinner-A10 and Cubieboard.
WDT is added as an overlay to the Timer module memory map.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 docs/system/arm/cubieboard.rst | 1 +
 hw/arm/Kconfig                 | 1 +
 hw/arm/allwinner-a10.c         | 7 +++++++
 include/hw/arm/allwinner-a10.h | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
index 8d485f5435..58c4a2d3ea 100644
--- a/docs/system/arm/cubieboard.rst
+++ b/docs/system/arm/cubieboard.rst
@@ -15,3 +15,4 @@ Emulated devices:
 - USB controller
 - SATA controller
 - TWI (I2C) controller
+- Watchdog timer
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..ec15248536 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -325,6 +325,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_PIC
     select ALLWINNER_A10_CCM
     select ALLWINNER_A10_DRAMC
+    select ALLWINNER_WDT
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
     select AXP209_PMU
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index b7ca795c71..b0ea3f7f66 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -38,6 +38,7 @@
 #define AW_A10_EHCI_BASE        0x01c14000
 #define AW_A10_OHCI_BASE        0x01c14400
 #define AW_A10_SATA_BASE        0x01c18000
+#define AW_A10_WDT_BASE         0x01c20c90
 #define AW_A10_RTC_BASE         0x01c20d00
 #define AW_A10_I2C0_BASE        0x01c2ac00
 
@@ -92,6 +93,8 @@ static void aw_a10_init(Object *obj)
     object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN4I);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN4I);
+
+    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN4I);
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
@@ -203,6 +206,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, AW_A10_I2C0_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0, qdev_get_gpio_in(dev, 7));
+
+    /* WDT */
+    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0, AW_A10_WDT_BASE, 1);
 }
 
 static void aw_a10_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 095afb225d..cd1465c613 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,6 +13,7 @@
 #include "hw/misc/allwinner-a10-ccm.h"
 #include "hw/misc/allwinner-a10-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "hw/watchdog/allwinner-wdt.h"
 #include "sysemu/block-backend.h"
 
 #include "target/arm/cpu.h"
@@ -41,6 +42,7 @@ struct AwA10State {
     AwSdHostState mmc0;
     AWI2CState i2c0;
     AwRtcState rtc;
+    AwWdtState wdt;
     MemoryRegion sram_a;
     EHCISysBusState ehci[AW_A10_NUM_USB];
     OHCISysBusState ohci[AW_A10_NUM_USB];
-- 
2.30.2

