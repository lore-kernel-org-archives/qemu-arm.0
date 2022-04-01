Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp722485lfb;
        Fri, 1 Apr 2022 02:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM8N8YuYF+loVYg6Nec2DbPMp+blZNGHhKBtjB1Kbaasw+lvAwi4X5nAWNXhCBOirjr4PK
X-Received: by 2002:a05:620a:993:b0:67b:1385:242a with SMTP id x19-20020a05620a099300b0067b1385242amr5992682qkx.14.1648803616017;
        Fri, 01 Apr 2022 02:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648803616; cv=none;
        d=google.com; s=arc-20160816;
        b=HZVAjNjMgYMST68+1y5DvV6UtfEpfiDGDbzEp53ita2eq1LPTJjTfTvthjR2y4swbl
         VGK6CL3Pum+gL7BaMiyXat8HHHpYJTudAYYXndKOCQTUoa7s4/fIySV/XMrgVPn5bQjy
         yIaNMye4wUlsQPHwIWf5m8FiGaRRbaOZvKidzGRrWrQZ49sbV1VaL07J0/F3pC1UUZuX
         QeYzd/afAvTM563ZwUyEOo77JEGyHaeVavQW/VMa/81zC0x3zG99ZAUPekmvYchjL96V
         Ao1xOw+7UC/ZU3jc9GyvsiM1tuAAIj98T5djRMNFwkmwY+dETOC/eT39CVkF0hbqv2eT
         N+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=WBd8BsySW4GJzvjkLm/E7vPbmCXRbu0162joiaswdt8=;
        b=089MwAtQd6s0JODwjXsqzdrxX6mwD0YAkuLDJjyS3UeBGX+uBHldmouaaTL5Q8rQhq
         +mezvVCTYyT2mmdhEmDLGKVFGi3SV7SUrVzCGlQ1dKdPHPsDWj4tClmh1BnAaaR62nli
         Fg4LzBj7d/JsDZQwvVoWYMuU27hHMXDCE/Nim5vO8LMIx3gVS4sgzutxXe3jEWFNfhKR
         rhyPzRo9Xs3tMN2BYz3q+YLsWXiVPOMcbPvF0qTQypuCu4Ac0DguuKdyvHQxlsP/+rGQ
         G+nw7q5fyEqzmKWJZdi8FwbDb1vO4eRoQck0vnLpNjvFL1HQetfLcHQ0MKnDqe6HVcVv
         9E4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a05621421c500b0044133f5ea95si700314qvh.463.2022.04.01.02.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 02:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naD8c-0006Za-2C
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 05:00:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naD4B-0001PM-FA
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 04:55:36 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:51707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naD48-0003LI-GU
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 04:55:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 45D7C23BE4;
 Fri,  1 Apr 2022 08:55:27 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Apr
 2022 10:55:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005cea7ee92-5f38-4006-ab31-ff2b74208ca7,
 BF19997ACFFB9775C4837E30A1DE169AA6CF9E32) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0ddfa28a-45ae-fdfd-02a6-94ab5a34b724@kaod.org>
Date: Fri, 1 Apr 2022 10:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6f73f51a-3625-412f-9aa2-2795de66bf14
X-Ovh-Tracer-Id: 13690661395743345595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeefiedukefhueejteffvedthffhkeehhefhtdejkeefheeifeejvdfgfffgieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c7jzpXDS6xfm

Hello Jamin,

Thanks for these new models and machine. They are queued for QEMU 7.1.
There are a couple of patchsets adding support for the AST1030 GPIO
controller and the I2C new mode that would be good extensions but
they need review first.

What are the next steps? any plans for network ? The NIC should be a
FTGMAC100 if I am correct.

Thanks,

C.


  On 4/1/22 10:38, Jamin Lin wrote:
