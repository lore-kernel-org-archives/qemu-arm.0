Received: by 10.25.159.131 with SMTP id i125csp1608753lfe;
        Mon, 5 Dec 2016 07:33:50 -0800 (PST)
X-Received: by 10.55.120.6 with SMTP id t6mr49147507qkc.83.1480952030850;
        Mon, 05 Dec 2016 07:33:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p44si9129250qtb.209.2016.12.05.07.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 07:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDvH4-0004LF-6k
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 10:33:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDvGz-0004It-Ky
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 10:33:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDvGu-0002cZ-Lu
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 10:33:45 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cDvGu-0002bY-64; Mon, 05 Dec 2016 10:33:40 -0500
Received: by mail-lf0-x243.google.com with SMTP id p100so26042340lfg.2;
	Mon, 05 Dec 2016 07:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=jSIu3fOwEzJWtO0/g/MurQb9iKOalIG3M4DGkiI3P/I=;
	b=ANu98krd07ekgl++x2WepiZ8M7DDNp4hTRUwoSMepcm2F/hIE1l4QytsrJh2Bch13i
	snajjs1puXGtIjRlbanMb084l9DaSBZui6Whz4Q7BK/WShdcbtbpF6a+mwd4bMgwvJMx
	XvOfGM+uWCksWgSWq8y9KqFW3u/Ko0IN2FDFKWgidlti9cfXvEw8K6g+eMYLeH7GIQgN
	wgDOIicU06GPu7ap1g0G29kyuGnKD7Wa1y/713hbLHXoYfqKM9WN9DkekU5OSKlqaD/V
	V1vWGRSD71Hw6SslKfv487FpFGcN7IMx7X8NO6T3X8TYqo3pPTgzmlM7nq8M54h0FOVM
	4A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jSIu3fOwEzJWtO0/g/MurQb9iKOalIG3M4DGkiI3P/I=;
	b=YDdt+aRwYenQwQ+NVTmOO7U2V0QiTdvHc++54VCeiBzzN2dlkS0uix4aBDEqy5qCrz
	b5HLRQAK4NQdHIU2ZyQSzJ82II9F0O13UdvLYVOYhxOGZ1mb6jcpzXozsUisaqLQcMDn
	Ph/mn+qqkBrH3lhh87ypwvRcRvbPlX+uvedR0tC9u8E0wj2GFKypkKRi/eSa3shK6uIC
	8pdgH8gUNf8rXjWtCRbvkxsxFJchwrGSAfvURm/MpzCexg06Cvn1QSxUmRNR0/0SNyw3
	sUbS1hs9/0hey5Aq5P77XNlvKVZdDqebU2M8AAJO/PVN0dR/QzX/aFRjR9ft97Mj3af7
	rfBA==
X-Gm-Message-State: AKaTC01rZDBqTk2kB+veZsSbj1DggmP+yd1J8X06ZU+lBJ7ykCr86Wst1M1J/bG6pCt6Fg==
X-Received: by 10.25.20.37 with SMTP id k37mr4199639lfi.149.1480952018270;
	Mon, 05 Dec 2016 07:33:38 -0800 (PST)
Received: from [192.168.75.106] (89-78-94-50.dynamic.chello.pl. [89.78.94.50])
	by smtp.gmail.com with ESMTPSA id
	h35sm2979149lji.29.2016.12.05.07.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 07:33:37 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-18-git-send-email-clg@kaod.org>
	<0fa6e0f2-2965-cbdc-3d22-5a4c74fc6772@gmail.com>
	<27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <212a15c5-565c-434a-1387-250fa8f8f559@gmail.com>
Date: Mon, 5 Dec 2016 16:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org>
Content-Type: multipart/alternative;
	boundary="------------7FCCE440D2873BB6E7A8C7C9"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zv90wGj1udCD

This is a multi-part message in MIME format.
--------------7FCCE440D2873BB6E7A8C7C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



