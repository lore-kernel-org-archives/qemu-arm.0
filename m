Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2043848ejb;
        Thu, 7 Dec 2023 18:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb4G+zVXpcR1V9cvhOElDKqEnX7cIKnooYfB6lrYqcvl2cHn8788b8fI7vvu++HPKwWJUm
X-Received: by 2002:aca:2116:0:b0:3b9:e2b9:3b83 with SMTP id 22-20020aca2116000000b003b9e2b93b83mr1392179oiz.91.1702002745029;
        Thu, 07 Dec 2023 18:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002745; cv=none;
        d=google.com; s=arc-20160816;
        b=MpFhivDtHNU+eFz+Zgw4NMY8jQbAfmmCGb/dag3MPIy/MHvpWvryGkQWy5PjEWIemA
         Nuxf8imtNN8AeRm7nylcewImbd1ciZ0FjWV4ftenwr/B0hhflOcb7J6rpFII4UawhQKv
         BcHnstcEMHp1F0tfWnBUejB/3eZJ7Qztt7QvMbt8fRQbnwIHwv3huZb2WLC46ZMyiTYV
         O5Wn4fHJD3WG7hbfoKlnVSgSjtLIFcJJrVoHOzIrl3h5mr7KuXGtBFj0/Nl1lmQHReEb
         fBcTKw1R68pqhQVnzT5njEEJ9ZIzTssBkjOKxV2Z2Rhh+BJnT7oNSGFEefubZM2asErl
         RjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ufq6y3GoZOqSXacge3PeDeTBuNf1nfrFg4wk8vPpayU=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=tOX/XDhLVMHLgAfRWRi9UXkv5mVZdUME6RwaFT5miN8iduajGHespHu9V6R5gjL7TJ
         gjoeBHVltQ8DwJm2o/oxBr+6SzkZBaUbylamA4PUsqBQbeUVisyfa84rVpgCkWqTjoLd
         /GBh/q7T6/J/c9KxXZJRda5EW8AobCdzbcAdtPHne8Ob2XlnAgJ1upa9SKH5AD3qlDkJ
         8N3HK4sAQ+c9RpMNHA2qxpefOtN6Z5phg3aqY91EXzpmCjUPtOXAHCvukIacLuRHRm+6
         FeZ2FVpAePqfcrlHFAFYugtGvrvXGuTqQ7+7Nk9lQVTC4BtA/TSQ8TmF4o1FTEPx3MiP
         0utw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ixJLBNyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a258a00b0077dce23fd9csi1204851qko.22.2023.12.07.18.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:32:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ixJLBNyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQep-0003sT-Fg; Thu, 07 Dec 2023 21:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQen-0003rz-Tg; Thu, 07 Dec 2023 21:32:01 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQek-0002G3-1l; Thu, 07 Dec 2023 21:32:01 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9f099cf3aso22640791fa.1; 
 Thu, 07 Dec 2023 18:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002715; x=1702607515; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ufq6y3GoZOqSXacge3PeDeTBuNf1nfrFg4wk8vPpayU=;
 b=ixJLBNyLlia2tww22nE3J9j0l1SV5e07dLGOZOOfbBhbjT3+0s+u26V00M3grft4IH
 3aCLB7aj2ZqX+KZOa8m9ivgtIkq+FoBKWJYSEP/Q87hYIfZFgLTTr8mbE5P6LizRN+vx
 WPNvtiXy2jl94MZHAxrIp29PXvGvamk2hkDfplOeJCiqISyXdyyIYFJSn9CMfoJlFuCZ
 LETwHkCG1NVmOtFCRsSDdEtMXtuDZnE3YBfbnIc+e1gJfgEldj0LndYnr8+PNFScOQYq
 hJScFyYn66naAYCCTy43aQUSriPzOw8HwA596H8Ukt3B+jeNoKMtmBohNq4JmqsT5SbQ
 /0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002715; x=1702607515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ufq6y3GoZOqSXacge3PeDeTBuNf1nfrFg4wk8vPpayU=;
 b=L6tF9SsSklhDgzy4bRuKAVqaJFeY73EMJeJ6iwNBJdc1dLZLLkI0hvhIwCRQWL5Fo1
 /LGtwPRIiPZ7EKuNquNZ96d4h4f2Na5BZjxOGyxfton/sBLiImKva13oMWJ4zK9uD+BI
 8P5qiNbphYCH1j+GADQt/GGJiVt/fnhGhJvDRj57NBdrSAqO39n6rNFJEv8z6JS9RROE
 Aw8aiZDvAcZ4olTGZIfOrVqvgpmYsGW3DQ8j1jMUcu92plrTaczLva1phZP4rFIMecpH
 FDVjXKJhAqS+0xU7c36nRURIo+7owYjoyWgnJDu8cW0b8oXeAd01H81DYq0JLffykjwM
 bqEA==
