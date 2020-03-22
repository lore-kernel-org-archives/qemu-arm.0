Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp685288lfi;
        Sun, 22 Mar 2020 14:24:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuZaSZmUPNpD1LomJYc4PfFOQl/85a5mk/wW/ugaA9r5945O0+ko/nDez6MGzKQBQqYsHFf
X-Received: by 2002:ac8:3543:: with SMTP id z3mr17637494qtb.214.1584912293344;
        Sun, 22 Mar 2020 14:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584912293; cv=none;
        d=google.com; s=arc-20160816;
        b=y/DHrxFJter+b2FuSd3h0ivTOYSJ/YmsBHk89oWGizSCHGCqZQ11Bn4yt0KRambDxR
         5SUu3pGVWmDUAYlMOuPVpN3+mkO1JhNPjK0K9zh2Ju185noCTtutQ4ZxR7LeBfeiJwiU
         pC2V9V3q7TQiJbYwVyF2fWWeniiBeHcVxN15K19K3yt3TNm+ss5DrSCD18UUJppWGwIw
         EZ/avvEq5Spc20Y8pznd8JE3J1a/P/hvzOi4k234SYcWwe7Hf7CPanQ5oZ93zNdNobWA
         cjPLvsASt1ZWRzTWObilofW+aVzdutE/EFv9po6F6MVd9WjMPAal7dnj26StqtQ4omKh
         SpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=DftWBiWkjHoKVvHzazigRJcybZQA/gcmEJAYkticqjM=;
        b=L8/jxyU3cMHxlMcGI0/PNfH8A6N4nqAu2dHhlwPYxvSIe01ET7LSQj3Ow1J3UsXluK
         7saG81HImtIR0l3YI04XWC8EXiGiulDWbpmUPqKTXtpHOfq8mc4CpX7Dt0rkYBQBNdMa
         BkACfH3mXHwL8i7W/jQCB8CBFqtjQlAkbVjBEaRYtBt9Ff6ki44/qoKp3iLonDT2MSzi
         2+7hDaIc2PYjDzET9d2H0jfCKtAl+T/1QsRu7SNP23zreBuGvDE6NqeWFApVTZr/MH8a
         e8f0aWE5iXxt5tpIaI0JnI6qqcNzrnmXEoWDEyfFMHjdkFvGH/sqGebVJp0x3NxlZrPd
         1v6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WaIOtcCb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16si7958101qte.3.2020.03.22.14.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 14:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WaIOtcCb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG85U-0000qw-NB
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 17:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jG80Q-0002uW-DC
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jG80O-0002lV-EW
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:19:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45420)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jG80M-0002kX-Jb; Sun, 22 Mar 2020 17:19:34 -0400
Received: by mail-pf1-x443.google.com with SMTP id j10so6439773pfi.12;
 Sun, 22 Mar 2020 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DftWBiWkjHoKVvHzazigRJcybZQA/gcmEJAYkticqjM=;
 b=WaIOtcCb17Zog3YpnvEEY/8+Dn5U/BnaF56cBLZ+i2QYTG7xapW5WfZZhPDPGVG9wz
 oGEcO+7WMmYdCu+WC6IBPykiPTjuu5IqK/iZ4rIEBjHzY8PoyLhvPbngQreesWdGJtWT
 pAJfhNW3RVAkN3jgBa/7wWyi49YR+hjg7wMMW33YXy3NWSCZ7KogUOjzKS5cyKMdyebh
 yqN6FqdfCAcWxj1TAfetgDBvMcDfahAyS431/rkDIRqUjx6DQf5SMexTY6DZIaC94Vq0
 QDjHCwS9zLkZX6pAZsmpiv21l9F9RGqHvhPvxwn5+vElcJY5BezvMC83ep6p/tN8y25D
 uFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=DftWBiWkjHoKVvHzazigRJcybZQA/gcmEJAYkticqjM=;
 b=hsZCnovk6Itmb0uFTw02M8Gk/XK6thvYCQPD1HBTwRhqEzFYRHLlqXp51avyKX/9pl
 9DPoRDP9/YIVjOwrnD76oPA7vuy6MWFGGVAqeNrnbq78cvK2x4bsGNnLR76HUr8kBNph
 rJaHyPCUU7PY7NxSgRpwGY7YkfAXFVGhJqNj1CHK5M5rzEVl5eXi0JN+Bsq9k4lH0Rcd
 ePJHp5SRTp+dD8Ka2iXOz1lqhPWSIRwhjr+ssJXjD9oW1Zygzs2w4TD0lTTGn1R2C/gS
 l6MZpsRRoYssL5Yo3DjCPKWSWxGtziDxtbumR38QfDlL9jneMwdhgb5qFtfbgMJ00E2q
 YF2g==
X-Gm-Message-State: ANhLgQ2IBNtdByE6mbOM3TXaZhFadxbkPHxsbxXXaTE/fMhgA7atObez
 DE4Rk0VIdUtbgy8jf7Up3Rg=
X-Received: by 2002:aa7:9af8:: with SMTP id y24mr21912508pfp.91.1584911973602; 
 Sun, 22 Mar 2020 14:19:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k189sm10446306pgc.24.2020.03.22.14.19.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Mar 2020 14:19:33 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/8] hw/arm/fsl-imx6: Connect watchdog interrupts
Date: Sun, 22 Mar 2020 14:19:16 -0700
Message-Id: <20200322211919.11335-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322211919.11335-1-linux@roeck-us.net>
References: <20200322211919.11335-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6W5X0qJ0Cv5m

With this patch applied, the watchdog in the sabrelite emulation
is fully operational, including pretimeout support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 hw/arm/fsl-imx6.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 13f1bf23a6..f58c85aa8c 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -433,11 +433,20 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             FSL_IMX6_WDOG1_ADDR,
             FSL_IMX6_WDOG2_ADDR,
         };
+        static const int FSL_IMX6_WDOGn_IRQ[FSL_IMX6_NUM_WDTS] = {
+            FSL_IMX6_WDOG1_IRQ,
+            FSL_IMX6_WDOG2_IRQ,
+        };
 
+        object_property_set_bool(OBJECT(&s->wdt[i]), true, "pretimeout-support",
+                                 &error_abort);
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
                                  &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX6_WDOGn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
+                                            FSL_IMX6_WDOGn_IRQ[i]));
     }
 
     /* ROM memory */
-- 
2.17.1

