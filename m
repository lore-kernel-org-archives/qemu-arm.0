Received: by 10.182.158.201 with SMTP id ww9csp147742obb;
        Thu, 3 Dec 2015 11:01:12 -0800 (PST)
X-Received: by 10.55.54.139 with SMTP id d133mr13239323qka.6.1449169272914;
        Thu, 03 Dec 2015 11:01:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si3061084qgj.55.2015.12.03.11.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 11:01:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Z7w-000701-Mo
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 14:01:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a4Z7u-0006zw-9O
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 14:01:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a4Z7p-0006h9-8Y
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 14:01:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a4Z7p-0006gn-1m; Thu, 03 Dec 2015 14:01:05 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 6C341351E61;
	Thu,  3 Dec 2015 19:01:04 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB3J0wtY004557
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Dec 2015 14:01:01 -0500
Date: Thu, 3 Dec 2015 13:00:57 -0600
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151203190057.GB4850@hawk.localdomain>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-7-git-send-email-drjones@redhat.com>
	<CAFEAcA8FDB3KUUyu=3tHsBrfFNo7BxnFJa_-0bQe6=LF3KEs_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8FDB3KUUyu=3tHsBrfFNo7BxnFJa_-0bQe6=LF3KEs_Q@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] target-arm:
 dump-guest-memory: add fpregset notes
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
X-TUID: fDkdWlC4lhKh

On Thu, Dec 03, 2015 at 12:27:34PM +0000, Peter Maydell wrote:
> On 25 November 2015 at 00:37, Andrew Jones <drjones@redhat.com> wrote:
> > Also refactors note init code to avoid code duplication.
> 
> Can you squash those parts down into the preceding patch?

Sure, but there wasn't any duplication of code in the first patch, only
the FP register notes introduce that possibility.

> 
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target-arm/arch_dump.c | 161 ++++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 139 insertions(+), 22 deletions(-)
> >
> > diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
> > index 5debe549d721d..8d74788411d79 100644
> > --- a/target-arm/arch_dump.c
> > +++ b/target-arm/arch_dump.c
> > @@ -35,6 +35,16 @@ struct aarch64_user_regs {
> >
> >  QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_regs) != 272);
> >
> > +/* struct user_fpsimd_state from arch/arm64/include/uapi/asm/ptrace.h */
> 
> The kernel struct uses __uint128_t, not an array of uint64_t; that's
> worth commenting because it clarifies what the expected format is.

OK

> 
> > +struct aarch64_user_vfp_state {
> > +    uint64_t vregs[64];
> > +    uint32_t fpsr;
> > +    uint32_t fpcr;
> > +    char pad[8];
> > +} QEMU_PACKED;
> > +
> > +QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) != 528);
> > +
> >  /* struct elf_prstatus from include/uapi/linux/elfcore.h */
> >  struct aarch64_elf_prstatus {
> >      char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
> > @@ -51,10 +61,77 @@ QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
> >  struct aarch64_note {
> >      Elf64_Nhdr hdr;
> >      char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
> > -    struct aarch64_elf_prstatus prstatus;
> > +    union {
> > +        struct aarch64_elf_prstatus prstatus;
> > +        struct aarch64_user_vfp_state vfp;
> > +    };
> >  } QEMU_PACKED;
> >
> > -QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
> > +#define AARCH64_NOTE_HEADER_SIZE offsetof(struct aarch64_note, prstatus)
> > +#define AARCH64_PRSTATUS_NOTE_SIZE \
> > +            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstatus))
> > +#define AARCH64_FPREGSET_NOTE_SIZE \
> > +            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_state))
> > +
> > +static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
> > +                              Elf64_Word type, Elf64_Word descsz)
> > +{
> > +    memset(note, 0, sizeof(*note));
> > +
> > +    note->hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
> > +    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
> > +    note->hdr.n_type = cpu_to_dump32(s, type);
> > +
> > +    memcpy(note->name, NOTE_NAME, NOTE_NAMESZ);
> > +}
> > +
> > +static void arm_write_vregs(uint64_t *vregs, int num_regs,
> > +                            CPUARMState *env, DumpState *s)
> > +{
> > +    int i;
> > +
> > +    for (i = 0; i < num_regs; ++i) {
> > +        vregs[i] = cpu_to_dump64(s, env->vfp.regs[i]);
> > +    }
> > +
> > +    if (s->dump_info.d_endian == ELFDATA2MSB) {
> > +        /* We must always swap vfp.regs's 2n and 2n+1 entries when
> > +         * generating BE notes, because even big endian hosts use
> > +         * 2n+1 for the high half.
> > +         */
> > +        for (i = 0; i < num_regs/2; ++i) {
> > +            uint64_t tmp = vregs[2*i];
> > +            vregs[2*i] = vregs[2*i+1];
> > +            vregs[2*i+1] = tmp;
> > +        }
> 
> This swapping is correct for AArch64, where the core dump format
> is an array of 128 bit Qn register values (which in QEMU
> are stored in vfp.regs[2n+1]:vfp.regs[2n] as a pair of 64
> bit values). However it's wrong for AArch32, where the core
> dump format is an array of 64-bit Dn register values, which
> in QEMU are just in vfp.regs[n].
> 
> (See the comment in target-arm/cpu.h about VFP/Neon register
> state and different views of the register bank.)

OK, I'll fix that. I thought I tested this already, but maybe not, as
I didn't check FP registers for every test case in the matrix in the
cover letter.

> 
> > +static int
> > +arm_write_elf32_fpregset(WriteCoreDumpFunction f, CPUARMState *env,
> > +                         int id, DumpState *s)
> > +{
> > +    struct arm_note note;
> > +    int ret;
> > +
> > +    arm_note_init(&note, s, NT_FPREGSET, sizeof(note.vfp));
> > +
> > +    arm_write_vregs(note.vfp.vregs, 32, env, s);
> > +
> > +    note.vfp.fpscr = cpu_to_dump32(s, vfp_get_fpscr(env));
> 
> Do consumers care if we write out a dump with FP register
> state for a CPU which doesn't implement FP? (For AArch64
> FP is always present, but for AArch32 it may not be.)

I don't know, but it should be easy to avoid writing them when FP
isn't present, based on some status, so I'll look into doing that.

Thanks,
drew
