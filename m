Received: by 10.25.21.96 with SMTP id l93csp977199lfi;
        Wed, 6 Jul 2016 10:44:23 -0700 (PDT)
X-Received: by 10.200.53.142 with SMTP id k14mr38661303qtb.63.1467827063786;
        Wed, 06 Jul 2016 10:44:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f92si3038781qtb.112.2016.07.06.10.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jul 2016 10:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKqs3-0001Ov-34
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 13:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bKqrw-0001NJ-VL
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 13:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bKqrs-0003El-OV
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 13:44:16 -0400
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:33031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bKqrs-0003EO-GM; Wed, 06 Jul 2016 13:44:12 -0400
Received: by mail-lf0-x234.google.com with SMTP id f6so159440701lfg.0;
	Wed, 06 Jul 2016 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TbQD3I0jokdZvgKlsf2Bl8yZnjWky9RSWt/53ek0Xgk=;
	b=OX/rlVZaFBRh0u5Aa2rVq2eOMwgesfD+sviksj7lRt3Ck6wvhHaMFPxkHGfgtO5e5S
	2vyiGTKn28gkqZa1IwLoicsx9AM2PlQsEY/LWOjaUhp03SOmyulrIN2L6jgDnYD29oiu
	oz2BwpX1rd9L7qeoMW13+VlGmDxfaPNDNgixWnSoQGYfgTFReu6WIsQU9F1WM3+bPtLJ
	D/m8NjjdHlSMnJHyC8b2Gt5Q9jZeo+KhdI9S6Gznduj7Er5vyyLLk6BSWuKu+nNN/3Yd
	C7MlnLwXXCiv5tIaoPXEBqhUpe8ulFyDkuXW3SRm67uhL9+dPPRLIw55IFmVuJpKnBwl
	nCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TbQD3I0jokdZvgKlsf2Bl8yZnjWky9RSWt/53ek0Xgk=;
	b=DyPzwdrsV2EP3FTNZfvGdx/zWJZ+rcDEnPtZ0UkVRRqOyHzyjMl8od38wfwcafL5Ft
	pQquB3L0xx9eY1/J0tsF2jVftvpGkqMnH760KvvXndiv66Ll2e5yiJVFsDunF4y1Rd8I
	1pGuJ7VG5jJnRO1IB3WwSUdzcar1A8MTDooDUGT2AfBDnuP/CUoNfFTdI+ksD/ZEmpM2
	mUhYOpoqP9XGe2ZkemAyHIDm9obrDSwnpI/fVENB+y1s/bRWmOaye1bgYWndTrYqb53B
	md57xVmph1dU7drakjCRw+IVs5QxiMz8XLlKDhPcuuGaIu4tozZNzwzrFSQ+h2tPdtwx
	qv1g==
X-Gm-Message-State: ALyK8tLuVFHa1TdLnYU5e38HVth502JgT6vmnZwh4EUN0jazpjTAOMlbGoBUc3qH4aNxUQ==
X-Received: by 10.25.163.68 with SMTP id m65mr5411094lfe.144.1467827051360;
	Wed, 06 Jul 2016 10:44:11 -0700 (PDT)
Received: from [192.168.75.104] (31-178-123-4.dynamic.chello.pl.
	[31.178.123.4])
	by smtp.gmail.com with ESMTPSA id 25sm1783724lft.24.2016.07.06.10.44.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jul 2016 10:44:10 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<daf14775-cbd6-3f5d-a384-e50b1dc7830b@kaod.org>
	<f9b1192b-27ef-ae8f-947d-0a5151fbe26d@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <577D4369.1050408@gmail.com>
Date: Wed, 6 Jul 2016 19:44:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <f9b1192b-27ef-ae8f-947d-0a5151fbe26d@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::234
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
X-TUID: 0f4mnH+G/FxA



W dniu 06.07.2016 o 18:30, Cédric Le Goater pisze:
> On 07/04/2016 08:12 PM, Cédric Le Goater wrote:
>> On 07/04/2016 07:57 PM, mar.krzeminski wrote:
>>>
>>> W dniu 04.07.2016 o 14:18, Cédric Le Goater pisze:
>>>> Some SPI controllers, such as the Aspeed AST2400, have a mode in which
>>>> accesses to the flash content are no different than doing MMIOs. The
>>>> controller generates all the necessary commands to load (or store)
>>>> data in memory.
>>>>
>>>> To emulate such a behavior, we need to have access to the underlying
>>>> storage of the flash object. The purpose of the routine is to set the
>>>> storage of a preinitialized SPI flash object, which can then be used
>>>> by the object itself but also by a SPI controller to handled the
>>>> MMIOs.
>>> Hi,
>>>
>>> I am not sure if this approach is correct. I can not find any datasheet
>>> to this SPI controller, but as you mentioned in first paragraph, controller
>>> generates all commands (probably ones are somehow configurable).
>> yes. see this patch :
>>
>> 	http://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg08229.html
>>
>> 	/* CEx Control Register */
>> 	#define R_CTRL0           (0x10 / 4)
>> 	#define   CTRL_CMD_SHIFT           16
>> 	#define   CTRL_CMD_MASK            0xff
>>
>>
>>> In this series you hack this behaviour and you do direct access to file.
>> It is true it is not very respectful of the m25p80 interface.
>>
>>> IMHO you should emulate sending such commands in SPI controller
>>> model.
>> I will give it a try. I don't think the alternative is a complex
>> change anyhow.
> So yes, that would work out pretty well. But there is another need
> that does not show up in the series (I am not splitting the patches
> correctly I guess) We would like to boot directly from a flash image.
> For this purpose, the pflash_cfi object uses a memory region of type
> rom and uses the storage behind the region.
>
> m25p80_set_rom_storage() is probably not the right API to share the
> storage. I am looking for a way to handle this without changing too
> much m25p80, which does not have a mem region currently. Suggestions
> welcomed ! :)
I do not know if this is a good idea - for sure yet another complication,
but we still should process like the HW. The flash is memory mapped
to some memory area, so maybe creating alias to this memory area
would help with the implementation?
Then read will be still done by SPI and m25p80. Some configuration
from the board level might be needed to initialise the controller
(or maybe defaults are ok - depends how it is done in hw).

Regards,
Marcin
> Thanks,
>
> C.
>
>

