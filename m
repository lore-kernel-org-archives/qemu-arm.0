Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1157087wrt;
        Tue, 27 Nov 2018 03:46:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5eBvlz7WF+05fIllzDdqLRojZwCCc1NuzEKjjky+eRGm8214dmeONEFXK308v9v+Guq49Yk
X-Received: by 2002:a0d:e887:: with SMTP id r129mr34015254ywe.54.1543319171525;
        Tue, 27 Nov 2018 03:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543319171; cv=none;
        d=google.com; s=arc-20160816;
        b=axHQaEBZEISpRNmqG+KoBKKZeVX/0zhkZR0WaXKbGiNvttVsXSwdaT3/615VP3cM1Y
         ToyFha5ZzLLbScQXd5Un4bTn4qKnw1uBflVLYMVwP1CiDUJBRAHuvbc3W+jKUmiVxZNu
         ESw67mAtA99xPOqulFSFC1/1n0uSuofeJ67cqV6xKZBbCKRZCFM2xxlSdeJTIRThocMk
         RLecRZjibzu+niC3TWZ+HyelulRFs06VyWbjLGqlECg1c977HsA1XsnBiXQwE9K/UX6w
         iD1croJ/5Go/LITS0E0wFbj325Ub7Nu3K2s9TBfIb/Dj416Hb4n1LvK79ytVnimwSXDP
         ybYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=oIpSDPMyL7ZUc1O0mGsfZ/Wf2iMOKcUGzg2yKrhuh58=;
        b=d8sQF9C5RI9J7BtqO+C2tjCe7bloWWSRuYkYYPeD1OV0+WSpb2MgiDSavHEmbAR19J
         k9ibRRc0NI2JHy/O3iqET9V551mo7FkfC/3cXS2B10obid8pK+exO2Ys/EDaRsblP6PZ
         BbusjLmwsvI6NbCasn/T+9ncbanneX7WfmZJkfzgNkupnp4PfuEzdSAas35oyrF5A2pL
         iaJi1I/51Uzi9ZH9oDHG2naA9U75zlz+wjlyRBQlhX00WATRmWz8gFxf1WkpsoXscYb6
         tUazPJn6jR05G2gfJsUlsJAm4LlBAPKfU/s5D+z9gOCf8vcgpwQnMKWRKbrS8gN+adVa
         R84A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2si2538839ywc.52.2018.11.27.03.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 03:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:41628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRbog-0001ao-To
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 06:46:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRboU-0001ZI-A3
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:45:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRboT-0002UP-5w
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:45:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:53006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRboM-0002Q6-NR; Tue, 27 Nov 2018 06:45:51 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 03:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="95610094"
Received: from sdommett-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.8.174])
	by orsmga008.jf.intel.com with ESMTP; 27 Nov 2018 03:45:44 -0800
Date: Tue, 27 Nov 2018 12:45:14 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181127114514.GB4393@caravaggio>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-4-sameo@linux.intel.com>
	<CAFEAcA98so9yyJN=qAhD=Kr6pi1xxfrxt28atqZ8ATVJYXTaMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA98so9yyJN=qAhD=Kr6pi1xxfrxt28atqZ8ATVJYXTaMg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/13] target: arm: Move all v7m
 helpers into their own file
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /G6Wcw91VZWt

Hi Peter,

