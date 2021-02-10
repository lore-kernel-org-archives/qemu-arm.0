Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1692467lfc;
        Wed, 10 Feb 2021 14:06:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8ofzhjf7+hvFy/db4au+3IriSCjXIDFtVt5kPTVNelmZIkgLgH2il3/sTNovwM1uJnR4i
X-Received: by 2002:a25:8689:: with SMTP id z9mr3793252ybk.55.1612994772465;
        Wed, 10 Feb 2021 14:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612994772; cv=none;
        d=google.com; s=arc-20160816;
        b=NAQnsFULdDdEd5LBk9e4D0yXYQFdcRFIV0wzBwgOt0wihKcU0SxSK61fWwiLU7oBAM
         nkWJBJ6ynQAeBTSgMuO+mC1gGoTM/gUqcd9tDz3FPOHxrIkMMKQZGOPo1gur91ewAtFi
         tW8cXn35ObePeGKYtcvAMSQxkmAq15RUqn8wuW33imu5YTYjOBuwIS3GTboBoYSkHBk8
         PyCmngDxru04tg5EBI0qVjbjd3WUB7tG7wI0HzcBzafCFJnq+JN9KtIEUamXhsJ7cG43
         0Qjny+Bv3NZPrhDsVHYwt2IZsgEHGdAcUMfcOydzmk3IKxj/oSHwxkgceqQwgUE6+bPi
         1Spw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:date:dkim-signature;
        bh=2IsBkrOmO2LpeVhzut2Dk8QiICKrVg3gpFNLnyKo2x4=;
        b=M3yoFeYpGeIp3dMxmzv3azCDskdSxMuNgzycWlgiGPVsw/lOzziAOtyk/pOeNb5JQ2
         ej7WfB/GXzXf731SnvIX1l3l2LDf/oVg51Ok41HIay/ezy+JJNM9YN/yUn8f1RHLF4Yh
         JS5GmA26Zxvr00B7BLPo+YuPXGwykpmNQcaDchQjOHUcYsMzzz4jUT6IoHPOWvAuE5r+
         18+MVk53f0l9soU944aTQmnAvn1JxIQ9zcisD5hHrhHPVzq2lu87l0P1/03sF68SkE5V
         m06CLGun7gdlajuiFqZjpgrvBg2A4rfasKpRXHQym1sErFNnLLpGEcSlxCc4H03vrA9O
         6Sqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=plSyZvgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si809052ybt.169.2021.02.10.14.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 14:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=plSyZvgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9xch-0001Lz-Ou
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 17:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dlgkYAgKCL81zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbc-0000lb-46
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:05:09 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:58099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dlgkYAgKCL81zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbF-0000j1-7D
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:05:00 -0500
Received: by mail-pj1-x1049.google.com with SMTP id 19so2318645pjk.7
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 14:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=2IsBkrOmO2LpeVhzut2Dk8QiICKrVg3gpFNLnyKo2x4=;
 b=plSyZvgq3Wxxf+0zS/Xh7FLs7dn+17vZ1hXUQEZdOb14CRxZbOfzeGwW1uRLuhgRzo
 nXUha/qt5Q22EHTgPp1s9xmOyMunbEusiyfP+MLytk8vPOrmCQiVCPob51cKyH+voMkn
 7PNC/i0gndg9rzjFcHRzAcMH2sPrgEF5a2LmwuPWdEy0FLNrbhH2Z+j7tnCvEMJMaHup
 VOLbZgMypxkEVYyHnw6sdxChN+SeCgjG5b7uKYl6CrkSExZMqUz7x/ogmJpA8l+avnwR
 71nRRxCtzui20Z/6fCf2ibqlNIkqLGh4m+bp+33MrlLHILb84oFkBdhZawKM+z37GdlU
 AoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=2IsBkrOmO2LpeVhzut2Dk8QiICKrVg3gpFNLnyKo2x4=;
 b=GfxBUJAfS4qvS3f2pRm/J9SyhBvkjrMdnW+3EG5IUmcpMTo/bI5/GTAfEEbvPBP+ur
 lCC5/AiwHQ/NmOXIbe6xbhH53RnuW2Gm4bOTDbXRq6eEB0tyyS0TmQgt5DsePQdBFqWt
 HdA8h7t2mKTHsZjzvgELqui4ZnXyZweogxDyYocJO/Lvu+H450fMz2SYZQD2uIesgKiJ
 bzDzd1td9UwT6P0w+bDid3+bCLVlN9LV2IGxrSvbBD5Q02HackKbDbMSoCvwi21Fu2IU
 2JnrrGqPfJRPOKs1ga86XmwYvHMoOKELJ6o7ilNF7IR+V/I/03OON3RbXKQCUD3k3p3j
 DkVw==
X-Gm-Message-State: AOAM531t1XW6OCQs0XG3RIqlvVJCgZAObc50hk0CQRGf5jeMa/eJWplv
 pvOn9ZBJPt8wkFVyod+StqitoJTKiVF5uQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:464:b029:e2:ebb4:9251 with SMTP
 id 91-20020a1709020464b02900e2ebb49251mr4861698ple.29.1612994678979; Wed, 10
 Feb 2021 14:04:38 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:21 -0800
Message-Id: <20210210220426.3577804-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 0/5] hw/i2c: Add NPCM7XX SMBus Device
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3dlgkYAgKCL81zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-arm@nongnu.org>
X-TUID: nOgkt/Gj0Gqs

This patch set implements the System manager bus (SMBus) module in NPCM7XX
SoC. Basically, it emulates the data transactions of the module, not the
SDA/SCL levels. We have also added a QTest which contains read and write
operations for both single-byte and FIFO mode, and added basic I2C devices
for npcm750-evb and quanta-gsj boards.

Changes since v2:
- Remove first patch (GPIO) since it's already applied to target-arm.next
- Rename NPCM7XX_SMBUS_FIFO_EN to NPCM7XX_SMBUS_VERSION_FIFO_SUPPORTED
  to indicate it's a register field of the VERSION reg.
- Add select AT24C in hw/arm/Kconfig.
- Minor additional commit messages and comments to clarify things.

Changes since v1:
- Fix errors for i2c device addresses for temperature sensors in GSJ machine
- Use at24c device to emulate GSJ EEPROM. It supports more than 256 bytes.
- Fill in VMState in npcm7xx_smbus.c
- Change commit message in patch 3 and 4
- Fix order in npcm7xx.c IRQ list
- Add a few extra comments to make things clearer

Hao Wu (5):
  hw/i2c: Implement NPCM7XX SMBus Module Single Mode
  hw/arm: Add I2C sensors for NPCM750 eval board
  hw/arm: Add I2C sensors and EEPROM for GSJ machine
  hw/i2c: Add a QTest for NPCM7XX SMBus Device
  hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

 docs/system/arm/nuvoton.rst      |    2 +-
 hw/arm/Kconfig                   |    1 +
 hw/arm/npcm7xx.c                 |   68 +-
 hw/arm/npcm7xx_boards.c          |   46 ++
 hw/i2c/meson.build               |    1 +
 hw/i2c/npcm7xx_smbus.c           | 1099 ++++++++++++++++++++++++++++++
 hw/i2c/trace-events              |   12 +
 include/hw/arm/npcm7xx.h         |    2 +
 include/hw/i2c/npcm7xx_smbus.h   |  113 +++
 tests/qtest/meson.build          |    1 +
 tests/qtest/npcm7xx_smbus-test.c |  495 ++++++++++++++
 11 files changed, 1823 insertions(+), 17 deletions(-)
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c

-- 
2.30.0.478.g8a0d178c01-goog

