Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4163683wrq;
        Mon, 11 Jun 2018 08:11:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJmMRZsmJZrLbik/D6kvj9TR2cifT4/xVglJ0Cv6DRsItVjOKlgHwtwVtuXmy43G/eUTmHp
X-Received: by 2002:a0c:85e3:: with SMTP id o90-v6mr15444441qva.161.1528729907823;
        Mon, 11 Jun 2018 08:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528729907; cv=none;
        d=google.com; s=arc-20160816;
        b=Bk9XQ0cUZ2cyIi/hzEv4bXvQWr7yjmgsZy+ptdXMPj7WRbfoA90SjxiufBSqoNM1ew
         NbWwxUGsbEv58gc2EPlM8Bstzt5FLBgqopYK0cSIOaLTrJ8cdwCMEc/5+E52O2HzuLpl
         o0SnSWHafzoDTGv/ZwwE/mtM2ggHrV5e+g/soxG2x+TabHU9MwSJFYRbFw0/i6tfQxcc
         l7Mmae5MmA9cLTNAwDYfHULvaoYqxz/X8/gZ+NytgKcz4BKcc+AGHiiSL2WtUMDLkY8/
         Hl6qaMjrcWIInz1AtW6W0huwvK6nMtc4jTFQc/rAQoOCXF1GS7/cO7TAaoXbm1BoBL2P
         AIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/S1+ip4YngkDjGeTUCs3+0WkR2GCIC+ouV7e9N0FiIY=;
        b=ER1xlYSNGQdht/XHmABObmYKQ/sROQcGurPAZVpekT9LCaCAUPB55cEJYRKJd2kvkX
         s9tAuALRenNn8lv9zLL26aOUm4BpmMrc3EhlUsMCtXkyS3EhfBGEZXKrNmRASm9JtVX2
         5LhKPQJaqJMPbnch+55WoS/qJq9O5ab/ZpU+TdvSv+jeZQZvAWMrAg9Fgfous5ikrqep
         ATzvksHec8fESJ+hpTQC+PBm/drd/zweQItJixS9gexh1DDAuOj5fFN7vC1Sji/2LY05
         R6oUP9ZbRio8i6/cUhIdx5YqiEBN/i2e1fRcqE9SylF8fUPxOVgDqEXuTR8fks2RbaP1
         +XHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8pfOLVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d93-v6si12425512qkh.339.2018.06.11.08.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 08:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8pfOLVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSOTz-0002Gs-7r
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 11:11:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOTj-0002F8-H4
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOTi-0006xQ-8G
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:11:31 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34738)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOTb-0006tU-MH; Mon, 11 Jun 2018 11:11:23 -0400
Received: by mail-qt0-x241.google.com with SMTP id d3-v6so20574194qto.1;
	Mon, 11 Jun 2018 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/S1+ip4YngkDjGeTUCs3+0WkR2GCIC+ouV7e9N0FiIY=;
	b=j8pfOLVe3NCX5LTPR+nKZeg+ZN3SV6+AUwluqyCNglYOfWNNn89uOijzaCtpekHLJ0
	QSw9bU7+VDMAUxeYCGkGNmxYhaNWOT4NKrMnojyMlEATHvQqOdfrLL4VB1shPi7l5Sb7
	BBz4neFOVg4mFSZVgtV+6KZR+JP+/3ROr41sNEr2SVlY+lsY34QUV+GsbGw8B3K5aBYZ
	AzdvIG7M8zio19boe1oH+15HWinMKxcUKD2ce6xLFTUdrfvkyqhxsbSHBEOM5sw7GBdc
	QdDcWANGsyrQ1siMSTUqqUNIRdnvp8w9bXYO9jD6bjDEgPgPczkISHQU5v+rZeH1NrLy
	RlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/S1+ip4YngkDjGeTUCs3+0WkR2GCIC+ouV7e9N0FiIY=;
	b=FIb2BxI872n+c7Nhwn1q1NPug1/epbLakuBOgWYW6I4NL2Nvcz+XJCRvJ81s3rfIRU
	1h0nYpmPY9npP7JdKAaGaNNVFA1TKFSaR5fUyWVYlsLxMcv35qIKnQOuWw6M64WQJ+5P
	x6n9NmWd9+Az0UNy5wOBiGIJkYzy35PUb5uhlaGoWoxCYVZ1YkSG0/4nTcaRuRsiI5SY
	255cmzANH9x7ZrVC1PP5PF8sCy7lqwuYWh3iNqPivdYvoED/vy6L70ICCOnDUm6wboJv
	3ToKIkhaL00XPulOjiDR96QMZudWo64OMPtLtGcR693cmFjPBFNa0Vs0O11oC9GIFk9H
	eREA==
X-Gm-Message-State: APt69E0sb8NfZe5mRo7zQcDBYBpGLibawNpqcHu+RskQAbEutzGgisj7
	fDcuXcEf46k6Vgo0tQZqHKU=
X-Received: by 2002:a0c:bd9b:: with SMTP id
	n27-v6mr15435153qvg.187.1528729883194; 
	Mon, 11 Jun 2018 08:11:23 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x14-v6sm33008122qtk.33.2018.06.11.08.11.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 08:11:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180515171446.10834-1-peter.maydell@linaro.org>
	<CAFEAcA9TGnyeH8=f0xJ3sD9TtXQs_NbiJWBp9h6zsAz-UEOLrw@mail.gmail.com>
	<CAFEAcA8vS_uk7Yz+JgoHvHnwFjY-T7ShnOCiwO+QzikycQ_5yA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <723bbc56-558f-6c4d-327f-d6984aadd6c9@amsat.org>
