Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2378281ejg;
        Mon, 22 Jan 2024 01:20:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0SYTcyZljxYgNArUS70BLrpgQ51v22IXlAKkU19/4OCOyo7Rrw9vnQxQOlYtpOiwdQ/wm
X-Received: by 2002:a05:620a:b09:b0:781:4d22:da3 with SMTP id t9-20020a05620a0b0900b007814d220da3mr4321719qkg.138.1705915225807;
        Mon, 22 Jan 2024 01:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705915225; cv=none;
        d=google.com; s=arc-20160816;
        b=C2E8bpvG6xFSRAP3PIu5URzteC5CdyK4If4hMCZ4PhFpJfKEVf+cV8KeRqnukfp7ce
         2YjvTOPHVeFtKwvHwf82GSDZ1H6ycmWSIR70qXcoCTeqSt2fZqQjiDraEJfX7vaX95+6
         FAWdX/yJOkfIyrPQEeFoWzD13sW3eKaBHL3dAYN/iaULKlJs0cFsCNyrzGlvm1oJHwHr
         Ge0Y80fe3hrzbhTmMxatfW8IQjdRDG38KKi8fsRDYgurePcjNKqbs5xfeODPMFo2Oz/p
         JfgTce58/a6GfuVv31E8kU2Hjms0/DJXHFSTD9Tzn3NnhKck1TLrM9IbFz9k2Wlrqrxz
         Cchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=IM3wqjGXbcQUmVFb2U84wyTqClwegOsrGVv54ZHXoho=;
        fh=JqpPVtJbiCVvoGmWBgSEKts3ZSx/ZPqAjwZWqQa59hI=;
        b=qVQ69mN6s/kkNtPApKMjWfvCEJlWsSvgCLs1uOYVjbhPoY2K35Acysinb2CHhtWb0r
         f9lhpZG/qSBGh2PFGKq0rYcGMqcdeb53c/s1j1gIbz4cSIsn5Lm7dOc5K3MepSczHilg
         RnyFKhRfSHhwYguF2Y4Q8U8+CXPJ2Rjms+Kn6jP+4QMQFduo3ohF1P5ehgtuM5jsOP7a
         RRbLdRwOQo1eqoZaVYydOhENFtpiq03Wt/Ts/imurT4mbeh9xdBf7ggG68txpCcaniSo
         p8zT1v0IdxSqvXeoNjuzg8btshoD8HUqkUVmzzZiYW0o59a5SKX4JbsuYnjNDaQzAsEQ
         m+qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="RXaybsJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow35-20020a05620a822300b0078154e42cbfsi5024244qkn.770.2024.01.22.01.20.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 01:20:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="RXaybsJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRqTd-00042B-Sf; Mon, 22 Jan 2024 04:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rRqTc-00040B-7O; Mon, 22 Jan 2024 04:20:20 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rRqTa-0005Fg-BW; Mon, 22 Jan 2024 04:20:19 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id DBC73A05AC;
 Mon, 22 Jan 2024 10:20:12 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id aXdaQtn5lRaR; Mon, 22 Jan 2024 10:20:12 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 05770A0592;
 Mon, 22 Jan 2024 10:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 05770A0592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1705915212;
 bh=IM3wqjGXbcQUmVFb2U84wyTqClwegOsrGVv54ZHXoho=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=RXaybsJ/6d4miU9m6HbxnPOiQYiN7NFOTDqXGPUKS6JK4ak587XDDqkit4IGtgHCr
 /3OeXkCShm+ccddD0gpIuHLtHrz3vDKDmpMETceSSVH2SjooAWEZj9QoRyBcs01Ex2
 4av4IBUnuti5iJtVibaahH7g+UQ1ROvQsdvezT3Y=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id J6nB1MnhqhqJ; Mon, 22 Jan 2024 10:20:11 +0100 (CET)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:240:e2ca:746b:7d17:381f])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id A9E68A0578;
 Mon, 22 Jan 2024 10:20:11 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] Add device STM32L4x5 GPIO
Date: Mon, 22 Jan 2024 10:18:31 +0100
Message-ID: <20240122092005.30556-1-ines.varhol@telecom-paris.fr>
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
X-TUID: KIAdx7SBSEvU

This patch adds a new device STM32L4x5 GPIO device and is part
of a series implementing the STM32L4x5 with a few peripherals.

Changes from RFC v1 :
- `stm32l4x5-gpio-test.c` : correct typos, make the test generic,
add a test for bitwise writing in register ODR
- `stm32l4x5_soc.c` : connect gpios to their clock, use an
array of GpioState
- `stm32l4x5_gpio.c` : correct comments in `update_gpio_idr()`,
correct `get_gpio_pins_to_disconnect()`, correct `stm32l4x5_gpio_init()`
and initialize the clock, add a realize function
- add a summary in the commit messages
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
 hw/arm/stm32l4x5_soc.c             |  67 +++-
 hw/gpio/Kconfig                    |   3 +
 hw/gpio/meson.build                |   1 +
 hw/gpio/stm32l4x5_gpio.c           | 537 +++++++++++++++++++++++++++++
 hw/gpio/trace-events               |   6 +
 include/hw/arm/stm32l4x5_soc.h     |   2 +
 include/hw/gpio/stm32l4x5_gpio.h   |  80 +++++
 tests/qtest/meson.build            |   3 +-
 tests/qtest/stm32l4x5_gpio-test.c  | 526 ++++++++++++++++++++++++++++
 12 files changed, 1215 insertions(+), 16 deletions(-)
 create mode 100644 hw/gpio/stm32l4x5_gpio.c
 create mode 100644 include/hw/gpio/stm32l4x5_gpio.h
 create mode 100644 tests/qtest/stm32l4x5_gpio-test.c

--=20
2.43.0

