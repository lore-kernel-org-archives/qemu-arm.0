Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp290128eja;
        Sat, 27 Jan 2024 06:39:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6gzY5SEtBPFcQcEvN/OM/dRYPLmoUzxjZtFUspaWPx7LFZTnW50OX8dyzRbg/fExa+GIF
X-Received: by 2002:ad4:4ee4:0:b0:686:9ea7:b2e with SMTP id dv4-20020ad44ee4000000b006869ea70b2emr2234081qvb.34.1706366394490;
        Sat, 27 Jan 2024 06:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706366394; cv=none;
        d=google.com; s=arc-20160816;
        b=sFnWcjdbrIx4KPlz/gkITtxNCJ7UOHv5zNTgLnfkSeCB5Lp333yWCwky2nE38T99rq
         RSM7Xd/0lyukFSNagtotRLgG0DtS0+/JNGq6GY+DdeQ1UFz6ZzNHxIi9ZpI+8jFQDTCo
         j25szbJCe5r/Wm+nqJxjrkRfBH5v2h435Z9Xuz2Z/3evrReW7u9WGmzHqEVmaryQj8aO
         JJMnCaGj7D9Mc/a2jRcFPA310TgAptVE3s7kinVsik6SEuVgyaiZjSBIiN8WlzsKRY+N
         n8okpYPEs+4pLhW/wqH0xfqISlCv61tAgtwRvwxzglYfBQCqFbpBWow2zUhcUxH4xvbi
         58Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=+jNASHn0VTr0trPuSH/couDCyMqe21ST/h/D/03HhW0=;
        fh=7zNBxs0hIwjNSffkIM2mNk1+Htwy/CqO5R/0YJ2hC6M=;
        b=0WerEpaIuRoZW59cQxZbmbIF5PzK904UyjRpdaEEOWZpZgdknkOvNtQP2LaCUHQBru
         3fB8bmU4robRI+Al+j0tZr3Ozb0+Ml9LoEHqDv3gHCNotNaevn9egY0AJK1PV1WIoMr8
         gvxZupAy6FsgXM7zBjMGMYptWX+7ATOJC6ImLcWuw3MooRc2jd+yBHDds4SPDkBdu+0Y
         vWcxPOwRiatZZ4lrf7ykOwv3E1DslGccIsiB4Rn5U4VGgeOyiX4GaBMAIH27+wpSnYrK
         RbgRPNOLd4IwQqGDarEDlJVIp8WYZePMYa3lfycRVRsBTkHnZLTpAFuv43Zwgiua95q4
         7Sng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="LpQlH/bC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv13-20020ad44eed000000b0067aa5ce6c2dsi3569915qvb.340.2024.01.27.06.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jan 2024 06:39:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="LpQlH/bC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTjqG-0002P2-Ca; Sat, 27 Jan 2024 09:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rTjqF-0002Oe-4z; Sat, 27 Jan 2024 09:39:31 -0500
Received: from zproxy4.enst.fr ([2001:660:330f:2::df])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rTjqC-0002Pk-TS; Sat, 27 Jan 2024 09:39:30 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 8B5E320744;
 Sat, 27 Jan 2024 15:39:23 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id rH69LoKrWKu2; Sat, 27 Jan 2024 15:39:22 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 371B3207D6;
 Sat, 27 Jan 2024 15:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 371B3207D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1706366362;
 bh=+jNASHn0VTr0trPuSH/couDCyMqe21ST/h/D/03HhW0=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=LpQlH/bCSF4xGIJWeoqfggAYup9v4oUDQSTp4TWtZo92onBZqRK46cfyTodPADQNE
 bmghTWvQUj3CZsmmUCUfd6ua3ej3sogkXojgjjzotBFDMbBF83DRc6E8QI7slaz89k
 wjCs1IFHIG6jfoTaonyIJCpdLGpppfNw6dvt5DmQ=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id ZKqPllMmvp9r; Sat, 27 Jan 2024 15:39:21 +0100 (CET)
Received: from AM-Inspiron-3585.numericable.fr (38.162.10.109.rev.sfr.net
 [109.10.162.38])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id 479B520822;
 Sat, 27 Jan 2024 15:39:21 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philipe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 0/8] Add device STM32L4x5 RCC
Date: Sat, 27 Jan 2024 15:38:56 +0100
Message-Id: <20240127143904.80187-1-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::df;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy4.enst.fr
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
X-TUID: qwphTqoywdna

This patch adds a new device STM32L4x5 RCC (Reset and Clock Control) devi=
ce and is part
of a series implementing the STM32L4x5 with a few peripherals.

Due to the high number of lines, I tried to split the patch into several =
independent commits.
Each commit compiles on its own but I had to add temporary workarounds in=
 intermediary commits to allow them to compile even if some functions are=
 not used. However, they have been removed once the functions were used. =
Tell me if this is ok or if I should remove them.

Also, the tests are not very exhaustive for the moment. I have not found =
a way to test the clocks' frequency from the qtests, which limits severel=
y the exhaustiveness of the tests.

Thanks to Philippe Mathieu-Daud=C3=A9 and Luc Michel for guiding me towar=
d the hw/misc/bcm2835_cprman.c implementation and answering my questions =
about clock emulation in qemu !

Based-on: 20240109194438.70934-1-ines.varhol@telecom-paris.fr
([PATCH v4 0/3] Add device STM32L4x5 SYSCFG)

Changes from v1 to v2:
- Removed a mention in the tests
- Added an early return to prevent a clang compilation error in rcc_updat=
e_pllsaixcfgr()

Changes from v2 to v3:
- Changed the timeout method used in the tests
- Added a real value for ICSR register
- Replaced some TODOs with correct error handling
- Added a commit that implements correct write protections for the CR reg=
ister

Arnaud Minier (8):
  Implement STM32L4x5_RCC skeleton
  Add an internal clock multiplexer object
  Add an internal PLL Clock object
  Add initialization information for PLLs and clock multiplexers
  RCC: Handle Register Updates
  Add write protections to CR register
  STM32L4x5: Use the RCC Sysclk
  Add tests for the STM32L4x5_RCC

 MAINTAINERS                               |    5 +-
 docs/system/arm/b-l475e-iot01a.rst        |    2 +-
 hw/arm/Kconfig                            |    1 +
 hw/arm/b-l475e-iot01a.c                   |   10 +-
 hw/arm/stm32l4x5_soc.c                    |   45 +-
 hw/misc/Kconfig                           |    3 +
 hw/misc/meson.build                       |    1 +
 hw/misc/stm32l4x5_rcc.c                   | 1371 +++++++++++++++++++++
 hw/misc/trace-events                      |   14 +
 include/hw/arm/stm32l4x5_soc.h            |    5 +-
 include/hw/misc/stm32l4x5_rcc.h           |  239 ++++
 include/hw/misc/stm32l4x5_rcc_internals.h | 1044 ++++++++++++++++
 tests/qtest/meson.build                   |    3 +-
 tests/qtest/stm32l4x5_rcc-test.c          |  207 ++++
 14 files changed, 2905 insertions(+), 45 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_rcc.c
 create mode 100644 include/hw/misc/stm32l4x5_rcc.h
 create mode 100644 include/hw/misc/stm32l4x5_rcc_internals.h
 create mode 100644 tests/qtest/stm32l4x5_rcc-test.c

--=20
2.34.1

