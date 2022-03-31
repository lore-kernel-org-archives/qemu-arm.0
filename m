Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1612081lfb;
        Thu, 31 Mar 2022 01:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4bNwWLUh9nc8XRzRb0v+EOhigLSx9Lg5jSgWNPfBuTbkL5iPAMaxJ3+Bks0REUjXfhun+
X-Received: by 2002:a05:6214:194e:b0:441:130d:7fd1 with SMTP id q14-20020a056214194e00b00441130d7fd1mr2681592qvk.130.1648714702678;
        Thu, 31 Mar 2022 01:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648714702; cv=none;
        d=google.com; s=arc-20160816;
        b=BnsXZoLDr8ST1iNUwa6XrAN4iTM+OPmdn0sYJp8pAbKW3JjfpruLE5sc6EQjSZExvv
         4PCxAv7BY1CJifrLPQACGqykKA43uWMk+YhPyb0VgairQhOnM+MLVNpNi2qEbVJ7j8jb
         lrtE5AOLL+LxNOaWRtHW7hYf8uhs8eRUz12HG8F/3+R5x5vo3+36fRxKQKoys1XyLDob
         l6ycSYR0pBmJ+W3in2Br43G3DIUwYT4pyc857q1kqnhFSOYA9BdHIpGrzYuHnCL9JQSt
         5D9GOv386EkUHGYmXcpG3YCSh4Nmc8VJfLE8atPrB7Gl3KTce9euYzG40U2w4HRFhb6l
         FYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=v3zvLOTbRCBJAvyBWLSq1NzBpGKrmXwYYd7DXc3w0LQ=;
        b=YcjQROzUBDt0TKaP/4Bp8HYCqgsTuLKZDbEygRKirrxNh8wHTt1n8z8O9wcAO+r5VC
         IHfyVRC1M0ZVtH36yFpbtaLWfZJfZ4QEK3HJkIo9HBRvRyNh+wfHorqhsgU9xBE2tXgK
         crJY1Zvc37ilgeF2wgr4cvIbMp+naVPMFE2lTsj4Ta5074O/UEGjKiKuawmw+nwo24oS
         KvXDVcOH14cd8dO7Lz9W5w8thBPD7zOgIYdQt6FvWHA77fs0nl5Ts+34HTvrw6s6mT7G
         7hJukE4ioeJXZXN5vYvYPoOCsG4s3NSwh4UEUMVCK1mtl4B5NVwLlPPpHVpfgiZ8UExk
         0+Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca19-20020ad45613000000b00440e46a7d71si12134168qvb.527.2022.03.31.01.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 01:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZq0c-0002c4-3f
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 04:18:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpz9-0001Yr-5V; Thu, 31 Mar 2022 04:16:51 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpz5-0000j6-Up; Thu, 31 Mar 2022 04:16:50 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22V84nhR054230;
 Thu, 31 Mar 2022 16:04:49 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 31 Mar
 2022 16:15:46 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/9] Add support for AST1030 SoC
Date: Thu, 31 Mar 2022 16:15:36 +0800
Message-ID: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22V84nhR054230
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
X-TUID: 7ECa4rAZbIx7

Changes from v2:
- replace aspeed_ast1030.c with aspeed_ast10xx.c for minibmc SOCs family support
- Add "ast1030-evb" machine in aspeed.c and removes aspeed_minibmc.c

Changes from v1:
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

Based-on: 20220315075753.8591-3-steven_lee@aspeedtech.com
([v2,2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute)

Jamin Lin (2):
  aspeed: Add an AST1030 eval board
  test/avocado/machine_aspeed.py: Add ast1030 test case

Steven Lee (7):
  aspeed/adc: Add AST1030 support
  aspeed/smc: Add AST1030 support
  aspeed/wdt: Fix ast2500/ast2600 default reload value.
  aspeed/wdt: Add AST1030 support
  aspeed/timer: Add AST1030 support.
  aspeed/scu: Add AST1030 support
  aspeed/soc : Add AST1030 support

 hw/adc/aspeed_adc.c              |  16 ++
 hw/arm/aspeed.c                  | 111 +++++++++++
 hw/arm/aspeed_ast10xx.c          | 303 +++++++++++++++++++++++++++++++
 hw/arm/meson.build               |   6 +-
 hw/misc/aspeed_scu.c             |  63 +++++++
 hw/ssi/aspeed_smc.c              | 160 ++++++++++++++++
 hw/timer/aspeed_timer.c          |  17 ++
 hw/watchdog/wdt_aspeed.c         |  34 +++-
 include/hw/adc/aspeed_adc.h      |   1 +
 include/hw/arm/aspeed.h          |  21 +++
 include/hw/arm/aspeed_soc.h      |   3 +
 include/hw/misc/aspeed_scu.h     |  24 +++
 include/hw/timer/aspeed_timer.h  |   1 +
 include/hw/watchdog/wdt_aspeed.h |   3 +
 tests/avocado/machine_aspeed.py  |  36 ++++
 15 files changed, 796 insertions(+), 3 deletions(-)
 create mode 100644 hw/arm/aspeed_ast10xx.c
 create mode 100644 tests/avocado/machine_aspeed.py

-- 
2.17.1