X-Gm-Message-State: AOJu0YwyA/Js85RCNcaW+bu+TirCH5kDSSYjrXGge1Y223KK4fDRn018
 cqB60EibblhrwKBnT4WPnzlysMRhCt+llg==
X-Received: by 2002:a2e:8718:0:b0:2ca:d14:96d0 with SMTP id
 m24-20020a2e8718000000b002ca0d1496d0mr2296779lji.71.1702002714626; 
 Thu, 07 Dec 2023 18:31:54 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:31:53 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 00/45] Raspberry Pi 4B machine
Date: Thu,  7 Dec 2023 20:31:00 -0600
Message-Id: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22d.google.com
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
X-TUID: xN+kDkzTTpP/

Introducing Raspberry Pi 4B model.
It contains new BCM2838 SoC, PCIE subsystem,
RNG200, Thermal sensor and Genet network controller.

It can work with recent linux kernels 6.x.x.
Two avocado tests was added to check that.

Unit tests has been made as read/write operations
via mailbox properties.

Genet integration test is under development.

Every single commit
1) builds without errors
2) passes regression tests
3) passes style check*
*the only exception is bcm2838-mbox-property-test.c file
containing heavy macros usage which cause a lot of
false-positives of checkpatch.pl.

I did my best to keep the commits less than 200 changes,
but had to make some of them a bit more in order to
keep their integrity.

This is v2 patchset with the most of v1 remarks fixed.
I named it as 'v4' because of mistakes while attempts to send previous patchsets
Please ignore all other v1...v3 patchsets except the very first one.

