Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp643085lfc;
        Fri, 12 Jun 2020 10:56:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4Lwezp0p7C2nFu0iyUANi/3cf7xx54whL7RHR3r1Re7Z66zZQPRiPkInu78FxBC5Db7J0
X-Received: by 2002:a25:8b12:: with SMTP id i18mr18607157ybl.377.1591984589713;
        Fri, 12 Jun 2020 10:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591984589; cv=none;
        d=google.com; s=arc-20160816;
        b=izmobzKfFT50aLmHtLrqXGCgvn1LKrzqUBKlpr0I4NBfO4bbrLXgLqaJf0qfOs0XWA
         8cVM+6h8Xenwk3HR6T4TTWujb4FDQrtWtarRA2GTNYh7HDDHN9wF5vzczqfHtQfnG5mG
         1CTrl6Yyu+YkHn4sa6cwFj1dKS6p33ocsu+uXp1/qb8yQgIS/zshem5UpwIXl95lYSqG
         /Fm1IJmxdSdE9FM+9yfUFYCNM13JYu1QjJ2R9+iDG1dbXGsLT+oef1UPh2fSwYDB5Ra3
         D6VAfK7HxfSdFdCU0qRvBB4XZwpNwIzF1FwTRGRFcHcy9QScB4QSC8kn88wQmEr8GD1D
         BKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VXyjbLpDTuE00ge+DHFSib5N0fJzn7CQXE4wINPUlB8=;
        b=n8Ym6fKxrWNa5yx2fpNVtrAzEQA0o69qRhs5VsJDuDZe7O5O7Ejp5T+kEegB7avrLP
         cerDMtR34zBwo0IxWvAzPILE2mxCqZxodv1ouP2khAzWng/bKI3LE1qfLhSxhiW/USL9
         wTZoIZ5NmRU3kjRuwaeMzn4qOsdBLmYsdhlhiFVCAq/xMB5v4CEsX5nUGR9MFEKslpPZ
         YWydlQmyl2/5TiDCOpyBs0e8Ty6PBJZAAyjLlEmvpQxKvS8xg6kXN+jS5GLL0xt4Tu6D
         WQD89WDtcbq4IpMFNQNbUxwlG3odpXuU6nPUo9KHvM4nvhV+G8pPF+vCNXqHvttLcLtR
         pvEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WgeaN6ED;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si5794795ybo.146.2020.06.12.10.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jun 2020 10:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WgeaN6ED;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjnun-0008VV-2f
	for alex.bennee@linaro.org; Fri, 12 Jun 2020 13:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjntQ-0006m1-5P; Fri, 12 Jun 2020 13:55:04 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38188)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjntO-0004C0-JE; Fri, 12 Jun 2020 13:55:03 -0400
Received: by mail-wm1-x341.google.com with SMTP id f185so9061581wmf.3;
 Fri, 12 Jun 2020 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXyjbLpDTuE00ge+DHFSib5N0fJzn7CQXE4wINPUlB8=;
 b=WgeaN6EDTCdw9MxoftZstnYi8CHZ3U1JYCFxBleSkd7EbSpdzQmfOjx5OS1JVxjWt5
 OYtwtqf7Xzcbef/HRl8EIqd/ICQxRSZcEAqLboLb1mOlae4VdM/9Fj5FfCI1KlRHz95h
 ucagw2uSH6/nTXs6mSywTuO0iPgPfgpQagg89vt8dx/25k8i6MSIdkyT4HB2C4BhViK6
 RvyfkIUqpVh5Lh9q+lGn+3phwsqqRmLs5XD0Gz+xGvkdM00F5z0WoXl+aSXUMkO5BEzF
 QTbTBb7ZTnxcV3WRG5EejgH7NixXpk5/W1p0QLqM2YFzcH5ml1yF7GrVNBZTvO1wOhOW
 ZwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VXyjbLpDTuE00ge+DHFSib5N0fJzn7CQXE4wINPUlB8=;
 b=dMXU3jLF1st/3MTHuZQpOP3oWSkO/En54GwOWvXA58KdOiUeiEt/wohebUUtFYCTv7
 MQqVc4ObCc9EeuAvd6urLmvA93ecLl8Qp95SpO4TFKbnsmSs+tIfj++rwRyrQal/iPhu
 wq2sqcYuxX8FX2OuU3HoqNdvnIL3yxDbdM3Sc22Zx+Yj6O1coFe02ALAs8Hv2Tkb4onF
 cMZ1SS1RvAKt782dSnqPKNNVcB11Qplv0kF+Mg4R7Dh1xrOdD/YNS41YR1ib4jv/G4Lj
 NIQfzSTIlkHHvZ9vqIaPXQoSabRHpmdYvUFodcAV4VKTKfAG5+f3LEBwuwgm3AjVAt8W
 JBtw==
X-Gm-Message-State: AOAM530O4i2/7HVLH7UkDsgSoROqEhou/iR3KnR+K4y5nFBG3J89oDZg
 L4i467WRnghe2P0FX6ne7bHUbelZ
X-Received: by 2002:a1c:6389:: with SMTP id x131mr115342wmb.90.1591984488319; 
 Fri, 12 Jun 2020 10:54:48 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e12sm11288658wro.52.2020.06.12.10.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 10:54:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/5] hw/misc/led: Add create_led_by_gpio_id() helper
Date: Fri, 12 Jun 2020 19:54:38 +0200
Message-Id: <20200612175440.9901-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200612175440.9901-1-f4bug@amsat.org>
References: <20200612175440.9901-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Esteban Bosse <estebanbosse@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7//mxseeqK4k

Add create_led_by_gpio_id() to easily connect a LED to
a GPIO output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/led.h | 14 ++++++++++++++
 hw/misc/led.c         | 20 ++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index 9300d4db6c..1b2bb96712 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -28,4 +28,18 @@ typedef struct LEDState {
     uint8_t reset_state; /* TODO [GPIO_ACTIVE_LOW, GPIO_ACTIVE_HIGH] */
 } LEDState;
 
+/**
+ * create_led_by_gpio_id: create and LED device
+ * @parent: the parent object
+ * @gpio_dev: device exporting GPIOs
+ * @gpio_id: GPIO ID of this LED
+ * @name: name of the LED
+ *
+ * This utility function creates a LED and connects it to a
+ * GPIO exported by another device.
+ */
+DeviceState *create_led_by_gpio_id(Object *parentobj,
+                                   DeviceState *gpio_dev, unsigned gpio_id,
+                                   const char *led_name);
+
 #endif /* HW_MISC_LED_H */
diff --git a/hw/misc/led.c b/hw/misc/led.c
index 11c7e8bb89..36de80dd67 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -104,3 +104,23 @@ static void led_register_types(void)
 }
 
 type_init(led_register_types)
+
+DeviceState *create_led_by_gpio_id(Object *parentobj,
+                                   DeviceState *gpio_dev, unsigned gpio_id,
+                                   const char *led_name)
+{
+    DeviceState *dev;
+    char *name;
+
+    dev = qdev_create(NULL, TYPE_LED);
+    /* TODO set "reset_state" */
+    qdev_prop_set_string(dev, "name", led_name);
+    name = g_ascii_strdown(led_name, -1);
+    name = g_strdelimit(name, " #", '-');
+    object_property_add_child(parentobj, name, OBJECT(dev));
+    g_free(name);
+    qdev_init_nofail(dev);
+    qdev_connect_gpio_out(gpio_dev, gpio_id, qdev_get_gpio_in(dev, 0));
+
+    return dev;
+}
-- 
2.21.3

