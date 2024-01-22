Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2742267ejg;
        Mon, 22 Jan 2024 13:09:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXrR6h6eivVSSxuwitPNt//IrOwe4bImvYoExdlaip7x5U4VBNWHwJd7vQNgwdlawVQFrN
X-Received: by 2002:a05:620a:4ac2:b0:783:18c9:82fd with SMTP id sq2-20020a05620a4ac200b0078318c982fdmr4445480qkn.152.1705957781438;
        Mon, 22 Jan 2024 13:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705957781; cv=none;
        d=google.com; s=arc-20160816;
        b=eD91wWVKyh2OAX3XZ/I8MQ3LAEon+vwAZmfUFcQSlALtjs2GsNJevAcAX3/AwoxfSz
         O5o/238NRx2Sk9EB1lmZLm6TZGX/nCP7geWc2FjNW2NG7XntXwbgEDW/JssKRUD+0xal
         EI/9dWzOJQECQ0iatvHlOn+lORedPdKPMC3lzNuZ9uzfwZB9KO/FSXxdDHp5pkTs8ByR
         z9tPx849cU4Lh58w3v1011JsAZHgVtuvJstAkGfD/Ba5AtitOicOcK0dPu+C/j45ymb9
         Z4Bjw2hOYacKY4sov63mtCtyjD9M7sTPAcsNRJoMV5jgBupD3SdoANsYFOV1fyUSrlZC
         dd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=uwcVHJtoVwltkEe7uG4eAtO5K9OrftpY5b6QwEFjIL0=;
        fh=liRAIRxIADE2bmfasMOmYEUti54kpYvQeX8i34UwbXI=;
        b=HFz9d7Ct5TgCmFCXvZFX4fiNTI92CCxZqMhTReYuJ9gXnDRYM/puubmp6ePnlLe/84
         vb4Fg9tddlJGM6rsqEbADefMqMK9X92mysxyeVfKsOGe2N6NdYech3LZ3b5eNeFxOSF5
         5q3Wm3gzNU+DPCuN+Hz4MFeKvvM3CwsJLaEQ6Hk1aKlhVe3mw1bk1IBjoP7/+r5jsRi0
         YDETi2mjJDJOUe5VrPJqOwGEoSAt6UXxO7vKnFADqWOtNU5HFptO27VwAxSOVzR6PBPd
         y4+qES1SKeld6tAwmFVrrUZCkppjftoxcWfiQLG1rufd6dr4PzLMiEVezcBrNRWlT8Af
         P55A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=VLumwD2f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wg26-20020a05620a569a00b0078357576a47si6295831qkn.459.2024.01.22.13.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 13:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=VLumwD2f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rS1Xc-0000Yt-PG; Mon, 22 Jan 2024 16:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rS1XE-0000Pp-B7; Mon, 22 Jan 2024 16:08:48 -0500
Received: from zproxy4.enst.fr ([137.194.2.223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rS1X9-00012J-L6; Mon, 22 Jan 2024 16:08:48 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 0833E2011B;
 Mon, 22 Jan 2024 22:08:40 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id YJm5nWb6K73i; Mon, 22 Jan 2024 22:08:38 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id B6CE9205DA;
 Mon, 22 Jan 2024 22:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr B6CE9205DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1705957718;
 bh=uwcVHJtoVwltkEe7uG4eAtO5K9OrftpY5b6QwEFjIL0=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=VLumwD2fdDJ1qH2B8Zyk4vEt+TVsl0XrI7XUmIsFWB42Cc+PbtDEYKreN5eOL6YVa
 LZIM22DLrbTZYv9YBlFpUcILrt8hdZMcvyelW/RrvkxBjk/Fhnys/DYjVA9Kna6UGg
 AOKGYAixCN6woM5xxW0JF5qW/pKM+bw54I3xDfL8=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id Ux9oiEEIlAWJ; Mon, 22 Jan 2024 22:08:38 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id D5B5D2011B;
 Mon, 22 Jan 2024 22:08:37 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
Subject: [PATCH v2 0/3] Add device STM32L4x5 GPIO
Date: Mon, 22 Jan 2024 22:02:01 +0100
Message-ID: <20240122210829.127691-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.223;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy4.enst.fr
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
X-TUID: +dsM1RAm71Du

This patch adds a new device STM32L4x5 GPIO device and is part
of a series implementing the STM32L4x5 with a few peripherals.

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
 hw/arm/stm32l4x5_soc.c             |  79 ++++-
 hw/gpio/Kconfig                    |   3 +
 hw/gpio/meson.build                |   1 +
 hw/gpio/stm32l4x5_gpio.c           | 447 +++++++++++++++++++++++++
 hw/gpio/trace-events               |   6 +
 include/hw/arm/stm32l4x5_soc.h     |   2 +
 include/hw/gpio/stm32l4x5_gpio.h   |  65 ++++
 tests/qtest/meson.build            |   3 +-
 tests/qtest/stm32l4x5_gpio-test.c  | 520 +++++++++++++++++++++++++++++
 12 files changed, 1115 insertions(+), 17 deletions(-)
 create mode 100644 hw/gpio/stm32l4x5_gpio.c
 create mode 100644 include/hw/gpio/stm32l4x5_gpio.h
 create mode 100644 tests/qtest/stm32l4x5_gpio-test.c

--=20
2.43.0

