Received: by 10.223.172.38 with SMTP id v35csp3813609wrc;
        Mon, 18 Sep 2017 07:22:55 -0700 (PDT)
X-Received: by 10.55.160.88 with SMTP id j85mr20740277qke.113.1505744575131;
        Mon, 18 Sep 2017 07:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505744575; cv=none;
        d=google.com; s=arc-20160816;
        b=uoW07gVYhUMz++vtmJp0YKjapcSAzO0HhCOgBQpJdx48xQMorjksv8P75A8RpN8PGw
         sPYvssa+02fhBsQwbabQhnWB8lpharUjvz1Isys9hC9Zw9DWRcC0s0P7fKGSs7QXCWzS
         6tpac4eWE8HTQkQWpWv/z8tlDUiCRzGLmRA1n5CCkGq1Ibnvdu6GhlXnM8GeybEIs1IQ
         VAfIPfHGQHg0ZiXDqODM3J4KFZZgmaWbRy3NAlzVbaZLVPXLAmqKY5yrj3/4kuXSu4Tw
         iCb03JY24xaiI195gcnq+kzI90X4a7l9XXU7JQbXJ6kyEIj5Y1wUBi9KJVC3GIvSMhvN
         Q1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=+5SQ3oQokrXPQeydF3fwALTlT/r6sVFyhKoaqhYx/qU=;
        b=aUmyu4N+pad0QVq2D2850jH9tPAiR+nP39b50keUtaYAagqvYSJaBuVRC/rvwilWcG
         0tUC+5A5k+PBgrgcYiumlQlrTKzoDbMF8OwuFGNiHlDC7n6iXFsd9jev9EvvVMbQM101
         2bbANnUxWHMM3G5HUhmyjJypbV7k0N41pmDzmIfUp1g+tsK4qN0kLDVC2og5IGZ3TfcK
         bFEP7Dks1vIa0gl1iDBvTEes2hHdFe/iIn+6clxWLOACu3RrtlqTD3g2a+cKFbcEC84M
         dmwoI/v3uxw8eYWRNQVN5yTBljFPQQcUwGpdLS4np9iLO9QvLeiCY5Zmw0ERoiZdhyGm
         mjmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ouPYm9pb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si6997747qtd.360.2017.09.18.07.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 07:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ouPYm9pb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtwwm-0004cf-Q7
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 10:22:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtwwX-0004Xc-G1
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtwwS-0006Jb-HY
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:22:37 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:53852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtwwS-0006In-Co; Mon, 18 Sep 2017 10:22:32 -0400
Received: by mail-qt0-x231.google.com with SMTP id 47so680535qts.10;
	Mon, 18 Sep 2017 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+5SQ3oQokrXPQeydF3fwALTlT/r6sVFyhKoaqhYx/qU=;
	b=ouPYm9pbxeJV5aythEv11jXUD4afrW30d1+IaLay0SpLy7G2EdnfxfLev6Nh+Mb+Sr
	10OdMmam+utlzcew3QMYdRFoPhwuEtaMshp+wovvDBXHMeGwUtSNJgHiLjOUotwPm0w1
	P7qZTjS2nQqw4GhInYoeE1JyTvg/UBsiyicPrX0AFSCCu23shjpLlpbtxNQuiemT7Xva
	se0MGJZGBHiLEtYz/WRR9EDSrkooQK9FFq1L3GNdYeGE8pydJ3566ejqbzWFKGEreo3a
	Ff54dJciS9VUaA1HdEDkkVxZCBenKj1+Psk20U3tXE2/0FLCXwBqaVZfxlS9CE2LKjAM
	e1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+5SQ3oQokrXPQeydF3fwALTlT/r6sVFyhKoaqhYx/qU=;
	b=KV79OhMGVc210TWQurjtygek1Lxt2qOkp9m6lJwTUWGX1IxN9zuIGAaTZCcDgE+hsH
	s8AIlL05vEkw0wwe0X6kaB7G7XP1FufyHnxahiYIGJ6n55O6l5JUmZ+9dhndAa7AygAw
	AXj5Q0DELOjMCihbRxEwrPX6noikfqmJdw1/5kNRDaMF4XcK2/U96htGA5AuLrp57tYU
	jufVpaNP6CDzxSsnGzZRNgArDOD4qeeNO265RMgc1k/LNZTd6CicC+hsZb8AAB0ZbdHw
	OTpPE/mcd6DBofVy3yDzcrcPYzvClRhiu4DMkbMcwLX7xVmlqwkLthtgHD2019JVqKI0
	xtfQ==
