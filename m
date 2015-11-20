Received: by 10.182.158.201 with SMTP id ww9csp97993obb;
        Fri, 20 Nov 2015 13:41:40 -0800 (PST)
X-Received: by 10.31.5.132 with SMTP id 126mr1731847vkf.107.1448055700194;
        Fri, 20 Nov 2015 13:41:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u137si1582080vke.96.2015.11.20.13.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 13:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZztR4-0003jg-TK
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 16:41:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZztR1-0003ja-O5
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 16:41:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZztQx-0007gQ-2B
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 16:41:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ZztQw-0007gM-Np; Fri, 20 Nov 2015 16:41:30 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 87A82461C8;
	Fri, 20 Nov 2015 21:41:29 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-140.ams2.redhat.com [10.36.116.140])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id tAKLfMx7019289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 20 Nov 2015 16:41:25 -0500
Date: Fri, 20 Nov 2015 16:41:21 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151120214121.GC20402@hawk.localdomain>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
	<CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] target-arm: support QMP
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
X-TUID: ldGjXQW2MtNE

On Fri, Nov 20, 2015 at 06:19:14PM +0000, Peter Maydell wrote:
> On 19 November 2015 at 14:53, Andrew Jones <drjones@redhat.com> wrote:
> > Add the support needed for creating prstatus elf notes. This
> > allows us to use QMP dump-guest-memory.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target-arm/Makefile.objs |   3 +-
> >  target-arm/arch_dump.c   | 222 +++++++++++++++++++++++++++++++++++++++++++++++
> >  target-arm/cpu-qom.h     |   5 ++
> >  target-arm/cpu.c         |   3 +
> >  4 files changed, 231 insertions(+), 2 deletions(-)
> >  create mode 100644 target-arm/arch_dump.c
> >
> > diff --git a/target-arm/Makefile.objs b/target-arm/Makefile.objs
> > index 9460b409a5a1c..a80eb39743a78 100644
> > --- a/target-arm/Makefile.objs
> > +++ b/target-arm/Makefile.objs
> > @@ -1,5 +1,5 @@
> >  obj-y += arm-semi.o
> > -obj-$(CONFIG_SOFTMMU) += machine.o
> > +obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o
> >  obj-$(CONFIG_KVM) += kvm.o
> >  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
> >  obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
> > @@ -7,6 +7,5 @@ obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
> >  obj-y += translate.o op_helper.o helper.o cpu.o
> >  obj-y += neon_helper.o iwmmxt_helper.o
> >  obj-y += gdbstub.o
> > -obj-$(CONFIG_SOFTMMU) += psci.o
> >  obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
> >  obj-y += crypto_helper.o
> > diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
> > new file mode 100644
> > index 0000000000000..5822204e85c72
> > --- /dev/null
> > +++ b/target-arm/arch_dump.c
> > @@ -0,0 +1,222 @@
> > +/* Support for writing ELF notes for ARM architectures
> > + *
> > + * Copyright (C) 2015 Red Hat Inc.
> > + *
> > + * Author: Andrew Jones <drjones@redhat.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along
> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "cpu.h"
> > +#include "elf.h"
> > +#include "sysemu/dump.h"
> > +
> > +#define NOTE_NAME       "CORE"
> > +#define NOTE_NAMESZ     5
> > +
> > +struct aarch64_user_regs {
> > +    uint64_t regs[31];
> > +    uint64_t sp;
> > +    uint64_t pc;
> > +    uint64_t pstate;
> > +} QEMU_PACKED;
> 
> Do you have a pointer to the spec for the format this code is
> writing out?

Unfortunately not, and I just searched now again, but I can't anything
except for what I used, which is just struct user_pt_regs from
arch/arm64/include/uapi/asm/ptrace.h. Hmm, maybe we should add ptrace.h
to the update-linux-headers.sh script and then use it from there? We
would also update the other architectures reproducing their respective
structures in their respective arch_dump.c's as well.

> 
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_regs) != 272);
> > +
> > +struct aarch64_elf_prstatus {
> > +    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
> > +    uint32_t pr_pid;
> > +    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
> > +                            offsetof(struct elf_prstatus, pr_ppid) */
> > +    struct aarch64_user_regs pr_reg;
> > +    int pr_fpvalid;
> > +    char pad3[4];
> > +} QEMU_PACKED;
> 
> No floating point registers?

I have a patch for that written already, but I didn't post it with this
because crash doesn't seem to care about them. gdb could extract and display
the floating point registers, but gdb can't deal with the memory...

Anyway, particularly because I already wrote it, I'm not opposed to adding
it on to the series. The information won't be used by crash, but anybody who
cares can dig it out with gdb.

