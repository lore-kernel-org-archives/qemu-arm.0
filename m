Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1871302lfm;
        Sat, 20 Jun 2020 15:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS7WHMJ4His3Pk9aBxWl3jw1egc5EEc43JnAAUwWf17mzZZpBXspE6RbmfOVQVHqgYva4q
X-Received: by 2002:a25:c5cf:: with SMTP id v198mr16489132ybe.6.1592693994543;
        Sat, 20 Jun 2020 15:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592693994; cv=none;
        d=google.com; s=arc-20160816;
        b=EJcS5sdzGpv/nwDJYQskU4LKfOCyqulaPYky96jEDZPkifiHSd6S5nUByue0PlRPio
         +CeOXWiKqix1GDPLaWen26bFMtAcz9s9s2mskJCZDmW/zyIvw535xkih278+QIxUFYKS
         qtTEIBgAsf8i8wVTHlW4Cz7+dZkfRQZ7lyI9yIUByvrfXSmtR+K4ouu220YiTGZ8wM1i
         psrvGb+LvOd2NDbYa4Y01Hhl3vn8c2DLvbCpINeSPG4kosYIrPB9nj5XMiww2uSFPUty
         pUxex6EiJkUDBaWYOYmdADzNLUDdQ0hl8YRy2LkJltTYxzU4+78qnb4M6ic1lSHzyVyP
         nBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DyoF/qLlFB6Eqm6PiYWnf/NDgGben7zze4O/C89Ofx4=;
        b=QRDpmK2HAzEH8B2pj/J9oqMpcFhiTi6I4aZM2H0M0tbRnXwLHMuZ6lJYFve0A907Ou
         958W0KWv/5JvHayUWsrG9LD3lqrwX6/OlgWfbQ4G4dWDp4RlqLixcK71C9vJW4FSjPDQ
         wcyDD2YbdppkEE0M6XYNdlTXPAXRqGrpDQbErh/UxEkNsg3aVW6kgykNAstoCnEt/TVR
         VWwKCPZ5iRrdLgzg9fZoz7HOrVYHXuOCRC4NWx1pLpnmkGYwwSKntztGWFOZXJ8wGm0T
         Q/VVhclj6mGSDa7BQ+/LAxxoAJysIwzJqCM0/fv/YcCVDdLxCYmH86lJngrQLVbHNi4M
         FObA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fUttuOc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e144si8922623ybb.486.2020.06.20.15.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 15:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fUttuOc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmmSn-0002S5-Sg
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 18:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmS4-0000w9-Pf; Sat, 20 Jun 2020 18:59:08 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmS3-0000yh-9m; Sat, 20 Jun 2020 18:59:08 -0400
Received: by mail-wm1-x344.google.com with SMTP id g10so11659869wmh.4;
 Sat, 20 Jun 2020 15:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DyoF/qLlFB6Eqm6PiYWnf/NDgGben7zze4O/C89Ofx4=;
 b=fUttuOc5T9+Vum1IoeF53eY8N9xHFxiKg1QORzz2CBWl4iRgr27gthZm7FOfRwoenl
 DUxnowonYsFlT73NZdK5+yqana+16k/Leobko+jg7R8KJn6A1uCqCZGBgoII4nfSKepj
 DRBhc+6XdewhICifS9L629CRZDm36a/ulm0U2OeAZOLKsBibGV+oPoObvWFIE1xmIdO7
 AcNLjdIGmkG5GzVZ1e4gR0QNZBKa1dQaAg1LTdEpLWq5r41cIPjsA6w/mMGAxlSw6gxF
 ugqlFD3gHSEyFngKDar5s+/jb45hDTFu9fwy9DOsAwaq9G80Y+dF7X8/y3PuJPO+pROi
 awWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DyoF/qLlFB6Eqm6PiYWnf/NDgGben7zze4O/C89Ofx4=;
 b=DFM2mJhXd6qfYw/cMI3nvtISjUO2cvDDc7O4C4m0N+PUa1LiFa62iRmTfQT8tiQhT4
 DLvQ6RZUl2nBhiUcwhthmHLcVee9jPxGIDpmZg6uzy1KOYporegqZ0WQn5wlnpZE/gQm
 tX6FRhNi0WFe4aN7Etk7YxDJdb66tZ8rN5IdQLRQtRVVkRi02/xBbIrGfVKSjK22km8Z
 lkLtCqLmRbnuRKGlRqXCBkHi7CpDOj/rJR7DPvBsV/UEuXFwtPBwB0nTgnuQ4svpoCVc
 ZaamX8WMjJVHXedvcM+5T4Hq9JEt55WnVSNwlhTlk90yzVP3n/5DkmY11KkLiVk6D+Wn
 AaRg==
X-Gm-Message-State: AOAM532tU4jbew96/kEz5ncEeJ4UAWdYA7hgNAJR6O+QKM5OVjCKgUOR
 LOKC7aqfUQDJEB6HiqkhUNizxmUb
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9973381wmj.96.1592693945585;
 Sat, 20 Jun 2020 15:59:05 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x18sm11147127wmi.35.2020.06.20.15.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 15:59:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/8] hw/arm/aspeed: Describe each PCA9552 device
Date: Sun, 21 Jun 2020 00:58:52 +0200
Message-Id: <20200620225854.31160-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620225854.31160-1-f4bug@amsat.org>
References: <20200620225854.31160-1-f4bug@amsat.org>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: akosGMNw1l8l

We have 2 distinct PCA9552 devices. Set their description
to distinguish them when looking at the trace events.

Description name taken from:
https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6b7533aeee..3d5dec4692 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -508,12 +508,15 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
     uint8_t *eeprom_buf = g_malloc0(8 * 1024);
+    DeviceState *dev;
 
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
     /* Bus 3: TODO dps310@76 */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PCA9552,
-                     0x60);
+    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
+    qdev_prop_set_string(dev, "description", "pca1");
+    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3),
+                          &error_fatal);
 
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423", 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423", 0x4c);
@@ -528,8 +531,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x51,
                           eeprom_buf);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_PCA9552,
-                     0x60);
+    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
+    qdev_prop_set_string(dev, "description", "pca0");
+    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11),
+                          &error_fatal);
     /* Bus 11: TODO ucd90160@64 */
 }
 
-- 
2.21.3

