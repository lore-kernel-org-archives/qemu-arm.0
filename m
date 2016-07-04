Received: by 10.25.21.96 with SMTP id l93csp1436927lfi;
        Mon, 4 Jul 2016 02:57:23 -0700 (PDT)
X-Received: by 10.55.177.193 with SMTP id a184mr13854986qkf.121.1467626243562;
        Mon, 04 Jul 2016 02:57:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b63si2517915qke.125.2016.07.04.02.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 02:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK0d0-0003Kf-WC
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 05:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK0bB-0007mu-9p
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 05:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK0b9-0007qc-8d
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 05:55:28 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK0b9-0007qJ-4l
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 05:55:27 -0400
Received: by mail-vk0-x22f.google.com with SMTP id m127so165945294vkb.3
	for <qemu-arm@nongnu.org>; Mon, 04 Jul 2016 02:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3w+TSdLU/4IRbgIEogK0V0u6hEgvTRyRh4rkInnjZ6s=;
	b=MblcXvHcEtdUOK09tlNf1Kz6SMOKIB4uexpdodlofhkYG/BY+OMzcKczZ7X9TCrbA5
	u39pSAEzIUNTzuw20vUrMxe7KLuB8j1HHV/Pfg1DxBt9+Vfk1zLBGf8u72CA8PoTV31j
	HkYdj77ylf/uNYeKULMOZgMzTLx+G3mfTGlKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3w+TSdLU/4IRbgIEogK0V0u6hEgvTRyRh4rkInnjZ6s=;
	b=l80e5wd62+Dnv1QTSfPhYmI/UcYrFuBTY+0U8TVgaEgW4enQkS5ed7bxgq3tN4Vo+0
	uilOT9wIVJE/JgsmoywGY+bj0trMG7VKSs9gqvO7e1gGPzB3GGsnygU3Dsrz7430ScVc
	DT5lwTbZW+wxnS9ymIPes75buY0ThzjEXpsVBagSthVJLcaRuAJBislzCAPiN/MGTu/o
	GAWdFckANlF8g6X4bLZCOQoic1ZyoXZRMdsj4mybL77P2mnqElMKcb2Qovt5N9wRQznb
	w5TmUFGh2ks6dbeQgRB85pDwG2YkSyMvn1suD2iLUunNIch7DS5WtULzXVJ2HrIIIum2
	mEKA==
X-Gm-Message-State: ALyK8tK+aDexlWq9uX22xtsR7JIaGrJd4qaV8UhEsd9RrSSoteZ3bjeZUVxYznQ4MwI5/zNLT78307mU+MNa9WUy
X-Received: by 10.31.188.80 with SMTP id m77mr4734465vkf.30.1467626126600;
	Mon, 04 Jul 2016 02:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Mon, 4 Jul 2016 02:55:07 -0700 (PDT)
In-Reply-To: <340f08ea-ee9b-1284-7e7f-17d33b314885@gmail.com>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
	<CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
	<121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
	<CAFEAcA-ZGbR2nz80n=QcxRTr=PN5EMQ-OrbncaAQnHMwmhPtZg@mail.gmail.com>
	<340f08ea-ee9b-1284-7e7f-17d33b314885@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2016 10:55:07 +0100
Message-ID: <CAFEAcA8sv7tLrp84dnVV=gWqn21DFEqHCiAkDzVOWrCOux=Tug@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
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
X-TUID: eeVv6k2qRIkS

On 1 July 2016 at 18:49, Dmitry Osipenko <digetx@gmail.com> wrote:
> On 01.07.2016 19:36, Peter Maydell wrote:
>> On 30 June 2016 at 20:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>>> On 30.06.2016 18:02, Peter Maydell wrote:
>>>> What I meant was: ptimer_get_count() is typically called to generate
>>>> a value to return from a register. That's a separate thing, conceptually,
>>>> from whether the device happens to also trigger an interrupt on timer
>>>> expiry by passing a bh to ptimer_init(). So it's very odd for a detail
>>>> of interrupt-on-timer-expiry (that there is a bottom half) to affect
>>>> the value returned when you read the timer count register.
>>
>>> In order to handle wraparound correctly, software needs to track the moment of
>>> the wraparound - the interrupt. If software reads wrapped around counter value
>>> before IRQ triggered (ptimer expired), then it would assume that no wraparound
>>> happened and won't perform counter value correction, resulting in periodic
>>> counter "jumping" backwards.
>>
>> That just says you need particular behaviour between counter reads
>> and IRQ triggers; it doesn't say that you need the behaviour to be
>> different if the ptimer code doesn't know about the IRQ trigger.
>>
>
> Okay, I already explained the reason for having two different behaviours - to
> make polled counter value more distributed when possible. If I understand you
> correctly, you don't like it because it is "odd" and I agree that it's a bit clumsy.

> So, what we are going to do now? Would you just revert the offending commit or
> you have some other suggestions?

Well, we need to fix the regression, but basically I'm kind of
confused at the moment. I haven't invested a lot of time in
trying to understand the timer code, so all I can really do
is say "this does not look like the right thing" and ask you
to come up with a different fix for it.

thanks
-- PMM
