Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp920815ejk;
        Tue, 30 Jan 2024 08:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRDn61UhG4iJvp8MfwFAJDt7gXAWZzf2+KK9C++wFCbAe/Z387648lgHVIdcwy3AvQU9Wv
X-Received: by 2002:ac8:7f8a:0:b0:42a:b37f:4a75 with SMTP id z10-20020ac87f8a000000b0042ab37f4a75mr2374801qtj.16.1706630883870;
        Tue, 30 Jan 2024 08:08:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706630883; cv=none;
        d=google.com; s=arc-20160816;
        b=0RP7qNrvKTap3w5Xk7l9YMLZShSBMhDQp6X52nh9Grgi9ng3jTCB1V6MmQVkfXLRPo
         9dSlfSVJpbHTYTlRi1jPVcRr0C3Kd7Zh0Oo0MQud9vamtZAhtHhvVlL952dyoV+vbJSl
         d+SwA90UJiineAzoY4mwA6JG9lveIat+4iNuKmb43cgHRo4KJg5YNFbAMG+f19huhFhe
         31cIgsRBwBEfD+J98b87w5xZXPRM7lbH4BY7bYmPOXQKAseKTrO43CaPE0aq+u5xPw9H
         narvASx6rG8FKGZiOSJ5F0uONwf629KFO78mx6FEkJa26NexeAKm0xr9aU27Piw6IMfd
         NP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=LVrjzZb/80vL1mNjHWfSPL8E0/fxDvqChaQKIa1iSNI=;
        fh=jwBDM7zzBBoIAtKz0xkltPBZZuezmzz2z8Vw5yterL0=;
        b=pzGa69p78XG4VotPfX/LbgBqZwyDM3vyFw4+p7DHEYHTzQJT1r2ZrHtUkVTirVMYaw
         0ftJVKYNdSb0Plcrw/pYu/dvUYeF9cVjiVaUvWq4g9d3sEHwdSKkbs2XfOdArVzFkT3W
         PReom68F9TZCN9bypENtEL/sW5nYJB8fwyQNgfkHdU330wMasG63LIzhTiuOCGN6a1mL
         lN2kivTzXCSpJk7mF/fdYTZCSgzVujHMx+C9fa+K+lJGDcwddV3GMwJFEp5OMX3DL6ao
         L1ufHjA2iNVzz2oVMB7SNWx61QO13OJ6aGrA2UZaWfOQ2U3DMFfdopaLimLBzYGR+Kgs
         8avA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=Mf6cTkkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16-20020a05622a039000b0042977025f45si10145803qtx.551.2024.01.30.08.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=Mf6cTkkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUqe9-0008JD-6e; Tue, 30 Jan 2024 11:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rUqdw-0008F4-LK; Tue, 30 Jan 2024 11:07:24 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rUqdu-0006zV-2X; Tue, 30 Jan 2024 11:07:24 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id C3E80A074C;
 Tue, 30 Jan 2024 17:07:10 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id nwCI4f-MfNdP; Tue, 30 Jan 2024 17:07:10 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id DC1D1A075B;
 Tue, 30 Jan 2024 17:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr DC1D1A075B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1706630829;
 bh=LVrjzZb/80vL1mNjHWfSPL8E0/fxDvqChaQKIa1iSNI=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=Mf6cTkkhNRzR+voefUr+zyTl9EQQgkWw/jC3H51G/0LTeprSHvItQhatkxEbjFCH5
 cG9347GTfoRVaC2lZrO1MgQ9GlH2ld05+i2SZ5Fh5zWKnpk0kjm3qcLyKgyDcuODSb
 OzT3AM8GVyacjWVQmem4RGYlFBKytGjPJvnS5UiU=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id bJYVgXGnKfMo; Tue, 30 Jan 2024 17:07:09 +0100 (CET)
Received: from AM-Inspiron-3585.numericable.fr (38.162.10.109.rev.sfr.net
 [109.10.162.38])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 5C1FAA0657;
 Tue, 30 Jan 2024 17:07:09 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>
Subject: [PATCH v4 0/8] Add device STM32L4x5 RCC
Date: Tue, 30 Jan 2024 17:06:48 +0100
Message-Id: <20240130160656.113112-1-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: 2WvBUdugNtB4

This patch adds the STM32L4x5 RCC (Reset and Clock Control) device and is=
 part
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

Changes from v1 to v2:
- Removed a mention in the tests
- Added an early return to prevent a clang compilation error in rcc_updat=
e_pllsaixcfgr()

Changes from v2 to v3:
- Changed the timeout method used in the tests
- Added a real value for ICSR register
- Replaced some TODOs with correct error handling
- Added a commit that implements correct write protections for the CR reg=
ister

Changes from v3 to v4:
- Rebased on top of current master
- Implemented reset functions for the multiplexers and the PLLs
- Added explanatory messages to every commit
- Addded logs for unimplemented registers
- Completed the VMState for the multiplexers and the PLLs

Arnaud Minier (8):
  Implement STM32L4x5_RCC skeleton
  Add an internal clock multiplexer object
  Add an internal PLL Clock object
  Add initialization information for PLLs and clock multiplexers
  RCC: Handle Register Updates
  Add write protections to CR register
  STM32L4x5: Use the RCC Sysclk
  Add tests for the STM32L4x5_RCC

 MAINTAINERS                               |    5 +-
 docs/system/arm/b-l475e-iot01a.rst        |    2 +-
 hw/arm/Kconfig                            |    1 +
 hw/arm/b-l475e-iot01a.c                   |   10 +-
 hw/arm/stm32l4x5_soc.c                    |   45 +-
 hw/misc/Kconfig                           |    3 +
 hw/misc/meson.build                       |    1 +
 hw/misc/stm32l4x5_rcc.c                   | 1415 +++++++++++++++++++++
 hw/misc/trace-events                      |   14 +
 include/hw/arm/stm32l4x5_soc.h            |    5 +-
 include/hw/misc/stm32l4x5_rcc.h           |  239 ++++
 include/hw/misc/stm32l4x5_rcc_internals.h | 1042 +++++++++++++++
 tests/qtest/meson.build                   |    3 +-
 tests/qtest/stm32l4x5_rcc-test.c          |  207 +++
 14 files changed, 2947 insertions(+), 45 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_rcc.c
 create mode 100644 include/hw/misc/stm32l4x5_rcc.h
 create mode 100644 include/hw/misc/stm32l4x5_rcc_internals.h
 create mode 100644 tests/qtest/stm32l4x5_rcc-test.c

--=20
2.34.1

