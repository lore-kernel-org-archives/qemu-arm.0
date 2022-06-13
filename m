Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1381830lfb;
        Mon, 13 Jun 2022 06:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbSLTiFqb509UvhF4MMTDFpL9RL1QNxCrJgSSIKUfo1h2+op8GVeoTXhst4kQsyOgAl5Xy
X-Received: by 2002:a05:6214:19ce:b0:46c:4ca7:6c3a with SMTP id j14-20020a05621419ce00b0046c4ca76c3amr20103307qvc.57.1655126828062;
        Mon, 13 Jun 2022 06:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655126828; cv=none;
        d=google.com; s=arc-20160816;
        b=WlGpxSx0LOEgwyS0DQUaCz6cWMwpoldh8Br0zh+sJ/Qq+bWtYgwsp/Jv5VMhO9AZli
         eSPhAafTDcG2j3/BY5nQvnOLSTyzNe5XgTdnWy9tjfm8c+OvoxHuWPjl3Kf0pGi1nA0a
         JcwJs1O+xAUnGHWAyPQuEEl7Ip28vDcS9VEkc695O4cIeRzI9XxaXcDeQUufQDLf0z+Q
         UHhCNt2u4YtyrTxL0/5WUY9FKXW/Dz/K05/7ngRDMPE8D5jMwukgckdbYFw8Rk4+8jZH
         7aJ0n2BYdFVDd+A7E/r6snANSm+arRHinpnJ/MyyfVm9uamb3JYvlv8KlBLzRdM1x/e8
         Q+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=68GZRpG+coA4mQqh4zmFW6PKJkGUQZea17SEiHw0XJA=;
        b=OruEx8LuLWXHbIeqU9II/UWl8k/pSOa3OmUXKRb07qiSusqD72IOhLpgt0v5expHYl
         4oHnnhVR/q7Oq8e6oGH3A/SbfIpk79iggaPw061mRsnSvBZORXfmnluFjUSTIyWiKL/F
         CEjLiHSkQl/EK73BB56qxCrz42/G3k6Igsu2nj6t7+kaxGbHiUvynRfGdhi1/3tnRL7/
         YHRC/U3ryTxFNETimq2Rjq6JQaPCuqq0m1fRePpwbJrRu9+85GFHhcpCvroSoASycvzz
         nhQlRyDoHZqE3GPxZ0dpIEHHMBmTRdvD1sJVvcJ76oe1GShKIk7aPDghzgYL2IR7PZ8j
         WVTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a144a00b00304eb097d9asi4446379qtx.518.2022.06.13.06.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0k5z-0000Fz-Fa
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k55-0000FO-CM; Mon, 13 Jun 2022 09:26:11 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k53-0004SB-59; Mon, 13 Jun 2022 09:26:11 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC4h1BmMz4yY5;
 Mon, 13 Jun 2022 23:25:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC4R56Ybz4yXP;
 Mon, 13 Jun 2022 23:25:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 00/17] aspeed: Extend ast2600 I2C model with new mode
Date: Mon, 13 Jun 2022 15:25:22 +0200
Message-Id: <20220613132539.2199772-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E1Hgazdt370J

Hello,

Here is a series aggregating recent changes proposed on the Aspeed
ast2600 I2C controller model. 

First comes a large set of changes converting the model to use the
registerfield interface and adding the I2C new register mode
(Joe). Since this is complex to review, extra tests are added to the
acceptance test suite to check that I2C devices are still functional
in the ast2600-evb machine. These tests use small buildroot images
available on GH.

The ast1030 and ast2600 SoC share the same I2C logic. This series adds
I2C support to the ast1030 now that new register mode is supported.
There was a previous proposal from Troy doing the same but Joe's
patchset covers the same need (and converts the model to registerfield)

Klaus made a proposal to add support for multi master in the I2C core
and the Aspeed I2C model. The last patches add the required bits to
let this happen.  

Thanks,

C.

Changes in v2:

 - reworked I2C avocado tests
 - dropped ctrl_global_rsvd property
 - removed support for multiple masters from Klaus. this change should
   come in its own series.
  

Cédric Le Goater (8):
  aspeed: Remove fake RTC device on ast2500-evb
  test/avocado/machine_aspeed.py: Move OpenBMC tests
  test/avocado/machine_aspeed.py: Add tests using buildroot images
  test/avocado/machine_aspeed.py: Add I2C tests to ast2500-evb
  test/avocado/machine_aspeed.py: Add I2C tests to ast2600-evb
  test/avocado/machine_aspeed.py: Add an I2C RTC test
  aspeed/i2c: Add ast1030 controller models
  aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always

Joe Komlodi (6):
  hw/registerfields: Add shared fields macros
  aspeed: i2c: Migrate to registerfields API
  aspeed: i2c: Use reg array instead of individual vars
  aspeed: i2c: Add new mode support
  aspeed: i2c: Add PKT_DONE IRQ to trace
  aspeed: i2c: Move regs and helpers to header file

Klaus Jensen (2):
  hw/i2c/aspeed: rework raise interrupt trace event
  hw/i2c/aspeed: add DEV_ADDR in old register mode

Troy Lee (1):
  aspeed: Add I2C buses to AST1030 model

 include/hw/i2c/aspeed_i2c.h         | 289 +++++++++-
 include/hw/registerfields.h         |  70 +++
 hw/arm/aspeed.c                     |  17 +-
 hw/arm/aspeed_ast10x0.c             |  18 +
 hw/i2c/aspeed_i2c.c                 | 820 +++++++++++++++++-----------
 hw/i2c/trace-events                 |   2 +-
 tests/avocado/boot_linux_console.py |  43 --
 tests/avocado/machine_aspeed.py     | 136 +++++
 8 files changed, 1030 insertions(+), 365 deletions(-)

-- 
2.35.3

