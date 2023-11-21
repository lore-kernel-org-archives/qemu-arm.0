Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp527811ejy;
        Tue, 21 Nov 2023 06:57:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt1zaxoTPU2rSBVWtw/vFO0Pu1sjqlYhMbg7Auvgtz5YyQSpBNf3ZFSkWjN+jAyA2B90+K
X-Received: by 2002:a0c:e210:0:b0:672:5946:ffd2 with SMTP id q16-20020a0ce210000000b006725946ffd2mr11712934qvl.30.1700578625852;
        Tue, 21 Nov 2023 06:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700578625; cv=none;
        d=google.com; s=arc-20160816;
        b=pg4CCZfFauUq/Bn/1czSmJs0elZ2Pg39nP1J+7OyYxape95joxZeISLM2jwWA76bMR
         LEfjL5rgDZYnvlI1WdcixQZdr9dgreLKjSdPv2JP67ybhW9iRA3K1mCFw1FTD3pNSnFe
         J79EuwTiuAfCx9o1rd8xllHZPZJCA1FhYZ1bL20Lox/39L4mKlniJvsmrM4MKmmVpg9G
         9N8jjIHVaFiOOdIAXW0OU2dHk0g9FM8tBzc9J3wuT6Tc7b/Lsax7AZpdfEzxpMmBO5ru
         HFU4BYjTf2bvIk5MSZ9fenKND0OY3/yGE55jGBNhsY/YtTKSYVWJDKreVzic+d6YZej6
         Rp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=M7hu6nXdiiGu7KNYI7GAUBNwEKsyB7m8R0TDgH4xQtQ=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=hEk39blDqNorsLTmn81rZhUCpif0W84iflqWfs3kQPdPvtHpTAU/pzEdmcHk5A3aL4
         iohUw1o+bMijz5/YWdKH855DKq3seTojhEKRyqBhYln2H6A1GWYJ108OE1+X2xmZLQ+Y
         QltrDZ1PSAPLIH5m3bCHZ3jL0PPEqx9KJTa1hj69NmfwZoP1gliNSDZlpsbEAw+0/YGa
         72WNlxuccSOa8d2xCgaqgx6HdBNxAOQQWCGZZwPVAXj/fDzNBkQwCfGHD6piKOifyp2s
         OHHbt2tjociR7FnTP9hNjqRCfAdJnHcR3/joi/9DZBj2GUCZi79OCd/dm3ynBMtnpFZK
         vsQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020a0ce90d000000b0066fcd86e4a3si9089025qvo.483.2023.11.21.06.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 06:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5SAf-0002Ia-8k; Tue, 21 Nov 2023 09:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r5SAd-0002HG-HC; Tue, 21 Nov 2023 09:56:11 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r5SAZ-0003I1-7Y; Tue, 21 Nov 2023 09:56:11 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CF31211EF86;
 Tue, 21 Nov 2023 14:56:04 +0000 (UTC)
From: ~aminier <aminier@git.sr.ht>
Date: Tue, 21 Nov 2023 14:56:04 +0000
MIME-Version: 1.0
Subject: [PATCH qemu 0/1] Implement the STM32L4x5 EXTI device
Message-ID: <170057856467.12935.6421900912319796560-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~aminier <arnaud.minier@telecom-paris.fr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oDvvZOH0n6lw

This patch allows to emulate the STM32L4x5 EXTI device.
It implements register access and software interruptions.

This is RFC since we had troubles to make all tests pass.
More precisely, the line `g_assert_true(get_irq(GPIO_0_IRQ));` fails in
the software interrupts test. No irq seems to be fired.
(We also tested the stm32f4_exti (on which this implementation is based
upon) on but it also fails so don't really know if the test or the
implementation is incorrect)

Based-on: <170049810484.22920.612074576971878323-0@git.sr.ht>
([RFC v3 2/2] hw/arm: Add minimal support for the B-L475E-IOT01A board)

(We got the message id from
https://patchew.org/QEMU/170047309499.17129.4986209009679789101-0@git.sr.ht/
but don't really the standard procedure to get it. Sorry if this is
incorrect.)

Arnaud Minier (1):
  Implement STM32L4x5 EXTI

 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32l4x5_soc.c            |  65 +++++-
 hw/misc/Kconfig                   |   3 +
 hw/misc/meson.build               |   1 +
 hw/misc/stm32l4x5_exti.c          | 329 ++++++++++++++++++++++++++++++
 hw/misc/trace-events              |   5 +
 include/hw/arm/stm32l4x5_soc.h    |   3 +
 include/hw/misc/stm32l4x5_exti.h  |  64 ++++++
 tests/qtest/meson.build           |   5 +
 tests/qtest/stm32l4x5_exti-test.c | 102 +++++++++
 10 files changed, 576 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

-- 
2.38.5
