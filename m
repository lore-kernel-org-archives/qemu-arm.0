Received: by 10.182.158.201 with SMTP id ww9csp3668947obb;
        Thu, 3 Dec 2015 03:44:50 -0800 (PST)
X-Received: by 10.140.195.18 with SMTP id q18mr10918007qha.44.1449143090267;
        Thu, 03 Dec 2015 03:44:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s79si1317872qgs.31.2015.12.03.03.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 03:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:34770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4SJd-0000Op-VP
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 06:44:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4SJH-0008TS-1B
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 06:44:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4SJF-00081V-QZ
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 06:44:26 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4SJF-00081C-Ka
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 06:44:25 -0500
Received: by vkha189 with SMTP id a189so43389579vkh.2
	for <qemu-devel@nongnu.org>; Thu, 03 Dec 2015 03:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XspcgbvZsB0kHCUXPN+u5DM218PPIDeoMtHhcgVCnFQ=;
	b=bbBMfCQiCxCmibE9FbxZ5w2UgLpfg6LfsSk29WiAqVqUeF/ojtKIRvB5tQ5LPw0hDc
	0z2QKG3qBy/P9nPvGtateI3dygfjKaMyJxCxBjLL5oar2t6pFYpXwEtQcNiyvcoInewB
	3oataZCbg3Wk5h/W3XlmyFF9uQS+BLskEi8KN1xCP8nIQqjnBB3tnmnHr/HV+9X/zUBJ
	oKyQ/eTXPJiuBCeAhc3iYH4YEtnXgHZ1vKwIcIyN7MF3sekPTfJ/vXSOQWzKGX0g6RRq
	iJk0nbu8y/PlXGCzg1oi5QBHf+dObWFqryDxdo9mzwk8niHOobodX2rmQ4sSjxTxXB+o
	ND2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XspcgbvZsB0kHCUXPN+u5DM218PPIDeoMtHhcgVCnFQ=;
	b=iDheKpkJxLkbOkM20SS8dsHxV2UK/EiT4xm12Vu/3GztobzOzsZAFw4J0YX/OodOeN
	/g+pjyksH4FGA75wzlz7A6eOESYzPk3bV/pb018165IjC2pQjuX8S8I4fS4neW6snLgl
	DzuvxYJAJiDznNK6eK2wE/F4hex6O5CtJfRvvWc8ljDa/6bMVW7hjWETL4QmTqoAwbTo
	nObfcrP9JtnPTi05nxohPDaO/U9IrKXzGNaSd0KO3pOuq8TzJoRrDkr6c0FzUXBa3Sm6
	oVE6sHrC+dzkpZ37Xjdv0PABcRtrlJDLW3RNI2yuOkjkHy/THKh0xuq8vPdNFs6zadOt
	dkJA==
X-Gm-Message-State: ALoCoQnnDK0A7oVElLSGFqY1G2sm0R6RY5PrsI0h9tlsbp5LPA0AP+A8BNHZNMYEKfr0ga1jx9On
X-Received: by 10.31.180.87 with SMTP id d84mr5019059vkf.83.1449143065126;
	Thu, 03 Dec 2015 03:44:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 03:44:05 -0800 (PST)
In-Reply-To: <1448411877-22019-6-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-6-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 11:44:05 +0000
Message-ID: <CAFEAcA8+c5kOdBCSuVEgBf=Ga1chMiAV+rsLr4KNduTigQu7nQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v2 5/6] target-arm: support QMP
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
X-TUID: /6hiIC0QCuwc

On 25 November 2015 at 00:37, Andrew Jones <drjones@redhat.com> wrote:
> Add the support needed for creating prstatus elf notes. This
> allows us to use QMP dump-guest-memory.

> +
> +    if (is_a64(env)) {
> +        for (i = 0; i < 31; ++i) {
> +            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
> +        }
> +        note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
> +        note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
> +        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate_read(env));
> +    } else {
> +        aarch64_sync_64_to_32(env);
> +        for (i = 0; i < 16; ++i) {
> +            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->regs[i]);
> +        }
> +        note.prstatus.pr_reg.sp = note.prstatus.pr_reg.regs[13];
> +        note.prstatus.pr_reg.pc = note.prstatus.pr_reg.regs[15];
> +        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, cpsr_read(env));
> +    }

This doesn't look right. sync_64_to_32 is copying the state held
in the 64-bit env->xregs etc into the 32-bit env->regs. But if we're
in 32-bit state then the true state is in the 32-bit fields and
this will trash it. You want to sync_32_to_64 here, and then the
code to write the values to the dump is the same either way
(except for pstate vs cpsr which we haven't managed to clean up
and unify yet, sadly).

I think you want
   uint64_t pstate;
   [...]

   if (!is_a64(env)) {
       aarch64_sync_32_to_64(env);
       pstate = cpsr_read(env);
   } else {
       pstate = pstate_read(env);
   }
   for (i = 0; i < 31; ++i) {
       note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
   }
   note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
   note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
   note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate);

(Note that the 32-bit SP is not architecturally in X31;
it's in one of the other xregs, depending what mode the CPU
was in. For 32-bit userspace that will be USR and it's in X13.)


> +
> +    ret = f(&note, sizeof(note), s);
> +    if (ret < 0) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +/* struct pt_regs from arch/arm/include/asm/ptrace.h */
> +struct arm_user_regs {
> +    uint32_t regs[17];
> +    char pad[4];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct arm_user_regs) != 72);
> +
> +/* struct elf_prstatus from include/uapi/linux/elfcore.h */
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
> +    if (arm_el_is_aa64(env, 1)) {
> +        ret = aarch64_write_elf64_note(f, env, cpuid, opaque);
> +    } else {
> +        ret = arm_write_elf32_note(f, env, cpuid, opaque);
> +    }

This might produce the wrong kind of dump if we're in EL2
or EL3 at the point we take it (can only happen in emulation
and only once we add EL2 and EL3 emulation support, which isn't
active yet). Do we care?

thanks
-- PMM
