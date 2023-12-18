Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp714323eji;
        Mon, 18 Dec 2023 03:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrnALSuKJkZzF0PDDWHxQhPBN1YbSOFRhN+OQp1ts22OiBqRHw1hlhKkDtI98Tl1Y8ZJk8
X-Received: by 2002:a05:622a:64a:b0:425:9d55:e9f5 with SMTP id a10-20020a05622a064a00b004259d55e9f5mr23530073qtb.75.1702898205409;
        Mon, 18 Dec 2023 03:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702898205; cv=none;
        d=google.com; s=arc-20160816;
        b=fK4e8XGiiROPYief7JQwCx500GhzfJZjbZ/Alt67rgW/GzQXYTh2GeD9eBY1uG7lIM
         jV809KL9Ya6sh0FAt+tgDWynG7MVwJzfdldjcGk2iIHpydNP3S4/QIOrlfl4EtPJWh5K
         KBpj/xW3MUy27TpSScdM3UXka2BNwH842ngm78EBzIBCdHMYRTz1xEO59iew1PHfatla
         pT0vkBo2w++kLpXZCfMFMXj9hgY+RnDAPeKpnwZEm75wcgCZHMb4L1qtCm2Z1p05z434
         kapDmpxz92145+lDRVz1lImnFmVblHWzBnISPmeHevhYLVBj+bBjX61nAsfQUs7V2Y32
         seZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=XeSzGj56kkaA82LjT/KoCHAt73rvbX1OVjBd35k5Xjs=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=HQMngOj2U1AZBypXvslnwr7UT0xCP0hD58pGOvhLnW02H0SFUvdd/IPiGUsuiRElmN
         vo8SF+1GHDJGLiC9XtFZl3MFlXZwJGdExBHZlW7IA9VNeMkp2RBPEUerq4rPl4tASHWe
         mcXfRuvl4cyBmGuVbmjxg1RZy0oH+LiqeruRDJVhBfDKngWa8Y25+wt5tyPLpsncWs66
         CYdUOUldKI3GnQNI6LfvNVUhqMq3TwKsJi4qDg6vWjso8Tb71y8HZVoKa3xASl5bcnAP
         9NcBHWkeGkN4TiHM4oJxw4iY+78PT+6n0u7CtPkWJSAmn7ZT9mbcc98W0xl2z2TOkjWR
         QOvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf26-20020a05622a401a00b004259d9fde02si23890934qtb.438.2023.12.18.03.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFBb7-00072F-UN; Mon, 18 Dec 2023 06:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rFBb4-00071K-ON; Mon, 18 Dec 2023 06:15:42 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rFBb2-0008IM-Oi; Mon, 18 Dec 2023 06:15:42 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id D6CDA11EFC9;
 Mon, 18 Dec 2023 11:15:38 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Mon, 18 Dec 2023 11:15:38 +0000
MIME-Version: 1.0
Subject: [PATCH qemu v2 0/3] Add device STM32L4x5 SYSCFG
Message-ID: <170289813862.19159.2545029501234884208-0@git.sr.ht>
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
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PLBASBLs2wC/

Hello Alistair, thank you for your comments.

Changes from v1 to v2:
- explain in 3rd commit why SYSCFG input GPIOs aren't connected and add
a TODO comment in stm32l4x5_soc.c
- use macros `NUM_GPIOS` and `GPIO_NUM_PINS` in
`stm32l4x5_syscfg_set_irq`
- rename STM32L4XX to STM32L4X5, Stm32l4xx to Stm32l4x5
(the SYSCFG implementation is only valid for STM32L4x5 and STM32L4x6
but not for STM32L41xx/42xx/43xx/44xx)
- refactor STM32L4x5SyscfgState to Stm32l4x5SyscfgState to be
consistent with other peripherals

Based-on: <170289109015.23396.9428181315206234398-0@git.sr.ht>
([PATCH qemu v3 0/3] Add device STM32L4x5 EXTI)

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (3):
  hw/misc: Implement STM32L4x5 SYSCFG
  tests/qtest: Add STM32L4x5 SYSCFG QTest testcase
  hw/arm: Connect STM32L4x5 SYSCFG to STM32L4x5 SoC

 hw/arm/Kconfig                      |   1 +
 hw/arm/stm32l4x5_soc.c              |  23 +-
 hw/misc/Kconfig                     |   3 +
 hw/misc/meson.build                 |   1 +
 hw/misc/stm32l4x5_syscfg.c          | 265 ++++++++++++++++++
 hw/misc/trace-events                |   6 +
 include/hw/arm/stm32l4x5_soc.h      |   2 +
 include/hw/misc/stm32l4x5_syscfg.h  |  54 ++++
 tests/qtest/meson.build             |   3 +-
 tests/qtest/stm32l4x5_syscfg-test.c | 408 ++++++++++++++++++++++++++++
 10 files changed, 764 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_syscfg.c
 create mode 100644 include/hw/misc/stm32l4x5_syscfg.h
 create mode 100644 tests/qtest/stm32l4x5_syscfg-test.c

--=20
2.38.5
