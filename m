Received: by 10.182.158.201 with SMTP id ww9csp8642obb;
        Fri, 20 Nov 2015 10:20:33 -0800 (PST)
X-Received: by 10.31.48.149 with SMTP id w143mr776484vkw.5.1448043633734;
        Fri, 20 Nov 2015 10:20:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u71si677237vkd.208.2015.11.20.10.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 10:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:49185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzqIT-0002HC-9R
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 13:20:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzqHY-0000yq-RN
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 13:19:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzqHX-0005Fv-4y
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 13:19:36 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzqHW-0005FI-R9
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 13:19:35 -0500
Received: by vkbs1 with SMTP id s1so2967149vkb.1
	for <qemu-devel@nongnu.org>; Fri, 20 Nov 2015 10:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bMA5D99/mJJMim95t0hZl7mUFJuAM/jprCBx5RV9tUs=;
	b=T/NsofxsluJ7BaX4M/OrKjGdgtMJa2guODNMM+ntjFXvDrhJHvBfgspcYd8LeoDUeb
	6kaVHoudAKsmpdtrHjSIbdE3oomfVM4ChnAmvWHgKg3Lye778WkOUO0G6XSyClf3THzF
	wg794Wg2iniY46tMBfj9S2VYA8zQPIVrIIQDH+01cgOn6RjOZo+P0XsZrP0hPtAOOxfq
	plmAkFz1NG7hSK8isOeKVX2vx7OoYlurZMjgNWw2B81mMa2imE0qvFpshckROrX5Y4pV
	nlXSmBf6kIIc2Z3Ysf4Lw94IgvETvJmVigazfAcG6/UqMSv62H5PUw+sUnmHfRkI0BtM
	Sz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bMA5D99/mJJMim95t0hZl7mUFJuAM/jprCBx5RV9tUs=;
	b=TdOqi+PNNpvlkuvydhc/yaqFloQlTh6Bt7DvVSt8po3/a4bpRCmPXYB80Y1vPy1kgg
	YMIwLHaZ+wRBorK8bGGsN2jLOSbQ4BnQG3Bmca5WhXji7WhjN7UMhAtIAj2hP1ZdjsSz
	JnW3AnzJS9tRIpZ51M4Ba4ITP0NgYQIo27FsS/w6Y+VezHXip05DIBF+XyDBfymdF7cL
	+VIbBPN3KgP8Djn5W+U2JYR7mTMLinpJyYi8P9BGMR7yTpRURhRm/44JevWV7axICKMO
	DVTiDd/1b5D5PFBtPYyYuB1BgW9H+CH0yi/ywWet6QaBtWO/7ymwTEfxfGkkLtn/dXdh
	CbYg==
X-Gm-Message-State: ALoCoQl6HbgHhGTZBJMvJQ1MmiQ+wh/0iFAkWLg8CmQBcRcl9knMeKGbArRL+llRZp3221BkmBIW
X-Received: by 10.31.131.201 with SMTP id f192mr759452vkd.90.1448043574244;
	Fri, 20 Nov 2015 10:19:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 10:19:14 -0800 (PST)
In-Reply-To: <1447944817-13286-6-git-send-email-drjones@redhat.com>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 18:19:14 +0000
Message-ID: <CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH 5/5] target-arm: support QMP
	dump-guest-memory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wLYoOAHAjWVf

