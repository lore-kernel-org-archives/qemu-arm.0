Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1965168ejv;
        Fri, 29 Mar 2024 10:44:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVREsnFfJJyMjBpJBE6ezdIwXY0Ym7fWhB2FGxNPOxEgXBZpgjtoSpveFDyAxJxaqFMR/dOdV9IxOsLFB0DD41Io7bU8nkQ
X-Google-Smtp-Source: AGHT+IHUXTmUZxxwTl++ZuatFFDy2fnfeKI+eEGP0ip2nBc7zSe315p6rKRiUtapC7JEy52pUnVu
X-Received: by 2002:ac8:5c93:0:b0:432:c9c0:26fd with SMTP id r19-20020ac85c93000000b00432c9c026fdmr1059506qta.16.1711734279648;
        Fri, 29 Mar 2024 10:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711734279; cv=none;
        d=google.com; s=arc-20160816;
        b=YuynweGfo4GF9tkkUkqaSdnpzdyt+TcoREi1bQBPGO8snJxKg4bdbiHQqCXV7uhFg4
         RJKL0SpVxaUH4xMkiBcJjisvzokgH8n5hEiAc3IMogkFTt4hNYuM1xvcYmORVPdqrqnI
         eYtge0qSNMqK8U4vtFiFxBF6JitXYqI0cHQDYmwZuxx0Sc1fKqK7TgOI/QAWiJrE2JNO
         F5TYcFrlBBzcFjzT04iZDc3heYXlQV8Bk/YvwNs8FR5qo+wt62/fNttfmpLT38kQrQ2r
         JEIXUZEooPWrsQxmSS7uXQb8OxZPKryMZMWdbMLQkT1od/Guy+oE/DEceF6Txu5zPdEF
         iPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=hP/H/U5zGE9cZPNoevdOoPgNlljUCU4i6hF77V1gpX8=;
        fh=b2JnWHbYnS2iP4VtUK/JL60wrJDxFsHJR5RAw1Tqwk8=;
        b=xneiOFQs9qPZIp2ZWAM6wWprwntmJmVuI9aqwg3uxDly9vhGXstQOsn27o+4kIbBMF
         HaHYcJwsVhWFOH/r4EVvNP0/g0wDhBIIIMRQFbeTmUWHFkpMRJ8W8vDpa4uTd5BFjPZv
         bff7yZ/0GTyP03S7Aium3Yma0Yg8UHc6l3v1k5wUCkfpJ2AITkOkj+bluI/BQQlvoo6M
         oPfeykQGlbx82fvF89jSdT04kDlxwEQ25rIqFs87ttrvQ36EX8B6AebIIm84yQr2H9K3
         K4awnTAlaNgnoUsMshjFAP3sCtrz+m61uZAKRpFfdH5EWilM0vTVcbKvTws5+a0WGHSp
         kXuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="aXY6/921";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020ac85982000000b004315e4f196asi4123893qte.664.2024.03.29.10.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2024 10:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="aXY6/921";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqGHC-000582-CZ; Fri, 29 Mar 2024 13:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rqGHB-00057k-FR; Fri, 29 Mar 2024 13:44:25 -0400
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rqGH9-0007Ny-AW; Fri, 29 Mar 2024 13:44:25 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 9C590A0597;
 Fri, 29 Mar 2024 18:44:17 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id A8TwLrCUT-7w; Fri, 29 Mar 2024 18:44:16 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id B571BA07BF;
 Fri, 29 Mar 2024 18:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr B571BA07BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1711734256;
 bh=hP/H/U5zGE9cZPNoevdOoPgNlljUCU4i6hF77V1gpX8=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=aXY6/921WEcf8mDMDueeCdVbfUFrmjNGJmJ0tKzBcANfb0TI8FciFUJw7pjhjTPeY
 G/nvdcVy+9+ftR8VlaBrqNY70IVnqckNjkwil4NdK+i4VlnYUyqDyfI8bma1ESc3pF
 lat+9rQdjtsup+ER49t9C/9SlSdDGdsmaKbSspYo=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id LvSpXaV796Mq; Fri, 29 Mar 2024 18:44:16 +0100 (CET)
Received: from AM-Inspiron-3585.. (unknown [78.209.135.136])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 5968AA0597;
 Fri, 29 Mar 2024 18:44:15 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 0/5] hw/char: Implement the STM32L4x5 USART, UART and LPUART
Date: Fri, 29 Mar 2024 18:43:57 +0100
Message-Id: <20240329174402.60382-1-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: 4HV4zGaNsVeV

This patch adds the STM32L4x5 USART
(Universal Synchronous/Asynchronous Receiver/Transmitter)
device and is part of a series implementing the
STM32L4x5 with a few peripherals.

It implements the necessary functionalities to receive/send
characters over the serial port, which are useful to
communicate with the program currently running.

Thank you Peter and Thomas for your reviews !

Changes from v1 to v2:
- Use asynchronous transmission for serial communication
  (based on cmsdk-apb-uart implementation)
- Use qemu_log_mask instead of error_report
- Squash the commit that renamed the base struct
- Use switch statements where appropriate
- Fix RDR and TDR mask size
- Increase time limit in tests
- Remove the global qtest in the tests
- Use assert when checking the interrupt number in the tests
- Correct usage of g_autofree in the SoC

Changes from v2 to v3:
- Fix typos and comment formatting
- Declare variables at the start of code blocks in the SoC
- Use %u instead of %x in an error log
- Add ".abstract =3D true" to the base usart class
- Change tests to use meson harness timeout
- Drop merged RCC commit

Arnaud Minier (5):
  hw/char: Implement STM32L4x5 USART skeleton
  hw/char/stm32l4x5_usart: Enable serial read and write
  hw/char/stm32l4x5_usart: Add options for serial parameters setting
  hw/arm: Add the USART to the stm32l4x5 SoC
  tests/qtest: Add tests for the STM32L4x5 USART

 MAINTAINERS                        |   1 +
 docs/system/arm/b-l475e-iot01a.rst |   2 +-
 hw/arm/Kconfig                     |   1 +
 hw/arm/stm32l4x5_soc.c             |  82 +++-
 hw/char/Kconfig                    |   3 +
 hw/char/meson.build                |   1 +
 hw/char/stm32l4x5_usart.c          | 634 +++++++++++++++++++++++++++++
 hw/char/trace-events               |  12 +
 include/hw/arm/stm32l4x5_soc.h     |   7 +
 include/hw/char/stm32l4x5_usart.h  |  67 +++
 tests/qtest/meson.build            |   4 +-
 tests/qtest/stm32l4x5_usart-test.c | 325 +++++++++++++++
 12 files changed, 1131 insertions(+), 8 deletions(-)
 create mode 100644 hw/char/stm32l4x5_usart.c
 create mode 100644 include/hw/char/stm32l4x5_usart.h
 create mode 100644 tests/qtest/stm32l4x5_usart-test.c

--=20
2.34.1

