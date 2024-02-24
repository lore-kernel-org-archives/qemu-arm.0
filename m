Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1282371ejf;
        Sat, 24 Feb 2024 12:25:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuQke5wvbTjPLpA23U5eev0MnDn5piN20zb96R1/TmbnfOsTNylTumhx0PkKKNu1zxcVal7JTTrAoGjRXXHzz1LWLj9xAM
X-Google-Smtp-Source: AGHT+IHII0WTQaDSmAX9FIhMxwdsHNRik7CWN5zBKIC+KrNc2tbuArZqvv/pvsMBvjRmw4AHtpOW
X-Received: by 2002:ae9:c30a:0:b0:787:b5e7:6c72 with SMTP id n10-20020ae9c30a000000b00787b5e76c72mr4375531qkg.66.1708806305659;
        Sat, 24 Feb 2024 12:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708806305; cv=none;
        d=google.com; s=arc-20160816;
        b=OWjkwS8fFdXB0WJt8HnDUIKHmKAY8FP4Oe88IfN+uuBG6sQixmOhUcYfVErX7nF4D5
         0zhGRpng7iotqI0cd1JTISso0qDPBeNp+5w805FXVq8mAulS8ooKy2dyPHl9WysUXX8v
         NAQOAzk3Yrq59kiCnMl1uB8Er4Hiaz3182zTsfbvRKjg3K77fvTZ/0LpIG8bLZwJ6kG5
         6X+eLHpHvcZE6ub2JTqqwVWR9co8IUzTlrKgqjlmXho9sU8DzuO3PDHT0YV4qFnbI3Iw
         ZqS8WfVIA1/Nh4PXzwA1GhBIewE5AI8YpWBKHChZOpA9cZ9nIvM99ULrEBYGO+AeNI/+
         4fZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=swlI7PRB250VIrfVaxWLmLFtXrAzrbSEgzAoIdtMN+c=;
        fh=mPb0kgRKRMXyQf1doXT0J9h63aokjDxWBaxytGWn63g=;
        b=Wp1y0XnQ02JFdHBA8qvlHFiecpAhsT52s6FHJ49PW1RNfoZLAu2r11sZaUWzFZ/rEb
         PduBNrVgA8cVE21MJ4gTJRvunFcjJxY7B/NEi6Z639ztxhe0vjosQprGdD1TxtHg/MHJ
         GWP4V11ecE0pc7GILwFh5YIbAwf9LHxDmt1UPyrh+xmEuvE6my/WDLmdS3nQ344BzKBj
         Svv0OpVliuHjzUCtq/Yl+4qP7ICc3Zas4fcSq1EUSKpyu1qx+KVrTBBgBMyG6r+F2aSC
         +CYgD+KwYVmb+08W4QgEhRBhQBbXNW8r+qD4akI08KAm/YwYVVDcUw8CjR4CxAacfPk2
         fncA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=S1CUzunt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05620a440b00b00787c8fb6c5esi1019723qkp.256.2024.02.24.12.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Feb 2024 12:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=S1CUzunt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdyYd-0006y6-Tp; Sat, 24 Feb 2024 15:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rdyYb-0006xP-FQ; Sat, 24 Feb 2024 15:23:37 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rdyYX-0004HS-5l; Sat, 24 Feb 2024 15:23:37 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-564e4df00f3so2345340a12.3; 
 Sat, 24 Feb 2024 12:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708806209; x=1709411009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swlI7PRB250VIrfVaxWLmLFtXrAzrbSEgzAoIdtMN+c=;
 b=S1CUzuntRE/VqRLrGQAzaX3YV1ye+r+NuTKpWjgtvVbHXgQccw3icdcJWEnPbrWB2z
 mXcoKGgNOtMPD539wd+oaR7QLOIgj1PI/hdf5AHVCSpZZIEcxaUNyIu5SnhWJAMwTECz
 nCHUALmRLN/ogTLJvMfukOhrcOdBoX7UlrjD+pu8p5Te0gpemdr5mADYmtVoH7rAwRyb
 BfggZTZeFfVteClkMoK3lfIYQ+1gSUWKU7ZFxiFWkmt7bAp823+nug2EFGU0AOC/E2kv
 uilptLpEcF/wlvTmWeXFQ4c53a3Tt6ESCwCYl8U1rmYZQdTPE/+08NrdwoQgyIKiZPAA
 x28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708806209; x=1709411009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swlI7PRB250VIrfVaxWLmLFtXrAzrbSEgzAoIdtMN+c=;
 b=Ik5esGRloFH2qcUxSeFe+itrbd66RBtveZFuqml+f/PHpdWp3G7u0XHKhD/ACF0piA
 ch+Xf1rBCThxuJ1ZrGDLBZ7phGd08WiccjI/fEn0xVD7aPm9RoPeZNGdpWoetxXyq8Yz
 EKAibnADR0568rdFw2PoQmgTcT9FOGBvTzrpqf3EMwgJO7XzL7pMr6KtvYdX07OaQKiK
 reQwmVUj/XkUiRIlgC2KW9TpbOiwNFOrzBJAuwO3YQLKDtO2AkFwCm901xRVj56Fazzu
 VVT7tfK3w39dihlpw8xYLZQuWCL8tYNr9oFx1Hux2N9QcC0+DFgPb81T5z2n3uTcng98
 DO+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzfevObDK6POCCpZDHK/JvbtdAyUEKcIzeO22ViUQJS04ZFo+H7DII7o0USNAxx2se38aM/8kylWbDmVVuUb5KT+Ym
X-Gm-Message-State: AOJu0Yy4UWKDkScb01GFSpNBATorwmVvqv8HPpjkZxx7uuzCOkp5+NGY
 0oRHs3kWqz3CCE7oVwJVkor4//xNBcxT2i+qtoSQbwkUIaRYxKVbCFzC3fTs
X-Received: by 2002:aa7:d297:0:b0:563:ccd1:26bd with SMTP id
 w23-20020aa7d297000000b00563ccd126bdmr2054363edq.2.1708806209175; 
 Sat, 24 Feb 2024 12:23:29 -0800 (PST)
Received: from localhost.localdomain ([212.70.108.232])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a50ee02000000b00560c6ff443esm816108eds.66.2024.02.24.12.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:23:28 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Rayhan Faizel <rayhan.faizel@gmail.com>
Subject: [PATCH v4 0/3] Add support for I2C in BCM2835 boards
Date: Sun, 25 Feb 2024 00:32:42 +0530
Message-Id: <20240224190245.2405016-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gK1oCeXPAg3H

This patch series implements support for the Broadcom Serial Controller used
by BCM2835 based boards for I2C.

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

