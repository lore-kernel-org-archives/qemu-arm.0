Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1456094njl;
        Thu, 3 Oct 2024 07:00:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtTrTJCR4yh9Z2v12kxYAyLKIo/lrT4epB280D8rDhmUTdl82duAntZORY+WdOpnHz3+kSp3nZNLW78A==@linaro.org
X-Google-Smtp-Source: AGHT+IELxdl8MvDyv6oA5vWZDJuftrORlYTUTCDME8tl2bltQwo1g3vG2ZGoGqed5opB/xFtRdA+
X-Received: by 2002:a05:6122:91d:b0:507:90d1:e91e with SMTP id 71dfb90a1353d-50c58209e49mr4956981e0c.10.1727964051272;
        Thu, 03 Oct 2024 07:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727964051; cv=none;
        d=google.com; s=arc-20240605;
        b=hsgQVrg3rTRFZp8pq+YAN1azcTJbOWNqKLgpNNVfGFgStErUemj2eRDPxDwd7w51IG
         qRZaVKQthO8K4G1uspwSu06QGy1zg4ohFBfQKt762qmth4tz0aC1gc5HbOjTmMuUdWdm
         pKzei3aK1uh3LbrTmmFek34wNHDIpbnl57l4IQq35aX6Rj4kuTozR/3uub0HBDui1cQ+
         siHMwgRMTdXnROavKtcuJWtbAPOtyLeRle8yg9H0gMTnACrpZVEAqRj27SSDAWxOxXAl
         cCTo52lune5rOp+Cws5p+uq4bcxffUeLoyyFMqaNdGGfD0GosIRsYYoCvqwDIeAwRPUk
         KHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pv5cgA5tzehOzZwhcqZ8BLb8c5W4q5Yxc57Fkm02PHw=;
        fh=dLP/YLBjMZxhHfH1sS7Ziu5zNyswdPoi/by3dAcRF0o=;
        b=g1sQGHK6hGSkv/4os9KehGXvv0tY5eTkdDFJr3FGJVib22yTXtlCCfj6EM/HLoj9gj
         pbcZGcmlM9N2HxFpc7ssp384zmkob6fYNbcojSpb15tTJAbZSftUe6urZ84QGQXO8lkU
         TQPiB9TgIk/JnpUy1TDTJwpenhdZqIVr+U9QD4otJxQ3XMFeNP8hUfRgvkpq8srsE2KQ
         7p+vmbyP61c2+SYTppAWSf6ZI7m1WA2jp99mRaTt5+w85ifVkhf5ya/6Zx5lK3bNfh6o
         JBNbSzScQlF5idK/QtjCX/foOx1FKK9prMHWLO1tHmXRvN2hJ3YjIT3ouCEOq2qV4PxK
         yO+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jlH4uxJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50c72d14b54si204213e0c.323.2024.10.03.07.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 07:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jlH4uxJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swMNR-000472-3t; Thu, 03 Oct 2024 10:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMNN-00046b-Bu
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:00:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMNK-0002qg-1u
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:00:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37cdb42b29dso697059f8f.0
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727964012; x=1728568812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pv5cgA5tzehOzZwhcqZ8BLb8c5W4q5Yxc57Fkm02PHw=;
 b=jlH4uxJjZwzeD4eCeQGQkwjo2S6US9lqh/lubGv2ipoY9BNwiZtJbCIFiZYVIv4rdG
 mjYC6lNgFMUii+NT5XxRgECDAWoz5AZhWvpIjVN/5LTpeCmWFCBR+6Lp8uaTUzqUfGL3
 VAXWQ2k05gAKmCrybaGCoeszhxGoXR5ksJy7TMGyup2SBKFNvgH1XrAdbOBw8UmApOtW
 sKL8YilT6sTtls+nAkMoa3Uq3GSD6z1UkzORB0JAAflEvhrxKlnzNvWEJPA5cs3xNCH2
 HqIlvfNo1v6fYNEuKAJf0/8Q10cU0Eg4fCEoF8bkJNQvtlsLvC22Bwhsc4H5wMHTjnzE
 Enug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727964012; x=1728568812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pv5cgA5tzehOzZwhcqZ8BLb8c5W4q5Yxc57Fkm02PHw=;
 b=Xnf5Ajs/eQ7ym6qPNtUruQGGs7wY2pYWk//f7Zj+7/2CbWhq027YN+8g2K4HHdG7Uh
 +BNG4ITHBDNfYh5MA79iRXCAniQ/yAX9QXLbhBJb9CApRcqayZ8KOOMzGl+9dxHwhTDQ
 UzEo/yHrEUq/iwwjnOI0ht08JHd5s1w8qhFd30fsl/XexIT1/9gv9vAE28SoZVAhFcvq
 EgqCOZCzng+ulvcdsmg318HRVZOW9HbmxVUT17Cxhi4JpPVpb3b0besmT2u82F+jzP3/
 F/cdiLuN9BtXkeNuoRDbjyHfxOajTwlUwVNExsfdHuHr9X8V14Yr4ferLzLm/JAttnXa
 bVdQ==
