Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp932996ejo;
        Tue, 12 Dec 2023 06:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF548NIqeV4Cwjsepx7qXXl2feboQd77pwInUj4iX4sw4I8iVioPnJcwaWPIWg9jdLs47mO
X-Received: by 2002:ac8:7e88:0:b0:425:a282:71af with SMTP id w8-20020ac87e88000000b00425a28271afmr9409926qtj.35.1702390850382;
        Tue, 12 Dec 2023 06:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702390850; cv=none;
        d=google.com; s=arc-20160816;
        b=GqN1gj5sHeA0+ZzHgF39lrXHgggUiX+OkbOTOaQZOmBwE2d2021t75UHERrGZ8xtjN
         NckoAawnnsBSgueci5nXmoGIgDjSkHyXnCQU/FAHaSmGPeqWw5yec3lgtnadbOVAc5hb
         a11nlB0g4JZu5LFR3v562nqOt4vSyX15REVazOUU5amkHSmMP5JRfC293NMLOe7yUcyC
         XvwStN8AruiAS1AwW8nc+iAl8yq/7tSEeLYb59dNN6MOomhfhq6snErUWkVH+igB+VAY
         LvT+VgpM5lPwxOWukaKbViRgcn+LC5SaZuLwGMJxPcnuJ/PX+Ls/XOyjudKtnCjQi5d2
         sAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=lUB7qZYDZrT8OCT+dAHyYb1zKj7WOfJZtTLx9EYgRq8=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=GBF3/ozDUxsAgJMWy0E3yorChMnKBuGG7eNrFNPZd3iLVZ8x5SRfWtIEGrmhOiW7LO
         gRban9HCDxOMrTSIo/lQ7LA4Zaah2jLwxjJRAl4HX73arZaj3wAIZbWBkLN9TZTu8IKc
         nzewGhLbNDmDCf47I9PHOxrXlZmlYG+PA8fy4v4UNNtQDBMSyj4T5xgm0mg+vLUp9o39
         jMlPwcLWV1YnFtaYYpErobBsfbF/Orc+P8fP5mPjvtXKPkpg1tq4lEikAfqmqpieP+I1
         cdLgdZifp7n0ZRDekYRHP4drlmWzKXkI9tONZI85RoLxi+ntZ1idwODoFSPtlrgIJRvQ
         m8yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe5-20020a05622a4d4500b00423788ce3aesi11545593qtb.137.2023.12.12.06.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 06:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD3c8-0006Sz-ND; Tue, 12 Dec 2023 09:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rD3c5-0006OG-7c; Tue, 12 Dec 2023 09:19:57 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rD3bx-0001YG-Pb; Tue, 12 Dec 2023 09:19:56 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id DB86F11EE4D;
 Tue, 12 Dec 2023 14:19:47 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Tue, 12 Dec 2023 14:19:47 +0000
MIME-Version: 1.0
Subject: [PATCH qemu v2 0/3] Add device STM32L4x5 EXTI
Message-ID: <170239078765.13580.4044041320624286270-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vvxCpl5atw0I

This patch adds a new STM32L4x5 EXTI device and is part
of a series implementing the STM32L4x5 with a few peripherals.

Thank you Philippe for letting us know we're on your review list and
that you're busy.
Please take your time, in the meantime we'll make progress on more
peripherals :-)

Sincerely,
Ines Varhol

Changes from non-RFC v1 to non-RFC v2:
- correct the commit messages
- remove a misleading comment

Changes from v3 to non-RFC v1:
- separating the patch in 3 commits
- justifying in the commit message why we implement a new
model instead of changing the existing stm32f4xx_exti
- changed irq_raise to irq_pulse in register SWIERx write (in
stm32l4x5_exti_write)
to be consistent with the irq_pulse in stm32l4x5_exti_set_irq (and also
both these interrupts
are edge-triggered)
- changed the license to GPL

Changes from v2 to v3:
- adding more tests writing/reading in exti registers
- adding tests checking that interrupt work by reading NVIC registers
- correcting exti_write in SWIER (so it sets an irq only when a bit goes
from '0' to '1')
- correcting exti_set_irq (so it never writes in PR when the relevant
bit in IMR is '0')

Changes from v1 to v2:
- use arrays to deduplicate code and logic
- move internal constant EXTI_NUM_GPIO_EVENT_IN_LINES from the header
to the .c file
- Improve copyright headers
- replace static const with #define
- use the DEFINE_TYPES macro
- fill the impl and valid field of the exti's MemoryRegionOps
- fix invalid test caused by a last minute change

Based-on: <170100975340.4879.5844108484092111139-0@git.sr.ht>
([PATCH qemu 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A
board)

In=C3=A8s Varhol (3):
  hw/misc: Implement STM32L4x5 EXTI
  tests/qtest: Add STM32L4x5 EXTI QTest testcase
  hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC

 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32l4x5_soc.c            |  56 +++-
 hw/misc/Kconfig                   |   3 +
 hw/misc/meson.build               |   1 +
 hw/misc/stm32l4x5_exti.c          | 299 ++++++++++++++++++
 hw/misc/trace-events              |   5 +
 include/hw/arm/stm32l4x5_soc.h    |   3 +
 include/hw/misc/stm32l4x5_exti.h  |  61 ++++
 tests/qtest/meson.build           |   5 +
 tests/qtest/stm32l4x5_exti-test.c | 485 ++++++++++++++++++++++++++++++
 10 files changed, 917 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

--=20
2.38.5
