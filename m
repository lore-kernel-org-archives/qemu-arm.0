Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp3597538ejb;
        Sun, 10 Dec 2023 11:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwdLycwLaciuSYa9O/Qbug73tCHZFsBCMUjuzrAz/YRJMq8wI+q/lCyRtDxp5Uy0AzkFYm
X-Received: by 2002:a05:620a:2406:b0:77d:87dd:17e1 with SMTP id d6-20020a05620a240600b0077d87dd17e1mr4548179qkn.48.1702235164868;
        Sun, 10 Dec 2023 11:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702235164; cv=none;
        d=google.com; s=arc-20160816;
        b=epx49y0b2jbe71/3zxCJhk/J1U5SWr04xGzM8E8BXlL73IsZdezJkYtjfS3LEOE9Gk
         GT0KMFHKglussxVSHx8Iv6YuJA+1tQptFJDG15j+dWMpyEFfe5pcSj3W8GLRVChfSKuv
         83pnAhegMzclbOXxP2RpAZJYYc9Yw/QwON0uz7Z4KE1Z68DfwDhVjUXllaXIhrimjVFj
         vlr37OlEexuJh5YiIBu3gkrhFQXRCXrkFelSN8C2NsTLeIfRFqtLAq1x3OAbxivLOMFu
         OPLV2OKIb80sf9rHjVUL1G+Bh7x/dTW2W2Z6wpDbGnlg8mq+qEDLzP8zCbZ63+ve5Aph
         0SrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=rbYg5Yz9Itj79eWRBAVlP3g40pckEvWzywsLwOwMryA=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=p5snQ9qSO+VrHLDwiwFo4iM0SdA0z7W4q1/RW+ld4P8T95oUNq7fu6fsctGa5lM7FR
         ovG1sADGp29qwpLy0pN2pP1wDdhUa+6y9uxfxxvRKLRTAaSH9ng5xPfrwMFMTBLQjmbZ
         vS0fDtMaFuVZuB7+cAzEh/gJnRAi/sz6PQh0vynMYySAZgc0XJjIgGkSF4CmK3e5e4KV
         aK3XBxI0v8WPbqG9kzOIW1rFyPOzo14GWCv24eNaodFyXHT6BKMqNOG9Hh7bIbJtOcpx
         qzxraUbVn7zV4DL18fuNOxixmYVlgsnhQcaUYN3rUpuM5dBTm4GjCRAdTGhfuIRkitOp
         w5SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05620a14ae00b00773e4b0d065si6412874qkj.532.2023.12.10.11.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Dec 2023 11:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCP73-0007Cv-53; Sun, 10 Dec 2023 14:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rCP71-0007C9-Jp; Sun, 10 Dec 2023 14:05:11 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rCP6z-0000jW-SM; Sun, 10 Dec 2023 14:05:11 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 943FF11EEAC;
 Sun, 10 Dec 2023 19:05:06 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Sun, 10 Dec 2023 19:05:06 +0000
MIME-Version: 1.0
Subject: [PATCH qemu 0/3] [PATCH qemu 0/3] hw/arm: Add device STM32L4x5 SYSCFG
Message-ID: <170223510627.13579.3191933474458037037-0@git.sr.ht>
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
X-TUID: 5w+mq7pxd19H

This patch adds a new SYSCFG peripheral used by the STM32L4x5 SoC.
The implementation is inspired from the STM32F4xx SYSCFG, the device
registers however aren't the same.

The patch is split up in 3 commits :
- implementing the SYSCFG device
- adding tests (that fail in this commit)
- connecting the SYSCFG device to the SoC (the tests pass in this
commit)

Based-on: <170198462199.32162.284497577253427308-0@git.sr.ht>
([PATCH qemu 0/3] hw/arm: Add device STM32L4x5 EXTI)

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (3):
  hw/misc: Implement STM32L4xx SYSCFG
  tests/qtest: Add STM32L4xx SYSCFG QTest testcase
  hw/arm: Connect STM32L4xx SYSCFG to STM32L4x5 SoC

 hw/arm/Kconfig                      |   1 +
 hw/arm/stm32l4x5_soc.c              |  24 +-
 hw/misc/Kconfig                     |   3 +
 hw/misc/meson.build                 |   1 +
 hw/misc/stm32l4xx_syscfg.c          | 277 +++++++++++++++++++
 hw/misc/trace-events                |   6 +
 include/hw/arm/stm32l4x5_soc.h      |   2 +
 include/hw/misc/stm32l4xx_syscfg.h  |  62 +++++
 tests/qtest/meson.build             |   3 +-
 tests/qtest/stm32l4xx_syscfg-test.c | 408 ++++++++++++++++++++++++++++
 10 files changed, 778 insertions(+), 9 deletions(-)
 create mode 100644 hw/misc/stm32l4xx_syscfg.c
 create mode 100644 include/hw/misc/stm32l4xx_syscfg.h
 create mode 100644 tests/qtest/stm32l4xx_syscfg-test.c

--=20
2.38.5
