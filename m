Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4224044lfc;
        Tue, 2 Jun 2020 09:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywfkWFJXdmm8hZdFqoYohWyzhW3qRhT7z6DsTSElr1baVfx6yPJPkCi4YfIKyLg25P/gaE
X-Received: by 2002:a25:bbd0:: with SMTP id c16mr23621583ybk.359.1591115337219;
        Tue, 02 Jun 2020 09:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591115337; cv=none;
        d=google.com; s=arc-20160816;
        b=gFLFwCUZYk1vumPzYQe3p5pyTwmRIc5HdfFuOTYAfS8ZdaSbsx4KXdR6qZdRc7KWvy
         4vgc1yfaTMxtgT1S5wl3cK+EP7fllB2xSacU2DuhX7QjJ+ZE/CUyr8aNsDGpbtrv/f+8
         rEJ8pMrmBRZ8uxvxQY5F2wcmfsVq0xWc/PwdgLYC9rMGLm+arX1shDfqXJBFuSkABXKZ
         celjWvaCHKuZXnvZHWXtJBGLxLIJFTPQoJAOj/79ShuirIaEMjBrHW/G55sbGLyluiGl
         Kp/aM0PFigkp7IlBhUKWR1+9NXWKFLs65ifcesh1D6htD3rnIW9CRJlnlsiMJ0TwiQN/
         sV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Nic/TohZC+zOEradPYV1j/FjWCkABcmTGlL1m8wyUfc=;
        b=wU+wjFLCCzUHyW3C1C9PvHwdQohKWYKlkRRXVBgtEHaiY1fJdnH0FwxakMeSj28E0i
         Il9gZU3n8gl97eSMlLZc7RmeVP8nZzYR4CRyo3GMGtgzMqmFadHd1IuO6Img89wyI3gl
         Xt50lu9be6yyNF1UlxZ1OqBVdEbjaHPmVRoYD/h1O3J6JKgeosdo3RMqBMebzehxVnNq
         npQ0ihqKTe92o2StoY/ryOQYBQPgTrHMdN3MT9xMGVpFRBdLysoM+HL0lJ0qSuD4aNW+
         EeWuWkBvNu+BZT+V6Dhd1sjBE/9KK9hXI+y5bGShlxXYqvFtKSQAeMhiYGo0kl4dae1J
         gnnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si2409985ybl.463.2020.06.02.09.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 09:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg9ma-0002p5-KV
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 12:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jg9m9-0002YD-Q5
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 12:28:29 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:37253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jg9m8-00008P-Ln
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 12:28:29 -0400
Received: from player758.ha.ovh.net (unknown [10.108.54.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 4967B13603B
 for <qemu-arm@nongnu.org>; Tue,  2 Jun 2020 18:28:18 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 2C03112FB74E0;
 Tue,  2 Jun 2020 16:28:11 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003bd1027cd-cf5f-4c14-b96a-2280f8de35ee,5E62BD569A294C88FEF25C709A17CDFB03A24EB6)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] docs/system: Document Aspeed boards
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200602135050.593692-1-clg@kaod.org>
 <a46437ce-1be4-3c0a-8403-1c279ad8b90b@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <80e5403f-a842-4542-41d3-d1d8236af637@kaod.org>
Date: Tue, 2 Jun 2020 18:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a46437ce-1be4-3c0a-8403-1c279ad8b90b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9088545526973958976
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvdefmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfevvdehieeftdevfeelleffgfehtdfgvdegteeijeetudejgedutdduudfhteeknecuffhomhgrihhnpehophgvnhhpohifvghrrdighiiinecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.61.149; envelope-from=clg@kaod.org;
 helo=7.mo177.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 12:28:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q53YPiss/coY

