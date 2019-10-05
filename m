Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1803713wrm;
        Sat, 5 Oct 2019 08:48:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyT8cq44z0J4J2lpkJ6PfO5XFcspq8Kof0Lc5B6DO5PmOfGRY/PuU8RCCOXINULOTFFFjBr
X-Received: by 2002:aed:3091:: with SMTP id 17mr22224679qtf.219.1570290516701;
        Sat, 05 Oct 2019 08:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570290516; cv=none;
        d=google.com; s=arc-20160816;
        b=DdEngFySwxOQvDfEy9CDxMYdElOIwBcNjb7MQy1BKTeW363IzzjZgT+xlajCfBrwr3
         m6KajKsUKn4ZyY6T0S4+NSEMi9FBZdWq8BE+IedLgISYU2Wsotk+oQ/fLiXr31xYSzqi
         wQyUjfMbRFubOvmCwemN2LJ9qv2aoO0ymCXZXNTm2CYn1XwEl51CHqmCgSRpVdXAoTBh
         X7Arjz8dYK/ag7KQJPBA5TmZzFe5wcmsQ/ZJ+aNRvCfVA3YOBco3gTLNBx4N0r7OqTSK
         AZAdFuKSIYElcaj7Da365j4Z/h8d+F5vw3VfLGrLAXPU+pfupJQPr1OvnjQaFaV01UtW
         mmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dTLpadbDkv5ZbECq3hhQLZXW2FlV9PLUwUKPlrgWr+I=;
        b=jN5ZxfdLg4d3LKutD4WbxLHxfbQEF1YsB070V4CjZD+vgDU/oH/ELZPk4QTXkTD1uz
         xvUzCC81wd8g8dSnctYqQuXREDAuz2T7LPZ/npCpy2j5Lu3JpFh8LR+hrNkzN92fL/5J
         MV2YKHZWTjYzU6dOlJS57q0DmKUuvLRsWnEbWHu8X6Z6dALTWbOaA2rn9N1b5BN5K+UM
         C/Ua3oXZfzyP4REdbMgae3LgHlzNJi/Fk+H9tPCtZV3dqxVZy09dqbftwe76LaKVTnGC
         hXGItFIljTqNNhYj1xLFDRqmzxtEnmurHyHxoSm5FIXHXeyAqu0L/fdNtSBX6PJD/HGK
         KzBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GPCTy0gw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v186si8744782qkc.37.2019.10.05.08.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 08:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GPCTy0gw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGmIN-0008Me-8D
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 11:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHs-0008LD-Eu
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 11:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHq-00080l-Az
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 11:48:04 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHn-0007z2-C6; Sat, 05 Oct 2019 11:47:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id i16so8509789wmd.3;
 Sat, 05 Oct 2019 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTLpadbDkv5ZbECq3hhQLZXW2FlV9PLUwUKPlrgWr+I=;
 b=GPCTy0gw951EGOqZEvDUJw2NKt1hzuZWalF45US8vgcteH99p39RsYLLuR8wGh+uyS
 25fdx10MGXMJVzoBr+wUJ5MyH9UtIEf33mDVy+LN6gpr2UJzm/6Mj3fayYj6rCtGWl7x
 0r8qkK6wlWGW6dFY8UREkdaKT/Q8mXeIy2lDLGEUxcrkwMaiz492hV+IGsJpQ4kZWNDA
 /IEgooFRoQSmzXC6lBYDYqjy2ff6s981VaY+ZcSN7CnhfBgVGs5o+UqSwPp30OjUFIt5
 ttrZz6lAsIkI5HKGkIeqAnJY920bUnRc4y8eH+GEbxJv/FUn9sbEXCngWrRsBuGu6+19
 RRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dTLpadbDkv5ZbECq3hhQLZXW2FlV9PLUwUKPlrgWr+I=;
 b=X+Cg/nYg+MsicUo+PSS8wpT4LHEYrSZtSRZCW3FZbJUklMdKNqR4o1Q46r6x1N6WK9
 WznMEXmyGOoUYtfZ0u5KFq8OrrRV9ecHR9/om1zFI9mNmlVbvIS+ShIzDEi9ZbcV2MX+
 fTQ2+RrYtMuzRZxtrT+3WdOTEl7Q3lvUJxXeA6NKeaKngq4oZtK58ggFPBBpd/jtxzWH
 dhhg/RmyhyXrXq95i4SMNIOi8xt0/jR0cBpRNOH8FapK000tmqA+BT1Cu4nKk+Hp8i9G
 K1+fllT3OI/vbKnsoz4EG0IkFQS3Q2pQUztn7eQJk/OH7QdICEoD1mWDJ1+BCOhHLjue
 zF+A==
X-Gm-Message-State: APjAAAVu/jZ/zwc+eG2EWU+DUXWj5hwoJ4W7JH5zTO87S8fYY4/N8CiD
 BOIH30vooSi67yZc/+QcdqBfzPSX+Hg=
X-Received: by 2002:a1c:a8d8:: with SMTP id
 r207mr14153461wme.135.1570290478218; 
 Sat, 05 Oct 2019 08:47:58 -0700 (PDT)
Received: from localhost.localdomain (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id o22sm24542294wra.96.2019.10.05.08.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 08:47:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/arm/exynos4210: Use the Samsung s3c SDHCI controller
Date: Sat,  5 Oct 2019 17:47:47 +0200
Message-Id: <20191005154748.21718-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191005154748.21718-1-f4bug@amsat.org>
References: <20191005154748.21718-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Basse?= <contact@fredericb.info>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: up7tjOzAs4bP

The Exynos SoC has specific SDHCI registers. Use the s3c SDHCI
model which handle these specific registers.

This silents the following "SDHC ... not implemented" warnings so
we can focus on the important registers missing:

  $ qemu-system-arm ... -d unimp \
    -append "... root=/dev/mmcblk0 rootfstype=ext4 rw rootwait" \
    -drive file=linux-build-test/rootfs/arm/rootfs-armv5.ext2,if=sd,format=raw
  [...]
  [   25.744858] sdhci: Secure Digital Host Controller Interface driver
  [   25.745862] sdhci: Copyright(c) Pierre Ossman
  [   25.783188] s3c-sdhci 12530000.sdhci: clock source 2: mmc_busclk.2 (12000000 Hz)
  SDHC rd_4b @0x80 not implemented
  SDHC wr_4b @0x80 <- 0x00000020 not implemented
  SDHC wr_4b @0x8c <- 0x00030000 not implemented
  SDHC rd_4b @0x80 not implemented
  SDHC wr_4b @0x80 <- 0xc0004100 not implemented
  SDHC wr_4b @0x84 <- 0x80808080 not implemented
  [   26.013318] mmc0: SDHCI controller on samsung-hsmmc [12530000.sdhci] using ADMA
  [   26.032318] Synopsys Designware Multimedia Card Interface Driver
  [   42.024885] Waiting for root device /dev/mmcblk0...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index a9f8a5c868..77fbe1baab 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -405,7 +405,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
          * public datasheet which is very similar (implementing
          * MMC Specification Version 4.0 being the only difference noted)
          */
-        dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+        dev = qdev_create(NULL, TYPE_S3C_SDHCI);
         qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
 
-- 
2.20.1

