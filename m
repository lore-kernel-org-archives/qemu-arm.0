Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1429543ejq;
        Sun, 7 May 2023 03:09:21 -0700 (PDT)
X-Received: by 2002:a17:907:3fa6:b0:966:6035:c81e with SMTP id hr38-20020a1709073fa600b009666035c81emr141177ejc.52.1683454161381;
        Sun, 07 May 2023 03:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683454161; cv=none;
        d=google.com; s=arc-20160816;
        b=Px2wv6e8/ofeD+wSa+NCU6xilIobuWa6ZvX5gBjBYLZ++LfhNekyJ/iGkjX8A0vtaH
         ZfJ6tm2PmdG0jVcWNPm5SKp5fSnba+hl8uRu1JZg28U7p+KSVjeE3dt0O5qO9ENElN4D
         Coj+OgzXtnTQalVyfeQ//fL/DhOaJ2NTAYTR/ZPkxNu38ugKDOo/nouinpuCByKFu7Ov
         tlUkBcXxwAOQeE6Y9l+ozJsC6tAZwZFNN/FdTwN57DOzRSmvpxXGeuVnOjLaKf0tRQup
         zLLe72303nO5C0J+jJCEnPBfghKeyH9o5/HCBj7LQd2Ok4L8pFR1iEE+TuHc+TRbTYz3
         It3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAvj99Lt1tAUVXyAbC39vjmWvRvxICJPbNVP+s00+bM=;
        b=Vx6jN4Wb32C7DGM30i/afMEYNEH+taJijNcSfCMvo8ZygTI/+507quJS544ktBLb0m
         wukwJHpDM2CDLTKOZcjcHWlMx51HpfUP/7QMhlWud5/Egrh9Fo9hO11inUFsaj68sFlL
         rSOJzctPxT+LDFRCMjo779QRAsN+aqYAl3OEeKT5qjgEVg38l/DYbYymvrxrRBRTkT1/
         Z2PnCxL4MNZtPbKcPMuxZVWD55CAk0cqKX4xwlg3tRYeonOvVW0Qalhate30LyF4c6C1
         OUIwS30x6bO0hao1IdTSmj9woiYhENYXAOZLpmwnLUFsukNkgK6PZfOL4/fe8fbL0r1u
         DytQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mU06WDhb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a19-20020a509b53000000b0050bc4071582sor5365926edj.0.2023.05.07.03.09.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 May 2023 03:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mU06WDhb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683454161; x=1686046161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAvj99Lt1tAUVXyAbC39vjmWvRvxICJPbNVP+s00+bM=;
        b=mU06WDhbhGcSqyEzzxdhuXNdPi2j3ln6w0ji7pEZPnfx0pc0bHCwCqHEyICGGqvbcM
         HmY7hYR0X7jMtYM3OyR/2aAQfrRTl81MeOU+djoOuXI9C7o6WmBQ7z15hcg7MaYCwkfs
         VO54N0oOzQyVMsOlhn497FMTIooIio5EMd7UlW9cRH3nIdxZ38hZ5ttlerhKn82ZE4Fl
         fkBTYePzZ2Fl4pCdLybtShe5AO7Stpklw2QnxuKiC9upa1ncolCrn+NM8HS/T6NrEGrN
         +N6ORqDqgxQnXU31pOlQwWlPPWhlJT9gw2TKxPxlGoLw4QoIVZdSxEwePTumZRZh7dS1
         CBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683454161; x=1686046161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAvj99Lt1tAUVXyAbC39vjmWvRvxICJPbNVP+s00+bM=;
        b=BBg3uPOxMkb4fkXYzP8NR+AkFF3LXqsdiyKExj9WPPOh5Hmh8/GWOpKNQ0yxDeNBDy
         wX3suCH5MNFQUaXQlint6TLo8l8mj6Geqwu6yNbnp+j/4ltGi7tjY3aV5saQp631SfsT
         aDo+v3m5Mj4b0ItuyXFFE2AzTIMIMehvpf0JMGiGM6HMxNdBY77wJMZ4UqWYFTsZeZcx
         8ndDU5WVRlP1Fy6j7xV41j1EJp3f+0o9IomXDoUe4NmFRilu+MD/dxNT6Jy3iDe0N58t
         qRNNK/It62xZ9P7++d9kqqlJMeJWw4yAbUqMT7hxAk2OJpiuAUFkk8np3eTkhs5MlOdm
         Zpzw==
X-Gm-Message-State: AC+VfDwSKSytyBVgFw/nyTdBVTaQukCsVDWrf1LAkQqrlUP3O/SC5r6G
	p1wATOpxbP/P+yj9b6CsJhefsXKRmU1j1GdJrC0eLR4Q
X-Google-Smtp-Source: ACHHUZ4nHMDR4fDnDvudMyLLIsINhZrWnO4DTiE/k8PzNeIliAwEgt8O3VWc81UrXvwKPBNbeOR5HgqCVAgWao/1BQ8=
X-Received: by 2002:a05:6402:788:b0:50b:c665:55ea with SMTP id
 d8-20020a056402078800b0050bc66555eamr4753422edy.3.1683454161045; Sun, 07 May
 2023 03:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org> <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
 <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
In-Reply-To: <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 May 2023 11:09:03 +0100
Message-ID: <CAFEAcA9h6myNpkgmamxLHp_8We97eyGQpDb4PKPnwqL8rRzSTQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: EFKcRQrLCNwy

On Fri, 5 May 2023 at 19:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/4/23 16:02, Peter Maydell wrote:
> > On Wed, 3 May 2023 at 08:15, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Instead of playing with offsetof in various places, use
> >> MMUAccessType to index an array.  This is easily defined
> >> instead of the previous dummy padding array in the union.
> >>
> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >
> >> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env=
, target_ulong addr,
> >>       if (prot & PAGE_WRITE) {
> >>           tlb_addr =3D tlb_addr_write(tlbe);
> >>           if (!tlb_hit(tlb_addr, addr)) {
> >> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> >> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
> >> +                                addr & TARGET_PAGE_MASK)) {
> >>                   tlb_fill(env_cpu(env), addr, size,
> >>                            MMU_DATA_STORE, mmu_idx, retaddr);
> >>                   index =3D tlb_index(env, mmu_idx, addr);
> >> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env=
, target_ulong addr,
> >>       } else /* if (prot & PAGE_READ) */ {
> >>           tlb_addr =3D tlbe->addr_read;
>
> read
>
> >>           if (!tlb_hit(tlb_addr, addr)) {
> >> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>
> write
>
> >> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
> >> +                                addr & TARGET_PAGE_MASK)) {
> >
> > This was previously looking at addr_write, but now we pass
> > MMU_DATA_LOAD ?
>
> This is the read portion of the read+write check.  The write portion is a=
bove in the
> previous hunk.  So this is an existing error, fixed here, and I hadn't no=
ticed.

Yeah, I wondered if it was a pre-existing bug. We should split out
the bug fix.

-- PMM
