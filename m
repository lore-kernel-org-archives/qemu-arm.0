Received: by 2002:a0c:f8c8:0:0:0:0:0 with SMTP id h8csp1042333qvo;
        Fri, 13 Mar 2020 09:02:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsN4UckgCB3Lpx4evOy5UK81yDmVAC/gmO5WhjrbOScxTwmxUdLcE5U4zWWej0yyrROl1GF
X-Received: by 2002:a05:6214:a73:: with SMTP id ef19mr7418698qvb.98.1584115369500;
        Fri, 13 Mar 2020 09:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584115369; cv=none;
        d=google.com; s=arc-20160816;
        b=z4Cwf7TaSSVOeU3YuOUHXodvinAzFpkaMkQG722LW2U0KU9/6DOP2rsDlqOmbVdE2v
         p1XXwtP3Lz5aLeL/Tn0kqdTWkDCeq1FPgA3K0zi0rwnNEacrCXmblc6QhHy097kL4nGu
         K7vbE28jNsQiohnfue/ehKJ/Ywe2Iv/++GjqfQNUvcKE8dz71ANAAA+UjNTPzsoC1xaN
         U8Abvhba9hiErgjAu7Mboii2rIYeMfNqwmQbWYCpAeFPBffWInqO/qJejYAwbHr/c+fa
         wlrRZDEjKc7tEDCwYrtgnWEuQQilGllnCxe6R4cRBmgOjnPckC2XVn/Fx31klpdfB+4E
         BAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=Rs/WyUa4shVeykflJcx6r7b0O7PZIErgGyGsCIM5V1U=;
        b=CJ7hs9BDbtga9FPmlhtC0rjQokXiolMgmRDTiE6D0B5HAHpjicIIyZQznMZW0U+6Uv
         OKnviNwyAXhi+t7Ii1DuvjZcWiOHJvJljvoV4LZnCU2kW07DSpyesRSZPuL/EfHIAd2U
         XJjKBGXllz0+2Hue2RDBnJHYISOqB6i0+SI/qh1rwJrNs+yReHDwJVwjMgne5ArEE1jx
         NHRlWXhsvGr8sgkTLjUq/9V6B3aQHsLCnMXePcPc5ynqggF/erXCiNA6l05kPAZojJLY
         uaNQMNwkMSZze2JiLmISrcLnCv7VsHGobzxKxkrJbDm2iJZWdCOL4e2CB25phW7wrG/S
         7X2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iJ5TWoYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si5270874qkh.66.2020.03.13.09.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 09:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iJ5TWoYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCmlt-0001Mb-1Z
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 12:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCmlR-0000vR-7l
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 12:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCmlQ-0005zK-8I
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 12:02:21 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCmlP-0005wy-W9; Fri, 13 Mar 2020 12:02:20 -0400
Received: by mail-pl1-x642.google.com with SMTP id h11so4447645plk.7;
 Fri, 13 Mar 2020 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Rs/WyUa4shVeykflJcx6r7b0O7PZIErgGyGsCIM5V1U=;
 b=iJ5TWoYhH1awB5nB1GilLXL1qCed5ev+icGDCcAXU4pyeTD27gN2S/MCxwLCCtyYHo
 bpzcD8p60DAxyYHnN7iUKl/hIrcjmLuckTu0waNXueS6O7u1QccQpmRmgBPR3KCpRunT
 2KGyJ5pdCjTKVDThiOSJVcOvZ6FtB1ojZoVlie7KJN9a9PTfzE0/SmQyKXvdGhJB+SIC
 seom/jcSUQ3EB4Nco8MhDmwxqH3Qzd5h31XkQ6p86Y61KzJCc5g2olDUsFzejChwF1EL
 k4XnA0A33wf1SkZdXRTSGFGGhYZLBbfQ8PhWfLRrx9eIStFRGGT5u7WNMIyqdvmiK2hz
 Xqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Rs/WyUa4shVeykflJcx6r7b0O7PZIErgGyGsCIM5V1U=;
 b=XU9umjfKj9p0Y259XWmbPswjqo1F9BmDcA/V4GbeV7psKiJCRYRAU2WbaVxMnWR+sq
 rxcStSOTr1J/ubcFBoTdBsv90yDFIvL7L/Tdt1BedpxOQYvXCgwdXaUe/pw3oRNWTS+Z
 bQdcIHqWZizV41vV7SbgovVmIFnf6RuptPeA81l6nzKHsUQD+ZIUOYdxVYZWuiAzDLF1
 5+qKeNAX8aX25Gdjl2BUDlPBvq31nLtEXjohWpzoO7RErRYtQji9IknF8xOiAKLuMaEK
 Xzu0w5+QRCMTcSpo9Mr6X3oH44qXKxWtb+0Y54AD11/7UBdyiOyFsyZLeEtLWGzHtck9
 T9TQ==
X-Gm-Message-State: ANhLgQ1Wl/AXjp3tQi8bq9RKSpI/2/sVY1MOquqiN9PHfvfu238fxDCr
 q4ZI9O1hy149EDB62VQ/81I=
X-Received: by 2002:a17:90a:fa95:: with SMTP id
 cu21mr6616849pjb.82.1584115338667; 
 Fri, 13 Mar 2020 09:02:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a24sm9139466pfl.115.2020.03.13.09.02.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Mar 2020 09:02:17 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/pxa2xx: Do not wire up OHCI for PXA255
Date: Fri, 13 Mar 2020 09:02:15 -0700
Message-Id: <20200313160215.28155-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K0Y0jbqdF75P

PXA255 does not support a USB OHCI controller, so don't wire it up.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/pxa2xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 56a36202d7..336c9bad4a 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2290,9 +2290,6 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
         s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
     }
 
-    sysbus_create_simple("sysbus-ohci", 0x4c000000,
-                         qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
-
     s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
     s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
 
-- 
2.17.1

