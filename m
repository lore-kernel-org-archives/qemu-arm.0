Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp739115wrd;
        Wed, 29 Aug 2018 08:19:03 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYrJWYg4pdtCCRyo9xlFNOTDG0GVQ6MyzB9htSNf2kgZZDBR3n2JGjaoy1AzE+vrTaZOFpp
X-Received: by 2002:ac8:2fc8:: with SMTP id m8-v6mr7362560qta.202.1535555943506;
        Wed, 29 Aug 2018 08:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535555943; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae9yQ6jg5Ss7EOqbe0MeghbsB1bG8KAl2yysYi8nOIAH3d8hz0S0UR8DQ8iMywgLs/
         Y/ce3j/wRC3iAYjsmZXQgGxMC1JdZ5/vPwWFHnOMBWBBfCBiE0Us1xWEmDmGxdPn14rs
         9bsIws+ULiRp5qX9IYH6gzXgmQyWhLHSsv28vGsfvft7J9cqGVf8eFppCeAVG/ZIJeSh
         VFxtQ1MJoyVR0Hqtz0cVgJ8ItnJ4ej0NeVnZvioiJklorupJkJwjeT78v6Rnbx7jmhcZ
         cGpReL4N4WrCFu6sGMbbg+FS3uDB19cZMOJrZ1J9t3JV7t135ktiTz14m34Khquqpr8L
         Kqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=/L0xpr9rbiKoSHYUu0UQNIgqQraG4rGmlUMZigUvIY8=;
        b=r2PapZ0zYFWmQNE9FlBaELhbGgfz2WW8FEUTm1e1/HhMKsEp5c/CKwvY6PENyYaDny
         mViTQ7XlDIEzLhx5TjQpqGGh2iqWqVIA9++Nz4ovzOx3KqcPALCprD8AYyvroyLND9jr
         7HZxBqVmkEIuyRJjXia8bLwFrkODl6+I0Fb2zJvbjPc6be7IlBy1cDQBBSU+ipYHkrV3
         cBbBwLa+jWr4vP3JsDbQNDth8X7WMJfFdxoNKcKGpZofzYXJhzqXB54FH41uGBU4dhiT
         okUhmyZlsFgIo4PZslA7DB3kMl0khKl+r4SVdBXtc7zG9vgCwhDtNDH1iruLiTW4XRKU
         OQIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1iSS+iI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67-v6si2070597qka.168.2018.08.29.08.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Aug 2018 08:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1iSS+iI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fv2FL-0003vi-1z
	for alex.bennee@linaro.org; Wed, 29 Aug 2018 11:19:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fv2FA-0003p3-Mt
	for qemu-arm@nongnu.org; Wed, 29 Aug 2018 11:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fv2F9-0000az-AH
	for qemu-arm@nongnu.org; Wed, 29 Aug 2018 11:18:52 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:47054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1fv2F9-0000am-3s; Wed, 29 Aug 2018 11:18:51 -0400
Received: by mail-qt0-x243.google.com with SMTP id d4-v6so6123558qtn.13;
	Wed, 29 Aug 2018 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/L0xpr9rbiKoSHYUu0UQNIgqQraG4rGmlUMZigUvIY8=;
	b=d1iSS+iIifJ6x/wE5RB9Z3jkQmY7YaT7fbMWDGjDIZElyFxM4i7wdxi+lqeePMoJce
	FG4jZFT8hd9S6QlktbtoxHoY4Tr9UtGNMXMuztrXgo/j9Jab3ZiLg32iYSdP2OMdqfD8
	aKQ0WKCILlOo2+yL5tE8XkgxnMpozrQ0XRDFMLRAFP8la8VlOmdss1HUWjxscuo0hs/f
	GGPclR10ZgVtWV072zJZAX5qcL+wW8qiaTIy8piO0iS3BxqZJpEwPXiq/0sptKatbUVy
	OH4LGeNKZOV0G/Htzh3d67NzsZ0mW8gXI/etjftDyYtkXvTlENVfYWkA/pDh19zpkArj
	vGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/L0xpr9rbiKoSHYUu0UQNIgqQraG4rGmlUMZigUvIY8=;
	b=DUwvzSF6hOdjyQsFET2BgGNUtGGr9TWDiQltDcdDa2nKumqn/OCvTrWLhGNAJTqRVw
	pvkC0Ya64Zq5XH+CTCux1hZf6VusyIWFe3iSeDwGEkrD+5lnrXfzpQLPx8DVLYmTufNk
	PSHLba5h7GA7ABbJ8J5B64cEZW7DCkJZI2dAymLnfxFiEMeSWP2Gn82fHMVw0ytAbNNa
	3m/pBvejYOFVx9mJxVC89TkbS92OBjzhI8x8JqxcrwLUwSnipNv30Vt+9opOORLFC753
	p4Al/PiTBMBvwUaP3fcaMoqxJZZ/U4tgmyy0IhuZnahVBYicWUzyd68+03V5qnPDg2Iy
	j1BA==
