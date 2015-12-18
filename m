Received: by 10.182.158.201 with SMTP id ww9csp1268221obb;
        Fri, 18 Dec 2015 10:46:39 -0800 (PST)
X-Received: by 10.141.2.86 with SMTP id e83mr7760447qhd.64.1450464399082;
        Fri, 18 Dec 2015 10:46:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a130si17245608qhc.107.2015.12.18.10.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 10:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aA034-0008Jj-QF
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 13:46:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aA032-0008Is-IQ
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 13:46:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aA031-00040W-8n
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 13:46:36 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:32787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aA031-0003zl-3u
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 13:46:35 -0500
Received: by mail-vk0-x232.google.com with SMTP id a188so71265706vkc.0
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 10:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GugcYCOgaSAEXVTA5lrpeECEXaG3y3YYPd76zJcA06k=;
	b=ABv6DLOG4MhVPXTUch/jT320p25DWNpGsxN7VNDOGeCNSrLJm/5BxlevFv8Okj+rpf
	gy1zG8l328wScSIbNEYNQWG6oz8EX+fwIDNJorPUVvgGoaB++N4pcUCag7Fn6A2lDv85
	ihSydjG2Xpz1VQlXeJBzz684GoIY9eMng0C/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GugcYCOgaSAEXVTA5lrpeECEXaG3y3YYPd76zJcA06k=;
	b=mAx4I+wlt7pjqi4IT+bBsZ5tOULBUN2b2FAeaWaFvm0PvR9W4MnByg+q8jNvAclzfI
	iPPSq63Fdw+Vaj2yQAKW7xakuqodkxYwE8o2/wpL7GlfeoQE3xK/DBdpmdvws1Q5U3G2
	bTa9dfwTqu/KQVeUMCFrJzh3YHjm0iX3h0qUXk1IwmHV6T50ypcnd4HtKlUC8m27NJ5L
	RUitNiepAmJ6o6bJg4RPylVZNoq1wFu/5FIImL1Djb9lSyJCrJjx6GEDOGM4EyV0Yl/O
	EFy3DCwmQ+9icAMYifvUZWhQhowdOwZSiuLHHwOOyIptJ5xIj6tyDc05QAQ7QAg8w+R7
	YpEA==
X-Gm-Message-State: ALoCoQlN7yNN8R9hhtViYKUYPxdoMHG4KzoErO9ejawDjZHRI8JZ5/8Ra+Ne5BmrhihRMSUhs8VCaK0vl7keMzO/Ej4xOZ81hNsohqTprQP7kbLq1ICuj9Y=
X-Received: by 10.31.194.21 with SMTP id s21mr3269566vkf.92.1450464393424;
	Fri, 18 Dec 2015 10:46:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 10:46:14 -0800 (PST)
In-Reply-To: <20151218180530.GB3885@hawk.localdomain>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-7-git-send-email-drjones@redhat.com>
	<CAFEAcA9ENDZfeNFJgJOdv+O+iPXW6Sod-1vBYAj-ViysSiXReQ@mail.gmail.com>
	<20151218160519.GA3885@hawk.localdomain>
	<CAFEAcA9edBn4dqAzi0XfEPyEn04EtgL6zu3PBw-mZp6NCdUUJw@mail.gmail.com>
	<20151218180530.GB3885@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 18:46:14 +0000
Message-ID: <CAFEAcA9qm9p0u0jR4FnrgS7rjxwY7MiXcRckpEC0Dd06-VgPtQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/9] target-arm: support QMP
	dump-guest-memory
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
X-TUID: yJ6I9jAJTxEt

On 18 December 2015 at 18:05, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Dec 18, 2015 at 04:31:13PM +0000, Peter Maydell wrote:
>> On 18 December 2015 at 16:05, Andrew Jones <drjones@redhat.com> wrote:
>> > On Fri, Dec 18, 2015 at 11:59:39AM +0000, Peter Maydell wrote:
>> >> I don't understand why we need to do this. If this is an
>> >> AArch64 dump then we should just treat it as an AArch64
>> >> dump, and presumably the consumer of the dump knows enough
>> >> to know what the "hypervisor view" of a CPU that's currently
>> >> in 32-bit mode is. It has to anyway to be able to figure
>> >> out where all the other registers are, so why can't it
>> >> also figure out what mode the CPU is currently in and thus
>> >> where r13 is in the xregs array?
>> >
>> > You're probably right that this shouldn't be necessary. But, in order for
>> > it not to be necessary, I'll need to write another crash patch. Currently,
>> > if you do a dump-guest-memory on a running guest, i.e. one where the kernel
>> > has not called panic(), and thus the cpus are actually in 32-bit usermode,
>> > rather than in the 64-bit cpu-stop IPI handler, then the crash utility
>> > segfaults if sp == xregs[31]. crash does properly decode the registers
>> > it digs out of the stack frame on a panic'ed cpu though, and setting sp
>> > to aarch64_compat_sp here also allows crash to work properly in the non-
>> > panic'd case.
>>
>> If crash segfaults then that's clearly a bug in crash...
>> What is it expecting to see in the SP field?
>
> A valid stack pointer

But why? What does it do with it? (In any case a dump of a crashed
system could have any random rubbish in SP so the tool has to handle
it being something weird.)

>> > So, I could teach crash to do what I'm doing here in qemu instead, but
>> > there's still one more reason why it may make sense to do it here. That
>> > reason is that I don't know what else to put in prstatus.pr_reg.sp. Does
>> > xregs[31] make the most sense? or just zero? prstatus.pr_reg.pc is the
>> > correct 32-bit userspace pc, prstatus.pr_reg.pstate is the correct cpsr,
>> > so why not set sp to the correct userspace sp?
>>
>> Well, what spec are we following here? The most logical view
>
> With the shoehorning approach we're following the aarch64 ptrace spec,
> but putting arm32 registers in it. We then rely on the analysis tools
> to do the right thing when they see pstate has PSR_MODE32_BIT set, which
> all cpsr modes do.

Right, so the analysis tool already has to cope with the MODE32 bit
being set, and it can also figure out where the SP is (and which
other registers are currently live for 32-bit).

> The ptrace code in the kernel would return a real aarch32 view, i.e.
> only registers up to r15 and a cpsr. We can't do that here because we've
> committed to an EM_AARCH64 formatted core, and we only have one type of
> PRSTATUS note for that core type. Furthermore, we want to be able to
> return all the registers to handle dumps of 64-bit EL2 with 32-bit EL1s.
>
>> to me seems to be to say "you get the view of the system
>> that you get from a JTAG debugger or a hypervisor", which
>> is to say you see a 64-bit set of registers and it's the
>> debugger's job to decide which bits of those might be
>> interesting to view as 32-bit and what is actually "live"
>> 32 bit state.
>
> It appears that PRSTATUS aware tools don't currently work this way.
>
>>
>> From that point of view there is no valid AArch64 SP register
>> at this point in execution (xregs[31] for QEMU would be stale
>> state, so not a good choice I think).
>
> I suppose zero or all 1's are the safest choices for "undefined", but
> being undefined actually gives us freedom to use aarch64_compat_sp as
> well, which, to me, looks like a safer and more useful value.

It just doesn't really make sense to me to do this one bit of
work for the debug analysis tools when they already have to know
that 32-bit modes are special. We seem to end up with a function
in QEMU whose only purpose is working around a bug in the thing
consuming the coredump.

thanks
-- PMM
