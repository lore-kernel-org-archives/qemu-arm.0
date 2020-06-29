Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3190989lfm;
        Mon, 29 Jun 2020 10:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygIdKwoLzXj0kfz8a0aWfmnJiuhLXNqO4OKnNuiTjZPn+RpDu5mOgQbMOIdyoJQSw13twx
X-Received: by 2002:a25:230a:: with SMTP id j10mr28393493ybj.148.1593452335824;
        Mon, 29 Jun 2020 10:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593452335; cv=none;
        d=google.com; s=arc-20160816;
        b=pC56tAp6QvjBvex1D1SNMRCm/VQIPwueYI5+hop/A61jaq8g4Nq9TEFlWlOhBCTmb+
         MEnUSMTJJT1/UrF5L8UImYXNakQhyqDuCVoSKOvbn3gaTgt9WDXSGYUeIIJ9FOmgyYhx
         CwIKrk0v0frI9dkhRMIn++M8spOqpznYnaLbj1nVTB4zrUkdycioGpYVxjq2zh3OImmc
         +lZtadJSJ83sG/nTiBQq3O4UbMJ0+vtCz4LYAraOOlaJGFAWJrKEaiWLfBJBhGpBYHjs
         Y3+hua2mfQ5Tdj7mKGTvjmOHejsbMf2n493fSdeZdRJnIutZUKU8Dq6VXHr+SRCuM7iw
         6lIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6cSGomOE4QTMbqeX26Zlg/Tz0PsmS6jvlXcVlbBS5jk=;
        b=i/uaYOuy0PlRxjIbfnW6Zm66VEV9qwDX7t+91XX3YWJiLSZfiw2wIAYqgcwJx9gLa7
         Q1XHTvo2NhhrAyGya3L2bRONn4ZBMyNYECwMUiR7Hug0HxYUFqwj8ar4j4zYwxATqoqX
         TINM5ZZDbSIyJ3aq+GErhSHLbf7ItGX8VanvIa90C+0eGMH+iH7KX7cs5XZAk4UHOsyx
         Ml7JTV6tn/anyxXp3Y1ZbQuPyMQbCVhnFhrBwZKD0I4T3iWov9zUrHw0FuwxseMTvOgV
         Qos+t1Xxc/NjCxJKZ0zIlWwfl7hc1W1LWHrdYS9Yb3TMy/VY+4urN+kVc3vKUxn86ibV
         GS7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MYoTbZy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g64si219086ybi.438.2020.06.29.10.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 10:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MYoTbZy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpxk7-0005tW-25
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 13:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpxjj-0005nQ-GI; Mon, 29 Jun 2020 13:38:31 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpxjh-0000IV-RR; Mon, 29 Jun 2020 13:38:31 -0400
Received: by mail-ej1-x641.google.com with SMTP id w6so17475668ejq.6;
 Mon, 29 Jun 2020 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cSGomOE4QTMbqeX26Zlg/Tz0PsmS6jvlXcVlbBS5jk=;
 b=MYoTbZy3tSOJy+RBaNTr/s68o6unK5Jg9w+yfwdUdOHKYQ0A8JCTOr3aAbfNhviUhY
 qUH87BKYUFQrnPrML2GzdkE1jex0nRM63rZExKsDC0WxoO3QVk6ZZ8qB+CiRI39mRjlQ
 7bGUJJ+9ojSNmj1kF0FA4tbiQHiuoOq/jx1wZO92+JfHf5ZsRQ1nNIVVYbmObdN2E621
 qMhnXWoppLKGueLs9fndoU2EiA5rk0zj63zukK5fY5zULlk6PbrJy/A+Njf7S6duzxEI
 wSbqn8TX0tJTEvUKInvELvgZ40K4s9h8g1+7G7i2KL5C2PVISXI5wBkddv6A86CKUA+/
 BaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6cSGomOE4QTMbqeX26Zlg/Tz0PsmS6jvlXcVlbBS5jk=;
 b=dliRD9B2EIZfMdUEFWrXhA1aAeUvIvT/sFj2o+HHCULm7sbKowxpcWHTdjtR2To64v
 yP+od4daSkm/tnMlkZoXucyTgptO18lCjBJ/d46lVqoPyF/Rnp3tgwTgyQDtYaPqWhoF
 0LHp3mmMDTJp8pFG6J4QMaUJRWjvRmf0V4gwfJeNOQh1GHhmmsePM25A60AgCigTAbrY
 6YYNlCi+pX/AuYVqJOHkKn/BIA4xwSY+qi4v3RP5SKGyZroActvhbAij/wUHMv+YcjUk
 iILHec5X+hLsbistzUat0a4cuWBrOUSRwlIXqUUcIZuNmQNXlQ79fRoHMNuUqHkTwgcp
 QV2Q==
X-Gm-Message-State: AOAM532isotknkQkmrBvZwMjjtMd/MRsKAGgzdzxe/j60KGGqAFK+mF4
 vlDR+i8XkBx0eaGU+IzrdqMt5wAVxpo=
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr15597071eje.413.1593452307332; 
 Mon, 29 Jun 2020 10:38:27 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id ce19sm216029ejb.24.2020.06.29.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:38:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/i2c: Rename i2c_try_create_slave() as i2c_slave_new()
Date: Mon, 29 Jun 2020 19:38:18 +0200
Message-Id: <20200629173821.22037-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200629173821.22037-1-f4bug@amsat.org>
References: <20200629173821.22037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
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
X-TUID: bDJDoQbHH7Qb

We use "new" names for functions that allocate and initialize
device objects: pci_new(), isa_new(), usb_new().
Let's call this one i2c_slave_new(). Since we have to update
all the callers, also let it return a I2CSlave object.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 2 +-
 hw/arm/aspeed.c      | 4 ++--
 hw/i2c/core.c        | 9 ++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

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
index acf34a12d6..6eacb4a463 100644
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
@@ -283,10 +283,9 @@ bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
 {
-    DeviceState *dev;
+    DeviceState *dev = DEVICE(i2c_slave_new(name, addr));
 
-    dev = i2c_try_create_slave(name, addr);
-    i2c_realize_and_unref(dev, bus, &error_fatal);
+    i2c_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
 
     return dev;
 }
-- 
2.21.3

