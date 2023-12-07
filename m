Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1913384ejb;
        Thu, 7 Dec 2023 13:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqfd8WlQPWtQPmlEvuKKFDDW+mJFbybtKlYaxwCjOlD/Kxd7TbMfTBYvX1fxmEevK+M9FR
X-Received: by 2002:a05:6102:3a4f:b0:464:77f2:558 with SMTP id c15-20020a0561023a4f00b0046477f20558mr3395354vsu.42.1701984641949;
        Thu, 07 Dec 2023 13:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984641; cv=none;
        d=google.com; s=arc-20160816;
        b=H1WI6ju9Z4POzOtZv5rlisQbo5yM7DbWsOD0Nz1rRIxTXJcT7t9ReQE+WwsiCAwRP1
         jNqlhdmYOgOBhgWM6h3Hzoo2kmhZKpoAF39JmUHV/TDLbGmUxlncR0Ie8vVC/e+dHCRs
         NpV3ZeXXwayRNaOuSNeVaKX8xU/cKwQiyUxQUEKsEcWPAGklDeLZfslfwZWsj17Pq6uK
         L9bLax8rL/L7W6ute5gB5Rf4jnqGeoQOji8t18YsbL4GXhX3wYfVLNouRARCzk+0Y2EP
         FZ57DEqsMc3KXCMbCbxBhc31wH+QRWN7ueN5sHeGgG/Z0LVuhmaPIzyvspECsILAAXBM
         nwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=xCyNPjX2wdLP7UYG5YwWQ6p7AvHevlVuPZJInclwJ/g=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=Tr58IfH9bv4+1scvlyPhikuE+dFgUTMECqL4h2nNTahsohhzh/7gQmdn/eQMV/AOWB
         1nwpu+gfTZmDSRpG5glE25cb+Wt/IZOR39e+CYY0bQQlJKKgv4J42I1TokNdVTnr7izD
         Feld60Q8FSyPZtwoq8p77BRd1c48HrKdeHVzU1gEsME5ceuZIFcjHrpgv6sEQmslKEos
         nm8e6QTkB/T5UCj1bepm6UfAgtYU58ELFvDzbBqvf2KaFEP+pV/ruJB+3jK3Y1P6h7Rf
         ar4W3ms2deMHofNLMxo1JZnlG3YnpEO9+omOo7eXmiDXzqblT7tUt42HqTzsxM1FVgDI
         kqwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05621400c900b0065d124684a6si661936qvs.88.2023.12.07.13.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 13:30:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBLx0-0007Qv-Rf; Thu, 07 Dec 2023 16:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rBLwz-0007P4-44; Thu, 07 Dec 2023 16:30:29 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rBLwx-0005MC-Fd; Thu, 07 Dec 2023 16:30:28 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 235EA11EFF3;
 Thu,  7 Dec 2023 21:30:23 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Thu, 07 Dec 2023 21:30:21 +0000
MIME-Version: 1.0
Subject: [PATCH qemu 0/3] hw/arm: Add device STM32L4x5 EXTI
Message-ID: <170198462199.32162.284497577253427308-0@git.sr.ht>
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
X-TUID: Ag9wjEdgGvF4

This patch adds a new STM32L4x5 EXTI device and is part
of a series implementing the STM32L4x5 with a few peripherals.

The patch is split up in 3 commits :
- implementing the EXTI device
- adding tests (that fail in this commit)
- connecting the EXTI device to the SoC (the tests pass in this commit)

Thank you Alistair for the review and very helpful answers !

Sincerely,
Ines Varhol

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
  hw/arm: Implement STM32L4x5 EXTI
  hw/arm: Add STM32L4x5 EXTI QTest testcase
  hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC

 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32l4x5_soc.c            |  65 +++-
 hw/misc/Kconfig                   |   3 +
 hw/misc/meson.build               |   1 +
 hw/misc/stm32l4x5_exti.c          | 299 ++++++++++++++++++
 hw/misc/trace-events              |   5 +
 include/hw/arm/stm32l4x5_soc.h    |   3 +
 include/hw/misc/stm32l4x5_exti.h  |  61 ++++
 tests/qtest/meson.build           |   5 +
 tests/qtest/stm32l4x5_exti-test.c | 485 ++++++++++++++++++++++++++++++
 10 files changed, 926 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

--=20
2.38.5
