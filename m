Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2328197ejb;
        Sun, 3 Dec 2023 13:29:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGfkQQg5VNn+ddiynBLXupmkT1I5bOp6y9sKi+NPV2ZAD14WwHWfPkX9DlU5i3xIcixMV9
X-Received: by 2002:a05:6830:18d6:b0:6d8:7937:876a with SMTP id v22-20020a05683018d600b006d87937876amr2506161ote.17.1701638993296;
        Sun, 03 Dec 2023 13:29:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701638993; cv=none;
        d=google.com; s=arc-20160816;
        b=WPE6Hot8NEXWhnfDUzZiwy2xytiO1owJLaoCrdw0eWLN26uYR+YtAjP/ZORsjG+AAA
         6hQbRq80wztKIOKqTfxnMBOWQh0nu48P2KDaB3czUWjFnYOP94uYSjnL/SqvHRsVOlKP
         p9jZoCqHJD3efmCRuVrCXulAPNJIa0hZ4qFDqbqWQQNiXYWaS5LtD7PkJRIhuno3F+kC
         5lbNOpazfSgffjzTpqXUCrUkaxETaII0nQi5HK1kGZi898dkw++bOZ4X2HKnmA+2+1+J
         WeiiNncofwrYpaSRyrwl/zWO8SDIgmdcEv5ytybKrluc6ufRjJVEPym1ckIem6SLc3b5
         v+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q2D3q7fdZZLvlAno4Gl/Bt0FCeEGq5JfNlGK60mJfjw=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=JwqHtHzUTU+BtJxtP43GrX1LZu1WJw61FHR0/jYR5snYE0RdqFKq5K4JPu0uiblLES
         ZPFpRRvwFZUOPXFScVByZUieWJrwKoBj58gAMEkkdxKfEmm5B6r3kM0nKin4GCUNsfBx
         nHVDX51GNv3NQHzv7RR6mQh7RQ0tWIaFU5L0qACqTCom5tyC00eEMqWBEyCfRIsooAYp
         KmL5S52ceikNSpcPQwATAw+qkesOhrHwH+WqcB0a1IGk1+BwNJXsVIf8mL8hoDPgspba
         dNHWGXrGdzWb01JZbsOykGBjOPeu/5/LV1pUK11Pd7hj2aD6zPU3w0k7Ye2VJxoAq17a
         fb+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SaQ3Riok;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a290100b0077d69eda134si8647824qkp.306.2023.12.03.13.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:29:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SaQ3Riok;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9u1b-0001IV-0g; Sun, 03 Dec 2023 16:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u1Z-0001I2-IV; Sun, 03 Dec 2023 16:29:13 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u1X-0005Mm-OB; Sun, 03 Dec 2023 16:29:13 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-daf7ed42ea6so1999751276.0; 
 Sun, 03 Dec 2023 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701638949; x=1702243749; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2D3q7fdZZLvlAno4Gl/Bt0FCeEGq5JfNlGK60mJfjw=;
 b=SaQ3RioksbFjipQ6KN9A3XUG1shqkiTF9/TP6850qYkksz8miuu6Tpoi1Fpq2NbrMa
 UZXGq2tICXwt4nKLmYMj91R6kw4dDBHuyPVlNqO9K89eZF2y6e4a+G2XvMpkAFo8r/jV
 Z7Jdh2902DQhYurtxH5xVhSsxAeo7CZg6Sc70dCJjHbwz1bG/0Q2NwSBTh/Ihq71v8VS
 uofaeY0RMtX+W3bgevnvHaegvCjgnbagetNFqGa9z5F6q3bEYykB3D+tWndCgIUko1FA
 sGIk744umvzALBc8g+bj2n/+9fJykWJS+P6W4I95bp68U2uR/8PL2AKEVf/3p6tJPuIL
 QFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701638949; x=1702243749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2D3q7fdZZLvlAno4Gl/Bt0FCeEGq5JfNlGK60mJfjw=;
 b=RfWX/Bwhi3D8XqsmEoR7XGMB2kxD59oob9fYNAJPc06FL/sG+7dtoT44Et/4nXY5dq
 gRjmd0QukVcMtd2bVSLcq/LP1wac8cn4KqrHu9Zl0jdpiLqGZUoqal/YA7JC+Pyk+2Kk
 j8smH4EzxOI+XCRB01+7AgyXhJwPMT/7ZlyCGuTTyLQnLEsK0uyvOSZtcy4CZ1GN8rd+
 VopWnX+tgNr77vn9r1I+Hu3Hbbqchpg3v7X07g/H9pYoobgQ8uvVLprvPjcSGEWe3+W3
 GcMslQNO8JuohTu17iMJT0a3YUR5lM3/rMPtJVUnjpchvu3u8jLy4/oqa5XzD+QuPFRe
 jvgw==
X-Gm-Message-State: AOJu0YxY3Gc/8E6VvzurIFCwtH1jLq7AQxQsv5NSEyv56hcAntJMX7ZC
 XT5L6Go1M5RgPO5l0u9y/ajghQ0DZJN9GQ==
X-Received: by 2002:a25:2d26:0:b0:db9:570d:d660 with SMTP id
 t38-20020a252d26000000b00db9570dd660mr938278ybt.40.1701638949249; 
 Sun, 03 Dec 2023 13:29:09 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a25a291000000b00d9cc606c78csm1807318ybi.41.2023.12.03.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:29:09 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 00/45] Raspberry Pi 4B machine
Date: Sun,  3 Dec 2023 15:28:20 -0600
Message-Id: <20231203212905.1364036-1-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=serg.oker@gmail.com; helo=mail-yb1-xb33.google.com
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
X-TUID: Iv+EcFyRe/1C

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