W dniu 05.12.2016 o 15:07, Cédric Le Goater pisze:
> On 12/04/2016 05:31 PM, mar.krzeminski wrote:
>> Hi Cedric,
>>
>> Since there is no public datasheet user guide for SMC I would ask some question
>> regarding HW itself because I got impression that you are implementing in this
>> model a part functionality that is done by Bootrom.
>>
>> W dniu 29.11.2016 o 16:43, Cédric Le Goater pisze:
>>> The Aspeed SMC controllers have a mode (Command mode) in which
>>> accesses to the flash content are no different than doing MMIOs. The
>>> controller generates all the necessary commands to load (or store)
>>> data in memory.
>>>
>>> However, accesses are restricted to the segment window assigned the
>>> the flash module by the controller. This window is defined by the
>>> Segment Address Register.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>   hw/ssi/aspeed_smc.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++++----
>>>   1 file changed, 162 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>>> index 72a44150b0a1..eec087199a22 100644
>>> --- a/hw/ssi/aspeed_smc.c
>>> +++ b/hw/ssi/aspeed_smc.c
>>> @@ -69,6 +69,7 @@
>>>   #define R_CTRL0           (0x10 / 4)
>>>   #define   CTRL_CMD_SHIFT           16
>>>   #define   CTRL_CMD_MASK            0xff
>>> +#define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
>>>   #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
>>>   #define   CTRL_CMD_MODE_MASK       0x3
>>>   #define     CTRL_READMODE          0x0
>>> @@ -135,6 +136,16 @@
>>>   #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
>>>   #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
>>>   
>>> +/* Flash opcodes. */
>>> +#define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
>>> +#define SPI_OP_WRDI       0x04    /* Write disable */
>>> +#define SPI_OP_RDSR       0x05    /* Read status register */
>>> +#define SPI_OP_WREN       0x06    /* Write enable */
>> Are you sure that the controller is aware af all above commands (especially WD/WE and RDS)?
> HW is aware of SPI_OP_READ which is the default command for the
> "normal" read mode. For other modes, fast and write, the command
> op is configured in the CEx Control Register.
>
> These ops are used in the model :
>
>   * SPI_OP_READ_FAST, for dummies
>   * SPI_OP_EN4B, might be useless if we expect software to send
>     this command before using this mode.
>   * SPI_OP_WREN, same comment.
>
> The rest I should remove as it is unused.
I think only SPI_OP_READ should stay in the model, rest goes to guest.
>
>>> +
>>> +/* Used for Macronix and Winbond flashes. */
>>> +#define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
>>> +#define SPI_OP_EX4B       0xe9    /* Exit 4-byte mode */
>>> +
>> Same as above but I think 4byte address mode bit changes onlu nymber of bytes
>> that is sent after instruction.
>>
>>>   /*
>>>    * Default segments mapping addresses and size for each slave per
>>>    * controller. These can be changed when board is initialized with the
>>> @@ -357,6 +368,98 @@ static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
>>>       return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
>>>   }
>>>   
>>> +static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +    int cmd = (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
>>> +
>>> +    /* This is the default value for read mode. In other modes, the
>>> +     * command should be defined */
>>> +    if (aspeed_smc_flash_mode(fl) == CTRL_READMODE) {
>>> +        cmd = SPI_OP_READ;
>>> +    }
>>> +
>>> +    if (!cmd) {
>> cmd == 0 => NOP command for some flash (eg. mx66l1g45g).
> So I should use another default value, OxFF ?
I believe this check is not needed at all because m25p80c will tell if 
it has
unsupported instruction and HW should accept all register values, isn't it?
>
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no command defined for mode %d\n",
>>> +                      __func__, aspeed_smc_flash_mode(fl));
>>> +    }
>>> +
>>> +    return cmd;
>>> +}
>>> +
>>> +static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +
>>> +    if (s->ctrl->segments == aspeed_segments_spi) {
>>> +        return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
>>> +    } else {
>>> +        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
>>> +    }
>>> +}
>>> +
>>> +static void aspeed_smc_flash_select(const AspeedSMCFlash *fl)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +
>>> +    s->regs[s->r_ctrl0 + fl->id] &= ~CTRL_CE_STOP_ACTIVE;
>>> +    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>>> +}
>>> +
>>> +static void aspeed_smc_flash_unselect(const AspeedSMCFlash *fl)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +
>>> +    s->regs[s->r_ctrl0 + fl->id] |= CTRL_CE_STOP_ACTIVE;
>>> +    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>>> +}
>>> +
>>> +static uint32_t aspeed_smc_check_segment_addr(AspeedSMCFlash *fl, uint32_t addr)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +    AspeedSegments seg;
>>> +
>>> +    aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
>>> +    if ((addr & (seg.size - 1)) != addr) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: invalid address 0x%08x for CS%d segment : "
>>> +                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
>>> +                      s->ctrl->name, addr, fl->id, seg.addr,
>>> +                      seg.addr + seg.size);
>>> +    }
>>> +
>>> +    addr &= seg.size - 1;
>>> +    return addr;
>>> +}
>>> +
>>> +static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +    uint8_t cmd = aspeed_smc_flash_cmd(fl);
>>> +
>>> +    /*
>>> +     * To be checked: I am not sure the Aspeed SPI controller needs to
>>> +     * enable writes when running in READ/FREAD command mode
>>> +     */
>>> +
>>> +    /* access can not exceed CS segment */
>>> +    addr = aspeed_smc_check_segment_addr(fl, addr);
>>> +
>>> +    /* TODO: do we have to send 4BYTE each time ? */
>> I am not aware of any flash that needs that, this  command should be send only once.
> yes. That is what I think also.
>
> it also means that a preliminary 4BYTE command should be
> sent before using that mode.
Generally there are two ways to access more than 16MiB in flash:
- 4byte address mode: all commands change to accept 4byte address, not 
supported by all flash devices.
- 4byte opcodes: different opcode is used to signal 4-byte long address 
(eg. 0x3 three bytes, 0x13 four).
Also not all flash support that. If the HW does not use any of those, 
ones should be removed from this model.

