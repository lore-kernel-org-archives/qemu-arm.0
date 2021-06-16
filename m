Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp489671lff;
        Wed, 16 Jun 2021 09:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFDTs3Pzh9g201VClVqMx89Qj4LuH5IFeYhutT5o03quoqvdYrQiPWwDm9GZ9ppX83d9pS
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr204928wrt.281.1623860222697;
        Wed, 16 Jun 2021 09:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860222; cv=none;
        d=google.com; s=arc-20160816;
        b=mBYsxvPcGroDKF5BIT8IAsEQTYqoyziUd+nFFR7JkmkmvBTkm7dHsQ+jdpyHT0TIAE
         mTJ+NAZh75qAfkDMBhqHeoEJu3GA3WswzHajb7G6lZCXhnjRZRE1kxQXqvUBqU67Sc2S
         fa0bq2SLh1SHr/LQRlr6stDa0QQqhqupEyG8nvCu3Hd/2ppQxMA8zEpjYnmeegzg/9eA
         0BJyhF0KoSw6R3H8vVO21c0Mv0CXquRYP5jyb24ufxv2YslI+BAGZn5MLwJ+leZUlCBv
         KxA8ASowfx1VoU8ECRCCTaRRcVRnb+45FuGt7MVlcG1YrjEYkpfw4Xk+ru4FFWKW1ACt
         +5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IvGkr+tAwO3hA7gPKRu0L0jtWmnGl7wWoZ3Svb2df8U=;
        b=0qAJWpfIBD53TbF3fR/bCnaU0RoNNV4RONfI73u3PefvaV508ILKtU8n1O9QbZRVBt
         j6OXMe4/D1/07RuN/yfkeYRRvEHEnCd5/K4+Eefa2ZQwNIDsGVOvRgCkbqMy7wsmlqJQ
         7j3suWQXpnuSXwH2SKLKBkScRr9CEid+6QoIrHrZpAw0vsV3lNwj1Aavy0rcmndmZ0HP
         hlzK8GZ4CcSMIeKuFuBPjgNnGLZpx2CVCsjUPwbf8PCJT3X+dp1ID9xhAXqpl2H7jSYm
         MeZGbiz7plaWyEXkralHfY0j9OvuLHRhKkU75lK5dZrLZ8VrQt7bHRb1XdVJZL4snZpZ
         AMlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZvKCo2dA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si2991844wmi.149.2021.06.16.09.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZvKCo2dA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYDt-0004cm-Ku
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBW-0001Te-Bi; Wed, 16 Jun 2021 12:14:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBU-0005lK-PP; Wed, 16 Jun 2021 12:14:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id d184so1630394wmd.0;
 Wed, 16 Jun 2021 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IvGkr+tAwO3hA7gPKRu0L0jtWmnGl7wWoZ3Svb2df8U=;
 b=ZvKCo2dAikIbcP6OHT6j7qhfU5BsQbaVIg6LppsGv/jSuRjDTp0MCmexoLQiaHitGW
 0Y9+EHu28KPMeNSdyYRAlcDkgzRQgg/q9FvMAtGCgXBihFNwfRsuVNwGTqA7nyYJPY4Q
 ESU+kMfECHkplCG0oF26VR3eRPBTRn4tkl5fGkjQgHMI9wchqJ5h3EG1zckLGzZHQYNx
 jf1iH1J41wSlRPLNRP8Nw/W9lmDrW++hf2TNzMS5ru6Va/+Yvh8eJfHgWf9avarGYWth
 boLsOMzdSP/cGt307oq2V2webdS5fjFVESFHGxvnQwxVF6FNM8/ow+yerQhIpR5msZuC
 Vleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IvGkr+tAwO3hA7gPKRu0L0jtWmnGl7wWoZ3Svb2df8U=;
 b=Hw2SrAHes2xUaE7g4hTud44d6xxlnFfH073R97w9qejk02y4HtjeAJKsA+Ue1vTz00
 WSXsk2DFFhG93otyMOZxUNeG75gfqNaDleZw6unpSuvh/zSrpbt9EfuN4zDw0qoVzB/j
 MhXpjdoxpU2kv6NBYOR8Hv4qnxOTls0hG5vaiBIjyP+SkXs9OpWgenEnRbOsl3o47ei4
 y3FBDpO48Jdu82sZ+Ky2HtfrhRhphD45v2jnplwoICXOO147XwH0k4mdNIYwOunG6ijz
 a5tEl4vJaetdmBRNiimUnxEU+bxNtx58vqY8aJbeVprvcHnCgjZtFrHiIXeCfRY0zyPA
 s6Kg==
X-Gm-Message-State: AOAM531FjfCmEiUQ4/OvmExTtm7iPrMSobiHhtuCEHSgJtYiyz5B7ko4
 0mYHU1tfVH91rHuKrTwmKA0N8SjYm9sK3g==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr749789wme.40.1623860070429; 
 Wed, 16 Jun 2021 09:14:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f12sm3089781wru.81.2021.06.16.09.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] hw/input/lm832x: Define TYPE_LM8323 in public header
Date: Wed, 16 Jun 2021 18:14:07 +0200
Message-Id: <20210616161418.2514095-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: STRIkvQRrAg4

Define TYPE_LM8323 in the public "hw/input/lm832x.h"
header and use it in hw/arm/nseries.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/input/lm832x.h | 4 +++-
 hw/arm/nseries.c          | 2 +-
 hw/input/lm832x.c         | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/input/lm832x.h b/include/hw/input/lm832x.h
index 8e21fb76452..2a58ccf8916 100644
--- a/include/hw/input/lm832x.h
+++ b/include/hw/input/lm832x.h
@@ -19,7 +19,9 @@
  */
 
 #ifndef HW_INPUT_LM832X
-#define HW_INPUT_L
+#define HW_INPUT_LM832X
+
+#define TYPE_LM8323 "lm8323"
 
 void lm832x_key_event(DeviceState *dev, int key, int state);
 
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 7b82b8682e8..3a51264e3cf 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -417,7 +417,7 @@ static void n810_kbd_setup(struct n800_s *s)
     /* Attach the LM8322 keyboard to the I2C bus,
      * should happen in n8x0_i2c_setup and s->kbd be initialised here.  */
     s->kbd = DEVICE(i2c_slave_create_simple(omap_i2c_bus(s->mpu->i2c[0]),
-                                            "lm8323", N810_LM8323_ADDR));
+                                            TYPE_LM8323, N810_LM8323_ADDR));
     qdev_connect_gpio_out(s->kbd, 0, kbd_irq);
 }
 
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index d2b92b457e3..19a646d9bb4 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -28,7 +28,6 @@
 #include "ui/console.h"
 #include "qom/object.h"
 
-#define TYPE_LM8323 "lm8323"
 OBJECT_DECLARE_SIMPLE_TYPE(LM823KbdState, LM8323)
 
 struct LM823KbdState {
-- 
2.31.1

