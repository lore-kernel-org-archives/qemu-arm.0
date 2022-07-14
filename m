Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp791411lfp;
        Thu, 14 Jul 2022 11:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgJ8cT9f+72K+/VyKtjIEvct8UUvBRxSNTv0y4JXeAZyF9gogw9IcWELFkNZUV/n0g26l2
X-Received: by 2002:a05:620a:942:b0:6b5:c733:eeb6 with SMTP id w2-20020a05620a094200b006b5c733eeb6mr1841935qkw.473.1657823316973;
        Thu, 14 Jul 2022 11:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823316; cv=none;
        d=google.com; s=arc-20160816;
        b=sQQkKTQIRww6sXpeqLdl9xFOFEDNVSG1591n5/EEL0RjH9oOMFT6Qhg39tPnTpb5om
         R4cqwgHkNhmNjbIP1W/3vRtfewjresB3vBorgddRWqy3UAqKetPMW7TRQLs6AQFsw2SN
         l3wgUDIV4uGWjqsunK3z+29OrzfgI7RFNZVCFWcCwkup3Tfoawp6zmFhxR7f1QffmHjn
         hQuOpd0AnwGAGFyd+aqzCMWFFoUC5MDeCJRA3HZNmAAyLQ8/TC0T9BzNUGowysQ9kPBY
         f5iMMnBF61ikH029cnA0kLa361jP5W+AXCThoA5GjYciOgrQjFbmMih4WOfSdVqcXXzD
         Vfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
        b=F9eHRZvdMaXdohQHMQHP6S+OEphBrJq96gjbwu1uCL2BHFDzcgV2rlaFKoA9VvrODs
         tu9RJzQ6DQvKQvWJ4VgkNHPh55FsP5ryrjk7513TUYJ0gWaxI2t5Au7E1lG6SxcPaFHK
         mKg+Md193bATI9rXmgdmfrkg27C3hDaIeZQ1plhSyXrrCcjZZzU5451hgt1AclDawyKI
         g2X53ue/CU5EGBP0NY/fBq1xpmFZyFIkn0Sl1LWP/lysCj/NOR9ZRTZK5y4GdUohFudh
         q0//ejgOBcb6GJ71qpL+/7juNcYMG0INFeKn7gqYYdad9ASELQgLbUWrqbA3kIS3+2UO
         t6wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kLGYQTOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05620a2a4b00b006b21f49f135si1140638qkp.37.2022.07.14.11.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kLGYQTOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3Zk-0004MZ-F0
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3L2DQYggKCE4CAxq498xw44w1u.s426u2A-q72343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZD-0004IW-Qk
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:03 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3L2DQYggKCE4CAxq498xw44w1u.s426u2A-q72343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZC-0007KY-2N
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:03 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 9-20020a631449000000b00412b1418c79so1591931pgu.2
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=kLGYQTOltKFMIWpKXDHPPMGzDvYNwzq0N+zsA07XjNzJemKSRW4jWvnDF1nc77z9sn
 8mx5tafTnJOuG39WxfAvI3JAPNfwuv+o2mZaks+tu2SmkuvXR2W2k0uGgTNvY4e2g2VT
 cpMgmgTOe0FwYQPgv9SygYJFNwpfPf2q+MjO7NmfF7JW4g43+ohvlWze8PlMGPEmLJFp
 VL66VpkZQj24+mRSKyUExeI4xWWZAlBbn6Jk384lQ0gFDF6KShh7HQG9rugmXiBaqR+I
 INDs7v69MQyaQ6MTvade7dDSxDfu8RTDTq1q1mDWsG/iQF8NnecNkI3Jjp3c/2HxoqWw
 MPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gV+TyTQO6jOPvTt4hw3npsX3ehauWxm2nzUt3iPAaNg=;
 b=cywoYKkvPB5NAQCltCOBNOihaPCRZPY9NLT9+xDTVkzz1i3PsfzLZ8beQ7s3K427qH
 3Njtz9mMLaeYTmnRSHO7Q97/PnveR+Aag7jvEYA+BTpdq5xNk/yCBrqZ5Ip0ahzIg6Gp
 je5ZNlP8bnvODfPdYSWK0vXcpDiFYoNO+ZDabER6D47ZcneRJshcFt8ZlnCC8eq3wDY0
 MGO4zw/LkyeTzInkRcqhXe8LA+HHvPIa5s38Bsuos6mIWH3vKvufSXJZB+hA6dlq/Qyi
 Y4fbw/yClGvUTWNHbaGt3aHgDa3ZQS/TqCnk1EoUCgjRPZ/+UnsICyOJzH5+Oc2wwsR1
 h9TA==
X-Gm-Message-State: AJIora8v/r5yh4SVCSj31LIN43J/5XGI+XBGd2H5NwBa12whemWEl0Bp
 uoOPAdNYwbm0OL0cFzqBt2funbmHewTIQQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:2301:b0:16c:58a3:639f with SMTP
 id d1-20020a170903230100b0016c58a3639fmr9608024plh.122.1657823279143; Thu, 14
 Jul 2022 11:27:59 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:39 -0700
Message-Id: <20220714182756.85664-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 0/8] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3L2DQYggKCE4CAxq498xw44w1u.s426u2A-q72343w3A.47w@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: siW8PtsMgeJT

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

