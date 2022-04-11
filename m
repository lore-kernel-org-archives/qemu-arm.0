Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1314343lfq;
        Sun, 10 Apr 2022 18:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPHjVuBnYE6CPK2vAferZN7QyZcR6m+PfvrXePSKBaOoga6i4QSbyOPwNhrPV38YRvSRVG
X-Received: by 2002:a05:622a:1343:b0:2eb:8171:ce27 with SMTP id w3-20020a05622a134300b002eb8171ce27mr24516347qtk.8.1649641867400;
        Sun, 10 Apr 2022 18:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649641867; cv=none;
        d=google.com; s=arc-20160816;
        b=eguM7ct2rgzbiVVVORHKLlWkkLc6SXz5BcdO5OnnPcG0xTWXVt+QcXjiyFJBlWTrOn
         z00ccJNwxm/C/sJeOnw/hBxDskOYHYuJ9NKBfWwOiJaLdPp+5/p+By4VMfmuWClktuZf
         Tbzgh732XiUP3NrKaFF0iLZ71s5G/Os2g/lpvnyuPCjjQsuASYDK/EPF269h65GNKaWw
         HjssuDtMJ4df9MPN/gEpF35LPxAee/e6FQkgN1FqKHId+nll5r3hTi9IR+tA8PqySYwd
         CEcLEmaijOmD1FpVq3elvXbKj5rCWvwB9WrveMEexDQTDVm6xP5d927hWEU8qcKDk1ZU
         /z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=7QcVTnnFDZNFGlu4mkNBcgKypCb0ysjpEABVVxlcaiM=;
        b=wbF2ydMTAckvZnraduzttszGKExYm5Z1otoKHEk5XeXjE1ddUpPzGb9BPLY3alJ/nL
         yrG4vhef6ZWetIbpmsyGa1O2yGoZcEG18LrX4ea/yF0pe4YwOx3A4J+QK1k2svpSZtYZ
         oM2OlUWT7Ny3BC5Bwx95OaSoV8PNXcjCRaefoaSlBIjcXY0CqBbeSt+bbC6U86eiu26a
         V63ZmATVODOL9wbJHqHq5tbI3NBbS9fAuluz8CyCNQzn2LH1USv98SaepksXlLBbaPcR
         WeJJBvgxTVxNHclkLDqRoo2H4bMuexdS0MAkANuSvyH+XULTLS9UboZypdEvB2ow3Lro
         jv3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b134-20020a37678c000000b0067e4be23aa5si3499449qkc.746.2022.04.10.18.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Apr 2022 18:51:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndjCs-00057C-UQ
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 21:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndjCi-00056r-7i; Sun, 10 Apr 2022 21:50:56 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndjCc-0004fB-Oa; Sun, 10 Apr 2022 21:50:55 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23B1boEn052056;
 Mon, 11 Apr 2022 09:37:50 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 11 Apr
 2022 09:49:25 +0800
Date: Mon, 11 Apr 2022 09:49:19 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Message-ID: <20220411014917.GA2300@aspeedtech.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <0ddfa28a-45ae-fdfd-02a6-94ab5a34b724@kaod.org>
 <TYZPR06MB40155C89D32BB012339208C6FCE09@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <41441f8a-7ae0-4f41-543f-4df8c39fe7e2@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41441f8a-7ae0-4f41-543f-4df8c39fe7e2@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23B1boEn052056
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F205" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fxse4ECW6qFP

