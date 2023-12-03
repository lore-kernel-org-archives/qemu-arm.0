Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2370069ejb;
        Sun, 3 Dec 2023 15:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyz4VUYqcgn2+modZzrOBsK1UEPX8nv3hYa1LBECq3qEDHY1F5hZYMf9ZTKcuKkRHvMnM7
X-Received: by 2002:a0d:dd45:0:b0:5d7:1941:2c35 with SMTP id g66-20020a0ddd45000000b005d719412c35mr2182327ywe.98.1701647004871;
        Sun, 03 Dec 2023 15:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647004; cv=none;
        d=google.com; s=arc-20160816;
        b=nbQPgSToHVNpQORYKIyo7J3KufFjtcui7Lo4gi9Fz0ec1bg1aubqVee7dngdHD3a13
         aZqSuLWH+zguxPjq+zpIqy3ZvLFaXhAaeIcDvFJgBlwzgFFBo+op/LwSiyHTNszgEjzr
         AwpHqe46oME6cLCgdf3FIp8w/YR1P53s1CGTzjghgwZkFd+Z7g3igdfKi3HR1Ukc4zvW
         u3EPAYILfAj6bRJDxIqcGeqr1mvj/q5aYH3Siu+MR6I3KDaVzqTMtlNfb4K7r2l+zxZL
         jpuCVlxkzRObqNdPBuTJ5ehcbAAA1DJPdEZzuF5xCtVJQKjyqZDoC88nt5opBKfj5sSn
         9URw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vjJI0cIxkRTZ5OWIw3bVVRHcwjcOeypwu8X8iyLqwmA=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=xK9Fc7C5igK0edfZbRDFy63BBclQ/Bie7S/j8tIoLdyUyWgAAPXoiIJAdTrfyDEtYc
         5V/u2wHGiwtDscnnaQ064hcuTG7PMl8JiH4E8DiqrCTl8ymuax57XDrE6S4SIzRNeZjA
         ypwxqcRLH/a0rksOYM3qV0o8QR/7BvyAIOcYMNTs10/NimcGE1V97Ls4HLmGYrf0j+CJ
         2BwCn/yCcENW3jhPwyH/bcxItKDNMg8kLdTqH/UmZtARBXIM2DCpVE0kf+ULMKSDQqM4
         grSPyjbdYalE2/rkfpRcXL0f5bCw1+UAWyHC/CcvRALLY/57QsAdckUZwF4OqmCtWlsp
         R9tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="j/rCtnic";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a05621415c800b0067aa3fc100dsi4981035qvz.428.2023.12.03.15.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="j/rCtnic";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w6P-0006mH-Tj; Sun, 03 Dec 2023 18:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6O-0006lk-GF; Sun, 03 Dec 2023 18:42:20 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6M-0002h9-OL; Sun, 03 Dec 2023 18:42:20 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5d3efc071e2so29022617b3.0; 
 Sun, 03 Dec 2023 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646937; x=1702251737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjJI0cIxkRTZ5OWIw3bVVRHcwjcOeypwu8X8iyLqwmA=;
 b=j/rCtnic1AbsTsAZrxJg50UVqZq1YfTyQ0WTmcQsVR41rZccSys9VTx1fKQg0hoJhd
 nK/0geoSFkdVH+VR9FVEaRGORCB1ydZfrsHxhrgscpqnR3FlMfWh7+Ryp+pJUVNQEj7f
 IKoF8HPxVbBXbgVel1aaaro0RulrmU4JAUIl0Dlyoc4E0AuWO8kbwDPXDkGftUv64s9e
 VHnNmBN2MFLo67SkRzmruUKlcfZFMcaMfwFw/nCJLBcDxqvtxFPPbJ4z4Ww4gMixV9fj
 3OoZSkiTb1+Db1bxH1K4ADUtk1U3qzngOscuYxRXQTq1/KW0CjdAx2Q/6L6kIHebt62N
 KOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646937; x=1702251737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjJI0cIxkRTZ5OWIw3bVVRHcwjcOeypwu8X8iyLqwmA=;
 b=vdQriJ+OdVAWxPfFv8Bw+nhKUMmpcf61dMt1+ThRIMK3OTyPiiNdCpxr/IcIroZpjB
 aZhPrMEYpntStu8JiYEmfILcB10nONM558FzCf0CCsN7MoaUb0RmUvBlH16w8EVI9o+2
 TgpEKBGA4lVP9018GA9bJvpAdYhNNUsyJ2DFhZGt710lWZH0iRda58OiP/anv1og8QYT
 I//F/amtjoJ0WFp5Fq/IzAsU1Xz4o0Xhryb8f8L+4AQTFLwcIZZCVl93guHxR8B2ls0G
 Y+Wt09LV+M8Hhn4xLqxZVLILplJA9BUQnMZSVjWLdQ/uIoRRUU2+8qs/zXRu8NZ1P+lx
 vtJQ==
X-Gm-Message-State: AOJu0YzzEs+TKLBoZsUQL6j+FsifhG4fugCbIfT0WX2HRheC4w89L2S1
 Em7TfCgjcom8Pk3WRymMShNQ+645HJGm2g==
X-Received: by 2002:a05:690c:f85:b0:5d7:1941:2c25 with SMTP id
 df5-20020a05690c0f8500b005d719412c25mr2488889ywb.82.1701646936782; 
 Sun, 03 Dec 2023 15:42:16 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:16 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 00/45] Raspberry Pi 4B machine
Date: Sun,  3 Dec 2023 17:41:28 -0600
Message-Id: <20231203234213.1366214-1-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1133.google.com
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
X-TUID: seu59vwhlGjQ

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
I named it as 'v3' because of mistakes while attempts to send v2 patchset.
Please remove all other v1 and v2 patchsets except the very first one.

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