X-Gm-Message-State: AHPjjUgVWlNINZWba+kE8WrtQXS/Pxu5hATueej4erwrzjcXF1/n0cOr
	fj9hRh8aOCAjQw==
X-Google-Smtp-Source: AOwi7QAljWX3q+/tpanOXIJH4juWw2R+IQzy+OzBsUG+Tc1OEmKndT8VwvM2JKAKQaojxfsj07+ExA==
X-Received: by 10.200.40.250 with SMTP id j55mr11480144qtj.169.1505744551709; 
	Mon, 18 Sep 2017 07:22:31 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	v32sm5342007qtc.66.2017.09.18.07.22.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 07:22:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
	<CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
	<CAFEAcA-BQ=ognSsb3Kxx5ThJ5Q_GA_sFFFofpKY1=XnRS4-WTA@mail.gmail.com>
	<6947945c-6b04-dce0-9010-b3350df0f151@amsat.org>
	<CAFEAcA8yHmZBgudTbW7S6eoObYE_O=CP3YjfL7g7GGip=wsjaA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1abcfaca-3af0-efcf-d577-c3c5cb39e8fe@amsat.org>
Date: Mon, 18 Sep 2017 11:22:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8yHmZBgudTbW7S6eoObYE_O=CP3YjfL7g7GGip=wsjaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	sundeep subbaraya <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +KD2i0ZZwp5a

On 09/18/2017 11:00 AM, Peter Maydell wrote:
> On 18 September 2017 at 14:58, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 09/18/2017 10:36 AM, Peter Maydell wrote:
>>>
>>> On 18 September 2017 at 14:27, sundeep subbaraya <sundeep.lkml@gmail.com>
>>> wrote:
>>>>>>
>>>>>> Hi Sundeep, Peter,
>>>>>>
>>>>>>
>>>>>> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>>>>>>>
>>>>>>>
>>>>>>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>>>>>> +                          uint64_t val, unsigned size)
>>>>>>> +{
>>>>>>> +    MSF2SysregState *s = opaque;
>>>>>>> +    uint32_t newval = val;
>>>>>>> +
>>>>>>> +    offset >>= 2;
>>>>>>> +
>>>>>>> +    switch (offset) {
>>>>>>> +    case MSSDDR_PLL_STATUS:
>>>>>>> +        trace_msf2_sysreg_write_pll_status();
>>>>>>> +        break;
>>>>>>> +
>>>>>>> +    case ESRAM_CR:
>>>>>>> +    case DDR_CR:
>>>>>>> +    case ENVM_REMAP_BASE_CR:
>>>>>>> +        if (newval != s->regs[offset]) {
>>>>>>> +            qemu_log_mask(LOG_UNIMP,
>>>>>>> +                       TYPE_MSF2_SYSREG": remapping not
>>>>>>> supported\n");
>>>>>>
>>>>>>
>>>>>>
>>>>>> I'd rather exit here than continue with inconsistent cpu, Peter what do
>>>>>> you recommend?
>>>>
>>>>
>>>>
>>>> Could you please suggest.
>>>
>>>
>>> We shouldn't exit QEMU for something the guest can provoke. If
>>> the functionality isn't implemented then just LOG_UNIMP it.
>>
>>
>> This was commented here:
>> http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg02971.html
>>
>> Guest remapping code is like non-return function. Hardware error here can
>> not happen, so there is no more guest code after a remap request.
>> Continuing running QEMU will lead to chaos, that's why I recommend aborting
>> instead of just LOG_UNIMP it.
> 
> There's lots of stuff that can cause the guest to go badly
> and confusingly wrong if unimplemented. If we print a
> useful message with LOG_UNIMP then there's an easy clue
> for what's gone wrong. The guest shouldn't be able to
> provoke QEMU to exit.

I understand. I'm worried about being PITA for an user to figure out 
what's happening here, that's why I'm wondering how this should be 
handled. Another idea I thought about was raising a PREFETCH or BKPT 
exception, but this would also be an incorrect model behavior.

Anyway I'd be happy enough if instead of using LOG_UNIMP/LOG_GUEST_ERROR 
we use an unconditional qemu_log("bus remap unimplemented, unpredictable 
behaviour!") warning. Fair enough?

Regards,

Phil.