On 19 November 2015 at 14:53, Andrew Jones <drjones@redhat.com> wrote:
> Add the support needed for creating prstatus elf notes. This
> allows us to use QMP dump-guest-memory.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target-arm/Makefile.objs |   3 +-
>  target-arm/arch_dump.c   | 222 +++++++++++++++++++++++++++++++++++++++++++++++
>  target-arm/cpu-qom.h     |   5 ++
>  target-arm/cpu.c         |   3 +
>  4 files changed, 231 insertions(+), 2 deletions(-)
>  create mode 100644 target-arm/arch_dump.c
>
> diff --git a/target-arm/Makefile.objs b/target-arm/Makefile.objs
> index 9460b409a5a1c..a80eb39743a78 100644
> --- a/target-arm/Makefile.objs
> +++ b/target-arm/Makefile.objs
> @@ -1,5 +1,5 @@
>  obj-y += arm-semi.o
> -obj-$(CONFIG_SOFTMMU) += machine.o
> +obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o
>  obj-$(CONFIG_KVM) += kvm.o
>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
>  obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
> @@ -7,6 +7,5 @@ obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
>  obj-y += translate.o op_helper.o helper.o cpu.o
>  obj-y += neon_helper.o iwmmxt_helper.o
>  obj-y += gdbstub.o
> -obj-$(CONFIG_SOFTMMU) += psci.o
>  obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
>  obj-y += crypto_helper.o
> diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
> new file mode 100644
> index 0000000000000..5822204e85c72
> --- /dev/null
> +++ b/target-arm/arch_dump.c
> @@ -0,0 +1,222 @@
> +/* Support for writing ELF notes for ARM architectures
> + *
> + * Copyright (C) 2015 Red Hat Inc.
> + *
> + * Author: Andrew Jones <drjones@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "cpu.h"
> +#include "elf.h"
> +#include "sysemu/dump.h"
> +
> +#define NOTE_NAME       "CORE"
> +#define NOTE_NAMESZ     5
> +
> +struct aarch64_user_regs {
> +    uint64_t regs[31];
> +    uint64_t sp;
> +    uint64_t pc;
> +    uint64_t pstate;
> +} QEMU_PACKED;

Do you have a pointer to the spec for the format this code is
writing out?

> +
> +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_regs) != 272);
> +
> +struct aarch64_elf_prstatus {
> +    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
> +    uint32_t pr_pid;
> +    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
> +                            offsetof(struct elf_prstatus, pr_ppid) */
> +    struct aarch64_user_regs pr_reg;
> +    int pr_fpvalid;
> +    char pad3[4];
> +} QEMU_PACKED;

No floating point registers?

