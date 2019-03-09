Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8996014wrx;
        Fri, 8 Mar 2019 17:03:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9+UMvFDj+lKLr4YwrWqd2XYPt+z8/8FsuaMIPJfpkaCx9qylie77VXKfIi70xvLzwc7Z6
X-Received: by 2002:a25:2f91:: with SMTP id v139mr18475113ybv.407.1552093412049;
        Fri, 08 Mar 2019 17:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552093412; cv=none;
        d=google.com; s=arc-20160816;
        b=YaMa43avowEUEZ16J8NLzCDJmvY91AUrkGNOD0UwOcxDcqTMn5Sisza7zCvG2xbvby
         n5z8ojVkfSWwdefUvZmx0BwBqo0aDdJ3tjzSKb0MN6vsc11IGSZCBoLRcNIJZnBL65/I
         Pls5+YNHMW8EIIivgGFEFrZh7u8ivMdAf3lwbfNbMmUxlQ56XbCVAoQjStliNhjHbLBl
         QacUZFK/QUinJcBpFN/IMWqzdCITt3TFaMRibzc/2Ov85+ojSjmK4UCjPnzd2dNYGuYh
         VYyeRBRug21fV/MfYAFl4U2f8gmJjfoyVH7+7irbuUR/3++gTr+bYamh1nMPOzBa8nk8
         5LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7B6vq2Tg2ea97nifXGcS5qHp/idM1KczvyomVshz4mA=;
        b=ypJSUTGBeOUescHl6p0jopshLbYvHfnwS/sip4pab1AS+hnTfeuYKpBfiZHYv4Bpna
         rRi6bvL2pVJHSViwBzEn/GwXeITtqsq36CvTwZ75ki0olyKyuXPLNcYoKrdbESQfVE5I
         6l1UHlQMNOwh/DbByjp2QFMVMKQpQ7cRHC6YKVNeHXnXcOyGA4IPJpR4nQgSNTtkumTo
         KNgRQeb3qWf/NEg0Vs1BiIKaUdu9tNr3YGTyib8NnAwG1qaWFAsHeCGBLfOYh78H3bpY
         KboXbHI3+aD2qFkcMzdMy0zQT73OEai3KzkrFwvextV+P8Vk6mONnPaqpA5cl5BDy0u4
         keng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qnRBnimA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si5520831ywa.225.2019.03.08.17.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 17:03:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qnRBnimA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:52241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2QOf-0001yZ-4s
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 20:03:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h2QOT-0001yF-Qz
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 20:03:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h2QOS-0006nV-UT
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 20:03:17 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:43742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1h2QOS-0006mX-Lo; Fri, 08 Mar 2019 20:03:16 -0500
Received: by mail-lj1-x242.google.com with SMTP id z20so18920999ljj.10;
	Fri, 08 Mar 2019 17:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7B6vq2Tg2ea97nifXGcS5qHp/idM1KczvyomVshz4mA=;
	b=qnRBnimARrczUqJ4BkuVvAerZ3HLDjTi7v5zUcplk8wQafWaSh+9yBGEVfIhVRAadU
	SSqzq5C13yMkJiIYpWbyujfL8sN8kvhkRZEx9hsZyhF2dXD2Q0MlUhni4cLoEsPAm8LI
	BJordTFD3q7Z/FexHhZLIjOa7Fb4lF+g2iEYY7ALK9jDMmnf4IoUYX+h7D3dt5uePjwb
	y//dIKdDQ9lzI/MxMvCdOnsxdNm5p05TYSX64JExo2n++F/glgPQQsq9GtI/67/AiVEL
	/cRcYH93ucUKkYKNi1L7tG/NdrejoSIzwlLllNWtNQ+SjP39NKFS8bP0b6m2RnXuzK77
	MnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7B6vq2Tg2ea97nifXGcS5qHp/idM1KczvyomVshz4mA=;
	b=SJchREggSUu/JHHDYglqV3IV9lgqD4MpGUE91GIB813K8T1Rl1r5RaLI4WseAWFk3O
	CIN+XnSanvK6Kck8GZRr0JAT00hi5/TWSA6Sug5HEevZkV6XXeVDq3Zq+bubZEEdhV0C
	RDDzCzd1R/j5jNwmcjEPkqcwGzuhDnwdFtEzM2ClK+v5EZXJTXGBEERlUXRARsVo9w2t
	bVz+WbfMCs53M+lJsQoivbO/9k8Nzdt+xcvy9j6lVQokj/JOCzjqTvK4Cj88C3oq40Qo
	qHck6yalZ3VTnM19jBcLtOkglJrh8xFLHDGHCqPD/EYQqNKuqhwnhA/4K/Foe/ygDCok
	yQQA==
X-Gm-Message-State: APjAAAWnOuDAbAoJULllwKCYTuAwj+QGlceyt+kp7oVuvEn3bhK7/+lx
	S4HvTqOfv+R5lnjaXGj1809Y9VFfsc08o5GYHeU=
