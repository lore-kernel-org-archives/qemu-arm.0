Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500064njf;
        Tue, 3 Sep 2024 09:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrUdwpwwN0e6dX0IgA9ocEd5taajrFe2DPy4zsTNheWRRrX1V7XsidR2bQNyqFrLfHnToIZ24UqJWh0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHPJ9kAfrZXJz/PTz2Pb+zKVK6wU9dPGbj4KY0zVMjyoBxvfEdxinjOAU70IoUw4NywUG0a
X-Received: by 2002:a05:6214:4610:b0:6c3:66f2:a640 with SMTP id 6a1803df08f44-6c366f2a787mr95052796d6.31.1725379742156;
        Tue, 03 Sep 2024 09:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379742; cv=none;
        d=google.com; s=arc-20160816;
        b=WihIBsQ5XH84Efy0lkqo8xdZN/up/N7o2FVg2r0wuMINUNeFB6Qsm4e4Cgsf41RT8r
         8x2M63lZmjNWA04g9DLMbRxtvo1lW5C9mmx4zQkUrJew+47nFEzSj2+nUco7yCjtty3/
         DSnaXsFFbHN4RUutFSv/aEtVUSUIg2DZ64X0G90jdXTXPX3Spba/77yuOJ4nBbsba7hy
         mUtP8jtcRCMA8jlS/YJxTcQfA3yR0YZXyPLPN8jm5j59kLw9dnObwKNPX3V6ilV8zTCv
         Y5yYsolt3t0Hj2qT2BXbPrJokxDdVN61SD5Q5mm/H2RnXQOcuYy7IJpcqitybv2NNFJl
         FojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qIgySZe6cMgEDvvjEPG6NKleQ03CSEs1d9HS7DIWK3k=;
        fh=0/qZZbrKzKv1pAisJgIzF4m3ZRA9HCtrQrlALIhcgns=;
        b=cQ0T7ILvZoUYPeYipkeaFHLlstV8BKc/nVzf19N7WkjrcqclVkoLmi37CkYFpHoYhu
         Mgi+chfqmrL7K1nxhrAMBvV25lxVlP0jcM5YBNO66+PqKYhIHUBzYMh2sihJuh5MjHAH
         JPYd/bmxcnbzQDzp8UrrOTK1XcajiWuqL5OrMKO0nqVnvk0XA5bRq6oXW10cAattZbJV
         Gu5PjQEMplBWv/CKy91QqCUqcY/5Ibp6ifPwrQTbXjmp5YRaZ5FajFF15CE+i3CuusvI
         VDMIrknuLa8hzZrMi9PsPCkUk2HAi1Gh40qYWH9+J3t5noKiuKjgL/TU+oxqNT4ykLQQ
         tdkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJvK2eCP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35390b88asi95568106d6.21.2024.09.03.09.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJvK2eCP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slW59-0007GY-NR; Tue, 03 Sep 2024 12:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW58-00078R-5V
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 12:08:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW53-0002of-Hs
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 12:08:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42bb72a5e0bso48712475e9.1
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2024 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379712; x=1725984512; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qIgySZe6cMgEDvvjEPG6NKleQ03CSEs1d9HS7DIWK3k=;
 b=xJvK2eCPT0vWJ2j+7zptTcDAHuOCl9VR11C4ejmsd4jzSBWcEMOdGPwDJzVEcodpXj
 z6cZyNSos9sk//vnBgGm3jtswjP7UO+JwGXGXlyBnR9PYsTZjHDJYu/cL6ZBpNXl6iVK
 hCVmbhjyLi6VVOim4BVRe1OvFDqlcy7e7I98d6/vXRVbxlEp5Z54YDL3ztHC7J11vsON
 L03YL6ndAHE/en8BdtbNw8Wt8BmGe3GCugYKHd6v0cggQFE9nDOA7s+whw8JYaI+i7jg
 dG0yUgpjszKhl3lpeZqkCfHXhplX5rJxDauc5+l0VfbErc6SyhlDpFTIfEJzt9uDOds1
 wjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379712; x=1725984512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIgySZe6cMgEDvvjEPG6NKleQ03CSEs1d9HS7DIWK3k=;
 b=rVa7BQNbD1q4VqE8FAcZUSHXMDHA+WoTWG9Vz1lTcggR4shqxky+W5SbcBQyHOVULD
 RWgiZxZv18tA6i0PFeAoLL0/lfihWlOgzwI9Ig4WyoOuIPHlZLDAIkbsgcuYLxIttCmw
 imxUL9ISz1zJkOjlb0tJitZnFFieD5Yl0wSMc4gytYiF38ATz3wuCUhwre+RSoA4W9fR
 ZIMaqj5kft4E9pjaZGO0DI4rvd7qHQ+rX4/cajgJQ4gpy8LtkDo1LQZlskyl3WRpZvNA
 Es9ibafJeUpphu2xC54uYG0Uu0gJ3tbzn8N0o3X8jKXGyrFiWFn2BOVxq1tc1t4J7QqG
 gOTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM0QiuzBwHgvKko7/Klg20pkk5THzfYfJWl3Yc7JYRogtUrvbfeTJwki6uq1to09MYwVdqts+ICu27@nongnu.org
