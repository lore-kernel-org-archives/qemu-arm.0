Received: by 10.182.158.201 with SMTP id ww9csp3692005obb;
        Thu, 3 Dec 2015 04:27:58 -0800 (PST)
X-Received: by 10.55.212.70 with SMTP id l67mr10432262qki.7.1449145678907;
        Thu, 03 Dec 2015 04:27:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d139si7921083qhd.89.2015.12.03.04.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 04:27:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:34952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4SzO-0007zv-Cc
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 07:27:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4SzL-0007yW-GN
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 07:27:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4SzK-0006E6-C3
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 07:27:55 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4SzK-0006Ds-6w
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 07:27:54 -0500
Received: by vkca188 with SMTP id a188so44514135vkc.0
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 04:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yHsmZvVg+xU8EUaMFjacFjVjS8pjmOse6ga5WRzi8L4=;
	b=Z6hjUVpMSAFkSO67SlrZS8JMYDb3lGMTyonPo76XPPBH38sPnimiQOj9KJQeE3fCUi
	L7nZMx3SXY1T6JA0QSN8ecC+SoJagRHsDM3iWFieWUKasbrLY9t4OG8ddb+5fS6Dw2gK
	z6KD+nPfOL16z4kAofFAVdgvDSHtOR6pmdNf88THvnseTwT9OvdoJxHwwt0azDL2Zn2E
	aXXzBCP2g36nz98veanf2O/V6eH/OsLoq3yD2sCQIpUA3Me/7ZFdLuwbOqiWTpqB35Ik
	tzxgABBx0YMKDshRUMYiS916E2OIARR5D9pDQrbm0qu5U+IjTqSi9g64cxqW7Q853R2d
	u1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yHsmZvVg+xU8EUaMFjacFjVjS8pjmOse6ga5WRzi8L4=;
	b=WzgTtsIRCU+zlODnx00m0b6xcf4rrnZ/kdLCExkkxBmJIUghwIvwSlHn9gqJ4hCCSD
	NyGhgA5Pj4t+bd/FFkPX+iYKkrAQt0F7skQvVr3dR/po8sXjIm13s1kV0qVIpic31RxR
	m0a/eD/675lbnDkrP9rWXTNCpcjy+cqvskPW72sYoyf4a95jJiT9yUt64QdPOqFjcFBB
	gl2wvPVpC+H4nwzscnNPoyTiEBKsjvMFNjrQxz9i5N8gHi87fIvTjozP4fRdwKscG6u4
	Q5Vkf7kh+Gzcvjs7xsedk7MIlxA/Ygc76j0rucnTDY53QFjLbHQYztsTIjgriqlK1Dw/
	haqA==
X-Gm-Message-State: ALoCoQk/YiiAhioCMMyrCi8mj+3FraJpBKw94Xy4Iql2KgX/wnCWV8mH0YikQEDTV5BTbeiEMW1y
X-Received: by 10.31.52.211 with SMTP id b202mr5761216vka.82.1449145673844;
	Thu, 03 Dec 2015 04:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 04:27:34 -0800 (PST)
In-Reply-To: <1448411877-22019-7-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-7-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 12:27:34 +0000
Message-ID: <CAFEAcA8FDB3KUUyu=3tHsBrfFNo7BxnFJa_-0bQe6=LF3KEs_Q@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v2 6/6] target-arm: dump-guest-memory: add
	fpregset notes
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
X-TUID: IzAzZPq6lWB3

On 25 November 2015 at 00:37, Andrew Jones <drjones@redhat.com> wrote:
> Also refactors note init code to avoid code duplication.

Can you squash those parts down into the preceding patch?

>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target-arm/arch_dump.c | 161 ++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 139 insertions(+), 22 deletions(-)
>
> diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
> index 5debe549d721d..8d74788411d79 100644
> --- a/target-arm/arch_dump.c
> +++ b/target-arm/arch_dump.c
> @@ -35,6 +35,16 @@ struct aarch64_user_regs {
>
>  QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_regs) != 272);
>
> +/* struct user_fpsimd_state from arch/arm64/include/uapi/asm/ptrace.h */

The kernel struct uses __uint128_t, not an array of uint64_t; that's
worth commenting because it clarifies what the expected format is.

> +struct aarch64_user_vfp_state {
> +    uint64_t vregs[64];
> +    uint32_t fpsr;
> +    uint32_t fpcr;
> +    char pad[8];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) != 528);
> +
>  /* struct elf_prstatus from include/uapi/linux/elfcore.h */
>  struct aarch64_elf_prstatus {
>      char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
> @@ -51,10 +61,77 @@ QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
>  struct aarch64_note {
>      Elf64_Nhdr hdr;
>      char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
> -    struct aarch64_elf_prstatus prstatus;
> +    union {
> +        struct aarch64_elf_prstatus prstatus;
> +        struct aarch64_user_vfp_state vfp;
> +    };
>  } QEMU_PACKED;
>
> -QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
> +#define AARCH64_NOTE_HEADER_SIZE offsetof(struct aarch64_note, prstatus)
> +#define AARCH64_PRSTATUS_NOTE_SIZE \
> +            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstatus))
> +#define AARCH64_FPREGSET_NOTE_SIZE \
> +            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_state))
> +
> +static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
> +                              Elf64_Word type, Elf64_Word descsz)
> +{
> +    memset(note, 0, sizeof(*note));
> +
> +    note->hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
> +    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
> +    note->hdr.n_type = cpu_to_dump32(s, type);
> +
> +    memcpy(note->name, NOTE_NAME, NOTE_NAMESZ);
> +}
> +
> +static void arm_write_vregs(uint64_t *vregs, int num_regs,
> +                            CPUARMState *env, DumpState *s)
> +{
> +    int i;
> +
> +    for (i = 0; i < num_regs; ++i) {
> +        vregs[i] = cpu_to_dump64(s, env->vfp.regs[i]);
> +    }
> +
> +    if (s->dump_info.d_endian == ELFDATA2MSB) {
> +        /* We must always swap vfp.regs's 2n and 2n+1 entries when
> +         * generating BE notes, because even big endian hosts use
> +         * 2n+1 for the high half.
> +         */
> +        for (i = 0; i < num_regs/2; ++i) {
> +            uint64_t tmp = vregs[2*i];
> +            vregs[2*i] = vregs[2*i+1];
> +            vregs[2*i+1] = tmp;
> +        }

This swapping is correct for AArch64, where the core dump format
is an array of 128 bit Qn register values (which in QEMU
are stored in vfp.regs[2n+1]:vfp.regs[2n] as a pair of 64
bit values). However it's wrong for AArch32, where the core
dump format is an array of 64-bit Dn register values, which
in QEMU are just in vfp.regs[n].

(See the comment in target-arm/cpu.h about VFP/Neon register
state and different views of the register bank.)

> +static int
> +arm_write_elf32_fpregset(WriteCoreDumpFunction f, CPUARMState *env,
> +                         int id, DumpState *s)
> +{
> +    struct arm_note note;
> +    int ret;
> +
> +    arm_note_init(&note, s, NT_FPREGSET, sizeof(note.vfp));
> +
> +    arm_write_vregs(note.vfp.vregs, 32, env, s);
> +
> +    note.vfp.fpscr = cpu_to_dump32(s, vfp_get_fpscr(env));

Do consumers care if we write out a dump with FP register
state for a CPU which doesn't implement FP? (For AArch64
FP is always present, but for AArch32 it may not be.)

thanks
-- PMM
