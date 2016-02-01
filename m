Received: by 10.25.159.19 with SMTP id i19csp2292925lfe;
        Mon, 1 Feb 2016 03:26:07 -0800 (PST)
X-Received: by 10.55.73.85 with SMTP id w82mr27967579qka.52.1454325967495;
        Mon, 01 Feb 2016 03:26:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w21si29190927qka.42.2016.02.01.03.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 03:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQCcQ-0002Mc-Vu
	for alex.bennee@linaro.org; Mon, 01 Feb 2016 06:26:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>) id 1aQCcO-0002Jf-Ic
	for qemu-arm@nongnu.org; Mon, 01 Feb 2016 06:26:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>) id 1aQCcN-0002oL-Cy
	for qemu-arm@nongnu.org; Mon, 01 Feb 2016 06:26:04 -0500
Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b]:38585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>)
	id 1aQCcH-0002mc-Vx; Mon, 01 Feb 2016 06:25:58 -0500
Received: by mail-ig0-x22b.google.com with SMTP id mw1so30673116igb.1;
	Mon, 01 Feb 2016 03:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zS9nNWWX9NhazdbTonGyB2vtbts3w8VD3MTmO0uU9C8=;
	b=v5pJbkkmWZXTlOZ3Y9SSg7Ejz1ubhrxmwj+r6iKxqL7GW1XJVL4Woe+O3zDIwgM1iM
	mMmlzDJkGe7YhPPIolcsBYJmXYl79bovfDN80oi8kUZ04+f09GkiIzU2oB/rFoAtPcr+
	N7q0LWHKUEYf6FQZXpeQr0akmvAWYSN5gf/tU2I9kSDhAMt0KAMaVOMKcR+X0NvuYU26
	ZCvv9q+Cv+jw4rHia3NVenaEQPQ+8KR9kVq9q5quLkYgLFJg2Rr1s620AMGwICtBRjx9
	B4jOFIlGRectqJpgNxM9mUjwaL2gKZuEbN0h9KzThT3SM44rDDsmV1p8iBnxrKOceh8l
	nTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=zS9nNWWX9NhazdbTonGyB2vtbts3w8VD3MTmO0uU9C8=;
	b=QLGuX1FUBukYJSuaVBd5vY+3zJzdhM4TOVq/s89HuT6iCmjKImE2TxeeP9nZ4gGiYG
	KMiZ5mv3N8t2wedrJPauCp4TPxXf6r1h+0b61cXZG5A1oZSvz6Re5f60KA7IHWH2aG7M
	UVsCQc51XkNB3Pj2VPCTUMXYLSX48m8jE/SK3kqy5Z7kbWW899kRE6Krx9zeKf8MPn4h
	Y4JDrJf0Q9sfQ5qbofFDZ4AvE1//xEGYSA+HU7pry6zNUpZAnSk4TJZrkGJmWa8mpgQu
	9jSsa+EiB2hbOeU39vVe4qiZ6EcaZ4FfotNX3qR7jzALQoX5Mb8zhb48Vef4idBMZIDl
	WlFg==
X-Gm-Message-State: AG10YOS/AWH7rZ09YEHECasWHB2rUWBSR8KJVEJkOnA1HZx6KjV6ndSoSZQEgXdXm5ExQeIC2B2OIz7WUNLVyA==
MIME-Version: 1.0
X-Received: by 10.50.33.20 with SMTP id n20mr10383739igi.17.1454325956245;
	Mon, 01 Feb 2016 03:25:56 -0800 (PST)
Received: by 10.107.158.195 with HTTP; Mon, 1 Feb 2016 03:25:56 -0800 (PST)
In-Reply-To: <CAPokK=pSaPuBYMdhJGk742Ty1KXB5A0a4NW8ctq=3iAtJtthPQ@mail.gmail.com>
References: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
	<CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
	<CAFEAcA-Qm+vgjPt3eGfGdzZ-JMUoZ0-2dMiR+q1JRVzosbdRrw@mail.gmail.com>
	<CAB=otbQD8NXV3DLzcrcQjQWFSQCf1U6ZA3orPr+yM_1B_+gh2Q@mail.gmail.com>
	<CAPokK=pSaPuBYMdhJGk742Ty1KXB5A0a4NW8ctq=3iAtJtthPQ@mail.gmail.com>
Date: Mon, 1 Feb 2016 13:25:56 +0200
Message-ID: <CAB=otbQgZUcrnsAVFkepGEKBbO7EDh0yjC+6+AkoYsfQz69G2A@mail.gmail.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::22b
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] Does QEMU support AArch64 Big Endian emulation on
 x86-64 host?
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QyUK/GyYyqu6

On Wed, Jan 27, 2016 at 7:39 PM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Tue, Jan 26, 2016 at 4:05 AM, Ruslan Bilovol
> <ruslan.bilovol@gmail.com> wrote:
>> On Mon, Jan 25, 2016 at 6:07 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 25 January 2016 at 13:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>>>>> I'm trying to run AArch64 Big Endian image under QEMU that I built for
>>>>> my x86-64 Ubuntu host from latest master branch and when I'm running
>>>>> kernel I'm getting next error:
>>>>>  > qemu: fatal: Trying to execute code outside RAM or ROM at 0x500208000080ffff
>>>>>
>>>>> Similar image built as Little Endian runs fine with same QEMU tool
>>>>> (qemu-system-aarch64)
>>>>>
>>>>> So I'm wondering is it possible to run QEMU AArch64 Big Endian
>>>>> emulation on x86-64 host?
>>>
>>> It is not currently supported, no. However there are some patches
>>> on the list[*] to add this support, so I expect a future QEMU version
>>> will do this.
>>>
>>> [*] https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg03025.html
>>
>> Thank you four quick answer.
>> I tried to apply this patch series to latest qemu master branch, but it
>> fails to apply in misc places. Peter Crosthwaite, could you please say
>> which commit ID is it based on?
>>
>
> I pushed the branch just now to here:
>
> https://github.com/pcrost/qemu/tree/arm-be.next

Thanks Peter.

I've built qemu on this branch and tried to run it with my
AArch64 Big Endian binaries but still get same error:
"qemu: fatal: Trying to execute code outside RAM or
ROM at 0x00007fe60d8e0a30"

So it looks like (unfortunately) these patches do not enable
AArch64 BE support

Best regards,
Ruslan