Date: Mon, 11 Jun 2018 12:11:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vS_uk7Yz+JgoHvHnwFjY-T7ShnOCiwO+QzikycQ_5yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH] hw/arm/mps2-tz: Put ethernet controller
 behind PPC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KIKB5KzEg8Cw

On 06/11/2018 11:02 AM, Peter Maydell wrote:
> I guess nobody else is interested -- applying to target-arm.next.

Sorry I missed this. I'm not specially interested in this particular
board, but in hw/arm/mps2-tz.c which is the most up-to-date board
example we have in the codebase.

> 
> thanks
> -- PMM
> 
> On 29 May 2018 at 16:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Ping for review?
>>
>> thanks
>> -- PMM
>>
>>
>> On 15 May 2018 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The ethernet controller in the AN505 MPC FPGA image is behind
>>> the same AHB Peripheral Protection Controller that handles
>>> the graphics and GPIOs. (In the documentation this is clear
>>> in the block diagram but the ethernet controller was omitted
>>> from the table listing devices connected to the PPC.)
>>> The ethernet sits behind AHB PPCEXP0 interface 5. We had
>>> incorrectly claimed that this was a "gpio4", but there are
>>> only 4 GPIOs in this image.
>>>
>>> Correct the QEMU model to match the hardware.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> A minor nit that I didn't notice when I was modelling this.
>>>
>>> NB: I think the PSRAM is also supposed to be behind this
>>> interface of the PPC, but we definitely can't model that
>>> because our PPC implementation won't work for executing
>>> code from RAM that sits behind it.
>>>
>>>  hw/arm/mps2-tz.c | 32 +++++++++++++++++++++++---------
>>>  1 file changed, 23 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
>>> index 8dc8bfd4ab..c5ef95e4cc 100644
>>> --- a/hw/arm/mps2-tz.c
>>> +++ b/hw/arm/mps2-tz.c
>>> @@ -74,12 +74,13 @@ typedef struct {
>>>      UnimplementedDeviceState spi[5];
>>>      UnimplementedDeviceState i2c[4];
>>>      UnimplementedDeviceState i2s_audio;
>>> -    UnimplementedDeviceState gpio[5];
>>> +    UnimplementedDeviceState gpio[4];
>>>      UnimplementedDeviceState dma[4];
>>>      UnimplementedDeviceState gfx;
>>>      CMSDKAPBUART uart[5];
>>>      SplitIRQ sec_resp_splitter;
>>>      qemu_or_irq uart_irq_orgate;
>>> +    DeviceState *lan9118;
>>>  } MPS2TZMachineState;
>>>
>>>  #define TYPE_MPS2TZ_MACHINE "mps2tz"
>>> @@ -224,6 +225,26 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
>>>      return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
>>>  }
>>>
>>> +static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
>>> +                                  const char *name, hwaddr size)
>>> +{
>>> +    SysBusDevice *s;
>>> +    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
>>> +    NICInfo *nd = &nd_table[0];
>>> +
>>> +    /* In hardware this is a LAN9220; the LAN9118 is software compatible
>>> +     * except that it doesn't support the checksum-offload feature.
>>> +     */
>>> +    qemu_check_nic_model(nd, "lan9118");
>>> +    mms->lan9118 = qdev_create(NULL, "lan9118");
>>> +    qdev_set_nic_properties(mms->lan9118, nd);
>>> +    qdev_init_nofail(mms->lan9118);
>>> +
>>> +    s = SYS_BUS_DEVICE(mms->lan9118);
>>> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));

EXP_IRQ: "GPIOs to the NVIC's lines 32 and up."

So this is IRQ[48], Ethernet, correct.

>>> +    return sysbus_mmio_get_region(s, 0);
>>> +}
>>> +
>>>  static void mps2tz_common_init(MachineState *machine)
>>>  {
>>>      MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
>>> @@ -363,7 +384,7 @@ static void mps2tz_common_init(MachineState *machine)
>>>                  { "gpio1", make_unimp_dev, &mms->gpio[1], 0x40101000, 0x1000 },
>>>                  { "gpio2", make_unimp_dev, &mms->gpio[2], 0x40102000, 0x1000 },
>>>                  { "gpio3", make_unimp_dev, &mms->gpio[3], 0x40103000, 0x1000 },
>>> -                { "gpio4", make_unimp_dev, &mms->gpio[4], 0x40104000, 0x1000 },

4 GPIOs, correct.

>>> +                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000 },

Correct.

>>>              },
>>>          }, {
>>>              .name = "ahb_ppcexp1",
>>> @@ -447,13 +468,6 @@ static void mps2tz_common_init(MachineState *machine)
>>>                                                       "cfg_sec_resp", 0));
>>>      }
>>>
>>> -    /* In hardware this is a LAN9220; the LAN9118 is software compatible
>>> -     * except that it doesn't support the checksum-offload feature.
>>> -     * The ethernet controller is not behind a PPC.
>>> -     */
>>> -    lan9118_init(&nd_table[0], 0x42000000,
>>> -                 qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
>>> -
>>>      create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
>>>
>>>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
>>> --
>>> 2.17.0
> 

FWIW:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
