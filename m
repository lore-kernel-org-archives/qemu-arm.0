Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1182076lfq;
        Sat, 16 Jan 2021 07:21:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxluTZQHLdEwUvNUIOtGPjXDvfYTMjV4FSf2Z+f9UyyzpzTLNYUnKjWFbmzmVwM4+NoXVKY
X-Received: by 2002:a25:cc86:: with SMTP id l128mr17323500ybf.239.1610810514810;
        Sat, 16 Jan 2021 07:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610810514; cv=none;
        d=google.com; s=arc-20160816;
        b=fJMqzC1IpmrjaRuofP2YraLGuN7JL4mLtb7xoNdZataReNwQBFerup2Xi8wyjm3pGG
         Vq0gAcMv5ZlMrjjqKMtYVk5EY+1aXZDfG12Sln6OKPce6/frI8TKBhjFummzeA2gd4KJ
         lfwiPgb7ld3nMiWASueUlx36cRtluEL1Bhfm3koHO+46bI6r9o9oAGS/h5d3UITqw+ZU
         kW00W0afW1ys5+hWWxWBKUg3HXZsbOtlMB2GiYZXV3ScF63AHrcUW2EX8jfk6S0Fap9Y
         yj8dfHZ6nkAFh112w0piDCTGYtm1RANSOKCIJoxx3lPIzTrYNYAQ1xK0Fo7QgwnaSKhZ
         C8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AjEQHqFZK0FcaMs+bXU5E0skq7VdWBykRyB/SIX8kA4=;
        b=JhSOqn8nKu1Jyw7z2cZPP2x7JkyQH94VGAKmBW2SL/6mqFQmTJeZqDkYL8vkQp6Xbe
         88khk57I1o0pky6QRRYbCvpce1tXVoQpEj+e8u0CRj3EbOakqSPiSWD84vRyKj91M1/X
         h5R0P2yOPWFGJayL3qOR6tfjmyszMDLLcTNP/tntY5y3/EZj4TeT+lZ/naXlHDNQra7s
         Suxo/nINa0llNsZr0TDIHh59fTsZgNo0je4AEJqJ3us5LmkUueU6CZdh8GoTxNPv5jOj
         9/xKxCV3mUuHXQ6vRF14aXn95FZPx92jakvqgoZ+pNzHUZ+Ok7rre7QH6A6JQRwFbFur
         E0lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tS5Wr+qn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h64si10730188yba.361.2021.01.16.07.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Jan 2021 07:21:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tS5Wr+qn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0nOh-0008D6-82
	for alex.bennee@linaro.org; Sat, 16 Jan 2021 10:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0nOP-0008By-Cm; Sat, 16 Jan 2021 10:21:33 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0nON-0000XO-Rg; Sat, 16 Jan 2021 10:21:33 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q18so12221350wrn.1;
 Sat, 16 Jan 2021 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AjEQHqFZK0FcaMs+bXU5E0skq7VdWBykRyB/SIX8kA4=;
 b=tS5Wr+qnGFa9xT42RZxT21UgdmcIiVlVWWXwID8pDqIBA+LUNIhN6KP9T6f6UNMmmB
 o+TInL0jDaxxt9gbJQJoIaXRreyzhanJj3x0CfbDiargtYDkd7YCCeQUP5aBHPPoF4sz
 YfZNTIqHLT1WKiwVCRBE+kU9glRetAcBLfLOLkjiOEza0w/fiVdNglTMfbh/GbDyn3Dd
 XXt/BLh+clM3RAWG1PECY7WXWMwaGM5KeKinQmKCdLGKABkqUHHZrB8kkXqAPmvD+2S1
 0Iiahaa/V2DSsiIP/byd9Txrs7u0RUXeOc6nnN2o4qJWC5pyph2B4woP+E5hb7E3EjE7
 O5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AjEQHqFZK0FcaMs+bXU5E0skq7VdWBykRyB/SIX8kA4=;
 b=VKP4uqfOoL5eoLVwNgp5dojmpVCdAyH5fqGXo09k1itMAvvW2qdLxhj49i0qi7U6/y
 aDjoOOLctgpeU1kWf3ywlkpZZeZIYqm50BNdN4X5Oj7QGulQm2nOCEE23QFIZjJEm4a0
 144ZIVhT57b4xAoidcMGP1Bb0DSr8tKqIuIaULeC8yT8dF4rfwCvjAYOCVl4CzVg917i
 qezWXz8xE3x0zV6FAHpnAsuAwd6RdQe38D7pbFTA5IJkyI7ZnN6QbIOSaurma6ruFB5L
 o5OJ8s0r5hlwbkoZkfSA7wBu21PRjiZEhKk5kvPESLHWJme3/PsS9PZX78Hrxlj74+7w
 yveA==
