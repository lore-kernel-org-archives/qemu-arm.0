Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp676420eji;
        Mon, 18 Dec 2023 01:54:18 -0800 (PST)
X-Received: by 2002:a19:7910:0:b0:50e:3df2:c7bc with SMTP id u16-20020a197910000000b0050e3df2c7bcmr96913lfc.139.1702893258761;
        Mon, 18 Dec 2023 01:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702893258; cv=none;
        d=google.com; s=arc-20160816;
        b=onnwD5SETYZH4SliQvLtdWpegCfUUFbIUQZ3fNbpou9eVJwvr/aOc3OVODRz8nUoe1
         0dUYCuDeelKVBrJ17g8MwDddNQh+bmocOfG+KnbbRlCmE1yWxDdAm46nLQEYtvGN4qXp
         mcuRMOuTMsAk36xHwvFVzsXB5+04/98LjIIM6Qq/sw44Y22wwqPYJe4lGGu+jN0xi8gV
         dKEWcD3RvC7E+3cy2yVfNj5/SFH4VU997zT+DzySXGcXJ77lt/9Yx6ww1ybt5nDLDKYP
         cx+jLHvdONuG16hC5NXWqiMTjsLu3M6auXISe8f563PR5r1jafDrZhADrCXu7813pKwh
         0seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=22XHa7TU2HAZhqIoLxu+1GCExXKqhDp67R/omYu6sKM=;
        fh=ULK/RLscXAijf4JMmJbcS0BGxDjKNuZXoRrjrLfjySo=;
        b=gwN7UY+Wpm+n9KTU6JN8uRrf5xkMpnQDbUSf9Tx+0cZxhOHmc5LgbeZ1ghTs6lcuSA
         5qEcgp0thFx9xV9GUsTQvx2pWaFlOPIBI1Lr2a0C8numxNsA1/IvUbTTKNj1/VOHiGyX
         hIyJiSgD6WNaj8JGFjiKvPxiPlHlVgbNcI8cNgfG0mfQXz7qHp49VW2bQL6VyUxo7+LG
         BR1HQGGjmfNsYHHPxTkrknb9ZV4IGQNLXvZLfHxr5y8R0c1aovCBqgz6wbHSu8CWDTYR
         oLD/feANb0UvlS44dx0ZfbeFho9Uf8RZDwzwH5VjWzIIBe74qMqUIexqzZDMr9pq4nOJ
         3DqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LO6Zo6UL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z1-20020a195e41000000b0050e20c72504sor1034820lfi.24.2023.12.18.01.54.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Dec 2023 01:54:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LO6Zo6UL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702893258; x=1703498058; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22XHa7TU2HAZhqIoLxu+1GCExXKqhDp67R/omYu6sKM=;
        b=LO6Zo6UL5qgDfNVPSXBfPmfpw3E1YUUHW54p/t30kzQqok9fDMhC7ydZAQMUDUrA2E
         J9m+sjU7D3SkTFQ6uy3qYZ6phN4strrKK6+XbtCCUf/ZL8cCJF1Rq5VrvrVcQukyHw1p
         ZzmuQ9uTemaD22L5RCUTjPiTVfKC2Km1+IwkjczcG+AO7hw58hrUXOOw7H3WTXZ9Kcz9
         4cUkuGTyqckfKpafr/GSfP9gWJ4mJrzqy78d+4/4+V2TYg0CvTngTogl+qcyT9ZKBfPf
         E2+xLeunrcSjVmkaXhqx6Dv42Fx75DG+tUX8YAapOLEvm7Zvca8bwo3rFb8VkA961JMi
         uxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893258; x=1703498058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22XHa7TU2HAZhqIoLxu+1GCExXKqhDp67R/omYu6sKM=;
        b=PfwW9oKwFIYTu3N9zSWKY7lj7yjnHfd6MWw90tO7oHLy4Va9lGchtPevqjLZl/ORR/
         aZGkaE3r6qlJOJdMlJsReZL4u42GsFhPwRu2W3Fq1mwrXFu6jwlXJRnn+I9xR3HS4gtv
         KDfQWNAXhm3REH913Zq4MA6nKix3vr8j/fe9sFQrtK7pLEXg1VusvYRjdYvNuuVNqFR2
         SE7pjJSRMnSNhYwyRv+pqG3v2TswSaDxkymr4TIp1T7e4oaw0vC+1NcBKuVIVzklEeZB
         KYrpVyljtsEvjytSId7K0tpqrEsAlVKqOziGGIAx51CESqpwG7uZIFaKtgLqeoTj1kY1
         G9ZQ==