> +
> +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
> +
> +struct aarch64_note {
> +    Elf64_Nhdr hdr;
> +    char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
> +    struct aarch64_elf_prstatus prstatus;
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
> +
> +static int
> +aarch64_write_elf64_note(WriteCoreDumpFunction f, CPUARMState *env,
> +                         int id, DumpState *s)
> +{
> +    struct aarch64_note note;
> +    int ret, i;
> +
> +    memset(&note, 0, sizeof(note));
> +
> +    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
> +    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
> +    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
> +
> +    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
> +    note.prstatus.pr_pid = cpu_to_dump32(s, id);
> +
> +    for (i = 0; i < 31; ++i) {
> +        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
> +    }
> +    note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
> +    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
> +    note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate_read(env));
> +
> +    ret = f(&note, sizeof(note), s);
> +    if (ret < 0) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +struct arm_user_regs {
> +    uint32_t regs[17];
> +    char pad[4];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct arm_user_regs) != 72);
> +
> +struct arm_elf_prstatus {
> +    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
> +    uint32_t pr_pid;
> +    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
> +                            offsetof(struct elf_prstatus, pr_ppid) */
> +    struct arm_user_regs pr_reg;
> +    int pr_fpvalid;
> +} QEMU_PACKED arm_elf_prstatus;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct arm_elf_prstatus) != 148);
> +
> +struct arm_note {
> +    Elf32_Nhdr hdr;
> +    char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
> +    struct arm_elf_prstatus prstatus;
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct arm_note) != 168);
> +
> +static int
> +arm_write_elf32_note(WriteCoreDumpFunction f, CPUARMState *env,
> +                     int id, DumpState *s)
> +{
> +    struct arm_note note;
> +    int ret, i;
> +
> +    memset(&note, 0, sizeof(note));
> +
> +    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
> +    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
> +    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
> +
> +    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
> +    note.prstatus.pr_pid = cpu_to_dump32(s, id);
> +
> +    for (i = 0; i < 16; ++i) {
> +        note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->regs[i]);
> +    }
> +    note.prstatus.pr_reg.regs[16] = cpu_to_dump32(s, cpsr_read(env));
> +
> +    ret = f(&note, sizeof(note), s);
> +    if (ret < 0) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> +                             int cpuid, void *opaque)
> +{
> +    CPUARMState *env = &ARM_CPU(cs)->env;
> +    int ret;
> +
> +    if (is_a64(env)) {

Are you really sure you want the core dump format to depend on
whether the CPU happens to be in 32-bit or 64-bit format at
the point in time we write it out? (Consider a 64-bit kernel
which happens to be running a 32-bit userspace binary.)

> +        ret = aarch64_write_elf64_note(f, env, cpuid, opaque);
> +    } else {
> +        ret = arm_write_elf32_note(f, env, cpuid, opaque);
> +    }
> +    return ret;
> +}
> +
> +int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> +                             int cpuid, void *opaque)
> +{
> +    return arm_write_elf32_note(f, &ARM_CPU(cs)->env, cpuid, opaque);
> +}
> +
> +int cpu_get_dump_info(ArchDumpInfo *info,
> +                      const GuestPhysBlockList *guest_phys_blocks)
> +{
> +    ARMCPU *cpu = ARM_CPU(first_cpu);
> +    CPUARMState *env = &cpu->env;
> +    int cur_el = arm_current_el(env), be;
> +    GuestPhysBlock *block;
> +    hwaddr lowest_addr = ULLONG_MAX;
> +
> +    /* Take a best guess at the phys_base. If we get it wrong then crash
> +     * will need '--machdep phys_offset=<phys-offset>' added to its command
> +     * line, which isn't any worse than assuming we can use zero, but being
> +     * wrong. This is the same algorithm the crash utility uses when
> +     * attempting to guess as it loads non-dumpfile formatted files.
> +     */
> +    QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
> +        if (block->target_start < lowest_addr) {
> +            lowest_addr = block->target_start;
> +        }
> +    }
> +
> +    if (is_a64(env)) {
> +        info->d_machine = EM_AARCH64;
> +        info->d_class = ELFCLASS64;
> +        if (cur_el == 0) {
> +            be = (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
> +        } else {
> +            be = (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
> +        }

Again, are you sure you want the core dump format to depend on
whether we currently happen to be executing a BE userspace
process?

> +        info->page_size = (1 << 16); /* aarch64 max pagesize */
> +        if (lowest_addr != ULLONG_MAX) {
> +            info->phys_base = lowest_addr;
> +        }
> +    } else {
> +        info->d_machine = EM_ARM;
> +        info->d_class = ELFCLASS32;
> +        be = (env->uncached_cpsr & CPSR_E) != 0;

Same remarks here.

(If you do want "BE state as of right this instant", this is
duplicating most of the logic from arm_cpu_is_big_endian().)

> +        info->page_size = (1 << 12);
> +        if (lowest_addr < UINT_MAX) {
> +            info->phys_base = lowest_addr;
> +        }
> +    }
> +
> +    info->d_endian = be ? ELFDATA2MSB : ELFDATA2LSB;
> +
> +    return 0;
> +}
> +
> +ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
> +{
> +    size_t note_size;
> +
> +    if (class == ELFCLASS64) {
> +        note_size = sizeof(struct aarch64_note);
> +    } else {
> +        note_size = sizeof(struct arm_note);
> +    }
> +
> +    return note_size * nr_cpus;
> +}
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 25fb1ce0f3f3d..5bd9b7bb9fa7e 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -221,6 +221,11 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>
> +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> +                             int cpuid, void *opaque);
> +int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> +                             int cpuid, void *opaque);
> +
>  /* Callback functions for the generic timer's timers. */
>  void arm_gt_ptimer_cb(void *opaque);
>  void arm_gt_vtimer_cb(void *opaque);
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 30739fc0dfa74..db91a3f9eb467 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -1428,6 +1428,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>
>      cc->disas_set_info = arm_disas_set_info;
>
> +    cc->write_elf64_note = arm_cpu_write_elf64_note;
> +    cc->write_elf32_note = arm_cpu_write_elf32_note;
> +
>      /*
>       * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
>       * the object in cpus -> dangling pointer after final
> --
> 2.4.3

thanks
-- PMM
