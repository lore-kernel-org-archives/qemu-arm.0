Received: by 10.25.159.19 with SMTP id i19csp1331278lfe;
        Mon, 25 Jan 2016 08:07:50 -0800 (PST)
X-Received: by 10.55.71.143 with SMTP id u137mr22103826qka.1.1453738069120;
        Mon, 25 Jan 2016 08:07:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x130si25012320qka.101.2016.01.25.08.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 08:07:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:39448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNjgC-0002CW-J8
	for alex.bennee@linaro.org; Mon, 25 Jan 2016 11:07:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aNjg9-0002BY-D0
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 11:07:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aNjg8-0003Fk-IK
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 11:07:45 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aNjg8-0003FX-EB
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 11:07:44 -0500
Received: by mail-vk0-x233.google.com with SMTP id k1so76170790vkb.2
	for <qemu-arm@nongnu.org>; Mon, 25 Jan 2016 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VDMFI4rkJJQRXrteq/pHkreHjA4ivVMoYODvYTUFwhU=;
	b=XxuE7GUuQFx2BvWb8IjshJ/iT1SDY5b31G1jU5C592RYzSQvtUsXPPUnjvK/ANRWoT
	heOuL57KFLmLJDyKNgv0sFLiNNNBgDzUMW+JwXEDLcvyA12VU/gBcOhRUzm0lGOIJhmx
	VEgV8fKBsxH+2X4Z4sEj5f/3EbCSxhPN39kBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VDMFI4rkJJQRXrteq/pHkreHjA4ivVMoYODvYTUFwhU=;
	b=l/bpawWP509Itp2azdvDY91qesls63gSDmt2robfBgHEp6dbEzT8GOxsIczpMBKKjF
	cfaTT/gOBjU138iUVQQ9QBGiyXDDq+n/O775AZ8HLyuU4gzNHy54TpglkDJpYJN3Nday
	zP3036erl8RsHvl7YwEDBKDch16GZJEosLcA7d8l6zaNIdOX20hWxhPI7RXiret8YwUL
	l8na7BpDp5FQJ5cyOHRfsLwrw/EOaJE6E0n+KqT2ZKDPxsarFtVWGy4EcG0m9icY2nx5
	4u5FgiME6f/gSbrXWZRDcLd90ZOfPYayO1Nmv+sWOVGE/0tTQyMr8rEkT+C+S0gNOPwI
	6Kvw==
X-Gm-Message-State: AG10YOQ1k02bY8e/ZXa4YO3uQHHh6kUHW20EotHC3U9anrgwDnkYK/tf+OJq9CGIEKRhZWuRcZL1XGg7fjgRrP9r
X-Received: by 10.31.180.145 with SMTP id d139mr9806419vkf.83.1453738063407;
	Mon, 25 Jan 2016 08:07:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 08:07:24 -0800 (PST)
In-Reply-To: <CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
References: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
	<CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 16:07:24 +0000
Message-ID: <CAFEAcA-Qm+vgjPt3eGfGdzZ-JMUoZ0-2dMiR+q1JRVzosbdRrw@mail.gmail.com>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
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
X-TUID: 8JbAdL8Fqlfn

On 25 January 2016 at 13:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>> I'm trying to run AArch64 Big Endian image under QEMU that I built for
>> my x86-64 Ubuntu host from latest master branch and when I'm running
>> kernel I'm getting next error:
>>  > qemu: fatal: Trying to execute code outside RAM or ROM at 0x500208000080ffff
>>
>> Similar image built as Little Endian runs fine with same QEMU tool
>> (qemu-system-aarch64)
>>
>> So I'm wondering is it possible to run QEMU AArch64 Big Endian
>> emulation on x86-64 host?

It is not currently supported, no. However there are some patches
on the list[*] to add this support, so I expect a future QEMU version
will do this.

[*] https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg03025.html

thanks
-- PMM