>
>> I also think that HW does not send this command (see above comment).
>>
>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>> +        ssi_transfer(s->spi, SPI_OP_EN4B);
>>> +    }
>>> +
>>> +    ssi_transfer(s->spi, cmd);
>>> +
>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>> +        ssi_transfer(s->spi, (addr >> 24) & 0xff);
>>> +    }
>>> +    ssi_transfer(s->spi, (addr >> 16) & 0xff);
>>> +    ssi_transfer(s->spi, (addr >> 8) & 0xff);
>>> +    ssi_transfer(s->spi, (addr & 0xff));
>>> +}
>>> +
>>>   static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>>>   {
>>>       AspeedSMCFlash *fl = opaque;
>>> @@ -364,19 +467,55 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>>>       uint64_t ret = 0;
>>>       int i;
>>>   
>>> -    if (aspeed_smc_is_usermode(fl)) {
>>> +    switch (aspeed_smc_flash_mode(fl)) {
>>> +    case CTRL_USERMODE:
>>>           for (i = 0; i < size; i++) {
>>>               ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>>           }
>>> -    } else {
>>> -        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
>>> -                      __func__);
>>> -        ret = -1;
>>> +        break;
>>> +    case CTRL_READMODE:
>>> +    case CTRL_FREADMODE:
>> CTRL_FREADMODE should not sent dummy bytes?
> yes it should. this is in a following patch.
Yes, I noticed that after sending this email :)

Thanks,
Marcin
>
> Thanks,
>
> C.
>
>> Thanks,
>> Marcin
>>> +        aspeed_smc_flash_select(fl);
>>> +        aspeed_smc_flash_setup_read(fl, addr);
>>> +
>>> +        for (i = 0; i < size; i++) {
>>> +            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>> +        }
>>> +
>>> +        aspeed_smc_flash_unselect(fl);
>>> +        break;
>>> +    default:
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
>>> +                      __func__, aspeed_smc_flash_mode(fl));
>>>       }
>>>   
>>>       return ret;
>>>   }
>>>   
>>> +static void aspeed_smc_flash_setup_write(AspeedSMCFlash *fl, uint32_t addr)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +    uint8_t cmd = aspeed_smc_flash_cmd(fl);
>>> +
>>> +    /* Flash access can not exceed CS segment */
>>> +    addr = aspeed_smc_check_segment_addr(fl, addr);
>>> +
>>> +    /* TODO: do we have to send 4BYTE each time ? */
>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>> +        ssi_transfer(s->spi, SPI_OP_EN4B);
>>> +    }
>>> +
>>> +    ssi_transfer(s->spi, SPI_OP_WREN);
>>> +    ssi_transfer(s->spi, cmd);
>>> +
>>> +    if (aspeed_smc_flash_is_4byte(fl)) {
>>> +        ssi_transfer(s->spi, (addr >> 24) & 0xff);
>>> +    }
>>> +    ssi_transfer(s->spi, (addr >> 16) & 0xff);
>>> +    ssi_transfer(s->spi, (addr >> 8) & 0xff);
>>> +    ssi_transfer(s->spi, (addr & 0xff));
>>> +}
>>> +
>>>   static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>>>                              unsigned size)
>>>   {
>>> @@ -390,14 +529,25 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>>>           return;
>>>       }
>>>   
>>> -    if (!aspeed_smc_is_usermode(fl)) {
>>> -        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
>>> -                      __func__);
>>> -        return;
>>> -    }
>>> +    switch (aspeed_smc_flash_mode(fl)) {
>>> +    case CTRL_USERMODE:
>>> +        for (i = 0; i < size; i++) {
>>> +            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>> +        }
>>> +        break;
>>> +    case CTRL_WRITEMODE:
>>> +        aspeed_smc_flash_select(fl);
>>> +        aspeed_smc_flash_setup_write(fl, addr);
>>> +
>>> +        for (i = 0; i < size; i++) {
>>> +            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>> +        }
>>>   
>>> -    for (i = 0; i < size; i++) {
>>> -        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>> +        aspeed_smc_flash_unselect(fl);
>>> +        break;
>>> +    default:
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
>>> +                      __func__, aspeed_smc_flash_mode(fl));
>>>       }
>>>   }
>>>   
>