> Changes from v5:
> - remove TYPE_ASPEED_MINIBMC_MACHINE and ASPEED_MINIBMC_MACHINE
> - remove ast1030_machine_instance_init function
> 
> Changes from v4:
> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> 
> Changes from v3:
> - remove AspeedMiniBmcMachineState state structure and
>    AspeedMiniBmcMachineClass class
> - remove redundant new line in hw/arm/aspeed_ast10xx.c
> - drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag in hw/ssi/aspeed_smc.c
> 
> Changes from v2:
> - replace aspeed_ast1030.c with aspeed_ast10xx.c for minibmc SOCs family support
> - Add "ast1030-evb" machine in aspeed.c and removes aspeed_minibmc.c
> 
> Changes from v1:
> The patch series supports ADC, SCU, SMC, TIMER, and WDT for AST1030 SoC.
> Add avocado test case for "ast1030-evb" machine.
> 
> Test steps:
> 1. Download image from
>     https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
> 2. Extract the zip file to obtain zephyr.elf
> 3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
> 4. Test IO by Zephyr command line, commands are refer to Aspeed Zephyr
>     SDK User Guide below
>     https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/Aspeed_Zephy_SDK_User_Guide_v00.01.04.pdf
>     - ADC(channel 0):
>         uart:~$ adc ADC0 resolution 10
>         uart:~$ adc ADC0 calibrate 1
>         uart:~$ adc ADC0 read_format 1
>         uart:~$ adc ADC0 read 0
>         [Result]
>         read: 1416mv
> 
>     - SCU
>         uart:~$ md 7e6e2040
>         uart:~$ md 7e6e2080
>         uart:~$ md 7e6e20d0
>         uart:~$ md 7e6e2200
>         uart:~$ md 7e6e2300
>         uart:~$ md 7e6e25b0
>         [Result]
>         The register value should match the value of ast1030_a1_resets
>         in aspeed_scu.c
> 
>     - Flash(fmc_cs0):
>         uart:~$ flash write fmc_cs0 0 0x12345678 0x87654321 0x34127856 0x78563412
>         uart:~$ flash read fmc_cs0 0 10
>         [Result]
>         00000000: 78 56 34 12 21 43 65 87  56 78 12 34 12 34 56 78 |xV4.!Ce. Vx.4.4Vx|
> 
>         uart:~$ flash erase fmc_cs0 0
>         uart:~$ flash read fmc_cs0 0 10
>         [Result]
>         00000000: ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff |........ ........|
> 
>     - Timer(TIMER0):
>         uart:~$ timer start TIMER0 -p 2000 -t 0
>         TIMER0: period 20000 ms, type 0
>         [Result]
>         timer expired after 2 seconds
> 
>     - Watchdog(WDT1):
>         uart:~$ mw 7e785008 4755
>         uart:~$ mw 7e78500c 1
>         [Result]
>         soc reset after 22 seconds
> 
> Based-on: 20220315075753.8591-3-steven_lee@aspeedtech.com
> ([v2,2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute)
> 
> Jamin Lin (2):
>    aspeed: Add an AST1030 eval board
>    test/avocado/machine_aspeed.py: Add ast1030 test case
> 
> Steven Lee (7):
>    aspeed/adc: Add AST1030 support
>    aspeed/smc: Add AST1030 support
>    aspeed/wdt: Fix ast2500/ast2600 default reload value
>    aspeed/wdt: Add AST1030 support
>    aspeed/timer: Add AST1030 support
>    aspeed/scu: Add AST1030 support
>    aspeed/soc : Add AST1030 support
> 
>   hw/adc/aspeed_adc.c              |  16 ++
>   hw/arm/aspeed.c                  |  66 +++++++
>   hw/arm/aspeed_ast10xx.c          | 299 +++++++++++++++++++++++++++++++
>   hw/arm/meson.build               |   6 +-
>   hw/misc/aspeed_scu.c             |  63 +++++++
>   hw/ssi/aspeed_smc.c              | 157 ++++++++++++++++
>   hw/timer/aspeed_timer.c          |  17 ++
>   hw/watchdog/wdt_aspeed.c         |  34 +++-
>   include/hw/adc/aspeed_adc.h      |   1 +
>   include/hw/arm/aspeed_soc.h      |   3 +
>   include/hw/misc/aspeed_scu.h     |  25 +++
>   include/hw/timer/aspeed_timer.h  |   1 +
>   include/hw/watchdog/wdt_aspeed.h |   3 +
>   tests/avocado/machine_aspeed.py  |  36 ++++
>   14 files changed, 724 insertions(+), 3 deletions(-)
>   create mode 100644 hw/arm/aspeed_ast10xx.c
>   create mode 100644 tests/avocado/machine_aspeed.py
> 

