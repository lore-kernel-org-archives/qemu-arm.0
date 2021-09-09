Received: by 2002:a05:6214:32a:0:0:0:0 with SMTP id j10csp1667736qvu;
        Thu, 9 Sep 2021 03:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxithcd0lsfZ+ZkFigxW39oF/CGLlWYyPp+fwi518bNnOhtrr2eAbgA2l3540DAarovEplN
X-Received: by 2002:a6b:7106:: with SMTP id q6mr2092123iog.174.1631183234551;
        Thu, 09 Sep 2021 03:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631183234; cv=none;
        d=google.com; s=arc-20160816;
        b=e/E4emlBpR8IlUmjo1CAAOWP8Xon5AZJWLHo8wShuIyIjk36kUO6wePCHb9NkHVNZ3
         3fUUsY70+3lLc6SRnCKEAWXo1UOYT2wP6IDKvjvmZQAX9Um0ryJ/VxyFMFEMFh31OO0x
         BB/rMQCIZmwvL97n2E/CaewZ23+IKjgvPFAkQoKV7laUdEMJ/V6PIpHn+5q0Pw/L2103
         P4WTQJ7jkaVaQ9fRodhQVnTL+9xC3xCcwmC4byqO67sZ/GOHzBsjxBQBWwFIQdP+LIva
         VA37EluXDOnfn0a6EpVLIVMU94sz/WbvnOtT60J7gXJRTRqPi7is9uHS7ppu46+4P8xk
         AfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=BKTkn/NhoOYZeu89LbHdbIcwXKPPCSfGcJhfI9gV1eY=;
        b=dxzTzVyaw/oXthCj132bBdLVwgGcXzyJv9EWi0o7LpyuGdm7em/n9T3ZyxU6w9BosW
         9nesNI78zPYjLM8QZq8oCKTHbV3eYQVldrR2tCezR2hzXzdmmk3AW7+N1rJrHWrSkDKF
         b0wIj3ZgxXQPyMA/nxHkn1weGDpbu+qc0tPoWc4hSW1ISIZ4bOtjwFPjBx9s4BP9F+r9
         M+T9aM8ro2Cp8O6E87c54wbUgc/UDcv74AY0ijiBGP0Wu0Bw9X3MoBTT2L/qhej/IGPN
         ag2rFNMCcNVjakpJU/1r6zXVqlkYUrX65jxsVkIDwdI8vbUZJtputdtsKjKM5ZnNRRXc
         JALw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si1328875ile.158.2021.09.09.03.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 03:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOHGq-0005BZ-UE
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 06:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mOHFI-0004ZN-OZ; Thu, 09 Sep 2021 06:25:29 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mOHFF-0003xz-Cz; Thu, 09 Sep 2021 06:25:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 43C94BD19657;
 Thu,  9 Sep 2021 12:25:13 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 9 Sep
 2021 12:25:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002697dc3a4-e7d3-4a0a-bdca-640b2e9c6593,
 71690547EA7DDBCF94B8ED6B48C1704BA445499A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock
 selection registers
To: Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
References: <20210906134023.3711031-1-pdel@fb.com>
 <20210906134023.3711031-2-pdel@fb.com>
 <CACPK8XfyxtB2v8i4hprSgJZj3Tm9P8e7a456UKv=64gHZs-jiQ@mail.gmail.com>
 <033C6B44-2867-4C4E-B5D4-A482E0E56DC8@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8e42a790-3ed4-198c-d407-729518e167a8@kaod.org>
Date: Thu, 9 Sep 2021 12:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <033C6B44-2867-4C4E-B5D4-A482E0E56DC8@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5f3bb49e-618f-47bb-a952-c22ce4624a50
X-Ovh-Tracer-Id: 16215491937440795555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.922,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t5AqduBw9mou