X-Gm-Message-State: AOAM530e4PB6lIFhEB/sZWqAJCrgxsl97LYp0gU/N+6sDHi57Gwck1WK
 akSnHKv27Jx8cf6dgqVOQAw=
X-Received: by 2002:adf:8184:: with SMTP id 4mr18984362wra.63.1610810490111;
 Sat, 16 Jan 2021 07:21:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s13sm19965798wra.53.2021.01.16.07.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 07:21:29 -0800 (PST)
Subject: Re: [PATCH v7 5/9] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <20210115153049.3353008-6-f4bug@amsat.org>
 <CAEUhbmUXfm4JqqopEhq9-FQYJeY8Md7uwCczbSHm2H9oqERkJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7fcb40af-12a4-8926-b612-34d21988baf5@amsat.org>
Date: Sat, 16 Jan 2021 16:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUXfm4JqqopEhq9-FQYJeY8Md7uwCczbSHm2H9oqERkJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.039,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKCCeZd1m7bH

Hi Bin,

On 1/16/21 2:57 PM, Bin Meng wrote:
> On Fri, Jan 15, 2021 at 11:37 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When the block is disabled, only the ECSPI_CONREG register can
>> be modified. Setting the EN bit enabled the device, clearing it
> 
> I don't know how this conclusion came out. The manual only says the
> following 2 registers ignore the write when the block is disabled.
> 
> ECSPI_TXDATA, ECSPI_INTREG

21.4.5 Reset

  Whenever a device reset occurs, a reset is performed on the
  ECSPI, resetting all registers to their default values.

My understanding is it is pointless to update them when the
device is in reset, as they will get their default value when
going out of reset.

> 
>> "disables the block and resets the internal logic with the
>> exception of the ECSPI_CONREG" register.
>>
>> Move the imx_spi_is_enabled() check earlier.
>>
>> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/ssi/imx_spi.c | 26 ++++++++++++++++----------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>> index ba7d3438d87..f06bbf317e2 100644
>> --- a/hw/ssi/imx_spi.c
>> +++ b/hw/ssi/imx_spi.c
>> @@ -322,6 +322,21 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>      DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
>>              (uint32_t)value);
>>
>> +    if (!imx_spi_is_enabled(s)) {
>> +        /* Block is disabled */
>> +        if (index != ECSPI_CONREG) {
>> +            /* Ignore access */
>> +            return;
>> +        }
>> +        s->regs[ECSPI_CONREG] = value;

                                   [*]

>> +        if (!(value & ECSPI_CONREG_EN)) {
>> +            /* Keep disabled */
> 
> So other bits except ECSPI_CONREG_EN are discarded? The manual does
> not explicitly mention this but this looks suspicious.

See in [*], all bits from the register are updated. We simply check
ECSPI_CONREG_EN to see if we need to go out of reset.

See:

21.5 Initialization

  This section provides initialization information for ECSPI.

  To initialize the block:

  1. Clear the EN bit in ECSPI_CONREG to reset the block.
  2. Enable the clocks for ECSPI.
  3. Set the EN bit in ECSPI_CONREG to put ECSPI out of reset.
  4. Configure corresponding IOMUX for ECSPI external signals.
  5 Configure registers of ECSPI properly according to the
    specifications of the external SPI device.

And ECSPI_CONREG_EN bit description:

  SPI Block Enable Control. This bit enables the ECSPI. This bit
  must be set before writing to other registers or initiating an
  exchange. Writing zero to this bit disables the block and resets
  the internal logic with the exception of the ECSPI_CONREG. The
  block's internal clocks are gated off whenever the block is
  disabled.


I simply wanted to help you. I don't want to delay your work, so
if you think my approach is incorrect, suggest Peter to queue your
v5 or resend it (once riscv-next is merged) as v8.

Regards,

Phil.