--------------7FCCE440D2873BB6E7A8C7C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">W dniu 05.12.2016 o 15:07, Cédric Le
      Goater pisze:<br>
    </div>
    <blockquote cite="mid:27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org"
      type="cite">
      <pre wrap="">On 12/04/2016 05:31 PM, mar.krzeminski wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Cedric,

Since there is no public datasheet user guide for SMC I would ask some question
regarding HW itself because I got impression that you are implementing in this
model a part functionality that is done by Bootrom.

W dniu 29.11.2016 o 16:43, Cédric Le Goater pisze:
</pre>
        <blockquote type="cite">
          <pre wrap="">The Aspeed SMC controllers have a mode (Command mode) in which
accesses to the flash content are no different than doing MMIOs. The
controller generates all the necessary commands to load (or store)
data in memory.

However, accesses are restricted to the segment window assigned the
the flash module by the controller. This window is defined by the
Segment Address Register.

Signed-off-by: Cédric Le Goater <a class="moz-txt-link-rfc2396E" href="mailto:clg@kaod.org">&lt;clg@kaod.org&gt;</a>
Reviewed-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
---
 hw/ssi/aspeed_smc.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 162 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 72a44150b0a1..eec087199a22 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -69,6 +69,7 @@
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
+#define   CTRL_AST2400_SPI_4BYTE   (1 &lt;&lt; 13)
 #define   CTRL_CE_STOP_ACTIVE      (1 &lt;&lt; 2)
 #define   CTRL_CMD_MODE_MASK       0x3
 #define     CTRL_READMODE          0x0
@@ -135,6 +136,16 @@
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
 #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
 
+/* Flash opcodes. */
+#define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
+#define SPI_OP_WRDI       0x04    /* Write disable */
+#define SPI_OP_RDSR       0x05    /* Read status register */
+#define SPI_OP_WREN       0x06    /* Write enable */
</pre>
        </blockquote>
        <pre wrap="">Are you sure that the controller is aware af all above commands (especially WD/WE and RDS)?
</pre>
      </blockquote>
      <pre wrap="">
HW is aware of SPI_OP_READ which is the default command for the 
"normal" read mode. For other modes, fast and write, the command 
op is configured in the CEx Control Register. 

These ops are used in the model :

 * SPI_OP_READ_FAST, for dummies
 * SPI_OP_EN4B, might be useless if we expect software to send
   this command before using this mode.
 * SPI_OP_WREN, same comment.

The rest I should remove as it is unused.</pre>
    </blockquote>
    <font size="-1">I think only SPI_OP_READ should stay in the model,
      rest goes to guest.</font><br>
    <blockquote cite="mid:27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">+
+/* Used for Macronix and Winbond flashes. */
+#define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
+#define SPI_OP_EX4B       0xe9    /* Exit 4-byte mode */
+
</pre>
        </blockquote>
        <pre wrap="">Same as above but I think 4byte address mode bit changes onlu nymber of bytes
that is sent after instruction.

</pre>
        <blockquote type="cite">
          <pre wrap=""> /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
