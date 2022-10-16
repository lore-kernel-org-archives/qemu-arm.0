Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1707311ejn;
        Sun, 16 Oct 2022 05:29:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6S7IIiH1AzXjLtV3QHKyU/LCh4RjwaEl5pyysRk1up22KXpwS23IFMT/bhlZl+ZBzWRrYx
X-Received: by 2002:a05:620a:2113:b0:6ee:13dc:4cdb with SMTP id l19-20020a05620a211300b006ee13dc4cdbmr4519046qkl.74.1665923343900;
        Sun, 16 Oct 2022 05:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665923343; cv=none;
        d=google.com; s=arc-20160816;
        b=EEDq6blCA7nW3zIkO1j+NMIB0dj5DcOKjbb9XcH5FJYMpTzym6fiBbMwva8o6n22n2
         MY12W7OBWz8st4EF7NKliYi8FFoFoSSOEGhXvlw4j9B720edX5fNMOH8QInk4VKL2h5s
         KaVLjHf+rqAICCtE4EtL8vtMGgBo8Xw4EWVlwl/lxNeqF0Jv5kCjXrHvJ7scBzv7UHGL
         DH0OqA9XLWHCUMJ0luTwvJ7eDvcYiHW+YzAKAKj+k872Hd9tltQ5+R24pLcL8fMgzbsT
         2HjzNhbsEDTb32Lb7Mk+euG69qxN8SglLBz95sYL1bNmihGE4SWlK1NWoHAZhz0b/IJ8
         mkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=aOKep4Yy5yG2CWarIapuE1ELBSQlntAqw5/54Tor6Go=;
        b=A2ZxLJOqOft3GJlbtyY5s45qKKwKpF+h8qtpRz4nvDiVwqHntoeodgCmLom2EOpesx
         vBnkntXtgB3VVM2yaZP6FlcIh4KSYelU4AiXX0tDPJEdjWRaB2UGOCXp5fQJzFVj5bC/
         vymbLig3iKkYw2WQZa+Y1MDcBLcIR2dX9NP8aW8+doaeiqz6Pa7JVF349CNdmnKgiKdj
         vwKywe5zuruIajvtR00qSEEqzFaul+sik9nQy290rfbUxOf09SIXMdODcGh0UtItN9XD
         DvHulvRALTnRIuBQyKuEXv37gamiJu1790wJuGEvmcXa+3hiFkUfVTvBuBVO9xWbJw2w
         s8kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hzd1j6cG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg9-20020a056214252900b004b3d7017e43si4247481qvb.323.2022.10.16.05.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 05:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hzd1j6cG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ok2lL-0002OM-CA
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 08:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2ko-0002L6-6D; Sun, 16 Oct 2022 08:28:30 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2km-0000Ol-8o; Sun, 16 Oct 2022 08:28:29 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ot12so19484566ejb.1;
 Sun, 16 Oct 2022 05:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aOKep4Yy5yG2CWarIapuE1ELBSQlntAqw5/54Tor6Go=;
 b=Hzd1j6cGDBC/AY5oXlwm80vw2uA8SIaq1BEj0JKjcA3ksJahjN3sRl27Nk4xyVzpj3
 kWOo6qhTbp5gs4WC/EDl2TfzSmgZHO3sXOQHZZsEXKva43Q0I9Rf5pkHln/A9IMaWELQ
 m8e2fhg5Gt96EZ6qGg76HYB3B+gHmBOtQ1B2ZVrdnCGalQLX6kksSgKaOYbLlF74y4pH
 QFRi5lTxsy2tDSsKADgkLgkDELMr/A8bIoZZIYAmA93sI6qN1ZdZZF57ouUxHKMS+Xkd
 4hhXOs/chvR1bT8i9LFVYRUNxl+0FgZkEv3BQrJ0iJL51QXNrISjkhqlsDlw4Fu7KThc
 pInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aOKep4Yy5yG2CWarIapuE1ELBSQlntAqw5/54Tor6Go=;
 b=XucoBMBWGiqMGt89fNyzINGpdduo1/cNM6M0X2ob8Enkm0UFBdCP2j892+oFpsKjNT
 jZW3rjZUUiUBDfzI8iN6ylVfZJZb8li+/Y0xIMvcwz7rxexjkPKe3WLj3V41YPzcvwNo
 WgJToBlElCXoo0r7kq3+7/l1V2xmetgjJWXJfRO7M/02DO/nH2jx0VxnmgSCcJPc1OMQ
 2uwvCHIKXgSbqDP6PBsfQOoXOVNCDrN3YVy6Es0/RZDPjjsTWNmB6Bptxx++aXJuWQf+
 PgJiH0wGS4gSYpkE7tUH1vX9lYd1h0qA0hjVQoVXCE4tyycRllER4mByKpKgHXno5gum
 os3Q==
X-Gm-Message-State: ACrzQf3mORVnT/V3crtKZtNXQ1As9PsIMaLY++DYDlYdi3W0C/+tSaVf
 ZgnsbjRjpY2bcXTQDUDmSMK9zfAt19Y=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr5110824ejc.724.1665923303815; 
 Sun, 16 Oct 2022 05:28:23 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:23 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/9] ppc/e500: Add support for two types of flash, cleanup
