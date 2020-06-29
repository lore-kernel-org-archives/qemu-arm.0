Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3191359lfm;
        Mon, 29 Jun 2020 10:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTc+pv8H0jpzzhHf36YloKKqPZP/vlAXnV+E4P7gQLGi1YvcSMjUKxi39tBtH1Qxlw7AzW
X-Received: by 2002:a25:ca06:: with SMTP id a6mr29699311ybg.387.1593452368911;
        Mon, 29 Jun 2020 10:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593452368; cv=none;
        d=google.com; s=arc-20160816;
        b=wpmtnAMOgiObAQpyGyqHV10Qq/zNfewfO2aAN2Eggb21UEBfMgnpwH89dGYTeSxf9J
         lQfv0pMcq0LiFNhcxMUxh0c21h/Q8IXwocGsNv4UR+2CjcdGb3wQbb2qfVJQM9ccxteI
         TpUf3YOl5YIlEPfxlTXMR3aXvuxAx2H1Pqe0w2abGVV2zVbP5Eygvr29gKWSswgwVBxx
         jFW0wzCAYLac+xabZJyaZAaS6PR9u1fR4L2ObdBFnAJ27EdJzp9eA4vah7Tlbhv03nuC
         OYXIi4cJvCn/X1gyIotHVbyPvL58pSDW0rsU858kpRpW3zT6Iar698A6HEY+4wqukg+N
         +lKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oo257JjDoIhwiqBvGiPI8EB4cn7Ei4fDeJ2qCeP5TaA=;
        b=NbhBUN8TcQ446xZFKvxiDNpwlGviAtRCJOvOR7A6+s9Ult5lLEHUH4mNHzuBClAeaW
         UgEJdZ8q/eYuT30iAZqZq1rR5KIgziMht6Fm8HMv2pXmO8YmskkKnbSL0XQgip9KXIq6
         TuUDROlbYkEiR3vGyMCM9hL/Nby+ixNiDt/+rLwtLWFX+hiLY5IC590iuwzyeotPJXB+
         +d6xodqOywVyClt/xrM+7y5VVTCuERjfAefkj0q4FNDakSToYDlknAQCKZtxlD5iVbRv
         NfKtgk88dDuXytlZbEyGV0ONu8olyrJuD29C+I4vTsETrYgFt0Z1+/37uMaDwv4PVKJz
         GVDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lP8vdaSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si242323ybo.51.2020.06.29.10.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 10:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lP8vdaSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpxke-0006bF-5m
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 13:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpxjk-0005qw-R8; Mon, 29 Jun 2020 13:38:32 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpxjj-0000Iz-2m; Mon, 29 Jun 2020 13:38:32 -0400
Received: by mail-ej1-x644.google.com with SMTP id n26so3520828ejx.0;
 Mon, 29 Jun 2020 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oo257JjDoIhwiqBvGiPI8EB4cn7Ei4fDeJ2qCeP5TaA=;
 b=lP8vdaStVSuz39ejHkPGsHXCqdWUn/CMUHYK62NVHar1l4AGNMWtUS/P0/eXfQTmTE
 uYGxgL5+66JepelWDyD/fYsCfnHmDRcec1tVZE10FTQI/Xe4wTaxsaVd/RWHnBc4YnZG
 GtCZ1ZjymHvDlCkjP+4AdRKgWfWIVpGIk4g5AVy1k9KqmRRU9Pn3RmgG0Ltix8/+cQ8l
 CTyLHTxpfVvPzLUnqXMXNx8lxFUmk74cDCWWLKGukMUjl01wACxHXV0PObAGLd0ThyEC
 hKwqpA9GKCclezYRfZtA9Nx8QbD4z2rii4AkrdVVgTgyeLa7s9FxH/HcaEg2GFh5DZFC
 d/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oo257JjDoIhwiqBvGiPI8EB4cn7Ei4fDeJ2qCeP5TaA=;
 b=N1N7zCs7Kjtx9TTfKjookx/bjk4WdoJVirCnC7a5FD/NpJnCXI9DgRPXld4Qd5dJvw
 YRwWmpb0i0BU+D+X7R5Hzl67yFklEMooc1GwKtL6GhXJJ8vqUhPOOiNVtl2JsPIxL2Ut
 +I4VvFRbqfF5ZYpUPqWf/R26xQLJBc2tuUj9kxQi7M0CqxtokV7RUM/rbXtSwa8Zk0TU
 2d4QAlClt+8/29D+nZrs5+fbRB2TsweTu72dRzpLIaOXDt4WpH9LF8XlcdnPh4euFkoy
 zdj+/hXJU0VRb9e69fpsdJzK9s3/6wOTN6DwKlJLHGSm8jB1b2R+Ha7duODYzissgnj+
 cjXg==
X-Gm-Message-State: AOAM530FfHZZWcfluhhIkv+0BIyKH0Yb9da3h0o0/ziVc/SG3ctK/KDk
 KFNF7v3JfZhbu7hLITSjvaOVxjyPOvY=
X-Received: by 2002:a17:906:4a87:: with SMTP id
 x7mr14944733eju.44.1593452308817; 
 Mon, 29 Jun 2020 10:38:28 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id ce19sm216029ejb.24.2020.06.29.10.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:38:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/i2c: Rename i2c_realize_and_unref() as
 i2c_slave_realize_and_unref()
Date: Mon, 29 Jun 2020 19:38:19 +0200
Message-Id: <20200629173821.22037-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200629173821.22037-1-f4bug@amsat.org>
References: <20200629173821.22037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SuDMT5ApadZ3

The other i2c functions are called i2c_slave_FOO(). Rename as
i2c_slave_realize_and_unref() to be consistent.

Suggested-by: Markus Armbruster <armbru@redhat.com>
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
index 6eacb4a463..135ea56036 100644
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
     DeviceState *dev = DEVICE(i2c_slave_new(name, addr));
 
-    i2c_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
+    i2c_slave_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
 
     return dev;
 }
-- 
2.21.3