X-Gm-Message-State: AOJu0YzFFTkojyHIgaAhUL9CtRp6gvHWN12o0W1HnAyKJaUd9ozOUPH1
	ilpKi4LZndTBuxxZU8808tilObykSXtYRPN0IuHGCSW3
X-Google-Smtp-Source: AGHT+IG8OYz2pq+QHf1MF7BM0rOkxLAelM2wX2KQDjadCOgPquG+JTMBma3kcPkXa0doXhtS2mks+vCRtXDZtTwFiE0=
X-Received: by 2002:a2e:8608:0:b0:2cc:652b:9fd4 with SMTP id
 a8-20020a2e8608000000b002cc652b9fd4mr450177lji.79.1702893258257; Mon, 18 Dec
 2023 01:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20231214171447.44025-1-philmd@linaro.org>
In-Reply-To: <20231214171447.44025-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 09:54:07 +0000
Message-ID: <CAFEAcA8fmzv6qkN=N9TZoYVox+uQ0m5iLkGPQpcRDVA8eDEujg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm: Prefer arm_feature() over object_property_find()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PwiFR/z420dR

On Thu, 14 Dec 2023 at 17:14, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> QOM properties are added on the ARM vCPU object when a
> feature is present. Rather than checking the property
> is present, check the feature.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC: If there is no objection on this patch, I can split
>      as a per-feature series if necessary.
>
> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>   "hw: Simplify accesses to CPUState::'start-powered-off' property"
> ---
>  hw/arm/armv7m.c       | 21 ++++++++++++---------
>  hw/arm/exynos4210.c   |  4 ++--
>  hw/arm/highbank.c     |  3 ++-
>  hw/arm/integratorcp.c |  5 ++---
>  hw/arm/realview.c     |  2 +-
>  hw/arm/sbsa-ref.c     |  3 ++-
>  hw/arm/versatilepb.c  |  5 ++---
>  hw/arm/vexpress.c     |  6 ++++--
>  hw/arm/virt.c         | 27 +++++++++++++++------------
>  hw/arm/xilinx_zynq.c  |  2 +-
>  hw/cpu/a15mpcore.c    | 17 +++++++++++------
>  hw/cpu/a9mpcore.c     |  6 +++---
>  12 files changed, 57 insertions(+), 44 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 3a6d72b0f3..932061c11a 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -302,28 +302,29 @@ static void armv7m_realize(DeviceState *dev, Error =
**errp)
>
>      object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->contai=
ner),
>                               &error_abort);
> -    if (object_property_find(OBJECT(s->cpu), "idau")) {
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
>          object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
>                                   &error_abort);
> -    }
> -    if (object_property_find(OBJECT(s->cpu), "init-svtor")) {
>          if (!object_property_set_uint(OBJECT(s->cpu), "init-svtor",
>                                        s->init_svtor, errp)) {
>              return;
>          }
>      }
> -    if (object_property_find(OBJECT(s->cpu), "init-nsvtor")) {
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_M)) {

This doesn't make sense as a check -- we shouldn't be able to get
here if the CPU isn't M-profile.

>          if (!object_property_set_uint(OBJECT(s->cpu), "init-nsvtor",
>                                        s->init_nsvtor, errp)) {
>              return;
>          }
>      }
> -    if (object_property_find(OBJECT(s->cpu), "vfp")) {
> -        if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, err=
p)) {
> -            return;
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_AARCH64)) {

Similarly this can't possibly be an AArch64 CPU, so this is
not the correct condition to check.

> +        if (cpu_isar_feature(aa64_fp_simd, s->cpu)) {
> +            if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp,=
 errp)) {
> +                return;
> +            }
>          }
>      }
> -    if (object_property_find(OBJECT(s->cpu), "dsp")) {
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_M) &&
> +        arm_feature(&s->cpu->env, ARM_FEATURE_THUMB_DSP)) {
>          if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, err=
p)) {

Another unnecessary "is this M-profile?" check. This also is
introducing a point of potential future failure because now
we have the condition for "do we have a dsp property" in two
places: in the CPU object where we add it, and then again here
when we set it. Now they can get out of sync.

Most of the others are similar. There might be places where we're
using the "does property X check" to do something more than just
guard "now set property X"; those are probably worth looking at
to see if they should be checking something else.

thanks
-- PMM
