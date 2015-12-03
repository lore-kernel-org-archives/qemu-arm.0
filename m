Received: by 10.182.158.201 with SMTP id ww9csp144895obb;
        Thu, 3 Dec 2015 10:55:44 -0800 (PST)
X-Received: by 10.140.153.213 with SMTP id 204mr14227026qhz.30.1449168944216;
        Thu, 03 Dec 2015 10:55:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si9898356qki.50.2015.12.03.10.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 10:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Z2d-0004Hd-Q1
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 13:55:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a4Z2b-0004HY-7H
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 13:55:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a4Z2X-0002xb-Rb
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 13:55:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a4Z2X-0002x1-HQ; Thu, 03 Dec 2015 13:55:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 7E94A33E7E8;
	Thu,  3 Dec 2015 18:55:36 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB3ItUUI019048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Dec 2015 13:55:33 -0500
Date: Thu, 3 Dec 2015 12:55:29 -0600
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151203185529.GA4850@hawk.localdomain>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-6-git-send-email-drjones@redhat.com>
	<CAFEAcA8+c5kOdBCSuVEgBf=Ga1chMiAV+rsLr4KNduTigQu7nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8+c5kOdBCSuVEgBf=Ga1chMiAV+rsLr4KNduTigQu7nQ@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/6] target-arm: support QMP
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
X-TUID: xAsNSopDbXKw

On Thu, Dec 03, 2015 at 11:44:05AM +0000, Peter Maydell wrote:
> On 25 November 2015 at 00:37, Andrew Jones <drjones@redhat.com> wrote:
> > Add the support needed for creating prstatus elf notes. This
> > allows us to use QMP dump-guest-memory.
> 
> > +
> > +    if (is_a64(env)) {
> > +        for (i = 0; i < 31; ++i) {
> > +            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
> > +        }
> > +        note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
> > +        note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
> > +        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate_read(env));
> > +    } else {
> > +        aarch64_sync_64_to_32(env);
> > +        for (i = 0; i < 16; ++i) {
> > +            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->regs[i]);
> > +        }
> > +        note.prstatus.pr_reg.sp = note.prstatus.pr_reg.regs[13];
> > +        note.prstatus.pr_reg.pc = note.prstatus.pr_reg.regs[15];
> > +        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, cpsr_read(env));
> > +    }
> 
> This doesn't look right. sync_64_to_32 is copying the state held
> in the 64-bit env->xregs etc into the 32-bit env->regs. But if we're
> in 32-bit state then the true state is in the 32-bit fields and
> this will trash it. You want to sync_32_to_64 here, and then the
> code to write the values to the dump is the same either way
> (except for pstate vs cpsr which we haven't managed to clean up
> and unify yet, sadly).

Besides the unnecessary call to aarch64_sync_64_to_32(), then, for the
KVM case, the above code is correct. However, for the TCG case, I now
see why it's wrong.

The KVM case starts with 64-bit state, because this function is dealing
with 64-bit guest kernels. The TCG case, when userspace is running a
32-bit binary, starts with 32-bit state. In both cases we want to get
32-bit state into a 64-bit elf note. KVM needs aarch64_sync_64_to_32(),
which is actually already done by cpu_synchronize_all_states(), and
then to shoehorn the 32-bit registers into the 64-bit elf note, as done
above. TCG, on the other hand, doesn't need to sync any state, it just
needs to shoehorn. So the above aarch64_sync_64_to_32() call, which I
actually added *for* TCG (since I misunderstood your comment on v1),
actually makes it wrong. Needless to say, I didn't test TCG :-)

Now, to fix it, we could do what you have here below

> 
> I think you want
>    uint64_t pstate;
>    [...]
> 
>    if (!is_a64(env)) {
>        aarch64_sync_32_to_64(env);
>        pstate = cpsr_read(env);
>    } else {
>        pstate = pstate_read(env);
>    }
>    for (i = 0; i < 31; ++i) {
>        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
>    }

But, this adds an unnecessary aarch64_sync_32_to_64() call to the kvm
case (although it wouldn't hurt, as aarch64_sync_32_to_64 is the inverse
of aarch64_sync_64_to_32, which we've already done earlier). It also
always adds register values 16..30 to the elf note (which may not always
be zero in the 32-bit userspace case?). The way I have it above makes
sure those registers are zero in that case.

So, how about we just remove the aarch64_sync_64_to_32() from the code
I have above? Won't that make it work for both KVM and TCG?


>    note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
>    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
>    note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate);
> 
> (Note that the 32-bit SP is not architecturally in X31;
> it's in one of the other xregs, depending what mode the CPU
> was in. For 32-bit userspace that will be USR and it's in X13.)

Yup, that's why I was pulling it from x13 in the above code. In your
version you can now use x31, due to the aarch64_sync_32_to_64().

Anyway, I'll actually test with TCG for v3.

> 
> 
> > +
> > +    ret = f(&note, sizeof(note), s);
> > +    if (ret < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/* struct pt_regs from arch/arm/include/asm/ptrace.h */
> > +struct arm_user_regs {
> > +    uint32_t regs[17];
> > +    char pad[4];
> > +} QEMU_PACKED;
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct arm_user_regs) != 72);
> > +
> > +/* struct elf_prstatus from include/uapi/linux/elfcore.h */
> > +struct arm_elf_prstatus {
> > +    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
> > +    uint32_t pr_pid;
> > +    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
> > +                            offsetof(struct elf_prstatus, pr_ppid) */
> > +    struct arm_user_regs pr_reg;
> > +    int pr_fpvalid;
> > +} QEMU_PACKED arm_elf_prstatus;
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct arm_elf_prstatus) != 148);
> > +
> > +struct arm_note {
> > +    Elf32_Nhdr hdr;
> > +    char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
> > +    struct arm_elf_prstatus prstatus;
> > +} QEMU_PACKED;
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct arm_note) != 168);
> > +
> > +static int
> > +arm_write_elf32_note(WriteCoreDumpFunction f, CPUARMState *env,
> > +                     int id, DumpState *s)
> > +{
> > +    struct arm_note note;
> > +    int ret, i;
> > +
> > +    memset(&note, 0, sizeof(note));
> > +
> > +    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
> > +    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
> > +    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
> > +
> > +    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
> > +    note.prstatus.pr_pid = cpu_to_dump32(s, id);
> > +
> > +    for (i = 0; i < 16; ++i) {
> > +        note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->regs[i]);
> > +    }
> > +    note.prstatus.pr_reg.regs[16] = cpu_to_dump32(s, cpsr_read(env));
> > +
> > +    ret = f(&note, sizeof(note), s);
> > +    if (ret < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                             int cpuid, void *opaque)
> > +{
> > +    CPUARMState *env = &ARM_CPU(cs)->env;
> > +    int ret;
> > +
> > +    if (arm_el_is_aa64(env, 1)) {
> > +        ret = aarch64_write_elf64_note(f, env, cpuid, opaque);
> > +    } else {
> > +        ret = arm_write_elf32_note(f, env, cpuid, opaque);
> > +    }
> 
> This might produce the wrong kind of dump if we're in EL2
> or EL3 at the point we take it (can only happen in emulation
> and only once we add EL2 and EL3 emulation support, which isn't
> active yet). Do we care?

"care" is loaded word :-) If I can tweak this in some easy way now to get
it ready for el2/el3 emulation, then I'm happy to do so. However, without
a test environment, and without strong motivation to use this feature on
emulation in the first place, then I'd rather not bother for the initial
introduction of it. We can always modify it later.

Thanks,
drew
