Received: by 10.223.188.70 with SMTP id a6csp263760wrh;
        Thu, 31 Aug 2017 16:44:41 -0700 (PDT)
X-Received: by 10.55.160.14 with SMTP id j14mr189597qke.280.1504223081414;
        Thu, 31 Aug 2017 16:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504223081; cv=none;
        d=google.com; s=arc-20160816;
        b=MEitDn3vMnSzDq9po0RTtrnZ/yqM6ThdNKjYMjBdVq2s1v8hZGXzjQRMZLP1lc9OUu
         vfipwmD6BQuX7+0/Y8EAHwKc6LDiDwfcklIcEiq7mGqtVP1RD+nI2dr7tglZSAbqolj/
         92LEc8jsgQFF3a426rTAtwihPsgQKaIeypie/rUEQlbIcWBMmkuBGXf+Kki5T87SRqzJ
         qtuyF6K13HYVOiqfoUYqippkjAYv7mvjA5ePeTDVoc6ilXxi6e9D/mFEY8ZtzfFoV9G0
         pbtu/V9sdR5kcAm9jL0QxbY+k/iiQIOUFVtcPx/KiwLEqasiriB3aT62Owc+dKXNHUb9
         CZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=NPOlzsPv66RU/we83NWp1iZ3CB9TROLc8LPTS2ltmOA=;
        b=BnpRwhnZXi0Y/XeqdYWqK1S5nNRxuDpr7mWNXD4mzkJCxMz+cTCrwvRiCtnDz77C65
         HU3+QD0uBb4bDuAnmjxOX1wH+sZEeEXeXquT4yOz1i6DiSuXvhXaGUu4WoZU2EbU2JOD
         Vu7rzY5Y/OKM8kjQaMaLee4l2wCKtCdQu/yY3ydREpa/phO8pHLyCny61fef2UpXPbbe
         OaPxJYp5TapPBe3LnrKSsULcwagmC4XXPawpwDm5UzX7QP6QsVoyQKKFQPux6+MJeCo5
         sGlsrFUi2igz/Y95brUAgUxnlf5KlyyCSobcjm6tzb4+/5DSxpFf0pwee2sF3cHotE0v
         cdEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O1o0vjZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k77si8782955qke.479.2017.08.31.16.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O1o0vjZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnZ8Z-0007D9-3u
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:44:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnZ8Q-0007C2-1d
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnZ8P-0006Hu-1R
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:44:30 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:38881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dnZ8M-0006GE-JH; Thu, 31 Aug 2017 19:44:26 -0400
Received: by mail-wm0-x22f.google.com with SMTP id 187so6276261wmn.1;
	Thu, 31 Aug 2017 16:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NPOlzsPv66RU/we83NWp1iZ3CB9TROLc8LPTS2ltmOA=;
	b=O1o0vjZG4DFd5i1kwthyH0HI+VVoPUAW8kW92/+/8EHPYK8zldmG09xcjQ1wZEanBt
	66CCNjOJsUMP36Cp46KFP+kbndOxTtB3c9/k0HSkvASfxhzaggOjY++ZryPmpcjVpMRM
	NCYcfYTHfrN8NSUUy3YjzfJIw6y0V8drIUO7KzzS0XZDEqlwqJyzR63E4SOUsn5wvsGi
	qtDF4fAPvlKd1gK2QmvDre2sFPLYxJuZsUsweIyjy4aIboW21c5s4njF0zP/o8Z21Pjm
	AAMzO+ZtHh2etKXanpGPV8GY7rSukqFMMA19z+XDyvYoYkPvSCxHgwsz26sd2jAMjAJR
	NSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NPOlzsPv66RU/we83NWp1iZ3CB9TROLc8LPTS2ltmOA=;
	b=IMoHPkff7BBNlrLrtyEcH66tukXH7aUoFmsaeNwd6O1JSYN4LSQfQ24tfu7iSdyoD/
	IpGxBbQTUcSgMYGdFeuBAUP2LpqEDGoNVWAdis4DowTdOkXfG/TqqHPClY1mfKXbBQGb
	lgFiJaaP1W5VqFY2iWKVl+4MjeSxr40KdayplqXiXP7MM4iOg17BdSboWuZJJ77kZqrT
	OEFu4h6NBjUxwr6MC04euJhLkyaZU+y3QYA4Ud4pkwzwA2/sCv68G+NLZP3EnLfpJuDE
	ViQeURrdwLaCIlerzzpTmM3KjzWES4BH2ra/1GUsxtbPvCIlOeMt4HN7W/L3oNxiLIOx
	fXkA==
