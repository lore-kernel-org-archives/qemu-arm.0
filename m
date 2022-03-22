Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1217643lfb;
        Mon, 21 Mar 2022 19:53:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxL74/DODEpJ7hswBWH+AlRBhu14IZ0OuxBwfsz90iyClhgoDxXior40ydBvB3kV1Y2los
X-Received: by 2002:a05:622a:120a:b0:2e1:c9ba:e99b with SMTP id y10-20020a05622a120a00b002e1c9bae99bmr18560439qtx.685.1647917616993;
        Mon, 21 Mar 2022 19:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647917616; cv=none;
        d=google.com; s=arc-20160816;
        b=0sKHHR2qBmPk0a6oLFWn7udkTVhpy2lIn/rYPs32OFso3nB+yTDABJH/717q4R9/Gi
         BsdhPraVBhnySNVynJhRfGRaCoIjPad0vyKCzqfUwxseW1ZN00hLonLGxHdoujBatP5Y
         x0RTojTKFce41J5d/W03g3jL4RgZyR7Qn5WVTmeH2mHeFm/mZJBBCVQx/TlHd/rTdO00
         urA9YvTowpsUAjDVMmhVCyIOoTAKB/XqicCKnerOonly25+iKBr7hZnk4bSpikf04/4r
         LE/PoZgCBPfOAf0dd3FDe5lBCX8TZCsDCXSO0u4EYZ5OOVgPG6cnwQ+qgVXCFRbcng4Q
         tByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=FfKraDo4CGge+aeaa6QQA3XIAS4ASOzJYLDWJoPQGVA=;
        b=q5PUn9qdZicQyp0DWoVBXD+W3eayEiq0B/hKs1viXX2uAgf4IlfLgVy5YerTQ+w4xh
         fz5ZJ2fCmD4Vs5f6Q4hXXoQOf6R24u40ThtP0F+/jXfFDYjFTRcFY7gGPKq+hG8KYEb0
         1Lhp5fweGLgheQBzQmLYzFJEGpQAMvIBS14N3yPkkgmTCx861ZEQTPPaCFaLbTyzTAEe
         rHgg1i0085GY45pe+gZLkmZhqWTe3nkM26Tb3waydhc3B477WUzwLrbYdwdMmjx/WSKm
         wX5f/D3sEuuvgsudviTwCJjBuvE3aRMwEntNC1/7TbQwmOIRy/q8sY+7YxdhWZM1Dnjn
         RAbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e187-20020a3769c4000000b0067e4be2397dsi2473670qkc.450.2022.03.21.19.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 19:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUeO-0003eR-HB
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 22:53:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUds-0002zO-Th; Mon, 21 Mar 2022 22:53:04 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:17764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUdp-0001uy-7J; Mon, 21 Mar 2022 22:53:04 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fSdS078436;
 Tue, 22 Mar 2022 10:41:28 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 10:51:56 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/9] Add support for AST1030 SoC
Date: Tue, 22 Mar 2022 10:51:45 +0800
Message-ID: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fSdS078436
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtmRdznSU7/S

The patch series supports ADC, SCU, SMC, TIMER, and WDT for AST1030 SoC.
Add avocado test case for "ast1030-evb" machine.

Test steps:
1. Download image from
   https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
2. Extract the zip file to obtain zephyr.elf
3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
4. Test IO by Zephyr command line, commands are refer to Aspeed Zephyr
   SDK User Guide below
   https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/Aspeed_Zephy_SDK_User_Guide_v00.01.04.pdf
   - ADC(channel 0):
       uart:~$ adc ADC0 resolution 10
       uart:~$ adc ADC0 calibrate 1
       uart:~$ adc ADC0 read_format 1
       uart:~$ adc ADC0 read 0
       [Result]
       read: 1416mv

   - SCU
       uart:~$ md 7e6e2040
       uart:~$ md 7e6e2080
       uart:~$ md 7e6e20d0
       uart:~$ md 7e6e2200
       uart:~$ md 7e6e2300
       uart:~$ md 7e6e25b0
       [Result]
       The register value should match the value of ast1030_a1_resets
       in aspeed_scu.c

   - Flash(fmc_cs0):
       uart:~$ flash write fmc_cs0 0 0x12345678 0x87654321 0x34127856 0x78563412
       uart:~$ flash read fmc_cs0 0 10
       [Result]
       00000000: 78 56 34 12 21 43 65 87  56 78 12 34 12 34 56 78 |xV4.!Ce. Vx.4.4Vx|

       uart:~$ flash erase fmc_cs0 0
       uart:~$ flash read fmc_cs0 0 10
       [Result]
       00000000: ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff |........ ........|

   - Timer(TIMER0):
       uart:~$ timer start TIMER0 -p 2000 -t 0
       TIMER0: period 20000 ms, type 0
       [Result]
       timer expired after 2 seconds

   - Watchdog(WDT1):
       uart:~$ mw 7e785008 4755
       uart:~$ mw 7e78500c 1
       [Result]
       soc reset after 22 seconds

Please help to review.

Thanks

Based-on: 20220315075753.8591-3-steven_lee@aspeedtech.com
([v2,2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute)

Jamin Lin (1):
  test/avocado/machine_aspeed.py: Add ast1030 test case

Steven Lee (8):
  aspeed/adc: Add AST1030 support
  aspeed/smc: Add AST1030 support
  aspeed/wdt: Fix ast2500/ast2600 default reload value.
  aspeed/wdt: Add AST1030 support
  aspeed/timer: Add AST1030 support.
  aspeed/scu: Add AST1030 support
  aspeed/soc : Add AST1030 support
  aspeed: Add an AST1030 eval board

 hw/adc/aspeed_adc.c              |  16 ++
 hw/arm/aspeed.c                  |   2 +-
 hw/arm/aspeed_ast1030.c          | 301 +++++++++++++++++++++++++++++++
 hw/arm/aspeed_minibmc.c          | 129 +++++++++++++
 hw/arm/meson.build               |   8 +-
 hw/misc/aspeed_scu.c             |  63 +++++++
 hw/ssi/aspeed_smc.c              | 160 ++++++++++++++++
 hw/timer/aspeed_timer.c          |  17 ++
 hw/watchdog/wdt_aspeed.c         |  34 +++-
 include/hw/adc/aspeed_adc.h      |   1 +
 include/hw/arm/aspeed.h          |  25 +++
 include/hw/arm/aspeed_soc.h      |   3 +
 include/hw/misc/aspeed_scu.h     |  24 +++
 include/hw/timer/aspeed_timer.h  |   1 +
 include/hw/watchdog/wdt_aspeed.h |   3 +
 tests/avocado/machine_aspeed.py  |  36 ++++
 16 files changed, 819 insertions(+), 4 deletions(-)
 create mode 100644 hw/arm/aspeed_ast1030.c
 create mode 100644 hw/arm/aspeed_minibmc.c
 create mode 100644 tests/avocado/machine_aspeed.py

-- 
2.17.1

