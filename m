Received: by 10.182.158.201 with SMTP id ww9csp1302902obb;
        Fri, 18 Dec 2015 11:57:51 -0800 (PST)
X-Received: by 10.140.32.194 with SMTP id h60mr7581583qgh.79.1450468671289;
        Fri, 18 Dec 2015 11:57:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si2508208qga.10.2015.12.18.11.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 11:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aA19z-00085N-2B
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 14:57:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aA19w-00085B-8Q
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 14:57:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aA19s-0005WJ-7O
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 14:57:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aA19r-0005WD-VO; Fri, 18 Dec 2015 14:57:44 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 567CAC0B9331;
	Fri, 18 Dec 2015 19:57:43 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-59.brq.redhat.com [10.40.204.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIJva3M008437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Dec 2015 14:57:39 -0500
Date: Fri, 18 Dec 2015 13:57:35 -0600
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151218195735.GG3885@hawk.localdomain>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-7-git-send-email-drjones@redhat.com>
	<CAFEAcA9ENDZfeNFJgJOdv+O+iPXW6Sod-1vBYAj-ViysSiXReQ@mail.gmail.com>
	<20151218160519.GA3885@hawk.localdomain>
	<CAFEAcA9edBn4dqAzi0XfEPyEn04EtgL6zu3PBw-mZp6NCdUUJw@mail.gmail.com>
	<20151218180530.GB3885@hawk.localdomain>
	<CAFEAcA9qm9p0u0jR4FnrgS7rjxwY7MiXcRckpEC0Dd06-VgPtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9qm9p0u0jR4FnrgS7rjxwY7MiXcRckpEC0Dd06-VgPtQ@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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
X-TUID: 4x7FkcbAw5gJ

On Fri, Dec 18, 2015 at 06:46:14PM +0000, Peter Maydell wrote:
> On 18 December 2015 at 18:05, Andrew Jones <drjones@redhat.com> wrote:
> > On Fri, Dec 18, 2015 at 04:31:13PM +0000, Peter Maydell wrote:
> >> On 18 December 2015 at 16:05, Andrew Jones <drjones@redhat.com> wrote:
> >> > On Fri, Dec 18, 2015 at 11:59:39AM +0000, Peter Maydell wrote:
> >> >> I don't understand why we need to do this. If this is an
> >> >> AArch64 dump then we should just treat it as an AArch64
> >> >> dump, and presumably the consumer of the dump knows enough
> >> >> to know what the "hypervisor view" of a CPU that's currently
> >> >> in 32-bit mode is. It has to anyway to be able to figure
> >> >> out where all the other registers are, so why can't it
> >> >> also figure out what mode the CPU is currently in and thus
> >> >> where r13 is in the xregs array?
> >> >
> >> > You're probably right that this shouldn't be necessary. But, in order for
> >> > it not to be necessary, I'll need to write another crash patch. Currently,
> >> > if you do a dump-guest-memory on a running guest, i.e. one where the kernel
> >> > has not called panic(), and thus the cpus are actually in 32-bit usermode,
> >> > rather than in the 64-bit cpu-stop IPI handler, then the crash utility
> >> > segfaults if sp == xregs[31]. crash does properly decode the registers
> >> > it digs out of the stack frame on a panic'ed cpu though, and setting sp
> >> > to aarch64_compat_sp here also allows crash to work properly in the non-
> >> > panic'd case.
> >>
> >> If crash segfaults then that's clearly a bug in crash...
> >> What is it expecting to see in the SP field?
> >
> > A valid stack pointer
> 
> But why? What does it do with it? (In any case a dump of a crashed
> system could have any random rubbish in SP so the tool has to handle
> it being something weird.)

The reason crash segfaults is because sp (xregs[31]) wasn't a user stack
address, and thus it expected the stack to include at least two frames,
which would mean fp would be non-zero, but it's not, and that leads to the
calculation of a bad stack pointer which then gets used as an offset into
the stack buffer, overflowing it. This is definitely a crash bug that
should be fixed. I'll report it.

Also, crash's arm64_get_dumpfile_stackframe() simply assumes sp will be
the stack pointer, and it doesn't check pstate for the MODE32 bit first.
I think it should be easy to fix this, as I only found two places that
should be changed. I'll send a patch for that.

> 
> >> > So, I could teach crash to do what I'm doing here in qemu instead, but
> >> > there's still one more reason why it may make sense to do it here. That
> >> > reason is that I don't know what else to put in prstatus.pr_reg.sp. Does
> >> > xregs[31] make the most sense? or just zero? prstatus.pr_reg.pc is the
> >> > correct 32-bit userspace pc, prstatus.pr_reg.pstate is the correct cpsr,
> >> > so why not set sp to the correct userspace sp?
> >>
> >> Well, what spec are we following here? The most logical view
> >
> > With the shoehorning approach we're following the aarch64 ptrace spec,
> > but putting arm32 registers in it. We then rely on the analysis tools
> > to do the right thing when they see pstate has PSR_MODE32_BIT set, which
> > all cpsr modes do.
> 
> Right, so the analysis tool already has to cope with the MODE32 bit
> being set, and it can also figure out where the SP is (and which
> other registers are currently live for 32-bit).
> 
> > The ptrace code in the kernel would return a real aarch32 view, i.e.
> > only registers up to r15 and a cpsr. We can't do that here because we've
> > committed to an EM_AARCH64 formatted core, and we only have one type of
> > PRSTATUS note for that core type. Furthermore, we want to be able to
> > return all the registers to handle dumps of 64-bit EL2 with 32-bit EL1s.
> >
> >> to me seems to be to say "you get the view of the system
> >> that you get from a JTAG debugger or a hypervisor", which
> >> is to say you see a 64-bit set of registers and it's the
> >> debugger's job to decide which bits of those might be
> >> interesting to view as 32-bit and what is actually "live"
> >> 32 bit state.
> >
> > It appears that PRSTATUS aware tools don't currently work this way.
> >
> >>
> >> From that point of view there is no valid AArch64 SP register
> >> at this point in execution (xregs[31] for QEMU would be stale
> >> state, so not a good choice I think).
> >
> > I suppose zero or all 1's are the safest choices for "undefined", but
> > being undefined actually gives us freedom to use aarch64_compat_sp as
> > well, which, to me, looks like a safer and more useful value.
> 
> It just doesn't really make sense to me to do this one bit of
> work for the debug analysis tools when they already have to know
> that 32-bit modes are special. We seem to end up with a function
> in QEMU whose only purpose is working around a bug in the thing
> consuming the coredump.

OK, I've come around to your point of view. What value would you like
me to put in sp? 0, 1's, or ??

Thanks,
drew
