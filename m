Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp295683ejb;
        Thu, 1 Jun 2023 02:47:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74jDQgdwZKAD/B/xTLsh4GHRoiZFkDeEybFv0gaa5WJ2J/DqrBqxETq5EGe5sCC8vBujCy
X-Received: by 2002:a05:620a:3b96:b0:75b:23a0:deb0 with SMTP id tm22-20020a05620a3b9600b0075b23a0deb0mr6927581qkn.46.1685612825353;
        Thu, 01 Jun 2023 02:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685612825; cv=none;
        d=google.com; s=arc-20160816;
        b=In+kPf/A68SjkMYHIEjYjXcqbhXLyuhZaYuy+yWUbUZAs21WHAsKewMS1Nn3rzpcu0
         4DLnmWSjfykv567M/kd8Nr7p74l+OozMy5ooYn4NCHqTNsqrj0jQK6NphU1QBDHU6srv
         oUvhTyV1y/AXvCy8DIifwo1pgy0VNizdObBjcZpI6SX5JfnEUOAY3t03cKhOLcXTi/JF
         xjlvUqNlaQDM0r1fFsz0IAqopaJZlvfzOd6H1f0wgmq1tOmouTvObaj/LWIISnSA/p1l
         +QiuP7GgYC//+IIY8q1RIBj42/VLg3XEdVUfUHOHo3XIxtGRAqU24sEcitogY4tE4orO
         UK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vY/PoCZ3Ec5EYMAMd5EtE2RxWZcVnX6V92z8a0JGnWI=;
        b=WWi1rfO3QhNmsmAHLBsyBDM0J6DYTRiYsmKBB4/BylcKiMHELTHu43HjgOrKmNgZTL
         pzg3MYdq69Jl1YpFccAPSmlVO/OFLNjiNNhY+TNwnbR5KTTWJHEqKzP8+nqe6Sew6Nwe
         /v5fVwnyFs2rmihwfcvaewkkiXsQ3L7On7VU5kaXLNbMe42vrjZoz0TigYY+59AnyyRf
         0Erhqy4ckQOyqON9Xjw6dvB84ZYkp8oGron1rrnYx1Tqu8w3N0G7b+BaKKWuj27nMBp3
         6xMdNdTpBL+9ULqmdWndir856uqfKaMsR1yxLiJqfh7x0aivtEm/Q7ESbf/v3tuYKz9D
         HI4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xbOS1AhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a37c201000000b0075cbba97e17si8086957qkm.348.2023.06.01.02.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 02:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xbOS1AhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4etB-0004h6-MZ; Thu, 01 Jun 2023 05:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4etA-0004go-KS
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:46:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4et9-0004BW-5b
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:46:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so6954305e9.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612794; x=1688204794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vY/PoCZ3Ec5EYMAMd5EtE2RxWZcVnX6V92z8a0JGnWI=;
 b=xbOS1AhFoorwp4b4xkMClFMty4NklH1wCrWv+kCAtiFdYRyn8TNuqgfafNInrS8SGp
 M0ia6xiUYJK6sOQAPUc5ayfUtQcTOUsVWIA7eIKxtS+F/HIIVTkuZsBfJFimOY6OQAxv
 Mew98DkL9m/WUK/r+SoOfCygw6IUUONs+tXAcl64BGwOgFb2lCyWzRUhKdP8FRTxE7B3
 yMzG4bUosPDD+vEo+x4U1It4gHn81ZJseCqG0Po7ne65TuR80CcIEDpJ9Z4Z5NYTGqs9
 r9Y0aiFPx+mPbT0TEhoKO+CDvl4OMh2ZgWh4tsbDLQOg6tEPj/4IBjxpElfSegibSk68
 j4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612794; x=1688204794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vY/PoCZ3Ec5EYMAMd5EtE2RxWZcVnX6V92z8a0JGnWI=;
 b=a4LNw4ojageVEhu5zWwF/XD5n+eXbXlVQWVlN0diRou20tWQnmpv1HJXVdBXvRg4w8
 G2NLaJTg3PY26rO3VN63jhFcRpDjY7PCNcylvxpOVNhbhRVL+yaz0jpwWVpFT0HUnJdE
 Pei2JuksdDa1Z65AVGPq87HYBmcKUF60JSgduoec8qlLDRKMvRP+vHdPOCvoTpbPln6u
 O0A+7Msf2y+jefdCr8YONb9GJTWItA7uTiQMNzCdqtbmvGa6KESBorWi+cj/1B313iE7
 sybLmzJWFTcbn8MCoB4xuzE0+IpWjPMCOaqQT4NC0FHCvkyXQm6pCeaQYr1jgnA0v1Ls
 ZZLA==
X-Gm-Message-State: AC+VfDz76hU0aEZgyP3yu8IqtlAeal3dixoliPiWW2mZnKLjCIwbFT4p
 trBRQQdP5n+BRH7o+G+F5ht9KA==
X-Received: by 2002:a7b:cd15:0:b0:3f4:21ff:b91f with SMTP id
 f21-20020a7bcd15000000b003f421ffb91fmr1305050wmj.28.1685612793736; 
 Thu, 01 Jun 2023 02:46:33 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c0b4700b003f4f89bc48dsm1709017wmr.15.2023.06.01.02.46.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:46:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/7] hw/arm/xlnx-versal: Do not open-code
 sysbus_connect_irq()
Date: Thu,  1 Jun 2023 11:46:19 +0200
Message-Id: <20230601094625.39569-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230601094625.39569-1-philmd@linaro.org>
References: <20230601094625.39569-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VwmBxFuQe5z0

The SYSBUS_DEVICE_GPIO_IRQ definition should be internal to
the SysBus API. Here we simply open-coded sysbus_connect_irq().
Replace to use the proper API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/xlnx-versal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index db1e0dee6e..79133afa71 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -704,9 +704,7 @@ static void versal_unimp(Versal *s)
                                 gpio_in);
 
     gpio_in = qdev_get_gpio_in_named(DEVICE(s), "irq-parity-imr-dummy", 0);
-    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
-                                SYSBUS_DEVICE_GPIO_IRQ, 0,
-                                gpio_in);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.slcr), 0, gpio_in);
 }
 
 static void versal_realize(DeviceState *dev, Error **errp)
-- 
2.38.1

