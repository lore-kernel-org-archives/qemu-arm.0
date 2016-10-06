Received: by 10.80.163.71 with SMTP id 65csp3349589edn;
        Thu, 6 Oct 2016 10:48:40 -0700 (PDT)
X-Received: by 10.237.37.68 with SMTP id w4mr15138919qtc.112.1475776120100;
        Thu, 06 Oct 2016 10:48:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si1271130qkb.310.2016.10.06.10.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 10:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsCmc-0006Rg-V6
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 13:48:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsCmX-0006RU-17
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsCmV-0004yd-Sk
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:48:33 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsCmV-0004yD-5U
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:48:31 -0400
Received: by mail-vk0-x22c.google.com with SMTP id b186so24869421vkb.1
	for <qemu-arm@nongnu.org>; Thu, 06 Oct 2016 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FZykJVLExdFjfrphUpQFpTB+DwGH44qD5cYsJKyD0xo=;
	b=WkY9ndinKbt5RoXPjvAq08KnwT/X4Wgz4LpNZzBZXRgLlcRQ0yNuYy9NnsZy61v2zn
	2Fb/dKpo87aE4RxvBt+EA0ImVCoXUAZOodF8W9P58evpXqquXCttmmXeuM28IVisuHVR
	2dFQDLUsFJVlmDXjBRhf4IZKgyWkG2Doqrg30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FZykJVLExdFjfrphUpQFpTB+DwGH44qD5cYsJKyD0xo=;
	b=imLTOuIEsrmRIVYYmGkHn9/luO/eKwh9OtZWzKz+BOTZEfuw9K+Pi9UDIIZ9FDrVoq
	fN9qdl/B6qEGyh9ZDpcWXeKCT86oiHDmukDBrf/8iYAkDTyFuJEsJKoIZcI6t84c2k0s
	XdFT1Eq3q8ZO5tHeRp5i8yzvoQUHY1RGctAR3u8Z5p01AiDtl4nqZwlx7fzuruGePy48
	oHpE2ICVSHBziGW9SbhbhgcCOecGAC605GUPjTurNdcGVm8v3PlkcdyRDhP3c1y1DNEx
	XNIYQVhd+TxWF0+QAFx7HB0zqvXUn1xWTj3Pw1BE6o/HrU2HH7LAsJi4B/wZVMFJjMNR
	UGmg==
X-Gm-Message-State: AA6/9RnkhitoUbbGhsqrpueYxTZImdKKgWTfuFE4AM0oxL9n/aiRVRiNQ4ikdpdYbh8J3DlvtM4ieXebKd7Tc4ZS
X-Received: by 10.31.11.138 with SMTP id 132mr466690vkl.165.1475776110372;
	Thu, 06 Oct 2016 10:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 6 Oct 2016 10:48:09 -0700 (PDT)
In-Reply-To: <20161006165921.GD28109@toto>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
	<20161006165921.GD28109@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2016 18:48:09 +0100
Message-ID: <CAFEAcA_855eaHmu8gdHhbocmMujaJ9+ucm9Lqj31PLQP2t4g5Q@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH 0/3] preliminaries for GICv3 virt support
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jVkjC72Cfnpd

On 6 October 2016 at 17:59, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Oct 06, 2016 at 02:21:04PM +0100, Peter Maydell wrote:
>> This set of three straightforward patches is a preliminary
>> for adding virtualization support to the GICv3 emulation:
>>  * add a (nop implementation of) MDCCINT_EL1, since KVM
>>    will read/write it on worldswitch
>>  * fix some bugs in the GICv3 trace events
>>  * add trace events for the generic timers
>>    (which I have been using for debugging)
>>
>> I actually have almost all of the GICv3 virt code written,
>> but it currently has bugs which mean that a guest kernel
>> under KVM won't boot. Debugging in progress...
>
>
> That is very cool, we could soon enable EL2 :-)
>
> What kind of issues are you seeing?

The guest kernel just sits there like a lemon without printing
anything. Trying the kvm-unit-tests, the simple 'setup' test
works OK, but the one which tries to PSCI boot other SMP cores
fails.

> FWIW with our out of tree GICv2 virt models we've got issues
> with SMP Xen were things go nuts some times with virtual
> timer interrupts. Some times they take for ever to hit,
> like if we loose events.

Have you tried undoing the broken bit of virt.c that
marks the timer interrupts as edge triggered ?
(see 'hw/arm/virt: Don't incorrectly claim architectural timer
to be edge-triggered' in the branch below).

> Last time I looked at it, I noticed that our GICv2 virt
> implementation of the APR regs and EOIR stuff seems totally
> bogus (my bad).

Those were dodgy in original GICv2 for a long time...

https://git.linaro.org/people/peter.maydell/qemu-arm.git gicv3-virt
if you're interested in looking at my work-in-progress, though
as I say it is clearly badly broken right now.

thanks
-- PMM
