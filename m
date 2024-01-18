Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp145202ejg;
        Thu, 18 Jan 2024 01:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMtGFbnEHm6gpWMvJnUnMAxgDrnbigZT5Uu/QdN2kbs3Sqv/PHMRFIBgez2iqFuxZGqWLU
X-Received: by 2002:a05:6808:2383:b0:3bd:9d23:4906 with SMTP id bp3-20020a056808238300b003bd9d234906mr506613oib.55.1705569132666;
        Thu, 18 Jan 2024 01:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705569132; cv=none;
        d=google.com; s=arc-20160816;
        b=Wash4rmDMQPsMqCGzJ7m3pngy+ylF9TAkRUB7zHqohKU1lNwtoRLQLszA2gkCm2zZL
         1ZtbZzGtG+7pTHIvcGh/8p3Wpg2BlSH0PUjbsDO331Vr3UuntJ6D7+F+cOJiGKUJkxTD
         sNcO5mCI6rOi8UtJMyv5FtNXNliV3Z6Wbk712lDW83yIBhAudhNfQ8vdXgv+h4bxkN62
         S/TNArYZr1s3vzln2gIngTxL+6yzUb1642VZjIuAH8T4NJMi5ZGga/0lyDJgp+Vlv2rv
         geSdy7/c+RB+gVZbdR6ouZpZxnIH5kfI5PyCxJDt9y2UImErgg1Qb/G9t6cNs/YDBJJO
         2z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=haQavn94m/tteUB3lxixVne3km3oXG4ZBbxq6A9NN4s=;
        fh=ia80F453WKIBMngdYYfY95KRxDcidnk431tqhaJUocM=;
        b=PAxOGhFIWXVrbTOHl4L2AZL4IDnMgGOR570SpL9/SKu5fDRZSnLbWxPeoH41/O5a6Y
         A4Pd6phLT2Yowo1E4LRyjW3FzouszH6oCv2ptSZ1KotQ20GXUQb2y3MdGiLCyi6ZuuUm
         ii5XPir47vwpB3lHP0IfGmu2PcXgHztkHhWDLycg6eLlD5iaj5iJ9bvOdSx9k+Vt3+tf
         HKHuI+MczC2xj+bZrKfGRdjoesS6BzdSJ4LvqKjyvbi02fnYElfUxKunrlHWBvxSVDvq
         doV0FMjaO7M7GcFTU0nQtHw7jrTfuIoZ0ZxLxVb01MOOG9hwbtxGSQgQe6SnbNFG71rl
         Ouaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="yuvaB/mY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05622a04ca00b0042977cd5f07si13244124qtx.721.2024.01.18.01.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 01:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="yuvaB/mY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rQOR1-0006kj-V2; Thu, 18 Jan 2024 04:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rQOR0-0006jy-63; Thu, 18 Jan 2024 04:11:38 -0500
Received: from zproxy4.enst.fr ([137.194.2.223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rQOQy-0004mf-6h; Thu, 18 Jan 2024 04:11:37 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id DF9A320641;
 Thu, 18 Jan 2024 10:11:29 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id i8QuuKoEu9eu; Thu, 18 Jan 2024 10:11:28 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 9711F205CE;
 Thu, 18 Jan 2024 10:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 9711F205CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1705569088;
 bh=haQavn94m/tteUB3lxixVne3km3oXG4ZBbxq6A9NN4s=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=yuvaB/mYHg3DQ2GaEILzzhtag6c5Z49pGUJ65Jn6llgHj1SPVIdKq0LC2VZAdEQzr
 HeaaKYRT2ylCueZpwePmUxQgfqIWpn3qG6m3xOQvv8+/a/1KyKmhGLdwIxXs7acfA3
 LDQmtWwyN+uowHdNT/QM6zxZ5iVQB8/LKqXBkYdQ=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id Xz-urpE3TI3m; Thu, 18 Jan 2024 10:11:28 +0100 (CET)
Received: from AM-Inspiron-3585.numericable.fr (38.162.10.109.rev.sfr.net
 [109.10.162.38])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id BCF1720557;
 Thu, 18 Jan 2024 10:11:27 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, samuel.tardieu@telecom-paris.fr,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/7] Add device STM32L4x5 RCC
Date: Thu, 18 Jan 2024 10:11:00 +0100
Message-Id: <20240118091107.87831-1-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.223;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4tWVKqqTcK+y

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
- Add an early return to prevent a clang compilation error in rcc_update_=
pllsaixcfgr()

Arnaud Minier (7):
  Implement STM32L4x5_RCC skeleton
  Add an internal clock multiplexer object
  Add an internal PLL Clock object
  Add initialization information for PLLs and clock multiplexers
  RCC: Handle Register Updates
  STM32L4x5: Use the RCC Sysclk
  Add tests for the STM32L4x5_RCC

 MAINTAINERS                               |    5 +-
 docs/system/arm/b-l475e-iot01a.rst        |    2 +-
 hw/arm/Kconfig                            |    1 +
 hw/arm/b-l475e-iot01a.c                   |   10 +-
 hw/arm/stm32l4x5_soc.c                    |   45 +-
 hw/misc/Kconfig                           |    3 +
 hw/misc/meson.build                       |    1 +
 hw/misc/stm32l4x5_rcc.c                   | 1299 +++++++++++++++++++++
 hw/misc/trace-events                      |   14 +
 include/hw/arm/stm32l4x5_soc.h            |    5 +-
 include/hw/misc/stm32l4x5_rcc.h           |  239 ++++
 include/hw/misc/stm32l4x5_rcc_internals.h | 1044 +++++++++++++++++
 tests/qtest/meson.build                   |    3 +-
 tests/qtest/stm32l4x5_rcc-test.c          |  210 ++++
 14 files changed, 2836 insertions(+), 45 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_rcc.c
 create mode 100644 include/hw/misc/stm32l4x5_rcc.h
 create mode 100644 include/hw/misc/stm32l4x5_rcc_internals.h
 create mode 100644 tests/qtest/stm32l4x5_rcc-test.c

--=20
2.34.1

