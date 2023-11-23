Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp439416ejj;
        Thu, 23 Nov 2023 06:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNwR//OsM+dssRcvRn0yEjRU6OJUUZW2+AhfiDMy+ATnyoSUJrVOi6SozS8Gzc8IoNB/PX
X-Received: by 2002:a05:6870:31c8:b0:1e9:b599:1aab with SMTP id x8-20020a05687031c800b001e9b5991aabmr6557495oac.58.1700750404373;
        Thu, 23 Nov 2023 06:40:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700750404; cv=none;
        d=google.com; s=arc-20160816;
        b=Jddzjnmp0hecFKqon8zymvXlSaSYCzSMBG6qJhVo9vw7rkD1esedUyQ2c4ZMvFk6xA
         4cw3r1FH9me+Q21OYRnEkFyxPFB7G85gFgez6fwslhnLLK9JQxe6+JYKJHfN0dVRXxo2
         IhAqYypo48NkkM7faexjQu77hWYfaQpyC3vGbRHRlA/j0LEzLMFbazbistHixj32pZYB
         JaAExqcmJZ+sA7gTuwZXnmp6qjPWuIQ9YCiD2iJ9MEj/KFLLQAD6mCKZ90KFa7YJHnpl
         kHHnCVUsYO2KP7yG772H6o58ycRRPIM2ByjZXZFT5CKH9NQukNrOqhHQCgNRhZl4bHUN
         6PyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dGiTJB8vH4At7R/cLAjNpyQTepWZvh1pzfnI30rm26o=;
        fh=xd8Hqo+FyqINTpmMuSlnP3D7Rh8IYP9KQ4AY72o61pU=;
        b=A+revtB6ufj8P+jIVbVhW6smkwwj6qqgRK+QHNjUTNqMwlig9XchZ3y6TdoxCVTsL6
         fprvdsl0IjdVFRpqdfi6wWX6qvsUjDqVKgt6YXLNovgm+rfGF7FjjW/tUIo1Kg62/N1D
         ikFh2G2zXcesRn2yjwqKp0qjAr54JCdcnKjqAWEfElpj0its0BhTSXDM/dhakCFCbjYS
         O44jwuBujIkYfk1LR9Jkh6PSEQEdFsKPinD9+NM8dgXfcttqiVFszdjLp+qyA/xQ1blZ
         EQGqMiz5+c8Lh7CeUVigReup7A5WgZ4mn/XPnZ7hNJkjGZrNp1ATdl7W0SfmFFC4xjJV
         l6Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a4rnnAa7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020a05620a0b0400b0076da614eba1si1200968qkg.170.2023.11.23.06.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 06:40:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a4rnnAa7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6Arm-0002ng-PB; Thu, 23 Nov 2023 09:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6ArH-0002Gw-V9
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:39:13 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6ArE-0002Vr-Vz
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:39:11 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c83d37a492so12016191fa.3
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700750347; x=1701355147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGiTJB8vH4At7R/cLAjNpyQTepWZvh1pzfnI30rm26o=;
 b=a4rnnAa7w1+vrwFNFCdho6mZBoQJx9Cmlz9oa5gkUMbcN46fPNbWuP5vIi5l54KCmz
 O73nY0jl2DnvnUjC0bGF5uaFSKI7ZyVIXJQGEOzEwAOHHKcFhPtYmtRqZEy986WnI8JJ
 LTssH2/8tYEar04i0K7QgopFFnmCHdDzEOkRy+coY/CKl/QFC8bjjJuJ1A4vHNj1YFrC
 uE1xNMqGICKxuxwm+pbF/eYnRkwN2dkIhAKDhEg/pWDCL+z/TUXxg61/SL0tsj4Cg1RO
 XIIwmy4K/yhY7/2X4Ydsqo5u6olDF+bGP3obXWTaF0pg1DuCRxZMJoqStp5gUdB6B520
 iCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700750347; x=1701355147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGiTJB8vH4At7R/cLAjNpyQTepWZvh1pzfnI30rm26o=;
 b=fzY3MqRYqgwiDZOnC9Wp86AIEL4CiSb/QvZBJTI3qv/grjWA+mDB6tTsDwae45Vp9F
 zYDWqLXat9H4lw5I+q5OT8BegOo4GgeumMtWy3B8kDy9s8xAXQqsa3DikpzTHxUTFHdy
 2NFnP0yx32fDhvQF6+ZlFOmWxW2I0jiGfb0wbnuQR3VLsxtIFtq/SwEMlkEdAXy4J1Jr
 wl5PgtOi0w0dghdVTFipazuiSXUuMBVvNEMapYZr/uaajRzpUF/dprueqJuWibB679h7
 4pWgiO9rOc7j4jslGf7EZcUxnpZittSqOUruTd2gvkUqXRiGlStdnJST75454uj6X71F
 EVKA==