X-Received: by 2002:a2e:9dd2:: with SMTP id x18mr11609103ljj.109.1552093394751;
	Fri, 08 Mar 2019 17:03:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP;
	Fri, 8 Mar 2019 17:03:13 -0800 (PST)
In-Reply-To: <CAFEAcA-+U75+EQzcpV4kZHw+4xMSbMv3UJ0CV_Q3DVbNx5RbNg@mail.gmail.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
	<CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
	<CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
	<CAFEAcA-+U75+EQzcpV4kZHw+4xMSbMv3UJ0CV_Q3DVbNx5RbNg@mail.gmail.com>
From: bzt <bztemail@gmail.com>
Date: Sat, 9 Mar 2019 02:03:13 +0100
Message-ID: <CADYoBw2XWeDUqBHVJBWxJAzQ4f0imosEeLHHoG9AfHfdavOTrA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YnRbpjN2qRqD

Hi,

Thanks for your answers. If I don't clear the INTENABLE flag, then the
IRQ would keep firing constantly. This is not how the real hardware
works: it triggers the IRQ once, and then it inhibits. The timer won't
trigger the IRQ again until you acknowledge it by writing the INTFLAG
into the ack register. My solution emulates this behaviour. That's
what the triggered flag was for in my original patch. Should I bring
that flag back or is the current solution acceptable knowing this?

About keeping the INTFLAG on control write that's to avoid an instant
IRQ, but that's OK. I'll modify that.

Thanks,
bzt


On 3/7/19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 7 Mar 2019 at 15:57, bzt <bztemail@gmail.com> wrote:
>>
>> Nope. I meant the second patch, sent on 4th Mar, which had all the
>> things fixed you listed in your review.
>>
>> But here's the modification for your latest query. This one controls
>> the timer depending on ENABLE bit. It sets the INTFLAG even if
>> INTENABLE is not set, and only raises the IRQ if both are set.
>
> Thanks. I've listed a couple of minor things below
> which I think are not quite handling the flags right,
> but the rest looks good.
>
>> @@ -78,6 +94,17 @@ static void bcm2836_control_update(BCM2836ControlState
>> *s)
>>          s->fiqsrc[s->route_gpu_fiq] |= (uint32_t)1 << IRQ_GPU;
>>      }
>>
>> +    /* handle THE local timer interrupt for one of the cores' IRQ/FIQ */
>> +    if ((s->local_timer_control & LOCALTIMER_INTENABLE) &&
>> +        (s->local_timer_control & LOCALTIMER_INTFLAG)) {
>> +        if (s->route_localtimer & 4) {
>> +            s->fiqsrc[(s->route_localtimer & 3)] |= (uint32_t)1 <<
>> IRQ_TIMER;
>> +        } else {
>> +            s->irqsrc[(s->route_localtimer & 3)] |= (uint32_t)1 <<
>> IRQ_TIMER;
>> +        }
>> +        s->local_timer_control &= ~LOCALTIMER_INTENABLE;
>
> This shouldn't clear the INTENABLE flag.
>
>> +    }
>> +
>>      for (i = 0; i < BCM2836_NCORES; i++) {
>>          /* handle local timer interrupts for this core */
>>          if (s->timerirqs[i]) {
>> @@ -162,6 +189,55 @@ static void bcm2836_control_set_gpu_fiq(void
>> *opaque, int irq, int level)
>>      bcm2836_control_update(s);
>>  }
>
>> +static void bcm2836_control_local_timer_control(void *opaque, uint32_t
>> val)
>> +{
>> +    BCM2836ControlState *s = opaque;
>> +
>> +    s->local_timer_control = val & ~LOCALTIMER_INTFLAG;
>
> This will clear the LOCALTIMER_INTFLAG if it was already
> set -- you want to preserve it, something like
>    s->local_timer_control = (s->local_timer_control & LOCALTIMER_INTFLAG) |
>      (val & ~LOCALTIMER_INTFLAG);
>
>> +    if (val & LOCALTIMER_ENABLE) {
>> +        bcm2836_control_local_timer_set_next(s);
>> +    } else {
>> +        timer_del(&s->timer);
>> +    }
>> +}
>> +
>> +static void bcm2836_control_local_timer_ack(void *opaque, uint32_t val)
>> +{
>> +    BCM2836ControlState *s = opaque;
>> +
>> +    if (val & LOCALTIMER_INTFLAG) {
>> +        s->local_timer_control |= LOCALTIMER_INTENABLE;
>> +        s->local_timer_control &= ~LOCALTIMER_INTFLAG;
>
> This should just clear the INTFLAG, it doesn't affect INTENABLE.
>
>> +    }
>> +    if ((val & LOCALTIMER_RELOAD) &&
>> +        (s->local_timer_control & LOCALTIMER_ENABLE)) {
>> +            bcm2836_control_local_timer_set_next(s);
>> +    }
>> +}
>
> thanks
> -- PMM
>
