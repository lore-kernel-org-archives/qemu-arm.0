Received: by 10.25.21.96 with SMTP id l93csp1385698lfi;
        Thu, 7 Jul 2016 05:22:39 -0700 (PDT)
X-Received: by 10.13.234.16 with SMTP id t16mr18251490ywe.262.1467894158979;
        Thu, 07 Jul 2016 05:22:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n26si2652978qkl.8.2016.07.07.05.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jul 2016 05:22:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bL8KE-00052U-8f
	for alex.bennee@linaro.org; Thu, 07 Jul 2016 08:22:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bL8II-0001eI-4F
	for qemu-arm@nongnu.org; Thu, 07 Jul 2016 08:20:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bL8IE-00082E-5D
	for qemu-arm@nongnu.org; Thu, 07 Jul 2016 08:20:37 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bL8ID-00082A-EN; Thu, 07 Jul 2016 08:20:34 -0400
Received: by mail-lf0-x241.google.com with SMTP id w130so1292381lfd.2;
	Thu, 07 Jul 2016 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TBKNZ9eZxmy6+PA3yVqvF/QohnOVKjyDx1pvcFUiQuY=;
	b=hb3hEfRzloHWaUX5zOCeapfiSfdLwQco53hMtjqXURnpz5pbuKADRbPjHYCU2q1Q+P
	OFw3ESZl+dVom4hqP5+9WJ+H+4/NIawwVl1nFqwgQRbPsCpm1R5U+Cd7iDbarsxeoLZM
	ETQ1ctbgoh5GQWeR4ui+FOL5sFmaWbFSqrDqHstK5kasHx8bsvBYWuWAFS5WEsCb231p
	lkIGzC3+0rgDrcfz5OQEloTz410VAYYGbuGn2dRZ3upoNvbp4KRhobEqjTnzjHxg3bkZ
	u8Xzr7TWqzccXroyRhovOeeWmQM8/rqVRa8PiQa8k/qyubMblst6zWHDP30C26iB5S3Q
	kjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TBKNZ9eZxmy6+PA3yVqvF/QohnOVKjyDx1pvcFUiQuY=;
	b=RIiWfhYXvZu5iJHH4kbEZ84OrhPM3wTtcbsU5Dt9DyUTVdaI+jllIyxKvxyyCd0D5c
	PtSxUqaShKwxiulfgf52P16wV+XzelcR2yA/Wr7Ip6uzYGqsSs9ffOfwwjqmkOvbB2a3
	gnFpJzokcG5qaaJc0v8I/GxD6X8BO9TkU5m3UGfQiEtPuqPCkcjAw2UpXH6zWaRVaxJu
	udpoGncuB1lunI0JsZWIbYVP6rkQF4b3AQxfPqQIJWJMKrkicQ2hkROVZ6EqCbIljTGN
	MRDsxmk15YZZErR2UX4TTjY6Gb0YQHFseVHj7S7hUxAMa7ik3N7GX9GPlT+ffXP641qu
	pSKg==
X-Gm-Message-State: ALyK8tKO8PmmZf7dPA8d9INclKoFUmZWEhESvdMfyvoyrZBJ6S1vw8AYV10uaiDnQXQUmQ==
X-Received: by 10.25.81.17 with SMTP id f17mr5869100lfb.206.1467894028209;
	Thu, 07 Jul 2016 05:20:28 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	w192sm7398389lfd.44.2016.07.07.05.20.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 05:20:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
	<CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
	<121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
	<CAFEAcA-ZGbR2nz80n=QcxRTr=PN5EMQ-OrbncaAQnHMwmhPtZg@mail.gmail.com>
	<340f08ea-ee9b-1284-7e7f-17d33b314885@gmail.com>
	<CAFEAcA8sv7tLrp84dnVV=gWqn21DFEqHCiAkDzVOWrCOux=Tug@mail.gmail.com>
	<CAFEAcA_dbGMJm4OT62CKEQKaPf-sV818fwboy_GarXYeT973Ag@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6493a684-c571-c8d8-3b2f-f8da719a1b54@gmail.com>
Date: Thu, 7 Jul 2016 15:20:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_dbGMJm4OT62CKEQKaPf-sV818fwboy_GarXYeT973Ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v2] hw/ptimer: Don't wrap around counter for
 expired timer that uses tick handler
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cZDlG7+1nQXi

On 07.07.2016 13:53, Peter Maydell wrote:
> On 4 July 2016 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 1 July 2016 at 18:49, Dmitry Osipenko <digetx@gmail.com> wrote:
>>> On 01.07.2016 19:36, Peter Maydell wrote:
>>>> On 30 June 2016 at 20:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>> On 30.06.2016 18:02, Peter Maydell wrote:
>>>>>> What I meant was: ptimer_get_count() is typically called to generate
>>>>>> a value to return from a register. That's a separate thing, conceptually,
>>>>>> from whether the device happens to also trigger an interrupt on timer
>>>>>> expiry by passing a bh to ptimer_init(). So it's very odd for a detail
>>>>>> of interrupt-on-timer-expiry (that there is a bottom half) to affect
>>>>>> the value returned when you read the timer count register.
>>>>
>>>>> In order to handle wraparound correctly, software needs to track the moment of
>>>>> the wraparound - the interrupt. If software reads wrapped around counter value
>>>>> before IRQ triggered (ptimer expired), then it would assume that no wraparound
>>>>> happened and won't perform counter value correction, resulting in periodic
>>>>> counter "jumping" backwards.
>>>>
>>>> That just says you need particular behaviour between counter reads
>>>> and IRQ triggers; it doesn't say that you need the behaviour to be
>>>> different if the ptimer code doesn't know about the IRQ trigger.
>>>>
>>>
>>> Okay, I already explained the reason for having two different behaviours - to
>>> make polled counter value more distributed when possible. If I understand you
>>> correctly, you don't like it because it is "odd" and I agree that it's a bit clumsy.
>>
>>> So, what we are going to do now? Would you just revert the offending commit or
>>> you have some other suggestions?
>>
>> Well, we need to fix the regression, but basically I'm kind of
>> confused at the moment. I haven't invested a lot of time in
>> trying to understand the timer code, so all I can really do
>> is say "this does not look like the right thing" and ask you
>> to come up with a different fix for it.
> 

I'm currently leaning to the revert solution. Unfortunately, I haven't had a
chance to look at it yet, will do it today and send patch after.

> My current best guess is that this condition should simply be
> "if (expired) {".
> 

Since you are insisted that wraparound isn't a needed feature - yes, that's
nearly the same what the original code did :)

-- 
Dmitry