Sergey Kambalin (45):
  Split out common part of BCM283X classes
  Split out common part of peripherals
  Split out raspi machine common part
  Introduce BCM2838 SoC
  Add GIC-400 to BCM2838 SoC
  Add BCM2838 GPIO stub
  Implement BCM2838 GPIO functionality
  Connect SD controller to BCM2838 GPIO
  Add GPIO and SD to BCM2838 periph
  Add BCM2838 checkpoint support
  Introduce Raspberry PI 4 machine
  Temporarily disable unimplemented rpi4b devices
  Add memory region for BCM2837 RPiVid ASB
  Add BCM2838 PCIE Root Complex
  Add BCM2838 PCIE host
  Enable BCM2838 PCIE
  Add RNG200 skeleton
  Add RNG200 RNG and RBG
  Get rid of RNG200 timer
  Implement BCM2838 thermal sensor
  Add clock_isp stub
  Add GENET stub
  Add GENET register structs. Part 1
  Add GENET register structs. Part 2
  Add GENET register structs. Part 3
  Add GENET register structs. Part 4
  Add GENET register access macros
  Implement GENET register ops
  Implement GENET MDIO
  Implement GENET TX path
  Implement GENET RX path
  Enable BCM2838 GENET controller
  Connect RNG200, PCIE and GENET to GIC
  Add Rpi4b boot tests
  Add mailbox test stub
  Add mailbox test constants
  Add mailbox tests tags. Part 1
  Add mailbox tests tags. Part 2
  Add mailbox tests tags. Part 3
  Add mailbox property tests. Part 1
  Add mailbox property tests. Part 2
  Add mailbox property tests. Part 3
  Add missed BCM2835 properties
  Append added properties to mailbox test
  Add RPi4B to paspi4.rst

 docs/system/arm/raspi.rst                |   11 +-
 hw/arm/bcm2835_peripherals.c             |  218 +++--
 hw/arm/bcm2836.c                         |  116 ++-
 hw/arm/bcm2838.c                         |  288 ++++++
 hw/arm/bcm2838_pcie.c                    |  289 ++++++
 hw/arm/bcm2838_peripherals.c             |  292 ++++++
 hw/arm/meson.build                       |    8 +-
 hw/arm/raspi.c                           |  131 +--
 hw/arm/raspi4b.c                         |  112 +++
 hw/arm/trace-events                      |    6 +
 hw/gpio/bcm2838_gpio.c                   |  389 ++++++++
 hw/gpio/meson.build                      |    5 +-
 hw/misc/bcm2835_property.c               |   47 +
 hw/misc/bcm2838_rng200.c                 |  420 +++++++++
 hw/misc/bcm2838_thermal.c                |   98 ++
 hw/misc/meson.build                      |    2 +
 hw/misc/trace-events                     |    9 +
 hw/net/bcm2838_genet.c                   | 1088 ++++++++++++++++++++++
 hw/net/meson.build                       |    2 +
 hw/net/trace-events                      |   16 +
 include/hw/arm/bcm2835_peripherals.h     |   29 +-
 include/hw/arm/bcm2836.h                 |   27 +-
 include/hw/arm/bcm2838.h                 |   31 +
 include/hw/arm/bcm2838_pcie.h            |   75 ++
 include/hw/arm/bcm2838_peripherals.h     |   97 ++
 include/hw/arm/raspberrypi-fw-defs.h     |   12 +-
 include/hw/arm/raspi_platform.h          |   37 +
 include/hw/display/bcm2835_fb.h          |    2 +
 include/hw/gpio/bcm2838_gpio.h           |   45 +
 include/hw/misc/bcm2838_rng200.h         |   43 +
 include/hw/misc/bcm2838_thermal.h        |   24 +
 include/hw/net/bcm2838_genet.h           |  426 +++++++++
 tests/avocado/boot_linux_console.py      |   92 ++
 tests/qtest/bcm2838-mailbox.c            |   61 ++
 tests/qtest/bcm2838-mailbox.h            |  584 ++++++++++++
 tests/qtest/bcm2838-mbox-property-test.c |  621 ++++++++++++
 tests/qtest/meson.build                  |    3 +-
 37 files changed, 5551 insertions(+), 205 deletions(-)
 create mode 100644 hw/arm/bcm2838.c
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 hw/arm/bcm2838_peripherals.c
 create mode 100644 hw/arm/raspi4b.c
 create mode 100644 hw/gpio/bcm2838_gpio.c
 create mode 100644 hw/misc/bcm2838_rng200.c
 create mode 100644 hw/misc/bcm2838_thermal.c
 create mode 100644 hw/net/bcm2838_genet.c
 create mode 100644 include/hw/arm/bcm2838.h
 create mode 100644 include/hw/arm/bcm2838_pcie.h
 create mode 100644 include/hw/arm/bcm2838_peripherals.h
 create mode 100644 include/hw/gpio/bcm2838_gpio.h
 create mode 100644 include/hw/misc/bcm2838_rng200.h
 create mode 100644 include/hw/misc/bcm2838_thermal.h
 create mode 100644 include/hw/net/bcm2838_genet.h
 create mode 100644 tests/qtest/bcm2838-mailbox.c
 create mode 100644 tests/qtest/bcm2838-mailbox.h
 create mode 100644 tests/qtest/bcm2838-mbox-property-test.c

-- 
2.34.1