@@ -357,6 +368,98 @@ static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
     return s-&gt;regs[s-&gt;r_conf] &amp; (1 &lt;&lt; (s-&gt;conf_enable_w0 + fl-&gt;id));
 }
 
+static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+    int cmd = (s-&gt;regs[s-&gt;r_ctrl0 + fl-&gt;id] &gt;&gt; CTRL_CMD_SHIFT) &amp; CTRL_CMD_MASK;
+
+    /* This is the default value for read mode. In other modes, the
+     * command should be defined */
+    if (aspeed_smc_flash_mode(fl) == CTRL_READMODE) {
+        cmd = SPI_OP_READ;
+    }
+
+    if (!cmd) {
</pre>
        </blockquote>
        <pre wrap="">cmd == 0 =&gt; NOP command for some flash (eg. mx66l1g45g).
</pre>
      </blockquote>
      <pre wrap="">
So I should use another default value, OxFF ? </pre>
    </blockquote>
    <font size="-1">I believe this check is not needed at all because
      m25p80c will tell if it has<br>
      unsupported instruction and HW should accept all register values,
      isn't it?<br>
    </font>
    <blockquote cite="mid:27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no command defined for mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
+    }
+
+    return cmd;
+}
+
+static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+
+    if (s-&gt;ctrl-&gt;segments == aspeed_segments_spi) {
+        return s-&gt;regs[s-&gt;r_ctrl0] &amp; CTRL_AST2400_SPI_4BYTE;
+    } else {
+        return s-&gt;regs[s-&gt;r_ce_ctrl] &amp; (1 &lt;&lt; (CTRL_EXTENDED0 + fl-&gt;id));
+    }
+}
+
+static void aspeed_smc_flash_select(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+
+    s-&gt;regs[s-&gt;r_ctrl0 + fl-&gt;id] &amp;= ~CTRL_CE_STOP_ACTIVE;
+    qemu_set_irq(s-&gt;cs_lines[fl-&gt;id], aspeed_smc_is_ce_stop_active(fl));
+}
+
+static void aspeed_smc_flash_unselect(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+
+    s-&gt;regs[s-&gt;r_ctrl0 + fl-&gt;id] |= CTRL_CE_STOP_ACTIVE;
+    qemu_set_irq(s-&gt;cs_lines[fl-&gt;id], aspeed_smc_is_ce_stop_active(fl));
+}
+
+static uint32_t aspeed_smc_check_segment_addr(AspeedSMCFlash *fl, uint32_t addr)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+    AspeedSegments seg;
+
+    aspeed_smc_reg_to_segment(s-&gt;regs[R_SEG_ADDR0 + fl-&gt;id], &amp;seg);
+    if ((addr &amp; (seg.size - 1)) != addr) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid address 0x%08x for CS%d segment : "
+                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
+                      s-&gt;ctrl-&gt;name, addr, fl-&gt;id, seg.addr,
+                      seg.addr + seg.size);
+    }
+
+    addr &amp;= seg.size - 1;
+    return addr;
+}
+
+static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+    uint8_t cmd = aspeed_smc_flash_cmd(fl);
+
+    /*
+     * To be checked: I am not sure the Aspeed SPI controller needs to
+     * enable writes when running in READ/FREAD command mode
+     */
+
+    /* access can not exceed CS segment */
+    addr = aspeed_smc_check_segment_addr(fl, addr);
+
+    /* TODO: do we have to send 4BYTE each time ? */
</pre>
        </blockquote>
        <pre wrap="">I am not aware of any flash that needs that, this  command should be send only once.
</pre>
      </blockquote>
      <pre wrap="">
yes. That is what I think also.  

it also means that a preliminary 4BYTE command should be 
sent before using that mode.</pre>
    </blockquote>
    <font size="-1">Generally there are two ways to access more than
      16MiB in flash:<br>
      - 4byte address mode: all commands change to accept 4byte address,
      not supported by all flash devices.<br>
      - 4byte opcodes: different opcode is used to signal 4-byte long
      address (eg. 0x3 three bytes, 0x13 four).<br>
      Also not all flash support that. If the HW does not use any of
      those, ones should be removed from this model.<br>
      <br>
    </font>
    <blockquote cite="mid:27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">I also think that HW does not send this command (see above comment).

