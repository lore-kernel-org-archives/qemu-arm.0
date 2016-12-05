Received: by 10.25.159.131 with SMTP id i125csp1597904lfe;
        Mon, 5 Dec 2016 07:12:38 -0800 (PST)
X-Received: by 10.200.39.43 with SMTP id g40mr57449889qtg.58.1480950758364;
        Mon, 05 Dec 2016 07:12:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si9084846qkl.151.2016.12.05.07.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 07:12:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDuwX-0005mt-J3
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 10:12:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDuwP-0005jy-Dn
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 10:12:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDuwM-0003dx-7r
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 10:12:29 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35906)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cDuwL-0003cV-QE; Mon, 05 Dec 2016 10:12:26 -0500
Received: by mail-lf0-x242.google.com with SMTP id o20so26009331lfg.3;
	Mon, 05 Dec 2016 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=60cjis+wdcbXkaAjKRuZ8jNRDc3K5TOLXd3Z3nz4EZg=;
	b=dL2Q2JawOdrEo1tPsiAJWn0yxkoSas1y2nSOuA8esMMbFitqYmMbj5M8d3NDtW2PI9
	nhSD0S8+685WhiApc0Xc3id3So388k1K6EHG0D+h4zuSl6dIYBzUXB+3o2YozEt2C3N9
	yB3VZwJPWB39f1A0nXg4TJkLlZg35/5zoCu0HClaMfhwIoN7Q+Os7DibR0BDJQlW/9WY
	gIkeoIKw6J3cIFmR9xFLy30rjLKoSpx8oy88G1HNppZAwgE1MY+Auvht6U5SUwXbtapv
	4SRosz6/4q4WBTtef0S5ZKtTIRHEgdVT/Q7/txg9cGSnJvXpVA689BgRLtfpCUL/Qia1
	cuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=60cjis+wdcbXkaAjKRuZ8jNRDc3K5TOLXd3Z3nz4EZg=;
	b=WsCa764m/fBfY7KP5hEyNqrPKg5jcfgNgGsbYmXNy4qJU4J+LqZ0ceZsioJ+Sz/2uS
	FASye8KTyQEd//ubwSpnHO31zpMNEPX1FkrMMKc+f0NLVIs+wfIK8p3OSOy/+NRo48Yd
	ii+y73B/j1iOThIa+WD6fbZi0xtDcmYlQkdPgXLm4bxJlenO8aAc+BGSHTyhlRITW7jg
	Pbg5Bg9eHYve9gGJSkES5Rhs5IjQttqFuLpSqUgorSX7Ainhm+7z2EWdpbL0Fdy7fqJP
	VMUbIGJfAIt36VbaicZN3N++HXS+wajhqytXtQ9lFls1E9GawyrNsP8aI6MsJbBocyof
	1d3Q==
X-Gm-Message-State: AKaTC01izHfbZO5f1UqDrW9s4HkVey3NultYTqO/tTHZmOm4ujJZzj8LgsA8MdIjjqp7Kw==
X-Received: by 10.25.141.147 with SMTP id p141mr1058387lfd.147.1480950744124; 
	Mon, 05 Dec 2016 07:12:24 -0800 (PST)
Received: from [192.168.75.106] (89-78-94-50.dynamic.chello.pl. [89.78.94.50])
	by smtp.gmail.com with ESMTPSA id
	v17sm2977624lja.43.2016.12.05.07.12.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 07:12:23 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-23-git-send-email-clg@kaod.org>
	<f3a5657c-39db-75a9-3bfc-25e5d03b7e1e@gmail.com>
	<09b0e4b9-faae-34aa-4042-aa3704c3457b@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <49894fce-5057-c17b-d511-f9806cea0917@gmail.com>
Date: Mon, 5 Dec 2016 16:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <09b0e4b9-faae-34aa-4042-aa3704c3457b@kaod.org>
Content-Type: multipart/alternative;
	boundary="------------F6761D90E7368C82AB9319A6"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9 22/30] aspeed/smc:
 handle dummy bytes when doing fast reads
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
X-TUID: /pk+mA/a8NqD

This is a multi-part message in MIME format.
--------------F6761D90E7368C82AB9319A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