On 9/7/21 3:37 PM, Peter Delevoryas wrote:
> 
> 
>> On Sep 7, 2021, at 1:24 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Mon, 6 Sept 2021 at 13:40, <pdel@fb.com> wrote:
>>>
>>> From: Peter Delevoryas <pdel@fb.com>
>>>
>>> UART5 is typically used as the default debug UART on the AST2600, but
>>> UART1 is also designed to be a debug UART. All the AST2600 UART's have
>>> semi-configurable clock rates through registers in the System Control
>>> Unit (SCU), but only UART5 works out of the box with zero-initialized
>>> values. The rest of the UART's expect a few of the registers to be
>>> initialized to non-zero values, or else the clock rate calculation will
>>> yield zero or undefined (due to a divide-by-zero).
>>>
>>> For reference, the U-Boot clock rate driver here shows the calculation:
>>>
>>>    https://github.com/facebook/openbmc-uboot/blob/15f7e0dc01d8/drivers/clk/aspeed/clk_ast2600.c#L357
>>>
>>> To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
>>> 13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
>>> "low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
>>> are configurable themselves:
>>>
>>>    UARTCLK = UXCLK * R / (N * 2)
>>>    HUARTCLK = HUXCLK * HR / (HN * 2)
>>>
>>> UXCLK and HUXCLK are also configurable, and depend on the APLL and/or
>>> HPLL clock rates, which also derive from complicated calculations. Long
>>> story short, there's lots of multiplication and division from
>>> configurable registers, and most of these registers are zero-initialized
>>> in QEMU, which at best is unexpected and at worst causes this clock rate
>>> driver to hang from divide-by-zero's. This can also be difficult to
>>> diagnose, because it may cause U-Boot to hang before serial console
>>> initialization completes, requiring intervention from gdb.
>>>
>>> This change just initializes all of these registers with default values
>>> from the datasheet.
>>>
>>> To test this, I used Facebook's AST2600 OpenBMC image for "fuji", with
>>> the following diff applied (because fuji uses UART1 for console output,
>>> not UART5).
>>>
>>>  @@ -323,8 +323,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>>       }
>>>
>>>      /* UART - attach an 8250 to the IO space as our UART5 */
>>>  -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>>>  -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>>>  +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART1], 2,
>>>  +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART1),
>>>                    38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>>
>>>       /* I2C */
>>>
>>> Without these clock rate registers being initialized, U-Boot hangs in
>>> the clock rate driver from a divide-by-zero, because the UART1 clock
>>> rate register reads return zero, and there's no console output. After
>>> initializing them with default values, fuji boots successfully.
>>>
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>> ---
>>> hw/misc/aspeed_scu.c | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>>> index 05edebedeb..a95dca65f2 100644
>>> --- a/hw/misc/aspeed_scu.c
>>> +++ b/hw/misc/aspeed_scu.c
>>> @@ -119,6 +119,8 @@
>>> #define AST2600_CLK_SEL3          TO_REG(0x308)
>>> #define AST2600_CLK_SEL4          TO_REG(0x310)
>>> #define AST2600_CLK_SEL5          TO_REG(0x314)
>>> +#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
>>> +#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)
>>
>> It would be consistent with the existing naming if we dropped the
>> _PARAM. Not worth re-spinning just for that though.
> 
> Yeah sorry about that, I wasn’t sure what name to use here. The
> datasheet names “Generate UARTCLK from UXCLK” and “Generate HUARTCLK
> from HUXCLK” seemed too long and didn’t match anything else. I thought
> these registers were kind of similar to the HPLL_PARAM register, just
> for UARTCLK and HUARTCLK. If there are any further revisions I can
> change it though.

I will fix that.

Thanks,

C. 

> 
>>
>>> #define AST2600_HW_STRAP1         TO_REG(0x500)
>>> #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>>> #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
>>> @@ -681,6 +683,8 @@ static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>>>     [AST2600_CLK_SEL3]          = 0x00000000,
>>>     [AST2600_CLK_SEL4]          = 0xF3F40000,
>>>     [AST2600_CLK_SEL5]          = 0x30000000,
>>> +    [AST2600_UARTCLK_PARAM]     = 0x00014506,
>>> +    [AST2600_HUARTCLK_PARAM]    = 0x000145C0,
>>
>> These match v9 of the datasheet, so they look good to me.
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks!
> Peter
> 
>>
>>>     [AST2600_CHIP_ID0]          = 0x1234ABCD,
>>>     [AST2600_CHIP_ID1]          = 0x88884444,
>>> };
>>> --
>>> 2.30.2
> 

