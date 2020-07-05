Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4389830lfm;
        Sun, 5 Jul 2020 15:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNW/KvAlOF/27nEXQqwJM0jpR8lPuyehcvVkHNCxHRPUFYK7vBvNPLhMcxgGgqvWLwEoi/
X-Received: by 2002:a25:cc4e:: with SMTP id l75mr26680707ybf.165.1593989021661;
        Sun, 05 Jul 2020 15:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593989021; cv=none;
        d=google.com; s=arc-20160816;
        b=qHAPblZSh4zw3972O//h6BlFIVd2txe/PI5zmM8HcY6NfvpiY8msJqhn3VTAYJnNY4
         aBSVYBoUqGik1G5pvHkbsllYYz3X8NXWOu8ELYgv8XgGWMwbbfaM2UPt4SfOffm6u7iv
         96gmqTKY/KqkbnO5K6+BR1VaBYNrLyOZt62F7sqzNuRus2GSx0FRCfHsHLCt3Cusfhur
         Bb68UUl5I27h0qvX8QZfkXgUviIT60d0nAgt/1A8W7pPfHbkiJPCJ5KJxgXzJZFuzMdK
         WRhnD91NDIVm6LoKnMPqinXReAy4YDxYKjB5Ihx1KVp+/24hqZ6I2DKIE8AxBYaEP5yh
         sn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jokNy7niATa/omdvHPNh1/95otnWd0IrupXVCsLQO64=;
        b=GsyzVCM2y2n5tBWcLPnDsxJZxbEqA9hMt/OVmMKZOKCKamCjxJfRlLosBsgT5O8ZP6
         6CXue/ld55O4L76kx0tTbUpJPWMBRHve5C7H19EUtkr/TBm2b8DLmW4l1cv0EqCalrnQ
         hRiFOjb7gom+6qZIuZhqmW2Xqi8ZSBPTEdh8IKMFhsXKYv74L5ki/I1tDoIyuqAbADew
         2ZWrUdwK1sYg/zgeSdyMUf908DuLZjcK1ktCYLPrnsfH3OFj1yB3eoDVnPWwRDQNZC9R
         QrUi6il0HeO1KimNx4W/uFb/lY2CffiXEwFfhFuMfr1h3wM7rgn2oJTVgbBpElnwCvR4
         a3og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mDbwYSKB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si1476799ybt.191.2020.07.05.15.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 15:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mDbwYSKB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsDMK-0006ux-TN
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 18:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKo-0004MU-6D; Sun, 05 Jul 2020 18:42:06 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKm-0002iA-I3; Sun, 05 Jul 2020 18:42:05 -0400
Received: by mail-wm1-x342.google.com with SMTP id w3so27362395wmi.4;
 Sun, 05 Jul 2020 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jokNy7niATa/omdvHPNh1/95otnWd0IrupXVCsLQO64=;
 b=mDbwYSKBLDCXnp38XSaEUGGxDP01Y7AY7LfMGiVIhubB1aB2o21Jr6t096nys/BLJl
 gulZ0Tmk0uQtIrFVh4yTZMocWM34/8Wn8z1NSLYT9LAayxOPtKTaVjXXmMMbzpVgbA3n
 zcWJYeazRaXXEopLt+5WmBJhA7i9yerzHF3zLJPJw07lyEByBn+f51EQDpRwhQtEe07V
 xq7qGHEV6TMbDIx8ime4k3W4RtyynlTqCPMys7CJnPzmsKizHzwxjnkw6djQ4comqWj2
 qtsbojpx7PzaXwdgbOm8r5nPAGbK9ua9LI27B7BQtyiUkjd7hVPfTvNLufP9pIY18wTv
 pa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jokNy7niATa/omdvHPNh1/95otnWd0IrupXVCsLQO64=;
 b=dgYj5f0qYWFN2jvdi8ULBRwwzhh/odye4cJCQE+uWNn8QMO1VX/3zl5KFAlG5LPagG
 8AUoUb/XbLusB4QCLqVgmdT4gTImmCNAKWKCUuWTPHiMy+d9x6RYAIBHvDkI44ZuOStD
 hvrSDMr3ty+QnbHRgskYClRGIBEEME6ZEptqCIs8NCAYcCWHoSICMtVKY/W3kNV6Zz/C
 dp0P/N7wZh9FNbfgVtj//uXRifMrTmKSmtZx4yfRP9fRtjv8uB5wdPdaxLZQ8LHW/sSZ
 HdOmCQ8vYD3ahXIQ68OfvVG0uxQsr+oBlSimzYBVV6JlkUPW2PMhQOLFFhALGi4nSZ3s
 2tJA==
X-Gm-Message-State: AOAM533sA5Erx3RNFkNnZ3Lw7nlZv4QgwSBZglWcUpUMkjjzbVNwz9FQ
 J2z3gNF/dZmZDX8xrsbq3Y0n1JSrwi0=
X-Received: by 2002:a1c:9d0c:: with SMTP id g12mr40679856wme.107.1593988922217; 
 Sun, 05 Jul 2020 15:42:02 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v6sm9151467wrr.85.2020.07.05.15.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 15:42:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/i2c: Rename i2c_realize_and_unref() as
 i2c_slave_realize_and_unref()
Date: Mon,  6 Jul 2020 00:41:52 +0200
Message-Id: <20200705224154.16917-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705224154.16917-1-f4bug@amsat.org>
References: <20200705224154.16917-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GZbOuH0IHflk

The other i2c functions are called i2c_slave_FOO(). Rename as
i2c_slave_realize_and_unref() to be consistent.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h |  2 +-
 hw/arm/aspeed.c      | 10 ++++++----
 hw/i2c/core.c        |  6 +++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 18efc668f1..cb7211f027 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -81,7 +81,7 @@ uint8_t i2c_recv(I2CBus *bus);
 
 I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
-bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
+bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
 
 /* lm832x.c */
 void lm832x_key_event(DeviceState *dev, int key, int state);
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 54ca36e0b6..ed14e79f57 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -515,8 +515,9 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     /* Bus 3: TODO dps310@76 */
     dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
-    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 3),
-                          &error_fatal);
+    i2c_slave_realize_and_unref(I2C_SLAVE(dev),
+                                aspeed_i2c_get_bus(&soc->i2c, 3),
+                                &error_fatal);
 
     i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
@@ -533,8 +534,9 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
     dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca0");
-    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 11),
-                          &error_fatal);
+    i2c_slave_realize_and_unref(I2C_SLAVE(dev),
+                                aspeed_i2c_get_bus(&soc->i2c, 11),
+                                &error_fatal);
     /* Bus 11: TODO ucd90160@64 */
 }
 
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 144786f17a..f81601a5b9 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -276,16 +276,16 @@ I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
     return I2C_SLAVE(dev);
 }
 
-bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
+bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp)
 {
-    return qdev_realize_and_unref(dev, &bus->qbus, errp);
+    return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
 }
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
 {
     I2CSlave *dev = i2c_slave_new(name, addr);
 
-    i2c_realize_and_unref(DEVICE(dev), bus, &error_fatal);
+    i2c_slave_realize_and_unref(dev, bus, &error_fatal);
 
     return DEVICE(dev);
 }
-- 
2.21.3

