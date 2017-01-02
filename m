Received: by 10.25.205.13 with SMTP id d13csp8508451lfg;
        Mon, 2 Jan 2017 10:22:18 -0800 (PST)
X-Received: by 10.237.32.205 with SMTP id 71mr59549305qtb.237.1483381338078;
        Mon, 02 Jan 2017 10:22:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r86si22559437qkr.189.2017.01.02.10.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 10:22:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO7FO-0003ku-TX
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 13:22:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cO7FI-0003kM-C6
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 13:22:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cO7FD-0006a2-CB
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 13:22:08 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cO7FD-0006Zy-04; Mon, 02 Jan 2017 13:22:03 -0500
Received: by mail-lf0-x244.google.com with SMTP id y21so40658588lfa.0;
	Mon, 02 Jan 2017 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=FX3uo+90DPsJirRPayUCDrzF7xrfh1A1UeNJTSWaTYE=;
	b=LlNZYuC/9/jE8Soxvd8fX6wqQDnp8T5xOov8NP6CsYcJbV4hXyaOnemhO2z39CcnXq
	S0Rxbs9s/SxbeqggjfxaOZ57CUmw9LfDTs9V/1R7pxAMTEqYrBYuHbwTLYuCr8zDWdzX
	iODnQtxwl/FQRsnsBUMRwdl2Al/5fXJ1r9zbSNdFiSOfjsS1sED5xcUTo4EWZyzlzoyH
	E+GViQ5xHRmLeyB0mczMEXSFM7pfWyAvk5v491XFzcAahIqDZ0HS87mppNTRGAK33mqq
	bLPp4Ij19VBAixx2WAavZA3YPFlJK+YmNtsVnkck3eqcSUQ4S3H7NcfZkuP1fwvmw6J8
	if3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FX3uo+90DPsJirRPayUCDrzF7xrfh1A1UeNJTSWaTYE=;
	b=kRu1heBe96Fil6r8ZSXVjjNoYCLO47dlaH9wy5ijWXVcE015NOmto8OD/AXUfjYQ37
	EXABgxvly+GvI3LlaKBd1fD9bkIAWm8MS4AvtXE2ZfJVA1L++hxqrN/oiFk9s1ovGEOG
	sDk8e1KjgPYGFP8+r+P1IjdBbu6hhjlS2Otnz09IqnB9U/B4YzP4cSBcwTX1P/UjY9g5
	CazkLZCLEn0Ogg2CWFqmgAQBgzflIY/bd92bI0R4aviu4uLhWiUNFjaT44bG0F9Ev3zE
	IEqbhPHWwfrDO7C8mHCKh0BzN6lHczS4uW0o4plICFChI737tW4KtCCoYvDNw+W8aLfD
	y3qQ==
X-Gm-Message-State: AIkVDXJFdVzQar1+g1pxvTyxGEZHDImuChxLPzegEBmWXDpgkuRnT5Nls8ugvt5H5TCeyQ==
X-Received: by 10.46.72.1 with SMTP id v1mr21543137lja.49.1483381321258;
	Mon, 02 Jan 2017 10:22:01 -0800 (PST)
Received: from [192.168.1.50] (staticline-31-183-20-7.toya.net.pl.
	[31.183.20.7]) by smtp.gmail.com with ESMTPSA id
	u126sm15947229lja.12.2017.01.02.10.22.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 10:22:00 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-18-git-send-email-clg@kaod.org>
	<0fa6e0f2-2965-cbdc-3d22-5a4c74fc6772@gmail.com>
	<27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org>
	<212a15c5-565c-434a-1387-250fa8f8f559@gmail.com>
	<9a5a321f-0d5e-d798-07c2-ad30c29d6a1d@kaod.org>
	<c6b1e60f-e0e9-f9a0-0e36-c82443191a6d@gmail.com>
	<d4b65172-e4f6-a379-11c7-0565479c2bdb@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <57a42c1f-132b-f6c9-bb16-de161e4ec33a@gmail.com>
Date: Mon, 2 Jan 2017 19:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <d4b65172-e4f6-a379-11c7-0565479c2bdb@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9 17/30] aspeed/smc:
 handle SPI flash Command mode
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CrwRitxXnDBk



