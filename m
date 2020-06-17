Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp372356lfm;
        Wed, 17 Jun 2020 00:28:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9faBSc8bSdzQ0K9MK82Lj1NQFzqO6y1IIM8ZJarIBNCZksJ9muVdcedImHob/ORFOHkos
X-Received: by 2002:a25:df0b:: with SMTP id w11mr11220326ybg.449.1592378928085;
        Wed, 17 Jun 2020 00:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592378928; cv=none;
        d=google.com; s=arc-20160816;
        b=IFUUDjgR84kEissBcKvDT631m5Yh+O1jCUXJhahXaA27EuMUpHB/GJbyk7SSueknEO
         UUEJZQ5cMAmcgxgEZb/BjxN57M4bkZ4zzS6duPTgWYH2s+MLmAE6NVhbnqf55ufZYgoY
         3N4N7pMCOiVQe5qCkzj6ohb5Sb7aQJ8Xj3ST5n27i/1hZWpwGYBfYUcouYewkbvgqike
         uQq/XNnrFvcMur1VJsKE1uzt8dQJykE0xZVGGpf0vsulCAkJRVRA41V4W/OlgIFWxoT0
         0QO2v1JupOncLiYGJAK5Mvg502wrAMmCKu7m7swQ1gOgL9rD2lZPTu1U5EJ9DhHKbk8L
         oomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xsx3rVy21mly30ECAO4zqqbSeNtihiVFwXLty9S11BE=;
        b=fFTbHZ2DklBynW8wEyO66QIOqQ2xgbxt/8nzIRWHQhKPA1qiKcWCKsmCLSjIOPpPG+
         dsTRTRt+t/yUCIUL0vD539WepQkpf1sZRHJzy9CawWD9l/uXZT55wGLfFYfM16iNoU1t
         tPoF2Ca+5LiJqW7ZbYZ2HzRQCPz3tsjuMsxce1O+yt+3W8Z/bHKIAD82UNF2L5nJy0WT
         V+jxkOgK6SVDmZ9Wuue9mPzS1SH0KcvDl8mr2+AcYSkKFufqJz+03hc0SC4rWnO65b+i
         KqhZHeNBAhCThRs6vnlyG4BH8nWG2WWIktjiikHs5vn3bkzYZyhDJnTvfYjwMIznKSeA
         et+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FmnJML5Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si19980729ybm.105.2020.06.17.00.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 00:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FmnJML5Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlSV5-0001d0-FT
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 03:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSM-0004uH-Rj; Wed, 17 Jun 2020 03:25:58 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSL-0002cF-80; Wed, 17 Jun 2020 03:25:58 -0400
Received: by mail-wm1-x344.google.com with SMTP id t194so839813wmt.4;
 Wed, 17 Jun 2020 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xsx3rVy21mly30ECAO4zqqbSeNtihiVFwXLty9S11BE=;
 b=FmnJML5YCRErbI42yssQwWNRybu4/4kqZCImUOTsGw33xtHtQ+Rby5AY7QEucT6Y2E
 Wcf1ZxSzahKDDh++BD6N2BIPgrHk0nqjrrl9NLclCM443sepKJgHwjuXo8AGuQZ46vuc
 DTTVQZl2aiAeOK619/+Ec1J4ZjdT8pbbNmpYGxfVvi0/RJJ07DBxsSSJffeYi1/FK2rt
 xX0Lcp3CUUODyCfvAxCmA1SKetye5MILF1DiRRCV2BSue8k2sZIU3Qoop/g30zc1gZa8
 y//yq68hSHg2+jNQG8tjLPKKpxTLluRoF4xugEYp4qX7VkV0VVFiYiiXgo3CIyBwB9zj
 D44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xsx3rVy21mly30ECAO4zqqbSeNtihiVFwXLty9S11BE=;
 b=CibrR2tvLRy8GeuOgGO/easpz1gOWlKkICibNjV6wF4eusffkIiqnYWiCx67Yo4yp0
 lXz0IuBxp5rAabGzCUm/bX42PaK5oNxPHbTicbfAs92a/bddjZq6/kNqT6gMMO1l9mUf
 CMHtKX2IfBkecQoBkokIpX5k5amMYfjuvp4h97XKFGtr+/1Ib1yYVGXVaVGJiVYzvwhS
 tPRY2AVJW2MJj/iqU2i2PP+Ppsvjjwdw94vmAlYEnG2SQB0h3fuMDJ4fYNkiJJ19xBiK
 sYUp+YWR4hM3lIrskfL0lUdSgcxAsXXDuEOX2wUWEZ5/ASnnGcVbPaf3YlrnXTksnV2b
 aW7w==
X-Gm-Message-State: AOAM531IPcxh3Kbj1WgUDCcbDxvRXXNPsQ6oZ7Ehbu6pPQYS0iuorbvN
 ffTyUlIOH0LKchdYtcxinE46WnRp
X-Received: by 2002:a1c:1d49:: with SMTP id d70mr7140003wmd.49.1592378754981; 
 Wed, 17 Jun 2020 00:25:54 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id j5sm32894781wrq.39.2020.06.17.00.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 00:25:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/14] hw/arm/mps2: Add I2C devices
Date: Wed, 17 Jun 2020 09:25:37 +0200
Message-Id: <20200617072539.32686-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617072539.32686-1-f4bug@amsat.org>
References: <20200617072539.32686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E6ZHHVxLpmiZ

From 'Application Note AN385', chapter 3.14:

  The SMM implements a simple SBCon interface based on I2C.

There are 4 SBCon interfaces on the FPGA APB subsystem.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c  | 8 ++++++++
 hw/arm/Kconfig | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index daa26f68d7..2f6acbf2c2 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -40,6 +40,7 @@
 #include "hw/misc/mps2-scc.h"
 #include "hw/misc/mps2-fpgaio.h"
 #include "hw/ssi/pl022.h"
+#include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
@@ -365,6 +366,13 @@ static void mps2_common_init(MachineState *machine)
                                  qdev_get_gpio_in(orgate_dev, j));
         }
     }
+    for (i = 0; i < 4; i++) {
+        static const hwaddr i2cbase[] = {0x40022000,    /* Touch */
+                                         0x40023000,    /* Audio */
+                                         0x40029000,    /* Shield0 */
+                                         0x4002a000};   /* Shield1 */
+        sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
+    }
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 90ed584e7a..4a224a6351 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -406,6 +406,7 @@ config MPS2
     select SPLIT_IRQ
     select UNIMP
     select CMSDK_APB_WATCHDOG
+    select VERSATILE_I2C
 
 config FSL_IMX7
     bool
-- 
2.21.3

