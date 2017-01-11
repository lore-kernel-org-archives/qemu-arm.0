Received: by 10.25.205.13 with SMTP id d13csp830602lfg;
        Wed, 11 Jan 2017 09:00:38 -0800 (PST)
X-Received: by 10.55.195.148 with SMTP id r20mr9038859qkl.45.1484154038747;
        Wed, 11 Jan 2017 09:00:38 -0800 (PST)
Return-Path: <ehabkost@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h184si4172892qkf.91.2017.01.11.09.00.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jan 2017 09:00:38 -0800 (PST)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C64681240;
	Wed, 11 Jan 2017 17:00:37 +0000 (UTC)
Received: from localhost (ovpn-116-2.gru2.redhat.com [10.97.116.2])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v0BH0ZrC030196;
	Wed, 11 Jan 2017 12:00:36 -0500
Date: Wed, 11 Jan 2017 15:00:33 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: rth@twiddle.net, qemu-devel@nongnu.org,
        Peter Maydell <peter.maydell@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
        Laurent Vivier <laurent@vivier.eu>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alexander Graf <agraf@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        "open list:ARM" <qemu-arm@nongnu.org>,
        "open list:PowerPC" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v2 1/2] qom/cpu: move tlb_flush to cpu_common_reset
Message-ID: <20170111170033.GD3565@thinpad.lan.raisama.net>
References: <20161215123656.27985-1-alex.bennee@linaro.org>
 <20161215123656.27985-2-alex.bennee@linaro.org>
 <20161218204624.GA3808@thinpad.lan.raisama.net>
 <87tw98mfyw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tw98mfyw.fsf@linaro.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 11 Jan 2017 17:00:38 +0000 (UTC)
X-TUID: m4gY5ENNgz9G

On Mon, Jan 09, 2017 at 03:05:11PM +0000, Alex Bennée wrote:
> 
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Dec 15, 2016 at 12:36:55PM +0000, Alex Bennée wrote:
> >> It is a common thing amongst the various cpu reset functions want to
> >> flush the SoftMMU's TLB entries. This is done either by calling
> >> tlb_flush directly or by way of a general memset of the CPU
> >> structure (sometimes both).
> >>
> >> This moves the tlb_flush call to the common reset function and
> >> additionally ensures it is only done for the CONFIG_SOFTMMU case and
> >> when tcg is enabled.
> >>
> >> In some target cases we add an empty end_of_reset_fields structure to the
> >> target vCPU structure so have a clear end point for any memset which
> >> is resetting value in the structure before CPU_COMMON (where the TLB
> >> structures are).
> >>
> >> While this is a nice clean-up in general it is also a precursor for
> >> changes coming to cputlb for MTTCG where the clearing of entries
> >> can't be done arbitrarily across vCPUs. Currently the cpu_reset
> >> function is usually called from the context of another vCPU as the
> >> architectural power up sequence is run. By using the cputlb API
> >> functions we can ensure the right behaviour in the future.
> >>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Reviewed-by: Richard Henderson <rth@twiddle.net>
> >> ---
> >>  qom/cpu.c                   | 10 ++++++++--
> >>  target-arm/cpu.c            |  5 ++---
> >>  target-arm/cpu.h            |  5 ++++-
> >>  target-cris/cpu.c           |  3 +--
> >>  target-cris/cpu.h           |  9 ++++++---
> >>  target-i386/cpu.c           |  2 --
> >>  target-i386/cpu.h           |  6 ++++--
> >>  target-lm32/cpu.c           |  3 +--
> >>  target-lm32/cpu.h           |  3 +++
> >>  target-m68k/cpu.c           |  3 +--
> >>  target-m68k/cpu.h           |  3 +++
> >>  target-microblaze/cpu.c     |  3 +--
> >>  target-microblaze/cpu.h     |  3 +++
> >>  target-mips/cpu.c           |  3 +--
> >>  target-mips/cpu.h           |  3 +++
> >>  target-moxie/cpu.c          |  4 +---
> >>  target-moxie/cpu.h          |  3 +++
> >>  target-openrisc/cpu.c       |  9 +--------
> >>  target-openrisc/cpu.h       |  3 +++
> >>  target-ppc/translate_init.c |  3 ---
> >>  target-s390x/cpu.c          |  7 ++-----
> >>  target-s390x/cpu.h          |  5 +++--
> >>  target-sh4/cpu.c            |  3 +--
> >>  target-sh4/cpu.h            |  3 +++
> >>  target-sparc/cpu.c          |  3 +--
> >>  target-sparc/cpu.h          |  3 +++
> >>  target-tilegx/cpu.c         |  3 +--
> >>  target-tilegx/cpu.h         |  3 +++
> >>  target-tricore/cpu.c        |  2 --
> >>  29 files changed, 66 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/qom/cpu.c b/qom/cpu.c
> >> index 03d9190f8c..61ee0cb88c 100644
> >> --- a/qom/cpu.c
> >> +++ b/qom/cpu.c
> >> @@ -270,8 +270,14 @@ static void cpu_common_reset(CPUState *cpu)
> >>      cpu->exception_index = -1;
> >>      cpu->crash_occurred = false;
> >>
> >> -    for (i = 0; i < TB_JMP_CACHE_SIZE; ++i) {
> >> -        atomic_set(&cpu->tb_jmp_cache[i], NULL);
> >> +    if (tcg_enabled()) {
> >> +        for (i = 0; i < TB_JMP_CACHE_SIZE; ++i) {
> >> +            atomic_set(&cpu->tb_jmp_cache[i], NULL);
> >> +        }
> >> +
> >> +#ifdef CONFIG_SOFTMMU
> >> +        tlb_flush(cpu, 0);
> >> +#endif
> >
> > The patch is changing 3 things at the same time:
> >
> > 1) Moving the tb_jmp_cache reset inside if (tcg_enabled())
> 
> The tb_jump_cache only ever contains TranslationBlocks which are TCG
> only. Any access outside of TCG would be confusing stuff.
> 
> > 2) Moving the tlb_flush() call to cpu_common_reset()
> 
> This is the main purpose of the patch.
> 
> > 3) Moving the tlb_flush() call inside if (tcg_enabled())
> >
> > Are we 100% sure there's no non-TCG looking looking at tlb_*
> > fields or calling tlb_*() functions anywhere? Isn't it better to
> > add the tcg_enabled() check in a separate patch?
> 
> The tlb_* functions are NOP in-lines for linux-user mode. Otherwise the
> table is only accessed by generated SoftMMU code and the associated
> helpers. AFAICT the KVM migration code uses the memory sub-system to
> track the dirty state of pages so shouldn't be looking at those fields.
> 
> I seemed sensible to clean it up all in one patch, however I could split
> it into two:
> 
>   1) move tlb_flush (with CONFIG_SOFTMMU) to qom/cpu.c
>   2) wrap whole thing in tcg_enabled()
> 
> Would that be OK?

Sounds better to me. This is very likely to be safe, but it's
always better to separate trivial code movements from other
changes that could have unexpected side-effects or trigger hidden
bugs.

-- 
Eduardo