W dniu 02.01.2017 o 19:02, Cédric Le Goater pisze:
> On 01/02/2017 06:33 PM, mar.krzeminski wrote:
>> Hello Cedric,
>>
>> W dniu 02.01.2017 o 16:56, Cédric Le Goater pisze:
>>> Hello Marcin,
>>>
>>> On 12/05/2016 04:33 PM, mar.krzeminski wrote:
>>>> W dniu 05.12.2016 o 15:07, Cédric Le Goater pisze:
>>>>> On 12/04/2016 05:31 PM, mar.krzeminski wrote:
>>>>>> Hi Cedric,
>>>>>>
>>>>>> Since there is no public datasheet user guide for SMC I would ask some question
>>>>>> regarding HW itself because I got impression that you are implementing in this
>>>>>> model a part functionality that is done by Bootrom.
>>>>>>
>>>>>> W dniu 29.11.2016 o 16:43, Cédric Le Goater pisze:
>>>>>>> The Aspeed SMC controllers have a mode (Command mode) in which
>>>>>>> accesses to the flash content are no different than doing MMIOs. The
>>>>>>> controller generates all the necessary commands to load (or store)
>>>>>>> data in memory.
>>>>>>>
>>>>>>> However, accesses are restricted to the segment window assigned the
>>>>>>> the flash module by the controller. This window is defined by the
>>>>>>> Segment Address Register.
>>>>>>>
>>>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>>>>>> ---
>>>>>>>    hw/ssi/aspeed_smc.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++++----
>>>>>>>    1 file changed, 162 insertions(+), 12 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>>>>>>> index 72a44150b0a1..eec087199a22 100644
>>>>>>> --- a/hw/ssi/aspeed_smc.c
>>>>>>> +++ b/hw/ssi/aspeed_smc.c
>>>>>>> @@ -69,6 +69,7 @@
>>>>>>>    #define R_CTRL0           (0x10 / 4)
>>>>>>>    #define   CTRL_CMD_SHIFT           16
>>>>>>>    #define   CTRL_CMD_MASK            0xff
>>>>>>> +#define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
>>>>>>>    #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
>>>>>>>    #define   CTRL_CMD_MODE_MASK       0x3
>>>>>>>    #define     CTRL_READMODE          0x0
>>>>>>> @@ -135,6 +136,16 @@
>>>>>>>    #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
>>>>>>>    #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
>>>>>>>    +/* Flash opcodes. */
>>>>>>> +#define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
>>>>>>> +#define SPI_OP_WRDI       0x04    /* Write disable */
>>>>>>> +#define SPI_OP_RDSR       0x05    /* Read status register */
>>>>>>> +#define SPI_OP_WREN       0x06    /* Write enable */
>>>>>> Are you sure that the controller is aware af all above commands (especially WD/WE and RDS)?
>>>>> HW is aware of SPI_OP_READ which is the default command for the
>>>>> "normal" read mode. For other modes, fast and write, the command
>>>>> op is configured in the CEx Control Register.
>>>>>
>>>>> These ops are used in the model :
>>>>>
>>>>>    * SPI_OP_READ_FAST, for dummies
>>>>>    * SPI_OP_EN4B, might be useless if we expect software to send
>>>>>      this command before using this mode.
>>>>>    * SPI_OP_WREN, same comment.
>>>>>
>>>>> The rest I should remove as it is unused.
>>>> I think only SPI_OP_READ should stay in the model, rest goes to guest.
>>> Well, we will need at least one 'EN4B' command to be sent for the qemu
>>> flash model to work. If the underlying m25p80 object does not know
>>> about the address width, the expected number of bytes will be wrong and
>>> the result bogus.
>> Hmm, most of the flash I know by default use 3byte address mode.
>> What flash are you connecting to model.
> chips like n25q256a, mx25l25635e, w25q256. all are > 32MB.
>
>> Do you have same on HW?
> No but it is difficult to know what the controller is doing
> in that mode without spying on the bus.

Maybe aspeed support can help?
Or some clue in the doc.
More generally have you tested this feature in real HW?
> Anyhow, after some experiments, I think you are right and
> I should  get rid of these command OP in the next version.
MHO it is possible that controller send WREN command,
but I would be really surprised if it send EN4B.
>
> What about the dummy cycles ? the linux driver now has
> support for it and it would be nice to get some support
> in qemu also.
Target is still 2.9, but I am quite loaded now. From the other hand,
in current Qemu you can have it working with easy update in the
feature. Just send byte every dummy clock.

