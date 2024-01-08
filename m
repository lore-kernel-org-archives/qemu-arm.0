Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2442924ejo;
        Mon, 8 Jan 2024 10:12:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGksMkv87uJbatJi+Oz2O+c4XOBQEvyV5IxxwgtFAJhRix2o/R5H/1G7CcCPRO5ahrG7/Rz
X-Received: by 2002:ad4:5de6:0:b0:681:985:97e8 with SMTP id jn6-20020ad45de6000000b00681098597e8mr1713122qvb.28.1704737523409;
        Mon, 08 Jan 2024 10:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704737523; cv=none;
        d=google.com; s=arc-20160816;
        b=SCbIKuBdSWoTke6DrlXRUnsUW+FgI1rxtDRIdMcJOobcVlBcPWv8BUI0WHsYNLvtGR
         9PvKj/cXLUJfqdxYYSgwqEyfEA1L+SzZoXXBpF89o/JrLb5hcwd86OXW+WJPWrRa7LDr
         6Opj7Bq1ksulVYoLmkO2NSEQOkKHV+DyEczcxh9rYAuDpBKn+bZXKT+lm7H3jcmGxXQx
         FbDiw7A5jwkdb4K93eXD8Lfw38x+rhuQox7YSgzk5OjxQ1qMP2OitDfxDweC0nAD6oXb
         GijhUlRzxbUYHN7txXsnsspY2S307hLxaG7v6WI6tDJjW0vovdEloVkk1EZvPkusCbne
         OkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=u4Y1xI9xUqCC62OGtAhZYhczwq8yD/6nuvv/Aa6GLLc=;
        fh=uVT5UAOcZRZbquK2hAVR/DyoKbSs07dkEc53dKSfuj0=;
        b=VU5/0xR6Yycf9IDSjzHjP9K6fqYkaOR7HIHPOqQvfWyArWdq0UxoQDF+pioBWh/hM7
         /ctf5XiyUvle3hzGhYrFNAjSdpOu9R1jgH9j8u7l/2abvk6Q6AzSdI670/YZAzf+lKel
         UHLry7wWLJLuKWyu6fI5aWCWkMWgnL1KbotmLx61atBLM40wX4dw4Z5j9uzIFrJsYCpa
         sqIAz8Hfl3EXdN0+gFAXEtYb14EOve5Jtb36eqhmK5yHqIrtsQyOh2IGrHuH3xHgxXaW
         GQ2t/8+VOk6oEyP+nG1zP3Rmucp5laqO0o5ODcXciBkaaZ9QZBHE9SqvIMtV1kxuN40A
         xN+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=3BomH7vt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a0ce1c4000000b0067f862a3d21si415288qvl.260.2024.01.08.10.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 10:12:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=3BomH7vt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMu5t-00052E-FF; Mon, 08 Jan 2024 13:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rMu5k-0004wt-T7; Mon, 08 Jan 2024 13:11:17 -0500
Received: from zproxy1.enst.fr ([2001:660:330f:2::dc])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rMu5h-0003Ec-N5; Mon, 08 Jan 2024 13:11:16 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 0864EC0655;
 Mon,  8 Jan 2024 19:11:11 +0100 (CET)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id 90wfQCixqEGA; Mon,  8 Jan 2024 19:11:10 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 1F2FCC0738;
 Mon,  8 Jan 2024 19:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr 1F2FCC0738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1704737470;
 bh=u4Y1xI9xUqCC62OGtAhZYhczwq8yD/6nuvv/Aa6GLLc=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=3BomH7vtGL/o6dccegRmjGUFZbOnLdGVrUar1BfU68q/CJDLjiEHxjcQ5hR1Xw8Oh
 vlhCbucKVPwQg+3KgXI/C73AlfpuAC50eaRMEN2LTSeKFwZspK06e6EiJ1vJKmLqu7
 6jDTpJc+kkwLC+hW4tuNkzmngwOVcMsc+9Jku30k=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id dBgMYFILt_mF; Mon,  8 Jan 2024 19:11:10 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id 72AFAC0655;
 Mon,  8 Jan 2024 19:11:09 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 0/3] Add device STM32L4x5 EXTI
Date: Mon,  8 Jan 2024 19:03:03 +0100
Message-ID: <20240108181104.46880-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dc;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
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
X-TUID: ftfwI+iZ6IWR

This patch adds a new device STM32L4x5 EXTI device and is part
of a series implementing the STM32L4x5 with a few peripherals.

Changes from v5 to v6:
- in `stm32l4x5_exti.c` : adding {} so the code builds with clang
- in `stm32l4x5_exti-test.c` : using a helper function
`exti_set_irq()` to help readability
- in `stm32l4x5_exti-test.c` : correct a mistake in test
`test_edge_selector` (adding a necessary NVIC interrupt unpend
so that the following assertion actually checks something)
- in `stm32l4x5_soc.c` : reducing scope of `i` used in for loops
- in `stm32l4x5_soc.c` : removing useless variable `dev`
- swapping commit 2 (add tests) and commit 3 (connects exti to SoC)
so that the tests pass in the commit they're added

Changes from v4 to v5:
- update the documentation file

Changes from v3 to v4:
- add a test to check that irq trigger selection works correctly
(`test_edge_selector`) and correct `stm32l4x5_exti_set_irq` accordingly

Changes from v2 to v3:
- corrected the license to GPL

Changes from v1 to v2:
- correct the commit messages
- remove a misleading comment

Changes from v3 to v1:
- separating the patch in 3 commits
- justifying in the commit message why we implement a new model instead
of changing the existing stm32f4xx_exti
- changed irq_raise to irq_pulse in register SWIERx write
(in `stm32l4x5_exti_write`) to be consistent with the irq_pulse in
`stm32l4x5_exti_set_irq` (and also both these interrupts are
edge-triggered)
- changed the license to GPL

Changes from v2 to v3:
- adding more tests writing/reading in exti registers
- adding tests checking that interrupt work by reading NVIC registers
- correcting exti_write in SWIER (so it sets an irq only when a bit
goes from '0' to '1')
- correcting exti_set_irq (so it never writes in PR when the relevant
bit in IMR is '0')

Changes from v1 to v2:
- use arrays to deduplicate code and logic
- move internal constant `EXTI_NUM_GPIO_EVENT_IN_LINES` from the header
to the .c file
- Improve copyright headers
- replace `static const` with `#define`
- use the DEFINE_TYPES macro
- fill the `impl` and `valid` field of the exti's `MemoryRegionOps`
- fix invalid test caused by a last minute change

Based-on: 20240108135849.351719-1-ines.varhol@telecom-paris.fr
([PATCH v6 0/2] Add minimal support for the B-L475E-IOT01A board)

In=C3=A8s Varhol (3):
  hw/misc: Implement STM32L4x5 EXTI
  hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC
  tests/qtest: Add STM32L4x5 EXTI QTest testcase

 docs/system/arm/b-l475e-iot01a.rst |   5 +-
 hw/arm/Kconfig                     |   1 +
 hw/arm/stm32l4x5_soc.c             |  52 ++-
 hw/misc/Kconfig                    |   3 +
 hw/misc/meson.build                |   1 +
 hw/misc/stm32l4x5_exti.c           | 292 ++++++++++++++
 hw/misc/trace-events               |   5 +
 include/hw/arm/stm32l4x5_soc.h     |   3 +
 include/hw/misc/stm32l4x5_exti.h   |  51 +++
 tests/qtest/meson.build            |   5 +
 tests/qtest/stm32l4x5_exti-test.c  | 590 +++++++++++++++++++++++++++++
 11 files changed, 1004 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

--=20
2.43.0

