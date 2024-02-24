Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1284436ejf;
        Sat, 24 Feb 2024 12:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVz7WosP+nJWw1J3YEBMEwC85Qcx6nAVaUjusxHU8whpq5jWGs20bO5IKCpuJ+jeF4A8ExqbbUtEWKBIxpvIF9jwQFhuhzQ
X-Google-Smtp-Source: AGHT+IGwKdyyfuAe9oj9GUkecmTjuSqPAB7bcR4PwovVhZVS17Xl3Lhq//I/app4dnMon0JULPXb
X-Received: by 2002:a05:6214:f06:b0:68f:67b3:731b with SMTP id gw6-20020a0562140f0600b0068f67b3731bmr4509685qvb.58.1708806767947;
        Sat, 24 Feb 2024 12:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708806767; cv=none;
        d=google.com; s=arc-20160816;
        b=FANZu/d6MkujCAL6g6n/ETCUc95qlm/p/C3jk46Wgi6TSRLxCEOZF/iork+bQtG3ke
         XdfU4J41G18CCsd0yYbfrE/o9+y3grbxfJgZsScKepIIRYGwOwABPgIb/u9+smAOxvH5
         LnGcVix7GAQdMXK1MyiYNLYtbRj2cDnYpIdaX81OuKvhPoSVE/N/KZvm1yz7cETz76Z3
         XVBERK5UAUjZxnUKFVaLt4xcPU0468Q9auapdbepf5xu3TLVsENRxsyyCZKHK60A+yrm
         rIfis8Y5k5f/dlS8Q4bJxu9ySkMJeR/FlME0AMe/QWKYCklJBVwDhur9E5WzcHdGM27Y
         31bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uO/1+DSLbdpP01ytLRRf3V5DtpTT0RYEyj28N1ovinE=;
        fh=kDdTGuMlh9LHfDCtDgiHr1Cim8MVG4W5dIWcgfUzJgU=;
        b=F5SeGReSDhhPELiMNtdP2LqT7HN2UQNxj2Hkyu4xYrTpjxf5gdwftz5YrNPH+uBbmH
         D57EsG5tr/1X/Al4uV1WSNEaEJ/TRcOG6npvbwEnZmF1seLArAhc+vg3wFGhZW0ks4e4
         l2cJ2hJpC/MYjoNeWtQXZ8wCyJaaXmRc60CEl0bZhn51b8zSidxzCQ+OYGxtwJUvApPc
         IYbve83ZKpkBzIjRXMgInGzTLIftWUkIknorp7OLEAam3XEklRh4QHPss09lu0FFQBjC
         QJiVk3cBfseV5lwhL2Q+dI5N6a04y6Kp7Rr39ta3N1cFnHiBWCj7Bnleqggqz2TXUitw
         Y0iQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyat8vot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020ad45aeb000000b0068fe057717fsi1808672qvh.139.2024.02.24.12.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Feb 2024 12:32:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyat8vot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdygo-0003sJ-MF; Sat, 24 Feb 2024 15:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rdygk-0003nd-4A; Sat, 24 Feb 2024 15:32:02 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rdygi-00062l-Hg; Sat, 24 Feb 2024 15:32:01 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso2389220a12.2; 
 Sat, 24 Feb 2024 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708806718; x=1709411518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uO/1+DSLbdpP01ytLRRf3V5DtpTT0RYEyj28N1ovinE=;
 b=iyat8votN7ng3UTTdpnpaD4Hlp+v81/s7ODOA2ialbGEipR9Zks5sTFYmcViK5cYIe
 D/IzMF36XawDsl6ralO6/3TyMkd6tiq0p4dZth6Nn83r3lmLdBh6iM47EIrDB1M7DWuz
 sZV1q5nvWC4ETEqImAz3LL2JCT/Zr7ZM6RFT6Qks5+VwYW92g+4vycK0n9WVohZwoRzM
 WbTRi66uRQd3FHIuQl4TF6xEL+U+i4/za+zuGPGhrAz2eUL+Di12lyh8Ng5UWt4eU/U5
 poxaZkPHBTFsJ6v7qrXj94ZuOUiUHekqfjB6v7XL9Mro31vpVohOoRi+Uq/w+uGphAbi
 fpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708806718; x=1709411518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uO/1+DSLbdpP01ytLRRf3V5DtpTT0RYEyj28N1ovinE=;
 b=MyNPq+1RorZtRME43UgfHQj2V9K1tsL9DmQ+Jq+6NdC76cNMzrU/JoZ9EV9BEPl8GK
 n8YTRtiRp2Hs5YzqdmP7GSlTvK6URGk61cuAocbclJducLaXiqi25yedwTNPAO1Su1EF
 sjb240hjJhyBlGzS6MnFizU5EzSCBGOoW941u/bEQVzTdnWdsdnwTxDdjVVJQiE9I5xM
 n+9eTPyQw5JW3wI8SaGFEt2xkeRJfxx9s9zpAQAjtQjRP5zeMZDiQzwb8+V6WMAfSgoT
 MECHzoyBUwYhvbYBDnXHj2JUTfycIeQqMAFLShFBhICdu4ts3yvHPfXXs5jHi4HuJ6zK
 4A5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMetDpkGqw/l+p8AoR6kjdWUGo8uvCn+8Msqu3yGaFKnxLrEoi4mBPFgX4+aX3PYb6wGEW24yitzZbeoC2CzGhB74G
