Received: by 10.182.158.201 with SMTP id ww9csp1172993obb;
        Fri, 18 Dec 2015 08:05:34 -0800 (PST)
X-Received: by 10.140.106.37 with SMTP id d34mr6158000qgf.77.1450454734192;
        Fri, 18 Dec 2015 08:05:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w74si16737391qka.65.2015.12.18.08.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 08:05:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9xXB-000524-TH
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 11:05:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a9xXA-00051o-77
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 11:05:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a9xX7-0001wa-1B
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 11:05:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a9xX6-0001wW-Qe; Fri, 18 Dec 2015 11:05:28 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 0F85B19F39B;
	Fri, 18 Dec 2015 16:05:27 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-59.brq.redhat.com [10.40.204.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIG5Ka1009710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Dec 2015 11:05:23 -0500
Date: Fri, 18 Dec 2015 10:05:19 -0600
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151218160519.GA3885@hawk.localdomain>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-7-git-send-email-drjones@redhat.com>
	<CAFEAcA9ENDZfeNFJgJOdv+O+iPXW6Sod-1vBYAj-ViysSiXReQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9ENDZfeNFJgJOdv+O+iPXW6Sod-1vBYAj-ViysSiXReQ@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
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
X-TUID: xowREI7sxWTR

On Fri, Dec 18, 2015 at 11:59:39AM +0000, Peter Maydell wrote:
> On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
> > Add the support needed for creating prstatus elf notes. This
> > allows us to use QMP dump-guest-memory.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> > +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                             int cpuid, void *opaque)
> > +{
> > +    struct aarch64_note note;
> > +    CPUARMState *env = &ARM_CPU(cs)->env;
> > +    DumpState *s = opaque;
> > +    uint64_t pstate, sp;
> > +    int ret, i;
> > +
> > +    aarch64_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
> > +
> > +    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
> > +
> > +    if (!is_a64(env)) {
> > +        aarch64_sync_32_to_64(env);
> > +        pstate = cpsr_read(env);
> > +        sp = aarch64_compat_sp(env);
> 
> I don't understand why we need to do this. If this is an
> AArch64 dump then we should just treat it as an AArch64
> dump, and presumably the consumer of the dump knows enough
> to know what the "hypervisor view" of a CPU that's currently
> in 32-bit mode is. It has to anyway to be able to figure
> out where all the other registers are, so why can't it
> also figure out what mode the CPU is currently in and thus
> where r13 is in the xregs array?

You're probably right that this shouldn't be necessary. But, in order for
it not to be necessary, I'll need to write another crash patch. Currently,
if you do a dump-guest-memory on a running guest, i.e. one where the kernel
has not called panic(), and thus the cpus are actually in 32-bit usermode,
rather than in the 64-bit cpu-stop IPI handler, then the crash utility
segfaults if sp == xregs[31]. crash does properly decode the registers
it digs out of the stack frame on a panic'ed cpu though, and setting sp
to aarch64_compat_sp here also allows crash to work properly in the non-
panic'd case.

So, I could teach crash to do what I'm doing here in qemu instead, but
there's still one more reason why it may make sense to do it here. That
reason is that I don't know what else to put in prstatus.pr_reg.sp. Does
xregs[31] make the most sense? or just zero? prstatus.pr_reg.pc is the
correct 32-bit userspace pc, prstatus.pr_reg.pstate is the correct cpsr,
so why not set sp to the correct userspace sp?

Thanks,
drew

> 
> > +    } else {
> > +        pstate = pstate_read(env);
> > +        sp = env->xregs[31];
> > +    }
> 
> thanks
> -- PMM
> 
