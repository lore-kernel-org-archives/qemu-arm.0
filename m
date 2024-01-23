Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp278018ejc;
        Tue, 23 Jan 2024 04:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs2+XzlEBybk5j0J9J127+Y8sCU2p5jy+NR2z7n3IQijOhDt8w5Suo1E3vWO7lSBk5aswm
X-Received: by 2002:a05:622a:11d2:b0:42a:2e93:b98d with SMTP id n18-20020a05622a11d200b0042a2e93b98dmr913200qtk.17.1706012745074;
        Tue, 23 Jan 2024 04:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706012745; cv=none;
        d=google.com; s=arc-20160816;
        b=dbbSJ5mkqnhIvFV+prG7pRWjkpXZJeYazux4Sz7swtkv7Jcn7AhCQgkJIGMJQTaWDS
         q2VDzbRdfcONhpkVeind/6gLypmVoNVKH0ckNyNBCp4SYz/zY1ORifMa0hOFKrfRJycK
         4CK/chZc4toRkHSa6TZfmU9MbXgzPciqlafa9/d8hB1uE8+yl0mXWt5+hl+nXFnGAtM+
         DkEGCjxt8lefFjIhW9weCjLeeiuU9nZXckgP5RzDv4/CBPhZIMlOsIuN0HPjQFW3X3Ux
         yA1P0KLOqudFrXI2IIOyJdJ+RdR0UpS/tAdABBfWdSh5Z/VwCIss9ikB5nRAvtW5msWE
         rBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=tqPDx3vKPo8imUs2ABP3ymYy7Fs2Y0cI0+VAG/zvE70=;
        fh=LdAD/9ctR0G6/YTvm0zIwwcZk0r0ti2IJ5E4AJuYYgA=;
        b=pLC+kf0ZKm5YmUbdvTTASU53Fwf0egqQGJfYjnp6UOGHBWTkfWyLw7a7Dw90tvcVKd
         g19sO+y8z5U25osyLEFUqvI3Smnoc2rcq00W4rBEjUnLuT0QjBGqKpRqM1N9cK9Zrfwd
         m9nTEV+gYUsnYh0OQBpAuXOuwQ7gxSTYjugJr/o7vifyJdFpyntQfNYVk7Y0cGFACWz+
         67jfZay7MPtfBX37/ZlXwMTHW5k/IaO1NxgphOJ0kknO5zbEMryRkPXkIldasJKFjncc
         2bjfKUZitwjWdW7p9x3rgasqrbKgePkqY3pxGf1x6TIm2s1DDH5I2Q91l1lfSY7jI0J6
         Pdwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=2HxZOZVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac85d03000000b0042a1c77a496si8007413qtx.665.2024.01.23.04.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 04:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=2HxZOZVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSFqN-0000YY-Rl; Tue, 23 Jan 2024 07:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rSFqG-0000Wu-Nn; Tue, 23 Jan 2024 07:25:24 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rSFqD-0002Fs-1c; Tue, 23 Jan 2024 07:25:24 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 1FEF9A05C4;
 Tue, 23 Jan 2024 13:25:14 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id etrq1au-SX-9; Tue, 23 Jan 2024 13:25:13 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 2A041A065A;
 Tue, 23 Jan 2024 13:25:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 2A041A065A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1706012713;
 bh=tqPDx3vKPo8imUs2ABP3ymYy7Fs2Y0cI0+VAG/zvE70=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=2HxZOZVsTkVP8Wpuewc0h4TLTe3YsqPWxAtB6zlA9th5iV5RWWWk312ptMOHIk2eF
 IjEnCuS0/6tsQMLNu6VOLFlZgYzFU8Xg4kRJlYJzzJpYGGTcyO3b5zr0+A/GoJ5ub+
 ozrE+lkXNhgvnZk/bPuj28cjlR3CTIajbJoBAd3c=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id uRncy-tr7_r2; Tue, 23 Jan 2024 13:25:13 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id A6C1CA014F;
 Tue, 23 Jan 2024 13:25:12 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/3] Add device STM32L4x5 GPIO
Date: Tue, 23 Jan 2024 13:22:51 +0100
Message-ID: <20240123122505.516393-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0qxUxnQTvQkh

This patch adds a new device STM32L4x5 GPIO device and is part
of a series implementing the STM32L4x5 with a few peripherals.

Changes from v2 :
- correct memory leaks caused by re-assigning a `g_autofree`
pointer without freeing it
- gpio-test : test that reset values (and not just initialization
values) are correct, correct `stm32l4x5_gpio_reset()` accordingly
- adding a `clock-freq-hz` object property to test that
enabling GPIO clock in RCC sets the GPIO clocks

Changes from v1 :
- replacing test GPIO register `DISCONNECTED_PINS` with an object
property accessed using `qtest_qmp()` in the qtest (through helpers
`get_disconnected_pins()` and `disconnect_all_pins()`)
- removing GPIO subclasses and storing MODER, OSPEEDR and PUPDR reset
values in properties
- adding a `name` property and using it for more lisible traces
- using `g_strdup_printf()` to facilitate setting irqs in the qtest,
and initializing GPIO children in soc_initfn

Changes from RFC v1 :
- `stm32l4x5-gpio-test.c` : correct typos, make the test generic,
add a test for bitwise writing in register ODR
- `stm32l4x5_soc.c` : connect gpios to their clock, use an
array of GpioState
- `stm32l4x5_gpio.c` : correct comments in `update_gpio_idr()`,
correct `get_gpio_pins_to_disconnect()`, correct `stm32l4x5_gpio_init()`
and initialize the clock, add a realize function
- update MAINAINERS

Based-on: 20240118091107.87831-1-arnaud.minier@telecom-paris.fr
([PATCH v2 0/7] Add device STM32L4x5 RCC)

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (3):
  hw/gpio: Implement STM32L4x5 GPIO
  hw/arm: Connect STM32L4x5 GPIO to STM32L4x5 SoC
  tests/qtest: Add STM32L4x5 GPIO QTest testcase

 MAINTAINERS                        |   1 +
 docs/system/arm/b-l475e-iot01a.rst |   2 +-
 hw/arm/Kconfig                     |   3 +-
 hw/arm/stm32l4x5_soc.c             |  78 +++-
 hw/gpio/Kconfig                    |   3 +
 hw/gpio/meson.build                |   1 +
 hw/gpio/stm32l4x5_gpio.c           | 456 ++++++++++++++++++++++
 hw/gpio/trace-events               |   6 +
 include/hw/arm/stm32l4x5_soc.h     |   2 +
 include/hw/gpio/stm32l4x5_gpio.h   |  70 ++++
 tests/qtest/meson.build            |   3 +-
 tests/qtest/stm32l4x5_gpio-test.c  | 586 +++++++++++++++++++++++++++++
 12 files changed, 1194 insertions(+), 17 deletions(-)
 create mode 100644 hw/gpio/stm32l4x5_gpio.c
 create mode 100644 include/hw/gpio/stm32l4x5_gpio.h
 create mode 100644 tests/qtest/stm32l4x5_gpio-test.c

--=20
2.43.0