Thanks,
Marcin
>
> Thanks,
>
> C.
>
>>> Same remark for the WREN, if the m25p80 object is not write enabled,
>>> modifying the flash content won't work.
>> Same as above.
>>
>> Thanks,
>> Marcin
>>> Thanks,
>>>
>>> C.
>>>
>>>>>>> +
>>>>>>> +/* Used for Macronix and Winbond flashes. */
>>>>>>> +#define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
>>>>>>> +#define SPI_OP_EX4B       0xe9    /* Exit 4-byte mode */
>>>>>>> +
>>>>>> Same as above but I think 4byte address mode bit changes onlu nymber of bytes
>>>>>> that is sent after instruction.
>>>>>>
>>>>>>>    /*
>>>>>>>     * Default segments mapping addresses and size for each slave per
>>>>>>>     * controller. These can be changed when board is initialized with the
>>>>>>> @@ -357,6 +368,98 @@ static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
>>>>>>>        return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
>>>>>>>    }
>>>>>>>    +static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +    int cmd = (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
>>>>>>> +
>>>>>>> +    /* This is the default value for read mode. In other modes, the
>>>>>>> +     * command should be defined */
>>>>>>> +    if (aspeed_smc_flash_mode(fl) == CTRL_READMODE) {
>>>>>>> +        cmd = SPI_OP_READ;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (!cmd) {
>>>>>> cmd == 0 => NOP command for some flash (eg. mx66l1g45g).
>>>>> So I should use another default value, OxFF ?
>>>> I believe this check is not needed at all because m25p80c will tell if it has
>>>> unsupported instruction and HW should accept all register values, isn't it?
>>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no command defined for mode %d\n",
>>>>>>> +                      __func__, aspeed_smc_flash_mode(fl));
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return cmd;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +
>>>>>>> +    if (s->ctrl->segments == aspeed_segments_spi) {
>>>>>>> +        return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
>>>>>>> +    } else {
>>>>>>> +        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void aspeed_smc_flash_select(const AspeedSMCFlash *fl)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +
>>>>>>> +    s->regs[s->r_ctrl0 + fl->id] &= ~CTRL_CE_STOP_ACTIVE;
>>>>>>> +    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void aspeed_smc_flash_unselect(const AspeedSMCFlash *fl)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +
>>>>>>> +    s->regs[s->r_ctrl0 + fl->id] |= CTRL_CE_STOP_ACTIVE;
>>>>>>> +    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>>>>>>> +}
>>>>>>> +
>>>>>>> +static uint32_t aspeed_smc_check_segment_addr(AspeedSMCFlash *fl, uint32_t addr)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +    AspeedSegments seg;
>>>>>>> +
>>>>>>> +    aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
>>>>>>> +    if ((addr & (seg.size - 1)) != addr) {
>>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>>>>> +                      "%s: invalid address 0x%08x for CS%d segment : "
>>>>>>> +                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
>>>>>>> +                      s->ctrl->name, addr, fl->id, seg.addr,
>>>>>>> +                      seg.addr + seg.size);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    addr &= seg.size - 1;
>>>>>>> +    return addr;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +    uint8_t cmd = aspeed_smc_flash_cmd(fl);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * To be checked: I am not sure the Aspeed SPI controller needs to
>>>>>>> +     * enable writes when running in READ/FREAD command mode
>>>>>>> +     */
>>>>>>> +
>>>>>>> +    /* access can not exceed CS segment */
>>>>>>> +    addr = aspeed_smc_check_segment_addr(fl, addr);
>>>>>>> +
>>>>>>> +    /* TODO: do we have to send 4BYTE each time ? */
>>>>>> I am not aware of any flash that needs that, this  command should be send only once.
>>>>> yes. That is what I think also.
>>>>>
>>>>> it also means that a preliminary 4BYTE command should be
>>>>> sent before using that mode.
>>>> Generally there are two ways to access more than 16MiB in flash:
>>>> - 4byte address mode: all commands change to accept 4byte address, not supported by all flash devices.
>>>> - 4byte opcodes: different opcode is used to signal 4-byte long address (eg. 0x3 three bytes, 0x13 four).
>>>> Also not all flash support that. If the HW does not use any of those, ones should be removed from this model.
>>>>
>>>>>> I also think that HW does not send this command (see above comment).
>>>>>>
>>>>>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>>>>>> +        ssi_transfer(s->spi, SPI_OP_EN4B);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    ssi_transfer(s->spi, cmd);
>>>>>>> +
>>>>>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>>>>>> +        ssi_transfer(s->spi, (addr >> 24) & 0xff);
>>>>>>> +    }
>>>>>>> +    ssi_transfer(s->spi, (addr >> 16) & 0xff);
>>>>>>> +    ssi_transfer(s->spi, (addr >> 8) & 0xff);
>>>>>>> +    ssi_transfer(s->spi, (addr & 0xff));
>>>>>>> +}
>>>>>>> +
>>>>>>>    static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>>>>>>>    {
>>>>>>>        AspeedSMCFlash *fl = opaque;
>>>>>>> @@ -364,19 +467,55 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>>>>>>>        uint64_t ret = 0;
>>>>>>>        int i;
>>>>>>>    -    if (aspeed_smc_is_usermode(fl)) {
>>>>>>> +    switch (aspeed_smc_flash_mode(fl)) {
>>>>>>> +    case CTRL_USERMODE:
>>>>>>>            for (i = 0; i < size; i++) {
>>>>>>>                ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>>>>>>            }
>>>>>>> -    } else {
>>>>>>> -        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
>>>>>>> -                      __func__);
>>>>>>> -        ret = -1;
>>>>>>> +        break;
>>>>>>> +    case CTRL_READMODE:
>>>>>>> +    case CTRL_FREADMODE:
>>>>>> CTRL_FREADMODE should not sent dummy bytes?
>>>>> yes it should. this is in a following patch.
>>>> Yes, I noticed that after sending this email :)
>>>>
>>>> Thanks,
>>>> Marcin
>>>>> Thanks,
>>>>>
>>>>> C.
>>>>>
>>>>>> Thanks,
>>>>>> Marcin
>>>>>>> +        aspeed_smc_flash_select(fl);
>>>>>>> +        aspeed_smc_flash_setup_read(fl, addr);
>>>>>>> +
>>>>>>> +        for (i = 0; i < size; i++) {
>>>>>>> +            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        aspeed_smc_flash_unselect(fl);
>>>>>>> +        break;
>>>>>>> +    default:
>>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
>>>>>>> +                      __func__, aspeed_smc_flash_mode(fl));
>>>>>>>        }
>>>>>>>          return ret;
>>>>>>>    }
>>>>>>>    +static void aspeed_smc_flash_setup_write(AspeedSMCFlash *fl, uint32_t addr)
>>>>>>> +{
>>>>>>> +    AspeedSMCState *s = fl->controller;
>>>>>>> +    uint8_t cmd = aspeed_smc_flash_cmd(fl);
>>>>>>> +
>>>>>>> +    /* Flash access can not exceed CS segment */
>>>>>>> +    addr = aspeed_smc_check_segment_addr(fl, addr);
>>>>>>> +
>>>>>>> +    /* TODO: do we have to send 4BYTE each time ? */
>>>>>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>>>>>> +        ssi_transfer(s->spi, SPI_OP_EN4B);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    ssi_transfer(s->spi, SPI_OP_WREN);
>>>>>>> +    ssi_transfer(s->spi, cmd);
>>>>>>> +
>>>>>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>>>>>> +        ssi_transfer(s->spi, (addr >> 24) & 0xff);
>>>>>>> +    }
>>>>>>> +    ssi_transfer(s->spi, (addr >> 16) & 0xff);
>>>>>>> +    ssi_transfer(s->spi, (addr >> 8) & 0xff);
>>>>>>> +    ssi_transfer(s->spi, (addr & 0xff));
>>>>>>> +}
>>>>>>> +
>>>>>>>    static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>>>>>>>                               unsigned size)
>>>>>>>    {
>>>>>>> @@ -390,14 +529,25 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>>>>>>>            return;
>>>>>>>        }
>>>>>>>    -    if (!aspeed_smc_is_usermode(fl)) {
>>>>>>> -        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
>>>>>>> -                      __func__);
>>>>>>> -        return;
>>>>>>> -    }
>>>>>>> +    switch (aspeed_smc_flash_mode(fl)) {
>>>>>>> +    case CTRL_USERMODE:
>>>>>>> +        for (i = 0; i < size; i++) {
>>>>>>> +            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>>>>>> +        }
>>>>>>> +        break;
>>>>>>> +    case CTRL_WRITEMODE:
>>>>>>> +        aspeed_smc_flash_select(fl);
>>>>>>> +        aspeed_smc_flash_setup_write(fl, addr);
>>>>>>> +
>>>>>>> +        for (i = 0; i < size; i++) {
>>>>>>> +            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>>>>>> +        }
>>>>>>>    -    for (i = 0; i < size; i++) {
>>>>>>> -        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>>>>>> +        aspeed_smc_flash_unselect(fl);
>>>>>>> +        break;
>>>>>>> +    default:
>>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
>>>>>>> +                      __func__, aspeed_smc_flash_mode(fl));
>>>>>>>        }
>>>>>>>    }
>>>>>>>    
>

