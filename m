Received: by 10.25.21.156 with SMTP id 28csp1837462lfv;
        Tue, 26 Jul 2016 10:33:58 -0700 (PDT)
X-Received: by 10.237.52.225 with SMTP id x88mr40048718qtd.24.1469554438392;
        Tue, 26 Jul 2016 10:33:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m69si1100606qki.176.2016.07.26.10.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 10:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS6Ev-0000eY-Pj
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 13:33:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS6Eq-0000dS-9q
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 13:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS6Ep-0002BM-EI
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 13:33:52 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:35020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bS6Ep-0002Af-9H; Tue, 26 Jul 2016 13:33:51 -0400
Received: by mail-io0-x241.google.com with SMTP id q83so2655650iod.2;
	Tue, 26 Jul 2016 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9nGaYijV5IHILdiwGXnp5nza8Unw0y52U/We5KWo/ak=;
	b=yYkfRhPBpC9woEl5UHEOkzXnIl4ihI4x2Z12yXKajhu7PeuEUan68xutPpHyo/KbFM
	Vl+ijs7BoGTZLF2ZXFIjLk3vs0iC3wzPWUHNJIK6h3OlUU1sBOv7E1mIi2UVF+GE7k+l
	E7xwgJqnWtaGZs0qmWE/6j6zfKeP5pZ2S9MZFNBccgE0DQ5v0GaO5ry8kOeVQLHBFEB1
	RgwedOMYoHBELNFO+SBIdaunnozhzv9a2OodaeVqVzhSh1S/epjWeUXw/P09qIgDYoip
	pmOG+W7FBnIStXH5rGC2adHlLMI09JGFLQDaRXtAWCekI3Pqat1TZjdnc+Oe+3QYmc4F
	isgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9nGaYijV5IHILdiwGXnp5nza8Unw0y52U/We5KWo/ak=;
	b=BzqYeC1G+MMyw9wJzOz50tPiFu6o8pr0Phv9X/7rrqa8J25hTWGUv+yvzbKT34KU+K
	5EDsiINcC2TNjbaIVMVwwRjGTm0zZCIuNE5hfHJ3+Ya96QQfupWrZ2pvrAxguHSFPY8U
	Of+z+5yqMmOblySMDr/1YCZ79o3xsN/FKcPGyCORgAvr99ltRJMUEBFXnAUGp7OWteRp
	WOjn1MBEsWRoKw5NaxbmX8fu5lFFlvn80mewy8QZihttp5C2pBo8rkyYkVu7ZP+zrWuD
	f46yMvamO1c9sgpmSjZXuy/jR5vzxveCboCxA5rmZeMu7w64iq1mFw7GpUeolqOltOme
	wzyA==
X-Gm-Message-State: AEkoouvwSkF75IU/bmSOL+KJIMVv4luUB0jm07MzG/XMPIbG6aOoun6RWY68T6t/j8fIPUm9WEXlfW35JSfiKA==
X-Received: by 10.157.60.176 with SMTP id z45mr14101126otc.45.1469554430511;
	Tue, 26 Jul 2016 10:33:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Tue, 26 Jul 2016 10:33:21 -0700 (PDT)
In-Reply-To: <CAFEAcA9eb2nO1Dos09n-sOLy1Ks=zg5W6kPLx1NBhmfj18kDtQ@mail.gmail.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<0402d187c9f749701f6fe728faf3e28c6b86a74b.1469491920.git.alistair.francis@xilinx.com>
	<CAFEAcA_+iHZhKPFt8cYQpc0p0zM6oFBTyK2=T+7wYJzuFWYB7A@mail.gmail.com>
	<CAKmqyKOh3RJbkgGVHqWOws=dXrNGyGhkzzrZ6bSHyMhbHs_4ug@mail.gmail.com>
	<CAFEAcA9eb2nO1Dos09n-sOLy1Ks=zg5W6kPLx1NBhmfj18kDtQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Jul 2016 10:33:21 -0700
X-Google-Sender-Auth: Y5fbx9--yyGsZ8vIX9j4VL5xAQo
Message-ID: <CAKmqyKOr_kQoxCxPbnEyomu_iycn4yRE3KP_garV-wTfwxs2SA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/6] cadence_gem: Add support
 for screening
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uIUhlR5l5CF1

On Tue, Jul 26, 2016 at 9:55 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2016 at 17:42, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> On Tue, Jul 26, 2016 at 5:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>> The Cadence GEM hardware allows incoming data to be 'screened' based on some
>>>> register values. Add support for these screens.
>>>>
>>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
>>>> +static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)
>>>
>>> Nothing seems to call this -- this probably results in a complaint
>>> about an unused function if you build at this point in the series
>>> (possibly only with optimisation on).
>>
>> There is a warning about this. I wasn't sure what the position on
>> warnings in between patch a series was. I can squash this into the
>> next patch, I was just worried that the patch was getting a little
>> big.
>>
>> What do you think?
>
> Warnings are compile failures by default, so they break bisection.
> That makes them worth avoiding.
>
> Here's a rearrangement that I think should work, though it's
> a little tedious:
>
> (1) change patch 2/6 so that instead of using hardcoded [0] for
> the array dereferences it uses [q], with an "int q = 0;" at the
> top of the relevant functions (gem_transmit and gem_receive).
> (This will also reduce churn in patch 4 since we just go from
> foo to foo[q] rather than foo to foo[0] to foo[q].)
>
> (2) Then this patch can switch the 'q = 0' to the
> + /* Find which queue we are targetting */
> + q = get_queue_from_screen(s, rxbuf_ptr);
>
> that's currently in patch 4. (It'll always return 0 at this point,
> since the registers can't be written by the guest yet.)

I was hoping to avoid that, but it actually wasn't too bad. Sending
the next version now.

Thanks,

Alistair

>
>>>> +            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
>>>> +                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
>>>> +
>>>> +            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
>>>> +                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {
>>>
>>> You pulled this out into 'offset' so you can just switch (offset).
>>
>> They are actually different.
>
> Oops, so they are...
>
> thanks
> -- PMM
>
