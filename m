Received: by 10.25.77.65 with SMTP id a62csp235118lfb;
        Fri, 27 Jan 2017 05:28:17 -0800 (PST)
X-Received: by 10.159.35.137 with SMTP id 9mr4514248uao.110.1485523697601;
        Fri, 27 Jan 2017 05:28:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id t17si1423010uab.174.2017.01.27.05.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x229.google.com with SMTP id r136so175258086vke.1
        for <alex.bennee@linaro.org>; Fri, 27 Jan 2017 05:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hvJG/VQ+EYuy3vM6zulTRWm0XziEPum8RZ1U8Ch6iDw=;
        b=BfH0tBdnxPkZwvob31oVD24URTHj0RHt5//BF/Hls6IJuFm6T386qLZLW395Ba/jIX
         5VBvdtcjisg29iGVzeN72vnKBCQjxOPw7DAw+C0uQ7uJLysLEUY7lvXHFOWAKaTy7/Yv
         KnE/B0WTSmbGNMVpAuvqbJlSBCLcYsxXrTCwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hvJG/VQ+EYuy3vM6zulTRWm0XziEPum8RZ1U8Ch6iDw=;
        b=DVMAGdeO9MHnS5MWDxMSCR+Ugz0Xfh+vIl073Nbc2S+tRkSRTwpqG+bntOI0VohpYp
         G6q+5W57nI3THvUPPKmlkttuNdAoIW/JVSMvL09AkzfGifhxPrI5LtZpjRwulia5xDyI
         gmmv700xwBjn80GjeRHMKE+n6Hz6dK0My0xyN/8cN7VTmvMQM2xe/h0DSFXFScQSQ+O2
         XS+eUVe4htEtheIEGKrpEulod3V4JpBwuF96Wcnvg1oqDtfuOurx7RsxKk+yrrwVas5A
         MFm2LCXi4se87/m0Z5UBzAK07H+y3+7RICE7WNm3UhCb9FOnKXuADHVh5skzZm0gWIUk
         abxQ==
X-Gm-Message-State: AIkVDXKhGWMlLhdIKtisMeHhUtam3hGZEjyN1kmkT8OX6byutijqvpyh3YJa/ZnrKcHtSoMrN2WeNk6EGZwlek6L0mY=
X-Received: by 10.31.165.82 with SMTP id o79mr4069800vke.95.1485523697212;
 Fri, 27 Jan 2017 05:28:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Fri, 27 Jan 2017 05:27:56 -0800 (PST)
In-Reply-To: <20170127103505.18606-17-alex.bennee@linaro.org>
References: <20170127103505.18606-1-alex.bennee@linaro.org> <20170127103505.18606-17-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:27:56 +0000
Message-ID: <CAFEAcA82McdB15znd7LK-OGkioHreht2Nk6h5t-As0JiYXHoRg@mail.gmail.com>
Subject: Re: [PATCH v8 16/25] cputlb and arm/sparc targets: convert mmuidx
 flushes from varg to bitmap
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, "open list:Overall" <qemu-devel@nongnu.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /hMAJU04Vfsr

On 27 January 2017 at 10:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> While the vargs approach was flexible the original MTTCG ended up
> having munge the bits to a bitmap so the data could be used in
> deferred work helpers. Instead of hiding that in cputlb we push the
> change to the API to make it take a bitmap of MMU indexes instead.
>
> This change is fairly mechanical but as storing the actual index is
> useful for cases like the current running context. As a result the
> constants are renamed to ARMMMUBit_foo and a couple of helper
> functions added to convert between a single bit and a scalar index.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

So, as discussed on IRC, I don't think this is really the right
way to go. An MMU index is an index, ie it refers to a particular
TLB. Almost all the time you don't want to think of it as a bit
value. The only place that does care about that is places in
the TLB code which want to say "do some operation on multiple
TLBs at once", which is basically just the tlb_flush_by_mmuidx()
function. So that function should have an API that lets you
specify multiple TLBs (either the one it has now, or maybe one
where you pass it in a uint32_t with bits set).

That avoids either all or almost all of this churn.

> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1954,27 +1954,40 @@ static inline bool arm_excp_unmasked(CPUState *cs=
, unsigned int excp_idx,
>   * of the AT/ATS operations.
>   * The values used are carefully arranged to make mmu_idx =3D> EL lookup=
 easy.
>   */
> -typedef enum ARMMMUIdx {
> -    ARMMMUIdx_S12NSE0 =3D 0,
> -    ARMMMUIdx_S12NSE1 =3D 1,
> -    ARMMMUIdx_S1E2 =3D 2,
> -    ARMMMUIdx_S1E3 =3D 3,
> -    ARMMMUIdx_S1SE0 =3D 4,
> -    ARMMMUIdx_S1SE1 =3D 5,
> -    ARMMMUIdx_S2NS =3D 6,
> +typedef enum ARMMMUBitMap {
> +    ARMMMUBit_S12NSE0 =3D 1 << 0,
> +    ARMMMUBit_S12NSE1 =3D 1 << 1,
> +    ARMMMUBit_S1E2 =3D 1 << 2,
> +    ARMMMUBit_S1E3 =3D 1 << 3,
> +    ARMMMUBit_S1SE0 =3D 1 << 4,
> +    ARMMMUBit_S1SE1 =3D 1 << 5,
> +    ARMMMUBit_S2NS =3D 1 << 6,
>      /* Indexes below here don't have TLBs and are used only for AT syste=
m
>       * instructions or for the first stage of an S12 page table walk.
>       */
> -    ARMMMUIdx_S1NSE0 =3D 7,
> -    ARMMMUIdx_S1NSE1 =3D 8,
> -} ARMMMUIdx;
> +    ARMMMUBit_S1NSE0 =3D 1 << 7,
> +    ARMMMUBit_S1NSE1 =3D 1 << 8,
> +} ARMMMUBitMap;

In particular I'd be very wary of changing these values, because
as the comment says things are arranged carefully to make some
operations easy.

thanks
-- PMM
