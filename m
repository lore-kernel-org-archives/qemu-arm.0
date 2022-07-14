Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp794406lfp;
        Thu, 14 Jul 2022 11:38:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u86OQTNG+VNgNc0sLsBeFhFpOrqMGv8BDajzV5eFVEgq5GkasrFXmNNNJ4ndfyTcjjTCf9
X-Received: by 2002:ac8:5996:0:b0:31e:92c8:bd98 with SMTP id e22-20020ac85996000000b0031e92c8bd98mr9584374qte.232.1657823894515;
        Thu, 14 Jul 2022 11:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823894; cv=none;
        d=google.com; s=arc-20160816;
        b=OJsJTy7/UOIlE73iV6O5M+eoFNNwwPZFHczodf0/qjUuNqts9R7bRCS/OYkEohG73k
         VnbkYUtYQDNi91UX47Rza8ET0KS3a7+PrCRz+iJAsnAMp7gHqXqA3cBHvk5uc9YoDTVK
         SqA4lTemrU/mL3I7WDwexJl+FFAnFl7ngYR89SIThfeNfjTe8Y/qJxVfSpy3M5+gXEeA
         Dh2/rUw4NZUrGHkAmYeYYJshOG3ljRdh2q7CMuVlbA2xcQnmW4K1b4Q8o97qdtycjhRz
         0Ab8LtVsX+dYsenujwvr3WQPK/WCT71oj015+/gnbj85gbazUdl0hOkISBSt2QyN52/j
         /2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
        b=Su4PjOte4/uCIMHzkDhUCHxV0JE/hZBIugG2Elgguo1Iqs2Zoij8+xmYRqavryGJss
         3FyWjaxrrXsVJTParuOxuQQFHiefiKxI6i+wjkDihhtsshAAm978+7JR6qWh5JTsFCgz
         yt2KmMCGRi2Hezg0bH8QHvIKVURAlhovab61abMV1PUwFpVUuIafqqsEslXVENCDzOKi
         Tu5GSo/YhOR5KBta5/SNgtUnvyJDWyGgyMxtQh6RO9logdBOO2rifb6H2lrg7a6qdCv4
         B4KN5wu+Dq718bGPGFkfUTwTpnud5QkqOWCFcILSagyZDe4YAy4zqTkY6yThMmLSjuNG
         slKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="iAok/zjV";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25-20020a05622a189900b0031d46a05a06si1656701qtc.194.2022.07.14.11.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="iAok/zjV";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3j3-0007Ew-W3
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3V2DQYggKCnYqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zs-0005Ut-Dq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:44 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a]:48048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3V2DQYggKCnYqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zp-00081q-Jy
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:44 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-31c8a5d51adso21235227b3.14
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=iAok/zjVWI7ARRKtn0IpBIkv+2yPjnvlx9S7YgoP2HPIcn9rYmSe2i1q0xjWepJadO
 skft2NHmg0DAgjuDj5skOGJCLCIIQM+Qy7XSwX3Ea6z88gmYpvV2QRtXBrI9qP3d0g6v
 Lue3UiJkUWgnNXReySLTwxEYHLdl1p3FTeIpNhPAwVrSjUX186GSJ03ipUA/6KVOH0+E
 VyPoWOy0q6b5WUAXt7L56rqirUhu/YRbL0nce0t8rDutZAGoGEU5VH+SUPmfAgbq/fSo
 xzIqxHU+Vx/EGnuY4WJnzBUcwOIdrHDsNHziJKqsVoAe2a9jwXgX84ncJYaHXRcEpC7r
 7w8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=pn7JL3983G22Ymc2ii5CS9BLkkk3OVVJTn819OBfSocYNhJffxEq5x9OlXbLcYJGqh
 hlWB1V+O2iMztJfUZBMnRxj7DSaaltqbbnTiP+xeBEnqW0tNLYIASCxlWLyO+AHul9M7
 c9axr1EQG5dhjN4yv0pORwS119Yfyp88mbuqk88baqzH55BWRSK5vl6Z+OJVvnzz4b2n
 jtiK1khW00wwPGQO5wBAlsHZI7j/wKWhjEaMv6jZLhI5tWXi2CW122rO4JS9Z4b//o+l
 944iuv6uT7WlV/pGGkFvQ6q0nR4B3mUlx4NJKiG6D8QfIyckIpMaTc5e6DYrVpAVev5R
 23Bw==
X-Gm-Message-State: AJIora8j36wF25a0fZT91wEttqDi9akgJilNv2X99032DbmXPl/DotJC
 O7ojSlKR8jSRpEyUMHAXO2OulAq8THqbow==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:5f4a:0:b0:66e:e941:22ef with SMTP id
 h10-20020a255f4a000000b0066ee94122efmr9603976ybm.229.1657823319948; Thu, 14
 Jul 2022 11:28:39 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:28 -0700
Message-Id: <20220714182836.89602-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 0/8] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3V2DQYggKCnYqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1zfR+S+hMVft

[NOTE: I'm reviving a bunch of patches that was in the process of
upstreaming a while ago but paused.]

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 adds a new blockdev IF type IF_OTHER.

Patch 6 allows at24c_eeprom_init to take a bus as parameter so it can
be used by more use cases (e.g. behind an I2C mux.)

Patch 7 allows at24c_eeprom_init to take a drive as property, similar
to sdhci_attach_device().

Patch 8 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

-- Changes since v4:
1. Add comments to patch 5.
2. Split patch 6 into 2 patches according to the feedback.  Each patch does it own task.

-- Changes since v3:
1. Add a new blockdev IF type IF_OTHER.
2. Use IF_OTHER instead of IF_NONE.

-- Changes since v2:
1. Dropped patch 7.
2. Drop an extra variable in patch 5.

-- Changes since v1:
1. Rewrote patch 5 to implement the function in NPCM7xx board file instead
   of the EEPROM device file.
2. Slightly modify patch 6 to adapt to the changes and QEMU comment style.
3. Squash patch 7 into patch 5 to make it compile.
4. Add a new patch 7.

Hao Wu (7):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  blockdev: Add a new IF type IF_OTHER
  hw/arm: npcm8xx_boards: EEPROMs can take bus as parameter
  hw/arm: Set drive property for at24c eeprom

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 blockdev.c                     |   4 +-
 hw/adc/npcm7xx_adc.c           |   4 +-
 hw/arm/npcm7xx_boards.c        | 102 ++++++++++++++++++++-------------
 hw/i2c/npcm7xx_smbus.c         |   8 +--
 include/sysemu/blockdev.h      |   1 +
 tests/qtest/npcm7xx_adc-test.c |   2 +-
 6 files changed, 73 insertions(+), 48 deletions(-)

-- 
2.37.0.170.g444d1eabd0-goog