W dniu 05.12.2016 o 15:14, Cédric Le Goater pisze:
> On 12/04/2016 05:46 PM, mar.krzeminski wrote:
>>
>> W dniu 29.11.2016 o 16:44, Cédric Le Goater pisze:
>>> When doing fast read, a certain amount of dummy bytes should be sent
>>> before the read. This number is configurable in the controler CE0
>>> Control Register and needs to be modeled using fake transfers the
>>> flash module.
>>>
>>> When the controller is configured for Command mode, the SPI command
>>> used to do the read is stored in the CE0 control register but, in User
>>> mode, we need to snoop into the flow of bytes to catch the command. It
>>> should be the first byte after CS select.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>   hw/ssi/aspeed_smc.c         | 58 ++++++++++++++++++++++++++++++++++++++-------
>>>   include/hw/ssi/aspeed_smc.h |  1 +
>>>   2 files changed, 51 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>>> index 9596ea94a3bc..733fd8b09c06 100644
>>> --- a/hw/ssi/aspeed_smc.c
>>> +++ b/hw/ssi/aspeed_smc.c
>>> @@ -71,7 +71,9 @@
>>>   #define R_CTRL0           (0x10 / 4)
>>>   #define   CTRL_CMD_SHIFT           16
>>>   #define   CTRL_CMD_MASK            0xff
>>> +#define   CTRL_DUMMY_HIGH_SHIFT    14
>>>   #define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
>>> +#define   CTRL_DUMMY_LOW_SHIFT     6 /* 2 bits [7:6] */
>>>   #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
>>>   #define   CTRL_CMD_MODE_MASK       0x3
>>>   #define     CTRL_READMODE          0x0
>>> @@ -151,6 +153,7 @@
>>>   #define SPI_OP_WRDI       0x04    /* Write disable */
>>>   #define SPI_OP_RDSR       0x05    /* Read status register */
>>>   #define SPI_OP_WREN       0x06    /* Write enable */
>>> +#define SPI_OP_READ_FAST  0x0b    /* Read data bytes (high frequency) */
>>>   
>>>   /* Used for Macronix and Winbond flashes. */
>>>   #define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
>>> @@ -510,6 +513,12 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
>>>       /* access can not exceed CS segment */
>>>       addr = aspeed_smc_check_segment_addr(fl, addr);
>>>   
>>> +    /*
>>> +     * Remember command as we might need to send dummy bytes before
>>> +     * reading data
>>> +     */
>>> +    fl->cmd = cmd;
>>> +
>>>       /* TODO: do we have to send 4BYTE each time ? */
>>>       if (aspeed_smc_flash_is_4byte(fl)) {
>>>           ssi_transfer(s->spi, SPI_OP_EN4B);
>>> @@ -525,27 +534,50 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
>>>       ssi_transfer(s->spi, (addr & 0xff));
>>>   }
>>>   
>>> +static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->id];
>>> +    uint32_t dummy_high = (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
>>> +    uint32_t dummy_low = (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
>>> +
>>> +    return ((dummy_high << 2) | dummy_low) * 8;
>>> +}
>>> +
>>> +static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned size)
>>> +{
>>> +    AspeedSMCState *s = fl->controller;
>>> +    uint64_t ret = 0;
>>> +    int i;
>>> +
>>> +    if (fl->cmd == SPI_OP_READ_FAST) {
>>> +        for (i = 0; i < aspeed_smc_flash_dummies(fl); i++) {
>>> +            ssi_transfer(s->spi, 0x0);
>>> +        }
>>> +    }
>> Generally this is wrong, controller should be not aware of any command in user mode.
>> Currently you are forced to do this by m25p80c dummy cycles implementation.
>> I had no time to improve this since it need to update in Xilinx models, but maybe it is good place to talk about the solution.
>> I was thinking to add to ssi function transferN, and use it in flash models.
>> Firs introduce new state for dummy cycles in m25p80 and then:
> This new state would depend on the command op ? fastread would put
> the object in a dummy_cycle state ?
Yes, only when needed (so it will be all fast reads in single/dual/quad 
modes).
>
>> a) in case caller use ssi_transfer(transfer8 in flsh models) dummy count will be incremented by 8.
>> This should solve the problem when flash is connected to controller that is not aware about dummy cycles,
>> like this mode or clear SPI controller.
>> b) when caller use ssi_trasferN length (in bits) will be the number of dummy cycles.
>>
>> What is your opinion?
> when you have some time, please send a quick rfc patch for the API :)
> so that I can experiment on the aspeed controller.
Will do, can not promise when, but target is 2.9 :)