X-Gm-Message-State: AOJu0YwrjaFZD33GrVVh5XWM0CejIrbog36boUEZJU/LdZCnxqUZVqZV
 0939S+icevEcEqEpjDPAD1FdJE1R9P1+X7Sj+FC8l1uoF0rvmooC62n6vh4jQqLN6IRVivOUhUq
 P
X-Received: by 2002:a5d:584c:0:b0:377:6073:48df with SMTP id
 ffacd0b85a97d-37cfba1832amr5298622f8f.58.1727964012190; 
 Thu, 03 Oct 2024 07:00:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d0822bc38sm1340255f8f.45.2024.10.03.07.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:00:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/6] arm: drop last bits from deprecated boards
Date: Thu,  3 Oct 2024 15:00:04 +0100
Message-Id: <20241003140010.1653808-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: baaRAMWAkvrr

This series is the remaining patches not yet applied from my "arm:
Drop deprecated boards" series; this is essentially the device
removals which didn't get review in that series and/or which had some
discussion about whether we should remove them.

To summarise the remaining removals:

 * max1110 and max1111 are SSI devices so in theory could be
   created by users on the command line. However I found no
   evidence of doing this when I did a web search for
   "device max1110", and the utility of doing so is unclear
   to me since it's not possible for the command line device
   to have its ADC inputs or its interrupt line output
   wired up to anything.
 * max7310 is an I2C GPIO controller, so it has the same
   "in theory a user could create this on the command line
   but in practice it's pretty useless because there's no
   way to wire up the GPIO lines to anything" status.
 * the microdrive device can only be used with our PCMCIA
   bus emulation, and we no longer have any boards using
   that, so I think these are uncontroversially deleteable.
   Some boards we still have should in theory have a
   PCMCIA controller (strongarm, kzm, sh7750), but we don't
   model those controllers and none of those boards are
   sufficiently interesting or active that it's likely
   anybody will ever add one.
 * The ECC code is entirely unused now; this is an
   uncontroversial removal of dead code, and I only didn't
   put it in my pullreq because it wasn't reviewed yet.
 * Consensus on the v1 series was that we could get rid of
   -portrait/-rotate even though in theory you could use
   them on a non-pxa2xx machine type to achieve the odd
   effect of rotating mouse input. I've added a section
   to removed-features.rst about this and beefed up the
   patch commit message.

Of these, I think we should definitely be dropping microdrive,
pcmcia, ecc, and the portrait/rotate options, and I didn't hear any
dissenting opinions on v1.

For max111x and max7310: these are fairly small (a couple of hundred
lines each) and not too badly behind the curve for code quality/API
usage (in particular they're both QOM devices), so I could fairly
easily be persuaded that they should stay.  However I would like in
that case to see:

 (a) what's the use case/user ? (e.g. examples of "I'm
     actually using this on the command line, like this"
     or "I'm using this in the machine model I plan to submit
     in the next six months")
 (b) some kind of testing of them (which we can write
     based on the answer to a.)

thanks
-- PMM

Peter Maydell (6):
  hw/adc: Remove MAX111X device
  hw/gpio: Remove MAX7310 device
  hw/ide: Remove DSCM-1XXXX microdrive device model
  hw: Remove PCMCIA subsystem
  hw/block: Remove ecc
  vl.c: Remove pxa2xx-specific -portrait and -rotate options

 docs/about/removed-features.rst |  22 ++
 include/hw/adc/max111x.h        |  56 ---
 include/hw/block/flash.h        |  11 -
 include/hw/pcmcia.h             |  66 ----
 include/sysemu/sysemu.h         |   1 -
 hw/adc/max111x.c                | 236 ------------
 hw/block/ecc.c                  |  91 -----
 hw/gpio/max7310.c               | 217 -----------
 hw/ide/microdrive.c             | 644 --------------------------------
 hw/pcmcia/pcmcia.c              |  24 --
 system/globals.c                |   1 -
 system/vl.c                     |  11 -
 ui/input.c                      |  36 --
 hw/Kconfig                      |   1 -
 hw/adc/Kconfig                  |   3 -
 hw/adc/meson.build              |   1 -
 hw/arm/Kconfig                  |   1 -
 hw/block/Kconfig                |   3 -
 hw/block/meson.build            |   1 -
 hw/gpio/Kconfig                 |   4 -
 hw/gpio/meson.build             |   1 -
 hw/ide/Kconfig                  |   6 -
 hw/ide/meson.build              |   1 -
 hw/meson.build                  |   1 -
 hw/misc/Kconfig                 |   1 -
 hw/pcmcia/Kconfig               |   2 -
 hw/pcmcia/meson.build           |   1 -
 qemu-options.hx                 |  16 -
 28 files changed, 22 insertions(+), 1437 deletions(-)
 delete mode 100644 include/hw/adc/max111x.h
 delete mode 100644 include/hw/pcmcia.h
 delete mode 100644 hw/adc/max111x.c
 delete mode 100644 hw/block/ecc.c
 delete mode 100644 hw/gpio/max7310.c
 delete mode 100644 hw/ide/microdrive.c
 delete mode 100644 hw/pcmcia/pcmcia.c
 delete mode 100644 hw/pcmcia/Kconfig
 delete mode 100644 hw/pcmcia/meson.build

-- 
2.34.1