X-Gm-Message-State: APzg51CorVWVmCvyxk3d1tLUjoQlQm74NHKx5xRucQyxdYrnoAjxXMU0
	PvAbRe47kzXdgrBSyWX9Uqs=
X-Received: by 2002:ac8:6056:: with SMTP id
	k22-v6mr7125511qtm.94.1535555930658; 
	Wed, 29 Aug 2018 08:18:50 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	i125-v6sm2467647qke.36.2018.08.29.08.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Aug 2018 08:18:50 -0700 (PDT)
Date: Wed, 29 Aug 2018 11:18:49 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180829151848.GD3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-8-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA-ZVvytysV4M4oM-czE5zhxu-VJsd_mfgkp47QAVEtYXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-ZVvytysV4M4oM-czE5zhxu-VJsd_mfgkp47QAVEtYXA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH v5 07/13] target/arm: Add array for supported
 PMU events, generate PMCEID[01]
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aaron Lindsay <alindsay@amperecomputing.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14Bpx8xO5mp/

On Jul 17 17:06, Peter Maydell wrote:
> On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > This commit doesn't add any supported events, but provides the framework
> > for adding them. We store the pm_event structs in a simple array, and
> > provide the mapping from the event numbers to array indexes in the
> > supported_event_map array. Because the value of PMCEID[01] depends upon
> > which events are supported at runtime, generate it dynamically.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.c    | 20 +++++++++++++-------
> >  target/arm/cpu.h    | 10 ++++++++++
> >  target/arm/cpu64.c  |  2 --
> >  target/arm/helper.c | 37 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 60 insertions(+), 9 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 98790b1..2f5b16a 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -927,9 +927,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >      if (!cpu->has_pmu) {
> >          unset_feature(env, ARM_FEATURE_PMU);
> >          cpu->id_aa64dfr0 &= ~0xf00;
> > -    } else if (!kvm_enabled()) {
> > -        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> > -        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> > +    }
> > +    if (arm_feature(env, ARM_FEATURE_PMU)) {
> > +        uint64_t pmceid = get_pmceid(&cpu->env);
> > +        cpu->pmceid0 = pmceid & 0xffffffff;
> > +        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
> > +
> > +        if (!kvm_enabled()) {
> > +            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> > +            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> > +        }
> > +    } else {
> > +        cpu->pmceid0 = 0x00000000;
> > +        cpu->pmceid1 = 0x00000000;
> 
> This is ok for now, but we really need to sort out what we're
> doing for the interplay between feature bits and ID register
> values more generally (notably for '-cpu max'), so depending on
> when we do that work this might end up needing to change a bit
> to fit in.

Okay, I'll try to be on the lookout for this work.

> >      }
> >
> >      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> > @@ -1538,8 +1548,6 @@ static void cortex_a7_initfn(Object *obj)
> >      cpu->id_pfr0 = 0x00001131;
> >      cpu->id_pfr1 = 0x00011011;
> >      cpu->id_dfr0 = 0x02010555;
> > -    cpu->pmceid0 = 0x00000000;
> > -    cpu->pmceid1 = 0x00000000;
> >      cpu->id_afr0 = 0x00000000;
> >      cpu->id_mmfr0 = 0x10101105;
> >      cpu->id_mmfr1 = 0x40000000;
> > @@ -1581,8 +1589,6 @@ static void cortex_a15_initfn(Object *obj)
> >      cpu->id_pfr0 = 0x00001131;
> >      cpu->id_pfr1 = 0x00011011;
> >      cpu->id_dfr0 = 0x02010555;
> > -    cpu->pmceid0 = 0x0000000;
> > -    cpu->pmceid1 = 0x00000000;
> >      cpu->id_afr0 = 0x00000000;
> >      cpu->id_mmfr0 = 0x10201105;
> >      cpu->id_mmfr1 = 0x20000000;
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 852743b..430b8d5 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -964,6 +964,16 @@ void pmu_op_finish(CPUARMState *env);
> >  void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
> >  void pmu_post_el_change(ARMCPU *cpu, void *ignored);
> >
> > +/*
> > + * get_pmceid
> > + * @env: CPUARMState
> > + *
> > + * Return the PMCEID[01] register values corresponding to the counters which
> > + * are supported given the current configuration (0 is low 32, 1 is high 32
> > + * bits)
> > + */
> > +uint64_t get_pmceid(CPUARMState *env);
> > +
> >  /* SCTLR bit meanings. Several bits have been reused in newer
> >   * versions of the architecture; in that case we define constants
> >   * for both old and new bit meanings. Code which tests against those
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index c50dcd4..28482a0 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -141,8 +141,6 @@ static void aarch64_a57_initfn(Object *obj)
> >      cpu->id_isar5 = 0x00011121;
> >      cpu->id_aa64pfr0 = 0x00002222;
> >      cpu->id_aa64dfr0 = 0x10305106;
> > -    cpu->pmceid0 = 0x00000000;
> > -    cpu->pmceid1 = 0x00000000;
> >      cpu->id_aa64isar0 = 0x00011120;
> >      cpu->id_aa64mmfr0 = 0x00001124;
> >      cpu->dbgdidr = 0x3516d000;
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 5d83446..9f81747 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -964,6 +964,43 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
> >    return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
> >  }
> >
> > +typedef struct pm_event {
> > +    uint16_t number; /* PMEVTYPER.evtCount is 10 bits wide */
> > +    /* If the event is supported on this CPU (used to generate PMCEID[01]) */
> > +    bool (*supported)(CPUARMState *);
> > +    /* Retrieve the current count of the underlying event. The programmed
> > +     * counters hold a difference from the return value from this function */
> 
> Don't leave the */ dangling on the RHS of a multiline comment.
> (CODING_STYLE now recommends Linux-kernel style.)
> 
> > +    uint64_t (*get_count)(CPUARMState *);
> > +} pm_event;
> > +
> > +#define SUPPORTED_EVENT_SENTINEL UINT16_MAX
> > +static const pm_event pm_events[] = {
> > +    { .number = SUPPORTED_EVENT_SENTINEL }
> > +};
> > +static uint16_t supported_event_map[0x3f];
> 
> What is this hardcoded 0x3f ?