Thanks,
Marcin
>
> Thanks,
>
> C.
>
>>> +    fl->cmd = 0;
>>> +
>>> +    for (i = 0; i < size; i++) {
>>> +        ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>>   static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>>>   {
>>>       AspeedSMCFlash *fl = opaque;
>>> -    const AspeedSMCState *s = fl->controller;
>>>       uint64_t ret = 0;
>>> -    int i;
>>>   
>>>       switch (aspeed_smc_flash_mode(fl)) {
>>>       case CTRL_USERMODE:
>>> -        for (i = 0; i < size; i++) {
>>> -            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>> -        }
>>> +        ret = aspeed_smc_flash_do_read(fl, size);
>>>           break;
>>>       case CTRL_READMODE:
>>>       case CTRL_FREADMODE:
>>>           aspeed_smc_flash_select(fl);
>>>           aspeed_smc_flash_setup_read(fl, addr);
>>>   
>>> -        for (i = 0; i < size; i++) {
>>> -            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>>> -        }
>>> +        ret = aspeed_smc_flash_do_read(fl, size);
>>>   
>>>           aspeed_smc_flash_unselect(fl);
>>>           break;
>>> @@ -596,6 +628,15 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>>>   
>>>       switch (aspeed_smc_flash_mode(fl)) {
>>>       case CTRL_USERMODE:
>>> +        /*
>>> +         * First write after chip select is the chip command. Remember
>>> +         * it as we might need to send dummy bytes before reading
>>> +         * data. It will be reseted when the chip is unselected.
>>> +         */
>>> +        if (!fl->cmd) {
>>> +            fl->cmd = data & 0xff;
>>> +        }
>>> +
>>>           for (i = 0; i < size; i++) {
>>>               ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>>           }
>>> @@ -629,6 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
>>>   static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
>>>   {
>>>       AspeedSMCState *s = fl->controller;
>>> +    fl->cmd = 0;
>>>       qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>>>   }
>>>   
>>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>>> index 88a904849801..3ae0a369073d 100644
>>> --- a/include/hw/ssi/aspeed_smc.h
>>> +++ b/include/hw/ssi/aspeed_smc.h
>>> @@ -52,6 +52,7 @@ typedef struct AspeedSMCFlash {
>>>   
>>>       uint8_t id;
>>>       uint32_t size;
>>> +    uint8_t cmd;
>>>   
>>>       MemoryRegion mmio;
>>>       DeviceState *flash;
>


--------------F6761D90E7368C82AB9319A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">W dniu 05.12.2016 o 15:14, Cédric Le
      Goater pisze:<br>
    </div>
    <blockquote cite="mid:09b0e4b9-faae-34aa-4042-aa3704c3457b@kaod.org"
      type="cite">
      <pre wrap="">On 12/04/2016 05:46 PM, mar.krzeminski wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">

W dniu 29.11.2016 o 16:44, Cédric Le Goater pisze:
</pre>
        <blockquote type="cite">
          <pre wrap="">When doing fast read, a certain amount of dummy bytes should be sent
before the read. This number is configurable in the controler CE0
Control Register and needs to be modeled using fake transfers the
flash module.

When the controller is configured for Command mode, the SPI command
used to do the read is stored in the CE0 control register but, in User
mode, we need to snoop into the flow of bytes to catch the command. It
should be the first byte after CS select.

Signed-off-by: Cédric Le Goater <a class="moz-txt-link-rfc2396E" href="mailto:clg@kaod.org">&lt;clg@kaod.org&gt;</a>
Reviewed-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
---
 hw/ssi/aspeed_smc.c         | 58 ++++++++++++++++++++++++++++++++++++++-------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9596ea94a3bc..733fd8b09c06 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -71,7 +71,9 @@
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
+#define   CTRL_DUMMY_HIGH_SHIFT    14
 #define   CTRL_AST2400_SPI_4BYTE   (1 &lt;&lt; 13)
+#define   CTRL_DUMMY_LOW_SHIFT     6 /* 2 bits [7:6] */
 #define   CTRL_CE_STOP_ACTIVE      (1 &lt;&lt; 2)
 #define   CTRL_CMD_MODE_MASK       0x3
 #define     CTRL_READMODE          0x0
@@ -151,6 +153,7 @@
 #define SPI_OP_WRDI       0x04    /* Write disable */
 #define SPI_OP_RDSR       0x05    /* Read status register */
 #define SPI_OP_WREN       0x06    /* Write enable */
+#define SPI_OP_READ_FAST  0x0b    /* Read data bytes (high frequency) */
 
 /* Used for Macronix and Winbond flashes. */
 #define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
@@ -510,6 +513,12 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
     /* access can not exceed CS segment */
     addr = aspeed_smc_check_segment_addr(fl, addr);
 
+    /*
+     * Remember command as we might need to send dummy bytes before
+     * reading data
+     */
+    fl-&gt;cmd = cmd;
+
     /* TODO: do we have to send 4BYTE each time ? */
     if (aspeed_smc_flash_is_4byte(fl)) {
         ssi_transfer(s-&gt;spi, SPI_OP_EN4B);
@@ -525,27 +534,50 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
     ssi_transfer(s-&gt;spi, (addr &amp; 0xff));
 }
 
+static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+    uint32_t r_ctrl0 = s-&gt;regs[s-&gt;r_ctrl0 + fl-&gt;id];
+    uint32_t dummy_high = (r_ctrl0 &gt;&gt; CTRL_DUMMY_HIGH_SHIFT) &amp; 0x1;
+    uint32_t dummy_low = (r_ctrl0 &gt;&gt; CTRL_DUMMY_LOW_SHIFT) &amp; 0x3;
+
+    return ((dummy_high &lt;&lt; 2) | dummy_low) * 8;
+}
+
+static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned size)
+{
+    AspeedSMCState *s = fl-&gt;controller;
+    uint64_t ret = 0;
+    int i;
+
+    if (fl-&gt;cmd == SPI_OP_READ_FAST) {
+        for (i = 0; i &lt; aspeed_smc_flash_dummies(fl); i++) {
+            ssi_transfer(s-&gt;spi, 0x0);
+        }
+    }
</pre>
        </blockquote>
        <pre wrap="">Generally this is wrong, controller should be not aware of any command in user mode.
Currently you are forced to do this by m25p80c dummy cycles implementation.
I had no time to improve this since it need to update in Xilinx models, but maybe it is good place to talk about the solution.
I was thinking to add to ssi function transferN, and use it in flash models.
Firs introduce new state for dummy cycles in m25p80 and then:
</pre>
      </blockquote>
      <pre wrap="">
This new state would depend on the command op ? fastread would put
the object in a dummy_cycle state ? </pre>
    </blockquote>
    <font size="-1">Yes, only when needed (so it will be all fast reads
      in single/dual/quad modes).</font><br>
    <blockquote cite="mid:09b0e4b9-faae-34aa-4042-aa3704c3457b@kaod.org"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">a) in case caller use ssi_transfer(transfer8 in flsh models) dummy count will be incremented by 8.
This should solve the problem when flash is connected to controller that is not aware about dummy cycles,
like this mode or clear SPI controller.
b) when caller use ssi_trasferN length (in bits) will be the number of dummy cycles.

What is your opinion?
</pre>
      </blockquote>
      <pre wrap="">
when you have some time, please send a quick rfc patch for the API :) 
so that I can experiment on the aspeed controller.</pre>
    </blockquote>
    <font size="-1">Will do, can not promise when, but target is 2.9 :)<br>
      <br>
      Thanks,<br>
      Marcin<br>
    </font>
    <blockquote cite="mid:09b0e4b9-faae-34aa-4042-aa3704c3457b@kaod.org"
      type="cite">
      <pre wrap="">

Thanks,

C. 

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">+    fl-&gt;cmd = 0;
+
+    for (i = 0; i &lt; size; i++) {
+        ret |= ssi_transfer(s-&gt;spi, 0x0) &lt;&lt; (8 * i);
+    }
+    return ret;
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSMCFlash *fl = opaque;
-    const AspeedSMCState *s = fl-&gt;controller;
     uint64_t ret = 0;
-    int i;
 
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
-        for (i = 0; i &lt; size; i++) {
-            ret |= ssi_transfer(s-&gt;spi, 0x0) &lt;&lt; (8 * i);
-        }
+        ret = aspeed_smc_flash_do_read(fl, size);
         break;
     case CTRL_READMODE:
     case CTRL_FREADMODE:
         aspeed_smc_flash_select(fl);
         aspeed_smc_flash_setup_read(fl, addr);
 
-        for (i = 0; i &lt; size; i++) {
-            ret |= ssi_transfer(s-&gt;spi, 0x0) &lt;&lt; (8 * i);
-        }
+        ret = aspeed_smc_flash_do_read(fl, size);
 
         aspeed_smc_flash_unselect(fl);
         break;
@@ -596,6 +628,15 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
 
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
+        /*
+         * First write after chip select is the chip command. Remember
+         * it as we might need to send dummy bytes before reading
+         * data. It will be reseted when the chip is unselected.
+         */
+        if (!fl-&gt;cmd) {
+            fl-&gt;cmd = data &amp; 0xff;
+        }
+
         for (i = 0; i &lt; size; i++) {
             ssi_transfer(s-&gt;spi, (data &gt;&gt; (8 * i)) &amp; 0xff);
         }
@@ -629,6 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
 static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
     AspeedSMCState *s = fl-&gt;controller;
+    fl-&gt;cmd = 0;
     qemu_set_irq(s-&gt;cs_lines[fl-&gt;id], aspeed_smc_is_ce_stop_active(fl));
 }
 
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 88a904849801..3ae0a369073d 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -52,6 +52,7 @@ typedef struct AspeedSMCFlash {
 
     uint8_t id;
     uint32_t size;
+    uint8_t cmd;
 
     MemoryRegion mmio;
     DeviceState *flash;
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

--------------F6761D90E7368C82AB9319A6--
