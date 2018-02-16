Received: by 10.28.71.27 with SMTP id u27csp327889wma;
        Thu, 15 Feb 2018 23:05:48 -0800 (PST)
X-Google-Smtp-Source: AH8x227jjgqd6BuRgV/2DMpPD0h7R8Oku0NDjxibnvaCqPpnscoiejpum5AAKvzeFyIIcsg3AEmS
X-Received: by 10.37.81.3 with SMTP id f3mr3753165ybb.99.1518764748178;
        Thu, 15 Feb 2018 23:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518764748; cv=none;
        d=google.com; s=arc-20160816;
        b=tjA6x1BT3PAldB0uJx5XbnfKrmxxZS3mkd759/jHpjkgmjOnD5hAqRGxA6e2Mw+Cxk
         /HNVk5y6QyXVE7BtCQ/gJPMoakg2m4GpUNCxXHBJ47JKldB85Q56q3upQJpIAo6AKj5R
         i0kmWMvfe/E4fSFVM5iNfPf4middXPiktCV88OuFs7wu8u4pVBDM1xaX7W67JwINGTzT
         VYUBoN50NrcpI8zenCM0/BZpUFpcD3lBWS/qmESwc2DW0nASwnTM7FnAv64phohPyov5
         UDEmPSgOZ6J2MNPTmIMBMj88B43IeJcYCFNn3vlW0F/9aQ6Fo/BJIR3/bEwS1SqBkRjD
         OCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lGevVU+1CKFs4ApqXnDv1fGsInWn8U7Ooec5xBkezVw=;
        b=lGMvCbsDrc1vu9FNi/kWKamRjpserYLh1QFU0OojTvOnEcOJMGKlYrhO7kz/OP9rhp
         mm/uoEXiAmsOragNLmjQfq6DUzFRJkZQpocbFg8tNKHzP6Kpio1gD2SXagSRw4ZFwWhd
         45dfnKDTmFyzJCsusHMikHAYiHSBtrQJKYWWjai+/prQxIDX9hKhYAYT9eDSS1zrHRWq
         WviEod2zIKrpypzhvmQ9etd+TsW8TJ/JJ/zFx/NrZlg1f99V7/ht+B5rb0fgsvWD1d2F
         dXVwTw/xFM6E0ImPoZgcs4RcJ9VOyC55exO9JBTrDLfVWZsotUcCeAeenlo6wXbOqHy8
         gjuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=E5PtZfkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si39240ybg.793.2018.02.15.23.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 23:05:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=E5PtZfkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ema5b-0006MH-ND
	for alex.bennee@linaro.org; Fri, 16 Feb 2018 02:05:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <penberg@iki.fi>) id 1ema4R-0005LV-5B
	for qemu-arm@nongnu.org; Fri, 16 Feb 2018 02:04:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <penberg@iki.fi>) id 1ema4N-0002PV-3M
	for qemu-arm@nongnu.org; Fri, 16 Feb 2018 02:04:35 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53885)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <penberg@iki.fi>)
	id 1ema4M-00023D-Tm; Fri, 16 Feb 2018 02:04:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A65E2088A;
	Fri, 16 Feb 2018 02:04:23 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 16 Feb 2018 02:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lGevVU
	+1CKFs4ApqXnDv1fGsInWn8U7Ooec5xBkezVw=; b=E5PtZfkbMOCCU8RZiBQaWi
	3X+G9w8STsAeDr3auwXwFyFLjD28i9PyihWrJb/XO+iWnrnZFiyCnV7nNz21bTMs
	MsnwLAcQdKooDkm4KvE8AFRxgNIJiaMXqQCl+E5zswmHGLS8DQJP8GstPniwgssD
	JDYW6nK2dUnCy0tHkjBtYg20vaYH/qNXneV1esK1Xj00TpKkvFv/njMDe551/D0Z
	+lxKMqzOncsCe1hnzK905OkKghE/R6rKVy+5CyFXt3QYXqHlyjIld8ymsk+BY9Bl
	b6dertbRawUpDnpDOWy+sQXl6vBwJG+fSTHys5UzxdU8bnlwHWn7ZdMQU85cPt0w
	==
X-ME-Sender: <xms:d4KGWl2olPmlq9a6G13FnpzoBq4EygNQqpYl1WXZzgHWoI2KTMF2Gw>
Received: from [192.168.0.40] (81-175-247-183.bb.dnainternet.fi
	[81.175.247.183])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8E7A0240DB;
	Fri, 16 Feb 2018 02:04:22 -0500 (EST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-2-penberg@iki.fi>
	<CAFEAcA8EWmaf5JWEmgBsNknTHuKDaHCnEAQgatn7Ppq-Gy8Fzg@mail.gmail.com>
From: Pekka Enberg <penberg@iki.fi>
Message-ID: <d7b4ff0d-d05f-0128-f403-d525a6e4176d@iki.fi>
Date: Fri, 16 Feb 2018 09:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8EWmaf5JWEmgBsNknTHuKDaHCnEAQgatn7Ppq-Gy8Fzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH v1 1/3] bcm2836: Make CPU type configurable
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qb3/cCkL0xu8



On 02/15/2018 01:48 PM, Peter Maydell wrote:
> On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
>> This patch adds a "cpu-type" property to BCM2836 SoC in preparation for
>> reusing the code for the Raspberry Pi 3, which has a different processor
>> model.
>>
>> Signed-off-by: Pekka Enberg <penberg@iki.fi>
> 
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -135,6 +135,8 @@ static void raspi2_init(MachineState *machine)
>>       /* Setup the SOC */
>>       object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
>>                                      &error_abort);
>> +    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
>> +                            &error_abort);
>>       object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>>                               &error_abort);
>>       object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
>> @@ -166,6 +168,7 @@ static void raspi2_machine_init(MachineClass *mc)
>>       mc->no_parallel = 1;
>>       mc->no_floppy = 1;
>>       mc->no_cdrom = 1;
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>       mc->max_cpus = BCM2836_NCPUS;
>>       mc->min_cpus = BCM2836_NCPUS;
>>       mc->default_cpus = BCM2836_NCPUS;
> 
> This change means that instead of ignoring the user's -cpu argument
> we'll now unconditionally accept it even if it's nonsense for this
> board. Neither behaviour is great. However, the patchset to allow
> boards to easily specify the valid set of CPU types is still in
> code review:
> https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg00308.html
> 
> so I'm happy to take this as-is, and we'll add the validity check
> when that patchset goes in.

I wondered about that too, but I applied the "monkey see, monkey do" 
approach to your review comments of the previous attempt. :-) But 
indeed, I also think we can fix this later in the tree.

- Pekka
