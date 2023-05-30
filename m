Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2314104ejb;
        Tue, 30 May 2023 09:59:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63WYrh6lbOO07AS3KqaMdVdk4G9ZvzuEODcJKVo02JpY8MF2+W4bN42YWCvTg9Buadk/fm
X-Received: by 2002:a05:6870:5b01:b0:19f:9340:fef9 with SMTP id ds1-20020a0568705b0100b0019f9340fef9mr1555846oab.16.1685465947334;
        Tue, 30 May 2023 09:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685465947; cv=none;
        d=google.com; s=arc-20160816;
        b=OUJ8QBhj4kIhoQumMmuwKnngwS5VPGGp1IYkSnv3MvQqbzdK7vR0E7GPv5XMsGQ8/D
         q/uNCWU1ZrUTl+jbl/0KAVN7VG9qjBpm21YZMbUbYgXl0x8JIwg6HUwmzYFfAq/Zj2At
         2Yko/xxfaBvYJSL6+KSYwpa3qgelxMoBTBSzHxoKsTJOArUBOkOIEX2OlMZuTtTAeYFF
         itzLqtnsbv4U2o0rLt5ueyk9S4b2czfPH/zS+eiUqY4hrWpL3AUEt3wrQHimUTUn/pXS
         UO7r+LePRTpo2rWlNVBAL+ISFE4kx/0WtMkyaSoDE7+8Z17zh+jhtjR6kSj5jhejfACu
         kWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vir0NkpE56zJbbYe3SO72UiuZQhKRI4m/x7d8at/neE=;
        b=KyDe/vj5/TooN7vtlngvClvdnAHSkczG8057Cm7RGzitrxFFSwL9rERxaNSKMUSG6w
         cg1oAi0sl2cpAzCHb4H1Z6OX308dAR1nt0ruWWCxMioqeXu/4FjmP1QzGWaeSRACMplM
         bYewJfjjF9YOEbDix3rCMiKP602GKw5vChOr6GCoAb5knw/8JTrv2VKbc2u1m6lgbGEi
         YbczCzqSvjjT0J8OvZgpc/blblmsIbQEA0Dj8o9kJ1354y3ItHcPWh5/NZ+p+0gOEw5k
         vVIypvmieR33GTAHDPYi1bN/dCYcqYVfKs/q5cfI+mvXuybgy1ghAieHl5Kk0NRcCKaj
         WQ9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="DCJqYTW/";
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id p2-20020a05687052c200b0018452951892si5668212oak.58.2023.05.30.09.59.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2023 09:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="DCJqYTW/";
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0271160DBA;
	Tue, 30 May 2023 16:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69F4C433EF;
	Tue, 30 May 2023 16:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685465946;
	bh=aiREaNoBxTIFPyj1qWO754P/cI+EmEr89qizdPzLSEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DCJqYTW/3TAxLjhsqgXAZ1GBAsWlDDKKfPX279o/zE2oe55OXudZTXOCPhZ/aUmzW
	 F/mldylfTK3cZqxgEQZeFwHEdEVDqe9xApiVW/nJIRKYmbJdwc+KykVnvHgjOAXjox
	 XPwsZqyhXwQA0kw5yDOFQVSb29MHsWQjiUWglDAmnO8HQ/+np0JIptfDDioj/wViZA
	 d+ASNiGerjjlgMa/MlxJibn16fX8odHvQqONw5KaBDWOQLp1ib+yBZWR82RF9rM80K
	 3TZgUOaNYSprbPmhVIrPELoXVXhtFdIA2LoxSOXxrfH2LCCi+A+UG+0g0HIz4Sdfwb
	 bBFytMaXc9AGw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so5527608e87.1;
        Tue, 30 May 2023 09:59:06 -0700 (PDT)
X-Gm-Message-State: AC+VfDxr2QqllUUC2IG/YCLmNR8SEFsOPepSepXqPwlewsH/1CoAg7W4
	7D4/nCuLvSGb8wZuo6wVxAMWciX8hYW3pXZbMyg=
X-Received: by 2002:a2e:98c7:0:b0:2af:23fe:98ef with SMTP id
 s7-20020a2e98c7000000b002af23fe98efmr1130462ljj.50.1685465944845; Tue, 30 May
 2023 09:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230530135204.2903761-1-ardb@kernel.org> <666b4b6c-380e-142e-9348-823006b35312@linaro.org>
In-Reply-To: <666b4b6c-380e-142e-9348-823006b35312@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 30 May 2023 18:58:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEE3X=m9X9DkMu885w=Vperp100NWcJ33XOTDm0O+1sWQ@mail.gmail.com>
Message-ID: <CAMj1kXEE3X=m9X9DkMu885w=Vperp100NWcJ33XOTDm0O+1sWQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZJYeRQjPKOHt

On Tue, 30 May 2023 at 18:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/30/23 06:52, Ard Biesheuvel wrote:
> > +#ifdef __x86_64__
> > +    if (have_aes()) {
> > +        __m128i *d = (__m128i *)rd;
> > +
> > +        *d = decrypt ? _mm_aesdeclast_si128(rk.vec ^ st.vec, (__m128i){})
> > +                     : _mm_aesenclast_si128(rk.vec ^ st.vec, (__m128i){});
>
> Do I correctly understand that the ARM xor is pre-shift
>
> > +        return;
> > +    }
> > +#endif
> > +
> >       /* xor state vector with round key */
> >       rk.l[0] ^= st.l[0];
> >       rk.l[1] ^= st.l[1];
>
> (like so)
>
> whereas the x86 xor is post-shift
>
> > void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
> > {
> >     int i;
> >     Reg st = *v;
> >     Reg rk = *s;
> >
> >     for (i = 0; i < 8 << SHIFT; i++) {
> >         d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
> >     }
>
> (like so, from target/i386/ops_sse.h)?
>

Indeed. Using the primitive operations defined in the AES paper, we
basically have the following for n rounds of AES (for n in {10, 12,
14})

for (n-1 rounds) {
  AddRoundKey
  ShiftRows
  SubBytes
  MixColumns
}
AddRoundKey
ShiftRows
SubBytes
AddRoundKey

AddRoundKey is just XOR, but it is incorporated into the instructions
that combine a couple of these steps.

So on x86, we have

aesenc:
  ShiftRows
  SubBytes
  MixColumns
  AddRoundKey

aesenclast:
  ShiftRows
  SubBytes
  AddRoundKey

and on ARM we have

aese:
  AddRoundKey
  ShiftRows
  SubBytes

aesmc:
  MixColumns


> What might help: could we do the reverse -- emulate the x86 aesdeclast instruction with
> the aarch64 aesd instruction?
>

Help in what sense? To emulate the x86 instructions on a ARM host?

But yes, aesenclast can be implement using aese in a similar way,
i.e., by passing a {0} vector as the round key into the instruction,
and performing the XOR explicitly using the real round key afterwards.