X-Gm-Message-State: AOJu0Yzipa9NnQWrXARDTb7+jPJMwrazsTT+WIvDehqIifuyGqfOTCaB
 6mKUe6W85byUNNciVOo14NHTVw==
X-Received: by 2002:a05:651c:19a4:b0:2c8:3888:bbb2 with SMTP id
 bx36-20020a05651c19a400b002c83888bbb2mr4569717ljb.38.1700750347065; 
 Thu, 23 Nov 2023 06:39:07 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c34c500b0040b349c91acsm2922438wmq.16.2023.11.23.06.39.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Nov 2023 06:39:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH-for-9.0 v2 6/8] hw: Simplify uses of qdev_prop_set_bit(dev,
 'start-powered-off')
Date: Thu, 23 Nov 2023 15:38:10 +0100
Message-ID: <20231123143813.42632-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123143813.42632-1-philmd@linaro.org>
References: <20231123143813.42632-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +OdmDkAIZ7qb

Simplify few qdev_prop_set_bit("start-powered-off") and re-indent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/allwinner-h3.c  |  3 +--
 hw/arm/allwinner-r40.c |  3 +--
 hw/arm/bcm2836.c       |  4 ++--
 hw/arm/fsl-imx6.c      |  4 +---
 hw/arm/fsl-imx7.c      | 12 +++++-------
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index f05afddf7e..593244464a 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -251,8 +251,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
          * Disable secondary CPUs. Guest EL3 firmware will start
          * them via CPU reset control registers.
          */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
-                          i > 0);
+        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off", i > 0);
 
         /* All exception levels required */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index a0d367c60d..202a158fb8 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -304,8 +304,7 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
          * Disable secondary CPUs. Guest EL3 firmware will start
          * them via CPU reset control registers.
          */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
-                          i > 0);
+        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off", i > 0);
 
         /* All exception levels required */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 1fdc3be6bb..03e6eb2fb2 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -99,9 +99,9 @@ static void bcm2835_realize(DeviceState *dev, Error **errp)
 
     /* Connect irq/fiq outputs from the interrupt controller. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
-            qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
-            qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
 }
 
 static void bcm2836_realize(DeviceState *dev, Error **errp)
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 17c399a37e..b7f1738a89 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -127,9 +127,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         }
 
         /* All CPU but CPU 0 start in power off mode */
-        if (i) {
-            qdev_prop_set_bit(DEVICE(&s->cpu[i]), "start-powered-off", true);
-        }
+        qdev_prop_set_bit(DEVICE(&s->cpu[i]), "start-powered-off", i > 0);
 
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 3138ffeb08..451801f7e8 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -187,13 +187,11 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                                     &error_abort);
         }
 
-        if (i) {
-            /*
-             * Secondary CPUs start in powered-down state (and can be
-             * powered up via the SRC system reset controller)
-             */
-            qdev_prop_set_bit(DEVICE(o), "start-powered-off", true);
-        }
+        /*
+         * Secondary CPUs start in powered-down state (and can be
+         * powered up via the SRC system reset controller)
+         */
+        qdev_prop_set_bit(DEVICE(o), "start-powered-off", i > 0);
 
         qdev_realize(DEVICE(o), NULL, &error_abort);
     }
-- 
2.41.0

