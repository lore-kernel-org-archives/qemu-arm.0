Received: by 10.25.21.156 with SMTP id 28csp1819184lfv;
        Tue, 26 Jul 2016 09:55:51 -0700 (PDT)
X-Received: by 10.55.82.2 with SMTP id g2mr28892894qkb.168.1469552151865;
        Tue, 26 Jul 2016 09:55:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o11si1015051qke.97.2016.07.26.09.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 09:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS5e3-0000uQ-AD
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 12:55:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS5dx-0000tj-Bh
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS5dv-0002Fj-Re
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:55:44 -0400
Received: from mail-yw0-x232.google.com ([2607:f8b0:4002:c05::232]:36184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS5du-0002FT-Um
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:55:43 -0400
Received: by mail-yw0-x232.google.com with SMTP id u134so21789795ywg.3
	for <qemu-arm@nongnu.org>; Tue, 26 Jul 2016 09:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yDD1xj3/A4ySG/U3L4udd3qyPudGtP7Tswmrw9kXwfg=;
	b=C8yGDq/ZxGhCSYO/dm9cbo8Nw4eZYRwSP4SiaWSYl60A/Kq2jjS/mvwnh0qAcmGIh9
	AVkQw4v4/2kTSWWt/F6vbYG8uOewSZnkasLzte8Odmx0dSRMAorlcnxJ+YCzwfnsR1F8
	wPCtTLooX+KZUZcc1o9q0TjrzojgyXekh4rFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yDD1xj3/A4ySG/U3L4udd3qyPudGtP7Tswmrw9kXwfg=;
	b=Ob65l/lBmLh5fcWxru1ul+1unzl6fKdORSGTwYBzgZbSw3XaFzwM5OIxebTbrqcqaF
	4iyoSkNSxNABMq2cVrrvT7sGMmtkzXdVdcW6MDE4abBcu9Z4l5HXxGdeOeAymE4ZjN9i
	SPQTRAfB8r3IymnFAmKK96U8mD+xHDcGpBNkyjKZZgxqIUnmKI/NOcu2NhEDFx3N4UFV
	2jjjLqFFbVrTYsSSB0kiII4gq+9xDeldVa+SxSH4UDeYEGpkL9wjCPAx0hyliZAnhzPk
	ZleqPXTQ3Bg1xSXeVAt3ven2+BLOHUslsJHELJyvpxbS0do33J5bhZT95KMRE6PcGRFX
	1nJQ==
X-Gm-Message-State: AEkooutgT5LpdePlIyX5joc6APj3O15y+fBVwki274sqiOVR1tbytGvemC3bTAkmOAMJFxaVq6lZsqxaAHaBucN6
X-Received: by 10.176.69.180 with SMTP id u49mr10513055uau.24.1469552141290;
	Tue, 26 Jul 2016 09:55:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Tue, 26 Jul 2016 09:55:21 -0700 (PDT)
In-Reply-To: <CAKmqyKOh3RJbkgGVHqWOws=dXrNGyGhkzzrZ6bSHyMhbHs_4ug@mail.gmail.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<0402d187c9f749701f6fe728faf3e28c6b86a74b.1469491920.git.alistair.francis@xilinx.com>
	<CAFEAcA_+iHZhKPFt8cYQpc0p0zM6oFBTyK2=T+7wYJzuFWYB7A@mail.gmail.com>
	<CAKmqyKOh3RJbkgGVHqWOws=dXrNGyGhkzzrZ6bSHyMhbHs_4ug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2016 17:55:21 +0100
Message-ID: <CAFEAcA9eb2nO1Dos09n-sOLy1Ks=zg5W6kPLx1NBhmfj18kDtQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::232
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Lsq2JM+GY+w

On 26 July 2016 at 17:42, Alistair Francis <alistair.francis@xilinx.com> wrote:
> On Tue, Jul 26, 2016 at 5:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>> The Cadence GEM hardware allows incoming data to be 'screened' based on some
>>> register values. Add support for these screens.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

>>> +static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)
>>
>> Nothing seems to call this -- this probably results in a complaint
>> about an unused function if you build at this point in the series
>> (possibly only with optimisation on).
>
> There is a warning about this. I wasn't sure what the position on
> warnings in between patch a series was. I can squash this into the
> next patch, I was just worried that the patch was getting a little
> big.
>
> What do you think?

Warnings are compile failures by default, so they break bisection.
That makes them worth avoiding.

Here's a rearrangement that I think should work, though it's
a little tedious:

(1) change patch 2/6 so that instead of using hardcoded [0] for
the array dereferences it uses [q], with an "int q = 0;" at the
top of the relevant functions (gem_transmit and gem_receive).
(This will also reduce churn in patch 4 since we just go from
foo to foo[q] rather than foo to foo[0] to foo[q].)

(2) Then this patch can switch the 'q = 0' to the
+ /* Find which queue we are targetting */
+ q = get_queue_from_screen(s, rxbuf_ptr);

that's currently in patch 4. (It'll always return 0 at this point,
since the registers can't be written by the guest yet.)

>>> +            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
>>> +                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
>>> +
>>> +            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
>>> +                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {
>>
>> You pulled this out into 'offset' so you can just switch (offset).
>
> They are actually different.

Oops, so they are...

thanks
-- PMM
