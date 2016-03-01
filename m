Received: by 10.25.208.211 with SMTP id h202csp1777817lfg;
        Tue, 1 Mar 2016 10:43:52 -0800 (PST)
X-Received: by 10.140.128.21 with SMTP id 21mr30348739qha.36.1456857832501;
        Tue, 01 Mar 2016 10:43:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si20239466qka.89.2016.03.01.10.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 10:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aapGy-00049t-0b
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 13:43:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aapGv-00049g-Sk
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aapGu-0001bj-RO
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:43:49 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aapGu-0001bQ-KM; Tue, 01 Mar 2016 13:43:48 -0500
Received: by mail-wm0-x22d.google.com with SMTP id l68so46461403wml.1;
	Tue, 01 Mar 2016 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=CPMRcd3l+13I3exYsDe/JlLY/wJUYwN19MrfVsdT5Fs=;
	b=ALNlgTWdPkjEqCPGLN/+nLK+kANJn9thufjby0gloARTPD9hSoqXRQyzLjGmY10i7p
	EDb5y0dYTAmhv/OQP+QobRgIbRtaAKzljwSuTDgFdvqOXeVOdGHmh+tQsr+OzV6mALaj
	IQuasAXqq+IHX6BGbKZYCOt5sazUJw4EEd3/14FnRskrDbwkg7yFNtSsH3sibow/ffWm
	0wWslVkh7ujlZ1nQ9BHfyDlqMojlbMsAoQvtybV3POqJEW/6QSEcqIKj/6yA5uY/ESv9
	SkMOKHwiMgwntLCJbazj45bZqjUQYhOpxrvY46PiGwGoiF0/oAlr//5Maqpt98gPq7gC
	b5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=CPMRcd3l+13I3exYsDe/JlLY/wJUYwN19MrfVsdT5Fs=;
	b=harULdgDestpcvggwopX81fA9pTwldj46R68ibT6/M3QSP0LuQKHBe4wr3HGFVEj1k
	8Qd77XRS5ygAq6ZTc3CxHMOo5x26IROtoUO82lM/dBQ8quHqIOO7hqVRI8t3OKbcxaEj
	4+K227+HLF9zqrBT3QpeECKwKUoyLCEra1s8ZUAzV9Fm+ALVl5IR4y7Y088QwV+uwc5M
	2M29ajFVW0wwXD1qIVzTD3+k3o7aKbbhw4Loc6DdtZ630yvVCV1lhw7mCRq5pedJmm56
	mfNe+gvSDHGonTz5lbUSZ6/0k/hxmWo02XnL4Mu9q017OaSi4QGIiAsUIMFrgR/SuqS0
	gV4A==
X-Gm-Message-State: AD7BkJKUlOW+7fLalv/PiKjb5sLN3cKDkYBv9b7pNrSKglLt4mjBLKTe9uNYHArF4ScsIGJghsu03qM91Lk41w==
MIME-Version: 1.0
X-Received: by 10.28.146.209 with SMTP id u200mr463216wmd.59.1456857827905;
	Tue, 01 Mar 2016 10:43:47 -0800 (PST)
Received: by 10.28.157.197 with HTTP; Tue, 1 Mar 2016 10:43:47 -0800 (PST)
In-Reply-To: <56D52825.1010107@weilnetz.de>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<56D52825.1010107@weilnetz.de>
Date: Tue, 1 Mar 2016 10:43:47 -0800
Message-ID: <CAPokK=oGzBuvSKw7PFiwwzL0m_=bu7haNYqsyL_WV6PP6UfCyQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 00/17] ARM big-endian and
	setend support
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
X-TUID: FV1KAjlR7mQ5

On Mon, Feb 29, 2016 at 9:27 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 18.01.2016 um 08:12 schrieb Peter Crosthwaite:
>> Hi All,
>>
>> This patch series adds system-mode big-endian support for ARM. It also
>> implements the setend instruction, and loading of BE binaries even in
>> LE emulation mode.
>>
>> Based on Paolo's original work. I have moved all the BE32 related work
>> to the back of the series. Multiple parties are interested in the BE8
>> work just on its own, so that could potentially be merged w/o BE32.
>> PMM requested BE32 be at least thought out architecturally, so this
>> series sees BE32 functionality through.
>>
>> I have tested all of LE. BE8 and BE32 in both linux-user mode (for
>> regressions) and system mode (BE8 and BE32 are new here).
>> My test application is here, the README gives some example command
>> lines you can run:
>>
>> https://github.com/pcrost/arm-be-test
>>
>> Regards,
>> Peter
>
> It would be nice to get at least the emulation for 'setend' into the
> next version, because it is needed for the Raspberry Pi emulation.
>

BTW if you can link me binaries and a failing command line for the
failing rPI work I can test it, I am currently doing my own standalone
tests (of linux user as well).

Regards,
Peter

> Peter C., are you planning a new pull request? Maybe the number
> of commits needed can be reduced by adding the already reviewed
> ones to QEMU.
>
> Regards,
> Stefan
>
>
