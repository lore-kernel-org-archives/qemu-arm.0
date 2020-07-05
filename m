Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4356299lfm;
        Sun, 5 Jul 2020 14:34:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiPBcnZDXk8TXFnUh+WGVaxQvAxhjdpXHqOKJVR/JnX91w7ulyqqti27dgXQPZl3O5quBg
X-Received: by 2002:a25:d6cb:: with SMTP id n194mr74802226ybg.278.1593984861534;
        Sun, 05 Jul 2020 14:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593984861; cv=none;
        d=google.com; s=arc-20160816;
        b=uaVlkpEZeRqB3vA56/VSnP3j1dOO1IfADgbiv8maJ2a5q/ULCnBa50B3yD/6fWhc9S
         BgGQbF08U1dtfoNm97drC4yAZPXdJI5u4/OSy/xiFbCUvupkoMIIMnrdp70s5Cqk/Eka
         rara9EzP/5FFeywenIZ42kx/jsDya0GLgd7wuiVSiMzggbuIH2xlX6uCvHTPXI8mDfIB
         oA7jeEr65Q6H3IOYcnI0v8iVQ4pZzmblNaineBuZ0yWJ/OeRcszlOcHSgxg0ExdkkmAO
         v+UqHKfHvaJfb09QY1HyDXoZm3FDJjPO01MI9GX1WqTdpvlsRjEfOWZG6uIM84auAGx8
         S/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oD/cGHO1L2dAn/REvhfoEaPbyPpriZqt2u/rZ5Swncw=;
        b=qAhIKzmbljkDpMpR+tgxNBQn/Cdv0/LzpUU0I6+q2VWuzgaIzkwUvk1UGozpz48Amp
         CfF3xKl9tZcQtTID2pVTlgDN35641ixl3VMZq7nYshACp3RyvEw2H6Wy5ziVWjDEBJj+
         xPw92Dgtl+QtHGj8T72aEpWQm8X7ECUGAuiylrFJNaLcBnTgZVKg1aaW+xiJN4QX/1Fj
         hcGI+Fa+aqJ3BdKuO6p5BeSdqRyo+qK99j2noc9cODttKAyNMwkrz+zhODny9RgE/ToZ
         0tU44Dyv1svWLfRHEDEaAQgi2cLhuZN+S95dtNSbDJdoBpLZHhxU3l3+XkQsS/JmvWva
         oJSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uZbrG0up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si18095928ybg.133.2020.07.05.14.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 14:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uZbrG0up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsCHE-0003Ia-TV
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 17:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsCGs-0002zt-GD; Sun, 05 Jul 2020 17:33:58 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsCGq-0000IY-Vh; Sun, 05 Jul 2020 17:33:58 -0400
Received: by mail-wr1-x441.google.com with SMTP id k6so38848194wrn.3;
 Sun, 05 Jul 2020 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oD/cGHO1L2dAn/REvhfoEaPbyPpriZqt2u/rZ5Swncw=;
 b=uZbrG0upqwK3mUIngWRAVUFF4ItbAbuk1A482M5tDHPkTbvR1WXpeglvT9oTyj+ot0
 6xUJr7PkYEuksjuwGgEk3goArg6wpvtds7ojui30+wFXN8gQjsDJnpC4H2UTNJDwbHs0
 CRC3WXqQeoLfdFq1QakokGi2yfq4WQ4sS+TPD2ThHqPDziiCY5vaUZYGT45OcB8of02t
 vGghpHjObeET10D5ElLPZbyNiLdvBNhTF3uCelUkbCeFbIcGrf7+nKul9ZJW72eXK+Eh
 OORyldv9k1s/3IzUa+Y0zjX1dJiO4mwx0WrVx8vq6oFY9Bn+/IF8XFJiwDQy0tLnQo+a
 XnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oD/cGHO1L2dAn/REvhfoEaPbyPpriZqt2u/rZ5Swncw=;
 b=eZUGeDRleASf/fTjf/N9jTvW2OPgcOmn8v/UjOUU0n4+FcA+BMPYYio/NKHMXV7CTK
 1UTEoZj4mOORRG7JgmVsO+dHyPcND/tmgdkSJjc4nMxV3Gbga32o81jGjrwLbNm5YjN5
 so46OBEqcnXK03bhZ/FhB9j2mPLV6lPGSxnvGdGTp9Iiy7flDNqtLfAFksNP/THLGc4K
 zPXGIaQbHsYR02PMUploBu32EuyloVmoXj43CHatyhPA/fKodny5raeZm0gDFf3SOAKU
 5QyttYiCB8xLbOKxd0KbjNIhdaPCjx/YY5ebnN1YbBH2S65rb+9F+XGY3Y26cGs8+40B
 7ryw==
X-Gm-Message-State: AOAM530840yCSmIYSQRODe9v1Widp/F6czckxacpxixN3MEArdnww5Nr
 2xAGoA4z2iD5W5En77Ns5F+ipe/KfCg=
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr43015163wrx.50.1593984834860; 
 Sun, 05 Jul 2020 14:33:54 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id y77sm11244453wmd.36.2020.07.05.14.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 14:33:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/sd/pxa2xx_mmci: Trivial simplification
Date: Sun,  5 Jul 2020 23:33:50 +0200
Message-Id: <20200705213350.24725-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705213350.24725-1-f4bug@amsat.org>
References: <20200705213350.24725-1-f4bug@amsat.org>
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
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2F8QgHVCoOKF

Avoid declaring PXA2xxMMCIState local variable, return it directly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pxa2xx_mmci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 9482b9212d..2996a2ef17 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -480,10 +480,8 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
 {
     DeviceState *dev;
     SysBusDevice *sbd;
-    PXA2xxMMCIState *s;
 
     dev = qdev_new(TYPE_PXA2XX_MMCI);
-    s = PXA2XX_MMCI(dev);
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
@@ -491,7 +489,7 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
     sysbus_realize_and_unref(sbd, &error_fatal);
 
-    return s;
+    return PXA2XX_MMCI(dev);
 }
 
 static void pxa2xx_mmci_set_inserted(DeviceState *dev, bool inserted)
-- 
2.21.3

