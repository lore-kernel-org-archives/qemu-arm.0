Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4334639lfm;
        Sun, 5 Jul 2020 13:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlBKQY5vwE86efAUbBIO9YpoqyKDK1wZqZl8X7NvXVf9TO0dUQgnLjLwp66zLwomwAyqZc
X-Received: by 2002:a25:bb07:: with SMTP id z7mr25586603ybg.343.1593982147055;
        Sun, 05 Jul 2020 13:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982147; cv=none;
        d=google.com; s=arc-20160816;
        b=dm6GGfs/Xqe260l5+FnSga5OWt438hJqasE0meadZ25zDk/c/bT3xlebv8PTVSeucj
         04Q7gaHc1Olt6P2bLE6lyKnWRUOrerEIsAr/9ywg4FRMDKV7t8wReXLMpKepsi8af0Wn
         g0uQt07tgpoo1XCJlzD3ag8FuQ88niFrdjSQ/q6AwI1DP7HJ3Qo15RcYlhB/Nav8Cim7
         gXtDvLSmBDcaV5n5uM7g/tP3MW5//4dmOrw7DVo4GsZ2JZoP28c6BoN3cA2gAeMQ+MNM
         1kWeIGGJfq9Vv7EcgGRSGj+aW6UUkLU1lAZHzBjZz2VJrH7nFtazEk8ypxsFfcP/p7lR
         kchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zq4O1k2rwycdf6oHiRxmb0Ixv9secgC8eTrxhU7dpKo=;
        b=fVwjpXUCdbcFJvP0ZoapYIAP7I0ZHXcUgpmvMj+PrbEzvE121XWgvgBXsYr8s7G24o
         MZq60m6vUf+/vG6g7fIDQv5BaRy3mi5MRjgmrIquDgqoomoUY2qTwwHh3PR6mw9oPX1d
         IfFaVWEXgc4/4SyAEhz19n/1SlQj2QgWnfVZnEDPB18hcJx96ol3m2EmaXswKZYWNuVq
         ziRb2Le4FF31g3tCoqahsNAivjc4g8tOtYDCYAVO+RE+hL6DsTaQYh7Dl/fgl1hyXdGo
         1rV81os7b1EAuWx/x1cLzpH016SJLH8NRjsdB6ynV/jOfWaxLjNZQdZnLnomiFLiSqZN
         Hn4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6bVa01R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j190si2898831ybj.64.2020.07.05.13.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 13:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6bVa01R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsBZS-0008CQ-Em
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 16:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX8-0004aN-69; Sun, 05 Jul 2020 16:46:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsBX6-0000pZ-KP; Sun, 05 Jul 2020 16:46:41 -0400
Received: by mail-wr1-x444.google.com with SMTP id a6so38743220wrm.4;
 Sun, 05 Jul 2020 13:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zq4O1k2rwycdf6oHiRxmb0Ixv9secgC8eTrxhU7dpKo=;
 b=a6bVa01RQg54e9WoT8RxKoP2OUMpe6C2Hlq175437gpJRF6SloXA3HlnxvVu0Qy+VA
 wPLtHF0y6MrasjQ2bRjvg7JRmjLru338nzgvME9gmd9pLWBl4Cby3I8XyYXg008s+ZbQ
 3oc581IYc80164snEnWu/24rkEw/JVaX1XoJ7cxelexuQEg5CfbUAP59pTEBHFC36kVr
 mKhF82yEaHer4R70u1JKATosgn+NY3GpaxehNj0pHpSi6P0q0iT7UcScpYGZYKuguSr9
 BwBxvW0cFjsb0I0tU0rfbwL+jyOxF/iTm999U9mO4G4p7bCYxvb4FQ81UjApVyARGILr
 xDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zq4O1k2rwycdf6oHiRxmb0Ixv9secgC8eTrxhU7dpKo=;
 b=gth8BPUkhh0EFpI9oy41M4HPGnuQ+4uaJCnv9b9KLNSREJXBi/cteySQiJkYuApbDX
 qHJcELN2urDEu8CcX68vLRlJEYs8NZPfR27llOHQjEpxvMVwBTSKhin8Zmk+jadJCusC
 p/Mr21iCO0+eVaNy2SdzwNW907hCAiwxGRgDEbNyF7OPs72OKPeQ16PpJKwK/+MzpPUo
 1dCLj3ez4xXO+VASe6fHXj5/ILX69wYS05aFzD9DjTrGEryGdXbKUUR+uw2e43JJa5gp
 yzZgq9Sqf7qvmKW2kSu16EJWeOcVgDIh/40Kt3NbrIAQDgcZDKbo4Md2avR5eUKJ4Bua
 34TQ==