</pre>
        <blockquote type="cite">
          <pre wrap="">+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s-&gt;spi, SPI_OP_EN4B);
+    }
+
+    ssi_transfer(s-&gt;spi, cmd);
+
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s-&gt;spi, (addr &gt;&gt; 24) &amp; 0xff);
+    }
+    ssi_transfer(s-&gt;spi, (addr &gt;&gt; 16) &amp; 0xff);
+    ssi_transfer(s-&gt;spi, (addr &gt;&gt; 8) &amp; 0xff);
+    ssi_transfer(s-&gt;spi, (addr &amp; 0xff));
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSMCFlash *fl = opaque;
@@ -364,19 +467,55 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
     uint64_t ret = 0;
     int i;
 
-    if (aspeed_smc_is_usermode(fl)) {
+    switch (aspeed_smc_flash_mode(fl)) {
+    case CTRL_USERMODE:
         for (i = 0; i &lt; size; i++) {
             ret |= ssi_transfer(s-&gt;spi, 0x0) &lt;&lt; (8 * i);
         }
-    } else {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        ret = -1;
+        break;
+    case CTRL_READMODE:
+    case CTRL_FREADMODE:
</pre>
        </blockquote>
        <pre wrap="">CTRL_FREADMODE should not sent dummy bytes?
</pre>
      </blockquote>
      <pre wrap="">
yes it should. this is in a following patch.</pre>
    </blockquote>
    <font size="-1">Yes, I noticed that after sending this email :)<br>
      <br>
      Thanks,<br>
      Marcin<br>
    </font>
    <blockquote cite="mid:27bcad02-54fc-dbf9-f5f9-5b178ddb2ddd@kaod.org"
      type="cite">
      <pre wrap="">

Thanks,

C. 

</pre>
      <blockquote type="cite">
        <pre wrap="">
Thanks,
Marcin
</pre>
        <blockquote type="cite">
          <pre wrap="">+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup_read(fl, addr);
+
+        for (i = 0; i &lt; size; i++) {
+            ret |= ssi_transfer(s-&gt;spi, 0x0) &lt;&lt; (8 * i);
+        }
+
+        aspeed_smc_flash_unselect(fl);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
     }
 
     return ret;
 }
 
+static void aspeed_smc_flash_setup_write(AspeedSMCFlash *fl, uint32_t addr)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+    uint8_t cmd = aspeed_smc_flash_cmd(fl);
+
+    /* Flash access can not exceed CS segment */
+    addr = aspeed_smc_check_segment_addr(fl, addr);
+
+    /* TODO: do we have to send 4BYTE each time ? */
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s-&gt;spi, SPI_OP_EN4B);
+    }
+
+    ssi_transfer(s-&gt;spi, SPI_OP_WREN);
+    ssi_transfer(s-&gt;spi, cmd);
+
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s-&gt;spi, (addr &gt;&gt; 24) &amp; 0xff);
+    }
+    ssi_transfer(s-&gt;spi, (addr &gt;&gt; 16) &amp; 0xff);
+    ssi_transfer(s-&gt;spi, (addr &gt;&gt; 8) &amp; 0xff);
+    ssi_transfer(s-&gt;spi, (addr &amp; 0xff));
+}
+
 static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
                            unsigned size)
 {
@@ -390,14 +529,25 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
         return;
     }
 
-    if (!aspeed_smc_is_usermode(fl)) {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        return;
-    }
+    switch (aspeed_smc_flash_mode(fl)) {
+    case CTRL_USERMODE:
+        for (i = 0; i &lt; size; i++) {
+            ssi_transfer(s-&gt;spi, (data &gt;&gt; (8 * i)) &amp; 0xff);
+        }
+        break;
+    case CTRL_WRITEMODE:
+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup_write(fl, addr);
+
+        for (i = 0; i &lt; size; i++) {
+            ssi_transfer(s-&gt;spi, (data &gt;&gt; (8 * i)) &amp; 0xff);
+        }
 
-    for (i = 0; i &lt; size; i++) {
-        ssi_transfer(s-&gt;spi, (data &gt;&gt; (8 * i)) &amp; 0xff);
+        aspeed_smc_flash_unselect(fl);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
     }
 }
 
</pre>
        </blockquote>
        <pre wrap="">
</pre>
      </blockquote>
      <pre wrap="">

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7FCCE440D2873BB6E7A8C7C9--
