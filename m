Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp490233lfy;
        Fri, 21 Aug 2020 10:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+HlQyS2wLiTkjJtCE2DNufY7BoEy5BnQ1oRTgVvfR8ljwPa3Cu2F8XczC/4OMx+P9psLW
X-Received: by 2002:a25:646:: with SMTP id 67mr5407662ybg.334.1598031329612;
        Fri, 21 Aug 2020 10:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031329; cv=none;
        d=google.com; s=arc-20160816;
        b=AnlVrNY81uUU1q9qN5COkM7/v5DIiHbuTs56M3Y1vLCu0qzf73nHTyyu6i7ApffJNB
         eGzPnNPE9zpvyn0nKZ7lENwQBDOxIiedV3swGG2eNScqnlw6OuMkLONw2db2XuwRlbYK
         dJK1I9hy/xp39oS06iZH3RSMgkHsD+4H5qjfsfOM0tSWnVo7hG9X25sJPe/8pjwHRhir
         euUvM/bgEHfnVGywWz4d6Mid5ihaXAqfbomOOXxYxOdAh8+iczlXnuAIcbuTb4JeS8If
         XxO4cZ0GygRnDo2rc0F9BiPEXA2Jy2eIrHrgwHwE50+jtESqfr6KweU2l7rLOqW6BEsx
         CUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lykAkn6UTO3Stw/k4IPgQ27dBq94/1nvpoZuk0CH5Q8=;
        b=kLh/TTyFMyvX2Fxb+vAE0zLCb94w080Yduwu6EtnNczsGlOfTiZwouDWhyWuOGEvlJ
         qy7butYO8kebkmhqo125NR+WbIWaG6k5GNqCRv38U4z6BwpjSnksL2uir16vo+uw3DX/
         4J+jk8ECtDbVcEAJYw0J6YSWzrdikwK7jhlZKo4d6G8f0hI1M4OPWj0Za+b/Orluev0Z
         8RSox1AEk/D5jlOJryw9TzsMe3TfQalyCMn6pG3pjbbgQ/C+xV5/hgvkJWi2IoM7UDvn
         EQ35VFr0CidR8Jx8OODwrc0Bwlqq16Sd97eM6BobVsePyo/6ywz5MhVStr45LXheeWQy
         W/8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HNK34CCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si2637990ybg.209.2020.08.21.10.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HNK34CCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Awp-0003Yr-Bn
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArB-0001Wf-Sp; Fri, 21 Aug 2020 13:29:39 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar9-0001CT-8k; Fri, 21 Aug 2020 13:29:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id f7so2682047wrw.1;
 Fri, 21 Aug 2020 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lykAkn6UTO3Stw/k4IPgQ27dBq94/1nvpoZuk0CH5Q8=;
 b=HNK34CCmqLr0UOvHsPmHh/a2pJfj54ITiFLI7I7czL4hk8JWY9/Ao5qnFnXZp6jRoW
 qQ7uAWME8GnkpX4Ym9fMkweu9gpESfy5EvEAfzJo+fHFBHpHP3Y7NC4oyNd3KlRRWNDm
 Lvsgp/YiVc21TSmNeYhYQ3oKKyga4r2/b+QdcU1l35ZM3Tq4abEHRqSr0e+r/IJP72on
 9GDK9M9cx/QSmNeHCLS2DuYGS969bdCwl07/q7oxGvLxxTYW+QdjxDo9knZy1gBnY2UO
 5wYc3VCI3pvaWC9ilPQBovzIxmhOZCK9nvhhdGJDHE74fVRMHc2F7luvA/+PEBeTxp5M
 brIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lykAkn6UTO3Stw/k4IPgQ27dBq94/1nvpoZuk0CH5Q8=;
 b=uUhkwfl0cu8yvhqn1IzKKPh7czAwMFU9rzEGnrxRauD8Gc10yfTWTogYuXnPQ6DmmF
 syp6bBn7hcxVxttkMfvHpAjFaRTB+FHfzmrCAzok8gyV8XagnCFgEMjG2+uTvlHWwVkr
 uSmixBo17FK3aXl+j4JosI5fDJVufOvraP/1omEirU51fLDMeRnHs3NvKOvC5ils8m0w
 Rvqa9Xoy1uUtJxDCQGBFdnCCFk3a0iXa8CPjVZsSbkvpr7JRiG84svyQNKv+LkRwe3Aw
 Igwt14ZMPlkitJMmlOA5d59qiBtlaF2yfCYNHHXCLeGq34a8tLqZph3LnymlF6c1R67s
 g95w==
X-Gm-Message-State: AOAM532TNcewIjrdsHTnymQtc8S5ucoHryxnjaA/y/DTBjlzqXqCxQnn
 02nlw9nl9vLhkX/KVPZMP5bULSm/BWc=
X-Received: by 2002:adf:b34a:: with SMTP id k10mr3626495wrd.402.1598030972917; 
 Fri, 21 Aug 2020 10:29:32 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] hw/sd/pl181: Use named GPIOs
Date: Fri, 21 Aug 2020 19:29:02 +0200
Message-Id: <20200821172916.1260954-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HL+I3udU9kvy

To make the code easier to manage/review/use, rename the
cardstatus[0] variable as 'card_readonly' and name the GPIO
"card-read-only".
Similarly with cardstatus[1], renamed as 'card_inserted' and
name its GPIO "card-inserted".

Adapt the users accordingly by using the qdev_init_gpio_out_named()
function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200705204630.4133-6-f4bug@amsat.org>
---
 hw/arm/integratorcp.c | 4 ++--
 hw/arm/realview.c     | 4 ++--
 hw/arm/vexpress.c     | 4 ++--
 hw/sd/pl181.c         | 8 +++++---
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index f304c2b4f03..16c4d750a4f 100644
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
index c1ff172b136..3e2360c261f 100644
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
index 1dc971c34f2..049a0ec2c73 100644
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
index 86219c851d3..ab4cd733a4d 100644
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
2.26.2