On Tue, Nov 20, 2018 at 01:54:08PM +0000, Peter Maydell wrote:
> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> > In preparation for supporting TCG disablement on ARM, we move all TCG
> > related v7m helpers and APIs into their own file (m_helper.c for all
> > v*-m helpers).
> > arm_v7m_cpu_do_interrupt pulls a large number of static functions
> > out of helper.c into m_helper.c because it is TCG dependent.
> >
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> > ---
> >  target/arm/internals.h   |   37 +
> >  target/arm/helper.c      | 2209 +++-----------------------------------
> >  target/arm/m_helper.c    | 1892 ++++++++++++++++++++++++++++++++
> >  target/arm/Makefile.objs |    2 +-
> >  4 files changed, 2086 insertions(+), 2054 deletions(-)
> >  create mode 100644 target/arm/m_helper.c
> 
> > +/* Function used to synchronize QEMU's AArch64 register set with AArch32
> > + * register set.  This is necessary when switching between AArch32 and AArch64
> > + * execution state.
> > + */
> > +void aarch64_sync_32_to_64(CPUARMState *env)
> >  {
> > -    uint32_t new_ss_msp, new_ss_psp;
> > +    int i;
> > +    uint32_t mode = env->uncached_cpsr & CPSR_M;
> >
> > -    if (env->v7m.secure == new_secstate) {
> > -        return;
> > +    /* We can blanket copy R[0:7] to X[0:7] */
> > +    for (i = 0; i < 8; i++) {
> > +        env->xregs[i] = env->regs[i];
> >      }
> >
> > -    /* All the banked state is accessed by looking at env->v7m.secure
> > -     * except for the stack pointer; rearrange the SP appropriately.
> > +    /* Unless we are in FIQ mode, x8-x12 come from the user registers r8-r12.
> > +     * Otherwise, they come from the banked user regs.
> >       */
> > -    new_ss_msp = env->v7m.other_ss_msp;
> > -    new_ss_psp = env->v7m.other_ss_psp;
> > -
> > -    if (v7m_using_psp(env)) {
> > -        env->v7m.other_ss_psp = env->regs[13];
> > -        env->v7m.other_ss_msp = env->v7m.other_sp;
> > -    } else {
> > -        env->v7m.other_ss_msp = env->regs[13];
> > -        env->v7m.other_ss_psp = env->v7m.other_sp;
> > -    }
> > -
> > -    env->v7m.secure = new_secstate;
> > -
> > -    if (v7m_using_psp(env)) {
> > -        env->regs[13] = new_ss_psp;
> > -        env->v7m.other_sp = new_ss_msp;
> > +    if (mode == ARM_CPU_MODE_FIQ) {
> > +        for (i = 8; i < 13; i++) {
> > +            env->xregs[i] = env->usr_regs[i - 8];
> > +        }
> >      } else {
> > -        env->regs[13] = new_ss_msp;
> > -        env->v7m.other_sp = new_ss_psp;
> > +        for (i = 8; i < 13; i++) {
> > +            env->xregs[i] = env->regs[i];
> > +        }
> >      }
> > -}
> >
> > -void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
> > -{
> > -    /* Handle v7M BXNS:
> > -     *  - if the return value is a magic value, do exception return (like BX)
> > -     *  - otherwise bit 0 of the return value is the target security state
> > +    /* Registers x13-x23 are the various mode SP and FP registers. Registers
> > +     * r13 and r14 are only copied if we are in that mode, otherwise we copy
> > +     * from the mode banked register.
> >       */
> > -    uint32_t min_magic;
> > -
> > -    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> > -        /* Covers FNC_RETURN and EXC_RETURN magic */
> > -        min_magic = FNC_RETURN_MIN_MAGIC;
> > +    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
> > +        env->xregs[13] = env->regs[13];
> > +        env->xregs[14] = env->regs[14];
> >      } else {
> > -        /* EXC_RETURN magic only */
> > -        min_magic = EXC_RETURN_MIN_MAGIC;
> > +        env->xregs[13] = env->banked_r13[bank_number(ARM_CPU_MODE_USR)];
> > +        /* HYP is an exception in that it is copied from r14 */
> > +        if (mode == ARM_CPU_MODE_HYP) {
> > +            env->xregs[14] = env->regs[14];
> > +        } else {
> > +            env->xregs[14] = env->banked_r14[bank_number(ARM_CPU_MODE_USR)];
> > +        }
> >      }
> 
> This part of the patch is a mess to read. I suspect this is a
> combination of (a) your git not being configured to use a better
> diff algorithm than the default (try "algorithm = histogram"
> in the [diff] section of your .gitconfig), and it doing an effective
> revert of 593cfa2b637b92d37 by accident.
Yes, the unintentional and partial revert made the patch messy.
I fixed that.


> It's also an absolutely enormous patch, even for a "just
> moving code" patch, which makes it hard to review even
> with diff --color-moved. Maybe it would be better in two
> pieces ("helper routines for various insns" and "exception
> handling functions" seems like a workable split).
Splitting and fixing the original patch made things much easier to read,
thanks for the suggestion. See:
https://github.com/intel/nemu/pull/167/commits/5da42ba691bc05f3311332cfb3fe6db33b456904
https://github.com/intel/nemu/pull/167/commits/43cf20ed61e8c1f77d4706e29ba54df620a5091e

Cheers,
Samuel.
