Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp371601lfm;
        Wed, 17 Jun 2020 00:27:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbZCmJY6hQFUlSY7y5ef/zfIye20KGgvAsped/Cqo4gRpqgE9jaMRuLABeOMpkOXzMEgoL
X-Received: by 2002:a25:9ac5:: with SMTP id t5mr10644968ybo.410.1592378837309;
        Wed, 17 Jun 2020 00:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592378837; cv=none;
        d=google.com; s=arc-20160816;
        b=k2tWNvFXhpG7UtmmxYjHq9OEcby9nPVGqNzjOKey+wigVS4ycfUlV34b8jyOwaGurQ
         1/AvVv39UgSvqsqJlIjAz9HiepZvFxUMxnuv6HDGRIrWbYSUdz9twSvuDzxAGUSA7JVY
         omAexOKWNW8qmJpKo7R5gaAd+sFa7vPq4/oLcr4pdNcl8ksBDLqldgjO9zBYcxDhwucy
         V9rUCqKsRtcWR1lX1R4S5prdO7Ic7w8RQiKXtoZslO4CUSXKjxD1FUMW0X5rAXKvDd7a
         KA0CRsg1ebKD1Rwc2rcmz027y7onQjfY3QGSXO7Civ2pi0nBJ6bjvadDSiOzeRRi0W1d
         /NAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=M7vrKWrrY+25XO42Kbwb2gQrpslD65DssODqflTMCXs=;
        b=UYX7Y+Hl3gwUHAxVw2CYl9o5UGa2BfbV4zzSnMuGTQyvBgA5mWu7LfkbuzsedyvQP7
         rJm73gnKhfyihoUm4IMMEWTX/BI1xI/axChNduRajJATA5z+KNf1P/vThC4thLtdB44x
         5oWw+JjxIOUWxcTegdjSk38u/4heZN43e565eJ0IXjc0yUNyDWIAHGtRp0qd9h09Zauh
         ic5oLOTxnIxZWCOSjuSrihMwX9aBCXDQtT7sDL/6VXtDy3T4tCKfb4zNRPYwvrqtkafs
         dPGa2cfmjO6ak47FNhBj7aIRRcsmubKmmFkJSQZhsxJ2u8LSxZbJPxOz6vAWnRSf0iHj
         pPxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qpub+M3D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si22919776ybi.345.2020.06.17.00.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 00:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qpub+M3D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlSTc-0006q5-Kr
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 03:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSA-0004RU-Fj; Wed, 17 Jun 2020 03:25:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSS8-0002XC-I7; Wed, 17 Jun 2020 03:25:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id u26so3810004wmn.1;
 Wed, 17 Jun 2020 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7vrKWrrY+25XO42Kbwb2gQrpslD65DssODqflTMCXs=;
 b=qpub+M3Doy+A+6wEwEVlczmxmUqLd2daVONUkDKtrFy3mAyMVGukMXwM6viVmqV5Xm
 rk+d0yE/AIlA1Lz4snm6HAJrJg5vf7vi7eF1/zBS0Q42aP9pFm/cHnArW7/5kl6c0L/m
 o1nS1O3qWe9mYCGTh9DitoF3/OO90pYdyRzZQKG0dmorEixo4RSnrnzSoqbIuOmDi5OE
 wReBVeyqr0MVY7AgP/xNpIEGmEwP9z1LAOGAzfigJsb8a+4GPa/Q4S49MMtCE2QATHgY
 4XeccTs7tfh4e8ikcUKIk7af+G/jFKpTdpHerQOaPME3CYjQ5B9EWq2tHDCTveEG3Zbf
 Mbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=M7vrKWrrY+25XO42Kbwb2gQrpslD65DssODqflTMCXs=;
 b=dADrgWghJtnPhac3m2MM+iFeLlOhYnDGCPLg5UbMuo8feLIPCLuLAYnghdHTbQVSWY
 LV8QwKh5RIb3nbUKSXKnobdRZB60KZVdwImyi6dYfdgWeYTzhp5gesFJYyr1mH/sL0t1
 dj9VEkaHoiLyoPPBXJIkYYWv+7uc4F6/XcSzTpGNH2tri84l0qosUAx3Eozp+FpbBuT/
 WKQ84XG3xINWTtGVsDAWg4jZ7uvHJhDTyQoyZvqmAjsy32b69UkuLmYGCK9jCfHMH0fg
 z2FJUP+lHUld4k3tOpunEHOicwhycNbmNP3oC3+T2khtn8NkZWBj8MZV0zzlUwCzKxTB
 uK7Q==