Date: Sun, 16 Oct 2022 14:27:28 +0200
Message-Id: <20221016122737.93755-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rwCfk8V++XRX

Cover letter:=0D
~~~~~~~~~~~~~=0D
=0D
This series adds support for -pflash and direct SD card access to the=0D
PPC e500 boards. The idea is to increase compatibility with "real" firmware=
=0D
images where only the bare minimum of drivers is compiled in.=0D
=0D
The series is structured as follows:=0D
=0D
Patches 1-6 perform some general cleanup which paves the way for the rest o=
f=0D
the series.=0D
=0D
Patch 7 adds -pflash handling where memory-mapped flash can be added on=0D
user's behalf. That is, the flash memory region in the eLBC is only added i=
f=0D
the -pflash argument is supplied. Note that the cfi01 device model becomes=
=0D
stricter in checking the size of the emulated flash space.=0D
=0D
Patches 8 and 9 add a new device model - the Freescale eSDHC - to the e500=
=0D
boards which was missing so far.=0D
=0D
User documentation is also added as the new features become available.=0D
=0D
Tesing done:=0D
* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append=0D
"console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr" -drive=0D
if=3Dpflash,file=3Drootfs.ext2,format=3Draw`=0D
* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append=0D
"console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3Dmydr=
ive -drive=0D
id=3Dmydrive,if=3Dnone,file=3Drootfs.ext2,format=3Draw`=0D
=0D
The load was created using latest Buildroot with `make=0D
qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 ty=
pe.=0D
In both cases it was possible to log in and explore the root file system.=0D
=0D
v3:=0D
~~~=0D
Phil:=0D
- Also add power-of-2 fix to pflash_cfi02=0D
- Resolve cfi01-specific assertion in e500 code=0D
- Resolve unused define in eSDHC device model=0D
- Resolve redundant alignment checks in eSDHC device model=0D
=0D
Bin:=0D
- Add dedicated flash chapter to documentation=0D
=0D
Bernhard:=0D
- Use is_power_of_2() instead of ctpop64() for better readability=0D
- Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS)=0D
- Rebase onto gitlab.com/danielhb/qemu/tree/ppc-next=0D
=0D
v2:=0D
~~~=0D
Bin:=0D
- Add source for MPC8544DS platform bus' memory map in commit message.=0D
- Keep "ESDHC" in comment referring to Linux driver.=0D
- Use "qemu-system-ppc{64|32} in documentation.=0D
- Use g_autofree in device tree code.=0D
- Remove unneeded device tree properties.=0D
- Error out if pflash size doesn't fit into eLBC memory window.=0D
- Remove unused ESDHC defines.=0D
- Define macro ESDHC_WML for register offset with magic constant.=0D
- Fix some whitespace issues when adding eSDHC device to e500.=0D
=0D
Phil:=0D
- Fix tense in commit message.=0D
=0D
Bernhard Beschow (9):=0D
  hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power of=0D
    two=0D
  hw/{arm,ppc}: Resolve unreachable code=0D
  hw/block/pflash_cfi01: Attach memory region in boards=0D
  hw/block/pflash_cfi02: Attach memory region in boards=0D
  hw/sd/sdhci-internal: Unexport ESDHC defines=0D
  hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*=0D
  hw/ppc/e500: Implement pflash handling=0D
  hw/sd/sdhci: Implement Freescale eSDHC device model=0D
  hw/ppc/e500: Add Freescale eSDHC to e500plat=0D
=0D
 docs/system/ppc/ppce500.rst              |  28 ++++=0D
 hw/arm/collie.c                          |  20 ++-=0D
 hw/arm/digic_boards.c                    |  16 +-=0D
 hw/arm/gumstix.c                         |  24 +--=0D
 hw/arm/mainstone.c                       |  15 +-=0D
 hw/arm/musicpal.c                        |  15 +-=0D
 hw/arm/omap_sx1.c                        |  25 ++--=0D
 hw/arm/versatilepb.c                     |  14 +-=0D
 hw/arm/xilinx_zynq.c                     |  12 +-=0D
 hw/arm/z2.c                              |  12 +-=0D
 hw/block/pflash_cfi01.c                  |  12 +-=0D
 hw/block/pflash_cfi02.c                  |  14 +-=0D
 hw/microblaze/petalogix_ml605_mmu.c      |  16 +-=0D
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  10 +-=0D
 hw/mips/malta.c                          |   4 +-=0D
 hw/ppc/Kconfig                           |   2 +=0D
 hw/ppc/e500.c                            |  97 +++++++++++-=0D
 hw/ppc/e500.h                            |   1 +=0D
 hw/ppc/e500plat.c                        |   1 +=0D
 hw/ppc/sam460ex.c                        |  19 ++-=0D
 hw/ppc/virtex_ml507.c                    |   5 +-=0D
 hw/sd/sdhci-internal.h                   |  20 ---=0D
 hw/sd/sdhci.c                            | 183 ++++++++++++++++++++---=0D
 hw/sh4/r2d.c                             |  11 +-=0D
 include/hw/block/flash.h                 |   7 +-=0D
 include/hw/sd/sdhci.h                    |   3 +=0D
 26 files changed, 433 insertions(+), 153 deletions(-)=0D
=0D
-- =0D
2.38.0=0D
=0D