The 04/01/2022 13:25, Cédric Le Goater wrote:
Hi Cedric,
> Hello Jamin,
> 
> On 4/1/22 11:23, Jamin Lin wrote:
> > Hi Cedric, Joel and Andrew
> > First all, thanks for all your kindly support and review. We are so
> > glad that QEMU v7.1 will support AST1030 model.
> 
> QEMU 7.1 is for after the summer.
> 
> > 
> > 1. The ast1030 and ast2600 HACE controller are identical.
> >    Steven submitted the patch to support HACE ACC mode. Once his patch
> > accept. We will submit patch to support ast1030 model.
> 
> I think Joel is tracking these changes.
> 
> > 2. I submitted the patch to support GOIO index mode because ast1030
> >  driver was implement by index mode. I am waiting for review and any 
> > suggestion will be appreciated.
> 
> That's Andrew's turf. Or Rashmica if she has time ? I could do it but not
> now and it will take longer since I know less this area of the HW.
> 
> > 3. Troy submitted the patch to support I2C new model which included ast1030 model.
> 
> Yes. I think there is another submission on the topic. I reviewed the one
> Troy sent and some rework is needed. The I2C model is becoming quite complex
> and changes need to me introduced progressively.
>   
> 
> > 4. As for NIC plan, once AST1030 NIC driver ready, we will upstream, too.
> 
> It's not a FTGMAC100 ?
> 
It seems we can use FTGMAC100 model for AST1030 model.
However, we do not have NIC driver to support zephyr os for AST1030.
Once the driver ready, we will test it in qemu and upstream, too.
Thanks-Jamin
> 
> > BTW, do you have a plan to upstream it, https://github.com/openbmc/qemu/blob/master/hw/misc/aspeed_pwm.c
> 
> I don't. That's really an empty skeleton. There is no problem in merging it
> but if someone of your team has time to grow the model, please do !
> 
> Thanks,
> 
> C.
> 
> 
> > 
> > Thanks again - Jamin
> > 
> > ************* Email Confidentiality Notice ********************
> > DISCLAIMER:
> > This message (and any attachments) may contain legally privileged and/or other confidential information. If you have received it in error, please notify the sender by reply e-mail and immediately delete the e-mail and any attachments without copying or disclosing the contents. Thank you.
> > 
> > -----Original Message-----
> > From: Cédric Le Goater <clg@kaod.org>
> > Sent: Friday, April 1, 2022 4:55 PM
> > To: Jamin Lin <jamin_lin@aspeedtech.com>; Alistair Francis <alistair@alistair23.me>; Peter Maydell <peter.maydell@linaro.org>; Andrew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>; Cleber Rosa <crosa@redhat.com>; Philippe Mathieu-Daudé <f4bug@amsat.org>; Wainer dos Santos Moschetta <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; open list:STM32F205 <qemu-arm@nongnu.org>; open list:All patches CC here <qemu-devel@nongnu.org>
> > Cc: Steven Lee <steven_lee@aspeedtech.com>; Troy Lee <troy_lee@aspeedtech.com>
> > Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
> > 
> > Hello Jamin,
> > 
> > Thanks for these new models and machine. They are queued for QEMU 7.1.
> > There are a couple of patchsets adding support for the AST1030 GPIO controller and the I2C new mode that would be good extensions but they need review first.
> > 
> > What are the next steps? any plans for network ? The NIC should be a
> > FTGMAC100 if I am correct.
> > 
> > Thanks,
> > 
> > C.
> > 
> > 
> >    On 4/1/22 10:38, Jamin Lin wrote:
> >> Changes from v5:
> >> - remove TYPE_ASPEED_MINIBMC_MACHINE and ASPEED_MINIBMC_MACHINE
> >> - remove ast1030_machine_instance_init function
> >>
> >> Changes from v4:
> >> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> >>
> >> Changes from v3:
> >> - remove AspeedMiniBmcMachineState state structure and
> >>     AspeedMiniBmcMachineClass class
> >> - remove redundant new line in hw/arm/aspeed_ast10xx.c
> >> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> >>
> >> Changes from v2:
> >> - replace aspeed_ast1030.c with aspeed_ast10xx.c for minibmc SOCs
> >> family support
> >> - Add "ast1030-evb" machine in aspeed.c and removes aspeed_minibmc.c
> >>
> >> Changes from v1:
> >> The patch series supports ADC, SCU, SMC, TIMER, and WDT for AST1030 SoC.
> >> Add avocado test case for "ast1030-evb" machine.
> >>
> >> Test steps:
> >> 1. Download image from
> >>      
> >> https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/a
> >> st1030-evb-demo.zip 2. Extract the zip file to obtain zephyr.elf 3.
> >> Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf
> >> -nographic 4. Test IO by Zephyr command line, commands are refer to Aspeed Zephyr
> >>      SDK User Guide below
> >>      https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/Aspeed_Zephy_SDK_User_Guide_v00.01.04.pdf
> >>      - ADC(channel 0):
> >>          uart:~$ adc ADC0 resolution 10
> >>          uart:~$ adc ADC0 calibrate 1
> >>          uart:~$ adc ADC0 read_format 1
> >>          uart:~$ adc ADC0 read 0
> >>          [Result]
> >>          read: 1416mv
> >>
> >>      - SCU
> >>          uart:~$ md 7e6e2040
> >>          uart:~$ md 7e6e2080
> >>          uart:~$ md 7e6e20d0
> >>          uart:~$ md 7e6e2200
> >>          uart:~$ md 7e6e2300
> >>          uart:~$ md 7e6e25b0
> >>          [Result]
> >>          The register value should match the value of ast1030_a1_resets
> >>          in aspeed_scu.c
> >>
> >>      - Flash(fmc_cs0):
> >>          uart:~$ flash write fmc_cs0 0 0x12345678 0x87654321 0x34127856 0x78563412
> >>          uart:~$ flash read fmc_cs0 0 10
> >>          [Result]
> >>          00000000: 78 56 34 12 21 43 65 87  56 78 12 34 12 34 56 78
> >> |xV4.!Ce. Vx.4.4Vx|
> >>
> >>          uart:~$ flash erase fmc_cs0 0
> >>          uart:~$ flash read fmc_cs0 0 10
> >>          [Result]
> >>          00000000: ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> >> |........ ........|
> >>
> >>      - Timer(TIMER0):
> >>          uart:~$ timer start TIMER0 -p 2000 -t 0
> >>          TIMER0: period 20000 ms, type 0
> >>          [Result]
> >>          timer expired after 2 seconds
> >>
> >>      - Watchdog(WDT1):
> >>          uart:~$ mw 7e785008 4755
> >>          uart:~$ mw 7e78500c 1
> >>          [Result]
> >>          soc reset after 22 seconds
> >>
> >> Based-on: 20220315075753.8591-3-steven_lee@aspeedtech.com
> >> ([v2,2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute)
> >>
> >> Jamin Lin (2):
> >>     aspeed: Add an AST1030 eval board
> >>     test/avocado/machine_aspeed.py: Add ast1030 test case
> >>
> >> Steven Lee (7):
> >>     aspeed/adc: Add AST1030 support
> >>     aspeed/smc: Add AST1030 support
> >>     aspeed/wdt: Fix ast2500/ast2600 default reload value
> >>     aspeed/wdt: Add AST1030 support
> >>     aspeed/timer: Add AST1030 support
> >>     aspeed/scu: Add AST1030 support
> >>     aspeed/soc : Add AST1030 support
> >>
> >>    hw/adc/aspeed_adc.c              |  16 ++
> >>    hw/arm/aspeed.c                  |  66 +++++++
> >>    hw/arm/aspeed_ast10xx.c          | 299 +++++++++++++++++++++++++++++++
> >>    hw/arm/meson.build               |   6 +-
> >>    hw/misc/aspeed_scu.c             |  63 +++++++
> >>    hw/ssi/aspeed_smc.c              | 157 ++++++++++++++++
> >>    hw/timer/aspeed_timer.c          |  17 ++
> >>    hw/watchdog/wdt_aspeed.c         |  34 +++-
> >>    include/hw/adc/aspeed_adc.h      |   1 +
> >>    include/hw/arm/aspeed_soc.h      |   3 +
> >>    include/hw/misc/aspeed_scu.h     |  25 +++
> >>    include/hw/timer/aspeed_timer.h  |   1 +
> >>    include/hw/watchdog/wdt_aspeed.h |   3 +
> >>    tests/avocado/machine_aspeed.py  |  36 ++++
> >>    14 files changed, 724 insertions(+), 3 deletions(-)
> >>    create mode 100644 hw/arm/aspeed_ast10xx.c
> >>    create mode 100644 tests/avocado/machine_aspeed.py
> >>
> > 
> 
