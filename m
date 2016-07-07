Received: by 10.25.21.96 with SMTP id l93csp1343178lfi;
        Thu, 7 Jul 2016 03:54:44 -0700 (PDT)
X-Received: by 10.233.237.203 with SMTP id c194mr34225647qkg.126.1467888884036;
        Thu, 07 Jul 2016 03:54:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i91si2202241qtd.125.2016.07.07.03.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jul 2016 03:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bL6x9-0004Nn-Ef
	for alex.bennee@linaro.org; Thu, 07 Jul 2016 06:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bL6w9-0003ll-IN
	for qemu-arm@nongnu.org; Thu, 07 Jul 2016 06:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bL6w8-0005Ax-La
	for qemu-arm@nongnu.org; Thu, 07 Jul 2016 06:53:41 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bL6w8-0005Ap-39
	for qemu-arm@nongnu.org; Thu, 07 Jul 2016 06:53:40 -0400
Received: by mail-vk0-x231.google.com with SMTP id v6so15086656vkb.2
	for <qemu-arm@nongnu.org>; Thu, 07 Jul 2016 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zMpwg9TvNB5nu4rogdsfC5yCinf3cRq8CKfkqSYcW+E=;
	b=X1CkyAlI8HJHR3VdHG0e4EhlqXYPNlufZt/L1OVDUtucCc85esWSnpT0l7Xeav7X0E
	yptv49wfdfhnkcbedZEO4XU3numYMbJI217oqc2ILTeFUTiJmS9tA05H3BHrzZATQaq/
	9RnUWAWIJV+DQED7NSVSNgr5VB/O/gJawAxiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zMpwg9TvNB5nu4rogdsfC5yCinf3cRq8CKfkqSYcW+E=;
	b=K1sgldHitG45daSam1imSakpvGOdw5++RFtStHAJ9YPTjsoNtXdYDFIqm1gltU1B+H
	5h71ccP+C5kD9ojisNHEcKsDx+Khd8UOUa8Bws8t6yKL7UoddGs61UtldI4vM4h9edRv
	JzqcQDRoqEkVxgRVCF/mk7L9aDECojnE2jWJ4NWzrAVO7KC5gmcwbMI25ARMpRiwmJCm
	OG+nBinfw+ZWcP9oeJcxhkPcm3z7H0MgfmRgDYZMHh9gPSBpo0hqnR+nOlosJf5XJnGg
	W5kpdWvcg1fa+ECewbgdJM9Hq7XgWhachAaVD1pZHlFdswUu6OypnHZ7dSlmGrvLgr+5
	SD8g==
X-Gm-Message-State: ALyK8tJPUpv7DHa1vbvc2lMgsuIUYxC36GJOCbixBFTw95Hbe+4nN8mXvep5IBotikG/AMWqGOa58JAwaOqIMBjz
X-Received: by 10.176.5.138 with SMTP id e10mr9810342uae.38.1467888819546;
	Thu, 07 Jul 2016 03:53:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Thu, 7 Jul 2016 03:53:20 -0700 (PDT)
In-Reply-To: <CAFEAcA8sv7tLrp84dnVV=gWqn21DFEqHCiAkDzVOWrCOux=Tug@mail.gmail.com>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
	<CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
	<121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
	<CAFEAcA-ZGbR2nz80n=QcxRTr=PN5EMQ-OrbncaAQnHMwmhPtZg@mail.gmail.com>
	<340f08ea-ee9b-1284-7e7f-17d33b314885@gmail.com>
	<CAFEAcA8sv7tLrp84dnVV=gWqn21DFEqHCiAkDzVOWrCOux=Tug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2016 11:53:20 +0100
Message-ID: <CAFEAcA_dbGMJm4OT62CKEQKaPf-sV818fwboy_GarXYeT973Ag@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
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
X-TUID: NWLWu6rxZpKE

On 4 July 2016 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 July 2016 at 18:49, Dmitry Osipenko <digetx@gmail.com> wrote:
>> On 01.07.2016 19:36, Peter Maydell wrote:
>>> On 30 June 2016 at 20:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>> On 30.06.2016 18:02, Peter Maydell wrote:
>>>>> What I meant was: ptimer_get_count() is typically called to generate
>>>>> a value to return from a register. That's a separate thing, conceptually,
>>>>> from whether the device happens to also trigger an interrupt on timer
>>>>> expiry by passing a bh to ptimer_init(). So it's very odd for a detail
>>>>> of interrupt-on-timer-expiry (that there is a bottom half) to affect
>>>>> the value returned when you read the timer count register.
>>>
>>>> In order to handle wraparound correctly, software needs to track the moment of
>>>> the wraparound - the interrupt. If software reads wrapped around counter value
>>>> before IRQ triggered (ptimer expired), then it would assume that no wraparound
>>>> happened and won't perform counter value correction, resulting in periodic
>>>> counter "jumping" backwards.
>>>
>>> That just says you need particular behaviour between counter reads
>>> and IRQ triggers; it doesn't say that you need the behaviour to be
>>> different if the ptimer code doesn't know about the IRQ trigger.
>>>
>>
>> Okay, I already explained the reason for having two different behaviours - to
>> make polled counter value more distributed when possible. If I understand you
>> correctly, you don't like it because it is "odd" and I agree that it's a bit clumsy.
>
>> So, what we are going to do now? Would you just revert the offending commit or
>> you have some other suggestions?
>
> Well, we need to fix the regression, but basically I'm kind of
> confused at the moment. I haven't invested a lot of time in
> trying to understand the timer code, so all I can really do
> is say "this does not look like the right thing" and ask you
> to come up with a different fix for it.

My current best guess is that this condition should simply be
"if (expired) {".

thanks
-- PMM
