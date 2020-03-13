Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1467102lfc;
        Thu, 12 Mar 2020 18:46:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv6Pp2e5KHLx08ROZ9T8KbJ80pdWwlJdTgpCG5mIlwrSs0H7qt6BojD7i7rFvOAwiYh+jCQ
X-Received: by 2002:a05:620a:2142:: with SMTP id m2mr10409446qkm.365.1584063991235;
        Thu, 12 Mar 2020 18:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584063991; cv=none;
        d=google.com; s=arc-20160816;
        b=w315KlAEp3x5PCbxgVRWmGixbnRkd5u5zr0mThENssUoj41TpGjyEXTdz2mmaX2HoS
         EV/+uwdL74ToODwHKQZps8QPf6P1PKuu+nxGuZIknzG4Qk8swDRelWbCVl+7qfm9ugT8
         iGiyFcEcvPzXyAZ7eFvN9sg5eQFvuv8Z8O6ppqkoaYXChtfvegdo8N2QQJHyHWF6tNbr
         6liWfHz6Ejkp8P/SmLJ2zfOdaaWLt4gvkzLkN/zf3X6chmn0qEAS5J3mlDwOy0VkfFIo
         1oyFRiHCCSNjJtd+aV9dApoR7OPQsV3yGTboWs8+8H0D8+ED092V0Yl/cT35dBYvV1u+
         yTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=AXgArI/1ZeT2wXd+HyZZgBXKR113LCxmNrOyBRd1fu0=;
        b=wICJoQ0aTP49lNEd2fJ8+wS8fs+tkIWlCNUkecitm+IAYJCmLxhLft173HavV2AfPL
         Mpdd/rPqAcAQo0EI99OXYaJAey/lkj/PEmiYfTWg+L6kUZN13oc9z1ec23Y4SYMZzbu0
         pdzEp+tKODPemHLIfD4UIiIAZeylTp7Nm5sQsnbCAt/zYe80DUM18ivPxzX3okMZhSzl
         jMCV2kR8cNfamHQxtUBuJuBlJSacBD8Dcc+CehdCdiIVI2HnuVlIn1+vaG3+Wf8bVXc9
         s1sGzoER1JHlrL0uvH569sW3Ln4ulNpq8ocGyB+z6HBN/8xtZWK0Q639/4xEZkdH9ECW
         FD0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qsi8TcVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z67si4028679qkb.64.2020.03.12.18.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 18:46:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qsi8TcVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCZPC-0001Nc-G5
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 21:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCZOi-0001Hd-An
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCZOh-00063O-Bk
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:46:00 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39603)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCZOh-000621-6R; Thu, 12 Mar 2020 21:45:59 -0400
Received: by mail-pf1-x444.google.com with SMTP id w65so4211023pfb.6;
 Thu, 12 Mar 2020 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AXgArI/1ZeT2wXd+HyZZgBXKR113LCxmNrOyBRd1fu0=;
 b=Qsi8TcVKvaZrZ0lK34NmKTkKmH4xmOhRifCuV6Ytg5fiqAWa1QXprJswy+VmNW12iM
 FXt/F85Q8wxBmJkrwJo8qYyUhpPuZ5V9gIzqxR53mwLJ8sj2toA/hEjG4hP+gGsrNWWO
 6MaJJc41woY3ttFAg+H1C/fM5dWhptDyUicf9XImD2/CfCMlZROtdktojICcc1M/NJb+
 Fcb4H7KOXKRl3HnWBnzI6al9LoRv4h2m4Z+9LE1WvGxMvOr2iUre1Z3g9JBTGa+ZE/lM
 ufzSffGTA4zh4razNzBm37bZImNjJedmUc5idvpV5d7hUQL/jhUhQSwZcFkBJkDkak1D
 OFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=AXgArI/1ZeT2wXd+HyZZgBXKR113LCxmNrOyBRd1fu0=;
 b=jq4pXhm0P2UxpADvrKuvgO9Z0pc2Dq7qXL/TlwJKLEMQQrj51R0ZpbH2hR2UK7wVyh
 uCnzwVB0vLG7howoAKEshCkuNFJk15ugjQmCE0slWYxrC6Ia2IpyegDqUnxIJjoR5/9M
 2aE5O24e9CCOwIjWXBpz9MEjWQhdJg6BM7QHRP+J1Xen6hqSCHA5qMg6LGT7CnOZx8b0
 p5mXHw9LeOQSNEsDgMk/GOmLC4YCG4Wtw8c/1H9hHlyX+6b5JxAHnFFAL9JDLq7k5LB0
 hiSk+3gUWwDiQ7gNhpq5yGDM2glhzqjkyrY4adPviWdQ2DV7fZNe0u/8OjpvSrPIt3qq
 4Hmg==
X-Gm-Message-State: ANhLgQ2EZQerrnXiRS/44FhM3olkiOuRF7qGKdEu1505gCyDIL9XUz0Y
 sBLhxVArcX77O4kidvATnIY=
X-Received: by 2002:a62:7cc9:: with SMTP id
 x192mr10950335pfc.176.1584063958285; 
 Thu, 12 Mar 2020 18:45:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g14sm17234282pfb.131.2020.03.12.18.45.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 18:45:57 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/5] hw/arm/fsl-imx6ul: Fix USB interrupt numbers
Date: Thu, 12 Mar 2020 18:45:48 -0700
Message-Id: <20200313014551.12554-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313014551.12554-1-linux@roeck-us.net>
References: <20200313014551.12554-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 32GBsDEl+qzz

USB1 and USB2 interrupt numbers were swapped. USB_PHY2 interrupt number
is 45. That didn't really matter up to now since the interrupts were not
used, but it needs to be fixed to be able to wire up the USB controllers.

Fixes: 31cbf933f0e ("i.MX6UL: Add i.MX6UL SOC")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: New patch

 include/hw/arm/fsl-imx6ul.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index eda389aec7..5a420785b9 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -241,10 +241,10 @@ enum FslIMX6ULIRQs {
     FSL_IMX6UL_UART7_IRQ    = 39,
     FSL_IMX6UL_UART8_IRQ    = 40,
 
-    FSL_IMX6UL_USB1_IRQ     = 42,
-    FSL_IMX6UL_USB2_IRQ     = 43,
+    FSL_IMX6UL_USB1_IRQ     = 43,
+    FSL_IMX6UL_USB2_IRQ     = 42,
     FSL_IMX6UL_USB_PHY1_IRQ = 44,
-    FSL_IMX6UL_USB_PHY2_IRQ = 44,
+    FSL_IMX6UL_USB_PHY2_IRQ = 45,
 
     FSL_IMX6UL_CAAM_JQ2_IRQ = 46,
     FSL_IMX6UL_CAAM_ERR_IRQ = 47,
-- 
2.17.1

