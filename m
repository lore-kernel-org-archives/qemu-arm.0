Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp904761wrg;
        Fri, 14 Jun 2019 05:38:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxqCrt2AFNIA+K7SP/3E1/cQHEZDS7Fgoup8Bnrh08NEXvwmgo85NVB87Z97zTDeT4/LOy
X-Received: by 2002:a0c:8069:: with SMTP id 96mr7805719qva.242.1560515939638;
        Fri, 14 Jun 2019 05:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560515939; cv=none;
        d=google.com; s=arc-20160816;
        b=QYV+5Z7TnCUokSWjhRi5PPEtiL8VTbo9gnyhokOyv8HWW5rlwRLFyOCHbqlCMXRA6c
         B42YQCZgDzDGS7p4gSDG3F1xAkt1u+YoiPLLTPgfz524ABr1gxmAYXmPm1jE7kLQVjTL
         LiGP9sVMT9/lk7hNgFZf1k91/h5LM/e2Ouz5YlNTrVCJkEIitp8gmkMR2cnjOt07cFgQ
         1SKW89ZoC4U+ChlCcGted8LOxm5Tpgy4uh6NYFpQdLKX1cFXFK2Fh+bYcWn3fxQH7IBY
         SEuvJWuoE8/JVbF4W42PznSJU4vdqck+Et4oPzxebMIiCWPXxbya1DR1FlXTsySEydqM
         Nr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=fEaF4clYgZn2kJ7fan+D0LaG00CiaqS56mBWRFxX80o=;
        b=HPIs7F7yv2Htf1V3saFiq20zxAFOl5rpD49xa4zXzrTQdW4Ly2Jv3uOj37xRTsTiWi
         zCiUe5ppgFVpfZlgJIh6yl3tzPsykr/iMkZYPbSv1rAz0bpP298vn21eBELeSfpfdzoC
         mc4k8dk6jSkLrlf0zQ8KND5OyFA5tyjmUfbfkqSX/xpxh9BDvveHff8gbMoifs7KGgFZ
         XZbXVxhTlq280sAJbNuwT3vK/0JJ1jPKKocFSn8wiucIJ9VpGGKsJ9TSo/nN9DaU7kxf
         gfz2af6aL30V8p0XgCe0d11dvNRAgWSJU/I5xKq9LcSKeRWyrCuwHzMCu4aECcTuJPVY
         CR3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si1428487qvs.80.2019.06.14.05.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 05:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hblTv-0005hB-6E
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 08:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58231)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hblQJ-0004BH-08
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 08:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hblQG-0004v6-UT
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 08:35:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hblQE-0004tV-Sf
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 08:35:11 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so2151350wmj.5
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 05:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fEaF4clYgZn2kJ7fan+D0LaG00CiaqS56mBWRFxX80o=;
 b=i0OKk/V1AG63Bx0+ej8uX9VNXCzhRiNKhrt/Kz0RiYBTxYH8y8IY6zUzRAgq2lrEIp
 KAjxhjyrbEjSZQ7nG4M35QHsQuknD+ZjiCmCHKhMoNR5QB8nWEw/8hf+B72yp5JMbb14
 av1RQuqRMHYalUcZEfY9Fv0NIG3zGU2MeNnL4+LRWNnwF2gTe9JGyAupN/bSNP6mwO4Z
 MIuolY6n/AX6t68j4MTdBV+SXYq9LNGuYEubXFbV33WVlHz7vk3xYh7YYdPomGsicZuS
 dBeGmfwVFfjLm4lwEKuyxNtk1MqVqZQj2rfpYT3UzKtzClAR1mpg/YkfcIIxsyv1zKds
 phkg==
X-Gm-Message-State: APjAAAVZfShNphKzTAwLw300ZSq/EApbx6qjpjSsjZEsnZgPgKsiVV8O
 zwVxbsDO5BuYNJbYjUZtQyxLVg==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr8497166wme.51.1560515709509; 
 Fri, 14 Jun 2019 05:35:09 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id t198sm3678080wmt.2.2019.06.14.05.35.08
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:35:08 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-19-clg@kaod.org>
 <f3b3948f-8d24-fb8c-0b65-8fe08019a077@redhat.com>
 <b4401eaf-9898-8c3e-3beb-f550edb83228@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1e2ae27f-d5e9-f2ca-ec35-2c536710a5ef@redhat.com>
