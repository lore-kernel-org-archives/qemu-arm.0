Received: by 10.182.158.201 with SMTP id ww9csp1190754obb;
        Fri, 18 Dec 2015 08:31:44 -0800 (PST)
X-Received: by 10.140.143.208 with SMTP id 199mr6754671qhp.84.1450456298967;
        Fri, 18 Dec 2015 08:31:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si16833344qgf.45.2015.12.18.08.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 08:31:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9xwQ-0007kG-Ig
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 11:31:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9xwM-0007dM-Jt
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 11:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9xwL-0000dj-Hs
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 11:31:34 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9xwL-0000dU-E5
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 11:31:33 -0500
Received: by mail-vk0-x229.google.com with SMTP id a188so69071671vkc.0
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 08:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=h0ROCbi45P8Z7SHmCCLOnn9dPDD3feQRG3ukWoXDpV0=;
	b=ceOxPQSIZYmo4Ypxf+Nl80yidhazRW1aUpAiAu+e1miLbNx4cVKk4eCSqlFaCCVG9j
	GTm8eSUrWbwIe/O88Ggb5gdBNTu1bHYbNbjJupGfHPfJlmExZt62MpkmxPmMSVgu7LR+
	q6joFEa5P0FsKI15OQADJ3pkLtFlA9i/izTLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h0ROCbi45P8Z7SHmCCLOnn9dPDD3feQRG3ukWoXDpV0=;
	b=kToT/ddQ1/76WBxlT/UjhU4BShP3dMDW0VVWcAi2vCC6S6sp75Q86mpYCAwU97kwCX
	H19VDRQQOwaY6C7KE+w5X5vxayaXdG5lHGGtXzZPp5Lnq/Tgh1FqXOZgLtayUyNA0d7n
	OJEfLfxzy2xUEvBfWjmDeqRTvW57uJ6TexFtuRYZ5oINR2gc2THEf46pc8IKtd94TLzn
	XO7xv3HCEuP9Q+Mbz5w7WYgZTOaiaFzCz68Tk1svkM0IRPsszs+Tr6yKRysdLbkcw9ll
	lmqhb0XeTvePvySUzAdrxZaFMN6CSLmcZwZyr+L4XS62lu9RbWQtNw2y9/4GBKDluxLu
	mstg==
X-Gm-Message-State: ALoCoQmtC2DkrIemy+IO19vmEFpuQE+7NvrD3IXo3vBg9A9sfk3ozvYuEuQvLTCVVRT+kQrUAamuIy/lefjL8lWl5dIvkpLH7guyWtrH4RkiAO7VkD3eSuI=
X-Received: by 10.31.194.21 with SMTP id s21mr2808366vkf.92.1450456292885;
	Fri, 18 Dec 2015 08:31:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 08:31:13 -0800 (PST)
In-Reply-To: <20151218160519.GA3885@hawk.localdomain>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-7-git-send-email-drjones@redhat.com>
	<CAFEAcA9ENDZfeNFJgJOdv+O+iPXW6Sod-1vBYAj-ViysSiXReQ@mail.gmail.com>
	<20151218160519.GA3885@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 16:31:13 +0000
Message-ID: <CAFEAcA9edBn4dqAzi0XfEPyEn04EtgL6zu3PBw-mZp6NCdUUJw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
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
X-TUID: KLs9CJRKddEc

On 18 December 2015 at 16:05, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Dec 18, 2015 at 11:59:39AM +0000, Peter Maydell wrote:
>> On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
>> > Add the support needed for creating prstatus elf notes. This
>> > allows us to use QMP dump-guest-memory.
>> >
>> > Signed-off-by: Andrew Jones <drjones@redhat.com>
>>
>> > +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>> > +                             int cpuid, void *opaque)
>> > +{
>> > +    struct aarch64_note note;
>> > +    CPUARMState *env = &ARM_CPU(cs)->env;
>> > +    DumpState *s = opaque;
>> > +    uint64_t pstate, sp;
>> > +    int ret, i;
>> > +
>> > +    aarch64_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
>> > +
>> > +    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
>> > +
>> > +    if (!is_a64(env)) {
>> > +        aarch64_sync_32_to_64(env);
>> > +        pstate = cpsr_read(env);
>> > +        sp = aarch64_compat_sp(env);
>>
>> I don't understand why we need to do this. If this is an
>> AArch64 dump then we should just treat it as an AArch64
>> dump, and presumably the consumer of the dump knows enough
>> to know what the "hypervisor view" of a CPU that's currently
>> in 32-bit mode is. It has to anyway to be able to figure
>> out where all the other registers are, so why can't it
>> also figure out what mode the CPU is currently in and thus
>> where r13 is in the xregs array?
>
> You're probably right that this shouldn't be necessary. But, in order for
> it not to be necessary, I'll need to write another crash patch. Currently,
> if you do a dump-guest-memory on a running guest, i.e. one where the kernel
> has not called panic(), and thus the cpus are actually in 32-bit usermode,
> rather than in the 64-bit cpu-stop IPI handler, then the crash utility
> segfaults if sp == xregs[31]. crash does properly decode the registers
> it digs out of the stack frame on a panic'ed cpu though, and setting sp
> to aarch64_compat_sp here also allows crash to work properly in the non-
> panic'd case.

If crash segfaults then that's clearly a bug in crash...
What is it expecting to see in the SP field?

> So, I could teach crash to do what I'm doing here in qemu instead, but
> there's still one more reason why it may make sense to do it here. That
> reason is that I don't know what else to put in prstatus.pr_reg.sp. Does
> xregs[31] make the most sense? or just zero? prstatus.pr_reg.pc is the
> correct 32-bit userspace pc, prstatus.pr_reg.pstate is the correct cpsr,
> so why not set sp to the correct userspace sp?

Well, what spec are we following here? The most logical view
to me seems to be to say "you get the view of the system
that you get from a JTAG debugger or a hypervisor", which
is to say you see a 64-bit set of registers and it's the
debugger's job to decide which bits of those might be
interesting to view as 32-bit and what is actually "live"
32 bit state.

From that point of view there is no valid AArch64 SP register
at this point in execution (xregs[31] for QEMU would be stale
state, so not a good choice I think).

thanks
-- PMM
