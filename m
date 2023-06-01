Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp531313ejb;
        Thu, 1 Jun 2023 08:29:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6N0Evj4qWXiEdSrNrZbhJ07Zi5pFbZtz0GV/y/hiZWvthhAxilVVpiPVO1F6DuG4fTTgqG
X-Received: by 2002:a05:6870:a888:b0:184:3981:add4 with SMTP id eb8-20020a056870a88800b001843981add4mr6640891oab.25.1685633348469;
        Thu, 01 Jun 2023 08:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685633348; cv=none;
        d=google.com; s=arc-20160816;
        b=rIgC41gbRL/RyE6YA4WdFFf/lhZzXsqbncBmyu4K90DBEyY9tzQeHk7osNtw8dy8mW
         GKkRwzbhcYFKZ9UcSwF3nABCGsuP6teP4PiJEa0TiU9brPyCAU4eUeF6WfCplqAUyiLH
         Vz22O7FR8t6J088b7FVx3XU/uNJJZbWVpXZUnW6GLF/xF/TxhA7ueGlVnywvCjteBzTV
         r6DhsXWSILrz4adoDm0F/o7ogHqtn+dSM3wBU+9g/0cO6+HMMC080s7O9KYTgCEXx8Wm
         sK+TaDSLTUH5GshraJD8eNGatv9bLGKx1/hpCYte4+NwSyaNzLzhkcJyGCjECMqqrADx
         sa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bNAV6Wtm3lOU+NRP5aSDeFma5wpzhxCxcO/l7sPeoZw=;
        b=aahQM83k4UUxScZlyK3A6lO9rIfrHV7A/eVsoykRrbIRtohX/2fU3/x8/H3vPH1fAi
         A0ETQj7hw6F5YgkWVNx8GpEjB+76uTD9eiZMCSKF45+IFj9ziLYjq9hcZBp51VMPOWQt
         Z4YIWPZfo4hqfASi+jKZxhnZSShavldnEfakuU5LKrh0ei0EuwdeGZVPhrHcWaVWcyfR
         B57PAQ9ZrsDOgCs2mGx+ztlqKMwbuAIid3dbtyu87/yOXRmdtBvKUmaYLSqgFdCqspdV
         UIJCF0cDTZmPF0zhBw2HVUCVMFqeXVCz53q83mUoH0ERFmmXWCrgVRjaeYwk28y4yRC3
         6caw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oka4Sma6;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id u4-20020a056870440400b0019fb031e67esi1833439oah.251.2023.06.01.08.29.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 08:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oka4Sma6;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E520A61CD8;
	Thu,  1 Jun 2023 15:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56291C433D2;
	Thu,  1 Jun 2023 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685633347;
	bh=vBJv4Uc0t8gua2ApVQioKbg9Il4lz1BvPgF/JwElDj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oka4Sma6u+AVM2PxFUaalPuy06uADBcKT81IaJMQ/3zqMoiK52u3sak9OSa5YdS0U
	 mjj2vDfgXwgLDVRn4AkI+KOghn7XBf3XqWo57rhQvmZ2bHhV2/wjCZAwr3JfAAnDJe
	 piTRlPcocJ9tF3NhbI4lPSG4SLeC5W4lDpM0ubnGdtPqXfr5IQDLD1D004tNgl6DS2
	 otHd5vG8nmGbH7Gx4sRpoq+9fsdh5nIqqMgqpyWXA3FVAxWKbmYFBRedmoaeKVleXP
	 LSpv46f/pnZQFPtxxqsssD+0fL/r/JUfBbaQHOKnKlNDkedwHjBDiAY825/X8wS78K
	 luWfyx0DZYg9w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b03d3e41fcso29592761fa.0;
        Thu, 01 Jun 2023 08:29:07 -0700 (PDT)
X-Gm-Message-State: AC+VfDw/+orrClIbfj+61d7UrY9OhlEACYoJ534VpPDi6R88yKRzLQmq
	cPcca8/Vf9qgJ7+/oDD1FlKvLz3BMG5VAb+afMs=