X-Gm-Message-State: AOJu0YwTT1iBTCwhNNJdtGvEKJENjS8WmsWzgvsRjYxBC3DMgS9aiNLD
 U29vmlUkDwgU1EwK/WUTsCn+aBBj1t5pj7iB2DF3TimpacGmKsrpM1OGyVLz
X-Received: by 2002:a17:906:5959:b0:a40:75e8:3891 with SMTP id
 g25-20020a170906595900b00a4075e83891mr2045889ejr.7.1708806717698; 
 Sat, 24 Feb 2024 12:31:57 -0800 (PST)
Received: from localhost.localdomain ([212.70.108.232])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906088b00b00a3d636e412bsm863405eje.123.2024.02.24.12.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:31:57 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Rayhan Faizel <rayhan.faizel@gmail.com>
Subject: [PATCH v5 0/3] Add support for I2C in BCM2835 boards
Date: Sun, 25 Feb 2024 00:40:35 +0530
Message-Id: <20240224191038.2409945-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uvlkF232xJiv

This patch series implements support for the Broadcom Serial Controller used
by BCM2835 based boards for I2C.

[Changes in v5]

- Improper whitespace again.

[Changes in v4]

- Added IRQ or-gate for common BSC IRQ.
- Added valid sizes to MemoryRegionOps.
- Use version tag instead of master

[Changes in v3]

- Add SPDX license identifiers.
- Fix a few minor whitespace issues.

[Changes in v2]

- Fixed and simplified writing to status register

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/481
Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Rayhan Faizel (3):
  hw/i2c: Implement Broadcom Serial Controller (BSC)
  hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1 and I2C2
  tests/qtest: Add testcase for BCM2835 BSC

 docs/system/arm/raspi.rst            |   1 +
 hw/arm/Kconfig                       |   1 +
 hw/arm/bcm2835_peripherals.c         |  45 ++++-
 hw/i2c/Kconfig                       |   4 +
 hw/i2c/bcm2835_i2c.c                 | 282 +++++++++++++++++++++++++++
 hw/i2c/meson.build                   |   1 +
 include/hw/arm/bcm2835_peripherals.h |   4 +-
 include/hw/i2c/bcm2835_i2c.h         |  80 ++++++++
 tests/qtest/bcm2835-i2c-test.c       | 115 +++++++++++
 tests/qtest/meson.build              |   2 +-
 10 files changed, 530 insertions(+), 5 deletions(-)
 create mode 100644 hw/i2c/bcm2835_i2c.c
 create mode 100644 include/hw/i2c/bcm2835_i2c.h
 create mode 100644 tests/qtest/bcm2835-i2c-test.c

-- 
2.34.1

