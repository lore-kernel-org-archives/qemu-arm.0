Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp905895ejb;
        Mon, 19 Feb 2024 12:10:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2dW+auFWPg8PVGaI1+7GjHvmkAGJmion61yhxh2o/d4xWtYC7Zd9/peCi/w8BtzSccvoe6GP4d9dWmN02TRkjw761DvOC
X-Google-Smtp-Source: AGHT+IF2TBmjzqjsvqrXCmnJdjVLFhVbyCDtThB8tpRzyLGlzcPffv+XYSCbHdDroAXIvwD2vDNA
X-Received: by 2002:a05:620a:56e:b0:787:367a:c59c with SMTP id p14-20020a05620a056e00b00787367ac59cmr19630057qkp.19.1708373401499;
        Mon, 19 Feb 2024 12:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708373401; cv=none;
        d=google.com; s=arc-20160816;
        b=O8wcTmxelrACeyx7z3F/jcV8nfh3xZ3FxZL0ueUSIXoARKVI9bpJQJnntqWSBed9dN
         fAayda7CzF48crlLk2aNIwZCI64sqnVFkvqWJxoNZ1o0z2/XPh3Q8LZK5ZFjHIgPMJfX
         XMRihFb7yPkYOFPDbj7vUdqWolWSpEhXFCv1WGKEOa6LIwo7XfZ9hIg45aKK0VXApKCk
         A1HVuNdHKm3+JA0Yj4jTHYRoueCy6+TnoepJxPHoLDVb3VyhI6NHqBnIieC6qldQd7tE
         sh5om5BBdcgFuAkudgLvsxGDR2eSQqhz/4NWWvvanuP/Aebm7Wkx5B07oQwI2+RZ8jXD
         Hitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=LLInqYBXUK/ndsBExIh0DrigNLIsd8wz64iKo5Pe5/A=;
        fh=58DdXjNEhnAMefdYf7t1zzeZ7Biw6cxiQpFmUFYWmd4=;
        b=ZrjmmuYrGaWZeKSlTWsXISAv25M8wAsZtRo16E1VIujbRs5dVsn131E3RnHi2WZfdD
         jVqVcHS1r1gb7YAbTFR9xyQf/2XjsTCtcbtRkNLSNqemCapk6Uu3dwvzBf1QMXzj4bIh
         IVOd6XgTIrW4OZUS9hP36K5y420ny8Vg29oLgfFPv8GajrcIxov6ZuJs+Z8+xQuRYPOI
         QEo13UFvsbSMlFdi+fQlUgGl/0upEtHgFAAElRgFz999zrNBhni3ANVK+hgYpwI8XIVd
         Z0ZsNOhAh+zM6oCo5pdbY8Ht9YeFJoQwQ58969qZkS+nkfg3nD0YihvHWwada7G1ch0Y
         VNuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=bCVSx4wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05620a29cb00b00787711230c3si1526175qkp.512.2024.02.19.12.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 12:10:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=bCVSx4wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rc9xA-0001r9-KR; Mon, 19 Feb 2024 15:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rc9x7-0001qS-Ip; Mon, 19 Feb 2024 15:09:27 -0500
Received: from zproxy2.enst.fr ([2001:660:330f:2::dd])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rc9x5-0003tw-9V; Mon, 19 Feb 2024 15:09:25 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 73F8A80568;
 Mon, 19 Feb 2024 21:09:17 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id gHJrlFgdR64H; Mon, 19 Feb 2024 21:09:17 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id E57A38057F;
 Mon, 19 Feb 2024 21:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr E57A38057F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1708373357;
 bh=LLInqYBXUK/ndsBExIh0DrigNLIsd8wz64iKo5Pe5/A=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=bCVSx4wqULQmxRmDrNIC+6ai2VKQpOobsJeaH6TwpRuOb+m5BaOhtqLIa00FHlkoe
 L5TWy8es5MinZXlgBTXc5Vy2tBGqJRpCMqeUgZdZSqMbA5HSOi9wiRxpxmrK50Eplg
 KOZKKxgi4BDvw3YVRb7fHVacHYzorrxWcBut4nKY=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id AqysWEr4dGJQ; Mon, 19 Feb 2024 21:09:16 +0100 (CET)
Received: from AM-Inspiron-3585.. (cust-west-par-46-193-4-103.cust.wifirst.net
 [46.193.4.103])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 4AA8780568;
 Mon, 19 Feb 2024 21:09:16 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
Subject: [PATCH v5 0/8] Add device STM32L4x5 RCC
Date: Mon, 19 Feb 2024 21:09:00 +0100
Message-Id: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dd;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy2.enst.fr
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
X-TUID: Oe60QXd/DJAf

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

Changes from v4 to v5:
- Abort when trying to set an out-of-bound pll vco multiplier

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
 hw/misc/stm32l4x5_rcc.c                   | 1416 +++++++++++++++++++++
 hw/misc/trace-events                      |   14 +
 include/hw/arm/stm32l4x5_soc.h            |    5 +-
 include/hw/misc/stm32l4x5_rcc.h           |  239 ++++
 include/hw/misc/stm32l4x5_rcc_internals.h | 1042 +++++++++++++++
 tests/qtest/meson.build                   |    3 +-
 tests/qtest/stm32l4x5_rcc-test.c          |  207 +++
 14 files changed, 2948 insertions(+), 45 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_rcc.c
 create mode 100644 include/hw/misc/stm32l4x5_rcc.h
 create mode 100644 include/hw/misc/stm32l4x5_rcc_internals.h
 create mode 100644 tests/qtest/stm32l4x5_rcc-test.c

--=20
2.34.1