X-Received: by 2002:a2e:8195:0:b0:2a2:ac00:4de4 with SMTP id
 e21-20020a2e8195000000b002a2ac004de4mr829023ljg.22.1685633345317; Thu, 01 Jun
 2023 08:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230601123332.3297404-1-ardb@kernel.org> <20230601123332.3297404-2-ardb@kernel.org>
 <CAFEAcA_Z_3xNC6HjuyvRtf+s9pJjGsZeSZ87VG03J2yZZ60Wtw@mail.gmail.com>
In-Reply-To: <CAFEAcA_Z_3xNC6HjuyvRtf+s9pJjGsZeSZ87VG03J2yZZ60Wtw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Jun 2023 17:28:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEUUfvVRebCe0mAU5PBZzWHbe9r-1n2MOsJW+sDK86HcQ@mail.gmail.com>
Message-ID: <CAMj1kXEUUfvVRebCe0mAU5PBZzWHbe9r-1n2MOsJW+sDK86HcQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Use x86 intrinsics to implement PMULL.P64
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: pcVYAPeqJy90

On Thu, 1 Jun 2023 at 15:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 1 Jun 2023 at 13:33, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  host/include/i386/host/cpuinfo.h |  1 +
> >  target/arm/tcg/vec_helper.c      | 26 +++++++++++++++++++-
> >  util/cpuinfo-i386.c              |  1 +
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
> > index 073d0a426f31487d..cf4ced844760d28f 100644
> > --- a/host/include/i386/host/cpuinfo.h
> > +++ b/host/include/i386/host/cpuinfo.h
> > @@ -27,6 +27,7 @@
> >  #define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
> >  #define CPUINFO_ATOMIC_VMOVDQU  (1u << 17)
> >  #define CPUINFO_AES             (1u << 18)
> > +#define CPUINFO_PMULL           (1u << 19)
> >
> >  /* Initialized with a constructor. */
> >  extern unsigned cpuinfo;
> > diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
> > index f59d3b26eacf08f8..fb422627588439b3 100644
> > --- a/target/arm/tcg/vec_helper.c
> > +++ b/target/arm/tcg/vec_helper.c
> > @@ -25,6 +25,14 @@
> >  #include "qemu/int128.h"
> >  #include "vec_internal.h"
> >
> > +#ifdef __x86_64__
> > +#include "host/cpuinfo.h"
> > +#include <wmmintrin.h>
> > +#define TARGET_PMULL  __attribute__((__target__("pclmul")))
> > +#else
> > +#define TARGET_PMULL
> > +#endif
> > +
> >  /*
> >   * Data for expanding active predicate bits to bytes, for byte elements.
> >   *
> > @@ -2010,12 +2018,28 @@ void HELPER(gvec_pmul_b)(void *vd, void *vn, void *vm, uint32_t desc)
> >   * Because of the lanes are not accessed in strict columns,
> >   * this probably cannot be turned into a generic helper.
> >   */
> > -void HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
> > +void TARGET_PMULL HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
> >  {
> >      intptr_t i, j, opr_sz = simd_oprsz(desc);
> >      intptr_t hi = simd_data(desc);
> >      uint64_t *d = vd, *n = vn, *m = vm;
> >
> > +#ifdef __x86_64__
> > +    if (cpuinfo & CPUINFO_PMULL) {
> > +       switch (hi) {
> > +       case 0:
> > +               *(__m128i *)vd = _mm_clmulepi64_si128(*(__m128i *)vm, *(__m128i *)vn, 0x0);
> > +               break;
> > +       case 1:
> > +               *(__m128i *)vd = _mm_clmulepi64_si128(*(__m128i *)vm, *(__m128i *)vn, 0x11);
> > +               break;
> > +       default:
> > +               g_assert_not_reached();
> > +       }
> > +        return;
> > +    }
> > +#endif
>
> This needs to cope with the input vectors being more than
> just 128 bits wide, I think. Also you probably still
> need the clear_tail() to clear any high bits of the register.
>

Ah yes, I missed that completely.
