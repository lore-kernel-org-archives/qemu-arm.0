Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp451022lfc;
        Tue, 9 Jun 2020 05:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtOK+AbNbcFgDy2fLbAM4QHopXSHEW5tP2nIXRIKCSMfFjnfaJ42uuJKDiqSFebEiWSNpi
X-Received: by 2002:a67:e11b:: with SMTP id d27mr2816846vsl.177.1591706649358;
        Tue, 09 Jun 2020 05:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591706649; cv=none;
        d=google.com; s=arc-20160816;
        b=RcTrradrd5Vojffnr75Nrs0WdKAblGpZ+L24FrAUR6MiAIVlC30R9BMIkhjhETVuz/
         qbntiscN4lPj2jYbM6iZekrBJJM49qFuBqRYjIjrME6euqFJzKo3tiXSEnlhMHuUOkEK
         FN3r4vFM8fSjJqysvAX6dX4GFNKsg+z0K1+WbLIe1EqxcJtfEIi1RafdZZqvAQ/LFWCy
         3U6PUWIjB9HagnjumQg97EbwlZy0WtTI33zk02aL8HC74ez/vFVOr8v4Sp2L9UX2UG9x
         bknzdxXzjSHh9Wp3W4VD1brkr2+799vSPeqohi9cBUMk2nxQ6hBv3PHeXC1jowU7jwT9
         tpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oEq0TkRWvRrnUcFx8Wkpo5gILqhLeSIEML9csKX17G0=;
        b=AjU+1GBGiZM8eJMzuuGSeYRseyQeJFCW39wVyavZ3O0QRiGFvHxz6EYhYdj6rnoNFD
         KxHmGDayAUD/K39/W9ieMxuP/Gw/TtNwRe3Z3eOnofRZMO2tkzysy4CWwctR5uebrKFW
         atboW+n3Jrivw724fdh7lbSlCMEWv4ztVk453YD9g1ls+TZs4OJQodLLb9essZrvy8dr
         uNStnaemZfpAOOHlDldfjNBUXbZRuvQRnZNEQp5kUzTcsxGTPpUq/VX8YOvaaVxwnJHo
         LZpUEH3OjN9B1H1r5/3+rVxY6rZfOsRdwMXr5Y6rgJ/Ev8bdwHWRVzIYr/w0VtfXVPlk
         L3vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rvbccWKE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10si261448vso.165.2020.06.09.05.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rvbccWKE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidbs-0004u9-Ik
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jidSl-0000Kh-Cx; Tue, 09 Jun 2020 08:34:47 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jidSe-00074q-JD; Tue, 09 Jun 2020 08:34:43 -0400
Received: by mail-wm1-x342.google.com with SMTP id y20so2978780wmi.2;
 Tue, 09 Jun 2020 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEq0TkRWvRrnUcFx8Wkpo5gILqhLeSIEML9csKX17G0=;
 b=rvbccWKE3d+cDt/172b58PZ+gdd6E5JYTEQHgPimsvA4PwpQO8r7Vn5HvhUgvBM3bQ
 4ppf/EBX3LqRCPMX335r4gQGV2286aKt+eFZbris7I1K+cPLsAseuUVGyx/rWMtiicvn
 AaZ8gMHJgypjDvqEcVuOtVFWCKNAiXI6/n7z28Yro48n4bJ6bQ2vPjbMGMcL09QJhSEC
 pXF+N/TfnG7N9JWLku0mUUQnDtDAMWSO6I1RM/YRFi9mlDukxQdr5OAEdY+D51yDaske
 iiNeNp4ZP7vtNV8MXw2lvThYup9RqB3Tr87jMtT8KJRVokfYzHv/JBjB555AcGAQpOUg
 6ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oEq0TkRWvRrnUcFx8Wkpo5gILqhLeSIEML9csKX17G0=;
 b=OJWGL8wURDEJlpuhSXVys44gZ2069JTuSCdi/6TK0FGQ0VkXzuvCikKIe73LZ26lKf
 bDf7xshINlw9c+GXfcCILNSyvPKknyrVb2OCNZYIre3exjB8U1x/3dSObK1QyEh4tJbl
 B+6W2Xzb4jzYyQ0ccAvN0A7GanRJIKKhl6/B6m01ATzNSLGZJOlevJeCq+hW2UecS5gW
 ypWzTvyzwnW5mJyFPf2et1p1dhTTtUNp3si7JVYIiariu5OmokcG+GEl/fllJOlTW9QM
 1Z0a5pjW45IgmJqMIMjX2ylXDYQo/zMhMY/RE8F+q29GsWtTaSa9M0TlHVgvgbAPuHPp
 t/MA==
X-Gm-Message-State: AOAM533l1s08hpTzu6AI1adZ03ym4okRi+Xy41fOz4R9TfKjXiEOMycj
 CHoJHp0/NVCRp33D4dmyg8iguzU3
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr4013337wmk.91.1591706072771; 
 Tue, 09 Jun 2020 05:34:32 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c81sm2920931wmd.42.2020.06.09.05.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 05:34:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/5] hw/arm/tosa: Use LED device for the Bluetooth led
Date: Tue,  9 Jun 2020 14:34:25 +0200
Message-Id: <20200609123425.6921-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200609123425.6921-1-f4bug@amsat.org>
References: <20200609123425.6921-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rj5PP53SoLwk

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

