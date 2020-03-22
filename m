Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp683875lfi;
        Sun, 22 Mar 2020 14:22:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsru4j6KMROTOKKt/qiTzRLGQsPttiiv3ael0RHvMTns1nIgAFW/ccVW7t+2ecHQWyfTiQ1
X-Received: by 2002:a37:a854:: with SMTP id r81mr17673009qke.384.1584912162166;
        Sun, 22 Mar 2020 14:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584912162; cv=none;
        d=google.com; s=arc-20160816;
        b=QoG2OI5EeIYELiKdWxW/ZQNPQbF0xDVupI+GCFhviMrXZEqmGvkpZdkxOoTbq3QJdF
         nyABoqsVr5kYUfQ5z5yaNXqN8fjqttR30r3czRAcIiXmqe2XtcDC91m4+0yfmtBCQOwb
         10XCKDEaA92QlAT+ojTncghMLXJ5u2C372AuSWjFDEUiGpnF1m/Cps2akKFaH6zEDBL1
         s1z0BYDsL4p2dtDH7rmuG1l+Gan96n04JZ5fFMjskqhSDxPSCiL0OZoGU8GWtuP6A0G4
         GDs1OOUXpe87BMOBAliF5unZyRQSu2JnZoCy2E8PPahvq/uz1qxpIeqGqvBJ6fi4rJ24
         Xl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=RjKWvLSfme9/CvcRWOHB/MHVHAgog5y4v9UlHjSka88=;
        b=DEnLLDIR/1rZb1CgI7h0foPejShgObKySAXdsrGJhFsH7iVeqxrC7WHIhpAFJCIwXb
         fEdNdehXx80DA+o912so6L39EO17Wzw+OZU3B4lC5ACNEbd+4Ls6Nqwlx0H+hkDfkREz
         eq9M+Soun/+xmUIpb4hcEABIkCOzPmISQ/nIBUXrp4m86srvf7iMzLHrUQEBBdU/Iwth
         mHTzzjYjCwIvZuUThrXRbgpoM7Z+o5u1gdgFOXVXoGoxeQ79nXf03ZPpT4G4lT2C6XwS
         B0aTI1d+5nuehamzTzDjD7WdNuQcKZ370ezsHf/HkDNeB2b6ECAl2UOwS9n1rm4Duh+I
         xPDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KOLjVnHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28si7317271qto.295.2020.03.22.14.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 14:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KOLjVnHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG83N-0006oN-JJ
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 17:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jG80e-0002yW-9z
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 17:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jG80c-0002rS-FP
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 17:19:52 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jG80S-0002mK-0A; Sun, 22 Mar 2020 17:19:40 -0400
Received: by mail-pl1-x641.google.com with SMTP id g2so5002316plo.3;
 Sun, 22 Mar 2020 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RjKWvLSfme9/CvcRWOHB/MHVHAgog5y4v9UlHjSka88=;
 b=KOLjVnHk1+FvrdaM95vLN6WPWJER60T+K8FtowdkzJOd+E4DsXLjdImJT9X+0kGxwO
 hLGLi7crGemAyCoyWu+nniHlDEQbhuDo4NZtUAvoMxiKZMdn7jVJVyjy1ikM7d41kab2
 YIf2BuQ0E99PCZ4HkfTFUuJM01nIPJ1LDGGWE4dzlFyrmZXe49t51M96CKgJp00upaS/
 e5IBwjWVs9ncGmtk6o9TauQq+pdkfcn0W3ZVhNklShFgz3yZaktgMyAAwTo7Roj04NZf
 /3s2rKeXFTiN1mbZFbPTxdt0dVzmEyET27teyS5YZ9pLufsaT2Mm6Q2XWDT2EqVthVUp
 +t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=RjKWvLSfme9/CvcRWOHB/MHVHAgog5y4v9UlHjSka88=;
 b=XpZrtwVxa0u8Jqnf6+seq5VUGHNZ8M2b7BeW9B5jriraX0627/l7GKoiwE+KEUxLfS
 QPbjtICyTzKK7nLUCgt78gOjgJd2b+U2+mBdR0WJD275t6jVnZJSt3iq6eF6QA5ZaP9l
 FIKJIpbXtt5x6V8on1EUL9K375twInMkznKFrKWUAed7uf3DSKRIHnbMQBdWvVaWGGZE
 ALU7FiowuTUmXA6pZPhAXH6TaI5tZX5oTzFTFXtFZmOnCl4qpbeoFFKl4bP3+tpbU44V
 m+wZTl5qZFTPPxOgH2oVQZr8EUbd7BjedAQc90JUbp9plDqCSa4rkozVaSCBJDZSDxg/
 35yQ==
X-Gm-Message-State: ANhLgQ2BKaoNsxdgOOTQyspbLS0tSuE3BawftJek/Ye4+yPFqSb7A9Bg
 7fHjgk1zK8aqq7VXZXy5GkQ=
X-Received: by 2002:a17:902:9f95:: with SMTP id
 g21mr18297457plq.66.1584911977824; 
 Sun, 22 Mar 2020 14:19:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id i6sm11604887pfe.62.2020.03.22.14.19.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Mar 2020 14:19:37 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 8/8] hw/arm/fsl-imx7: Connect watchdog interrupts
Date: Sun, 22 Mar 2020 14:19:19 -0700
Message-Id: <20200322211919.11335-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322211919.11335-1-linux@roeck-us.net>
References: <20200322211919.11335-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: GDPFN9vvedZh

i.MX7 supports watchdog pretimeout interupts. With this commit,
the watchdog in mcimx7d-sabre is fully operational, including
pretimeout support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 hw/arm/fsl-imx7.c         | 11 +++++++++++
 include/hw/arm/fsl-imx7.h |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index d6cf7c48ce..89c3b64c06 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -447,11 +447,22 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_WDOG3_ADDR,
             FSL_IMX7_WDOG4_ADDR,
         };
+        static const int FSL_IMX7_WDOGn_IRQ[FSL_IMX7_NUM_WDTS] = {
+            FSL_IMX7_WDOG1_IRQ,
+            FSL_IMX7_WDOG2_IRQ,
+            FSL_IMX7_WDOG3_IRQ,
+            FSL_IMX7_WDOG4_IRQ,
+        };
 
+        object_property_set_bool(OBJECT(&s->wdt[i]), true, "pretimeout-support",
+                                 &error_abort);
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
                                  &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX7_WDOGn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_WDOGn_IRQ[i]));
     }
 
     /*
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 47826da2b7..da977f9ffb 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -228,6 +228,11 @@ enum FslIMX7IRQs {
     FSL_IMX7_USB2_IRQ     = 42,
     FSL_IMX7_USB3_IRQ     = 40,
 
+    FSL_IMX7_WDOG1_IRQ    = 78,
+    FSL_IMX7_WDOG2_IRQ    = 79,
+    FSL_IMX7_WDOG3_IRQ    = 10,
+    FSL_IMX7_WDOG4_IRQ    = 109,
+
     FSL_IMX7_PCI_INTA_IRQ = 125,
     FSL_IMX7_PCI_INTB_IRQ = 124,
     FSL_IMX7_PCI_INTC_IRQ = 123,
-- 
2.17.1

