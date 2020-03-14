Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp898747lfc;
        Sat, 14 Mar 2020 10:29:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvKHNdqvR2+AMvvh9G215l5ADjB71P1gTu2Az5Yexg7uOk6FruubipX7L1it1hGzyMzau1h
X-Received: by 2002:ac8:7cb3:: with SMTP id z19mr8764611qtv.233.1584206986931;
        Sat, 14 Mar 2020 10:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584206986; cv=none;
        d=google.com; s=arc-20160816;
        b=MKsYxrr1UIoSl+4+ISEII0O3wavipGuvsZ/c26tq+2f0GPGveULJcWmhCf3uXVLidb
         B0KL2otbMtuTzbLIHPOuzG08oc3/+s1PlUFP3UQKIkl9o6PtrFw0qxzCx4hnennoC3nS
         K7EO/+je5HFEC/TgIRYRoBInDZZ2aCDmcqOCGdM3/R8M76ttRC9N+Z8IfMLcvx4oW6vg
         bYITs6QAMFC4spXQtqOHrNnPj6N8sNIfl5wxz643FiBH01dPPPlFk84F6HR47N/aQn/V
         yTPvbFF5Ax092gZoBajOqFfR+hqsx52PG5LVUsjVTG9prAH6ej+pZxZIsfE5Pskb8631
         GkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=7TmW4s4JB9EMXPFhnrWNp7SZXHVbJpUn5YaMe/I2UDc=;
        b=Q0QKHes2XZSQ6NLOVqQsENIMyeiUAekvYzU+PvjlcAb2H1CMCgO/GpCEQeNy+y1E1M
         xSX2+rnSAjiuLqTQzMuOPkPFoXbaDWNlVNC5V5KyfRbghqEjAzVGCVeYwuLrktqaP5LK
         nt/go6FTLX3LqBfGDX0ptHHTVPAkLFnCV/07hEJk6EFvCvfhG9OpwZWxzAPDYoY116GO
         OZVQImvcmGW8Y88rs+AV9M0OmMxx8tEi9lutsRgiJDylJ8F5XNQs+9fQni8T6ia4kaxL
         obxUMctTSgnIfOCrZ4b7K4oclZ9RY6OGX3MN458f1v8fzW1sZJXIa/rzYU0uOgNscqzv
         o9Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MbaBZBD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt14si1339866qvb.181.2020.03.14.10.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 10:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MbaBZBD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDAba-0003vY-Bc
	for alex.bennee@linaro.org; Sat, 14 Mar 2020 13:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jDAZi-00080r-Iu
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 13:27:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jDAZh-00061I-DK
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 13:27:50 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jDAZf-0005kg-4m; Sat, 14 Mar 2020 13:27:47 -0400
Received: by mail-pg1-x544.google.com with SMTP id b22so930154pgb.6;
 Sat, 14 Mar 2020 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7TmW4s4JB9EMXPFhnrWNp7SZXHVbJpUn5YaMe/I2UDc=;
 b=MbaBZBD0xxWU9k7ksA4PNKnBsSjdpcq/sqrQETnHUk/0UUCI6B3bXM6GqhZTBFRsDA
 hWJdiJMoDNkOjZrZs4YDkScSj1YRGA+L+aamRCpBYNjkBwO9rv/qYmPZobdRx31z485O
 yKrOAAoW3T6k7eDvMH7c0eW6d7uW/9C58qXxhVAW4EmZYGNhjQK3REs257kC3JndWMVm
 TcFThPqmUfqamcvQo+1OsgPKYL0Oazn/lcyC91FJpfZUhFsvSeSVTGaGiqHP17uPNxFJ
 1m+D4IxGx1CK65Fn7+rUxQZ0ggrRdcGDjGdFWUFSMIqTaQjG2EsUzPt1U9zd8jK5pOIP
 xEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=7TmW4s4JB9EMXPFhnrWNp7SZXHVbJpUn5YaMe/I2UDc=;
 b=kh2QcDaRSAcPGH1nBYLjkFcrTErTY/lpFFy6p3ejvs/15Vb2NkxQb9RdrdAm6AHd+l
 euFM+Wr/2vE5cFTqVlXQWV2jHIXvLQbCC6ZpG4Vllhf0goFa+6DhnD4/8/58n/LJI+Ib
 XehugNtijTGt4whjpElh771AmHSyrww0yv3IrCFR3nLxn9d6g4lkX9iGvgFVSvD3Zdys
 wfCFqSFfvc5ahGC49na+vCka5LC7T21edGmniqugxHn/FDy8RyL4trphlJQWvjHcdoW3
 QqrcsZ7cisqoBgCBtzivjMVIXdT2F4UrJAop9/hOZ5dvzeO8EQGNVimCpcL1xoQNUytm
 Ehzw==
X-Gm-Message-State: ANhLgQ2f7gvTLJoUYxBX9jkVk6Rv48ANbUcdB8cbF2LqKDLaXlaXxxqR
 NoS0K/rhI9/p6ac5p0SEMrs=
X-Received: by 2002:a63:309:: with SMTP id 9mr18829326pgd.193.1584206866335;
 Sat, 14 Mar 2020 10:27:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c201sm16745005pfc.73.2020.03.14.10.27.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 10:27:45 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 5/8] hw/arm/fsl-imx6: Connect watchdog interrupts
Date: Sat, 14 Mar 2020 10:27:33 -0700
Message-Id: <20200314172736.24528-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200314172736.24528-1-linux@roeck-us.net>
References: <20200314172736.24528-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 80gsQT0Xq0Fg

With this patch applied, the watchdog in the sabrelite emulation
is fully operational, including pretimeout support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx6.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index ecc62855f2..b266d40881 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -397,11 +397,20 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
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