On 6/2/20 5:00 PM, Philippe Mathieu-Daudé wrote:
> On 6/2/20 3:50 PM, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  docs/system/arm/aspeed.rst | 85 ++++++++++++++++++++++++++++++++++++++
>>  docs/system/target-arm.rst |  1 +
>>  2 files changed, 86 insertions(+)
>>  create mode 100644 docs/system/arm/aspeed.rst
>>
>> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
>> new file mode 100644
>> index 000000000000..45f891eb3cad
>> --- /dev/null
>> +++ b/docs/system/arm/aspeed.rst
>> @@ -0,0 +1,85 @@
>> +Aspeed family boards (``*-bmc``, ``ast2500-evb``, ``ast2600-evb``)
>> +==================================================================
>> +
>> +The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
>> +Aspeed evaluation boards. They are based on different releases of the
>> +Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
>> +AST2500 with an ARM1176JZS CPU (800MHz) and more recently the AST2600
>> +with dual cores ARM Cortex A7 CPUs (1.2GHz).
>> +
>> +The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
>> +etc.
>> +
>> +AST2400 SoC based machines :
>> +
>> +- ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
>> +
>> +AST2500 SoC based machines :
>> +
>> +- ``ast2500-evb``          Aspeed AST2500 Evaluation board
>> +- ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
>> +- ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>> +- ``sonorapass-bmc``       OCP SonoraPass BMC
>> +- ``swift-bmc``            OpenPOWER Swift BMC POWER9
>> +
>> +AST2600 SoC based machines :
>> +
>> +- ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex A7)
>> +- ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>> +
>> +Supported devices
>> +-----------------
>> +
>> + * SMP (for the AST2600 Cortex-A7)
>> + * Interrupt Controller (VIC)
>> + * Timer Controller
>> + * RTC Controller
>> + * I2C Controller
>> + * System Control Unit (SCU)
>> + * SRAM mapping
>> + * X-DMA Controller (basic interface)
>> + * Static Memory Controller (SMC or FMC) - Only SPI Flash support
>> + * SPI Memory Controller
>> + * USB 2.0 Controller
>> + * SD/MMC storage controllers
>> + * SDRAM controller (dummy interface for basic settings and training)
>> + * Watchdog Controller
>> + * GPIO Controller (Master only)
>> + * UART
>> + * Ethernet controllers
>> +
>> +
>> +Missing devices
>> +---------------
>> +
>> + * Coprocessor support
>> + * ADC (out of tree implementation)
>> + * PWM and Fan Controller
>> + * LPC Bus Controller
>> + * Slave GPIO Controller
>> + * Super I/O Controller
> 
> Is there public datasheet for this?

Nope.

>> + * Hash/Crypto Engine
>> + * PCI-Express 1 Controller
>> + * Graphic Display Controller
>> + * PECI Controller
>> + * MCTP Controller
>> + * Mailbox Controller
>> + * Virtual UART
> 
> Uh what is that? :)

It is the host console. 

>> + * eSPI Controller
>> + * I3C Controller
>> +
>> +Boot options
>> +------------
>> +
>> +The Aspeed machines can be started using the -kernel option to load a
>> +Linux kernel or from a firmare image which can be downloaded from the
>> +OpenPOWER jenkins :
>> +
>> +   https://openpower.xyz/
>> +
>> +The image should be attached as an MTD drive. Run :
>> +
>> +.. code-block:: bash
>> +
>> +  $ qemu-system-arm -M romulus-bmc -nic user \
>> +	-drive file=flash-romulus,format=raw,if=mtd -nographic
>> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
>> index dce384cb0e3e..1bd477a2936c 100644
>> --- a/docs/system/target-arm.rst
>> +++ b/docs/system/target-arm.rst
>> @@ -81,6 +81,7 @@ undocumented; you can get a complete list by running
>>     arm/realview
>>     arm/versatile
>>     arm/vexpress
>> +   arm/aspeed
> 
> Maybe we should keep this section sorted.

They are, using the title in the file : "Aspeed family boards"

Thanks

C.
 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>>     arm/musicpal
>>     arm/nseries
>>     arm/orangepi
>>

