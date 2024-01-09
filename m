Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp454638ejs;
        Tue, 9 Jan 2024 07:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtvd2i3pJnHhhmlA6BVwLtQ7l3Cb/wkiR42JU0GEB404hnii6GkyxnHMCj6ZxpGu2Iq5B8
X-Received: by 2002:a05:6214:528e:b0:681:977:9f84 with SMTP id kj14-20020a056214528e00b0068109779f84mr2613822qvb.105.1704813903779;
        Tue, 09 Jan 2024 07:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704813903; cv=none;
        d=google.com; s=arc-20160816;
        b=ISy+KoDNZVCMk4ZwQafj60g3l3LOeqtif1JFqecAaKe9CvrO/Ckm1VfXKXKZFE4Bmg
         LhIxocRROfjt8ueTs7WUlvYhN7nukDeGDSXSJ+bsKVqkvkllb1YVVEFC2CUxm+GKCAtf
         6MIdLKxU5fF1HaTCyKySClTV99UcEc6W12mI73SuEatwOHjouBBrjCHcQa+eNtaXp4dm
         0FL3hyHk/CsYrZWkERcMvxDUSJKbH/fSONwRQp99L9LnQoYhOVNjD79ZahxFIhQ0qUls
         fCbHmbpzMRpzczu1YaVuxDXZbxWHm56IyPT5uAimeDVEsUBuCmyac8FxTxEBXn1m6mT0
         vbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=+5SAHEDUyOxy3ZotP8W6H6AwXXKntyVic+zI5JHEeYg=;
        fh=6QhMFcby0NQZhJ6x9WOb7BUiQRgLXoDKHvZZeqHGWVM=;
        b=kgFkQHVyI6wa8pP3dO+x5RvKf30HEgoONjS0l7dvUFE53Gny0gp9+hvqNpv7T5TqXF
         v9QvUOAolwPIHOJwPnEHJvV6DdfX0oKD8+4bI6Bv2MuQHm/Wqt5yeQ2ChAiGv65cC/nh
         /EF5F2N+X52PHPCZ+/rdUrcCfxgdHqd5W7PR+kT4N4uhu7ePVALRDoTxKTi4kBTe2ONE
         UcxOrRg1afCBXvvkDzELeJKm0P3L+oikQNvIvK72n6hORy5OYB04PvRTqweWUMo8Adae
         8Z1PoTICAR/p+ElFlPMZoc2qBCME6ytVeHd2PGCaTT3lMjB7lLR/dIRr26I+2OKANI9s
         JUHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=dKb1gQr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a0cf64c000000b006803a797f51si2501068qvm.612.2024.01.09.07.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 07:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=dKb1gQr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNDxf-0006Be-SH; Tue, 09 Jan 2024 10:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rNDxd-0006AX-Fm; Tue, 09 Jan 2024 10:24:13 -0500
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rNDxY-0001EM-7d; Tue, 09 Jan 2024 10:24:13 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id B32A9A0820;
 Tue,  9 Jan 2024 16:23:55 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id Txb2vliHCfvb; Tue,  9 Jan 2024 16:23:55 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 1D554A081E;
 Tue,  9 Jan 2024 16:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 1D554A081E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1704813835;
 bh=+5SAHEDUyOxy3ZotP8W6H6AwXXKntyVic+zI5JHEeYg=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=dKb1gQr4bYmzHTEOgAXL97H5xjW+ExlZpqcoFpV2+vu/Ze97UZFvtpPD6cwId/b7F
 IDULOuMxya21NCJTy2PZ+qE2G8jiu0Ar+5TrrcsCnM/Bo3kR7i7yp18JvnKKoct+ob
 EPqEb0VP5J/x+HR9H5wDKoPL5wYYUdMNTf//qvz4=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id nN1-los0CHCO; Tue,  9 Jan 2024 16:23:55 +0100 (CET)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:240:3f5e:381b:bff9:b9ae])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id C44EEA0820;
 Tue,  9 Jan 2024 16:23:54 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
Subject: [PATCH v7 0/3] Add device STM32L4x5 EXTI
Date: Tue,  9 Jan 2024 16:21:36 +0100
Message-ID: <20240109152350.303202-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
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
X-TUID: bSlHclgBXYmd

This patch adds a new device STM32L4x5 EXTI device and is part
of a series implementing the STM32L4x5 with a few peripherals.

Changes from v6 to v7:
- in `stm32l4x5_exti_write`: rename `n` to `bank`, use new helper
function `regbank_index_by_irq`, use `HWADDR_PRIx` formatting in error lo=
g,
unify writes where only bank differs using new helper functions
`valid_mask` and `configurable_mask`
- in `stm32l4x5_exti_set_irq`: rename `n` to `bank`, use new helper
function `regbank_index_by_irq` and new macro `EXTI_MAX_IRQ_PER_BANK`,
explain why there's no `else` clause
- in `stm32l4x5_exti_read`: rename `n` to `bank`, use new helper
function `regbank_index_by_irq`, use `HWADDR_PRIx` formatting in error lo=
g
- in `stm32l4x5_exti_reset_hold`: unify register initialization
using new array `exti_romask`
- in `stm32l4x5_exti_init`: use `size_t` instead of `int` in for loop
- in `stm32l4x5_exti-test.c`: instead of declaring intermediate
variables, using `exti_readl` directly in `g_assert_cmpuint`
so that QEMU coding style is respected

Changes from v5 to v6:
- in `stm32l4x5_exti-test.c` : using a helper function
`exti_set_irq()` to help readability
- in `stm32l4x5_exti-test.c` : correct a mistake in test
`test_edge_selector` (adding a necessary NVIC interrupt unpend
so that the assert actually checks something)
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

Based-on: 20231221213838.54944-1-ines.varhol@telecom-paris.fr
([PATCH v4 0/2] Add minimal support for the B-L475E-IOT01A board)

In=C3=A8s Varhol (3):
  hw/misc: Implement STM32L4x5 EXTI
  hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC
  tests/qtest: Add STM32L4x5 EXTI QTest testcase

 docs/system/arm/b-l475e-iot01a.rst |   5 +-
 hw/arm/Kconfig                     |   1 +
 hw/arm/stm32l4x5_soc.c             |  52 ++-
 hw/misc/Kconfig                    |   3 +
 hw/misc/meson.build                |   1 +
 hw/misc/stm32l4x5_exti.c           | 290 ++++++++++++++++
 hw/misc/trace-events               |   5 +
 include/hw/arm/stm32l4x5_soc.h     |   3 +
 include/hw/misc/stm32l4x5_exti.h   |  51 +++
 tests/qtest/meson.build            |   5 +
 tests/qtest/stm32l4x5_exti-test.c  | 524 +++++++++++++++++++++++++++++
 11 files changed, 936 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

--=20
2.43.0