X-Gm-Message-State: AOAM530mqWF4jXcJSlxuN+PwVHpV5nhatRQH/HEFtjuISC0HRmwf1jpS
 6hxxyKhF1wQFJhQsW/jpceLke5+s
X-Received: by 2002:a1c:491:: with SMTP id 139mr6657461wme.99.1592378741716;
 Wed, 17 Jun 2020 00:25:41 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id j5sm32894781wrq.39.2020.06.17.00.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 00:25:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/14] mps2: Add few more peripherals
Date: Wed, 17 Jun 2020 09:25:25 +0200
Message-Id: <20200617072539.32686-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ELrO4gsnjNnE

Few patches while playing with Zephyr on the MPS2:

- clean 'versatile_i2c' a bit,
- describe it as 'ARM SBCon two-wire serial bus interface'
  which is common on the ARM documentation,
- add watchdog
- added fpgaio with correct prescale clk
- added i2c and spi
- added gpio/i2s as unimp
- dropped the fpgaio push-button patch

Since v2:
- added missing Kconfig select
Since v1:
- addressed Peter review comments

Zephyr ressources used:
https://docs.zephyrproject.org/latest/boards/arm/mps2_an385/doc/index.html

$ git backport-diff -u v2
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/14:[----] [--] 'hw/watchdog/cmsdk-apb-watchdog: Add trace event for lock status'
002/14:[----] [--] 'hw/i2c/versatile_i2c: Add definitions for register addresses'
003/14:[----] [--] 'hw/i2c/versatile_i2c: Add SCL/SDA definitions'
004/14:[----] [--] 'hw/i2c: Add header for ARM SBCon two-wire serial bus interface'
005/14:[----] [--] 'hw/arm: Use TYPE_VERSATILE_I2C instead of hardcoded string'
006/14:[----] [--] 'hw/arm/mps2: Document CMSDK/FPGA APB subsystem sections'
007/14:[----] [--] 'hw/arm/mps2: Rename CMSDK AHB peripheral region'
008/14:[----] [--] 'hw/arm/mps2: Add CMSDK APB watchdog device'
009/14:[----] [--] 'hw/arm/mps2: Add CMSDK AHB GPIO peripherals as unimplemented devices'
010/14:[----] [--] 'hw/arm/mps2: Map the FPGA I/O block'
011/14:[0006] [FC] 'hw/arm/mps2: Add SPI devices'
012/14:[0001] [FC] 'hw/arm/mps2: Add I2C devices'
013/14:[----] [--] 'hw/arm/mps2: Add audio I2S interface as unimplemented device'
014/14:[----] [--] 'hw/arm/mps2-tz: Use the ARM SBCon two-wire serial bus interface'

Based-on: <20200617043757.1623337-1-richard.henderson@linaro.org>
fpu/softfloat: Silence 'bitwise negation of boolean expression' warning

Philippe Mathieu-Daudé (14):
  hw/watchdog/cmsdk-apb-watchdog: Add trace event for lock status
  hw/i2c/versatile_i2c: Add definitions for register addresses
  hw/i2c/versatile_i2c: Add SCL/SDA definitions
  hw/i2c: Add header for ARM SBCon two-wire serial bus interface
  hw/arm: Use TYPE_VERSATILE_I2C instead of hardcoded string
  hw/arm/mps2: Document CMSDK/FPGA APB subsystem sections
  hw/arm/mps2: Rename CMSDK AHB peripheral region
  hw/arm/mps2: Add CMSDK APB watchdog device
  hw/arm/mps2: Add CMSDK AHB GPIO peripherals as unimplemented devices
  hw/arm/mps2: Map the FPGA I/O block
  hw/arm/mps2: Add SPI devices
  hw/arm/mps2: Add I2C devices
  hw/arm/mps2: Add audio I2S interface as unimplemented device
  hw/arm/mps2-tz: Use the ARM SBCon two-wire serial bus interface

 include/hw/i2c/arm_sbcon_i2c.h   | 35 +++++++++++++++++
 hw/arm/mps2-tz.c                 | 23 ++++++++---
 hw/arm/mps2.c                    | 65 ++++++++++++++++++++++++++++++--
 hw/arm/realview.c                |  3 +-
 hw/arm/versatilepb.c             |  3 +-
 hw/arm/vexpress.c                |  3 +-
 hw/i2c/versatile_i2c.c           | 38 ++++++++++---------
 hw/watchdog/cmsdk-apb-watchdog.c |  1 +
 MAINTAINERS                      |  1 +
 hw/arm/Kconfig                   |  8 ++--
 hw/watchdog/trace-events         |  1 +
 11 files changed, 148 insertions(+), 33 deletions(-)
 create mode 100644 include/hw/i2c/arm_sbcon_i2c.h

-- 
2.21.3

