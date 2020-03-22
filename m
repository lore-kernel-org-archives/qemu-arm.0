Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp683170lfi;
        Sun, 22 Mar 2020 14:21:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtguNJxyxRjT5agxCh+r/Sh6swjnZ3//+qe/tpUyPByGq/pfEQAbqrTTDNTyxXAmtcopSqD
X-Received: by 2002:a37:9404:: with SMTP id w4mr2456622qkd.190.1584912089650;
        Sun, 22 Mar 2020 14:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584912089; cv=none;
        d=google.com; s=arc-20160816;
        b=G4pmsgjIPO5kISjhaD81WuRKRGtB4B6Retn9RQU3Rr+WvGqMliz9GIR6odAVCZjA4W
         4S+aVuRwh6V9TSuH/8ShTURa/MziAUSeu/ORuOJftxclzN33MKo0YGhUt4eZ9UkZib6S
         VTjfhd2xkCFBjAFMpp/YpRPIGPDI4+VZVIF60Ip63QWEAR9owpqoMTupNAirA6TBurAx
         VPTJr+1w0H9rTcOTLiPcu17CB0nzDnSa44He1CQpWX6fe5gDGFuFGEJusyvMbNsBkzA5
         4iuVsNQ4Ay3Gom5EgNqD8yGIxNpK3/Q9K6q98frQy9i0OReLnJSop8JDT/HRP9vLAZlf
         AlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=PfacgAp0cXzOj1kL/UZ/1/dmJdoHTLFW9eigbgqFIs8=;
        b=Hrlxt+PUFZu1EkkolboXaYFq7DMDs0cbblQsgrq+CpDv6+QNnfdrgU4i7vH01YZIxO
         yo5gOUlTA42b4XQE94y9PTaLQf7WA65kCwwvHhIC3kV1xiWQuW3nQehoAhamfthSiSDA
         7q2oHRLnNdJn8qxDH+O95Yu9KSrs8l7MxczF3t5GHe4kjLOJGVKDs6IepwjEahNHVYrt
         82ZWCzdysb7cc6mZ4eMUUzbVfGDDYsUeCdiX7OCNVzV4mdwgeKTLZIX8uIpy+qM/Z7PW
         9b60PbJeUEdvZTj3v9FhIDYnf4GmtLtMtNng2gf8dyDSE8ljHMcH49GSXWTJMOMknC2A
         6+Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XWoPxDSy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k48si7528695qtc.162.2020.03.22.14.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 14:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XWoPxDSy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG82D-0004i5-0z
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 17:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jG80S-0002v0-6D
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jG80Q-0002mT-9j
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:19:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38493)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jG80O-0002lG-Fm; Sun, 22 Mar 2020 17:19:37 -0400
Received: by mail-pl1-x641.google.com with SMTP id w3so5001296plz.5;
 Sun, 22 Mar 2020 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PfacgAp0cXzOj1kL/UZ/1/dmJdoHTLFW9eigbgqFIs8=;
 b=XWoPxDSyUzpDM4V2euFaFTZNpqmdfaqF3Hkq4CalfIc5T2KgPLknkCaN6V4aEfb7Az
 0BkcMSCvMClaCBqqiIq/mKQxxLxXumarzzvNPwZZHeN/Mmz0C+Wekj22FWRy4RID4uHr
 VbhJDlOPTzZPv4RUlVeO+bhpQOglW07YLtJyPpLqkUytErYYAtgf43UMBAW6/s7k1vYX
 linmEsr5sGHd737Z/pZrnX97b473z1H0unGoNdroYgUqaZlNL99EAtKkX8zgog9je7/0
 jvO9Nm1MTOqAIwLE05lCURODEszlv44vwPGHQFTTUekjvBU0WVdG/g4JTRaB3i/fLYSz
 rOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=PfacgAp0cXzOj1kL/UZ/1/dmJdoHTLFW9eigbgqFIs8=;
 b=ORvu4VfRXj885pTiI5UgPZPZekJqEPPtbkLQxUep4qovnvqxEmUI1OY9VUFIjlOA/M
 l5oJv7egsAETpYTMENpw3Xkl/MdJboGXJXhepILRDo77LAX6hIUWIC9tG3s9NsnKjLQB
 GvqfFC6hNfngp/BlnZvL58WguhCRvcyfTLmka5riTt3d+PLJZTTwH3wXGDT8ytTtEQTg
 xyFqaAxI/rP2kwRbkOjaCiN4cSg+w4GwWgnKCTNXpDFi32ueFpCRcly0v1hH8iifuzLJ
 2k1VYupqAK6uD6UR2Cmocopk6ibJXBi7zcnXDv3J+NG6VclMvPW4aRurIl+pDfn4x9z7
 /Onw==
X-Gm-Message-State: ANhLgQ3hnhwVO22zhKzLYudiAQ7qmvP82ZCupgZE6Aleh/QvSUY3FD3M
 Laxom68FJvaTVfDksTQw+Mk=
X-Received: by 2002:a17:90b:909:: with SMTP id
 bo9mr10327895pjb.125.1584911975115; 
 Sun, 22 Mar 2020 14:19:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p7sm10670091pjp.1.2020.03.22.14.19.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Mar 2020 14:19:34 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/8] hw/arm/fsl-imx6ul: Connect watchdog interrupts
Date: Sun, 22 Mar 2020 14:19:17 -0700
Message-Id: <20200322211919.11335-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322211919.11335-1-linux@roeck-us.net>
References: <20200322211919.11335-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: eg7gr/WotjaZ

With this commit, the watchdog on mcimx6ul-evk is fully operational,
including pretimeout support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 hw/arm/fsl-imx6ul.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 56dfd7cecc..3ecb212da6 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -531,12 +531,22 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
             FSL_IMX6UL_WDOG2_ADDR,
             FSL_IMX6UL_WDOG3_ADDR,
         };
+        static const int FSL_IMX6UL_WDOGn_IRQ[FSL_IMX6UL_NUM_WDTS] = {
+            FSL_IMX6UL_WDOG1_IRQ,
+            FSL_IMX6UL_WDOG2_IRQ,
+            FSL_IMX6UL_WDOG3_IRQ,
+        };
 
+        object_property_set_bool(OBJECT(&s->wdt[i]), true, "pretimeout-support",
+                                 &error_abort);
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
                                  &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         FSL_IMX6UL_WDOGn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX6UL_WDOGn_IRQ[i]));
     }
 
     /*
-- 
2.17.1

