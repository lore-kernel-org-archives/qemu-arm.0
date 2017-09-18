Received: by 10.223.172.38 with SMTP id v35csp3793531wrc;
        Mon, 18 Sep 2017 07:05:46 -0700 (PDT)
X-Received: by 10.176.23.132 with SMTP id r4mr23968383uaf.121.1505743546596;
        Mon, 18 Sep 2017 07:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505743546; cv=none;
        d=google.com; s=arc-20160816;
        b=VhpVnvkMjK//uWfeE+Czf9EFxbQO2M/Nm23imzT9J/ZyadxUfhFtZ7Gr3uIWMs6FyD
         xBzl+vO8itRhyoku5HJZkAL+iliRbwnk+QApSHVBL3m6AY7+0Y/7SZsBNf3rw6B5+dcW
         /2nd/3VA8z/rF5wjyNV/0MIE4FctOfx0J8j7ftTAzgM0a2VkBQBE4Sg/OD2WOrW4cKEp
         5BIG3s16PHfLCRcXd34YaJ/fHExi5L+5WXanfDuFbhMc8LpSNyiKq2dL0ytXhk/PckM8
         w7JSw2iA6IoCBc1mbzCwNQnvsT0So+phZLGpGbDQL3H25xN3sfpx6Ja80fAUiIWOri68
         wEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=iCh9a/Hz2Ub6x+y/l6Y7NFlqI/vhMIBRgonfM6pCuYE=;
        b=eNmh8duOJAPbr424w7gqQZpp2cv9zdo6vH8/seT21oHc9jLvIyuUg0dnuPhxVwrGGw
         u2p5Xm26bL1GQfQqdE2A2pGYNvu7LrAeSJdZZRPZzwI33cACcu8qVf8ibSrcBmv3x9pN
         xBjT5woKITY6ET7joZ3nkTJycSJtzCUJL1cBsPwfnsSVDEnd3hAwnkuNlcwrvXw5HT+8
         XAn1sGxHfcp+BTBHYeaGhfG5IRgeiNMsqp5aE+LCroay1+gDRfXk/ZA/qHcbrDD9ACku
         xyPNXzEbyBQgE8RLSV2hzRqACFjHrZn9OqKWpcLO8kS4twDW47/J6Ai5hvfuCX2b3dbY
         36pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fw+Zo0ec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si2532149vkg.57.2017.09.18.07.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 07:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fw+Zo0ec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtwgC-0006wM-5X
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 10:05:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dtwbh-0002yf-SA
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:01:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dtwbg-0002BG-TY
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:01:05 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:48345)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dtwbg-0002B1-NW
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:01:04 -0400
Received: by mail-wm0-x230.google.com with SMTP id r68so2977582wmg.3
	for <qemu-arm@nongnu.org>; Mon, 18 Sep 2017 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iCh9a/Hz2Ub6x+y/l6Y7NFlqI/vhMIBRgonfM6pCuYE=;
	b=Fw+Zo0ecb4rbSwYFRC25F/C0CpVPIju8RYP+doKNN3F4AwR+aM//os1R/vB+6uD14z
	mSRhQzldooE5jwPXW2CEne22B65j6fnECMQqTkaB8jRMdW9Ps+U7zm0euKwKSlzBtP6a
	CpFaUOuz+UL36oDtL2bs03jSo7SX21OXSqqBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iCh9a/Hz2Ub6x+y/l6Y7NFlqI/vhMIBRgonfM6pCuYE=;
	b=GC31wP+u1S00n1Wc+yupI/O3MpnmnXevFA7xM6jHS/7QH9cDFcK50dE6A5oVBsER29
	nkFhtgfei+QtP+vtGigufLxbwXjRSrUFjeqmgrHOEg4BNUZXMxDhTO9q0zh6saIopXtI
	zSg3qUhai3bEw9MQa6eus8SvQjP1HXd2+RTZa80AOLV3oLni1NrIinO1YlFeuITaEBI2
	/HAT2PhBWiBByfQiU4H7nKIt4kRdMqo1JLgmB5OgaYEd71xRqXB5RgvHA49CwiPNTQ0V
	8bJ/E84mgrpQLlbGOMuQRbHnPvTFBA6zBUguRT7znvqPHvbsUgjVCmryPrLCKVvZsII7
	hA9w==