X-Gm-Message-State: AHPjjUiIRQoDxpymuOzUBg6Pn8UNayt/UlsxJ6qSVPBL9EwJlnOPwKux
	ZcDPUGPgb02TrVVl1sh31eo/gY+YrViK
X-Google-Smtp-Source: ADKCNb4dmKakomz8nlQsedE23OWX/oHY0H9psp5b/cBQhyqiv2zGp43az/DXrKK8A1FbqDylg0ZTzIxRJ173zARYaKI=
X-Received: by 10.28.67.197 with SMTP id q188mr1589360wma.156.1504223064223;
	Thu, 31 Aug 2017 16:44:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 31 Aug 2017 16:43:53 -0700 (PDT)
In-Reply-To: <c753e87e-0c71-03fc-1cc0-5b546134b2d5@amsat.org>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
	<10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
	<CAFEAcA9W=YqbeYKuAxvfNyjfCWGyAXuPdxwFrpLmoezLJ4pm-A@mail.gmail.com>
	<40ca8d07-75e5-e0b3-021e-5abaffd16b78@amsat.org>
	<CAKmqyKOyw3w4gqyUmW8qWVz_TtEmbx61J5GEm3NwA75Rhy8kQg@mail.gmail.com>
	<c753e87e-0c71-03fc-1cc0-5b546134b2d5@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Aug 2017 16:43:53 -0700
Message-ID: <CAKmqyKMMCj95YRTmJu-t1L9Xqm4UvFQcrMEKM1D-a20kta0VCw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B/AdQYuQUDrE

On Thu, Aug 31, 2017 at 4:40 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Alistair,
>
>
> On 08/31/2017 08:02 PM, Alistair Francis wrote:
>>
>> On Wed, Aug 30, 2017 at 7:47 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
>> wrote:
>>>
>>> On 08/30/2017 09:26 AM, Peter Maydell wrote:
>>>>
>>>>
>>>> On 30 August 2017 at 03:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
>>>> wrote:
>>>>>
>>>>>
>>>>> I think they might be issues if you start QEMU without -serial and th=
en
>>>>> use
>>>>> a firmware polling for an uart, the device won't be mapped and the
>>>>> memory
>>>>> accesses are mostly ignored.
>>>>>
>>>>> I'd rather use:
>>>>>
>>>>>       for (i =3D 0; i < MSF2_NUM_UARTS && i < MAX_SERIAL_PORTS; i++) =
{
>>>>>           static const char *serial[] =3D {"serial0", "serial1"};
>>>>>
>>>>>           if (!serial_hds[i]) {
>>>>>               serial_hds[i] =3D qemu_chr_new(serial[i], "null");
>>>>>
>>>>>           }
>>>>>
>>>>>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>>>>>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>>>>>> +                           115200, serial_hds[i],
>>>>>> DEVICE_NATIVE_ENDIAN);
>>>>>> +        }
>>>>>> +    }
>>>>
>>>>
>>>>
>>>> It would be better to fix serial_mm_init() to handle having
>>>> a NULL chardev pointer, because we already have a lot of
>>>> SoC code that just passes it serial_hds[] regardless.
>>>
>>>
>>>
>>> clever :)
>>>
>>>> I'd leave this code as it is and we can fix serial_mm_init
>>>> separately (somebody pointed out this issue for a xilinx
>>>> board recently).
>>
>>
>> Ah, I'll look into this then.
>
>
> I already sent a series to take care of this:
>
> http://lists.nongnu.org/archive/html/qemu-devel/2017-08/msg06325.html

That was quick.

Can you CC me on the next version?

Thanks,
Alistair

>
> I'll respin a v2 shortly.