X-Gm-Message-State: AOAM5327bjriy+VGa99mpWZ9idBulXCHxQgCB4KquejdfYBHEm733EmP
 AtU8OeQ2VNR3OtBmdckRxfNUk/5O8yo=
X-Received: by 2002:a5d:4903:: with SMTP id x3mr48531843wrq.351.1593981998684; 
 Sun, 05 Jul 2020 13:46:38 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g144sm51397817wme.2.2020.07.05.13.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:46:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/10] hw/sd/pl181: Use named GPIOs
Date: Sun,  5 Jul 2020 22:46:25 +0200
Message-Id: <20200705204630.4133-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705204630.4133-1-f4bug@amsat.org>
References: <20200705204630.4133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sOrOatUkbBN9

To make the code easier to manage/review/use, rename the
cardstatus[0] variable as 'card_readonly' and name the GPIO
"card-read-only".
Similarly with cardstatus[1], renamed as 'card_inserted' and
name its GPIO "card-inserted".

Adapt the users accordingly by using the qdev_init_gpio_out_named()
function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/integratorcp.c | 4 ++--
 hw/arm/realview.c     | 4 ++--
 hw/arm/vexpress.c     | 4 ++--
 hw/sd/pl181.c         | 8 +++++---
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index b11a846355..2595e4d052 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -645,9 +645,9 @@ static void integratorcp_init(MachineState *machine)
     sysbus_create_simple(TYPE_INTEGRATOR_DEBUG, 0x1a000000, 0);
 
     dev = sysbus_create_varargs("pl181", 0x1c000000, pic[23], pic[24], NULL);
-    qdev_connect_gpio_out(dev, 0,
+    qdev_connect_gpio_out_named(dev, "card-read-only", 0,
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_WPROT, 0));
-    qdev_connect_gpio_out(dev, 1,
+    qdev_connect_gpio_out_named(dev, "card-inserted", 0,
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDIN, 0));
     sysbus_create_varargs("pl041", 0x1d000000, pic[25], NULL);
 
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index b6c0a1adb9..8dc5f77139 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -234,8 +234,8 @@ static void realview_init(MachineState *machine,
     mmc_irq[1] = qemu_irq_split(
         qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
         qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
-    qdev_connect_gpio_out(dev, 0, mmc_irq[0]);
-    qdev_connect_gpio_out(dev, 1, mmc_irq[1]);
+    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
+    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
 
     sysbus_create_simple("pl031", 0x10017000, pic[10]);
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 5bf9cff8a8..16629d6599 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -624,9 +624,9 @@ static void vexpress_common_init(MachineState *machine)
 
     dev = sysbus_create_varargs("pl181", map[VE_MMCI], pic[9], pic[10], NULL);
     /* Wire up MMC card detect and read-only signals */
-    qdev_connect_gpio_out(dev, 0,
+    qdev_connect_gpio_out_named(dev, "card-read-only", 0,
                           qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT));
-    qdev_connect_gpio_out(dev, 1,
+    qdev_connect_gpio_out_named(dev, "card-inserted", 0,
                           qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN));
 
     sysbus_create_simple("pl050_keyboard", map[VE_KMI0], pic[12]);
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 86219c851d..ab4cd733a4 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -60,7 +60,8 @@ typedef struct PL181State {
     uint32_t fifo[PL181_FIFO_LEN]; /* TODO use Fifo32 */
     qemu_irq irq[2];
     /* GPIO outputs for 'card is readonly' and 'card inserted' */
-    qemu_irq cardstatus[2];
+    qemu_irq card_readonly;
+    qemu_irq card_inserted;
 } PL181State;
 
 static const VMStateDescription vmstate_pl181 = {
@@ -479,7 +480,7 @@ static void pl181_reset(DeviceState *d)
     s->mask[1] = 0;
 
     /* We can assume our GPIO outputs have been wired up now */
-    sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
+    sd_set_cb(s->card, s->card_readonly, s->card_inserted);
     /* Since we're still using the legacy SD API the card is not plugged
      * into any bus, and we must reset it manually.
      */
@@ -496,7 +497,8 @@ static void pl181_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq[0]);
     sysbus_init_irq(sbd, &s->irq[1]);
-    qdev_init_gpio_out(dev, s->cardstatus, 2);
+    qdev_init_gpio_out_named(dev, &s->card_readonly, "card-read-only", 1);
+    qdev_init_gpio_out_named(dev, &s->card_inserted, "card-inserted", 1);
 }
 
 static void pl181_realize(DeviceState *dev, Error **errp)
-- 
2.21.3