> 
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
> > +
> > +struct aarch64_note {
> > +    Elf64_Nhdr hdr;
> > +    char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
> > +    struct aarch64_elf_prstatus prstatus;
> > +} QEMU_PACKED;
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
> > +
> > +static int
> > +aarch64_write_elf64_note(WriteCoreDumpFunction f, CPUARMState *env,
> > +                         int id, DumpState *s)
> > +{
> > +    struct aarch64_note note;
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
> > +    for (i = 0; i < 31; ++i) {
> > +        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
> > +    }
> > +    note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
> > +    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
> > +    note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate_read(env));
> > +
> > +    ret = f(&note, sizeof(note), s);
> > +    if (ret < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +struct arm_user_regs {
> > +    uint32_t regs[17];
> > +    char pad[4];
> > +} QEMU_PACKED;
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct arm_user_regs) != 72);
> > +
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
> > +    if (is_a64(env)) {
> 
> Are you really sure you want the core dump format to depend on
> whether the CPU happens to be in 32-bit or 64-bit format at
> the point in time we write it out? (Consider a 64-bit kernel
> which happens to be running a 32-bit userspace binary.)

I simply forgot to consider the case where a 64-bit kernel would
run a 32-bit userspace binary. I'm actually quite sure we would
want 64-bit in that case, as crash is the only tool we're able to
generate dumps for at this time (gdb requires the 'paging' option
of dump-guest-memory to work). Is there something in the env I can
look at to determine that we have a 64-bit kernel? (Sorry for being
lazy and just asking, rather than reading...)

> 
> > +        ret = aarch64_write_elf64_note(f, env, cpuid, opaque);
> > +    } else {
> > +        ret = arm_write_elf32_note(f, env, cpuid, opaque);
> > +    }
> > +    return ret;
> > +}
> > +
> > +int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                             int cpuid, void *opaque)
> > +{
> > +    return arm_write_elf32_note(f, &ARM_CPU(cs)->env, cpuid, opaque);
> > +}
> > +
> > +int cpu_get_dump_info(ArchDumpInfo *info,
> > +                      const GuestPhysBlockList *guest_phys_blocks)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > +    CPUARMState *env = &cpu->env;
> > +    int cur_el = arm_current_el(env), be;
> > +    GuestPhysBlock *block;
> > +    hwaddr lowest_addr = ULLONG_MAX;
> > +
> > +    /* Take a best guess at the phys_base. If we get it wrong then crash
> > +     * will need '--machdep phys_offset=<phys-offset>' added to its command
> > +     * line, which isn't any worse than assuming we can use zero, but being
> > +     * wrong. This is the same algorithm the crash utility uses when
> > +     * attempting to guess as it loads non-dumpfile formatted files.
> > +     */
> > +    QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
> > +        if (block->target_start < lowest_addr) {
> > +            lowest_addr = block->target_start;
> > +        }
> > +    }
> > +
> > +    if (is_a64(env)) {
> > +        info->d_machine = EM_AARCH64;
> > +        info->d_class = ELFCLASS64;
> > +        if (cur_el == 0) {
> > +            be = (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
> > +        } else {
> > +            be = (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
> > +        }
> 
> Again, are you sure you want the core dump format to depend on
> whether we currently happen to be executing a BE userspace
> process?

We'll want to match the kernel. Hopefully we can determine it.

> 
> > +        info->page_size = (1 << 16); /* aarch64 max pagesize */
> > +        if (lowest_addr != ULLONG_MAX) {
> > +            info->phys_base = lowest_addr;
> > +        }
> > +    } else {
> > +        info->d_machine = EM_ARM;
> > +        info->d_class = ELFCLASS32;
> > +        be = (env->uncached_cpsr & CPSR_E) != 0;
> 
> Same remarks here.
> 
> (If you do want "BE state as of right this instant", this is
> duplicating most of the logic from arm_cpu_is_big_endian().)

I should have used that, but now that I know the instantaneous
endianness is not what I want, then I guess I'll need to come
up with something else anyway.

> 
> > +        info->page_size = (1 << 12);
> > +        if (lowest_addr < UINT_MAX) {
> > +            info->phys_base = lowest_addr;
> > +        }
> > +    }
> > +
> > +    info->d_endian = be ? ELFDATA2MSB : ELFDATA2LSB;
> > +
> > +    return 0;
> > +}
> > +
> > +ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
> > +{
> > +    size_t note_size;
> > +
> > +    if (class == ELFCLASS64) {
> > +        note_size = sizeof(struct aarch64_note);
> > +    } else {
> > +        note_size = sizeof(struct arm_note);
> > +    }
> > +
> > +    return note_size * nr_cpus;
> > +}
> > diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> > index 25fb1ce0f3f3d..5bd9b7bb9fa7e 100644
> > --- a/target-arm/cpu-qom.h
> > +++ b/target-arm/cpu-qom.h
> > @@ -221,6 +221,11 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >  int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
> >  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> >
> > +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                             int cpuid, void *opaque);
> > +int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                             int cpuid, void *opaque);
> > +
> >  /* Callback functions for the generic timer's timers. */
> >  void arm_gt_ptimer_cb(void *opaque);
> >  void arm_gt_vtimer_cb(void *opaque);
> > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > index 30739fc0dfa74..db91a3f9eb467 100644
> > --- a/target-arm/cpu.c
> > +++ b/target-arm/cpu.c
> > @@ -1428,6 +1428,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
> >
> >      cc->disas_set_info = arm_disas_set_info;
> >
> > +    cc->write_elf64_note = arm_cpu_write_elf64_note;
> > +    cc->write_elf32_note = arm_cpu_write_elf32_note;
> > +
> >      /*
> >       * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
> >       * the object in cpus -> dangling pointer after final
> > --
> > 2.4.3
> 
> thanks
> -- PMM
>

Thanks for the review!

drew 