This was the maximum common event ID (i.e. bits in PMCEID[01]) as of
ARMv8.0. Obviously it should be a macro instead of a magic constant. I'm
also debating whether this should be the maximum supported by the
architecture or just the maximum supported by QEMU (particularly because
later ARM versions raise this number significantly).

> > +
> > +/*
> > + * Called upon initialization to build PMCEID0 (low 32 bits) and PMCEID1 (high
> > + * 32). We also use it to build a map of ARM event numbers to indices in
> > + * our pm_events array.
> > + */
> > +uint64_t get_pmceid(CPUARMState *env)
> > +{
> > +    uint64_t pmceid = 0;
> > +    unsigned int i = 0;
> > +    while (pm_events[i].number != SUPPORTED_EVENT_SENTINEL) {
> 
> Are we ever going to run through some other array than the
> constant pm_events[] ? We could just use ARRAY_SIZE rather
> than requiring a sentinel member.

No, I don't think so.

> 
> > +        const pm_event *cnt = &pm_events[i];
> > +        if (cnt->number < 0x3f && cnt->supported(env)) {
> 
> ...another 0x3f. Are we ever really going to see an
> out-of-range .number field, or should we just assert()
> that it's in range ?

In some places this can be set by user code via PMEVTYPER.evtCount, but
I think in this code an assert is the right way to handle it.

> 
> > +            pmceid |= (1 << cnt->number);
> > +            supported_event_map[cnt->number] = i;
> > +        } else {
> > +            supported_event_map[cnt->number] = SUPPORTED_EVENT_SENTINEL;
> 
> This will leave us with supported_event_map[] entries in
> one of three states:
>  * SUPPORTED_EVENT_SENTINEL if they have a specific pm_events[]
>    entry marked as not supported
>  * an index if they are supported
>  * zero if there is no pm_events[] entry
> 
> Don't the ones in the last category get confused with the
> real index 0?
> 
> Maybe this should initialize the whole array first to the
> sentinel value and then just fill in the supported ones with
> their index values?

I've re-written this code based on your feedback for v6, eliminating the
sentinel and initializing the entirety of supported_event_map.

-Aaron
