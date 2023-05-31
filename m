Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp92782ejb;
        Wed, 31 May 2023 09:47:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/rUBy4tX5z3cn1EHthmeNZyHorQSNVZi8j66izm8yb2BwaaPE0BIk35mjpTdkFQdAIe19
X-Received: by 2002:a05:6830:2099:b0:6a5:e9ad:3990 with SMTP id y25-20020a056830209900b006a5e9ad3990mr2977583otq.26.1685551637447;
        Wed, 31 May 2023 09:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685551637; cv=none;
        d=google.com; s=arc-20160816;
        b=kY2XA8x4wgTTzQ77hX88gewXyvVo3N8pKvzeCHc3p5vKPt1njmMuPhdsuvakLrmE2C
         e2fL6Mhed+5t93p43D2Rc8p5UIG+kx1stGRtAqyp7bI4WZ7so0wdD68dO5vh7T6Hjve+
         SpIrAbpomuH/k58ZApYXzGGaPwwj+k8kHkV31/oDDLFmMRkAgPBGkF664PUl60wBiThR
         9DeWpD/9o2HgBzMEJiyFgjWI1WwiXnK/lh+LUnAUuTEdr4qY6NfoFD7BnIcSHN34Ce9p
         0TfMiNYBouYXABwtor0phXpE4dEPKZK3vHiJOya4p8irOVwfWBOTSuNmleapGFXWm0hx
         ctiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V+5uh1dx954yDM+NXOH/phpEgceCwe6D12FGJexmWG4=;
        b=rq+1ooUtdQh7nyc4U7V+HlkAd5ZPm78HiFD7cJ28wc1o1gqx8KYsFy3Q81KFvAfsux
         eioO038biZGj+3YwCctI4PovDXdFRchIBJM6cp32mSn2dqro5xM+/MyNBq83f5wDd0Lj
         xv7pO/8GX4fpjDPPWsCIXGUmS6Rgq4YIesJN3N4bsj7Ov98c1KTTB2DyGvxkdEgehbaP
         oRVSbq+2SkU2FZV7kH35YDB7mKJownDoXORLX8ynh+zgysRa/eHpQUH0Qf946VHJGRVZ
         oAQPtasZDfOX2CtmLVxO09iu8eMoBmTpkdQLwq4aMn3etmEPjSxRYCJfN+cTro7gDKJh
         1rGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OEiC0aF9;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id b1-20020a056830310100b006ab21cecd38si864424ots.199.2023.05.31.09.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 May 2023 09:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OEiC0aF9;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20FE560DE9;
	Wed, 31 May 2023 16:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AD7C4339B;
	Wed, 31 May 2023 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685551636;
	bh=hWQvyC99yol6jcmVA70uv8y0HTzTSGZUK01vDfymdiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OEiC0aF9crMv8JtI7+tX7XBMSYwSURF936T+2x93tv8WE6JGmMHgNZD08EXp0Fssk
	 jT/tMJkfqM7m+ufxyLUtiNy66fA9RC/e7Fnou7iiA8W3lp48L1l3hB+qzGbzgB9yfd
	 W5UyP3RFTdDFiB14aFzGOYS7AjsBSQSV+RQs8HOcoN+prTzF3e7bRMCe2MEoIa4Sx0
	 1kZoSjag36UniZoN3zuSiDSYDy8qXMe7OlyluskwjEcmgynfNVlxoviunYtj82GvUJ
	 Vcxy1ToqOidCKOUKwhF0r812Yc7dxZ7nHOI2SEJwoHBsC3XfDvdLIeAT+mDPX5zhbn
	 4tfijasLjxZ4A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2af30a12e84so66138461fa.0;
        Wed, 31 May 2023 09:47:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDyo2jX90pTo8XnAUN6+irXRE4PtJdu/6yjrlM0Ixn88kT4oUNoI
	ec6LAW/4YaK9SrEkWZba8/L9ZuSDKOSQijZ4pMk=
X-Received: by 2002:a2e:8050:0:b0:2a8:c75d:8167 with SMTP id
 p16-20020a2e8050000000b002a8c75d8167mr3179610ljg.4.1685551634509; Wed, 31 May
 2023 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230531112239.3164777-1-ardb@kernel.org> <722d7683-80b4-bb23-3ca2-77f8de23b801@linaro.org>
