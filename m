Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp2230026dlb;
        Tue, 7 May 2024 11:59:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWD0n8Eo4PQZPsAzzGSM4N3RgQ6EUTg8XTYlmB0S2iyGLH9DJLd/WQu7FtsvxLMC4RwVjJwaLE6FBDtkvZgbXIjiQZs0DGD
X-Google-Smtp-Source: AGHT+IGfm3kpa3Nd1Gnya+opegy/jRjHXOLDXTR9oMdA7n4W57ZsRhbuY7SeqOrMsalRH6CNHN2d
X-Received: by 2002:a05:6830:1691:b0:6f0:80ac:5156 with SMTP id 46e09a7af769-6f0b793b055mr362030a34.14.1715108380649;
        Tue, 07 May 2024 11:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715108380; cv=none;
        d=google.com; s=arc-20160816;
        b=Qo/uRplWIpgM0tmw1VxPkc2CsKHG3UQjWQYvgLQkQzfgJo/UOO9H/CsYqmuNW3PS9d
         /lzdKKDUKmZQB2jmQ1hzCQlqSnoem9PbIyvwY3/eCm09hcti5fbaJsJ+1MJO4IXhAMvl
         YrM/CXTNrXRVx1kV+Z47y2EpcClclmg2hxlx1Rc4zwdNxuzb6XdJoEz2Jy0OczxOsR4X
         H6QfUAZl/aAQv4uLHYxH7x8hWf2JQQ62sQNaKFXKMbEBXacSgLD0TYR4KCCVDuR3hyCq
         a6HyUD8nGDYK9rQA0Q5dTkXfI3CvthiqBbHAtCXDwnQNLN4ZV/3KKJ6+im9M8D7EHuCS
         XHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=J8aP9fhelT/d154OZawuXtJOGh0PzL+Rwts8IZYUaWs=;
        fh=ecsk0JsTjjFV0jZ++009JHVO0qembwrIS4hjTG7H9mQ=;
        b=bqko8H3ZZTyPNSGasidH6OonkjFF2SmU6cvVCAWYTtwv02NOwbkQpIlHK7jYBanmFU
         e/u2ZLnfGuQ0s12rbrPl/viBpQbHLS9UK/zayr9BolLL6kgaRfqX0YefxoI8jal+ZGcy
         Ax+7IzZg+dZGU4Z4xxgrHkR/u0EvyjLZ4fMSeHnqonyUGK6j3iWKeHWjLPmN7u5A94hL
         6Infl9ZjGtUdl1YNBEVTnPjNFc8lQ9cHc/1Sx0gt7UUKiq6NQpVJ+bXkTyWIhHLtI4nx
         JKZ4ypNm/Jk7+gCDv8ifiVJRsE1sjsGJlvHPs3hdDkvkDP0XG9Jbm8HObAiaYpRHd6A1
         xMOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=Du7CRNCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05620a451400b00792a609b316si3024385qkp.438.2024.05.07.11.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 11:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=Du7CRNCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4Q1z-0008FB-1r; Tue, 07 May 2024 14:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s4Q1w-0008BT-6c; Tue, 07 May 2024 14:59:12 -0400
Received: from zproxy1.enst.fr ([137.194.2.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s4Q1t-0006A2-LS; Tue, 07 May 2024 14:59:11 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 9DF11C0588;
 Tue,  7 May 2024 20:59:03 +0200 (CEST)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id HLNQxTVh1GQ0; Tue,  7 May 2024 20:59:03 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 2791FC0D05;
 Tue,  7 May 2024 20:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr 2791FC0D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1715108343;
 bh=J8aP9fhelT/d154OZawuXtJOGh0PzL+Rwts8IZYUaWs=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=Du7CRNCD+JsBuyVjSp0l/83p2Mx4vg1fqR+eBSkYn/TPGmLtrLB1CLE6seojq7wBx
 0b1KZqxbmXONnTRYqarIi0gKAaGbm6ykY4Ge8Th4kZs8HHfaN/HA1v1pIs9UKfoAPm
 dHCEKGkzskYBkrNsDZsl554YlXGHVyR6F6wGr50w=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id hibf2R4nwdOi; Tue,  7 May 2024 20:59:03 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id DC0DEC0588;
 Tue,  7 May 2024 20:59:00 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/4] Check clock connection between STM32L4x5 RCC and
 peripherals
Date: Tue,  7 May 2024 20:55:37 +0200
Message-ID: <20240507185854.34572-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.220;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5kObbOU9ebxU

Among implemented STM32L4x5 devices, USART, GPIO and SYSCFG
have a clock source, but none has a corresponding test in QEMU.

This patch makes sure that all 3 devices create a clock,
have a QOM property to access the clock frequency,
and adds QTests checking that clock enable in RCC has the
expected results.

Philippe Mathieu-Daud=C3=A9 suggested the following :
".. We could add the clock properties
directly in qdev_init_clock_in(). Seems useful for the QTest
framework."

However Peter Maydell pointed out the following :
"...Mostly "frequency" properties on devices are for the case
where they *don't* have a Clock input and instead have
ad-hoc legacy handling where the board/SoC that creates the
device sets an integer property to define the input frequency
because it doesn't model the clock tree with Clock objects."

You both agree on the fact that replicating the code in the
different devices is a bad idea, what should be the
alternative?

Thank you for the reviews.

Changes from v1:
- upgrading `VMStateDescription` to version 2 to account for
`VMSTATE_CLOCK()`
- QTests : consolidating `get_clock_freq_hz()` in a header
and making appropriate changes in stm32l4x5q_*-test.c

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (4):
  hw/misc: Create STM32L4x5 SYSCFG clock
  hw/gpio: Handle clock migration in STM32L4x5 gpios
  hw/char: Add QOM property for STM32L4x5 USART clock frequency
  tests/qtest: Check STM32L4x5 clock connections

 include/hw/misc/stm32l4x5_syscfg.h  |  1 +
 tests/qtest/stm32l4x5.h             | 40 +++++++++++++++++++++++++++++
 hw/arm/stm32l4x5_soc.c              |  2 ++
 hw/char/stm32l4x5_usart.c           | 16 ++++++++++--
 hw/gpio/stm32l4x5_gpio.c            |  6 +++--
 hw/misc/stm32l4x5_syscfg.c          | 30 ++++++++++++++++++++--
 tests/qtest/stm32l4x5_gpio-test.c   | 23 +++++++++++++++++
 tests/qtest/stm32l4x5_syscfg-test.c | 19 ++++++++++++--
 tests/qtest/stm32l4x5_usart-test.c  | 26 +++++++++++++++++++
 9 files changed, 155 insertions(+), 8 deletions(-)
 create mode 100644 tests/qtest/stm32l4x5.h

--=20
2.43.2

