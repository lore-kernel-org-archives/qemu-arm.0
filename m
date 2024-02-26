Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1912002ejf;
        Mon, 26 Feb 2024 00:08:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7eHir8TkIj9oJSCmm5dRK77vzZ+ow/+9Y/B3SGdPyRNstHR2NOzyd+XqBfkZGX38lCKD5hmk7mbvncRWsHgERnoGvA6j/
X-Google-Smtp-Source: AGHT+IFXkvkjDEbMrYJLRDu0AyAixBuFpplB5lPgBBhlcvf0hj+XCZSkucaqVeL17rKSgrsecjuh
X-Received: by 2002:a05:622a:307:b0:42e:77b0:e476 with SMTP id q7-20020a05622a030700b0042e77b0e476mr6223121qtw.63.1708934895063;
        Mon, 26 Feb 2024 00:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934895; cv=none;
        d=google.com; s=arc-20160816;
        b=XxyQ5B+VFkRe6TKct9Rk+DxyAyf23Xw6E45sWdIjQc5XXVH0tdNXmxWf+m2XJ2EgmO
         ErNxXnFQshlYvgD9GuAZO+bh1v5WZrEsuNpPXDxxR8MDu3wNSbTfPakdCXIeZMbP8llK
         yw9Z4bi14lhDEg0aHgUdy2p1Re5MeeCOvlC1DyzmntvmzB0o/oXRFIKoHmumOdtBGbFO
         IX+04m8Nue2CQSHbdYafWYt17LCcScT1swParRA+W823m61Bwcm54FExCo9XuPli1sQ2
         ayHptnkZgpRQvmzzCsnWB/Ip/EJDI7vCRX6EVKryLDhZqT1BKEDoY7YqvEAazmJ9AH2c
         MfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TW5vUBh5Q5ZFKmDEE6klQHKiK8fu6o3OGFQfw41qJcU=;
        fh=aca9rmgxlinIxdMK28VrYARx0UGg95c8ASgjU1Eo5Ds=;
        b=yTkQOgvQ7tLNRu4ME7o55AUud26IJtEKTE28nSOob7J1lyLPHnIhk3NWpViIktUai3
         bTco4DNs1NgIv5I1h2WNR8MWuYz1RhbbEE9dhB1JfwAPQ2/n3uCWMa27ZXnxPT+revsJ
         CsAqEKU7h06/mXHod3/UXzo3S6VUeCj9v7n+9QqEp77n3GhudoNtvMsXxSLQof7KsKFj
         Uy+3dQckygvKwkhru5lt5Fs1B49+/drilt7Pmfn8Mv8h8nBdqCEW1C7solEzN7Vp+Neg
         DRcOOqtFB9p6jBg1iL+XOhRiRRSUnlGzyJYjBSXUL2DEBo9UqMk8/CIfSlZXWhti86sa
         npZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnkuiS03;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05621420a300b0068f8b9e1ad4si4592948qvd.388.2024.02.26.00.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:08:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnkuiS03;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reW0g-0004bM-3N; Mon, 26 Feb 2024 03:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0e-0004ad-PQ
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 03:06:48 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0c-0001cU-8M
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 03:06:48 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d28051376eso19479631fa.0
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 00:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708934804; x=1709539604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TW5vUBh5Q5ZFKmDEE6klQHKiK8fu6o3OGFQfw41qJcU=;
 b=dnkuiS03buxQQpV7IkRbudnH6i3SNEk33ahUQLNW86E8Yytgwmfi1Ng9t83TJKSZqC
 EdhXg2JuX0yV+Lq7k+3VvLtOqKxCfHev4oVJH0erlBuhNYdr1YAj4czF9UYHB2kT0/JB
 0CDFrfAj50i11DeOu/lNZ6tnqEqGt+Iuu5I7hhNfQeTUHuo4XRAZ4X1S6sTm4ZQSOkE8
 XubtNTmuZJe8YEh3Z64ZhRhWEm4mQXThogTzyDZHQNlGT9RCbL8kuZb5yE/HGPoQ/qKO
 KiTGUBRb09flanpZDt9x2FFVy5pvPMoV9XdDJP/uxZZ5EmkcCm/eHJxE26EE15Rncnls
 6LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934804; x=1709539604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TW5vUBh5Q5ZFKmDEE6klQHKiK8fu6o3OGFQfw41qJcU=;
 b=Hrs4yZUt4ttsgP8D9byGOel4OoP2ut6mZ3ryj7//z/btB2ZxGcHUhqZxdFKvfapHVi
 n3/IJlRpZS3UQx7VCv0Wlf+SeLRonldpRy1urEHSFGqa7qQG73Nz7XroonQcSUw4NqOb
 UKhotSPbWl3uqtPVQhtcIp9UErhiMiMOsIeP05XlKvtqLwlcyo4NmURtOBnpzS7/4Clk
 SMwb4XmAIKveq1c9XYKws7g5/joyTh3kJIv4CoXWYAvBr4lmghj14HkfS/epSzUOZmlo
 r5qaAw47bEbirwFktfjDf4pI16NpPtgvQeIuPWAj6qohXbc+4bk6LKe3hsF8uV8irS8V
 nLVg==
X-Gm-Message-State: AOJu0YwEozaprml8xsHts+ps0JnUck8ZZ3VMs2Ibn5N18t4WzxqbD6mF
 xpieGGbu8Y1pDWSZRUqP3uwA9G/P3Q+0bogb5T/Zvh8ExMZzQL1cUV4C9e4JZHHquRRJFZFwOXp
 7
X-Received: by 2002:a05:651c:509:b0:2d2:8b07:cca5 with SMTP id
 o9-20020a05651c050900b002d28b07cca5mr1359774ljp.39.1708934804005; 
 Mon, 26 Feb 2024 00:06:44 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a2e8885000000b002d2671dec20sm790389lji.99.2024.02.26.00.06.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 00:06:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-block@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 1/3] hw/arm/sbsa-ref: Do not open-code
 ahci_ide_create_devs()
Date: Mon, 26 Feb 2024 09:06:29 +0100
Message-ID: <20240226080632.9596-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226080632.9596-1-philmd@linaro.org>
References: <20240226080632.9596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pYjN35KYOZra

Use ahci_ide_create_devs() instead of open-coding it.
Not accessing AHCIDevice internals anymore allows to
remove "hw/ide/ahci_internal.h" (which isn't really a
public header).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/sbsa-ref.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 5d3a574664..4a59e2fd37 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -37,7 +37,6 @@
 #include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
-#include "hw/ide/ahci_internal.h"
 #include "hw/ide/ahci-sysbus.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
@@ -571,8 +570,6 @@ static void create_ahci(const SBSAMachineState *sms)
     DeviceState *dev;
     DriveInfo *hd[NUM_SATA_PORTS];
     SysbusAHCIState *sysahci;
-    AHCIState *ahci;
-    int i;
 
     dev = qdev_new("sysbus-ahci");
     qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
@@ -581,14 +578,8 @@ static void create_ahci(const SBSAMachineState *sms)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(sms->gic, irq));
 
     sysahci = SYSBUS_AHCI(dev);
-    ahci = &sysahci->ahci;
     ide_drive_get(hd, ARRAY_SIZE(hd));
-    for (i = 0; i < ahci->ports; i++) {
-        if (hd[i] == NULL) {
-            continue;
-        }
-        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
-    }
+    ahci_ide_create_devs(&sysahci->ahci, hd);
 }
 
 static void create_xhci(const SBSAMachineState *sms)
-- 
2.41.0

