Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp116804lfv;
        Wed, 3 Nov 2021 15:05:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRMOe5z0Outr6Ggz1uqMEZDzrdKmzbIyFspn8aSYMMmp65/lLJ1WxL6QTvP1KPOaPWfRw6
X-Received: by 2002:a4a:e292:: with SMTP id k18mr832763oot.80.1635977106337;
        Wed, 03 Nov 2021 15:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977106; cv=none;
        d=google.com; s=arc-20160816;
        b=BbUfnfbyX+fz9OikePXk0xlOOoP8dPD/iN/6+22KfLcmJkfkElMRto69E+JgyxIjUo
         OVAQyJ8PFeUlsWQ/Po/7bijT1fK0r6DhGQ2zPMhg+G0ceH/AM9AN7B35SVgHGPT8zcyO
         Q8m+MGcyk4Rot9BCFPxXJrWLBvToGki+yvSPGXnx9bjJNyMTSzafE6iDKKwgMI6vjQxw
         dqNR5wAWXd1Ncms45ANcpr5Lpj73Aemg9wI0ohjp5WmU/e7z45xjdJbxzC9vc6vUuNAe
         xbDn0qW4qA/9aQmET2ulLAmtyXxo0FlsX0esPn+S36g/uxFUD07CmqkNS41+PbuJ2WRg
         oSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=bKJei08DT04/YwixoaO1f72n6dow55G1ly6RMX+KkRA=;
        b=hPz7xt1mp9+eV0StEiFsuaOAV8WAvLi5XKvcWvdEI9wswRkcSNBtC0CDU9yKNxqFUI
         0eMYKfLEpxLKvx7GJw2gdGBrJSjmz3UwkgksJ92sq09V0uir8oln9+iIpBXRLLsIZ5Er
         icqZzwfUimbG9W3+uu0Cl2L8Fujq99DzasFHvfH0wgAqFvZmrKw5VAir9Tof6DbCtTCV
         UNjxTq/qwG6c9EaXjvSfi6olzMeJeUQRKVvJ9+YfeANTqlYam8RH8P9FNcQRk5QGgtB4
         3iZ3B7wVIzQFSWylX/gE486JvQgjaqAbK4TV+TCjX9OdBtcRWkQlTfAD67BxQjgUbTQ2
         FcyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CZdkbcv0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si4642900otn.245.2021.11.03.15.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 15:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CZdkbcv0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miONV-0000Af-MO
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 18:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3awaDYQgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1miOIq-0000nE-Kw
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:16 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3awaDYQgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1miOIo-0001FR-Ez
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:16 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 u22-20020a170902a61600b00141ab5dd25dso1762218plq.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=bKJei08DT04/YwixoaO1f72n6dow55G1ly6RMX+KkRA=;
 b=CZdkbcv09Nhd1JEi2RpTedvL0tiiNo4ZczzURICOPvG5sQjzkSpILkGZd0TNkDyBmM
 ffus8UTz6cVAViTcSc0933HQpDnqtLyfiVRkiAt/fGL0RydlMB30DBRx5Kuc4lXeBPVg
 GuYzfG2kxmjKn9Kx1A92QN7iHp1X7mnW5jyPXpzefi5edB4dQahW0ryzMIrMyaUeGxDO
 gduVWmS8oNFIQzkdbZ4rLi2wRrGkHustoebzn4+X4s0TRuMqLBJNnj7wdVIuwf7mfGQW
 Q137fKo1ceFH2Ukqmsimry9amy+DNVru25/ofciDLY3fTHexvFysxGhVfzO01f6TP/PO
 dKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=bKJei08DT04/YwixoaO1f72n6dow55G1ly6RMX+KkRA=;
 b=XHOSFXFkuQAUJvBYumJit0Ud1SfS9VKUAoUOXtXcuY522/QAZaxA7VP/GuD5e4h83B
 AiXfz0hZZKB9kf1x3ehcsbie7WjWlEov/YN9HETshZPAVwG5dInSSotZjj33gUCmfq+N
 TArHsQ1YlFu3MEqu1u497LkNAqjssPpz6qzoRo3Y3gIp+5eqrtEocFs9ykUWhuH1xru5
 pgjJGKvTtGqHuPC8DwSMhi9pHUfPfwE0Ms4BlboiFdvniUEk+ZslHO5kFtcs7+AFHY5m
 Tfh+uMGvZsLJXdyVcmlB1sDz6T4TvEuDrBViIpLzCJgLVw7VAWDxYX41Fp9QrjiAyk3B
 lX+A==
X-Gm-Message-State: AOAM532Wf/VgrWnKUUXgW9FvweqnORC0TImYACc/PBIeOf3Z4h7GL5FC
 aXsk13+cJsD9x/gJ7VAtSkaRFKntPsfrIw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr214535pjh.1.1635976811312; Wed, 03 Nov 2021 15:00:11 -0700 (PDT)
Date: Wed,  3 Nov 2021 14:59:47 -0700
Message-Id: <20211103215954.1401805-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 0/7] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3awaDYQgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: mO/kj4Ja3x2i

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 adds a new blockdev IF type IF_OTHER.

Patch 6 modifies at24c_eeprom_init in NPCM7xx boards so that it can fit
more use cases.

Patch 7 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

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

Hao Wu (6):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  blockdev: Add a new IF type IF_OTHER
  hw/nvram: Update at24c EEPROM init function in NPCM7xx boards

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 blockdev.c                     |  3 +-
 hw/adc/npcm7xx_adc.c           |  4 +-
 hw/arm/npcm7xx_boards.c        | 96 ++++++++++++++++++++--------------
 hw/i2c/npcm7xx_smbus.c         |  8 +--
 include/sysemu/blockdev.h      |  1 +
 meson                          |  2 +-
 tests/qtest/npcm7xx_adc-test.c |  2 +-
 7 files changed, 69 insertions(+), 47 deletions(-)

-- 
2.33.1.1089.g2158813163f-goog