X-Gm-Message-State: AHPjjUjzL15Uh7rOuCX6EvzFWhSE1oicJt7Oxm7n6cKNtzC8y3ZyPsQn
	NM0kWoMx7z0dsk2Si103zAY4SnndD11dP5wPqPo3jw==
X-Google-Smtp-Source: AOwi7QD7gL6uIfcXaUiWNdjxdKWtxi0sL9oONHXRwx6t3+XjEDa/8HwzKC3mtpEQ1fk8YvoaV5aNmO+mkKfNeMZNQoE=
X-Received: by 10.28.102.213 with SMTP id a204mr8451644wmc.151.1505743263473; 
	Mon, 18 Sep 2017 07:01:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 18 Sep 2017 07:00:42 -0700 (PDT)
In-Reply-To: <6947945c-6b04-dce0-9010-b3350df0f151@amsat.org>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
	<CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
	<CAFEAcA-BQ=ognSsb3Kxx5ThJ5Q_GA_sFFFofpKY1=XnRS4-WTA@mail.gmail.com>
	<6947945c-6b04-dce0-9010-b3350df0f151@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2017 15:00:42 +0100
Message-ID: <CAFEAcA8yHmZBgudTbW7S6eoObYE_O=CP3YjfL7g7GGip=wsjaA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
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
X-TUID: j0t4iOx3y6I4

On 18 September 2017 at 14:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> Hi Peter,
>
> On 09/18/2017 10:36 AM, Peter Maydell wrote:
>>
>> On 18 September 2017 at 14:27, sundeep subbaraya <sundeep.lkml@gmail.com=
>
>> wrote:
>>>>>
>>>>> Hi Sundeep, Peter,
>>>>>
>>>>>
>>>>> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>>>>>>
>>>>>>
>>>>>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>>>>> +                          uint64_t val, unsigned size)
>>>>>> +{
>>>>>> +    MSF2SysregState *s =3D opaque;
>>>>>> +    uint32_t newval =3D val;
>>>>>> +
>>>>>> +    offset >>=3D 2;
>>>>>> +
>>>>>> +    switch (offset) {
>>>>>> +    case MSSDDR_PLL_STATUS:
>>>>>> +        trace_msf2_sysreg_write_pll_status();
>>>>>> +        break;
>>>>>> +
>>>>>> +    case ESRAM_CR:
>>>>>> +    case DDR_CR:
>>>>>> +    case ENVM_REMAP_BASE_CR:
>>>>>> +        if (newval !=3D s->regs[offset]) {
>>>>>> +            qemu_log_mask(LOG_UNIMP,
>>>>>> +                       TYPE_MSF2_SYSREG": remapping not
>>>>>> supported\n");
>>>>>
>>>>>
>>>>>
>>>>> I'd rather exit here than continue with inconsistent cpu, Peter what =
do
>>>>> you recommend?
>>>
>>>
>>>
>>> Could you please suggest.
>>
>>
>> We shouldn't exit QEMU for something the guest can provoke. If
>> the functionality isn't implemented then just LOG_UNIMP it.
>
>
> This was commented here:
> http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg02971.html
>
> Guest remapping code is like non-return function. Hardware error here can
> not happen, so there is no more guest code after a remap request.
> Continuing running QEMU will lead to chaos, that's why I recommend aborti=
ng
> instead of just LOG_UNIMP it.

There's lots of stuff that can cause the guest to go badly
and confusingly wrong if unimplemented. If we print a
useful message with LOG_UNIMP then there's an easy clue
for what's gone wrong. The guest shouldn't be able to
provoke QEMU to exit.

thanks
-- PMM