Date: Fri, 14 Jun 2019 14:35:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b4401eaf-9898-8c3e-3beb-f550edb83228@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 18/19] aspeed/smc: inject errors
 in DMA checksum
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PI3oWt8B2vSg

Cc'ing Markus & Marc-André

On 6/14/19 2:02 PM, Cédric Le Goater wrote:
> On 13/06/2019 16:31, Philippe Mathieu-Daudé wrote:
>> Hi Cédric,
>>
>> On 5/25/19 5:12 PM, Cédric Le Goater wrote:
>>> Emulate read errors in the DMA Checksum Register for high frequencies
>>> and optimistic settings of the Read Timing Compensation Register. This
>>> will help in tuning the SPI timing calibration algorithm.
>>>
>>> The values below are those to expect from the first flash device of
>>> the FMC controller of a palmetto-bmc machine.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/ssi/aspeed_smc.c | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>>> index 406c30c60b3f..4c162912cf62 100644
>>> --- a/hw/ssi/aspeed_smc.c
>>> +++ b/hw/ssi/aspeed_smc.c
>>> @@ -866,6 +866,30 @@ static void aspeed_smc_dma_calibration(AspeedSMCState *s)
>>>      s->regs[s->r_ctrl0 + cs] |= CE_CTRL_CLOCK_FREQ(hclk_div);
>>>  }
>>>  
>>
>> Can you add a comment (like the patch description) here?
> 
> yes. done.
>  
>>> +static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
>>> +{
>>> +    uint8_t delay =
>>> +        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELAY_MASK;
>>> +    uint8_t hclk_mask =
>>> +        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_MASK;
>>> +
>>> +    /*
>>> +     * Typical values of a palmetto-bmc machine.
>>> +     */
>>> +    switch (aspeed_smc_hclk_divisor(hclk_mask)) {
>>> +    case 4 ... 16:
>>> +        return false;
>>> +    case 3: /* at least one HCLK cycle delay */
>>> +        return (delay & 0x7) < 1;
>>> +    case 2: /* at least two HCLK cycle delay */
>>> +        return (delay & 0x7) < 2;
>>> +    case 1: /* (> 100MHz) is above the max freq of the controller */
>>> +        return true;
>>> +    default:
>>> +        g_assert_not_reached();
>>> +    }
>>> +}
>>> +
>>>  /*
>>>   * Accumulate the result of the reads to provide a checksum that will
>>>   * be used to validate the read timing settings.
>>> @@ -903,6 +927,11 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
>>>          s->regs[R_DMA_FLASH_ADDR] += 4;
>>>          s->regs[R_DMA_LEN] -= 4;
>>>      }
>>> +
>>> +    if (aspeed_smc_inject_read_failure(s)) {
>>
>> So this model real world where noise eventually triggers errors. Don't
>> we want this to be enable by the user (or a QMP command)?
> 
> I can add a property at the device model level to trigger this behavior.
> Such as :
> 
>    -global driver=aspeed.smc,property=timing,value=true
> 
> timing if defined would provide the maximum clock and delay settings.

I was thinking of a simpler:

    -global driver=aspeed.smc,property=inject_failure,value=true

Then

    if (s->inject_failure && aspeed_smc_inject_read_failure(s)) {
        s->regs[R_DMA_CHECKSUM] = 0xbadc0de;
    }

> 
> Are there any other examples in QEMU ?

I think most of them are hidden in the codebase...

> 
> Thanks,
> 
> C.
> 
>>
>>> +        s->regs[R_DMA_CHECKSUM] = 0xbadc0de;
>>> +    }
>>> +
>>>  }
>>>  
>>>  static void aspeed_smc_dma_rw(AspeedSMCState *s)
>>>
> 
