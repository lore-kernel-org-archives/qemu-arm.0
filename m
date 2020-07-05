Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4389951lfm;
        Sun, 5 Jul 2020 15:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi/N95uhN1K+RLYB9m4hHN1+bPelUwrBBS6yTH6VhcBf8da0gyqRe8vr/AjegB+sioTtBz
X-Received: by 2002:a25:7b47:: with SMTP id w68mr67077515ybc.143.1593989040280;
        Sun, 05 Jul 2020 15:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593989040; cv=none;
        d=google.com; s=arc-20160816;
        b=MBOVTOsYKWbxnwPeb8xALzXQKYNBf+xPb2f+mVumoEWvFzJlFIv5ZcK8XzNppmJq0N
         4DarHSeZsTde8C470YPMmCReMI4udeISWNjJ1/R89K5uIqLcSmmhFwMDcHNY/t9eMtPg
         eXNiyHg9AR4D/WwWA/BYWDrutnqmPG3AkF7JfzoOgtbxlML/+gKZD45i60nEH4+AI69p
         AsoG5KHXHAgpMcFG/yPHSZMqiKwlYHD6GJ0C/txaq1w6G+DIVq83fiC6XmJI4eRK67z7
         LczN+TmKkjRHjJFjyII4y4r5+1Wv0TLA94upnsgOhOCSW75+1vZMNwpw6rcRLk+vyqsV
         uOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RJorkYK71XuxeJn/MmaQaqEtLEUwVuOASL3pI8dX4DM=;
        b=ye2ZFxVCIhzQCrS4tektB0SLs74u8zcPNJ0wh4jWXP3eB/VeoMe1O60qAkdkJjwQvt
         CC73eqTsIkT2bTRQAPMT77KbhR0n5NSIl+4CIfo/gHhcA/07BJN671Vx+ZACLKLjx/EL
         v6+0BR+6QiU+gbfjhZ72lXsH4ZRU/+frbddaspa4JBQtmu+9yjeWVsev3yyl7p6n3m2q
         6z5C5vTOGdIdEaFCySD28l30mz4S4QODs9srDeUcq300qOcFXOf1FeTXYRUYfXIrZQYj
         9eTb/wJUP+zem1KoZ+OvFEM4XnycxvV0vEVDKN/Rlfa3x1SXWNfRMd/jMpkAvsjxiilC
         255g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tkrHuxjA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si23240968ybe.126.2020.07.05.15.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 15:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tkrHuxjA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsDMd-0007wj-Ih
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 18:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKm-0004Hy-CZ; Sun, 05 Jul 2020 18:42:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKk-0002hv-Q8; Sun, 05 Jul 2020 18:42:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b6so38915949wrs.11;
 Sun, 05 Jul 2020 15:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RJorkYK71XuxeJn/MmaQaqEtLEUwVuOASL3pI8dX4DM=;
 b=tkrHuxjAVfaJchGbSaeE5rbW8n2tB/xcKjLYaHFqPVcoR6gPUum+c7QX8zvWOhDTqS
 JHoFY+LKmo9Oei4kNKGFVJtVtiskzfwL7H6tmim+IhVv2GyhnaU3iRgeq22npWU9GM3j
 VYWbUgj0vzhzpo3K38f/1/T4rzmwxK1v/HunH3H58J6If91tVq6Svs0zO0Pb4sURGzc7
 HT833FRXH+RrkPSN9ng6SPbVPJb9sT9tOeQ88JFLBU5b2cTKk6JY5keGxi/cN08fRbB5
 FT3CWwn5z/9tEdLiHDQ/ZnfYA96tEBCsFzTPM/FAk21xtS7CshK1hFuxtOtTAWNrrvgB
 zRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RJorkYK71XuxeJn/MmaQaqEtLEUwVuOASL3pI8dX4DM=;
 b=IEmy2m20uAsm1uJXJrC1fHALhjmGoK96qnLZD1wDt98IrnV4lVnzaGRyo49PlkjCFu
 60Lfzi3jRLJahDEK4fROfEnCS+zIM3KgxUrHRChAunHLSUSYI5YGo3WSjsH6k+6dxCin
 Qjbi0wwF3TagZjeR01DyUch0k7erUQlZlT5LZo0R8wS1MQ3CMgHgHI+q1fULm5IAkVGC
 lI02P5ehOZWU+4iabhwa9iX5yrxOhN/WQh3H5P0nVa1frqxtTQfa1PGuPL7I2C56yNHQ
 kxuEpNRGNWaZNlqUHcEtCjUYx0ECOjwF10aBxP94scM8VnLzzChOBijDkf1jBIERX2b0
 DKuQ==
X-Gm-Message-State: AOAM530mM/hVut+GTuSpJ8jqJzZnrjzftTHYl8+V/xiw6bqZEQdLCGUC
 zw6aFuZgClWfxU6HKvJ8SCXPFBiyIYA=
X-Received: by 2002:adf:b608:: with SMTP id f8mr49757881wre.363.1593988920564; 
 Sun, 05 Jul 2020 15:42:00 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v6sm9151467wrr.85.2020.07.05.15.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 15:42:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/i2c: Rename i2c_try_create_slave() as
 i2c_slave_new()
Date: Mon,  6 Jul 2020 00:41:51 +0200
Message-Id: <20200705224154.16917-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705224154.16917-1-f4bug@amsat.org>
References: <20200705224154.16917-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
X-TUID: n4V/7Izte0iK

We use "new" names for functions that allocate and initialize
device objects: pci_new(), isa_new(), usb_new().
Let's call this one i2c_slave_new(). Since we have to update
all the callers, also let it return a I2CSlave object.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h |  2 +-
 hw/arm/aspeed.c      |  4 ++--
 hw/i2c/core.c        | 11 +++++------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index d6e3d85faf..18efc668f1 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -79,8 +79,8 @@ int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 
+I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
-DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
 bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
 
 /* lm832x.c */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1285bf82c0..54ca36e0b6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -513,7 +513,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
     /* Bus 3: TODO dps310@76 */
-    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
+    dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 3),
                           &error_fatal);
@@ -531,7 +531,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
                           eeprom_buf);
-    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
+    dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca0");
     i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 11),
                           &error_fatal);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index acf34a12d6..144786f17a 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -267,13 +267,13 @@ const VMStateDescription vmstate_i2c_slave = {
     }
 };
 
-DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
+I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
 {
     DeviceState *dev;
 
     dev = qdev_new(name);
     qdev_prop_set_uint8(dev, "address", addr);
-    return dev;
+    return I2C_SLAVE(dev);
 }
 
 bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
@@ -283,12 +283,11 @@ bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
 {
-    DeviceState *dev;
+    I2CSlave *dev = i2c_slave_new(name, addr);
 
-    dev = i2c_try_create_slave(name, addr);
-    i2c_realize_and_unref(dev, bus, &error_fatal);
+    i2c_realize_and_unref(DEVICE(dev), bus, &error_fatal);
 
-    return dev;
+    return DEVICE(dev);
 }
 
 static void i2c_slave_class_init(ObjectClass *klass, void *data)
-- 
2.21.3

