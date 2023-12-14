Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2399260ejo;
        Thu, 14 Dec 2023 07:23:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkYfGBGvc7ObpneiizpAX49whUn3pK6rqMZdKt4RL/VcwkTz0GLn+zbtHpx+zVd2pomzKi
X-Received: by 2002:a05:6808:3090:b0:3b8:b063:664f with SMTP id bl16-20020a056808309000b003b8b063664fmr9970045oib.70.1702567411370;
        Thu, 14 Dec 2023 07:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702567411; cv=none;
        d=google.com; s=arc-20160816;
        b=nXchh1upbAoTcQussnZNBySjL6Z8Je1t1Yt9nDgG091duOzCP9rQmbHaCfDPZPS1nq
         sqOQy0BAhDAiAHFawiTxNyp+p5IPAvFF7zykhAYICmIoDohhahRQvLPbEUKUQw6HJ6Io
         B46L+7DBbcC4W9xJ6534jQvoBJApcclF/EfN+8UAslAPRtCVq55TgK1Ls9N4NRDFTGef
         smqN0pTCOqBYI+IIaiIAiJNoWT9gOwfOYxuBzKa4KAkuWCYnQBltToBaT9RYM+LPkEDb
         l/cDVmDXPMjrd/8nxx7kufGlEvMvuWHd6IvNOTM8ZXZ43gtN4nW5TkqauY4MoeUxKLIZ
         baQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=4vwu1N/wk92aV//DKFlp8NLcWSOFrquubjeSOaY8bJI=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=rOZy5V6XuoHg64OEdbXTTCwFcOUJ7qfjOBIB3+7BwAfMnNakdigCz+ySVag/y08TE8
         LxFIz9eNnVITE+FwO+RVxVVda5Kp6rLuPvv3FgUdJKDOncGKfLIW6ao3NkG4ZUOjB4gA
         2VJI8qJlPbVYlNxezIRayc/3ObJE3Nkw2fDJqTpimBVNNB5AN7sG98yzvLtxzsPBDeDO
         vZEQVIqrXvcvvWB22yXArszbs7WK6weLjnjkkagw+ZX2wfw6ZcMXd3SkxIqh6x603/0g
         lpuMEHmI+64/V3CKlyy2HhPzDFNhGEAmF3qX0qNG35U0NNZ/xs5FzWSavIoFiwIDMc4S
         t2dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a67f346000000b0046487e71e02si2660743vsm.398.2023.12.14.07.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 07:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDnYY-0003BB-Fg; Thu, 14 Dec 2023 10:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rDnYW-0003Ad-GL; Thu, 14 Dec 2023 10:23:20 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rDnYU-0000xi-KV; Thu, 14 Dec 2023 10:23:20 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CAB3E11EEDB;
 Thu, 14 Dec 2023 15:23:15 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Thu, 14 Dec 2023 15:23:15 +0000
MIME-Version: 1.0
Subject: [PATCH qemu v3 0/2] Add minimal support for the B-L475E-IOT01A board
Message-ID: <170256739558.25729.14053113716470464567-0@git.sr.ht>
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
X-TUID: NU8XtJn5x5p/

This patch adds a new STM32L4x5 SoC, it is necessary to add support for
the B-L475E-IOT01A board.
The implementation is derived from the STM32F405 SoC and NetduinoPlus2
board.
The implementation contains no peripherals, only memory regions are
implemented.

Sorry about the inconsistency in licenses in v2, I changed them.
Should I clarify anything further? Thank you.

Changes from v1 to v3:
Changing the MIT license to GPL.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (2):
  hw/arm: Add minimal support for the STM32L4x5 SoC
  hw/arm: Add minimal support for the B-L475E-IOT01A board

 MAINTAINERS                             |  15 ++
 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |  11 +
 hw/arm/b-l475e-iot01a.c                 |  70 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 268 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  59 ++++++
 7 files changed, 426 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.38.5