X-Gm-Message-State: AOJu0YzoNS2O373e23UTG10tI5JzIBX2uHCfvgSY9GHPygFC3856LPEa
 RYUUh3EqOhSNvTOR0ENipsdtslOgNLZhkA5hcU4zo82K4hM6XrpMADgMM1jEb+Y=
X-Received: by 2002:a05:600c:1c83:b0:426:5440:8541 with SMTP id
 5b1f17b1804b1-42bb01e5f83mr132661895e9.27.1725379712146; 
 Tue, 03 Sep 2024 09:08:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 23/53] hw/timer: Remove pxa27x-timer
Date: Tue,  3 Sep 2024 17:07:21 +0100
Message-Id: <20240903160751.4100218-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yHoZJw6XFnR+

The pxa27x-timer can be removed now we have removed the PXA2xx
SoC models. The pxa25x-timer device must remain as it is still
used by strongarm.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/pxa2xx_timer.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index d1a3ecac2b5..3234bbb1f4a 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -54,7 +54,6 @@
 #define OSNR	0x20
 
 #define PXA25X_FREQ	3686400	/* 3.6864 MHz */
-#define PXA27X_FREQ	3250000	/* 3.25 MHz */
 
 static int pxa2xx_timer4_freq[8] = {
     [0] = 0,
@@ -572,28 +571,6 @@ static const TypeInfo pxa25x_timer_dev_info = {
     .class_init    = pxa25x_timer_dev_class_init,
 };
 
-static Property pxa27x_timer_dev_properties[] = {
-    DEFINE_PROP_UINT32("freq", PXA2xxTimerInfo, freq, PXA27X_FREQ),
-    DEFINE_PROP_BIT("tm4", PXA2xxTimerInfo, flags,
-                    PXA2XX_TIMER_HAVE_TM4, true),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pxa27x_timer_dev_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->desc = "PXA27x timer";
-    device_class_set_props(dc, pxa27x_timer_dev_properties);
-}
-
-static const TypeInfo pxa27x_timer_dev_info = {
-    .name          = "pxa27x-timer",
-    .parent        = TYPE_PXA2XX_TIMER,
-    .instance_size = sizeof(PXA2xxTimerInfo),
-    .class_init    = pxa27x_timer_dev_class_init,
-};
-
 static void pxa2xx_timer_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -615,7 +592,6 @@ static void pxa2xx_timer_register_types(void)
 {
     type_register_static(&pxa2xx_timer_type_info);
     type_register_static(&pxa25x_timer_dev_info);
-    type_register_static(&pxa27x_timer_dev_info);
 }
 
 type_init(pxa2xx_timer_register_types)
-- 
2.34.1

