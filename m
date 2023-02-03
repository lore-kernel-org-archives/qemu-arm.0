Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1463036ejb;
        Fri, 3 Feb 2023 06:57:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+T1E77eaQL7diKpYelLG9+bDQVHm0xfmvHlKTOK42tA3vRc8wMe04HEDwR2AaN21vr7UzG
X-Received: by 2002:a05:6214:1912:b0:561:89bd:342c with SMTP id er18-20020a056214191200b0056189bd342cmr8332549qvb.18.1675436243179;
        Fri, 03 Feb 2023 06:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436243; cv=none;
        d=google.com; s=arc-20160816;
        b=YKxaOL4g9MiditPBSru/hwy1GRGpqWmMqI9G9FnNYOJrark93Gd31VddQwJKjpGh7A
         xyosoG4QskiI8I2Aecdw3S7IA0R2tLlhenzJj5A944O5yMMk8oNd6ZVR6MCFRAnFHNwv
         L/1Cnicxul33Wvj2qoL4oX7xtBzNMAD8WrDV9354IvjMIb5unhFsJOivgaAsyYPv6+Vz
         PDG4z5+pX5Xh0EbkBK+SO70RkLybLxoaXAoVO4DHtvYTjf32sJF7y2zp2tt//OSt0NJW
         5HuQygCLzLcYYG/vx9uVBO0BFqOq1XwUD1PE1gLkyeHrJSW6ntc8SCUHAV7svdMyvteW
         PoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B9zIETZDw8AzAYdvOUdcE4GWKCA1zFcGWd3/PyGieuU=;
        b=OdWloCjfpG0OlqC70NJSJRHSwWSkEYrnWlDu2YPO4knEHmAYSuUlnhXj3qB/NQRwyn
         Bfi8nyseSzU6ieOjPq0UXp44OCMvJlZvIKr6z96BXLoqUUr3w5sVdFhBy309QcoBypaw
         40SrnHOIF0o4tpnIa/c9ZawvLdRkuEOef0luXubzizyNp+IH2c/AdxvrLfC0+6YQYrAK
         SU0sVsSbV70D2wgF1g5q5htmHXwKpog30rvXSoVvyb0Vy324I5ct24PEhFmbOVDl6gaZ
         S/SM6c1p61UAYidaTTAO7dUqiricsJ4Oqp6QEjGzNUzHdwB1dxGC5kKuqPquRTDShQb5
         +bHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTmP2R7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id og10-20020a056214428a00b0053d79015256si1857795qvb.47.2023.02.03.06.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTmP2R7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxU5-0002FX-Fn; Fri, 03 Feb 2023 09:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxU3-00029X-Qu
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxU2-0005wC-8J
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id k16so4070680wms.2
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9zIETZDw8AzAYdvOUdcE4GWKCA1zFcGWd3/PyGieuU=;
 b=pTmP2R7B+z3eAJyd3o7EP53hEHnMbEhT84NZtKZwHlAz9ttqI/z/DmEyUTgurqhh2V
 zGBMtS0GEt0auuCAQL0m8tP0Lp4Qk8+4vJzHmNwWSWWpdYqXXHZkGmXZlDvvewCzyujF
 DWUHfZ0w7ZprzF7Ux9bA9IvTR4RgYvKCl/gtJWQauqPb1d9pyWMXUIrCTOWzl4lL41RY
 wUHyyXN8DnHGFHUFOdqBEGGS3h3lbridfsAwaG3NaHzxfH0UxoagYe0o1SWznXFo2cni
 D0XXC6sSNc+zQetYEMVAFet7mzYDeJvDLt6VEH3ml3zhfvW/dFslzqE3ODRAiprAVa8k
 1XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9zIETZDw8AzAYdvOUdcE4GWKCA1zFcGWd3/PyGieuU=;
 b=bhzub9qBwFtP8IQTVNJJ5SNjnyvAIWJY6cjSgBK3Nr1hhtk3KY+bUZS0q5ani1/aH/
 5gwd/ZOo4cLhihJGGDkHK51U/BcBuv8Qh8CeZKWZo+CIzZutkzGEbG5Qmnp47C0/8Zcm
 PfBP9dxz9a9ngYNfxNlvo1QnJdyB2cCZ4Hp98zlEuQEmHUrddjt1OBJ16rirASXPdVse
 Fc7zjozJRJGrCggdpGQ/q+iSRjQFcmulGkB4ywXZSPzTjtOl1rylfjFFEQQPLyIg6gjV
 afNoVmBUK4EhA2IACROz0oHKOaZKOAgAAzJyGC+FIshoDL4IMEgDNVN3btGfkaQykTh7
 OZ0A==
X-Gm-Message-State: AO0yUKXtW8fTnNCQEfwvKyI6cPrgdXtFRkUuaVMZ0wWBXed3zgunk3Oi
 BUufMuDaPXdZ8lRed3pOOzOqgw==
X-Received: by 2002:a05:600c:46ce:b0:3df:e1d1:e14c with SMTP id
 q14-20020a05600c46ce00b003dfe1d1e14cmr6897203wmo.20.1675436169010; 
 Fri, 03 Feb 2023 06:56:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b003dc433bb5e1sm3251692wmo.9.2023.02.03.06.56.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 06/15] hw/ppc/sam460ex: Correctly set MAL properties
Date: Fri,  3 Feb 2023 15:55:27 +0100
Message-Id: <20230203145536.17585-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5rf76bwywAOY

MAL properties are declared as uint8_t:

  static Property ppc4xx_mal_properties[] = {
      DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
      DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
      DEFINE_PROP_END_OF_LIST(),
  };

Correct the API use by setting the property using
qdev_prop_set_uint8(). No behavioral change.

Fixes: da116a8aab ("ppc/ppc405: QOM'ify MAL")
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..cf065aae0e 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -389,8 +389,8 @@ static void sam460ex_init(MachineState *machine)
 
     /* MAL */
     dev = qdev_new(TYPE_PPC4xx_MAL);
-    qdev_prop_set_uint32(dev, "txc-num", 4);
-    qdev_prop_set_uint32(dev, "rxc-num", 16);
+    qdev_prop_set_uint8(dev, "txc-num", 4);
+    qdev_prop_set_uint8(dev, "rxc-num", 16);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
     sbdev = SYS_BUS_DEVICE(dev);
-- 
2.38.1

