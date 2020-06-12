Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp643470lfc;
        Fri, 12 Jun 2020 10:57:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Ig4+bBgyPnmQMEikKDVUx/91Cy2a36iKflbV3ifb2wUvpkPohTTNWi0Q9qP/iW3W2W5d
X-Received: by 2002:a25:d90:: with SMTP id 138mr24456105ybn.19.1591984632533;
        Fri, 12 Jun 2020 10:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591984632; cv=none;
        d=google.com; s=arc-20160816;
        b=idK5UWTLHX6Ial22NU914nluIJp1hxq259Z6+mwNYn1RUjM+QM9E8U6oFyDTNMOK7O
         b9PDDtZPKK/94+7FIf40/K4JQXlXu/smAdpfriMKtg3L7KohMrqtFRw5wc2k4kNiAKMB
         9V/FziqU0BTqfDeSOC80ZhPvHujwZceFKZIP6slacYUPAf3MLjSgMG9ur0xP5FurFSGT
         htrnYnYXmhYb0bW81t7IT6AFizlQypqLq8R9JN5hyf5NJ+s/aVto7OQ5u4E/9S5C55Z3
         VXJBU71bEHQsPx2UH1uIy7iuZHGwvpfAwlvDdud5I+WsqLMVSXLkZ06t5o0hfClcccje
         dkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oEq0TkRWvRrnUcFx8Wkpo5gILqhLeSIEML9csKX17G0=;
        b=kSpgY7UzFBPnMzTwJwjgL+pvNWAuzGJ82IrZq/8422VfaYtEupwNKxtb/dKAEcYOsK
         cugVJtY4zXx7onZs9Iy/qgzqm9T4e30D3eh6waq2w1Aj9OoNToc09A3KvKSQQwRxTFIV
         4rLDX57d5sF8SeTJ/wUOglIGrNl3b6T3BtVL/L/QsEF/cYw7IWzGe6Ga2ND/dTw2d/+F
         9kh0huc80hmOdqnEGHt77mTCQR5LhdZmSOurXq5ly6we5WYt/V3W5JUdLNSnZfvy6HuX
         C3ITuKhUSBhwBQMWkSbA3TgGYU7dP0i++i0T6V69QqMgfJ2e4uoc4kXZJ16nvvlzQSMs
         yjjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tSls7Xr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si5559871yba.198.2020.06.12.10.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jun 2020 10:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tSls7Xr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjnvT-0002Dw-QW
	for alex.bennee@linaro.org; Fri, 12 Jun 2020 13:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjntT-0006u2-AN; Fri, 12 Jun 2020 13:55:07 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35311)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjntR-0004Cg-PU; Fri, 12 Jun 2020 13:55:06 -0400
Received: by mail-wm1-x344.google.com with SMTP id q25so9089779wmj.0;
 Fri, 12 Jun 2020 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEq0TkRWvRrnUcFx8Wkpo5gILqhLeSIEML9csKX17G0=;
 b=tSls7Xr5NRKPwqv8Uq1rteK3FiLDw0JpmsDJBUlOqLAVB07fOIo/2FW1zhQyLP9mCP
 N9RAN6zh4XnwRZ4hBy+MV/pL74wlStmb8tVZnBcrEjXQSZc8Xjv4UqiMht8d3/3axt7t
 2dAVOnns/s6fVtGpzUkpCEXp2QxHpiD1KobI6g/31cA77cne5VgR+GYJgYrYaccNRUFW
 jpuVrWm8neM9sUCQZ86zJLmg6cx1UX+Xtwc1RVcBzHLMxS1HsAL9iB/gAPE+zwJET6as
 SW8s9eIBz/CW8QK0IC8vF9EYs5SiJA1y5A+9JoJztSeIFO3ZPgNUC8Kf3MnTQJ5Qaay+
 2/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oEq0TkRWvRrnUcFx8Wkpo5gILqhLeSIEML9csKX17G0=;
 b=WchU8aXLnAX7gddi5DWMZpnaxgv0L935OAm98n8B3q9EA7IyB4U313C4ftyScqPufh
 OKkrWoQ70viq5wt3i9dF38WWb83w77SNx0o5apvsXvtPOP3UztvXaZEbzwVEVPAupwm6
 hBJRCKxHAt65RvqJjIba/Xc2ZTvXQnc5wYHVVFWx9lezSwSMUR3nFqVKSIxwnuw/7ZW9
 BOlolduzty94+woE9YxZsg8zwZaO2KlKpvTPPoqgwExiourTxtie2Q30eY9eAAPww1Y/
 me1jvBNAmSKRHP+3FqzrEMAi1ST6yHWtAAeIEmOKthNsmUC424ewPIgIJPmVbjl31cmd
 BlAw==
X-Gm-Message-State: AOAM5330zlyC6Qgl+T6umrt4q+PXFT6Uw8dQiRqJpwFOs5br7g6U5ECC
 cHZjf2ORj9LLMJX8wTj6P58+TrBC
X-Received: by 2002:a1c:ddc1:: with SMTP id u184mr74492wmg.115.1591984491897; 
 Fri, 12 Jun 2020 10:54:51 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e12sm11288658wro.52.2020.06.12.10.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 10:54:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/5] hw/arm/tosa: Use LED device for the Bluetooth led
Date: Fri, 12 Jun 2020 19:54:40 +0200
Message-Id: <20200612175440.9901-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200612175440.9901-1-f4bug@amsat.org>
References: <20200612175440.9901-1-f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wUtAHPJhI1pu

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/tosa.c  | 7 +++----
 hw/arm/Kconfig | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 5dee2d76c6..86d7e0283a 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -24,6 +24,7 @@
 #include "hw/irq.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
+#include "hw/misc/led.h"
 #include "exec/address-spaces.h"
 
 #define TOSA_RAM    0x04000000
@@ -68,9 +69,6 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
 static void tosa_out_switch(void *opaque, int line, int level)
 {
     switch (line) {
-        case 0:
-            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
-            break;
         case 1:
             fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
             break;
@@ -119,7 +117,6 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
                         qdev_get_gpio_in(cpu->gpio, TOSA_GPIO_JC_CF_IRQ),
                         NULL);
 
-    qdev_connect_gpio_out(scp1, TOSA_GPIO_BT_LED, outsignals[0]);
     qdev_connect_gpio_out(scp1, TOSA_GPIO_NOTE_LED, outsignals[1]);
     qdev_connect_gpio_out(scp1, TOSA_GPIO_CHRG_ERR_LED, outsignals[2]);
     qdev_connect_gpio_out(scp1, TOSA_GPIO_WLAN_LED, outsignals[3]);
@@ -234,6 +231,8 @@ static void tosa_init(MachineState *machine)
 
     scp0 = sysbus_create_simple("scoop", 0x08800000, NULL);
     scp1 = sysbus_create_simple("scoop", 0x14800040, NULL);
+    create_led_by_gpio_id(OBJECT(machine), DEVICE(scp1),
+                          TOSA_GPIO_BT_LED, "blue LED");
 
     tosa_gpio_setup(mpu, scp0, scp1, tmio);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2afaa7c8e9..009336cac8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -150,6 +150,7 @@ config TOSA
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
+    select LED
 
 config SPITZ
     bool
-- 
2.21.3