In-Reply-To: <722d7683-80b4-bb23-3ca2-77f8de23b801@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 31 May 2023 18:47:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEH4zFcOZGz0HvTbpcMUup+cyZEr0JQxH1uXpGcbAc6ow@mail.gmail.com>
Message-ID: <CAMj1kXEH4zFcOZGz0HvTbpcMUup+cyZEr0JQxH1uXpGcbAc6ow@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Implement AES on ARM using x86 instructions and vv
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6RHl6rVZ4Ayu

On Wed, 31 May 2023 at 18:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/31/23 04:22, Ard Biesheuvel wrote:
> > Use the host native instructions to implement the AES instructions
> > exposed by the emulated target. The mapping is not 1:1, so it requires a
> > bit of fiddling to get the right result.
> >
> > This is still RFC material - the current approach feels too ad-hoc, but
> > given the non-1:1 correspondence, doing a proper abstraction is rather
> > difficult.
> >
> > Changes since v1/RFC:
> > - add second patch to implement x86 AES instructions on ARM hosts - this
> >    helps illustrate what an abstraction should cover.
> > - use cpuinfo framework to detect host support for AES instructions.
> > - implement ARM aesimc using x86 aesimc directly
> >
> > Patch #1 produces a 1.5-2x speedup in tests using the Linux kernel's
> > tcrypt benchmark (mode=500)
> >
> > Patch #2 produces a 2-3x speedup. The discrepancy is most likely due to
> > the fact that ARM uses two instructions to implement a single AES round,
> > whereas x86 only uses one.
>
> Thanks.  I spent some time yesterday looking at this, with an encrypted disk test case and
> could only measure 0.6% and 0.5% for total overhead of decrypt and encrypt respectively.
>

I don't understand what 'overhead' means in this context. Are you
saying you saw barely any improvement?

> > As for the design of an abstraction: I imagine we could introduce a
> > host/aes.h API that implements some building blocks that the TCG helper
> > implementation could use.
>
> Indeed.  I was considering interfaces like
>
> /* Perform SubBytes + ShiftRows on state. */
> Int128 aesenc_SB_SR(Int128 state);
>
> /* Perform MixColumns on state. */
> Int128 aesenc_MC(Int128 state);
>
> /* Perform SubBytes + ShiftRows + MixColumns on state. */
> Int128 aesenc_SB_SR_MC(Int128 state);
>
> /* Perform SubBytes + ShiftRows + MixColumns + AddRoundKey. */
> Int128 aesenc_SB_SR_MC_AK(Int128 state, Int128 roundkey);
>
> and so forth for aesdec as well.  All but aesenc_MC should be implementable on x86 and
> Power7, and all of them on aarch64.
>

aesenc_MC() can be implemented on x86 the way I did in patch #!, using
aesdeclast+aesenc


> > I suppose it really depends on whether there is a third host
> > architecture that could make use of this, and how its AES instructions
> > map onto the primitive AES ops above.
>
> There is Power6 (v{,n}cipher{,last}) and RISC-V Zkn (aes64{es,esm,ds,dsm,im})
>
> I got hung up yesterday was understanding the different endian requirements of x86 vs Power.
>
> ppc64:
>
>      asm("lxvd2x 32,0,%1;"
>          "lxvd2x 33,0,%2;"
>          "vcipher 0,0,1;"
>          "stxvd2x 32,0,%0"
>          : : "r"(o), "r"(i), "r"(k), : "memory", "v0", "v1", "v2");
>
> ppc64le:
>
>      unsigned char le[16] = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
>      asm("lxvd2x 32,0,%1;"
>          "lxvd2x 33,0,%2;"
>          "lxvd2x 34,0,%3;"
>          "vperm 0,0,0,2;"
>          "vperm 1,1,1,2;"
>          "vcipher 0,0,1;"
>          "vperm 0,0,0,2;"
>          "stxvd2x 32,0,%0"
>          : : "r"(o), "r"(i), "r"(k), "r"(le) : "memory", "v0", "v1", "v2");
>
> There are also differences in their AES_Te* based C routines as well, which made me wonder
> if we are handling host endianness differences correctly in emulation right now.  I think
> I should most definitely add some generic-ish tests for this...
>

The above kind of sums it up, no? Or isn't this working code?
